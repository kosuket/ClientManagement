unit frmCounselingDlg;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, FWSQLBaseDlgfrm, Data.FMTBcd, Data.DB,
  Data.SqlExpr, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.ComCtrls, MySQLAccessor, frmClientSearch,Data.DBXCommon, System.DateUtils;

type
  TOpenMode = (omNew,omModify);
  TCounselingDialogframe = class(TFWSQLBaseDialogframe)
    cmbItemType: TComboBox;
    pnlClient: TPanel;
    btnClient: TButton;
    lblClient: TLabel;
    gbCounseling: TGroupBox;
    lblCounselingType: TLabel;
    cmbCounselingType: TComboBox;
    lblCounselingDate: TLabel;
    edtCounselingDate: TDateTimePicker;
    lblStartTime: TLabel;
    edtStartTime: TDateTimePicker;
    lblEndTime: TLabel;
    edtEndTime: TDateTimePicker;
    lblContentType: TLabel;
    edtContentType: TEdit;
    lblNextAction: TLabel;
    lblCounselingMemo: TLabel;
    gbPackage: TGroupBox;
    lblPackageType: TLabel;
    cmbPackageType: TComboBox;
    lblBookDate: TLabel;
    edtBookDate: TDateTimePicker;
    lblBookAmount: TLabel;
    edtPackageAmount: TEdit;
    Label1: TLabel;
    cbPanicFee: TCheckBox;
    btnOK: TButton;
    memoNextAction: TRichEdit;
    memoCounseling: TRichEdit;
    memoBilling: TRichEdit;
    edtCounselingAmount: TEdit;
    lblCharge: TLabel;
    procedure cmbItemTypeChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnClientClick(Sender: TObject);
    procedure btnOKClick(Sender: TObject);
    procedure cmbPackageTypeChange(Sender: TObject);
    procedure edtStartTimeChange(Sender: TObject);
    procedure edtEndTimeChange(Sender: TObject);
    procedure cbPanicFeeClick(Sender: TObject);
    procedure edtCounselingDateChange(Sender: TObject);
  private
    { Private declarations }
    m_OpenMode: TOpenMode;
    procedure initializeNew;
    procedure initializeModify;
    function insertNew: Boolean;
    function updateExisting: Boolean;
    procedure clearClientLists;
    procedure addClientLists(clientId: Int64; pkgBillId: Int64; alphaFlg: Integer; standardFlg: Integer; restHour: Double);
    function bookCounseling: Boolean;
    function bookPackage: Boolean;
    function createInsertBRForPackageSQL: String;
    function createUpdateClForPackageSQL(clientId: Int64; ptDiv: Integer): String;
    function createInsertCounselingSQL(clientId: Int64;billId: Int64): String;
    function createInsertBRForCounselingSQL(clientId: Int64;billId: Int64; hour: Double; packageFlg: Integer): String;
    function createUpdateBRForCounselingSQL(clientId: Int64;billId: Int64; hour: Double; alphaFlg: Integer): String;
    function getCurrentBillId(clientId: Int64): Int64;
    function getCurrentSEQ(clientId: Int64): Int64;
    function calcCounselingHour: Double;
    function calcCounselingFee:Int64;
    procedure setCounselingAmount(clientId: Int64);
  public
    { Public declarations }
    frmSearchClient: TClientSearchframe;
    ClientIdList: TStringList;
    ClientPkgBillIdList: TStringList;
    ClientAlphaList: TStringList;
    ClientStandardList: TStringList;
    ClientRestHourList: TStringList;
    constructor Create(AOwner: TComponent; Accessor: TMySQLAccessor); reintroduce; overload; override;
    procedure initialize(OpenMode:TOpenMode);
  end;

var
  CounselingDialogframe: TCounselingDialogframe;
const
  itCounseling = 0;
  itSeminar =  1;
  itPackage = 2;
  ptAlpha = 0;
  ptStandard = 1;
  cmbPackageBillType : Array[0..1] of String =(
  '3',
  '4');
  cmbPackageAmount  : Array[0..1] of String =(
  '693000',
  '246750');
  cmbPackageTotalHour : Array[0..1] of String =(
  '0',
  '10');
  ctFace = 0;
  ctSkype = 1;
  ctEMail = 2;
  ctSeminar = 3;
  cmbCounselingTypeVal : Array[0..3] of String =(
  '1',
  '2',
  '3',
  '4');
  crStandard = 25200;
  crPeak = 28350;
  crPanic = 31500;
