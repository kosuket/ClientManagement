unit MainFrm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Data.DBXMySQL, Data.DB,
  Data.SqlExpr, Data.FMTBcd;

type
  TFrmMain = class(TForm)
    btnLoadCsv: TButton;
    conn2: TSQLConnection;
    btnDBTest2: TButton;
    query: TSQLQuery;
    btnDBTest: TButton;
    btnSqlAccessor: TButton;
    btnCsvOut: TButton;
    procedure btnLoadCsvClick(Sender: TObject);
    procedure btnDBTest2Click(Sender: TObject);
    procedure btnDBTestClick(Sender: TObject);
    procedure btnSqlAccessorClick(Sender: TObject);
    procedure btnCsvOutClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmMain: TFrmMain;

implementation
uses
  CsvLoader,
  CsvOutput,
  MySQLAccessor;

{$R *.dfm}

// Tests normal use (control-based) of SQLConnection
procedure TFrmMain.btnCsvOutClick(Sender: TObject);
var
  CsvOut: TCsvOutput;
begin
  CsvOut := TCsvOutput.Create('localhost', 'root', 'manager', 'edogijuku_db');
  try
    CsvOut.Execute(Concat(GetCurrentDir, '\test.dat'), 'test');
  finally
    if Assigned(CsvOut) then CsvOut.Free;
  end;
end;

procedure TFrmMain.btnDBTest2Click(Sender: TObject);
begin
  conn2.Params.Values['HostName'] := 'localhost';
  conn2.Params.Values['User_Name'] := 'root';
  conn2.Params.Values['Password'] := 'manager';
  conn2.Params.Values['Database'] := 'edogijuku_db';
  conn2.Open;

  query.SQLConnection := conn2;
  query.SQL.Add('update test set column3 = 3;');
  query.ExecSQL();
end;

// Tests dynamically created SQLConnection
procedure TFrmMain.btnDBTestClick(Sender: TObject);
var
  conn: TSQLConnection;
  query: TSQLQuery;
begin
  conn := TSQLConnection.Create(nil);
  query := TSQLQuery.Create(nil);
  try
  // Setting DriverName property sets the default properties.
  // See dbxdrivers.ini for available drivers and the default properties.
  conn.DriverName := 'MySQL';

  conn.ConnectionName := '';
  conn.LoginPrompt := False;
  conn.Params.Values['HostName'] := 'localhost';
  conn.Params.Values['User_Name'] := 'root';
  conn.Params.Values['Password'] := 'manager';
  conn.Params.Values['Database'] := 'edogijuku_db';
  conn.Open;

  query.SQLConnection := conn;
  query.SQL.Add('update test set column2 = :value2;');
  query.ParamByName('value2').Value := '9';
  query.ExecSQL();

  query.SQL.Clear;
  query.SQL.Add('select column1 from test');
  query.Open;
  // query.First;
  showmessage(query['column1']);
  finally
    if Assigned(query) then query.Free;
    if Assigned(conn) then conn.Free;
  end;
end;

procedure TFrmMain.btnLoadCsvClick(Sender: TObject);
var
  loader: TCsvLoader;
begin
  loader := TCsvLoader.Create('localhost', 'root', 'manager', 'edogijuku_db');
  try
    //loader.execute(Concat(GetCurrentDir, '\test_ins.dat'));
    loader.execute('test_ins.dat');
  finally
    loader.Free;
  end;
end;
procedure TFrmMain.btnSqlAccessorClick(Sender: TObject);
var
  Access: TMySQLAccessor;
begin
  Access := TMySQLAccessor.Create('localhost', 'root', 'manager', 'edogijuku_db');
  try
    Access.ExecuteUpdate('update test set column1 = 111');
  finally
    if Assigned(Access) then Access.Free;
  end;
end;

end.
