unit frmBillingDlg;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, FWSQLBaseDlgfrm, Data.FMTBcd, Data.DB,
  Data.SqlExpr, Vcl.ExtCtrls,frmMaildlg, Vcl.Grids, Vcl.ComCtrls, Vcl.StdCtrls,
  Datasnap.DBClient, Datasnap.Provider, Vcl.Buttons, MySQLAccessor,Data.DBXCommon,System.AnsiStrings;

type
  TOpenMode = (omBilling,omReceipt);
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
    pnlBillSummary: TPanel;
    lblTotalCharge: TLabel;
    edtTotalCharge: TStaticText;
    btnSend: TSpeedButton;
    btnReload: TSpeedButton;
    btnInvoice: TSpeedButton;
    btnReflectOnMail: TSpeedButton;
    procedure cmbPeriodChange(Sender: TObject);
    procedure btnSendClick(Sender: TObject);
    procedure btnReloadClick(Sender: TObject);
    procedure btnInvoiceClick(Sender: TObject);
    procedure btnReflectOnMailClick(Sender: TObject);
  private
    { Private declarations }
    procedure initializeBilling;
    procedure initializeReceipt;
    procedure getCounselingInfo;
    procedure getBillingInfo;
    procedure getReceiptInfo;
    function executeInvoice(clientId:Int64): Boolean;
    function createInsertInvoiceSQL(clientId:Int64; invoiceId: Int64): String;
    function createUpdateBRForInvoiceSQL(clientId:Int64; invoiceId: Int64): String;
    function getInvoiceId(clientId: Int64):Int64;
    function checkUninvoiced(clientId:Int64): Boolean;
    procedure setupGrid;
  public
    { Public declarations }
    frmMailDialog: TMailDlgframe;
    g_ClientId: Int64;
    g_InvoiceId: Int64;
    g_Subject: String;
    g_Body: String;
    constructor create(AOwner:TComponent; Accessor: TMySQLAccessor); reintroduce; overload; override;
    procedure initialize(om:TOpenMode);
  end;

var
  BillingDialogframe: TBillingDialogframe;

implementation

{$R *.dfm}

{ TBillingDialogframe }

procedure TBillingDialogframe.btnInvoiceClick(Sender: TObject);
begin
  inherited;
if MessageDlg('Register Invoice Info Without Sending Email?',mtConfirmation,[mbYes,mbNo],0,mbYes) <> mrYes then exit;
  if not checkUninvoiced(g_ClientId) then begin
    if MessageDlg('The Bill(s) already invoiced exist on Billing Grid. Invoice?',mtConfirmation,[mbYes,mbNo],0,mbYes) <> mrYes then exit;
  end;
  if executeInvoice(g_ClientId) then begin
    ShowMessage('Invoice Info Registered (EMail hasn''t been sent)');
  end else ShowMessage('Failed to register Invoice Info on Database');
end;

procedure TBillingDialogframe.btnReflectOnMailClick(Sender: TObject);
var i: Integer;
begin
  inherited;
  frmMailDialog.edtSubject.Text := 'Invoice for ' + FormatDateTime('yyyy/mm/dd',edtFirstDate.Date) + ' Å` ' + FormatDateTime('yyyy/mm/dd',edtLastDate.Date);
  frmMailDialog.memoContents.Lines.Add('');
  frmMailDialog.memoContents.Lines.Add('Total Charge: ' + edtTotalCharge.Caption);
  frmMailDialog.memoContents.Lines.Add('');
  frmMailDialog.memoContents.Lines.Add('Detail');
  frmMailDialog.memoContents.Lines.Add('Billing Info');
  frmMailDialog.memoContents.Lines.Add('Book Date, Billing Type, Billing Amount');
  for i := 1 to grdBilling.RowCount -1 do begin
    frmMailDialog.memoContents.Lines.Add(grdBilling.Cells[1,i] + ', ' + grdBilling.Cells[2,i] + ', ' + grdBilling.Cells[3,i]);
  end;
  frmMailDialog.memoContents.Lines.Add('');
  frmMailDialog.memoContents.Lines.Add('Counseling Info');
  frmMailDialog.memoContents.Lines.Add('Counseling Date, Counseling Type, Counseling Hour');
  for i := 1 to grdCounseling.RowCount -1 do begin
    frmMailDialog.memoContents.Lines.Add(grdCounseling.Cells[2,i] + ', ' + grdCounseling.Cells[3,i] + ', ' + grdCounseling.Cells[4,i]);
  end;
end;

procedure TBillingDialogframe.btnReloadClick(Sender: TObject);
begin
  inherited;
  getBillingInfo;
  getCounselingInfo;
end;

