unit frmMaildlg;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, FWSQLBaseDlgfrm, Data.FMTBcd,
  IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient,
  IdExplicitTLSClientServerBase, IdMessageClient, IdSMTPBase, IdSMTP,
  Vcl.StdCtrls, Vcl.ComCtrls, Vcl.ExtCtrls, Vcl.Grids, Vcl.Buttons, Data.DB,
  Data.SqlExpr, IdMessage, IdSSLOpenSSL;

type
  TMailDlgframe = class(TFWSQLBaseDialogframe)
    btnSend: TSpeedButton;
    pnlAddress: TPanel;
    sgRecepient: TStringGrid;
    Splitter1: TSplitter;
    pnlContents: TPanel;
    pnlSubject: TPanel;
    lblSubject: TLabel;
    edtSubject: TEdit;
    pnlContentsTitle: TPanel;
    memoContents: TRichEdit;
    IdSMTP1: TIdSMTP;
    IdMessage1: TIdMessage;
    procedure btnSendClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    mailTo: String;
    procedure setRecepient(sl:TStringList);
    function checkConnection: Boolean;
  end;

var
  MailDlgframe: TMailDlgframe;

implementation
uses frmMain;

{$R *.dfm}

procedure TMailDlgframe.btnSendClick(Sender: TObject);
var
  subject, body: string;
  msg: TIdMessage;
  IdSMTP: TIdSMTP;
  SSL: TIdSSLIOHandlerSocketOpenSSL;
begin
  inherited;
  if MessageDlg('Send This Message?',mtConfirmation,[mbYes,mbNo],0,mbYes) <> mrYes then exit;
  IdSMTP := TIdSMTP.Create(nil);
  IdSMTP.Port      := Mainframe.g_MailPort;  //OPB25
  IdSMTP.Host      := Mainframe.g_MailHost;
  IdSMTP.Username  := Mainframe.g_MailUserName;
  IdSMTP.Password  := Mainframe.g_MailPassword;

  subject := edtSubject.Text;
  mailTo  := sgRecepient.Cols[1].CommaText;

  body    := memoContents.Lines.Text;

  msg := TIdMessage.Create(IdSmtp);
  SSL := TIdSSLIOHandlerSocketOpenSSL.Create;
  try
    SSL.Host := IdSMTP.Host;
    SSL.Port := IdSMTP.Port;
    SSL.Destination := SSL.Host + ':' + IntToStr(SSL.Port);
    IdSMTP.IOHandler := SSL;
    IdSMTP.UseTLS := utUseExplicitTLS;
    IdSmtp.Connect;
    msg.Subject := subject;
    msg.Recipients.EMailAddresses := mailto;
    msg.From.Text := Mainframe.g_MailFrom;
    msg.Body.Text := body;
    msg.ContentType := 'text/plain';
    IdSmtp.Send(msg);
    IdSmtp.Disconnect ;
    ShowMessage('Message Sent');
    ModalResult := mrOK;
  finally
    msg.Free;
    SSL.Free;
    IdSMTP.Free;
  end;
end;

function TMailDlgframe.checkConnection: Boolean;
var   IdSMTP: TIdSMTP;
  SSL: TIdSSLIOHandlerSocketOpenSSL;
begin
  result := False;
  IdSMTP := TIdSMTP.Create(nil);
  IdSMTP.Port      := Mainframe.g_MailPort;  //OPB25
  IdSMTP.Host      := Mainframe.g_MailHost;
  IdSMTP.Username  := Mainframe.g_MailUserName;
  IdSMTP.Password  := Mainframe.g_MailPassword;
  SSL := TIdSSLIOHandlerSocketOpenSSL.Create;
  try
    SSL.Host := IdSMTP.Host;
    SSL.Port := IdSMTP.Port;
    SSL.Destination := SSL.Host + ':' + IntToStr(SSL.Port);
    IdSMTP.IOHandler := SSL;
    IdSMTP.UseTLS := utUseExplicitTLS;
    IdSmtp.Connect;
    IdSmtp.Disconnect;
    result := True
  except
    on E: Exception do begin
      MessageDlg('Cannot Connect to Mail Server' + #13#10
                 + 'Please Review Mail Setting and Internet Connection' + #13#10
                 + E.Message ,mtError,[mbOK],0,mbOK);
      result := False;
    end;
  end;
end;

procedure TMailDlgframe.setRecepient(sl:TStringList);
var i:Integer;
begin
  sgRecepient.RowCount := sl.Count;
  for i := 0 to sl.Count -1 do begin
    sgRecepient.Cells[1,i] := sl[i];
  end;
end;

end.
