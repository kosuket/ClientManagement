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
    procedure Refresh;
    function OkToLeaveTable: Boolean;
    function HasUnsavedChange: Boolean;
  public
    { Public declarations }
    constructor Create(AOwner: TComponent; Accessor: TMySQLAccessor); reintroduce; overload;
    constructor Create(AOwner: TComponent; HostName, UserName, Password, Database: string); reintroduce; overload;
    destructor Destroy; override;
    procedure Embed(AParent: TWinControl);
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

procedure TFrmDBEditorMain.Refresh;
begin
  TableList.Refresh;
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

procedure TFrmDBEditorMain.Embed(AParent: TWinControl);
begin
  Parent := AParent;
  Align := alClient;
  BorderStyle := bsNone;
end;

procedure TFrmDBEditorMain.FormShow(Sender: TObject);
begin
  TableList.OnSelectTableName := OnSelectTable;
  TableList.HasUnsavedChange := HasUnsavedChange;
  TableList.OkToLeaveTable := OkToLeaveTable;
  TableList.Embed(pnlTableList);
  TableList.Show;
  DBEdit.RefreshAction := Refresh;
  DBEdit.Embed(pnlTableDisplay);
  DBEdit.Show;
end;

function TFrmDBEditorMain.HasUnsavedChange: Boolean;
begin
  Result := DBEdit.Edited;
end;

function TFrmDBEditorMain.OkToLeaveTable: Boolean;
begin
  Result := DBEdit.OkToLeaveTable;
end;

end.
