unit DataTest;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, MySQLAccessor, Client, Vcl.StdCtrls,
  ClientInserter;

type
  TFrmMain = class(TForm)
    Button1: TButton;
    Button2: TButton;
    procedure FormShow(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
    Accessor: TMySQLAccessor;
  public
    { Public declarations }
  end;

var
  FrmMain: TFrmMain;

implementation
uses
  Data.DB, MasterLoader;

{$R *.dfm}

procedure TFrmMain.Button1Click(Sender: TObject);
var
  Dlg: TOpenDialog;
  Loader: TMasterLoader;
begin
  Dlg := TOpenDialog.Create(Self);
  Loader := TMasterLoader.Create(Accessor);
  try
    Dlg.Title := 'Generate Client Masters From File';
    Dlg.Filter := 'TSV file (*.tsv)|*.TSV|CSV file (*.csv)|*.CSV|All files (*.*)|*.*';
    if Dlg.Execute then begin
      Loader.LoadFile(TLoadKind.Client, Dlg.FileName);
    end;
  finally
    Loader.Free;
    Dlg.Free;
  end;
end;

procedure TFrmMain.Button2Click(Sender: TObject);
var
  Dlg: TSaveDialog;
  Loader: TMasterLoader;
begin
  Dlg := TSaveDialog.Create(Self);
  Loader := TMasterLoader.Create(Accessor);
  try
    Dlg.Title := 'Create Empty File with Header';
    Dlg.Filter := 'TSV file (*.tsv)|*.TSV';
    if Dlg.Execute then begin
      Loader.MakeTemplate(TLoadKind.Client, Dlg.FileName);
    end;
  finally
    Loader.Free;
    Dlg.Free;
  end;
end;

procedure TFrmMain.FormShow(Sender: TObject);
begin
  Accessor := TMySQLAccessor.Create('localhost', 'root', 'manager', 'edogijuku_db');
end;

end.
