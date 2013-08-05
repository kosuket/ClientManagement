unit MySQLAccessor;

interface
uses
  Data.SqlExpr, Data.DB, Data.DBXCommon, Data.DBXMySQL;

type TMySQLAccessor = class
  private
    FHostName: String;
    FUserName: String;
    FPassword: String;
    FDatabase: String;
    Conn: TSQLConnection;
  public
    property HostName: String read FHostName;
    property UserName: String read FUserName;
    property Password: String read FPassword;
    property Database: String read FDatabase;
    constructor Create(HostName, UserName, Password, Database: String);
    destructor Destroy; override;
    function ExecuteUpdate(Sql: String): Integer;
    function ExecuteQuery(Sql: String): TDataSet;
    function BeginTransaction: TDBXTransaction;
    procedure CommitFreeAndNil(tran:TDBXTransaction);
    procedure RollBackFreeAndNil(tran:TDBXTransaction);
  end;

implementation

{ TMySQLAccessor }

constructor TMySQLAccessor.Create(HostName, UserName, Password, Database: String);
var
  Query: TSQLQuery;
begin
  FHostName := HostName;
  FUserName := UserName;
  FPassword := Password;
  FDatabase := Database;

  Conn := TSQLConnection.Create(nil);
  // Setting DriverName property sets the default properties.
  // See dbxdrivers.ini for available drivers and the default properties.
  Conn.DriverName := 'MySQL';
  Conn.ConnectionName := '';
  Conn.LoginPrompt := False;
  Conn.Params.Values['HostName'] := HostName;
  Conn.Params.Values['User_Name'] := UserName;
  Conn.Params.Values['Password'] := Password;
  Conn.Params.Values['Database'] := Database;
  Conn.Open;

  Query := TSQLQuery.Create(nil);
  Query.SQLConnection := Conn;
    { TODO : why not working? }
  Query.SQL.Add('set autocommit = 0;');
  Query.ExecSQL();
end;

destructor TMySQLAccessor.Destroy;
begin
  if Assigned(Conn) then Conn.Free;
  inherited;
end;

function TMySQLAccessor.ExecuteQuery(Sql: String): TDataSet;
var
  Query: TSQLQuery;
begin
  Query := TSQLQuery.Create(nil);
  Query.SQLConnection := Conn;
  Query.SQL.Add(Sql);
  Query.Open;
  Result := Query;
end;

function TMySQLAccessor.ExecuteUpdate(Sql: String): Integer;
var
  Query: TSQLQuery;
begin
  Query := TSQLQuery.Create(nil);
  try
    Query.SQLConnection := Conn;
    Query.SQL.Add(sql);
    Result := Query.ExecSQL();
  finally
    if Assigned(Query) then Query.Free;
  end;
end;

function TMySQLAccessor.BeginTransaction: TDBXTransaction;
begin
  result := Conn.BeginTransaction;
end;

procedure TMySQLAccessor.CommitFreeAndNil(tran: TDBXTransaction);
begin
  Conn.CommitFreeAndNil(tran);
end;

procedure TMySQLAccessor.RollBackFreeAndNil(tran: TDBXTransaction);
begin
  Conn.RollbackFreeAndNil(tran);
end;

end.
