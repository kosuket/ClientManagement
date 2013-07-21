// Displays the list of the given table schema
unit TableListFrm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, DBGridBaseFrm, Vcl.Grids, Vcl.DBGrids,
  Vcl.StdCtrls, MySQLAccessor, Data.DB;

type
  TDelegate = procedure(TableName: string) of object;

  TFrmTableList = class(TFrmDBGridBase)
    procedure btnLoadTablesClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure MainGridCellClick(Column: TColumn);
    procedure MainGridKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    { Private declarations }
    procedure LoadTableList;
  public
    { Public declarations }
    OnSelectTableName: TDelegate;
    constructor Create(AOwner: TComponent; Accessor: TMySQLAccessor);
  end;

var
  FrmTableList: TFrmTableList;

implementation

{$R *.dfm}

{ TFrmTableList }
procedure TFrmTableList.btnLoadTablesClick(Sender: TObject);
begin
  LoadTableList;
end;

constructor TFrmTableList.Create(AOwner: TComponent; Accessor: TMySQLAccessor);
begin
  inherited Create(AOwner, Accessor);
end;

procedure TFrmTableList.FormShow(Sender: TObject);
begin
  inherited;
  MainGrid.Align := alClient;
  MainGrid.ReadOnly := True;
  LoadTableList;
  OnSelectTableName(MainGrid.SelectedField.Text);
end;

procedure TFrmTableList.LoadTableList;
var
  Query: string;
begin
  Query := 'SELECT TABLE_NAME FROM INFORMATION_SCHEMA.TABLES ';
  Query := Concat(Query, ' WHERE TABLE_SCHEMA = ''', Accessor.Database, '''');
  LoadQuery(Query);
end;

procedure TFrmTableList.MainGridCellClick(Column: TColumn);
begin
  inherited;
  OnSelectTableName(Column.Field.Text);
end;

procedure TFrmTableList.MainGridKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if (Key = VK_UP) or (Key = VK_DOWN) then begin
    OnSelectTableName(MainGrid.SelectedField.Text);
  end;
end;

end.
