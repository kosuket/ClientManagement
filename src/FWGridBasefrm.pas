unit FWGridBasefrm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Grids, Vcl.DBGrids, Vcl.StdCtrls,
  Vcl.ExtCtrls,Data.DBXMySQL, Data.DB,
  Data.SqlExpr, Data.FMTBcd, Datasnap.DBClient, Datasnap.Provider, Vcl.DBCtrls,
  Vcl.ComCtrls, Vcl.Samples.Spin, Vcl.AppEvnts, Vcl.Imaging.jpeg, MySQLAccessor;

type
  TFWGridBaseframe = class(TForm)
    pnlBase: TPanel;
    Panel2: TPanel;
    DBGrid1: TDBGrid;
    Splitter1: TSplitter;
    pnlCondition: TPanel;
    pnlCondBar: TPanel;
    btnLoad: TButton;
    Image1: TImage;
    ApplicationEvents1: TApplicationEvents;
    Panel1: TPanel;
    Image2: TImage;
    SaveDialog1: TSaveDialog;
    btnExport: TButton;
    procedure btnLoadClick(Sender: TObject);
    procedure btnExportClick(Sender: TObject);
  private
    { Private declarations }
    DataSource: TDataSource;
    Provider: TDataSetProvider;
    //グリッド表示関係
    procedure adjustGridWidth;
  protected
    Accessor: TMySQLAccessor;
    CDataSet: TClientDataSet;
    //SQL生成関係
    function createSQL: String;
    //子で宣言する
    function createSQLFix: String; virtual;
    function createWhere: String; virtual;
    procedure loadQuery(sql: String); virtual;
    procedure exportFile;
    //グリッドメソッド
    function hasData: Boolean; virtual;
    procedure afterLoadProc;virtual;
  public
    { Public declarations }
    //SQLQuery1: TSQLQuery;
    //ClientDataSet1: TClientDataSet;
    //SQLConnection1: TSQLConnection;
    m_DebugMode: Boolean;
    constructor Create(AOwner: TComponent; Accessor: TMySQLAccessor); reintroduce; overload;
    procedure Initialize; virtual;
  end;

var
  FWGridBaseframe: TFWGridBaseframe;

const
  cmbIndexAll = 0;
  cmbIndexYes = 1;
  cmbIndexNo  = 2;
  cmbDivAllYesNo : Array[0..2] of String =(
  '2',
  '1',
  '0');

implementation

{$R *.dfm}

function TFWGridBaseframe.createSQL: String;
begin
  result := createSQLFix + ' ' + createWhere;
end;

function TFWGridBaseframe.createSQLFix: String;
begin
//継承先で
end;

constructor TFWGridBaseframe.Create(AOwner: TComponent; Accessor: TMySQLAccessor) ;
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
  DBGrid1.DataSource := DataSource;
end;

function TFWGridBaseframe.createWhere: String;
begin
  //継承先で
end;

procedure TFWGridBaseframe.exportFile;
var
 F: TextFile;
 CSVFile: String;
 stl: TStringList;
 i: Integer;
begin
 SaveDialog1.Filter := 'CSV file (*.csv)|*.CSV';
 if SaveDialog1.Execute then
 begin
  if Pos('.',SaveDialog1.FileName)= 0 then SaveDialog1.FileName := SaveDialog1.FileName + '.csv';
  CSVFile := SaveDialog1.FileName;
 end
 else
 begin
  Exit;
 end;
 stl := TStringList.Create;
 try
  //ファイル出力
  AssignFile(F,CSVFile); //ファイルと実ファイル結びつける
  ReWrite(F); //ファイルを新規作成して開く
  DBGrid1.DataSource.DataSet.First;
  //タイトル(フィールド)行の出力
  for i := 0 to DBGrid1.DataSource.DataSet.FieldCount - 1 do
  begin
   stl.Add(DBGrid1.DataSource.DataSet.Fields[i].FieldName);
  end;
  Writeln(F,stl.CommaText);
  stl.Clear;
  //リスト出力
  while Not(DBGrid1.DataSource.DataSet.Eof) do
  begin
   for i := 0 to DBGrid1.DataSource.DataSet.FieldCount - 1 do
   begin
    stl.Add(DBGrid1.DataSource.DataSet.Fields[i].AsString);
   end;
   Writeln(F,stl.CommaText); //テキストファイルに1行出力
   stl.Clear;
   DBGrid1.DataSource.DataSet.Next;
  end;
  CloseFile(F); //ファイルを閉じる
  ShowMessage('File Saved');
 finally
  stl.Free;
 end;
end;

function TFWGridBaseframe.hasData: Boolean;
begin
  result := False;
  try
    if not DBGrid1.DataSource.DataSet.Active then exit;
    if DBGrid1.DataSource.DataSet.RecordCount <= 0 then exit;
    result := True;
  except
    on E: Exception do begin
      if m_DebugMode then ShowMessage(E.Message);
    end;
  end;
end;

procedure TFWGridBaseframe.adjustGridWidth;
var i,ii: Integer;
begin
  for i := 0 to DBGrid1.Columns.Count -1 do begin
    DBGrid1.Columns[i].Width := Trunc(Canvas.TextWidth(DBGrid1.Columns[i].Title.Caption)*1.3) + 5;
    DBGrid1.DataSource.DataSet.First;
    for ii := 0 to DBGrid1.DataSource.DataSet.RecordCount -1 do begin
      if Trunc(Canvas.TextWidth(DBGrid1.Fields[i].Text)*1.3) + 5 > DBGrid1.Columns[i].Width then
        DBGrid1.Columns[i].Width := Trunc(Canvas.TextWidth(DBGrid1.Fields[i].Text)*1.3) + 5;
      DBGrid1.DataSource.DataSet.Next;
    end;
  end;
end;

procedure TFWGridBaseframe.afterLoadProc;
begin
  //継承先で
end;

procedure TFWGridBaseframe.btnExportClick(Sender: TObject);
begin
  exportFile;
end;

procedure TFWGridBaseframe.btnLoadClick(Sender: TObject);
var sql:String;
begin
  sql := createSQL;
  loadQuery(sql);
  adjustGridWidth;
end;

procedure TFWGridBaseframe.Initialize;
begin
  //継承先で
end;
procedure TFWGridBaseframe.loadQuery(sql: String);
begin
  if m_DebugMode then ShowMessage(sql);
  CDataSet.Close;
  Provider.DataSet := Accessor.ExecuteQuery(sql);
  CDataSet.Open;
end;

end.
