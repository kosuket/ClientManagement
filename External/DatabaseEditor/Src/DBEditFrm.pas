unit DBEditFrm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, DBGridBaseFrm, Vcl.Grids, Vcl.DBGrids,
  Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.Buttons;

type
  TFrmDBEdit = class(TFrmDBGridBase)
    pnlDataList: TPanel;
    pnlHeader: TPanel;
    Splitter1: TSplitter;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure SetTable(TableName: string);
  end;

var
  FrmDBEdit: TFrmDBEdit;

implementation

{$R *.dfm}

procedure TFrmDBEdit.FormCreate(Sender: TObject);
begin
  inherited;
  pnlDataList.Align := alClient;
  MainGrid.Parent := pnlDataList;
  MainGrid.Align := alClient;
end;

procedure TFrmDBEdit.SetTable(TableName: string);
begin
  LoadTable(TableName);
end;

end.
