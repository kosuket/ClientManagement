unit frmMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Data.DBXMySQL, Data.DB,
  Data.SqlExpr, Data.FMTBcd, Vcl.Grids, Vcl.DBGrids, Vcl.DBCGrids, Vcl.ExtCtrls,
  Vcl.DBCtrls, Datasnap.Provider, Datasnap.DBClient, LogInFrm, Vcl.Buttons,
  Vcl.ComCtrls,frmClientSearch;

type
  TForm1 = class(TForm)
    SQLQuery1: TSQLQuery;
    DataSource1: TDataSource;
    ClientDataSet1: TClientDataSet;
    DataSetProvider1: TDataSetProvider;
    pnlMenu: TPanel;
    Splitter1: TSplitter;
    pnlMain: TPanel;
    pgctrlMain: TPageControl;
    TabSheet1: TTabSheet;
    Panel1: TPanel;
    Edit1: TEdit;
    btnTemp1: TButton;
    DBGrid1: TDBGrid;
    btnClientStatus: TSpeedButton;
    lblPnlTitle: TLabel;
    SQLConnection1: TSQLConnection;
    procedure btnTemp1Click(Sender: TObject);
    procedure SQLConnection1Login(Database: TSQLConnection;
      LoginParams: TStrings);
  private
    { Private declarations }
  public
    { Public declarations }
    frmLogIn: TLogInFrame;
    frmClientSearch: TClientSearchframe;
    constructor Create(AOwner: TComponent) ; override;
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.btnTemp1Click(Sender: TObject);
begin
  SQLQuery1.SQL.Clear;
  SQLQuery1.SQL.Add('SELECT * FROM SCHOOL ');
  SQLQuery1.SQL.Add('WHERE SCHOOL_NAME = ' + '''' + Edit1.Text + '''');
  ClientDataSet1.Close;
  ClientDataSet1.Open;
end;

constructor TForm1.Create(AOwner: TComponent);
begin
  frmLogIn := TLogInFrame.Create(Self);
  If frmLogIn.ShowModal = 1 then begin
  if not frmLogIn.SQLConnection1.Connected then Application.Terminate;
  inherited;
  end else begin
    Application.Terminate;
  end;
  frmClientSearch := TClientSearchframe.Create(self);

end;

procedure TForm1.SQLConnection1Login(Database: TSQLConnection;
  LoginParams: TStrings);
var i: Integer;
begin
  for i := 0 to LoginParams.Count - 1 do begin
    ShowMessage(LoginParams[i]);
    {if LowerCase(Copy(LoginParams[i],1,8)) = 'password' then begin
      LoginParams[i] := 'Password=' + edtPassword.Text;
    end;
    if LowerCase(Copy(LoginParams[i],1,9)) = 'user_name' then begin
      LoginParams[i] := 'User_Name=' + edtUserName.Text;
    end;}
  end;
  inherited;

end;

end.