procedure TBillingDialogframe.btnSendClick(Sender: TObject);
begin
  inherited;
  if MessageDlg('Send This Message And Register Invoice Info?',mtConfirmation,[mbYes,mbNo],0,mbYes) <> mrYes then exit;
  if not checkUninvoiced(g_ClientId) then begin
    if MessageDlg('The Bill(s) already invoiced exist on Billing Grid. Send Invoice?',mtConfirmation,[mbYes,mbNo],0,mbYes) <> mrYes then exit;
  end;
  if frmMailDialog.sendMail then begin
    if executeInvoice(g_ClientId) then begin
      ShowMessage('Message Sent and Invoice Info Registered');
      ModalResult := mrOK;
    end else ShowMessage('Failed to register Invoice Info on Database');
  end else ShowMessage('Failed to Send Mail');
end;

function TBillingDialogframe.checkUninvoiced(clientId: Int64): Boolean;
var str: String;
    i:Integer;
begin
  result := False;
  str := '';
  for i := 1 to grdBilling.RowCount - 1 do begin
    if StrToInt64Def(grdBilling.Cells[0,i],-1) > 0 then begin
      if Length(str) > 0 then str := str + ',';
      str := str + grdBilling.Cells[0,i];
    end;
  end;
  loadQuery('SELECT BILL_ID FROM BILLING_REQUEST WHERE CLIENT_ID = ' + IntToStr(clientId) + ' AND BILL_ID IN (' + str + ') AND INVOICE_ID > 0');
  if CDataSet.RecordCount = 0 then result := True;
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
      edtFirstDate.Date := StrToDate('1900/01/01');
      edtLastDate.Date  := StrToDate('2382/12/31');
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

function TBillingDialogframe.createInsertInvoiceSQL(clientId: Int64; invoiceId: Int64): String;
  function _String(str: String; isLast: Boolean = False): String;
  var comma: String;
  begin
    case isLast of
      True: comma := '';
      False: comma := ',';
    end;
    result := '''' + AnsiReplaceText(AnsiReplaceText(str,',','\,'),'''','\' + '''') + '''' + comma;
  end;
begin
  result := 'INSERT INTO INVOICE' +
            '(CLIENT_ID,' +
            'INVOICE_ID,' +
            'SUBJECT,' +
            'BODY,' +
            'START_DATE,' +
            'END_DATE,' +
            'RECEIPT_FLG,' +
            'INPUT_DATETIME)' +
            'VALUES' +
            '(' +
            IntToStr(clientId) + ',' +
            IntToStr(invoiceId) + ',' +
            _String(frmMailDialog.edtSubject.Text) +
            _String(frmMailDialog.memoContents.Text) +
            _String(FormatDateTime('yyyy/mm/dd',edtFirstDate.Date)) +
            _String(FormatDateTime('yyyy/mm/dd',edtLastDate.Date)) +
            '0,' +
            'SYSDATE()' +
            ')';
  ShowMessage(result);

end;

function TBillingDialogframe.createUpdateBRForInvoiceSQL(clientId,
  invoiceId: Int64): String;
var sql,str: String;
    i: Integer;
begin
  result := '';
  str := '';
  for i := 1 to grdBilling.RowCount - 1 do begin
    if StrToInt64Def(grdBilling.Cells[0,i],-1) > 0 then begin
      if Length(str) > 0 then str := str + ',';
      str := str + grdBilling.Cells[0,i];
    end;
  end;
  result := 'UPDATE BILLING_REQUEST SET INVOICE_ID = ' + IntToStr(invoiceId) + ' WHERE CLIENT_ID = ' + IntToStr(clientId) + ' AND BILL_ID IN (' + str + ')';
end;

function TBillingDialogframe.executeInvoice(clientId:Int64): Boolean;
var invoiceId: Int64;
    tran: TDBXTransaction;
begin
  result := False;
  tran := Accessor.BeginTransaction;
  try
    invoiceId := getInvoiceId(clientId) + 1;
    Accessor.ExecuteUpdate(createInsertInvoiceSQL(clientId,invoiceId));
    Accessor.ExecuteUpdate(createUpdateBRForInvoiceSQL(clientId,invoiceId));
    Accessor.CommitFreeAndNil(tran);
    result := True;
  except
    on E: Exception do begin
      Accessor.RollbackFreeAndNil(tran);
      result := False;
      ShowMessage(e.Message);
    end;
  end;
end;

procedure TBillingDialogframe.getBillingInfo;
var sql: String;
    i,amt:Integer;
