unit frmReceiptDlg;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, FWSQLBaseDlgfrm, Data.FMTBcd, Data.DB, Data.DBXCommon,
  Data.SqlExpr, Vcl.ExtCtrls,frmBillingDlg,MySQLAccessor, Vcl.StdCtrls, System.AnsiStrings;

type
  TReceiptDialogframe = class(TFWSQLBaseDialogframe)
    pnlBilling: TPanel;
    lblName: TLabel;
    Label1: TLabel;
    lblCharge: TLabel;
    Label3: TLabel;
    edtReceipt: TEdit;
    chFullPaid: TCheckBox;
    btnReceive: TButton;
    btnCancel: TButton;
    procedure chFullPaidClick(Sender: TObject);
    procedure btnReceiveClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
  private
    { Private declarations }
    function updateInvoice: Boolean;
    function updateBR: Boolean;
    function insertBR: Boolean;
    function updateCancelInvoice: Boolean;
    function updateCancelBR: Boolean;
    function deleteCancelBR: Boolean;
    function getCurrentBillId(clientId: Int64): Int64;
  public
    { Public declarations }
    frmBillingDialog:TBillingDialogframe;
    g_ClientId: Int64;
    g_ClientName: String;
    g_InvoiceId: Int64;
    g_StartDate: TDateTime;
    g_EndDate: TDateTime;
    g_BillingAmount: Int64;
    g_ReceiptFlg: Integer;
    g_Subject: String;
    g_Body: String;
    constructor create(AOwner:TComponent; Accessor: TMySQLAccessor); reintroduce; overload; override;
    procedure initialize;
  end;

var
  ReceiptDialogframe: TReceiptDialogframe;

implementation

{$R *.dfm}

{ TReceiptDialogframe }

procedure TReceiptDialogframe.btnCancelClick(Sender: TObject);
var b: Boolean;
    tran: TDBXTransaction;
begin
  inherited;
  if MessageDlg('Cancel Receipt Info?',mtConfirmation,[mbYes,mbNo],0,mbYes) <> mrYes then exit;
  tran := Accessor.BeginTransaction;
  try
  //InvoiceÇÃUpdate
  b := updateCancelInvoice;
  //Billing_RequestÇÃUpdate
  if b then b := updateCancelBR;
  //Billing_RequestÇÃInsert
  if b then b := deleteCancelBR;
    if b then begin
      ShowMessage('Succeeded');
      Accessor.CommitFreeAndNil(tran);
      ModalResult := mrOk;
    end else begin
      Accessor.RollbackFreeAndNil(tran);
      ShowMessage('Cancellation Failed');
    end;
  except
    on E: Exception do begin
      Accessor.RollbackFreeAndNil(tran);
      ShowMessage('Cancellation Failed: ' + e.Message);
    end;
  end;
end;

procedure TReceiptDialogframe.btnReceiveClick(Sender: TObject);
var b: Boolean;
    tran: TDBXTransaction;
begin
  inherited;
  if MessageDlg('Register Receipt Info?',mtConfirmation,[mbYes,mbNo],0,mbYes) <> mrYes then exit;
  tran := Accessor.BeginTransaction;
  try
  //InvoiceÇÃUpdate
  b := updateInvoice;
  //Billing_RequestÇÃUpdate
  if b then updateBR;
  //Billing_RequestÇÃInsert
  if b AND (StrToInt64Def(lblCharge.Caption,-1) <> -1) AND (StrToInt64Def(edtReceipt.Text,-1) <> -1)
  AND (StrToInt64Def(lblCharge.Caption,-1) <> StrToInt64Def(edtReceipt.Text,-1)) then insertBR;
    if b then begin
      ShowMessage('Succeeded');
      Accessor.CommitFreeAndNil(tran);
      ModalResult := mrOk;
    end else begin
      Accessor.RollbackFreeAndNil(tran);
      ShowMessage('Registration Failed');
    end;
  except
    on E: Exception do begin
      Accessor.RollbackFreeAndNil(tran);
      ShowMessage('Registration Failed: ' + e.Message);
    end;
  end;
end;

procedure TReceiptDialogframe.chFullPaidClick(Sender: TObject);
begin
  inherited;
  if StrToInt64Def(lblCharge.Caption, -1) = -1 then exit;
  if chFullPaid.Checked then edtReceipt.Text := lblCharge.Caption;
end;

constructor TReceiptDialogframe.create(AOwner: TComponent;
  Accessor: TMySQLAccessor);
begin
  inherited;
  frmBillingDialog := TBillingDialogframe.Create(Self, Accessor);
  frmBillingDialog.pnlBase.Parent := pnlBilling;
  frmBillingDialog.pnlTitle.Visible := False;
  frmBillingDialog.pnlBase.Enabled := False;
end;

function TReceiptDialogframe.deleteCancelBR: Boolean;
var sql: String;
begin
  result := false;
  sql := 'DELETE FROM BILLING_REQUEST WHERE CLIENT_ID = ' + IntToStr(g_ClientId) + ' AND PARENT_INVOICE_ID = ' + IntToStr(g_InvoiceId) ;
  try
    Accessor.ExecuteUpdate(sql);
    result := true;
  except
    on E: Exception do begin
      result := False;
      ShowMessage(e.Message);
    end;
  end;
end;