implementation

{$R *.dfm}

{ TCounselingDialogframe }

procedure TCounselingDialogframe.addClientLists(clientId, pkgBillId: Int64;
  alphaFlg: Integer; standardFlg: Integer; restHour: Double);
begin
  ClientIdList.Add(IntToStr(clientId));
  ClientPkgBillIdList.Add(IntToStr(pkgBillId));
  ClientAlphaList.Add(IntToStr(alphaFlg));
  ClientStandardList.Add(IntToStr(standardFlg));
  ClientRestHourList.Add(FloatToStr(restHour));
end;

function TCounselingDialogframe.bookCounseling: Boolean;
  function _bookIndividual(idx: Integer): Boolean;
  var clientId: Int64;
      pkgBillId: Int64;
      alphaFlg: Integer;
      standardFlg: Integer;
      billId: Int64;
      i: Integer;
      restHour,execHour: Double;
  begin
    result := False;
    clientId := StrToInt64Def(ClientIdList[idx],-1);
    pkgBillId := StrToInt64Def(ClientPkgBillIdList[idx],-1);
    alphaFlg := StrToIntDef(ClientAlphaList[idx],0);
    if pkgBillId <> -1 then billId := pkgBillId
                       else billId := getCurrentBillId(clientId) + 1;
    //Check
    //Insert Counseling

    Accessor.ExecuteUpdate(createInsertCounselingSQL(clientId,billId));
    restHour := calcCounselingHour;
    //Update Billing Request
    if (cmbCounselingType.ItemIndex <> 3) AND ((pkgBillId <> -1) OR (alphaFlg <> 0)) then begin
      loadQuery('SELECT BILL_ID, BILLING_TYPE, TOTAL_HOUR - CURRENT_HOUR FROM BILLING_REQUEST WHERE CLIENT_ID = ' + IntToStr(clientId)
       + ' AND ((BILLING_TYPE = 4 AND TOTAL_HOUR - CURRENT_HOUR >0) OR (BILLING_TYPE = 3))');
      for i := 0 to CDataSet.RecordCount - 1 do begin
        if (CDataSet.Fields[1].AsInteger = 4) AND (restHour <= 0) then break;
        if CDataSet.Fields[1].AsInteger = 3 then execHour := restHour
        else if CDataSet.Fields[2].AsFloat < restHour then execHour := CDataSet.Fields[2].AsFloat
                                                      else execHour := restHour;
        Accessor.ExecuteUpdate(createUpdateBRForCounselingSQL(clientId,CDataSet.Fields[0].AsInteger,execHour,alphaFlg));
        restHour := restHour - execHour;
        CDataSet.Next;
      end;
      billId := getCurrentBillId(clientId) + 1;
    end;
    //Insert Billing Request
    if ((cmbCounselingType.ItemIndex = ctSeminar) AND (alphaFlg <> 1))
      OR (StrToInt64Def(edtCounselingAmount.Text,0) > 0)
      then Accessor.ExecuteUpdate(createInsertBRForCounselingSQL(clientId,billId,restHour,standardFlg));
    result := True;
  end;
var i: Integer;
    b: Boolean;
    tran: TDBXTransaction;
begin
  b := True;
  tran := Accessor.BeginTransaction;
  try
    for i := 0 to ClientIdList.Count -1 do if not _bookIndividual(i) then b := False;
    if b then Accessor.CommitFreeAndNil(tran)
         else Accessor.RollbackFreeAndNil(tran);
    result := b;
  except
    on E: Exception do begin
      Accessor.RollbackFreeAndNil(tran);
      ShowMessage(e.Message);
      result := False;
    end;
  end;
end;

function TCounselingDialogframe.bookPackage: Boolean;
var tran: TDBXTransaction;
begin
  result := False;
  //Check
  tran := Accessor.BeginTransaction;
  try
    //Insert Billing Request
    Accessor.ExecuteUpdate(createInsertBRForPackageSQL);
    //Update Client if neccesary
    Accessor.ExecuteUpdate(createUpdateClForPackageSQL(StrToInt64Def(ClientIdList[0],-1), cmbPackageType.ItemIndex));
    Accessor.CommitFreeAndNil(tran);
    result := True;
  except
    on E: Exception do begin
      ShowMessage(e.Message);
      Accessor.RollbackFreeAndNil(tran);
      result := false;
    end;
  end;
