// Provides basic feature of
// viewing and editing database
{ TODO : Adjust grid appearance (zebra, highlight modified row) }
unit DBGridBaseFrm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, MySQLAccessor, Vcl.Grids, Vcl.DBGrids,
  Data.DB, Datasnap.Provider, Datasnap.DBClient, Vcl.StdCtrls, CsvOutput, CsvLoader;

type
  TFrmDBGridBase = class(TForm)
    MainGrid: TDBGrid;
  private
    { Private declarations }
    DataSource: TDataSource;
    Provider: TDataSetProvider;
    CsvOutput: TCsvOutput;
    CsvLoader: TCsvLoader;
    procedure GetSqlCommandsFromFile(FilePath: string; var Commands: TStrings);
    procedure GetDropFiles(DirPath: string; var FilePaths: TStrings);
    procedure GetCreateFiles(DirPath: string; var FilePaths: TStrings);
    procedure GetDeleteFiles(DirPath: string; var FilePaths: TStrings);
    procedure GetUpdateFiles(DirPath: string; var FilePaths: TStrings);
    procedure GetInsertFiles(DirPath: string; var FilePaths: TStrings);
    procedure GetImportFiles(DirPath: string; var FilePaths: TStrings);
    procedure ExecuteSqlFiles(FilePaths: TStrings);
    procedure ExecuteSqlCommandFile(FilePath: string);
    procedure ExecuteSqlReplaceFile(FilePath: string);
    procedure ImportFiles(FilePaths: TStrings);
    procedure CreateTable(FilePath: string);
    procedure DropTable(TableName: string);
    procedure ImportBackUp(FilePath, TableName: string);
    procedure DeleteBackUp(FilePath: string);
    function IsReplace(FilePath: string): Boolean;
    function GetTableName(FilePath: string): string;
    function BackUpTable(TableName: string): string;
  protected
    Accessor: TMySQLAccessor;
    CDataSet: TClientDataSet;
    procedure AddRow;
    procedure DeleteRow;
    procedure DuplicateRow;
    procedure Commit;
    procedure LoadQuery(Sql: string);
    procedure LoadTable(Table: string);
    procedure ExportData(DestFile, Table: string);
    procedure ImportData(DestFile: string); overload;
    procedure ImportData(DestFile, Table: string); overload;
    procedure ExecuteSqlFile(FilePath: string);
    procedure ExecuteSqlDirectory(DirPath: string);
  public
    { Public declarations }
    constructor Create(AOwner: TComponent; Accessor: TMySQLAccessor); reintroduce;
    destructor Destroy; override;
    procedure Embed(AParent: TWinControl);
  end;

var
  FrmDBGridBase: TFrmDBGridBase;

implementation
uses
  StrUtils;

{$R *.dfm}

{ TFrmDBEdit }

procedure TFrmDBGridBase.AddRow;
begin
  CDataSet.Insert;
end;

function TFrmDBGridBase.BackUpTable(TableName: string): string;
var
  BkFilePath: string;
begin
  BkFilePath := GetCurrentDir + '\bk' + TableName;
  ExportData(BkFilePath, TableName);
  Result := BkFilePath;
end;

procedure TFrmDBGridBase.Commit;
begin
  CDataSet.ApplyUpdates(0);
end;

constructor TFrmDBGridBase.Create(AOwner: TComponent; Accessor: TMySQLAccessor);
begin
  inherited Create(AOwner);
  Self.Accessor := Accessor;

  // Create DataSet coumponents
  DataSource := TDataSource.Create(Self);
  Provider := TDataSetProvider.Create(Self);
  CDataSet := TClientDataSet.Create(Self);

  // bind them
  Provider.Name := 'Provider';
  CDataSet.ProviderName := Provider.Name;
  DataSource.DataSet := CDataSet;
  MainGrid.DataSource := DataSource;

  // CSV tools
  CsvOutput := TCsvOutput.Create(Accessor);
  CsvLoader := TCsvLoader.Create(Accessor);
end;

procedure TFrmDBGridBase.CreateTable(FilePath: string);
begin
  ExecuteSqlCommandFile(FilePath);
end;

destructor TFrmDBGridBase.Destroy;
begin
  CsvLoader.Free;
  CsvOutput.Free;
  CDataSet.Free;
  Provider.Free;
  DataSource.Free;
  inherited;
end;

procedure TFrmDBGridBase.DropTable(TableName: string);
var
  Sql: string;
begin
  Sql := 'DROP TABLE ' + TableName;
  Accessor.ExecuteUpdate(Sql);
end;

procedure TFrmDBGridBase.DuplicateRow;
var
  i: Integer;
  Originals: array of Variant;
begin
  SetLength(Originals, CDataSet.FieldCount);
  // Get the values from current row
  for i := 0 to CDataSet.FieldCount - 1 do begin
    Originals[i] := CDataSet.Fields[i].Value;
  end;
  // Insert
  CDataSet.Insert;
  // Put in the values;
  for i := 0 to CDataSet.FieldCount - 1 do begin
    CDataSet.Fields[i].Value := Originals[i];
  end;
end;

procedure TFrmDBGridBase.DeleteBackUp(FilePath: string);
begin
  DeleteFile(FilePath);
end;

procedure TFrmDBGridBase.DeleteRow;
begin
  if CDataSet.RecordCount > 0 then begin
    CDataSet.Delete;
  end;
end;

procedure TFrmDBGridBase.Embed(AParent: TWinControl);
begin
  Parent := AParent;
  Align := alClient;
  BorderStyle := bsNone;
end;

procedure TFrmDBGridBase.ExecuteSqlCommandFile(FilePath: string);
var
  Commands: TStrings;
  i: Integer;
