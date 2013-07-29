unit frmMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Data.DBXMySQL, Data.DB,
  Data.SqlExpr, Data.FMTBcd, Vcl.Grids, Vcl.DBGrids, Vcl.DBCGrids, Vcl.ExtCtrls,
  Vcl.DBCtrls, Datasnap.Provider, Datasnap.DBClient, LogInFrm, Vcl.Buttons,
  Vcl.ComCtrls,frmClientSearch,frmBilling, frmMaster, Vcl.Menus, Vcl.ImgList,
  Vcl.Imaging.jpeg, frmMailSetting, DBEditorMainFrm, DBGridBaseFrm,
  Vcl.Imaging.pngimage, MySQLAccessor, frmCounseling;

type
  TMainframe = class(TForm)
    SQLQuery1: TSQLQuery;
    DataSource1: TDataSource;
    ClientDataSet1: TClientDataSet;
    DataSetProvider1: TDataSetProvider;
    pnlMenu: TPanel;
    Splitter1: TSplitter;
    pnlMain: TPanel;
    lblPnlTitle: TLabel;
    MainMenu1: TMainMenu;
    mmFile: TMenuItem;
    mmExit: TMenuItem;
    mmEdit: TMenuItem;
    mmOption: TMenuItem;
    ImageList1: TImageList;
    pnlClient: TPanel;
    imgClient: TImage;
    pnlBilling: TPanel;
    imgAccounting: TImage;
    pnlCustom: TPanel;
    imgCustom: TImage;
    mmMailSetting: TMenuItem;
    mmDebugMode: TMenuItem;
    pnlCounseling: TPanel;
    imgCounseling: TImage;
    procedure SQLConnection1Login(Database: TSQLConnection;
      LoginParams: TStrings);
    procedure pnlBillingMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure pnlBillingMouseEnter(Sender: TObject);
    procedure pnlBillingMouseLeave(Sender: TObject);
    procedure pnlBillingMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure pnlClientMouseEnter(Sender: TObject);
    procedure pnlClientMouseLeave(Sender: TObject);
    procedure pnlClientMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure pnlClientMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure pnlClientClick(Sender: TObject);
    procedure pnlBillingClick(Sender: TObject);
    procedure pnlCustomMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure pnlCustomMouseEnter(Sender: TObject);
    procedure pnlCustomMouseLeave(Sender: TObject);
    procedure pnlCustomMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure pnlCustomClick(Sender: TObject);
    procedure mmMailSettingClick(Sender: TObject);
    procedure mmDebugModeClick(Sender: TObject);
    procedure pnlCounselingMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure pnlCounselingMouseEnter(Sender: TObject);
    procedure pnlCounselingMouseLeave(Sender: TObject);
    procedure pnlCounselingMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure pnlCounselingClick(Sender: TObject);
  private
    { Private declarations }
    Accessor: TMySQLAccessor;
    frmClientSearch: TClientSearchframe;
    frmLogIn: TLogInFrame;
    frmCounselingSearch: TCounselingFrame;
    frmBillingSearch: TBillingFrame;
    frmMailSetting: TMailSettingFrame;
    frmDBEditor: TFrmDBEditorMain;
    procedure cleanPnlMain;
    //パネルをボタン風に動かすためのメソッドたち
    procedure behavePLBMouseUp(pnl: TPanel);
    procedure behavePLBMouseDown(pnl: TPanel);
    procedure behavePLBMouseEnter(pnl: TPanel;img:TImage);
    procedure behavePLBMouseLeave(pnl: TPanel;img:TImage);
    procedure behavePLBClick(pnl: TPanel;img:TImage);
    procedure initializeVariables;
    //Enable to change Debug Mode from Screen
    procedure reflectDebugMode(b:Boolean);
  public
    { Public declarations }
    SQLConnection1: TSQLConnection;
    g_Username: String;
    g_Password: String;
    g_Database: String;
    g_SchemaName: String;
    g_HostName: String;
    g_DebugMode: Boolean;
    g_MailHost: String;
    g_MailPort: Word;
    g_MailUserName: String;
    g_MailPassword: String;
    g_MailFrom: String;
    constructor Create(AOwner: TComponent) ; override;
    destructor Destroy; override;
  end;

var
  Mainframe: TMainframe;

implementation

{$R *.dfm}

procedure TMainframe.behavePLBClick(pnl: TPanel; img: TImage);
begin
  //Set Color
  pnlClient.Color := clWindow;
  pnlCounseling.Color := clWindow;
  pnlBilling.Color := clWindow;
  pnlCustom.Color := clWindow;
  pnl.Color := $00FFE2C4;

  //Set Font Style
  pnlClient.Font.Style := [];
  pnlCounseling.Font.Style := [];
  pnlBilling.Font.Style := [];
  pnlCustom.Font.Style := [];
  pnl.Font.Style := [fsBold,fsItalic];
  pnl.Font.Color := clBlack;
  pnl.BevelOuter := bvNone;
  img.Repaint;