end;

procedure TCounselingDialogframe.btnClientClick(Sender: TObject);
begin
  inherited;
  frmSearchClient := TClientSearchframe.Create(Self,Accessor);
  try
    if frmSearchClient.ShowModal = mrOk then begin
      clearClientLists;
      addClientLists(frmSearchClient.g_SelectedClientId,frmSearchClient.g_SelectedPkgBillId,frmSearchClient.g_SelectedAlphaFlg, frmSearchClient.g_SelectedStandardFlg, frmSearchClient.g_SelectedRestHour);
      lblClient.Caption := frmSearchClient.g_SelectedFirstName + ' ' + frmSearchClient.g_SelectedLastName;
      setCounselingAmount(StrToInt64Def(ClientIdList[0],-1));
    end;
  finally
    frmSearchClient.Free;
  end;
end;

procedure TCounselingDialogframe.btnOKClick(Sender: TObject);
var b: Boolean;
begin
  inherited;
  case m_OpenMode of
    omNew: b := insertNew;
    omModify: b := updateExisting;
  end;
  if b then begin
    ShowMessage('Succeeded');
    ModalResult := mrOk;
  end else ShowMessage('Booking Failed');
end;

function TCounselingDialogframe.calcCounselingFee: Int64;
var rate: Double;
    hour: Double;
begin
  result := 0;
  //Basic Rule
  if cbPanicFee.Checked then rate := crPanic
  else if ((MonthOf(edtCounselingDate.Date) >= 12) AND (DayOf(edtCounselingDate.Date) >= 15))
       OR ((MonthOf(edtCounselingDate.Date) <= 2) AND (DayOf(edtCounselingDate.Date) <= 15)) then rate := crPeak
  else rate := crStandard;

  //Special Rule
  if ClientStandardList[0] = '1' then rate := crStandard;
  hour := calcCounselingHour - StrToFloatDef(ClientRestHourList[0],0);
  if hour > 0 then result := Trunc(rate * hour)
              else result := 0;
  if ClientAlphaList[0] = '1' then result := 0;
end;

function TCounselingDialogframe.calcCounselingHour: Double;
var min: Integer;
    h: Double;
begin
  result := 0;
  min := (HourOf(TimeOf(edtEndTime.Time))*60 + MinuteOf(TimeOf(edtEndTime.Time))) - (HourOf(TimeOf(edtStartTime.Time))*60 + MinuteOf(TimeOf(edtStartTime.Time)));
  h := min/60;
  h := Trunc(h*10)/10;
  if (frac(h) >= 0) AND (frac(h) < 0.3) then h := Trunc(h)
  else if (frac(h) >= 0.3) AND (frac(h) < 0.7) then h := Trunc(h) + 0.5
  else if (frac(h) >= 0.7) then h := Trunc(h) + 1;
  result := h;
end;

procedure TCounselingDialogframe.cbPanicFeeClick(Sender: TObject);
begin
  inherited;
  setCounselingAmount(StrToInt64Def(ClientIdList[0],-1));
end;

procedure TCounselingDialogframe.clearClientLists;
begin
  ClientIdList.Clear;
  ClientPkgBillIdList.Clear;
  ClientAlphaList.Clear;
  ClientStandardList.Clear;
  ClientRestHourList.Clear;
end;

procedure TCounselingDialogframe.cmbItemTypeChange(Sender: TObject);
begin
  inherited;
  case cmbItemType.ItemIndex of
    0: begin
      gbCounseling.Visible := True;
      gbPackage.Visible := False;
      gbCounseling.Align := alClient;
      Self.Height := 364;
    end;
    1: begin
      gbCounseling.Visible := True;
      gbPackage.Visible := False;
      gbCounseling.Align := alClient;
      Self.Height := 364;
    end;
    2: begin
      gbCounseling.Visible := False;
      gbPackage.Visible := True;
      gbPackage.Align := alClient;
      Self.Height := 241;
    end;
  end;
end;

procedure TCounselingDialogframe.cmbPackageTypeChange(Sender: TObject);
begin
  inherited;
  case cmbPackageType.ItemIndex of
    ptAlpha   : edtPackageAmount.Text := cmbPackageAmount[ptAlpha];
    ptStandard: edtPackageAmount.Text := cmbPackageAmount[ptStandard];
  end;
end;

