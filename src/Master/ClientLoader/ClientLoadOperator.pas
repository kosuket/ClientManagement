unit ClientLoadOperator;

interface
uses
  System.Classes, LoadOperator, ClientInserter, MySQLAccessor,
  Client, ClientGmat, ClientToefl, LoadColumn, ClientLoadColumns;
type TClientLoadOperator = class(TInterfacedObject, ILoadOperator)
  private
    ClientColumns: TClientLoadColumns;
    Headers: TStrings;
    Inserter: TClientInserter;
    procedure DistributeValues(var Client: TClient; var CGmat: TClientGmat;
          var CToefl: TClientToefl; Values: TStrings);
    procedure DistributeValue(var Client: TClient; var CGmat: TClientGmat;
          var CToefl: TClientToefl; TargetPrp: TTargetProperty; Value: string);
  public
    constructor Create(Accessor: TMySQLAccessor);
    destructor Destroy; override;
    procedure SetColumnHeader(Columns: TStrings);
    procedure AddValueRow(Values: TStrings);
end;

implementation
uses
  System.SysUtils, System.Rtti, DBImportableData;
{ TClientLoadOperator }

procedure TClientLoadOperator.AddValueRow(Values: TStrings);
var
  Cl: TClient;
  ClGmat: TClientGmat;
  ClToefl: TClientToefl;
begin
  // Irregular case
  if Values.Count <> Headers.Count then begin
    raise Exception.Create('Unexpected count of the values:'
     + IntToStr(Values.Count));
  end;
  // Normal case
  Cl := TClient.Create;
  ClGmat := TClientGmat.Create;
  ClToefl := TClientToefl.Create;
  try
    DistributeValues(Cl, ClGmat, ClToefl, Values);
    Inserter.Insert(Cl, ClGmat, ClToefl);
  finally
    ClToefl.Free;
    ClGmat.Free;
    Cl.Free;
  end;
end;

constructor TClientLoadOperator.Create(Accessor: TMySQLAccessor);
begin
  inherited Create;
  Inserter := TClientInserter.Create(Accessor);
  ClientColumns := TClientLoadColumns.Create();
end;

destructor TClientLoadOperator.Destroy;
begin
  ClientColumns.Free;
  Inserter.Free;
  inherited Destroy;
end;

procedure TClientLoadOperator.DistributeValue(var Client: TClient;
  var CGmat: TClientGmat; var CToefl: TClientToefl; TargetPrp: TTargetProperty;
  Value: string);
var
  Cxt: TRttiContext;
  Tp: TRttiType;
  Prp: TRttiProperty;
  Data: TDBImportableData;
begin
  Cxt := TRttiContext.Create;
  try
    if TargetPrp.DataClass = TClient then begin
      Data := Client;
    end else if TargetPrp.DataClass = TClientGmat then begin
      Data := CGmat;
    end else if TargetPrp.DataClass = TClientToefl then begin
      Data := CToefl;
    end else begin
      raise Exception.Create('unknown data class:' + TargetPrp.DataClass.ClassName);
    end;
    Tp := Cxt.GetType(Data.ClassType);
    Prp := Tp.GetProperty(TargetPrp.PropertyName);
    Data.SetPropertyValue(Prp, Value);
  finally
    Cxt.Free;
  end;
end;

procedure TClientLoadOperator.DistributeValues(var Client: TClient;
  var CGmat: TClientGmat; var CToefl: TClientToefl; Values: TStrings);
var
  TargetPrp: TTargetProperty;
  LoadColumn: TLoadColumn;
  Value, HeaderName: string;
  i: Integer;
begin
  for i := 0 to Headers.Count - 1 do begin
    HeaderName := Headers[i];
    Value := Values[i];
    LoadColumn := ClientColumns.GetLoadColumn(HeaderName);
    // skip if unknown
    if not Assigned(LoadColumn) then begin
      continue;
    end;
    // skip if not for master insertion
    if not LoadColumn.MstColFlg then begin
      continue;
    end;

    for TargetPrp in LoadColumn.TargetPropertyList do begin
      DistributeValue(Client, CGmat, CToefl, TargetPrp, Value);
    end;
  end;
end;

procedure TClientLoadOperator.SetColumnHeader(Columns: TStrings);
begin
  Headers := Columns;
end;
end.
