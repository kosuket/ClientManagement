unit frmCounselingDlg;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, FWSQLBaseDlgfrm, Data.FMTBcd, Data.DB,
  Data.SqlExpr, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.ComCtrls, MySQLAccessor, frmClientSearch;

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
    edtCounselingDateDate: TDateTimePicker;
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
    edtAmount: TEdit;
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
  private
    { Private declarations }
    m_OpenMode: TOpenMode;
    procedure initializeNew;
    procedure initializeModify;
    function insertNew: Boolean;
    function updateExisting: Boolean;
    function bookCounseling: Boolean;
    function bookPackage: Boolean;
  public
    { Public declarations }
    frmSearchClient: TClientSearchframe;
    ClientIdList: TStringList;
    constructor Create(AOwner: TComponent; Accessor: TMySQLAccessor); reintroduce; overload; override;
    procedure initialize(OpenMode:TOpenMode);
  end;

var
  CounselingDialogframe: TCounselingDialogframe;
const
  itCounseling = 0;
  itSeminar =  1;
  itPackage = 2;
implementation

{$R *.dfm}

{ TCounselingDialogframe }

function TCounselingDialogframe.bookCounseling: Boolean;
  function _bookIndividual(clienId: Int64): Boolean;
  begin
    //Check
    //Insert Counseling
    //Insert Billing Request if neccesary
  end;
var i: Integer;
    b: Boolean;
begin
  b := True;
  for i := 0 to ClientIdList.Count -1 do if not _bookIndividual(StrToInt64Def(ClientIdList[i],-1)) then b := False;
  if b then //commit
       else; //rollback
  result := b;
end;

function TCounselingDialogframe.bookPackage: Boolean;
begin
  //Check
  //Insert Billing Request
  //Update Client if neccesary
end;

procedure TCounselingDialogframe.btnClientClick(Sender: TObject);
begin
  inherited;
  frmSearchClient := TClientSearchframe.Create(Self,Accessor);
  try
    if frmSearchClient.ShowModal = mrOk then begin
      ClientIdList.Clear;
      ClientIdList.Add(IntToStr(frmSearchClient.g_SelectedClientId));
      lblClient.Caption := frmSearchClient.g_SelectedFirstName + ' ' + frmSearchClient.g_SelectedLastName;
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
  end;
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

constructor TCounselingDialogframe.Create(AOwner: TComponent;
  Accessor: TMySQLAccessor);
begin
  inherited;
  ClientIdList := TStringList.Create;
end;

procedure TCounselingDialogframe.FormShow(Sender: TObject);
begin
  inherited;
  cmbItemTypeChange(Self);
end;

procedure TCounselingDialogframe.initialize(OpenMode: TOpenMode);
begin
  m_OpenMode := OpenMode;
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

function TCounselingDialogframe.updateExisting: Boolean;
begin
  //
end;

end.