constructor TCounselingDialogframe.Create(AOwner: TComponent;
  Accessor: TMySQLAccessor);
begin
  inherited;
  ClientIdList := TStringList.Create;
  ClientPkgBillIdList := TStringList.Create;
  ClientAlphaList := TStringList.Create;
  ClientStandardList := TStringList.Create;
  ClientRestHourList := TStringList.Create;
end;

function TCounselingDialogframe.createInsertBRForCounselingSQL(clientId: Int64;billId: Int64; hour: Double; packageFlg: Integer): String;
  function _String(str: String; isLast: Boolean = False): String;
  var comma: String;
  begin
    case isLast of
      True: comma := '';
      False: comma := ',';
    end;
    result := '''' + str + '''' + comma;
  end;
var sl: TStringList;
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
    Add('CURRENT_HOUR)');
    Add('VALUES(');
    Add(IntToStr(clientId) + ',');
    Add(IntToStr(billId) + ',');
    Add(_String(FormatDateTime('yyyy/mm/dd',edtCounselingDate.Date)));
    //Counseling
    if cmbCounselingType.ItemIndex <> ctSeminar then amt := StrToInt64Def(edtCounselingAmount.Text,0)
    //Seminar
    else if packageFlg = 1 then amt := Trunc(StrToInt64Def(edtCounselingAmount.Text,0)/2)
                           else amt := StrToInt64Def(edtCounselingAmount.Text,0);
    Add(_String(IntToStr(amt)));
    Add('1,');
    Add(_String(memoCounseling.Lines.Text));
    Add('SYSDATE(),');
    Add(FloatToStr(hour) + ',');
    Add(FloatToStr(hour));
    Add(')');
    result := Text;
    memoNextAction.Text := Text;
  end;
  sl.Free;
end;

function TCounselingDialogframe.createInsertBRForPackageSQL: String;
  function _String(str: String; isLast: Boolean = False): String;
  var comma: String;
  begin
    case isLast of
      True: comma := '';
      False: comma := ',';
    end;
    result := '''' + str + '''' + comma;
  end;
var sl: TStringList;
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
    Add('CURRENT_HOUR)');
    Add('VALUES(');
    Add(ClientIdList[0] + ',');
    Add(IntToStr(getCurrentBillId(StrToInt64def(ClientIdList[0],-1)) + 1) + ',');
    Add(_String(FormatDateTime('yyyy/mm/dd',edtBookDate.Date)));
    Add(_String(edtPackageAmount.Text));
    Add(cmbPackageBillType[cmbPackageType.ItemIndex] + ',');
    Add(_String(memoBilling.Lines.Text));
    Add('SYSDATE(),');
    Add(cmbPackageTotalHour[cmbPackageType.ItemIndex] + ',');
    Add('0');
    Add(')');
    result := Text;
  end;
  sl.Free;
end;

function TCounselingDialogframe.createInsertCounselingSQL(clientId: Int64;billId: Int64): String;
  function _String(str: String; isLast: Boolean = False): String;
  var comma: String;
  begin
    case isLast of
      True: comma := '';
      False: comma := ',';
    end;
    result := '''' + str + '''' + comma;
  end;
var sl: TStringList;
begin
  sl := TStringList.Create;
  With sl do begin
    Add('INSERT INTO COUNSELING');
    Add('(CLIENT_ID,');
    Add('SEQ,');
    Add('BILL_ID,');
    Add('COUNSELING_TYPE,');
    Add('HOURS,');
    Add('COUNSELING_DATE,');
    Add('START_TIME,');
    Add('END_TIME,');
    Add('CONTENT_TYPE,');
    Add('MEMO,');
    Add('NEXT_ACTION,');
    Add('APP_STATUS)');
    Add('VALUES(');
    Add(ClientIdList[0] + ',');
    Add(IntToStr(getCurrentSEQ(StrToInt64def(ClientIdList[0],-1)) + 1) + ',');
    Add(IntToStr(billId) + ',');
    Add(cmbCounselingTypeVal[cmbCounselingType.ItemIndex] + ',');
    Add(FloatToStr(calcCounselingHour) + ',');
    Add(_String(FormatDateTime('yyyy/mm/dd',edtCounselingDate.Date)));
    Add(_String(FormatDateTime('hh:mm',edtStartTime.Time)));
    Add(_String(FormatDateTime('hh:mm',edtEndTime.Time)));
    Add(_String(edtContentType.Text));
    Add(_String(memoCounseling.Lines.Text));
    Add(_String(memoNextAction.Lines.Text));
    Add('null');
    Add(')');
    result := Text;
  end;
  sl.Free;
