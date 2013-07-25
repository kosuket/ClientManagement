unit MainFrm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, DBEditorMainFrm;

type
  TFrmMain = class(TForm)
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    FrmDBEditor: TFrmDBEditorMain;
  public
    { Public declarations }
  end;

var
  FrmMain: TFrmMain;

implementation

{$R *.dfm}

procedure TFrmMain.FormShow(Sender: TObject);
begin
  FrmDBEditor := TFrmDBEditorMain.Create(Self, 'localhost', 'root', 'manager', 'edogijuku_db');
  FrmDBEditor.ShowModal;
  Application.Terminate;
end;

end.