begin
  amt := 0;
  for i :=  0 to grdBilling.ColCount -1 do begin
    grdBilling.Cells[i,1] := '';
  end;
  sql := 'SELECT ' +
         '    BILL_ID,' +
         '    BOOK_DATE,' +
         '    CASE BILLING_TYPE ' +
         '      WHEN 1 THEN "Counseling" '  +
         '      WHEN 2 THEN "Seminar" ' +
         '      WHEN 3 THEN "Alpha Package" ' +
         '      WHEN 4 THEN "Standard Package" ' +
         '      WHEN 99 THEN "Carry-Over From Last Month" END "BILLING TYPE",' +
         '    BOOK_AMOUNT,' +
         '    MEMO,' +
         '    TOTAL_HOUR,' +
         '    CURRENT_HOUR ' +
         ' FROM' +
         '    BILLING_REQUEST' +
         ' WHERE CLIENT_ID = ' + IntToStr(g_ClientId);
  if cmbPeriod.ItemIndex <> 0 then
    sql := sql + ' AND BOOK_DATE BETWEEN ' + '''' + FormatDateTime('yyyy/mm/dd',edtFirstDate.Date) + '''' + ' AND ' + '''' + FormatDateTime('yyyy/mm/dd',edtLastDate.Date) + '''';
    sql := sql + ' AND INVOICE_ID = 0';
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
    grdBilling.Cells[5,i] := cDataSet.Fields[5].AsString;
    grdBilling.Cells[6,i] := cDataSet.Fields[6].AsString;
    amt := amt + StrToIntDef(grdBilling.Cells[3,i],0);
    cDataSet.Next;
  end;
  edtTotalCharge.Caption := 'Åè' + FormatFloat('#,##0', amt);
end;

procedure TBillingDialogframe.getCounselingInfo;
var sql: String;
    i:Integer;
begin
  for i :=  0 to grdCounseling.ColCount -1 do begin
    grdCounseling.Cells[i,1] := '';
  end;
  sql := 'SELECT ' +
         '    SEQ,' +
         '    BILL_ID,' +
         '    COUNSELING_DATE,' +
         '    CASE COUNSELING_TYPE ' +
         '      WHEN 1 THEN "Face To Face" ' +
         '      WHEN 2 THEN "Skype" ' +
         '      WHEN 3 THEN "Email" ' +
         '      WHEN 4 THEN "Seminar" END "COUNSELING TYPE",' +
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

function TBillingDialogframe.getInvoiceId(clientId: Int64): Int64;
begin
  loadQuery('SELECT MAX(INVOICE_ID) FROM INVOICE WHERE CLIENT_ID = ' + IntToStr(clientId));
  if CDataSet.Fields[0].AsInteger > 0 then result := CDataSet.Fields[0].AsInteger
                                      else result := 0;
end;

procedure TBillingDialogframe.getReceiptInfo;
var sql: String;
    i,amt:Integer;
begin
  amt := 0;
  sql := 'SELECT ' +
         '    BILL_ID,' +
         '    BOOK_DATE,' +
         '    CASE BILLING_TYPE ' +
         '      WHEN 1 THEN "Counseling" '  +
         '      WHEN 2 THEN "Seminar" ' +
         '      WHEN 3 THEN "Alpha Package" ' +
         '      WHEN 4 THEN "Standard Package" END "BILLING TYPE",' +
         '    BOOK_AMOUNT,' +
         '    MEMO,' +
         '    TOTAL_HOUR,' +
         '    CURRENT_HOUR ' +
         ' FROM' +
         '    BILLING_REQUEST' +
         ' WHERE CLIENT_ID = ' + IntToStr(g_ClientId);
    //sql := sql + ' AND BOOK_DATE BETWEEN ' + '''' + FormatDateTime('yyyy/mm/dd',edtFirstDate.Date) + '''' + ' AND ' + '''' + FormatDateTime('yyyy/mm/dd',edtLastDate.Date) + '''';
    sql := sql + ' AND INVOICE_ID = ' + IntToStr(g_InvoiceId);
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
    grdBilling.Cells[5,i] := cDataSet.Fields[5].AsString;
    grdBilling.Cells[6,i] := cDataSet.Fields[6].AsString;
    amt := amt + StrToIntDef(grdBilling.Cells[3,i],0);
    cDataSet.Next;
  end;
  edtTotalCharge.Caption := 'Åè' + FormatFloat('#,##0', amt);
end;

procedure TBillingDialogframe.initialize(om:TOpenMode);
begin
  case om of
    omBilling: initializeBilling;
    omReceipt: initializeReceipt;
  end;
end;

procedure TBillingDialogframe.initializeBilling;
begin
  getBillingInfo;
  getCounselingInfo;
end;

procedure TBillingDialogframe.initializeReceipt;
begin
  frmMailDialog.pnlAddress.Visible := False;
  frmMailDialog.pnlAttachment.Visible := False;
  frmMailDialog.edtSubject.Text := g_Subject;
  frmMailDialog.memoContents.Text := g_Body;
  getReceiptInfo;
  getCounselingInfo;
end;

procedure TBillingDialogframe.setupGrid;
begin
  With grdBilling do begin
  RowCount := 2;
    ColCount := 7;
    Cells[0, 0] := 'BILL_ID';
    Cells[1, 0] := 'BOOK DATE';
    ColWidths[1] := 100;
    Cells[2, 0] := 'BILLING TYPE';
    ColWidths[2] := 100;
    Cells[3, 0] := 'AMOUNT';
    ColWidths[3] := 80;
    Cells[4, 0] := 'MEMO';
    ColWidths[4] := 200;
    Cells[5, 0] := 'TOTAL HOUR';
    ColWidths[5] := 80;
    Cells[6, 0] := 'CURRENT HOUR';
    ColWidths[6] := 100;
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
