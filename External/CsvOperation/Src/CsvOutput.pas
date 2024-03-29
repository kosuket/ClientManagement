unit CsvOutput;

interface
uses
  MySQLAccessor, CsvOpUtils;
type TCsvOutput = class
  private
    Accessor: TMySQLAccessor;
    Utils: TCsvOpUtils;
    procedure MakeOutfile(DestFile, TableName: string);
    procedure InsertHeader(DestFile, Header: string);
    function GetHeader(TableName: string): string;
    function MakeSqlString(DestFile, TableName: string): string;
  public
    constructor Create(Host, User, Pass, DBName: string); overload;
    constructor Create(Accessor: TMySQLAccessor); overload;
    destructor Destroy; override;
    procedure Execute(DestFile, TableName: string);
    procedure ExecuteOverWrite(DestFile, TableName: string);
end;
implementation
uses
  Classes,
  SysUtils,
  Data.DB;

{ TCsvOutput }

constructor TCsvOutput.Create(Host, User, Pass, DBName: string);
begin
  Create(TMySQLAccessor.Create(Host, User, Pass, DBName));
end;

constructor TCsvOutput.Create(Accessor: TMySQLAccessor);
begin
  inherited Create;
  Self.Accessor := Accessor;
  Utils := TCsvOpUtils.Create;
end;

destructor TCsvOutput.Destroy;
begin
  Utils.Free;
  inherited;
end;

procedure TCsvOutput.Execute(DestFile, TableName: string);
begin
  // OUTFILE(using MySQL command)
  MakeOutfile(DestFile, TableName);
  // insert a header
  InsertHeader(DestFile, GetHeader(TableName));
end;

procedure TCsvOutput.ExecuteOverWrite(DestFile, TableName: string);
begin
  if FileExists(DestFile) then begin
    DeleteFile(DestFile);
  end;
  Execute(DestFile, TableName);
end;

function TCsvOutput.GetHeader(TableName: string): string;
var
  Header: TStringList;
begin
  Header := TStringList.Create;
  Utils.SetColumns(Accessor, TableName, Header);
  Header.Delimiter := ',';
  Result := Header.DelimitedText;
end;

procedure TCsvOutput.InsertHeader(DestFile, Header: string);
var
  FileText: TStringList;
begin
  // Insert
  FileText := TStringList.Create;
  try
    FileText.LoadFromFile(DestFile);
    FileText.Insert(0, Header);
    FIleText.SaveToFile(DestFile);
  finally
    if Assigned(FileText) then FileText.Free;
  end;
end;

procedure TCsvOutput.MakeOutfile(DestFile, TableName: string);
var
  Sql: string;
begin
  // prepare sql string
  Sql := MakeSqlString(DestFile, TableName);
  // execute
  Accessor.ExecuteUpdate(Sql);
end;

function TCsvOutput.MakeSqlString(DestFile, TableName: string): string;
var
  Sql: string;
begin
  Sql := Concat('SELECT * FROM ', TableName, ' INTO OUTFILE ');
  Sql := Concat(Sql, '''', Utils.EscapeFilePath(DestFile), '''');
  Sql := Concat(Sql, ' FIELDS TERMINATED BY '',''');
  Result := Sql;
end;

end.
