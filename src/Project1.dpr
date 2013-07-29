program Project1;

uses
  Vcl.Forms,
  frmMain in 'frmMain.pas' {Mainframe},
  LogInFrm in 'LogInFrm.pas' {LogInFrame},
  frmMaster in 'frmMaster.pas' {MasterFrame},
  frmClientSearch in 'frmClientSearch.pas' {ClientSearchframe},
  FWGridBasefrm in 'FWGridBasefrm.pas' {FWGridBaseframe},
  frmBilling in 'frmBilling.pas' {Billingframe},
  frmClientdlg in 'frmClientdlg.pas' {frmClientCarteDlg},
  FWSQLBaseDlgfrm in 'FWSQLBaseDlgfrm.pas' {FWSQLBaseDialogframe},
  frmMaildlg in 'frmMaildlg.pas' {MailDlgframe},
  frmMailSetting in 'frmMailSetting.pas' {MailSettingframe},
  DBEditorMainFrm in '..\External\DatabaseEditor\Src\DBEditorMainFrm.pas' {FrmDBEditorMain},
  DBGridBaseFrm in '..\External\DatabaseEditor\Src\DBGridBaseFrm.pas' {FrmDBGridBase},
  MySQLAccessor in '..\External\Utils\DBAccess\MySQLAccessor.pas',
  CsvOutput in '..\External\CsvOperation\Src\CsvOutput.pas',
  CsvOpUtils in '..\External\CsvOperation\Src\CsvOpUtils.pas',
  CsvLoader in '..\External\CsvOperation\Src\CsvLoader.pas',
  DBEditFrm in '..\External\DatabaseEditor\Src\DBEditFrm.pas' {FrmDBEdit},
  TableListFrm in '..\External\DatabaseEditor\Src\TableListFrm.pas' {FrmTableList},
  frmBillingDlg in 'frmBillingDlg.pas' {BillingDialogframe},
  frmCounseling in 'frmCounseling.pas' {Counselingframe};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TMainframe, Mainframe);
  Application.Run;
end.
