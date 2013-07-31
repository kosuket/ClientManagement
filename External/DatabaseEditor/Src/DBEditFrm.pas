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
    procedure MainGridKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
    EditedFlg: Boolean;
    TableShowing: string;
    procedure SetEdited(Value: Boolean);
    procedure SetDeletability;
    const MsgWarnOnLeave = 'Do you want to save the changes before leaving the table?';
    const MsgConfirmReload = 'Discard changes and reload?';
    const MsgConfirmCommit = 'Save the changes? This operation cannot be undone.';
  public
    { Public declarations }
    procedure SetTable(TableName: string);
    function OkToLeaveTable: Boolean;
    property Edited: Boolean read EditedFlg write SetEdited;
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
  Edited := True;
end;

procedure TFrmDBEdit.actCommitExecute(Sender: TObject);
begin
  if MessageDlg(MsgConfirmCommit, mtWarning, [mbOK, mbCancel], 0, mbCancel) = mrOk then begin
    Commit;
    Edited := False;
  end;
  LoadTable(TableShowing);
end;

procedure TFrmDBEdit.actDeleteRowExecute(Sender: TObject);
begin
  DeleteRow;
  Edited := True;
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
  if Edited then begin
    DoitFlg := (MessageDlg(MsgConfirmReload, mtWarning, [mbOK, mbCancel], 0, mbCancel) = mrOk);
  end else begin
    DoitFlg := True;
  end;
  if DoitFlg then begin
    LoadTable(TableShowing);
    Edited := False;
  end;
end;

procedure TFrmDBEdit.FormCreate(Sender: TObject);
begin
  inherited;
  pnlDataList.Align := alClient;
  MainGrid.Parent := pnlDataList;
  MainGrid.Align := alClient;
end;

procedure TFrmDBEdit.MainGridKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  Edited := True;
end;

function TFrmDBEdit.OkToLeaveTable: Boolean;
var
  Ans: Integer;
begin
  Result := False;
  if not Edited then begin
    Result := True;
    Exit;
  end;

  Ans := MessageDlg(MsgWarnOnLeave, mtConfirmation, [mbYes, mbNo, mbCancel], 0, mbCancel);
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

procedure TFrmDBEdit.SetDeletability;
begin
  if CDataSet.RecordCount > 0 then begin
    actDeleteRow.Enabled := True;
  end else begin
    actDeleteRow.Enabled := False;
  end;
end;

procedure TFrmDBEdit.SetEdited(Value: Boolean);
begin
  EditedFlg := Value;
  if EditedFlg then begin
    actCommit.Enabled := True;
  end else begin
    actCommit.Enabled := False;
  end;
  SetDeletability;
end;

procedure TFrmDBEdit.SetTable(TableName: string);
begin
  TableShowing := TableName;
  actLoadExecute(Self);
end;

end.
