unit FWGridBasefrm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Grids, Vcl.DBGrids, Vcl.StdCtrls,
  Vcl.ExtCtrls,Data.DBXMySQL, Data.DB,
  Data.SqlExpr, Data.FMTBcd, Datasnap.DBClient, Datasnap.Provider, Vcl.DBCtrls,
  Vcl.ComCtrls, Vcl.Samples.Spin, Vcl.AppEvnts, Vcl.Imaging.jpeg;

type
  TFWGridBaseframe = class(TForm)
    pnlBase: TPanel;
    Panel2: TPanel;
    DBGrid1: TDBGrid;
    Splitter1: TSplitter;
    pnlCondition: TPanel;
    sqlqSchoolName: TSQLQuery;
    cdsSchoolName: TClientDataSet;
    dsSchoolName: TDataSource;
    dspSchoolName: TDataSetProvider;
    pnlCondBar: TPanel;
    btnLoad: TButton;
    Image1: TImage;
    ApplicationEvents1: TApplicationEvents;
    SQLQuery1: TSQLQuery;
    DataSetProvider1: TDataSetProvider;
    ClientDataSet1: TClientDataSet;
    DataSource1: TDataSource;
    procedure btnLoadClick(Sender: TObject);
  private
    { Private declarations }
    //グリッド表示関係
    procedure adjustGridWidth;
  protected
    //SQL生成関係
    procedure createSQL;
    //子で宣言する
    procedure createSQLFix; virtual;
    procedure createWhere; virtual;
    //グリッドメソッド
    function hasData: Boolean; virtual;
  public
    { Public declarations }
    //SQLQuery1: TSQLQuery;
    //ClientDataSet1: TClientDataSet;
    //SQLConnection1: TSQLConnection;
    m_DebugMode: Boolean;
    constructor Create(AOwner: TComponent) ; override;
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

procedure TFWGridBaseframe.createSQL;
begin
  createSQLFix;
  createWhere;
end;

procedure TFWGridBaseframe.createSQLFix;
begin
//継承先で
end;

constructor TFWGridBaseframe.Create(AOwner: TComponent) ;
begin
  inherited;
end;

procedure TFWGridBaseframe.createWhere;
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
begin
  SQLQuery1.SQL.Clear;
  createSQL;
  if m_DebugMode then ShowMessage(SQLQuery1.SQL.Text);
  ClientDataSet1.Close;
  ClientDataSet1.Open;
  //ClientDataSet1.Last;
  //ClientDataSet1.First;
  adjustGridWidth;
end;

procedure TFWGridBaseframe.Initialize;
begin
  //継承先で
end;
end.
