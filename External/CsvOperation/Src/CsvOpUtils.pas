unit CsvOpUtils;

interface
uses
  Classes, MySQLAccessor;

type TCsvOpUtils = class
  public
    function EscapeFilePath(Path: string): string;
    // Set the columns of the table in the string list
    procedure SetColumns(Accessor: TMySQLAccessor;
      TableName: string; Columns: TStringList);
end;

implementation
uses
  SysUtils, Data.DB;

function TCsvOpUtils.EscapeFilePath(Path: string): string;
begin
  Result := StringReplace(Path, '\', '\\', [rfReplaceAll, rfIgnoreCase]);
end;
procedure TCsvOpUtils.SetColumns(Accessor: TMySQLAccessor;
  TableName: string; Columns: TStringList);
var
  Sql: string;
  DataSet: TDataSet;
begin
  Sql := 'SELECT COLUMN_NAME FROM INFORMATION_SCHEMA.COLUMNS ';
  Sql := Concat(Sql, ' WHERE TABLE_NAME = ''');
  Sql := Concat(Sql, TableName, '''');

  // execute SQL and put the result into the list.
  DataSet := Accessor.ExecuteQuery(Sql);
  try
    while not DataSet.Eof do begin
      Columns.Add(DataSet['COLUMN_NAME']);
      DataSet.Next;
    end;
  finally
    if Assigned(DataSet) then DataSet.Free;
  end;
end;

end.
