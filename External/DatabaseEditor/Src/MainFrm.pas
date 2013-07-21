// Test module for MySql Database Editor.
unit MainFrm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, DBGridBaseFrm, MySQLAccessor, Vcl.StdCtrls,
  Data.DBXMySQL, Data.DB, Data.SqlExpr, DBEditFrm, Vcl.ExtCtrls, TableListFrm, SyncObjs;

type
  TFrmMain = class(TForm)
    pnlTableList: TPanel;
    pnlTableDisplay: TPanel;
    Splitter1: TSplitter;
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    Accessor: TMySQLAccessor;
    TableList: TFrmTableList;
    DBEdit: TFrmDBEdit;
    procedure OnSelectTable(TableName: string);
  public
    { Public declarations }
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
  end;

var
  FrmMain: TFrmMain;

implementation

{$R *.dfm}

constructor TFrmMain.Create(AOwner: TComponent);
begin
  inherited;
  Accessor := TMySQLAccessor.Create('localhost', 'root', 'manager', 'edogijuku_db');
end;

procedure TFrmMain.OnSelectTable(TableName: string);
begin
  DBEdit.SetTable(TableName);
end;

destructor TFrmMain.Destroy;
begin
  TableList.Release;
  DBEdit.Release;
  Accessor.Free;
  inherited;
end;

procedure TFrmMain.FormShow(Sender: TObject);
begin
  TableList := TFrmTableList.Create(Self, Accessor);
  TableList.OnSelectTableName := OnSelectTable;
  TableList.Parent := pnlTableList;
  TableList.BorderStyle := bsNone;
  TableList.Align := alClient;

  DBEdit := TFrmDBEdit.Create(Self, Accessor);
  DBEdit.Parent := pnlTableDisplay;
  DBEdit.BorderStyle := bsNone;
  DBEdit.Align := alClient;

  TableList.Show;
  DBEdit.Show;
end;

end.
