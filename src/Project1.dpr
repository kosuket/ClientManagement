program Project1;

uses
  Vcl.Forms,
  frmMain in 'frmMain.pas' {Mainframe},
  LogInFrm in 'LogInFrm.pas' {LogInFrame},
  frmMaster in 'frmMaster.pas' {MasterFrame},
  frmClient in 'frmClient.pas' {Clientframe},
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
  frmCounseling in 'frmCounseling.pas' {Counselingframe},
  frmCounselingDlg in 'frmCounselingDlg.pas' {CounselingDialogframe},
  frmReceipt in 'frmReceipt.pas' {Receiptframe},
  frmReceiptDlg in 'frmReceiptDlg.pas' {ReceiptDialogframe},
  ClientInserter in 'Dao\ClientInserter.pas',
  Client in 'Data\Client.pas',
  ClientGmat in 'Data\ClientGmat.pas',
  ClientToefl in 'Data\ClientToefl.pas',
  DBImportableData in 'Data\DBImportableData.pas',
  MasterLoader in 'Master\Loader\MasterLoader.pas',
  LoadOperator in 'Master\Loader\LoadOperator.pas',
  ClientLoadOperator in 'Master\ClientLoader\ClientLoadOperator.pas',
  LoadColumn in 'Master\Loader\LoadColumn.pas',
  LoadColumns in 'Master\Loader\LoadColumns.pas',
  ClientLoadColumns in 'Master\ClientLoader\ClientLoadColumns.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TMainframe, Mainframe);
  Application.CreateForm(TReceiptframe, Receiptframe);
  Application.CreateForm(TReceiptDialogframe, ReceiptDialogframe);
  Application.Run;
end.
