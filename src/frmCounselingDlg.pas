unit frmCounselingDlg;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, FWSQLBaseDlgfrm, Data.FMTBcd, Data.DB,
  Data.SqlExpr, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.ComCtrls, MySQLAccessor;

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
  private
    { Private declarations }
    procedure initializeNew;
    procedure initializeModify;
  public
    { Public declarations }
    constructor Create(AOwner: TComponent; Accessor: TMySQLAccessor); reintroduce; overload; override;
    procedure initialize(OpenMode:TOpenMode);
  end;

var
  CounselingDialogframe: TCounselingDialogframe;

implementation

{$R *.dfm}

{ TCounselingDialogframe }

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
end;

procedure TCounselingDialogframe.FormShow(Sender: TObject);
begin
  inherited;
  cmbItemTypeChange(Self);
end;

procedure TCounselingDialogframe.initialize(OpenMode: TOpenMode);
begin
  case OpenMode of
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
end;

end.
