unit FWSQLBaseDlgfrm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.FMTBcd, Data.DB, Data.SqlExpr,
  Vcl.ExtCtrls;

type
  TFWSQLBaseDialogframe = class(TForm)
    pnlBase: TPanel;
    pnlTitle: TPanel;
    Image1: TImage;
    lblTitle: TPanel;
    SQLQuery1: TSQLQuery;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FWSQLBaseDialogframe: TFWSQLBaseDialogframe;

implementation

{$R *.dfm}

end.