end;

procedure TMainframe.behavePLBMouseDown(pnl: TPanel);
begin
  pnl.BevelOuter := bvLowered;
end;

procedure TMainframe.behavePLBMouseEnter(pnl: TPanel;img:TImage);
begin
  if pnl.Color = clWindow then pnl.Color := $00D8D1FE
  else if pnl.Color = $00FFE2C4 then pnl.Color := $00FEC5EB;
  pnl.Font.Color := clWindow;
  pnl.Repaint;
  img.Repaint;
end;

procedure TMainframe.behavePLBMouseLeave(pnl: TPanel; img: TImage);
begin
  if pnl.Color = $00D8D1FE then pnl.Color := clWindow
  else if pnl.Color = $00FEC5EB then pnl.Color := $00FFE2C4;

  pnl.Font.Color := clBlack;
  pnl.BevelOuter := bvNone;
  img.Repaint;
end;

procedure TMainframe.behavePLBMouseUp(pnl: TPanel);
begin
  pnl.BevelOuter := bvNone;
end;

procedure TMainframe.cleanPnlMain;
begin
  frmClientSearch.pnlBase.Visible := False;
  frmCounselingSearch.pnlBase.Visible := False;
  frmBillingSearch.pnlBase.Visible := False;
  frmDBEditor.Visible := False;
end;

constructor TMainframe.Create(AOwner: TComponent);
begin
  initializeVariables;
  frmLogIn := TLogInFrame.Create(Self);
  If frmLogIn.ShowModal = 1 then begin
    if not SQLConnection1.Connected then begin
      Self.Free;
      exit;
    end;
    inherited;
    SQLQuery1.SQLConnection := SQLConnection1;
  end else begin
    Self.Free;
    exit;
  end;
  Accessor := TMySQLAccessor.Create(g_HostName,g_UserName,g_Password,g_Database);
  mmDebugMode.Checked := g_DebugMode;
  //ClientSearch
  frmClientSearch := TClientSearchframe.Create(Self, Accessor);
  frmClientSearch.pnlBase.Parent := pnlMain;
  frmClientSearch.Initialize;
  frmClientSearch.pnlBase.Visible := False;
  frmClientSearch.m_DebugMode := g_DebugMode;

  //Counseling
  frmCounselingSearch := TCounselingframe.Create(Self,Accessor);
  frmCounselingSearch.pnlBase.Parent := pnlMain;
  frmCounselingSearch.Initialize;
  frmCounselingSearch.pnlBase.Visible := False;
  frmCounselingSearch.m_DebugMode := g_DebugMode;

  //AccountingSearch
  frmBillingSearch := TBillingFrame.Create(Self, Accessor);
  frmBillingSearch.pnlBase.Parent := pnlMain;
  frmBillingSearch.Initialize;
  frmBillingSearch.pnlBase.Visible := False;
  frmBillingSearch.m_DebugMode := g_DebugMode;

  //MasterSetting
  frmDBEditor := TFrmDBEditorMain.Create(Self, Accessor);
  frmDBEditor.Embed(pnlMain);
  frmDBEditor.Visible := False;

  //LastProc
  frmClientSearch.pnlBase.Visible := True;
  pnlClientMouseLeave(self);
  pnlCounselingMouseLeave(self);
  pnlBillingMouseLeave(self);
  pnlCustomMouseLeave(Self);
  pnlClientClick(Self);
end;

destructor TMainframe.Destroy;
var writer: TStreamWriter;
begin
  //FileSave
  writer := TStreamWriter.Create('dbini.ini');
  if Length(g_Database) > 0 then writer.WriteLine('Database='+g_Database);
  if Length(g_HostName) > 0 then writer.WriteLine('HostName='+g_HostName);
  if Length(g_SchemaName) > 0 then writer.WriteLine('SchemeName='+g_SchemaName);
  if g_DebugMode then writer.WriteLine('Debug_flg=1')
                 else writer.WriteLine('Debug_flg=0');
  if Length(g_MailHost) > 0 then writer.WriteLine('MailHost='+g_MailHost);
  if g_MailPort > 0 then writer.WriteLine('MailPort='+IntToStr(g_MailPort));
  if Length(g_MailFrom) > 0 then writer.WriteLine('MailFrom='+g_MailFrom);
  if Length(g_MailUserName) > 0 then writer.WriteLine('MailUserName='+g_MailUserName);
  if Length(g_MailPassword) > 0 then writer.WriteLine('MailPassword='+g_MailPassword);
  writer.Free;

  // Release child frames
  if Assigned(frmDBEditor) then frmDBEditor.Release;
  if Assigned(frmBillingSearch) then frmBillingSearch.Release;
  if Assigned(frmClientSearch) then frmClientSearch.Release;
  inherited;
end;

