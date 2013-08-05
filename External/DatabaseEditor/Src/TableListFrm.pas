// Displays the list of the given table schema
unit TableListFrm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, DBGridBaseFrm, Vcl.Grids, Vcl.DBGrids,
  Vcl.StdCtrls, MySQLAccessor, Data.DB;

type
  TProcStr = procedure(TableName: string) of object;
  TFuncBool = function: Boolean of object;

  TFrmTableList = class(TFrmDBGridBase)
    procedure FormShow(Sender: TObject);
    procedure MainGridCellClick(Column: TColumn);
    procedure MainGridKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure MainGridKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
    procedure LoadTableList;
  public
    { Public declarations }
    OnSelectTableName: TProcStr;
    OkToLeaveTable: TFuncBool;
    HasUnsavedChange: TFuncBool;
    constructor Create(AOwner: TComponent; Accessor: TMySQLAccessor);
    procedure Refresh;
  end;

var
  FrmTableList: TFrmTableList;

implementation

{$R *.dfm}

{ TFrmTableList }

constructor TFrmTableList.Create(AOwner: TComponent; Accessor: TMySQLAccessor);
begin
  inherited Create(AOwner, Accessor);
end;

procedure TFrmTableList.FormShow(Sender: TObject);
begin
  inherited;
  MainGrid.Align := alClient;
  MainGrid.ReadOnly := True;
  Refresh;
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

procedure TFrmTableList.MainGridKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = VK_UP) or (Key = VK_DOWN) or (Key = VK_TAB) then begin
    if HasUnsavedChange then begin
      if OkToLeaveTable then begin
        OnSelectTableName(MainGrid.SelectedField.Text);
      end else begin
        Key := 0;
      end;
    end;
  end;
  inherited;
end;

procedure TFrmTableList.MainGridKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if (Key = VK_UP) or (Key = VK_DOWN) or (Key = VK_TAB) then begin
    OnSelectTableName(MainGrid.SelectedField.Text);
  end;
end;

procedure TFrmTableList.Refresh;
begin
  LoadTableList;
  OnSelectTableName(MainGrid.SelectedField.Text);
end;

end.