begin
  Commands := TStringList.Create;
  try
    GetSqlCommandsFromFile(FilePath, Commands);
    for i := 0 to Commands.Count - 1 do begin
      if Length(Commands[i]) > 0 then begin
        Accessor.ExecuteUpdate(Commands[i]);
      end;
    end;
  finally
    Commands.Free;
  end;
end;

procedure TFrmDBGridBase.ExecuteSqlDirectory(DirPath: string);
var
  FilePaths: TStrings;
begin
  FilePaths := TStringList.Create;
  try
    // Drop
    GetDropFiles(DirPath, FilePaths);
    ExecuteSqlFiles(FilePaths);
    // Create
    FilePaths.Clear;
    GetCreateFiles(DirPath, FilePaths);
    ExecuteSqlFiles(FilePaths);
    // Delete
    FilePaths.Clear;
    GetDeleteFiles(DirPath, FilePaths);
    ExecuteSqlFiles(FilePaths);
    // Update
    FilePaths.Clear;
    GetUpdateFiles(DirPath, FilePaths);
    ExecuteSqlFiles(FilePaths);
    // Insert
    FilePaths.Clear;
    GetInsertFiles(DirPath, FilePaths);
    ExecuteSqlFiles(FilePaths);
    // Import(.dat/.csv)
    FilePaths.Clear;
    GetImportFiles(DirPath, FilePaths);
    ImportFiles(FilePaths);
  finally
    FilePaths.Free;
  end;
end;

procedure TFrmDBGridBase.ExecuteSqlFile(FilePath: string);
begin
  if IsReplace(FilePath) then begin
    ExecuteSqlReplaceFile(FilePath);
  end else begin
    ExecuteSqlCommandFile(FilePath);
  end;
end;

procedure TFrmDBGridBase.ExecuteSqlFiles(FilePaths: TStrings);
var
  i: Integer;
begin
  for i := 0 to FilePaths.Count - 1 do begin
    ExecuteSqlFile(FilePaths[i]);
  end;
end;

procedure TFrmDBGridBase.ExecuteSqlReplaceFile(FilePath: string);
var
  TableName, BackUpFile: string;
begin
  // Determine target table
  TableName := GetTableName(FilePath);
  // Export Backup
  BackUpFile := BackUpTable(TableName);
  // Drop
  DropTable(TableName);
  // Create
  CreateTable(FilePath);
  // Import Backup
  ImportBackUp(BackUpFile, TableName);
  // Delete Backup
  DeleteBackUp(BackUpFile);
end;

procedure TFrmDBGridBase.ExportData(DestFile, Table: string);
begin
  CsvOutput.ExecuteOverWrite(DestFile, Table);
end;

procedure TFrmDBGridBase.GetCreateFiles(DirPath: string;
  var FilePaths: TStrings);
begin
  { TODO : implement }
end;

procedure TFrmDBGridBase.GetDeleteFiles(DirPath: string;
  var FilePaths: TStrings);
begin
  { TODO : implement }
end;

procedure TFrmDBGridBase.GetDropFiles(DirPath: string; var FilePaths: TStrings);
begin
  { TODO : implement }
end;

procedure TFrmDBGridBase.GetImportFiles(DirPath: string;
  var FilePaths: TStrings);
begin
  { TODO : implement }
end;

procedure TFrmDBGridBase.GetInsertFiles(DirPath: string;
  var FilePaths: TStrings);
begin
  { TODO : implement }
end;

procedure TFrmDBGridBase.GetSqlCommandsFromFile(FilePath: string;
  var Commands: TStrings);
var
  Reader: TStreamReader;
begin
  Reader := TStreamReader.Create(FilePath, TEncoding.Default);
  try
    if not Reader.EndOfStream then begin
      Commands.Delimiter := ';';
      Commands.StrictDelimiter := True;
      Commands.DelimitedText := Reader.ReadToEnd;
    end;
  finally
    Reader.Free;
  end;
end;

function TFrmDBGridBase.GetTableName(FilePath: string): string;
var
  Parts: TStrings;
begin
  // Assume '{filename}_replace.sql'
  Parts := TStringList.Create;
  try
    Parts.LineBreak := '_replace.sql';
    Parts.Text := ExtractFileName(FilePath);
    Result := Parts.strings[0];
  finally
    Parts.Free;
  end;
end;

procedure TFrmDBGridBase.GetUpdateFiles(DirPath: string;
  var FilePaths: TStrings);
begin
  { TODO : implement }
end;

procedure TFrmDBGridBase.ImportData(DestFile: string);
begin
  CsvLoader.Execute(DestFile);
end;

procedure TFrmDBGridBase.ImportBackUp(FilePath, TableName: string);
begin
  ImportData(FilePath, TableName);
end;

procedure TFrmDBGridBase.ImportData(DestFile, Table: string);
begin
  CsvLoader.Execute(DestFile, Table, ',');
end;

procedure TFrmDBGridBase.ImportFiles(FilePaths: TStrings);
var
  i: Integer;
begin
  for i := 0 to FilePaths.Count - 1 do begin
    ImportData(FilePaths[i]);
  end;
end;

function TFrmDBGridBase.IsReplace(FilePath: string): Boolean;
var
  Ext: string;
begin
  Ext := ExtractFileExt(FilePath);
  Result := AnsiEndsText('_replace' + Ext, FilePath);
end;

procedure TFrmDBGridBase.LoadQuery(Sql: string);
begin
  CDataSet.Close;
  Provider.DataSet := Accessor.ExecuteQuery(Sql);
  CDataSet.Open;
end;

procedure TFrmDBGridBase.LoadTable(Table: string);
begin
  LoadQuery(Concat('SELECT * FROM ', Table));
end;

end.
