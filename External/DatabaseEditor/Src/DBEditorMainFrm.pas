// MySql Database Editor.
unit DBEditorMainFrm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, DBGridBaseFrm, MySQLAccessor, Vcl.StdCtrls,
  Data.DBXMySQL, Data.DB, Data.SqlExpr, DBEditFrm, Vcl.ExtCtrls, TableListFrm, SyncObjs;

type
  TFrmDBEditorMain = class(TForm)
    pnlTableList: TPanel;
    pnlTableDisplay: TPanel;
    Splitter1: TSplitter;
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    AccessorCreationFlg: Boolean;
    Accessor: TMySQLAccessor;
    TableList: TFrmTableList;
    DBEdit: TFrmDBEdit;
    procedure OnSelectTable(TableName: string);
  public
    { Public declarations }
    constructor Create(AOwner: TComponent; Accessor: TMySQLAccessor); reintroduce; overload;
    constructor Create(AOwner: TComponent; HostName, UserName, Password, Database: string); reintroduce; overload;
    destructor Destroy; override;
  end;

var
  FrmDBEditorMain: TFrmDBEditorMain;

implementation

{$R *.dfm}

constructor TFrmDBEditorMain.Create(AOwner: TComponent; Accessor: TMySQLAccessor);
begin
  inherited Create(AOwner);
  Self.Accessor := Accessor;
  TableList := TFrmTableList.Create(Self, Accessor);
  DBEdit := TFrmDBEdit.Create(Self, Accessor);
end;

procedure TFrmDBEditorMain.OnSelectTable(TableName: string);
begin
  DBEdit.SetTable(TableName);
end;

constructor TFrmDBEditorMain.Create(AOwner: TComponent; HostName, UserName,
  Password, Database: string);
begin
  Accessor := TMySQLAccessor.Create(HostName, UserName, Password, Database);
  Create(AOwner, Accessor);
end;

destructor TFrmDBEditorMain.Destroy;
begin
  TableList.Release;
  DBEdit.Release;
  if AccessorCreationFlg then Accessor.Free;
  inherited;
end;

procedure TFrmDBEditorMain.FormShow(Sender: TObject);
begin
  TableList.OnSelectTableName := OnSelectTable;
  TableList.Parent := pnlTableList;
  TableList.BorderStyle := bsNone;
  TableList.Align := alClient;

  DBEdit.Parent := pnlTableDisplay;
  DBEdit.BorderStyle := bsNone;
  DBEdit.Align := alClient;

  TableList.Show;
  DBEdit.Show;
end;

end.
