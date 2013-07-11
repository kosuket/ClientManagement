program Project1;

uses
  Vcl.Forms,
  frmMain in 'frmMain.pas' {Mainframe},
  LogInFrm in 'LogInFrm.pas' {LogInFrame},
  frmMaster in 'frmMaster.pas' {MasterFrame},
  frmClientSearch in 'frmClientSearch.pas' {ClientSearchframe},
  FWGridBasefrm in 'FWGridBasefrm.pas' {FWGridBaseframe},
  frmAccounting in 'frmAccounting.pas' {Accountingframe},
  frmClientdlg in 'frmClientdlg.pas' {frmClientCarteDlg},
  FWSQLBaseDlgfrm in 'FWSQLBaseDlgfrm.pas' {FWSQLBaseDialogframe},
  frmMaildlg in 'frmMaildlg.pas' {MailDlgframe},
  frmMailSetting in 'frmMailSetting.pas' {MailSettingframe};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TMainframe, Mainframe);
  Application.CreateForm(TMailDlgframe, MailDlgframe);
  Application.CreateForm(TMailSettingframe, MailSettingframe);
  Application.Run;
end.
