unit frmMaildlg;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, FWSQLBaseDlgfrm, Data.FMTBcd,
  IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient,
  IdExplicitTLSClientServerBase, IdMessageClient, IdSMTPBase, IdSMTP,
  Vcl.StdCtrls, Vcl.ComCtrls, Vcl.ExtCtrls, Vcl.Grids, Vcl.Buttons, Data.DB,
  Data.SqlExpr, IdMessage, IdSSLOpenSSL, IdAttachmentFile, MySQLAccessor,
  Vcl.Menus;

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
    memoContents: TRichEdit;
    IdSMTP1: TIdSMTP;
    IdMessage1: TIdMessage;
    OpenDialog1: TOpenDialog;
    pnlAttachment: TPanel;
    btnAttach: TSpeedButton;
    lbAttachment: TListBox;
    PopupMenu1: TPopupMenu;
    pmDeleteAttachment: TMenuItem;
    lblAttatch: TLabel;
    ProgressBar1: TProgressBar;
    procedure btnSendClick(Sender: TObject);
    procedure sgRecepientSetEditText(Sender: TObject; ACol, ARow: Integer;
      const Value: string);
    procedure btnAttachClick(Sender: TObject);
    procedure lbAttachmentKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure pmDeleteAttachmentClick(Sender: TObject);
  private
    { Private declarations }
    slAttachment: TStringList;
    procedure cleanAttachFolder;
    procedure deleteAttachment;
  public
    { Public declarations }
    mailTo: String;
    constructor create(AOwner:TComponent; Accessor: TMySQLAccessor); reintroduce; overload; override;
    destructor Destroy; override;
    procedure setRecepient(slR:TStringList;slA:TStringList);
    function checkConnection: Boolean;
    function sendMail: Boolean;
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
  i: Integer;
begin
  inherited;
  if MessageDlg('Send This Message?',mtConfirmation,[mbYes,mbNo],0,mbYes) <> mrYes then exit;
   if sendMail then begin
     ShowMessage('Message Sent');
     ModalResult := mrOK;
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

procedure TMailDlgframe.cleanAttachFolder;
var
  Rec: TSearchRec;
begin
  //指定ディレクトリのすべての種類のファイルを列挙
  if FindFirst('Attach\' + '*.*', faAnyFile, Rec) = 0 then
  try
    repeat
      //フォルダやカレントディレクトリや親ディレクトリは対象外
      if not((Rec.Attr and faDirectory > 0)) and
             (Rec.Name <> '.') and (Rec.Name <> '..') then begin
      DeleteFile('Attach\' + Rec.Name);
      end;
    until (FindNext(Rec) <> 0);
  finally
    FindClose(Rec);
  end;
end;

constructor TMailDlgframe.create(AOwner: TComponent; Accessor: TMySQLAccessor);
begin
  inherited;
  slAttachment := TStringList.Create;
  cleanAttachFolder;
end;

procedure TMailDlgframe.deleteAttachment;
begin
  if lbAttachment.Items.Count > 0 then begin
    if lbAttachment.ItemIndex = -1 then begin
      ShowMessage('File Not Selected');
      exit;
    end;
    if MessageDlg('Detach the file ' + '''' + lbAttachment.Items[lbAttachment.ItemIndex] + '''' + '?',mtConfirmation,[mbYes,mbNo],0,mbYes) <> mrYes then exit;
    DeleteFile('Attach\' + lbAttachment.Items[lbAttachment.ItemIndex]);
    lbAttachment.Items.Delete(lbAttachment.ItemIndex);
  end;
  if lbAttachment.Items.Count = 0 then pmDeleteAttachment.Enabled := False;
end;

destructor TMailDlgframe.Destroy;
begin
  cleanAttachFolder;
  inherited;
end;

procedure TMailDlgframe.lbAttachmentKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if (Key = VK_BACK) OR (Key = VK_DELETE) then begin
    deleteAttachment;
  end;
end;

procedure TMailDlgframe.pmDeleteAttachmentClick(Sender: TObject);
begin
  inherited;
  deleteAttachment;
end;

function TMailDlgframe.sendMail: Boolean;
var
  subject, body: string;
  msg: TIdMessage;
  IdSMTP: TIdSMTP;
  SSL: TIdSSLIOHandlerSocketOpenSSL;
  i: Integer;
begin
  result := False;
  progressbar1.Visible := True;
  IdSMTP := TIdSMTP.Create(nil);
  IdSMTP.Port      := Mainframe.g_MailPort;  //OPB25
  IdSMTP.Host      := Mainframe.g_MailHost;
  IdSMTP.Username  := Mainframe.g_MailUserName;
  IdSMTP.Password  := Mainframe.g_MailPassword;
  progressbar1.Position := 10;
  subject := edtSubject.Text;
  mailTo  := sgRecepient.Cols[1].CommaText;
  progressbar1.Position := 20;
  body    := memoContents.Lines.Text;

  msg := TIdMessage.Create(IdSmtp);
  SSL := TIdSSLIOHandlerSocketOpenSSL.Create;
  progressbar1.Position := 30;
  try
    SSL.Host := IdSMTP.Host;
    SSL.Port := IdSMTP.Port;
    SSL.Destination := SSL.Host + ':' + IntToStr(SSL.Port);
    IdSMTP.IOHandler := SSL;
    IdSMTP.UseTLS := utUseExplicitTLS;
    progressbar1.Position := 40;
    IdSmtp.Connect;
    progressbar1.Position := 50;
    msg.Subject := subject;
    msg.Recipients.EMailAddresses := mailto;
    msg.From.Text := Mainframe.g_MailFrom;
    msg.Body.Text := body;
    msg.ContentType := 'multipart/mixed';
    for i  := 0 to lbAttachment.Items.Count -1 do TIdAttachmentFile.Create(Msg.MessageParts, lbAttachment.Items[i]).FileIsTempFile := True;
    progressbar1.Position := 60;
    IdSmtp.Send(msg);
    progressbar1.Position := 80;
    IdSmtp.Disconnect ;
    progressbar1.Position := 100;
    result := True;
  finally
    msg.Free;
    SSL.Free;
    IdSMTP.Free;
    progressbar1.Visible := False;
  end;
end;

procedure TMailDlgframe.setRecepient(slR:TStringList;slA:TStringList);
var i:Integer;
begin
  sgRecepient.RowCount := slR.Count;
  for i := 0 to slR.Count -1 do begin
    sgRecepient.Cells[0,i] := slR[i];
    sgRecepient.Cells[1,i] := slA[i];
  end;
end;

procedure TMailDlgframe.sgRecepientSetEditText(Sender: TObject; ACol,
  ARow: Integer; const Value: string);
begin
  inherited;
  //if ACol = 1 then sgRecepient.Cells[0,ARow] := '';
end;

procedure TMailDlgframe.btnAttachClick(Sender: TObject);
var str : String;
    i: Integer;
begin
  inherited;
  str := '';
  if OpenDialog1.Execute then begin
    for i := 0 to slAttachment.Count -1 do begin
      if OpenDialog1.FileName = slAttachment[i] then begin
        ShowMessage('File Already Attached');
        exit;
      end;
    end;
    CopyFile(PChar(OpenDialog1.FileName),PChar('Attach\' + ExtractFileName(OpenDialog1.FileName)),False);
    lbAttachment.Items.Add(ExtractFileName(OpenDialog1.FileName));
    pmDeleteAttachment.Enabled := True;
  end;
end;

end.
