unit frmMailSetting;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Mask, Vcl.Samples.Spin,
  Vcl.StdCtrls, Vcl.ExtCtrls;

type
  TMailSettingframe = class(TForm)
    pnlMain: TPanel;
    lblHost: TLabel;
    edtHostName: TEdit;
    lblPort: TLabel;
    lblMailFrom: TLabel;
    edtMailFrom: TEdit;
    lblUserName: TLabel;
    edtUserName: TEdit;
    lblPassword: TLabel;
    edtPort: TSpinEdit;
    edtPassword: TMaskEdit;
    btnOK: TButton;
    btnCancel: TButton;
    procedure btnOKClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure initialize;
  end;

var
  MailSettingframe: TMailSettingframe;

implementation
uses frmMain;

{$R *.dfm}

procedure TMailSettingframe.btnOKClick(Sender: TObject);
begin
  Mainframe.g_MailHost := edtHostName.Text;
  Mainframe.g_MailPort := edtPort.Value;
  Mainframe.g_MailFrom := edtMailFrom.Text;
  Mainframe.g_MailUserName := edtUserName.Text;
  Mainframe.g_MailPassword := edtPassword.Text;
end;

procedure TMailSettingframe.initialize;
begin
  edtHostName.Text := Mainframe.g_MailHost;
  edtPort.Value := Mainframe.g_MailPort;
  edtMailFrom.Text := Mainframe.g_MailFrom;
  edtUserName.Text := Mainframe.g_MailUserName;
  edtPassword.Text := Mainframe.g_MailPassword;
end;

end.
