unit DBEditFrm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, DBGridBaseFrm, Vcl.Grids, Vcl.DBGrids,
  Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.Buttons, System.Actions, Vcl.ActnList;

type
  TFrmDBEdit = class(TFrmDBGridBase)
    pnlDataList: TPanel;
    pnlHeader: TPanel;
    Splitter1: TSplitter;
    ActionList: TActionList;
    actCommit: TAction;
    actLoad: TAction;
    actAddRow: TAction;
    actDeleteRow: TAction;
    pnlOperations: TPanel;
    btnAddRow: TSpeedButton;
    btnDelete: TSpeedButton;
    btnLoad: TSpeedButton;
    btnCommit: TSpeedButton;
    actImport: TAction;
    actExport: TAction;
    btnExport: TSpeedButton;
    btnImport: TSpeedButton;
    procedure FormCreate(Sender: TObject);
    procedure actCommitExecute(Sender: TObject);
    procedure actLoadExecute(Sender: TObject);
    procedure actAddRowExecute(Sender: TObject);
    procedure actDeleteRowExecute(Sender: TObject);
    procedure actImportExecute(Sender: TObject);
    procedure actExportExecute(Sender: TObject);
  private
    { Private declarations }
    TableShowing: string;
    procedure SetWhenNoChange;
    procedure SetWhenSomeChange;
    const MSG_WARN_LEAVE = 'Do you want to save the changes before leaving the table?';
    const MSG_CONFIRM_RELOAD = 'Discard changes and reload?';
    const MSG_CONFIRM_COMMIT = 'Save the changes? This operation cannot be undone.';
  public
    { Public declarations }
    procedure SetTable(TableName: string);
    function OkToLeaveTable: Boolean;
    function HasUnsavedChange: Boolean;
    property TableName: string read TableShowing write TableShowing;
  end;

var
  FrmDBEdit: TFrmDBEdit;

implementation
uses
  UITypes;

{$R *.dfm}

procedure TFrmDBEdit.actAddRowExecute(Sender: TObject);
begin
  AddRow;
  SetWhenSomeChange;
end;

procedure TFrmDBEdit.actCommitExecute(Sender: TObject);
begin
  if MessageDlg(MSG_CONFIRM_COMMIT, mtWarning, [mbOK, mbCancel], 0, mbCancel) = mrOk then begin
    Commit;
  end;
  LoadTable(TableShowing);
  SetWhenNoChange;
end;

procedure TFrmDBEdit.actDeleteRowExecute(Sender: TObject);
begin
  DeleteRow;
  SetWhenSomeChange;
end;

procedure TFrmDBEdit.actExportExecute(Sender: TObject);
var
  Dlg: TSaveDialog;
begin
  Dlg := TSaveDialog.Create(Self);
  try
    Dlg.Title := 'Export As';
    Dlg.Filter := 'CSV file (*.csv)|*.CSV|DAT file (*.dat)|*.DAT|All files (*.*)|*.*';
    if Dlg.Execute then begin
      ExportData(Dlg.FileName, TableShowing);
    end;
  finally
    Dlg.Free;
  end;
end;

procedure TFrmDBEdit.actImportExecute(Sender: TObject);
var
  Dlg: TOpenDialog;
begin
  Dlg := TOpenDialog.Create(Self);
  try
    Dlg.Title := 'Import File';
    Dlg.Filter := 'CSV file (*.csv)|*.CSV|DAT file (*.dat)|*.DAT|All files (*.*)|*.*';
    if Dlg.Execute then begin
      ImportData(Dlg.FileName, TableShowing);
    end;
  finally
    Dlg.Free;
  end;
end;

procedure TFrmDBEdit.actLoadExecute(Sender: TObject);
var
  DoitFlg: Boolean;
begin
  // Warn and load.
  if HasUnsavedChange then begin
    DoitFlg := (MessageDlg(MSG_CONFIRM_RELOAD, mtWarning, [mbOK, mbCancel], 0, mbCancel) = mrOk);
  end else begin
    DoitFlg := True;
  end;
  if DoitFlg then LoadTable(TableShowing);

  // initial state.
  SetWhenNoChange;
end;

procedure TFrmDBEdit.FormCreate(Sender: TObject);
begin
  inherited;
  pnlDataList.Align := alClient;
  MainGrid.Parent := pnlDataList;
  MainGrid.Align := alClient;
end;

function TFrmDBEdit.HasUnsavedChange: Boolean;
begin
{ TODO : implement }
  Result := False;
end;

function TFrmDBEdit.OkToLeaveTable: Boolean;
var
  Ans: Integer;
begin
  Result := False;
  if not HasUnsavedChange then begin
    Result := True;
    Exit;
  end;

  Ans := MessageDlg(MSG_WARN_LEAVE, mtConfirmation, [mbYes, mbNo, mbCancel], 0, mbCancel);
  case Ans of
    mrCancel: Result := False;
    mrYes: begin
      Commit;
      Result := True;
    end;
    mrNo: begin
      Result := True;
    end;
  end;
end;

procedure TFrmDBEdit.SetTable(TableName: string);
begin
  TableShowing := TableName;
  actLoadExecute(Self);
end;

procedure TFrmDBEdit.SetWhenNoChange;
begin
  if CDataSet.RecordCount < 1 then begin
    btnDelete.Enabled := False;
  end else begin
    btnDelete.Enabled := True;
  end;
  btnCommit.Enabled := False;
end;

procedure TFrmDBEdit.SetWhenSomeChange;
begin
  if CDataSet.RecordCount < 1 then begin
    btnDelete.Enabled := False;
  end else begin
    btnDelete.Enabled := True;
  end;
  btnCommit.Enabled := True;
end;

end.
