unit frmAccounting;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, FWGridBasefrm, Data.FMTBcd,
  Vcl.AppEvnts, Datasnap.Provider, Data.DB, Datasnap.DBClient, Data.SqlExpr,
  Vcl.StdCtrls, Vcl.Imaging.jpeg, Vcl.ExtCtrls, Vcl.Grids, Vcl.DBGrids;

type
  TAccountingframe = class(TFWGridBaseframe)
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Accountingframe: TAccountingframe;

implementation

{$R *.dfm}

end.
