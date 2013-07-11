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
    procedure btnLoadClick(Sender: TObject);
    procedure cmbGMATCategoryChange(Sender: TObject);
    procedure cmbTOEFLCategoryChange(Sender: TObject);
    procedure ApplicationEvents1Message(var Msg: tagMSG; var Handled: Boolean);
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
  public
    { Public declarations }
    SQLQuery1: TSQLQuery;
    ClientDataSet1: TClientDataSet;
    SQLConnection1: TSQLConnection;
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

procedure TFWGridBaseframe.cmbGMATCategoryChange(Sender: TObject);
begin
  {if cmbGMATCategory.ItemIndex = 0 then begin
    edtGMATScore.Increment := 10;
    edtGMATScore.MaxLength := 3;
    edtGMATScore.MaxValue := 800;
    edtGMATScore.MinValue := 0;
    edtGMATScore.Value := 0;
    edtGMATScore.Enabled := False;
    cmbGMATCond.ItemIndex := 0;
    cmbGMATCond.Enabled := False;
  end else if cmbGMATCategory.ItemIndex = 1 then begin
    edtGMATScore.Increment := 10;
    edtGMATScore.MaxLength := 3;
    edtGMATScore.MaxValue := 800;
    edtGMATScore.MinValue := 0;
    edtGMATScore.Value := 700;
    edtGMATScore.Enabled := True;
    cmbGMATCond.Enabled := True;
  end else if cmbGMATCategory.ItemIndex = 2 then begin
    edtGMATScore.Increment := 1;
    edtGMATScore.MaxLength := 2;
    edtGMATScore.MaxValue := 80;
    edtGMATScore.MinValue := 0;
    edtGMATScore.Value := 40;
    edtGMATScore.Enabled := True;
    cmbGMATCond.Enabled := True;
  end else if cmbGMATCategory.ItemIndex = 3 then begin
    edtGMATScore.Increment := 1;
    edtGMATScore.MaxLength := 2;
    edtGMATScore.MaxValue := 80;
    edtGMATScore.MinValue := 50;
    edtGMATScore.Value := 0;
    edtGMATScore.Enabled := True;
    cmbGMATCond.Enabled := True;
  end else if cmbGMATCategory.ItemIndex = 4 then begin
    edtGMATScore.Increment := 1;
    edtGMATScore.MaxLength := 1;
    edtGMATScore.MaxValue := 6;
    edtGMATScore.MinValue := 0;
    edtGMATScore.Value := 5;
    edtGMATScore.Enabled := True;
    cmbGMATCond.Enabled := True;
  end else if cmbGMATCategory.ItemIndex = 5 then begin
    edtGMATScore.Increment := 1;
    edtGMATScore.MaxLength := 1;
    edtGMATScore.MaxValue := 6;
    edtGMATScore.MinValue := 0;
    edtGMATScore.Value := 5;
    edtGMATScore.Enabled := True;
    cmbGMATCond.Enabled := True;
  end;  }
end;

procedure TFWGridBaseframe.cmbTOEFLCategoryChange(Sender: TObject);
begin
  {if cmbTOEFLCategory.ItemIndex = 0 then begin
    edtTOEFLScore.Increment := 1;
    edtTOEFLScore.MaxLength := 3;
    edtTOEFLScore.MaxValue := 120;
    edtTOEFLScore.MinValue := 0;
    edtTOEFLScore.Value := 0;
    edtTOEFLScore.Enabled := False;
    cmbTOEFLCond.ItemIndex := 0;
    cmbTOEFLCond.Enabled := False;
  end else if cmbTOEFLCategory.ItemIndex = 1 then begin
    edtTOEFLScore.Increment := 1;
    edtTOEFLScore.MaxLength := 1;
    edtTOEFLScore.MaxValue := 120;
    edtTOEFLScore.MinValue := 0;
    edtTOEFLScore.Value := 100;
    edtTOEFLScore.Enabled := True;
    cmbTOEFLCond.Enabled := True;
  end else if cmbTOEFLCategory.ItemIndex = 2 then begin
    edtTOEFLScore.Increment := 1;
    edtTOEFLScore.MaxLength := 2;
    edtTOEFLScore.MaxValue := 30;
    edtTOEFLScore.MinValue := 0;
    edtTOEFLScore.Value := 25;
    edtTOEFLScore.Enabled := True;
    cmbTOEFLCond.Enabled := True;
  end else if cmbTOEFLCategory.ItemIndex = 3 then begin
    edtTOEFLScore.Increment := 1;
    edtTOEFLScore.MaxLength := 2;
    edtTOEFLScore.MaxValue := 30;
    edtTOEFLScore.MinValue := 0;
    edtTOEFLScore.Value := 25;
    edtTOEFLScore.Enabled := True;
    cmbTOEFLCond.Enabled := True;
  end else if cmbTOEFLCategory.ItemIndex = 4 then begin
    edtTOEFLScore.Increment := 1;
    edtTOEFLScore.MaxLength := 2;
    edtTOEFLScore.MaxValue := 30;
    edtTOEFLScore.MinValue := 0;
    edtTOEFLScore.Value := 25;
    edtTOEFLScore.Enabled := True;
    cmbTOEFLCond.Enabled := True;
  end;}
end;

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

procedure TFWGridBaseframe.adjustGridWidth;
var i,ii: Integer;
begin
  for i := 0 to DBGrid1.Columns.Count -1 do begin
    DBGrid1.Columns[i].Width := 50;
    DBGrid1.DataSource.DataSet.First;
    for ii := 0 to DBGrid1.DataSource.DataSet.RecordCount -1 do begin
      if Trunc(Canvas.TextWidth(DBGrid1.Fields[i].Text)*1.3) + 5 > DBGrid1.Columns[i].Width then
        DBGrid1.Columns[i].Width := Trunc(Canvas.TextWidth(DBGrid1.Fields[i].Text)*1.3) + 5;
      DBGrid1.DataSource.DataSet.Next;
    end;
  end;
end;

procedure TFWGridBaseframe.ApplicationEvents1Message(var Msg: tagMSG;
  var Handled: Boolean);
begin
if Msg.message = WM_MOUSEWHEEL then
  begin
    {// 上方向
    if Msg.wParam > 0 then
    begin
      ScrollBox1.VertScrollBar.Position :=
        ScrollBox1.VertScrollBar.Position - 32;
    end
    else
    // 下方向
    begin
      ScrollBox1.VertScrollBar.Position :=
        ScrollBox1.VertScrollBar.Position + 32;
    end;

    ScrollBox1.Invalidate;

    Handled := False;}
    // Handled は，コントロールがイベントを処理したかどうかを示します。
    // Handled を false に設定すると，オブジェクトの親がイベントを
    // 処理するようにすることができます。
  end;
end;

procedure TFWGridBaseframe.btnLoadClick(Sender: TObject);
begin
  SQLQuery1.SQL.Clear;
  createSQL;
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