function TReceiptDialogframe.getCurrentBillId(clientId: Int64): Int64;
begin
  result := 0;
  try
    loadQuery('SELECT MAX(BILL_ID) FROM BILLING_REQUEST WHERE CLIENT_ID = ' + IntToStr(clientId));
    result := CDataSet.Fields[0].AsInteger;
  except
    result := -1;
  end;
end;

procedure TReceiptDialogframe.initialize;
begin
  lblName.Caption := g_ClientName;
  lblCharge.Caption := IntToStr(g_BillingAmount);
  if g_ReceiptFlg = 0 then begin
    btnReceive.Caption := 'Receive';
    btnReceive.Font.Color := clBlack;
    btnReceive.Enabled := True;
    btnCancel.Visible := False;
    edtReceipt.Enabled := True;
  end else begin
    btnReceive.Caption := 'Received';
    btnReceive.Font.Color := clRed;
    btnReceive.Enabled := False;
    edtReceipt.Text := lblCharge.Caption;
    edtReceipt.Enabled := False;
    btnCancel.Visible := True;
  end;
  frmBillingDialog.edtFirstDate.DateTime := g_StartDate;
  frmBillingDialog.edtLastDate.DateTime := g_EndDate;
  frmBillingDialog.g_ClientId := g_ClientId;
  frmBillingDialog.g_InvoiceId := g_InvoiceId;
  frmBillingDialog.g_Subject := g_Subject;
  frmBillingDialog.g_Body := g_Body;
  frmBillingDialog.initialize(omReceipt);
end;

function TReceiptDialogframe.insertBR: Boolean;
  function _String(str: String; isLast: Boolean = False): String;
  var comma: String;
  begin
    case isLast of
      True: comma := '';
      False: comma := ',';
    end;
    result := '''' + AnsiReplaceText(AnsiReplaceText(str,',','ÅC'),'''','Åf') + '''' + comma;
  end;
var sl: TStringList;
   invoiceId,receiptFlg: Integer;
   amt: Int64;
begin
  sl := TStringList.Create;
  With sl do begin
    Add('INSERT INTO BILLING_REQUEST');
    Add('(CLIENT_ID,');
    Add('BILL_ID,');
    Add('BOOK_DATE,');
    Add('BOOK_AMOUNT,');
    Add('BILLING_TYPE,');
    Add('MEMO,');
    Add('INPUT_DATETIME,');
    Add('TOTAL_HOUR,');
    Add('CURRENT_HOUR,');
    Add('INVOICE_ID,');
    Add('RECEIPT_FLG,');
    Add('PARENT_INVOICE_ID)');
    Add('VALUES(');
    Add(IntToStr(g_ClientId) + ',');
    Add(IntToStr(getCurrentBillId(g_ClientId) + 1) + ',');
    Add('SYSDATE(),');
    amt := StrToInt64Def(lblCharge.Caption,-1) - StrToInt64Def(edtReceipt.Text,-1);
    Add(_String(IntToStr(amt)));
    Add('99,');
    Add(_String('Carry Over from ' + g_Subject));
    Add('SYSDATE(),');
    Add('0,');
    Add('0,');
    Add('0,');
    Add('0,');
    Add(IntToStr(g_InvoiceId) + ')');
    Accessor.ExecuteUpdate(sl.Text);
  end;
end;

function TReceiptDialogframe.updateBR: Boolean;
var sql: String;
begin
  result := false;
  sql := 'UPDATE BILLING_REQUEST SET RECEIPT_FLG = 1 WHERE CLIENT_ID = ' + IntToStr(g_ClientId) + ' AND INVOICE_ID = ' + IntToStr(g_InvoiceId) ;
  try
    Accessor.ExecuteUpdate(sql);
    result := true;
  except
    on E: Exception do begin
      result := False;
      ShowMessage(e.Message);
    end;
  end;
end;

function TReceiptDialogframe.updateCancelBR: Boolean;
var sql: String;
begin
  result := false;
  sql := 'UPDATE BILLING_REQUEST SET RECEIPT_FLG = 0 WHERE CLIENT_ID = ' + IntToStr(g_ClientId) + ' AND INVOICE_ID = ' + IntToStr(g_InvoiceId) ;
  try
    Accessor.ExecuteUpdate(sql);
    result := true;
  except
    on E: Exception do begin
      result := False;
      ShowMessage(e.Message);
    end;
  end;
end;

function TReceiptDialogframe.updateCancelInvoice: Boolean;
var sql: String;
begin
  result := false;
  sql := 'UPDATE INVOICE SET RECEIPT_FLG = 0 WHERE CLIENT_ID = ' + IntToStr(g_ClientId) + ' AND INVOICE_ID = ' + IntToStr(g_InvoiceId) ;
  try
    Accessor.ExecuteUpdate(sql);
    result := true;
  except
    on E: Exception do begin
      result := False;
      ShowMessage(e.Message);
    end;
  end;
end;

function TReceiptDialogframe.updateInvoice: Boolean;
var sql: String;
begin
  result := false;
  sql := 'UPDATE INVOICE SET RECEIPT_FLG = 1 WHERE CLIENT_ID = ' + IntToStr(g_ClientId) + ' AND INVOICE_ID = ' + IntToStr(g_InvoiceId) ;
  try
    Accessor.ExecuteUpdate(sql);
    result := true;
  except
    on E: Exception do begin
      result := False;
      ShowMessage(e.Message);
    end;
  end;
end;

end.
