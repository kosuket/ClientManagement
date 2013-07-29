unit frmCounseling;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, FWGridBasefrm, Vcl.AppEvnts,
  Vcl.StdCtrls, Vcl.Imaging.jpeg, Vcl.ExtCtrls, Vcl.Grids, Vcl.DBGrids;

type
  TCounselingframe = class(TFWGridBaseframe)
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Counselingframe: TCounselingframe;

implementation

{$R *.dfm}

end.
