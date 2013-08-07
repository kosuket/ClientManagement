unit ClientInserter;

interface
uses
  MySQLAccessor, Client, ClientGmat, ClientToefl;
type TClientInserter = class
  private
    Accessor: TMySQLAccessor;
    function GetNewClientId: Int64;
    procedure InsertClientGmat(CGmat: TClientGmat);
    procedure InsertClientToefl(CToefl: TClientToefl);
  public
    constructor Create(Accessor: TMySQLAccessor);
    procedure InsertClient(Client: TClient);
    procedure Insert(Client: TClient; CGmat: TClientGmat; CToefl: TClientToefl);
end;

implementation
uses
  Data.DB;

{ TClientInserter }

constructor TClientInserter.Create(Accessor: TMySQLAccessor);
begin
  Self.Accessor := Accessor;
end;

function TClientInserter.GetNewClientId: Int64;
var
  Sql: string;
  Rs: TDataSet;
begin
  Sql := 'SELECT IFNULL(MAX(CLIENT_ID),0) AS MAXID FROM CLIENT';
  Rs := Accessor.ExecuteQuery(Sql);
  Result := Rs.Fields[0].AsInteger + 1;
end;

procedure TClientInserter.Insert(Client: TClient; CGmat: TClientGmat;
  CToefl: TClientToefl);
begin
  // CLIENT
  Client.Client_id := GetNewClientId;
  InsertClient(Client);
  // CLIENT_GMAT
  if Assigned(CGmat) then begin
    CGmat.Client_id := Client.Client_id;
    CGmat.Score_no := 1;
    InsertClientGmat(CGmat);
  end;
  // CLIENT_TOEFL
  if Assigned(CToefl) then begin
    CToefl.Client_id := Client.Client_id;
    CToefl.Score_no := 1;
    InsertClientToefl(CToefl);
  end;
end;

procedure TClientInserter.InsertClient(Client: TClient);
begin
  Accessor.ExecuteUpdate(Client.GetInsertSql);
end;

procedure TClientInserter.InsertClientGmat(CGmat: TClientGmat);
begin
  Accessor.ExecuteUpdate(CGmat.GetInsertSql);
end;

procedure TClientInserter.InsertClientToefl(CToefl: TClientToefl);
begin
  Accessor.ExecuteUpdate(CToefl.GetInsertSql);
end;

end.
