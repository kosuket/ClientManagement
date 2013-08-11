unit frmReceipt;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, FWGridBasefrm, Vcl.AppEvnts,
  Vcl.StdCtrls, Vcl.Imaging.jpeg, Vcl.ExtCtrls, Vcl.Grids, Vcl.DBGrids,
  Vcl.ComCtrls, Vcl.Buttons, frmReceiptDlg,MySQLAccessor;

type
  TReceiptframe = class(TFWGridBaseframe)
    pnlAccounting: TPanel;
    lblStartDate: TLabel;
    lblBetween: TLabel;
    lblFirstName: TLabel;
    lblLastName: TLabel;
    cmbStartDate: TComboBox;
    edtFirstStartDate: TDateTimePicker;
    edtLastStartDate: TDateTimePicker;
    edtFirstName: TEdit;
    edtLastName: TEdit;
    lblEndDate: TLabel;
    cmbEndDate: TComboBox;
    edtFirstEndDate: TDateTimePicker;
    Label2: TLabel;
    edtLastEndDate: TDateTimePicker;
    btnClear: TSpeedButton;
    chkReceived: TCheckBox;
    procedure cmbStartDateChange(Sender: TObject);
    procedure cmbEndDateChange(Sender: TObject);
    procedure btnClearClick(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
  private
    { Private declarations }
    procedure clearCond(ctrl:TWinControl);
  protected
    //SQL¶¬ŠÖŒW
    function createSQLFix: String;  override;
    function createWhere: String;  override;
  public
    { Public declarations }
    frmReceiptDialog: TReceiptDialogframe;
    procedure initialize; override;
  end;

var
  Receiptframe: TReceiptframe;

implementation

{$R *.dfm}

{ TReceiptframe }

procedure TReceiptframe.btnClearClick(Sender: TObject);
begin
  inherited;
  clearCond(pnlAccounting);
end;

procedure TReceiptframe.clearCond(ctrl: TWinControl);
var i :Integer;
begin
  cmbStartDate.ItemIndex := 2;
  cmbStartDate.OnChange(Self);
  cmbEndDate.ItemIndex := 2;
  cmbEndDate.OnChange(Self);
  for i := 0 to ctrl.ControlCount -1 do begin
    if ctrl.Controls[i].ClassType = TEdit then TEdit(ctrl.Controls[i]).Text := '';
    if ctrl.Controls[i].ClassType = TCheckBox then TCheckBox(ctrl.Controls[i]).Checked := False;
    //Ä‹Aˆ—
    if (ctrl.Controls[i].ClassType = TPanel) OR (ctrl.Controls[i].ClassType = TTabsheet) OR (ctrl.Controls[i].ClassType = TScrollbox) then clearCond(TPanel(ctrl.Controls[i]));
  end;
end;

procedure TReceiptframe.cmbEndDateChange(Sender: TObject);
var d: TDate;
    YY,MM,DD:Word;
begin
  inherited;
  DecodeDate(Now,YY,MM,DD);
  d := StrToDateDef(IntToStr(YY)+'/'+IntToStr(MM)+'/'+'01',Now);
  case cmbEndDate.ItemIndex of
    0: begin
      edtFirstEndDate.Enabled := False;
      edtLastEndDate.Enabled := False;
    end;
    1: begin
      edtFirstEndDate.Enabled := True;
      edtLastEndDate.Enabled := True;
      edtFirstEndDate.Date := d;
      edtLastEndDate.Date := IncMonth(d,1) - 1;
    end;
    2: begin
      edtFirstEndDate.Enabled := True;
      edtLastEndDate.Enabled := True;
      edtFirstEndDate.Date := IncMonth(d,-1);
      edtLastEndDate.Date := d - 1;
    end;
    3: begin
      edtFirstEndDate.Enabled := True;
      edtLastEndDate.Enabled := True;
      edtFirstEndDate.Date := IncMonth(d,-2);
      edtLastEndDate.Date := IncMonth(d,-1) - 1;
    end;
  end;
end;

procedure TReceiptframe.cmbStartDateChange(Sender: TObject);
var d: TDate;
    YY,MM,DD:Word;
begin
  inherited;
  DecodeDate(Now,YY,MM,DD);
  d := StrToDateDef(IntToStr(YY)+'/'+IntToStr(MM)+'/'+'01',Now);
  case cmbStartDate.ItemIndex of
    0: begin
      edtFirstStartDate.Enabled := False;
      edtLastStartDate.Enabled := False;
    end;
    1: begin
      edtFirstStartDate.Enabled := True;
      edtLastStartDate.Enabled := True;
      edtFirstStartDate.Date := d;
      edtLastStartDate.Date := IncMonth(d,1) - 1;
    end;
    2: begin
      edtFirstStartDate.Enabled := True;
      edtLastStartDate.Enabled := True;
      edtFirstStartDate.Date := IncMonth(d,-1);
      edtLastStartDate.Date := d - 1;
    end;
    3: begin
      edtFirstStartDate.Enabled := True;
      edtLastStartDate.Enabled := True;
      edtFirstStartDate.Date := IncMonth(d,-2);
      edtLastStartDate.Date := IncMonth(d,-1) - 1;
    end;
  end;
end;

function TReceiptframe.createSQLFix: String;
begin
  result := 'SELECT '
          + '    CL.CLIENT_ID,'
          + '    I.INVOICE_ID,'
          + '    CL.FIRST_NAME,'
          + '    CL.LAST_NAME,'
          + '    I.START_DATE,'
          + '    I.END_DATE,'
          + '    CASE RECEIPT_FLG '
          + '      WHEN 0 THEN "NOT RECEIVED" '
          + '      WHEN 1 THEN "RECEIVED" END "RECEIPT_FLG",'
          + '    I.BILLING_AMOUNT,'
          + '    I.SUBJECT,'
          + '    I.BODY,'
          + '    I.RECEIPT_FLG'
          + ' FROM'
          + '    INVOICE I'
          + '        INNER JOIN'
          + '    CLIENT CL ON I.CLIENT_ID = CL.CLIENT_ID';
end;

function TReceiptframe.createWhere: String;
  procedure _checkforand(sl: TStrings);
  begin
    if sl.Count > 0 then sl.Add(' AND ');
  end;
var sl: TstringList;
begin
  sl := TStringList.Create;
  if Length(edtFirstName.Text) > 0 then begin
    _checkforand(sl);
    sl.Add(' CL.FIRST_NAME LIKE ' + '''' + '%' + edtFirstName.Text + '%' + '''');
  end;
  if Length(edtLastName.Text) > 0 then begin
    _checkforand(sl);
    sl.Add(' CL.LAST_NAME LIKE ' + '''' + '%' + edtLastName.Text + '%' + '''');
  end;
  if cmbStartDate.ItemIndex <> 0 then begin
    _checkforand(sl);
    sl.Add(' I.START_DATE BETWEEN ' + '''' + FormatDateTime('yyyy/mm/dd',edtFirstStartDate.Date) + '''' + ' AND ' + '''' + FormatDateTime('yyyy/mm/dd',edtLastStartDate.Date) + '''');
  end;
  if cmbEndDate.ItemIndex <> 0 then begin
    _checkforand(sl);
    sl.Add(' I.END_DATE BETWEEN ' + '''' + FormatDateTime('yyyy/mm/dd',edtFirstEndDate.Date) + '''' + ' AND ' + '''' + FormatDateTime('yyyy/mm/dd',edtLastEndDate.Date) + '''');
  end;
  if not chkReceived.Checked then begin
    _checkforand(sl);
    sl.Add(' I.RECEIPT_FLG = 0');
  end;

  if sl.Count > 0 then sl.Insert(0,' WHERE ');
  sl.Add(' ORDER BY I.CLIENT_ID, I.INVOICE_ID DESC');
  result := sl.Text;
end;

procedure TReceiptframe.DBGrid1DblClick(Sender: TObject);
var slRecepient,slAddress: TStringList;
begin
  inherited;
  slRecepient := TStringList.Create;
  slAddress := TStringList.Create;
  try
    //slAddress.Add(DBGrid1.Fields[3].Text);
    frmReceiptDialog := TReceiptDialogframe.Create(Self, Accessor);
    frmReceiptDialog.g_StartDate := DBGrid1.Fields[4].AsDateTime;
    frmReceiptDialog.g_EndDate := DBGrid1.Fields[5].AsDateTime;
    frmReceiptDialog.g_ClientId := StrToIntDef(DBGrid1.Fields[0].Text,-1);
    frmReceiptDialog.g_ClientName := DBGrid1.Fields[2].Text + ' ' + DBGrid1.Fields[3].Text;
    frmReceiptDialog.g_InvoiceId := StrToIntDef(DBGrid1.Fields[1].Text,-1);
    frmReceiptDialog.g_BillingAmount := DBGrid1.Fields[7].AsInteger;
    frmReceiptDialog.g_ReceiptFlg := StrToIntDef(DBGrid1.Fields[10].Text,-1);
    frmReceiptDialog.g_Subject := DBGrid1.Fields[8].Text;
    frmReceiptDialog.g_Body := DBGrid1.Fields[9].Text;
    frmReceiptDialog.initialize;
    frmReceiptDialog.ShowModal;
  finally
    slRecepient.Free;
    slAddress.Free;
    frmReceiptDialog.Destroy;
  end;
end;

procedure TReceiptframe.initialize;
begin
  inherited;
  clearCond(pnlAccounting);
end;

end.