end;

function TCounselingDialogframe.createUpdateBRForCounselingSQL(clientId,
  billId: Int64; hour: Double; alphaFlg: Integer): String;
var i: Integer;
begin
  if alphaFlg = 1 then   result := 'UPDATE BILLING_REQUEST SET TOTAL_HOUR = TOTAL_HOUR + ' + FloatToStr(hour) +', CURRENT_HOUR = CURRENT_HOUR + ' + FloatToStr(hour) + ' WHERE CLIENT_ID = ' + IntToStr(clientId) + ' AND BILL_ID = ' + IntToStr(billId);
  result := 'UPDATE BILLING_REQUEST SET CURRENT_HOUR = CURRENT_HOUR + ' + FloatToStr(hour) + ' WHERE CLIENT_ID = ' + IntToStr(clientId) + ' AND BILL_ID = ' + IntToStr(billId);
end;

function TCounselingDialogframe.createUpdateClForPackageSQL(clientId: Int64; ptDiv: Integer): String;
var strFlg: String;
begin
  case ptDiv of
    ptAlpha: strFlg := 'ALPHA_FLG';
    ptStandard: strFlg := 'STANDARD_FLG';
  end;
  result := 'UPDATE CLIENT SET '+ strFlg + ' = 1 WHERE CLIENT_ID = ' + IntToStr(clientId);
end;

procedure TCounselingDialogframe.edtCounselingDateChange(Sender: TObject);
begin
  inherited;
  setCounselingAmount(StrToInt64Def(ClientIdList[0],-1));
end;

procedure TCounselingDialogframe.edtEndTimeChange(Sender: TObject);
begin
  inherited;
  if edtStartTime.Time > edtEndTime.Time then edtStartTime.Time := edtEndTime.Time;
  setCounselingAmount(StrToInt64Def(ClientIdList[0],-1));
end;

procedure TCounselingDialogframe.edtStartTimeChange(Sender: TObject);
begin
  inherited;
  if edtStartTime.Time > edtEndTime.Time then edtEndTime.Time := edtStartTime.Time;
  setCounselingAmount(StrToInt64Def(ClientIdList[0],-1));
end;

procedure TCounselingDialogframe.FormShow(Sender: TObject);
begin
  inherited;
  cmbItemTypeChange(Self);
end;

function TCounselingDialogframe.getCurrentBillId(clientId: Int64): Int64;
begin
  result := 0;
  try
    loadQuery('SELECT MAX(BILL_ID) FROM BILLING_REQUEST WHERE CLIENT_ID = ' + IntToStr(clientId));
    result := CDataSet.Fields[0].AsInteger;
  except
    result := -1;
  end;
end;

function TCounselingDialogframe.getCurrentSEQ(clientId: Int64): Int64;
begin
  result := 0;
  try
    loadQuery('SELECT MAX(SEQ) FROM COUNSELING WHERE CLIENT_ID = ' + IntToStr(clientId));
    result := CDataSet.Fields[0].AsInteger;
  except
    result := -1;
  end;
end;

procedure TCounselingDialogframe.initialize(OpenMode: TOpenMode);
begin
  m_OpenMode := OpenMode;
  edtCounselingDate.DateTime := Now;
  edtBookDate.DateTime := Now;
  case m_OpenMode of
    omNew: initializeNew;//êVãKçÏê¨
    omModify: initializeModify;//ïœçX
  end;
end;

procedure TCounselingDialogframe.initializeModify;
begin
  cmbItemType.Enabled := False;
end;

procedure TCounselingDialogframe.initializeNew;
begin
  cmbItemType.Enabled := True;
  btnOK.Caption := 'Book';
end;

function TCounselingDialogframe.insertNew: Boolean;
begin
  case cmbItemType.ItemIndex of
    itCounseling: result := bookCounseling;
    itSeminar: result := bookCounseling;
    itPackage: result := bookPackage;
  end;
end;

procedure TCounselingDialogframe.setCounselingAmount(clientId: Int64);
begin
  if clientId <=0 then edtCounselingAmount.Text := '0';
  edtCounselingAmount.Text := IntToStr(calcCounselingFee);
end;

function TCounselingDialogframe.updateExisting: Boolean;
begin
  //
end;

end.
