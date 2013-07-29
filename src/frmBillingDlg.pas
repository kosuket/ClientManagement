unit frmBillingDlg;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, FWSQLBaseDlgfrm, Data.FMTBcd, Data.DB,
  Data.SqlExpr, Vcl.ExtCtrls,frmMaildlg, Vcl.Grids, Vcl.ComCtrls, Vcl.StdCtrls,
  Datasnap.DBClient, Datasnap.Provider, Vcl.Buttons, MySQLAccessor;

type
  TBillingDialogframe = class(TFWSQLBaseDialogframe)
    pnlMail: TPanel;
    Splitter1: TSplitter;
    pnlGrid: TPanel;
    pnlBilling: TPanel;
    Splitter2: TSplitter;
    pnlCounseling: TPanel;
    pnlCtrl: TPanel;
    lblPeriod: TLabel;
    cmbPeriod: TComboBox;
    edtFirstDate: TDateTimePicker;
    lblBetween: TLabel;
    edtLastDate: TDateTimePicker;
    grdBilling: TStringGrid;
    grdCounseling: TStringGrid;
    dspBilling: TDataSetProvider;
    cdsBilling: TClientDataSet;
    pnlBillSummary: TPanel;
    lblTotalCharge: TLabel;
    edtTotalCharge: TStaticText;
    btnSend: TSpeedButton;
    btnReload: TSpeedButton;
    procedure cmbPeriodChange(Sender: TObject);
    procedure btnSendClick(Sender: TObject);
    procedure btnReloadClick(Sender: TObject);
  private
    { Private declarations }
    procedure getCounselingInfo;
    procedure getBillingInfo;
    procedure setupGrid;
  public
    { Public declarations }
    frmMailDialog: TMailDlgframe;
    g_ClientId: Int64;
    constructor create(AOwner:TComponent; Accessor: TMySQLAccessor); reintroduce; overload; override;
    procedure initialize;
  end;

var
  BillingDialogframe: TBillingDialogframe;

implementation

{$R *.dfm}

{ TBillingDialogframe }

procedure TBillingDialogframe.btnReloadClick(Sender: TObject);
begin
  inherited;
  getBillingInfo;
  getCounselingInfo;
end;

procedure TBillingDialogframe.btnSendClick(Sender: TObject);
begin
  inherited;
  frmMailDialog.btnSendClick(Self);
  if frmMailDialog.ModalResult = mrOk then ModalResult := mrOK;
end;

procedure TBillingDialogframe.cmbPeriodChange(Sender: TObject);
var d: TDate;
    YY,MM,DD:Word;
begin
  inherited;
  DecodeDate(Now,YY,MM,DD);
  d := StrToDateDef(IntToStr(YY)+'/'+IntToStr(MM)+'/'+'01',Now);
  case cmbPeriod.ItemIndex of
    0: begin
      edtFirstDate.Enabled := False;
      edtLastDate.Enabled := False;
    end;
    1: begin
      edtFirstDate.Enabled := True;
      edtLastDate.Enabled := True;
      edtFirstDate.Date := d;
      edtLastDate.Date := IncMonth(d,1) - 1;
    end;
    2: begin
      edtFirstDate.Enabled := True;
      edtLastDate.Enabled := True;
      edtFirstDate.Date := IncMonth(d,-1);
      edtLastDate.Date := d - 1;
    end;
    3: begin
      edtFirstDate.Enabled := True;
      edtLastDate.Enabled := True;
      edtFirstDate.Date := IncMonth(d,-2);
      edtLastDate.Date := IncMonth(d,-1) - 1;
    end;
  end;
end;

constructor TBillingDialogframe.create(AOwner: TComponent; Accessor: TMySQLAccessor);
begin
  inherited;
  frmMailDialog := TMailDlgframe.Create(Self, Accessor);
  frmMailDialog.pnlBase.Parent := pnlMail;
  frmMailDialog.pnlTitle.Visible := False;
  setupGrid;
end;

procedure TBillingDialogframe.getBillingInfo;
var sql: String;
    i,amt:Integer;