procedure TMainframe.initializeVariables;
begin
  g_Username := '';
  g_Password := '';
  g_Database := '';
  g_SchemaName := '';
  g_HostName := '';
  g_DebugMode := False;
  g_MailHost := '';
  g_MailPort := 0;
  g_MailUserName := '';
  g_MailPassword := '';
  g_MailFrom := '';
end;

procedure TMainframe.mmDebugModeClick(Sender: TObject);
begin
  inherited;
  mmDebugMode.Checked := not mmDebugMode.Checked;
  reflectDebugMode(mmDebugMode.Checked);
end;

procedure TMainframe.mmMailSettingClick(Sender: TObject);
begin
  frmMailSetting := TMailSettingframe.Create(Self);
  frmMailSetting.initialize;
  frmMailSetting.ShowModal;
end;

procedure TMainframe.pnlCustomClick(Sender: TObject);
begin
  cleanPnlMain;
  frmDBEditor.Visible := True;
  behavePLBClick(pnlCustom,imgCustom);
end;

procedure TMainframe.pnlCustomMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  behavePLBMouseDown(pnlCustom);
end;

procedure TMainframe.pnlCustomMouseEnter(Sender: TObject);
begin
  behavePLBMouseEnter(pnlCustom,imgCustom);
end;

procedure TMainframe.pnlCustomMouseLeave(Sender: TObject);
begin
  behavePLBMouseLeave(pnlCustom,imgCustom);
end;

procedure TMainframe.pnlCustomMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  behavePLBMouseUp(pnlCustom);
end;

procedure TMainframe.reflectDebugMode(b: Boolean);
begin
  g_DebugMode := b;
  frmClientSearch.m_DebugMode := b;
  frmBillingSearch.m_DebugMode := b;
end;

procedure TMainframe.pnlBillingClick(Sender: TObject);
begin
  cleanPnlMain;
  frmBillingSearch.pnlBase.Visible := True;
  behavePLBClick(pnlBilling,imgAccounting);
end;

procedure TMainframe.pnlBillingMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  behavePLBMouseDown(pnlBilling);
end;

procedure TMainframe.pnlBillingMouseEnter(Sender: TObject);
begin
  behavePLBMouseEnter(pnlBilling,imgAccounting);
end;

procedure TMainframe.pnlBillingMouseLeave(Sender: TObject);
begin
  behavePLBMouseLeave(pnlBilling,imgAccounting);
end;

procedure TMainframe.pnlBillingMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  behavePLBMouseUp(pnlBilling);
end;

procedure TMainframe.pnlClientClick(Sender: TObject);
begin
  cleanPnlMain;
  frmClientSearch.pnlBase.Visible := True;
  behavePLBClick(pnlClient,imgClient);
end;

procedure TMainframe.pnlClientMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  behavePLBMouseDown(pnlClient);
end;

procedure TMainframe.pnlClientMouseEnter(Sender: TObject);
begin
  behavePLBMouseEnter(pnlClient,imgClient);
end;

procedure TMainframe.pnlClientMouseLeave(Sender: TObject);
begin
  behavePLBMouseLeave(pnlClient,imgClient);
end;

procedure TMainframe.pnlClientMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  behavePLBMouseUp(pnlClient);
end;

procedure TMainframe.pnlCounselingClick(Sender: TObject);
begin
  cleanPnlMain;
  frmCounselingSearch.pnlBase.Visible := True;
  behavePLBClick(pnlCounseling,imgCounseling);
end;

procedure TMainframe.pnlCounselingMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  behavePLBMouseDown(pnlCounseling);
end;

procedure TMainframe.pnlCounselingMouseEnter(Sender: TObject);
begin
  behavePLBMouseEnter(pnlCounseling,imgAccounting);
end;

procedure TMainframe.pnlCounselingMouseLeave(Sender: TObject);
begin
  behavePLBMouseLeave(pnlCounseling,imgAccounting);
end;

procedure TMainframe.pnlCounselingMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  behavePLBMouseUp(pnlCounseling);
end;

procedure TMainframe.SQLConnection1Login(Database: TSQLConnection;
  LoginParams: TStrings);
var strList: TStrings;
    i: Integer;
begin
  //ソースの内部実装がわからないためLoginParamsとSQLConnection1.Paramsの両方を変更する
  strList := TStringList.Create;
  strList.Add('Password=' + g_Password);
  strList.Add('User_Name=' + g_UserName);
  strList.Add('Database=edogijuku_db');
  LoginParams := strList;
  for i := 0 to SQLConnection1.Params.Count - 1 do begin
    if LowerCase(Copy(SQLConnection1.Params[i],1,8))='password' then begin
      SQLConnection1.Params[i] := 'Password=' + g_Password;
    end;
    if LowerCase(Copy(SQLConnection1.Params[i],1,9))='user_name' then begin
      SQLConnection1.Params[i] := 'User_Name=' + g_UserName;
    end;
  end;
  inherited;
end;

end.
