// Unit responsible for the whole process of
// loading csv into database.
unit CsvLoader;

interface
uses
  Classes, MySQLAccessor, CsvOpUtils;

type TCsvLoader = class
  private
    Accessor: TMySQLAccessor;
    Utils: TCsvOpUtils;
    procedure PutInputColumns(FilePath: string; Cols: TStringList);
    procedure PutExistingColumns(TableName: string; Cols: TStringList);
    function GetColumnString(TableName, FilePath: string): string;
    function GetTableName(FilePath: string): string;
    function GetSqlQuery(FilePath, TableName, Delim: string): string;
  public
    constructor Create(Host, User, Pass, DBName: string); overload;
    constructor Create(Accessor: TMySQLAccessor); overload;
    destructor Destroy; override;
    procedure Execute(FilePath: string); overload;
    procedure Execute(FilePath, Delim: string); overload;
    procedure Execute(FilePath, TableName, Delim: string); overload;
end;

implementation
uses
  SysUtils,
  Data.DB;

{ TCsvLoader }

constructor TCsvLoader.Create(Host, User, Pass, DBName: string);
begin
  Create(TMySQLAccessor.Create(Host, User, Pass, DBName));
end;

constructor TCsvLoader.Create(Accessor: TMySQLAccessor);
begin
  inherited Create;
  Self.Accessor := Accessor;
  Utils := TCsvOpUtils.Create;
end;

destructor TCsvLoader.Destroy;
begin
  Utils.Free;
  inherited;
end;

procedure TCsvLoader.Execute(FilePath: string);
begin
  Execute(FilePath, ',');
end;

procedure TCsvLoader.Execute(FilePath, TableName, Delim: string);
var
  Sql: string;
begin
  Sql := GetSqlQuery(Utils.EscapeFilePath(FilePath), TableName, Delim);
  Accessor.ExecuteUpdate(Sql);
end;

procedure TCsvLoader.Execute(FilePath, Delim: string);
begin
  Execute(FilePath, GetTableName(FilePath), Delim);
end;

// makes column part of the query.
// e.g., (columnA, columnB, @dummy,...)
function TCsvLoader.GetColumnString(TableName, FilePath: string): string;
var
  InputCols, ExistingCols, QueryCols: TStringList;
  Column: string;
  i: Integer;
begin
  InputCols := TStringList.Create;
  ExistingCols := TStringList.Create;
  QueryCols := TStringList.Create;
  try
    PutInputColumns(FilePath, InputCols);
    PutExistingColumns(TableName, ExistingCols);
    for i := 0 to InputCols.Count - 1 do begin
      Column := InputCols.Strings[i];
      if (ExistingCols.IndexOf(Column) = -1) then begin
        QueryCols.Add('@dummy');
      end else begin
        QueryCols.Add(Column)
      end;
    end;
    QueryCols.Delimiter := ',';
    Result := QueryCols.DelimitedText;
  finally
    QueryCols.Free;
    ExistingCols.Free;
    InputCols.Free;
  end;
end;

procedure TCsvLoader.PutExistingColumns(TableName: string; Cols: TStringList);
begin
  Utils.SetColumns(Accessor, TableName, Cols);
end;

procedure TCsvLoader.PutInputColumns(FilePath: string; Cols: TStringList);
var
  Line: string;
  Reader: TStreamReader;
begin
  Reader := TStreamReader.Create(FilePath, TEncoding.Default);
  try
    if not Reader.EndOfStream then begin
      Line := Reader.ReadLine;
    end;
    Cols.DelimitedText := Line;
    Cols.Delimiter := ',';
  finally
    Reader.Free;
  end;
end;

// makes and returns sql query
function TCsvLoader.GetSqlQuery(FilePath, TableName, Delim: string): string;
var
  Sql, Columns: string;
begin
  Columns := GetColumnString(TableName, FilePath);
  Sql := Concat('LOAD DATA LOCAL INFILE ''', FilePath, '''');
  Sql := Concat(Sql, ' INTO TABLE ', TableName);
  Sql := Concat(Sql, ' FIELDS TERMINATED BY ''', Delim, '''');
  Sql := Concat(Sql, ' ENCLOSED BY ''', '''');
  Sql := Concat(Sql, ' IGNORE 1 LINES ');
  Sql := Concat(Sql, '(', Columns, ')');
  Result := Sql;
end;

// Extract target table name from file path.
function TCsvLoader.GetTableName(FilePath: string): string;
var
  TableName: string;
begin
  if not FileExists(FilePath) then begin
    raise Exception.Create(Concat('File not found:', FilePath));
  end;
  TableName := ExtractFileName(FilePath);
  TableName := StringReplace(TableName, ExtractFileExt(FilePath), '', [rfReplaceAll, rfIgnoreCase]);
  TableName := StringReplace(TableName, '_ins', '', [rfReplaceAll, rfIgnoreCase]);
  Result := TableName;
end;

end.