begin
  amt := 0;
  sql := 'SELECT ' +
         '    BILL_ID,' +
         '    BOOK_DATE,' +
         '    BILLING_TYPE,' +//To Do Ç†Ç∆Ç≈DECODEÇ≈à”ñ°Ç™ÇÌÇ©ÇÈÇÊÇ§Ç…Ç∑ÇÈ
         '    BOOK_AMOUNT,' +
         '    MEMO' +
         ' FROM' +
         '    BILLING_REQUEST' +
         ' WHERE CLIENT_ID = ' + IntToStr(g_ClientId);
  if cmbPeriod.ItemIndex <> 0 then
    sql := sql + ' AND BOOK_DATE BETWEEN ' + '''' + FormatDateTime('yyyy/mm/dd',edtFirstDate.Date) + '''' + ' AND ' + '''' + FormatDateTime('yyyy/mm/dd',edtLastDate.Date) + '''';
  sql := sql +' ORDER BY BILL_ID';
  loadQuery(sql);
  if cDataSet.RecordCount = 0 then grdBilling.RowCount := 2
                                    else grdBilling.RowCount := cDataSet.RecordCount + 1;
  for i := 1 to cDataSet.RecordCount do begin
    grdBilling.Cells[0,i] := cDataSet.Fields[0].AsString;
    grdBilling.Cells[1,i] := cDataSet.Fields[1].AsString;
    grdBilling.Cells[2,i] := cDataSet.Fields[2].AsString;
    grdBilling.Cells[3,i] := cDataSet.Fields[3].AsString;
    grdBilling.Cells[4,i] := cDataSet.Fields[4].AsString;
    amt := amt + StrToIntDef(grdBilling.Cells[3,i],0);
    cDataSet.Next;
  end;
  edtTotalCharge.Caption := 'Åè' + FormatFloat('#,##0', amt);
end;

procedure TBillingDialogframe.getCounselingInfo;
var sql: String;
    i:Integer;
begin
  sql := 'SELECT ' +
         '    SEQ,' +
         '    BILL_ID,' +
         '    COUNSELING_DATE,' +
         '    COUNSELING_TYPE,' + //To Do Ç†Ç∆Ç≈DECODEÇ≈à”ñ°Ç™ÇÌÇ©ÇÈÇÊÇ§Ç…Ç∑ÇÈ
         '    HOURS,' +
         '    CONTENT_TYPE' +
         ' FROM' +
         '    COUNSELING' +
         ' WHERE CLIENT_ID = ' + IntToStr(g_ClientId);
  if cmbPeriod.ItemIndex <> 0 then
      sql := sql + ' AND COUNSELING_DATE BETWEEN ' + '''' + FormatDateTime('yyyy/mm/dd',edtFirstDate.Date) + '''' + ' AND ' + '''' + FormatDateTime('yyyy/mm/dd',edtLastDate.Date) + '''';
  sql := sql +  ' ORDER BY SEQ';
  loadQuery(sql);
  if cDataSet.RecordCount = 0 then grdCounseling.RowCount := 2
                                    else grdCounseling.RowCount := cDataSet.RecordCount + 1;
  for i := 1 to cDataSet.RecordCount do begin
    grdCounseling.Cells[0,i] := cDataSet.Fields[0].AsString;
    grdCounseling.Cells[1,i] := cDataSet.Fields[1].AsString;
    grdCounseling.Cells[2,i] := cDataSet.Fields[2].AsString;
    grdCounseling.Cells[3,i] := cDataSet.Fields[3].AsString;
    grdCounseling.Cells[4,i] := cDataSet.Fields[4].AsString;
    grdCounseling.Cells[5,i] := cDataSet.Fields[5].AsString;
    cDataSet.Next;
  end;
end;

procedure TBillingDialogframe.initialize;
begin
  getBillingInfo;
  getCounselingInfo;
end;

procedure TBillingDialogframe.setupGrid;
begin
  With grdBilling do begin
  RowCount := 2;
    ColCount := 5;
    Cells[0, 0] := 'BILL_ID';
    Cells[1, 0] := 'BOOK DATE';
    ColWidths[1] := 100;
    Cells[2, 0] := 'BILLING TYPE';
    ColWidths[2] := 100;
    Cells[3, 0] := 'AMOUNT';
    ColWidths[3] := 80;
    Cells[4, 0] := 'MEMO';
    ColWidths[4] := 200;
  end;
  With grdCounseling do begin
  RowCount := 2;
    ColCount := 6;
    Cells[0, 0] := 'SEQ';
    Cells[1, 0] := 'BILL_ID';
    Cells[2, 0] := 'COUNSELING DATE';
    ColWidths[2] := 100;
    Cells[3, 0] := 'COUNSELING TYPE';
    ColWidths[3] := 100;
    Cells[4, 0] := 'HOURS';
    ColWidths[4] := 80;
    Cells[5,0] := 'CONTENT TYPE';
    ColWidths[5] := 100;
  end;
end;

end.
