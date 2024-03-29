unit LogInFrm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Mask, Vcl.StdCtrls, Vcl.Buttons,
  Data.DBXMySQL, Data.DB, Data.SqlExpr, Vcl.ExtCtrls, Vcl.Imaging.GIFImg;

type
  TLogInFrame = class(TForm)
    SQLConnection1: TSQLConnection;
    pnlBase: TPanel;
    pnlTop: TPanel;
    pnlBottom: TPanel;
    btnOK: TSpeedButton;
    btnCancel: TSpeedButton;
    lblUser: TLabel;
    lblPassword: TLabel;
    edtUserName: TEdit;
    edtPassword: TMaskEdit;
    lbldeveloper: TLabel;
    Image1: TImage;
    procedure btnCancelClick(Sender: TObject);
    procedure btnOKClick(Sender: TObject);
    procedure SQLConnection1Login(Database: TSQLConnection;
      LoginParams: TStrings);
    procedure edtPasswordKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
    procedure loadFromFile;
  public
    { Public declarations }
    constructor Create(AOwner: TComponent) ; override;
  end;

var
  LogInFrame: TLogInFrame;

implementation
uses frmMain;
{$R *.dfm}

procedure TLogInFrame.btnOKClick(Sender: TObject);
var strList: TStrings;
begin
  strList := TStringList.Create;
  Mainframe.g_Username := edtUserName.Text;
  Mainframe.g_Password := edtPassword.Text;
  SQLConnection1Login(SQLConnection1,strList);
  try
  SQLConnection1.Open;
  Mainframe.SQLConnection1 := SQLConnection1;
  ModalResult := mrOk;
  except
    //ShowMessage('Log In Failed');
    on E: Exception do begin
      Showmessage(E.Message + ':' + E.StackTrace);
      ModalResult := mrNone;
    end;
  end;
end;

constructor TLogInFrame.Create(AOwner: TComponent);
begin
  inherited;
  loadFromFile;
end;

procedure TLogInFrame.edtPasswordKeyPress(Sender: TObject; var Key: Char);
begin
  if Ord(Key) = VK_RETURN then btnOKClick(Self);
end;

procedure TLogInFrame.loadFromFile;
var
  reader: TStreamReader;
  line: String;
begin
  // ファイルの読み込み準備。文字コードはOSのデフォルト
  reader := TStreamReader.Create('dbini.ini', TEncoding.Default);
  // ファイルの終端に到達したか
  while not reader.EndOfStream do
  begin
    // ファイルから一行読み込む
    line := reader.ReadLine;
    // 何らかの処理を行う
    if Copy(line,1,1) = '#' then Continue;

    if LowerCase(Copy(line,1,8))='database' then Mainframe.g_Database := Copy(line,10,line.Length - 9);
    if LowerCase(Copy(line,1,10))='schemaname' then Mainframe.g_SchemaName := Copy(line,12,line.Length - 11);
    if LowerCase(Copy(line,1,8))='hostname' then Mainframe.g_HostName := Copy(line,10,line.Length - 9);
    if Lowercase(Trim(line))='debug_flg=1' then Mainframe.g_DebugMode := True;
    //Mail関係
    if LowerCase(Copy(line,1,8)) = 'mailhost' then Mainframe.g_MailHost := Copy(line,10,line.Length - 9);
    if LowerCase(Copy(line,1,8)) = 'mailport' then Mainframe.g_MailPort := StrToIntDef(Copy(line,10,line.Length - 9),0);
    if LowerCase(Copy(line,1,12)) = 'mailusername' then Mainframe.g_MailUserName := Copy(line,14,line.Length - 13);
    if LowerCase(Copy(line,1,12)) = 'mailpassword' then Mainframe.g_MailPassword := Copy(line,14,line.Length - 13);
    if LowerCase(Copy(line,1,8)) = 'mailfrom' then Mainframe.g_MailFrom := Copy(line,10,line.Length - 9);
    if LowerCase(Copy(line,1,8)) = 'mailname' then Mainframe.g_MailName := Copy(line,10,line.Length - 9);
    if Lowercase(Trim(line))='mailbcc=1' then Mainframe.g_MailBCC := True;
  end;
  reader.Free;
end;

procedure TLogInFrame.SQLConnection1Login(Database: TSQLConnection;
  LoginParams: TStrings);
var strList: TStrings;
    i: Integer;
begin
  //ソースの内部実装がわからないためLoginParamsとSQLConnection1.Paramsの両方を変更する
  strList := TStringList.Create;
  strList.Add('Password=' + edtPassword.Text);
  strList.Add('User_Name=' + edtUserName.Text);
  strList.Add('Database=' + Mainframe.g_Database);
  LoginParams := strList;
  for i := 0 to SQLConnection1.Params.Count - 1 do begin
    if LowerCase(Copy(SQLConnection1.Params[i],1,8))='password' then begin
      SQLConnection1.Params[i] := 'Password=' + edtPassword.Text;
    end;
    if LowerCase(Copy(SQLConnection1.Params[i],1,9))='user_name' then begin
      SQLConnection1.Params[i] := 'User_Name=' + edtUserName.Text;
    end;
    if LowerCase(Copy(SQLConnection1.Params[i],1,8))='database' then begin
      SQLConnection1.Params[i] := 'Database=' + Mainframe.g_Database;
    end;if LowerCase(Copy(SQLConnection1.Params[i],1,8))='hostname' then begin
      SQLConnection1.Params[i] := 'HostName=' + Mainframe.g_HostName;
    end;

  end;
  inherited;
end;

procedure TLogInFrame.btnCancelClick(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

end.
