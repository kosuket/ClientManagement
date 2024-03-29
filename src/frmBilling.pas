unit frmBilling;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, FWGridBasefrm, Data.FMTBcd,
  Vcl.AppEvnts, Datasnap.Provider, Data.DB, Datasnap.DBClient, Data.SqlExpr,
  Vcl.StdCtrls, Vcl.Imaging.jpeg, Vcl.ExtCtrls, Vcl.Grids, Vcl.DBGrids,
  Vcl.ComCtrls, frmMaildlg, Vcl.Menus, frmBillingDlg, Vcl.Buttons;

type
  TBillingframe = class(TFWGridBaseframe)
    pnlAccounting: TPanel;
    lblPeriod: TLabel;
    cmbPeriod: TComboBox;
    edtFirstDate: TDateTimePicker;
    lblBetween: TLabel;
    edtLastDate: TDateTimePicker;
    lblFirstName: TLabel;
    edtFirstName: TEdit;
    lblLastName: TLabel;
    edtLastName: TEdit;
    chkExcludeZero: TCheckBox;
    pmGrid: TPopupMenu;
    pmDetail: TMenuItem;
    pmMail: TMenuItem;
    btnClear: TSpeedButton;
    procedure cmbPeriodChange(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure btnClearClick(Sender: TObject);
  private
    { Private declarations }
    function isMailable: Boolean;
    procedure clearCond(ctrl:TWinControl);
  protected
    //SQL生成関係
    function createSQLFix: String;  override;
    function createWhere: String;  override;
    procedure afterLoadProc; override;
  public
    { Public declarations }
    frmBillingDlg: TBillingDialogframe;
    procedure Initialize; override;
  end;

var
  Billingframe: TBillingframe;

implementation

{$R *.dfm}

{ TAccountingframe }

procedure TBillingframe.afterLoadProc;
begin
  inherited;
  DBGrid1.Columns[0].Visible := false;
end;

procedure TBillingframe.btnClearClick(Sender: TObject);
begin
  inherited;
  clearCond(pnlAccounting);
end;

procedure TBillingframe.clearCond(ctrl: TWinControl);
var i :Integer;
begin
  cmbPeriod.ItemIndex := 2;
  cmbPeriod.OnChange(Self);
  for i := 0 to ctrl.ControlCount -1 do begin
    if ctrl.Controls[i].ClassType = TEdit then TEdit(ctrl.Controls[i]).Text := '';
    if ctrl.Controls[i].ClassType = TCheckBox then TCheckBox(ctrl.Controls[i]).Checked := False;
    //再帰処理
    if (ctrl.Controls[i].ClassType = TPanel) OR (ctrl.Controls[i].ClassType = TTabsheet) OR (ctrl.Controls[i].ClassType = TScrollbox) then clearCond(TPanel(ctrl.Controls[i]));
  end;
end;

procedure TBillingframe.cmbPeriodChange(Sender: TObject);
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

function TBillingframe.createSQLFix: String;
var sl: TStringList;
begin
  inherited;
  sl := TStringList.Create;
  sl.Add('SELECT A.CLIENT_ID,A.FIRST_NAME,A.LAST_NAME,A.EMAIL_ADDRESS,A.CHARGE FROM (');
  sl.Add('SELECT ');
  sl.Add('    C.CLIENT_ID,');
  sl.Add('    C.LAST_NAME,');
  sl.Add('    C.FIRST_NAME,');
  sl.Add('    C.MIDDLE_NAME,');
  sl.Add('    C.EMAIL_ADDRESS,');
  sl.Add('    IFNULL(SUM(B.BOOK_AMOUNT),0) CHARGE');
  sl.Add('FROM');
  sl.Add('    CLIENT C');
  sl.Add('        LEFT JOIN');
  sl.Add('    BILLING_REQUEST B ON C.CLIENT_ID = B.CLIENT_ID');
  sl.Add('                     AND B.INVOICE_ID = 0');
  result := sl.Text;
end;

function TBillingframe.createWhere: String;
  procedure _checkforand(sl: TStrings; cnt:Integer);
  begin
    if sl.Count > cnt then sl.Add(' AND ');
  end;
var sl: TstringList;
   cnt,befWhereCnt: Integer;
   whereFlg: Boolean;
begin
  inherited;
  whereFlg := False;
  befWhereCnt := 0;
  sl := TStringList.Create;
  if cmbPeriod.ItemIndex <> 0 then begin
    sl.Add(' AND B.BOOK_DATE BETWEEN ' + '''' + FormatDateTime('yyyy/mm/dd',edtFirstDate.Date) + '''' + ' AND ' + '''' + FormatDateTime('yyyy/mm/dd',edtLastDate.Date) + '''');
    befWhereCnt := befWhereCnt + 1;
  end;
  sl.Add(' GROUP BY C.CLIENT_ID) A');
  befWhereCnt := befWhereCnt + 1;

  cnt := sl.Count;
  if Length(edtFirstName.Text) > 0 then begin
    _checkforand(sl,cnt);
    sl.Add(' A.FIRST_NAME = ' + '''' + edtFirstName.Text + '''');
    whereFlg := True;
  end;
  if Length(edtLastName.Text) > 0 then begin
    _checkforand(sl,cnt);
    sl.Add(' A.LAST_NAME = ' + '''' + edtLastName.Text + '''');
    whereFlg := True;
  end;
  if chkExcludeZero.Checked then begin
    _checkforand(sl,cnt);
    sl.Add(' A.CHARGE > 0 ');
    whereFlg := True;
  end;
  if whereFlg then begin
    sl.Insert(befWhereCnt,' WHERE ');
  end;
  result := sl.Text;
  sl.Free;
end;

procedure TBillingframe.DBGrid1DblClick(Sender: TObject);
var slRecepient,slAddress: TStringList;
begin
  inherited;
  slRecepient := TStringList.Create;
  slAddress := TStringList.Create;
  try
    slRecepient.Add(DBGrid1.Fields[1].Text + ' ' + DBGrid1.Fields[2].Text);
    slAddress.Add(DBGrid1.Fields[3].Text);
    frmBillingDlg := TBillingDialogframe.Create(Self, Accessor);
    frmBillingDlg.frmMailDialog.setRecepient(slRecepient,slAddress);
    frmBillingDlg.cmbPeriod.ItemIndex := cmbPeriod.ItemIndex;
    frmBillingDlg.edtFirstDate.DateTime := edtFirstDate.DateTime;
    frmBillingDlg.edtLastDate.DateTime := edtLastDate.DateTime;
    frmBillingDlg.g_ClientId := StrToIntDef(DBGrid1.Fields[0].Text,-1);
    frmBillingDlg.g_DebugMode := m_DebugMode;
    frmBillingDlg.initialize(omBilling);
    frmBillingDlg.ShowModal;
  finally
    slRecepient.Free;
    slAddress.Free;
    frmBillingDlg.Destroy;
  end;
end;

procedure TBillingframe.Initialize;
begin
  inherited;
  SaveDialog1.Title := 'Export Displayed Billing Data on Grid as CSV';
  clearCond(pnlAccounting);
end;

function TBillingframe.isMailable: Boolean;
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

end.
