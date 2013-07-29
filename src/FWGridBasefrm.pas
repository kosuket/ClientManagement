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
    procedure btnLoadClick(Sender: TObject);
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
    //グリッドメソッド
    function hasData: Boolean; virtual;
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

procedure TFWGridBaseframe.btnLoadClick(Sender: TObject);
var sql:String;
begin
  sql := createSQL;
  if m_DebugMode then ShowMessage(sql);
  loadQuery(sql);
  adjustGridWidth;
end;

procedure TFWGridBaseframe.Initialize;
begin
  //継承先で
end;
procedure TFWGridBaseframe.loadQuery(sql: String);
begin
  CDataSet.Close;
  Provider.DataSet := Accessor.ExecuteQuery(sql);
  CDataSet.Open;
end;

end.
