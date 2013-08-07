unit LoadColumns;

interface
uses
  LoadColumn, System.Classes;
type TLoadColumns = class
  protected
    procedure SetUpLoadColumns; virtual; abstract;
  public
    constructor Create;
    procedure GetHeader(var Header: TStrings);
    function GetLoadColumn(HeaderName: string): TLoadColumn;
end;

implementation
uses
  System.Rtti;

{ TLoadColumns }

constructor TLoadColumns.Create;
begin
  SetUpLoadColumns;
end;

procedure TLoadColumns.GetHeader(var Header: TStrings);
var
  Cxt: TRttiContext;
  Tp: TRttiType;
  Prp: TRttiProperty;
  LoadColumn: TLoadColumn;
begin
  Header.Clear;
  Cxt := TRttiContext.Create;
  try
    Tp := Cxt.GetType(Self.ClassType);
    for Prp in Tp.GetProperties do begin
      LoadColumn := Prp.GetValue(Self).AsType<TLoadColumn>;
      Header.Add(LoadColumn.HeaderName);
    end;
  finally
    Cxt.Free;
  end;
end;

function TLoadColumns.GetLoadColumn(HeaderName: string): TLoadColumn;
var
  Cxt: TRttiContext;
  Tp: TRttiType;
  Prp: TRttiProperty;
begin
  Cxt := TRttiContext.Create;
  try
    Tp := Cxt.GetType(Self.ClassType);
    Prp := Tp.GetProperty(HeaderName);
    if Assigned(Prp) then begin
      Result := Prp.GetValue(Self).AsType<TLoadColumn>;
    end else begin
      Result := nil;
    end;
  finally
    Cxt.Free;
  end;
end;

end.
