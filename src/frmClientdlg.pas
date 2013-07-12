unit frmClientdlg;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, FWSQLBaseDlgfrm, Data.FMTBcd, Vcl.Grids,
  Vcl.StdCtrls, Data.DB, Data.SqlExpr, Vcl.ExtCtrls, Datasnap.DBClient,
  Datasnap.Provider, Vcl.ComCtrls, Vcl.ToolWin,Data.DBXCommon, Vcl.Buttons,
  Vcl.AppEvnts;

type
  TOpenMode = (omNew,omModify);
  TfrmClientCarteDlg = class(TFWSQLBaseDialogframe)
    ScrollBox1: TScrollBox;
    dspClientCarte: TDataSetProvider;
    cdsClientCarte: TClientDataSet;
    btnOK: TButton;
    pnlUpper: TPanel;
    pnlBasic: TPanel;
    lblFirstName: TLabel;
    lblLastName: TLabel;
    lblEmail: TLabel;
    lblSponsored: TLabel;
    lblUniversityName: TLabel;
    lblDegree: TLabel;
    lblMajor: TLabel;
    lblGPA: TLabel;
    lblAcademicAward: TLabel;
    lblPublication: TLabel;
    lblStudyAbroad: TLabel;
    lblPlace: TLabel;
    lblWorkPlace: TLabel;
    lblUseEnglish: TLabel;
    lblFutureGoal: TLabel;
    edtFirstName: TEdit;
    edtLastName: TEdit;
    edtEmail: TEdit;
    cmbSponsored: TComboBox;
    edtUniversityName: TEdit;
    edtDegree: TEdit;
    edtMajor: TEdit;
    edtGPA: TEdit;
    cmbAcademicAward: TComboBox;
    cmbPublication: TComboBox;
    cmbStudyAbroad: TComboBox;
    edtPlace: TEdit;
    edtWorkPlace: TEdit;
    cmbUseEnglish: TComboBox;
    edtFutureGoal: TEdit;
    Splitter1: TSplitter;
    pnlUpperGrid: TPanel;
    grdSchool: TStringGrid;
    pnlSchoolTitle: TPanel;
    lblSchoolTitle: TLabel;
    btnSAdd: TSpeedButton;
    btnSDelete: TSpeedButton;
    pnlLower: TPanel;
    Splitter2: TSplitter;
    pnlGMAT: TPanel;
    pnlGMATTitle: TPanel;
    lblGMATTitle: TLabel;
    btnGAdd: TSpeedButton;
    btnGDelete: TSpeedButton;
    Splitter3: TSplitter;
    pnlTOEFL: TPanel;
    pnlTOEFLTitle: TPanel;
    lblTOEFLTitle: TLabel;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    grdTOEFL: TStringGrid;
    grdGMAT: TStringGrid;
    ApplicationEvents1: TApplicationEvents;
    edtDate: TDateTimePicker;
    procedure grdSchoolClick(Sender: TObject);
    procedure cmbSchoolClick(Sender: TObject);
    procedure cmbRankClick(Sender: TObject);
    procedure cmbRoundClick(Sender: TObject);
    procedure cmbToeflTotalClick(Sender: TObject);
    procedure cmbToeflIndClick(Sender: TObject);
    procedure cmbGMATTotalClick(Sender: TObject);
    procedure cmbGMATIndClick(Sender: TObject);
    procedure cmbGMATAWAClick(Sender: TObject);
    procedure grdTOEFLClick(Sender: TObject);
    procedure btnOKClick(Sender: TObject);
    procedure Splitter1Moved(Sender: TObject);
    procedure Splitter3Moved(Sender: TObject);
    procedure grdGMATClick(Sender: TObject);
    procedure hideAllcmb;
    procedure btnSAddClick(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure btnGAddClick(Sender: TObject);
    procedure btnSDeleteClick(Sender: TObject);
    procedure btnGDeleteClick(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure ApplicationEvents1Message(var Msg: tagMSG; var Handled: Boolean);
    procedure edtDateExit(Sender: TObject);
    procedure componentExit(Sender: TObject);
  private
    { Private declarations }
    procedure initializeNew;
    procedure initializeModify;
    procedure setupGrdSchool;
    procedure setupCombobox;
    function AddNewRecord: String;
    function ModifyRecord: String;
    procedure createInsertClientSQL;
    procedure createUpdateClientSQL;
    procedure createDeleteSchoolMapSQL;
    procedure createInsertSchoolMapSQL;
    procedure createDeleteGMATSQL;
    procedure createInsertGMATSQL;
    procedure createDeleteTOEFLSQL;
    procedure createInsertTOEFLSQL;
    function getcmbIndex(intDiv: Integer): Integer;
    procedure fillScoreNoAuto(sg:TStringGrid);
    procedure addNewRow(sg:TStringGrid);
    procedure deleteRow(sg:TStringGrid);
    procedure getClientInfo;
    procedure getSchoolInfo;
    procedure getGMATInfo;
    procedure getTOEFLInfo;
    function isDynamicComp(Sender :TObject): Boolean;
    function hasRecord(sg:TStringGrid): Boolean;
    function isSufficientRecord:Boolean;
    procedure resetLabelColor;
    function checkRequiredValue(edt:TEdit): Boolean;
    function checkStringGridIdDuplication(sg:TStringGrid; checkCol:Integer): Boolean;
  public
    { Public declarations }
    cmbSchool: TComboBox;
    cmbRank: TComboBox;
    cmbRound: TComboBox;
    cmbToeflTotal: TComboBox;
    cmbToeflInd: TComboBox;
    cmbGMATTotal: TComboBox;
    cmbGMATInd: TComboBox;
    cmbGMATAWA: TComboBox;
    //edtDate: TDateTimePicker;
    SchoolList: TStrings;
    slSchoolId: TStringList;
    g_ClientId: Int64;
    g_OpenMode: TOpenMode;
    constructor create(AOwner:TComponent);override;
    procedure initialize(OpenMode:TOpenMode;conn:TSQLConnection);
  end;

var
  frmClientCarteDlg: TfrmClientCarteDlg;
const
  cmbIndexYes = 0;
  cmbIndexNo  = 1;
  clError = clRed;
  cmbDivAllYesNo : Array[0..1] of String =(
  '1',
  '0');
implementation

{$R *.dfm}

{ TfrmClientCarteDlg }

function TfrmClientCarteDlg.AddNewRecord: String;
var tran: TDBXTransaction;
begin
  try
    //Check
    if not isSufficientRecord then exit;

    tran := SQLQuery1.SQLConnection.BeginTransaction;
    //Insert Client
    createInsertClientSQL;
    SQLQuery1.ExecSQL();
    //Delete Insert School_Map
    createDeleteSchoolMapSQL;
    SQLQuery1.ExecSQL();
    if hasRecord(grdSchool) then begin
      createInsertSchoolMapSQL;
      SQLQuery1.ExecSQL();
    end;
    //Delete Insert GMAT
    createDeleteGMATSQL;
    SQLQuery1.ExecSQL();
    if hasRecord(grdGMAT) then begin
      createInsertGMATSQL;
      SQLQuery1.ExecSQL();
    end;
    //Delete Insert TOEFL
    createDeleteTOEFLSQL;
    SQLQuery1.ExecSQL();
    if hasRecord(grdTOEFL) then begin
      createInsertTOEFLSQL;
      SQLQuery1.ExecSQL();
    end;
    SQLQuery1.SQLConnection.CommitFreeAndNil(tran);
    result := '';
  except
    on E: Exception do begin
      SQLQuery1.SQLConnection.RollbackFreeAndNil(tran);
      result := e.Message + ':' + e.StackTrace;
    end;
  end;
end;

procedure TfrmClientCarteDlg.addNewRow(sg: TStringGrid);
var i: Integer;
begin
  sg.RowCount := sg.RowCount + 1;
  for i := 0 to sg.ColCount -1 do sg.Cells[i,sg.RowCount -1] := '';
end;

procedure TfrmClientCarteDlg.ApplicationEvents1Message(var Msg: tagMSG;
  var Handled: Boolean);
var c,r,c1,r1: Integer;
begin
  inherited;
  if Msg.message = WM_LBUTTONDOWN then begin
    if not cmbSchool.DroppedDown then cmbSchool.Visible := False;
    if not cmbToeflTotal.DroppedDown then cmbToeflTotal.Visible := False;
    if not cmbToeflInd.DroppedDown then cmbToeflInd.Visible := False;
    if not cmbGMATTotal.DroppedDown then cmbGMATTotal.Visible := False;
    if not cmbGMATInd.DroppedDown then cmbGMATInd.Visible := False;
    if not cmbGMATAWA.DroppedDown then cmbGMATAWA.Visible := False;
    //grdGMAT.MouseToCell(Mouse.CursorPos.X,Mouse.CursorPos.Y,c,r);
    //if c <> 2 then edtDate.Visible := False;
  end;
end;

procedure TfrmClientCarteDlg.btnGAddClick(Sender: TObject);
begin
  inherited;
  addNewRow(grdGMAT);
end;

procedure TfrmClientCarteDlg.btnGDeleteClick(Sender: TObject);
begin
  inherited;
  deleteRow(grdGMAT);
end;

procedure TfrmClientCarteDlg.btnOKClick(Sender: TObject);
var errStr: String;
begin
  inherited;
  if MessageDlg('You are about to ' + btnOK.Caption + '. Confirm?',mtConfirmation,[mbYes,mbNo],0,mbYes) <> mrYes then exit;
  case g_OpenMode of
    omNew: errStr := AddNewRecord;
    omModify: errStr := ModifyRecord;
  end;
  if Length(errStr) > 0 then begin
    ShowMessage(errStr);
  end else begin
    ShowMessage('Succeeded');
    ModalResult := mrOk;
  end;
end;

procedure TfrmClientCarteDlg.btnSAddClick(Sender: TObject);
begin
  inherited;
  addNewRow(grdSchool);
end;

procedure TfrmClientCarteDlg.btnSDeleteClick(Sender: TObject);
begin
  inherited;
  deleteRow(grdSchool);
end;

function TfrmClientCarteDlg.checkRequiredValue(edt: TEdit): Boolean;
var lbl: TLabel;
begin
  result := False;
  if Length(edt.Text) = 0 then begin
    if Assigned(FindComponent('lbl' + Copy(edt.Name,4,Length(edt.Name)-3))) then begin
      lbl := TLabel(FindComponent('lbl' + Copy(edt.Name,4,Length(edt.Name)-3)));
      lbl.Color := clError;
      exit;
    end;
  end;
  result := True;
end;

function TfrmClientCarteDlg.checkStringGridIdDuplication(
  sg: TStringGrid; checkCol:Integer): Boolean;
var i,ii: Integer;
    str : String;
    Rect: TRect;
begin
  result := true;
  for i := 0 to sg.RowCount -1 do begin
    str := grdTOEFL.Cells[checkCol,i];
    for ii := i + 1 to sg.RowCount -1 do begin
      if str = sg.Cells[checkCol,ii] then begin
        result := False;
        Rect := sg.CellRect(checkCol,ii);
        sg.Canvas.Brush.Color := clError;
        sg.Canvas.FillRect(Rect);
        exit;
      end;
    end;
  end;
end;

procedure TfrmClientCarteDlg.cmbGMATAWAClick(Sender: TObject);
begin
  grdGMAT.Cells[grdGMAT.Col,grdGMAT.row] := cmbGMATAWA.Text;
  cmbGMATAWA.Visible := False;
  cmbGMATAWA.ItemIndex := 0;
end;

procedure TfrmClientCarteDlg.cmbGMATIndClick(Sender: TObject);
begin
  case grdGMAT.Col of
    3,4: begin
      grdGMAT.Cells[grdGMAT.Col,grdGMAT.Row] := cmbGMATInd.Text;
      if Length(grdGMAT.Cells[grdGMAT.Col,grdGMAT.row]) > 0 then fillScoreNoAuto(grdGMAT);
    end;
  end;
  cmbGMATInd.Visible := False;
  cmbGMATInd.ItemIndex := 0;
end;

procedure TfrmClientCarteDlg.cmbGMATTotalClick(Sender: TObject);
begin
  grdGMAT.Cells[2,grdGMAT.row] := cmbGMATTotal.Text;
  cmbGMATTotal.Visible := False;
  cmbGMATTotal.ItemIndex := 0;
  if Length(grdGMAT.Cells[2,grdGMAT.row]) > 0 then fillScoreNoAuto(grdGMAT);

end;

procedure TfrmClientCarteDlg.cmbRankClick(Sender: TObject);
begin
  inherited;
  grdSchool.Cells[1,grdSchool.row] := cmbRank.Text;
  cmbRank.Visible := False;
  cmbRank.ItemIndex := 0;
end;

procedure TfrmClientCarteDlg.cmbRoundClick(Sender: TObject);
begin
  inherited;
  grdSchool.Cells[3,grdSchool.row] := cmbRound.Text;
  cmbRound.Visible := False;
  cmbRound.ItemIndex := 0;
end;

procedure TfrmClientCarteDlg.cmbSchoolClick(Sender: TObject);
var str: String;
begin
  inherited;
  grdSchool.Cells[2,grdSchool.row] := cmbSchool.Text;
  str := slSchoolId[cmbSchool.ItemIndex];
  if str <> '-1' then grdSchool.Cells[0,grdSchool.row] := str
                 else grdSchool.Cells[0,grdSchool.row] := '';
  cmbSchool.Visible := False;
  cmbSchool.ItemIndex := 0;
end;

procedure TfrmClientCarteDlg.cmbToeflIndClick(Sender: TObject);
begin
  case grdTOEFL.col of
    2,3,4,5,6: begin
      grdTOEFL.Cells[grdTOEFL.col,grdTOEFL.row] := cmbToeflInd.Text;
      if Length(grdTOEFL.Cells[grdTOEFL.col,grdTOEFL.row]) > 0 then fillScoreNoAuto(grdTOEFL);
    end;
  end;
  cmbToeflInd.Visible := False;
  cmbToeflInd.ItemIndex := 0;
end;

procedure TfrmClientCarteDlg.cmbToeflTotalClick(Sender: TObject);
begin
  grdTOEFL.Cells[2,grdTOEFL.row] := cmbToeflTotal.Text;
  cmbToeflTotal.Visible := False;
  cmbToeflTotal.ItemIndex := 0;
  if Length(grdTOEFL.Cells[2,grdTOEFL.row]) > 0 then fillScoreNoAuto(grdTOEFL);

end;
//コンボボックスはタイミングが違うかも(OnCloseUpの方が見た目の動き的に自然)
procedure TfrmClientCarteDlg.componentExit(Sender: TObject);
begin
  if isDynamicComp(Sender) then begin
    if Sender.ClassType = TCombobox then TCombobox(Sender).Visible := False
    else if Sender.ClassType = TDateTimePicker then TDateTimePicker(Sender).Visible := False;
  end;
end;

constructor TfrmClientCarteDlg.create(AOwner: TComponent);
begin
  inherited;
  cmbSchool := TComboBox.Create(Self);
  cmbSchool.Parent := pnlBasic;
  cmbRank := TComboBox.Create(Self);
  cmbRank.Parent := pnlBasic;
  cmbRound := TComboBox.Create(Self);
  cmbRound.Parent := pnlBasic;
  cmbToeflTotal := TComboBox.Create(Self);
  cmbToeflTotal.Parent := pnlTOEFL;
  cmbToeflInd := TComboBox.Create(Self);
  cmbToeflInd.Parent := pnlTOEFL;
  cmbGMATTotal := TComboBox.Create(Self);
  cmbGMATTotal.Parent := pnlGMAT;
  cmbGMATInd := TComboBox.Create(Self);
  cmbGMATInd.Parent := pnlGMAT;
  cmbGMATAWA := TComboBox.Create(Self);
  cmbGMATAWA.Parent := pnlGMAT;
  {edtDate := TDateTimePicker(Self);
  edtDate.Parent := pnlGMAT;
  edtDate.Visible := False;}
end;

procedure TfrmClientCarteDlg.createDeleteGMATSQL;
begin
  With SQLQuery1.SQL do begin
    Clear;
    Add('DELETE FROM CLIENT_GMAT');
    Add('WHERE CLIENT_ID =' + IntToStr(g_ClientId));
  end;
end;

procedure TfrmClientCarteDlg.createDeleteSchoolMapSQL;
begin
  With SQLQuery1.SQL do begin
    Clear;
    Add('DELETE FROM CLIENT_SCHOOL_MAP');
    Add('WHERE CLIENT_ID =' + IntToStr(g_ClientId));
  end;
end;

procedure TfrmClientCarteDlg.createDeleteTOEFLSQL;
begin
  With SQLQuery1.SQL do begin
    Clear;
    Add('DELETE FROM CLIENT_TOEFL');
    Add('WHERE CLIENT_ID =' + IntToStr(g_ClientId));
  end;
end;

procedure TfrmClientCarteDlg.createInsertClientSQL;
  function _String(str: String; isLast: Boolean = False): String;
  var comma: String;
  begin
    case isLast of
      True: comma := '';
      False: comma := ',';
    end;
    result := '''' + str + '''' + comma;
  end;
  function _Div(int: Integer; isLast: Boolean=False): String;
  var comma: String;
  begin
    case isLast of
      True: comma := '';
      False: comma := ',';
    end;
    result := cmbDivAllYesNo[int] + comma;
  end;
begin
  With SQLQuery1.SQL do begin
    Clear;
    Add('INSERT INTO CLIENT');
    Add('(CLIENT_ID,');
    Add('LAST_NAME,');
    Add('FIRST_NAME,');
    Add('MIDDLE_NAME,');
    Add('EMAIL_ADDRESS,');
    Add('WORK_PLACE,');
    Add('SPONSORED_FLG,');
    Add('UNIVERSITY_NAME,');
    Add('UNIVERSITY_MAJOR,');
    Add('UNIVERSITY_DEGREE,');
    Add('UNIVERSITY_GPA,');
    Add('ACADEMIC_AWARDS_FLG,');
    Add('PUBLICATION_FLG,');
    Add('STUDIED_ABROAD_FLG,');
    Add('STUDIED_ABROAD_PLACE,');
    Add('USE_ENGLISH_AT_WORK_FLG,');
    Add('FUTURE_GOAL,');
    Add('CLIENT_MEMO,');
    Add('COUNSELOR_MEMO)');
    Add('VALUES(');
    Add(IntToStr(g_ClientId) + ',');
    Add(_String(edtLastName.Text));
    Add(_String(edtFirstName.Text));
    Add('''' + '''' + ',');
    Add(_String(edtEmail.Text));
    Add(_String(edtWorkPlace.Text));
    Add(_Div(cmbSponsored.ItemIndex));
    Add(_String(edtUniversityName.Text));
    Add(_String(edtMajor.Text));
    Add(_String(edtDegree.Text));
    Add(_String(edtGPA.Text));
    Add(_Div(cmbAcademicAward.ItemIndex));
    Add(_Div(cmbPublication.ItemIndex));
    Add(_Div(cmbStudyAbroad.ItemIndex));
    Add(_String(edtPlace.Text));
    Add(_Div(cmbUseEnglish.ItemIndex));
    Add(_String(edtFutureGoal.Text));
    Add(_String(''));
    Add(_String('',True));
    Add(')');
  end;
end;

procedure TfrmClientCarteDlg.createInsertSchoolMapSQL;
var i: Integer;
begin
  With SQLQuery1.SQL do begin
    Clear;
    Add('INSERT INTO CLIENT_SCHOOL_MAP');
    Add('(CLIENT_ID,');
    Add('SCHOOL_ID,');
    Add('PERSONAL_RANK,');
    Add('ROUND,');
    Add('RESULT');
    Add(')VALUES');
    for i := 1 to grdSchool.RowCount -1 do begin
      Add('(' + IntToStr(g_ClientId)+ ',');
      Add(grdSchool.Cells[0,i] + ',');
      Add(grdSchool.Cells[1,i] + ',');
      Add(grdSchool.Cells[3,i] + ',');
      Add('''' + '''' + ')');
      if i < grdSchool.RowCount -1 then Add(',');
    end;
  end;
end;

procedure TfrmClientCarteDlg.createInsertTOEFLSQL;
  function _String(str: String; isLast: Boolean = False): String;
  var comma: String;
  begin
    case isLast of
      True: comma := '';
      False: comma := ',';
    end;
    result := '''' + str + '''' + comma;
  end;
  function _Integer(str: String; isLast: Boolean = False): String;
  var comma: String;
  begin
    case isLast of
      True: comma := '';
      False: comma := ',';
    end;
    if Length(str) > 0 then result := str
                       else result := '0';
    result := result + comma;
  end;
var i: Integer;
    str: String;
begin
  With SQLQuery1.SQL do begin
    Clear;
    Add('INSERT INTO CLIENT_TOEFL');
    Add('(CLIENT_ID,');
    Add('SCORE_NO,');
    Add('TEST_DATE,');
    Add('TOTAL,');
    Add('READING,');
    Add('LISTENING,');
    Add('SPEAKING,');
    Add('WRITING ,');
    Add('MEMO');
    Add(')VALUES');
    for i := 1 to grdTOEFL.RowCount -1 do begin
      Add('(' + IntToStr(g_ClientId)+ ',');
      Add(_Integer(grdTOEFL.Cells[0,i]));
      Add(_String(grdTOEFL.Cells[1,i]));
      Add(_Integer(grdTOEFL.Cells[2,i]));
      Add(_Integer(grdTOEFL.Cells[3,i]));
      Add(_Integer(grdTOEFL.Cells[4,i]));
      Add(_Integer(grdTOEFL.Cells[5,i]));
      Add(_Integer(grdTOEFL.Cells[6,1]));
      Add(_String(grdTOEFL.Cells[7,i],True) + ')');
      if i < grdTOEFL.RowCount -1 then Add(',');
    end;
  end;
end;

procedure TfrmClientCarteDlg.createUpdateClientSQL;
  function _String(str: String; isLast: Boolean = False): String;
  var comma: String;
  begin
    case isLast of
      True: comma := '';
      False: comma := ',';
    end;
    result := '''' + str + '''' + comma;
  end;
  function _Div(int: Integer; isLast: Boolean=False): String;
  var comma: String;
  begin
    case isLast of
      True: comma := '';
      False: comma := ',';
    end;
    result := cmbDivAllYesNo[int] + comma;
  end;
begin
  With SQLQuery1.SQL do begin
    Clear;
    Add('UPDATE CLIENT ');
    Add('  SET ');
    Add('LAST_NAME =' + _String(edtLastName.Text));
    Add('FIRST_NAME =' + _String(edtFirstName.Text));
    Add('MIDDLE_NAME =' + _String(''));
    Add('EMAIL_ADDRESS =' + _String(edtEmail.Text));
    Add('WORK_PLACE =' + _String(edtWorkPlace.Text));
    Add('SPONSORED_FLG =' + _Div(cmbSponsored.ItemIndex));
    Add('UNIVERSITY_NAME =' + _String(edtUniversityName.Text));
    Add('UNIVERSITY_MAJOR =' + _String(edtMajor.Text));
    Add('UNIVERSITY_DEGREE =' + _String(edtDegree.Text));
    Add('UNIVERSITY_GPA =' + _String(edtGPA.Text));
    Add('ACADEMIC_AWARDS_FLG =' + _Div(cmbAcademicAward.ItemIndex));
    Add('PUBLICATION_FLG =' + _Div(cmbPublication.ItemIndex));
    Add('STUDIED_ABROAD_FLG =' + _Div(cmbStudyAbroad.ItemIndex));
    Add('STUDIED_ABROAD_PLACE =' + _String(edtPlace.Text));
    Add('USE_ENGLISH_AT_WORK_FLG =' + _Div(cmbUseEnglish.ItemIndex));
    Add('FUTURE_GOAL =' + _String(edtFutureGoal.Text));
    Add('CLIENT_MEMO =' + _String(''));
    Add('COUNSELOR_MEMO =' + _String('',True));
    Add(' WHERE CLIENT_ID = ' + IntToStr(g_ClientId));
  end;
end;

procedure TfrmClientCarteDlg.createInsertGMATSQL;
  function _String(str: String; isLast: Boolean = False): String;
  var comma: String;
  begin
    case isLast of
      True: comma := '';
      False: comma := ',';
    end;
    if Length(Trim(str)) = 0 then result := 'null' + comma
                             else result := '''' + str + '''' + comma;
  end;
  function _Integer(str: String; isLast: Boolean = False): String;
  var comma: String;
  begin
    case isLast of
      True: comma := '';
      False: comma := ',';
    end;
    if Length(str) > 0 then result := str
                       else result := '0';
    result := result + comma;
  end;
var i: Integer;
    str: String;
begin
  With SQLQuery1.SQL do begin
    Clear;
    Add('INSERT INTO CLIENT_GMAT');
    Add('(CLIENT_ID,');
    Add('SCORE_NO,');
    Add('TEST_DATE,');
    Add('TOTAL,');
    Add('VERBAL,');
    Add('MATH,');
    Add('AWA,');
    Add('INTEGRATED_REASONING ,');
    Add('MEMO');
    Add(')VALUES');
    for i := 1 to grdGMAT.RowCount -1 do begin
      Add('(' + IntToStr(g_ClientId)+ ',');
      Add(_Integer(grdGMAT.Cells[0,i]));
      Add(_String(grdGMAT.Cells[1,i]));
      Add(_Integer(grdGMAT.Cells[2,i]));
      Add(_Integer(grdGMAT.Cells[3,i]));
      Add(_Integer(grdGMAT.Cells[4,i]));
      Add(_Integer(grdGMAT.Cells[5,i]));
      Add(_Integer(grdGMAT.Cells[6,i]));
      Add(_String(grdGMAT.Cells[7,i],True) + ')');
      if i < grdGMAT.RowCount -1 then Add(',');
    end;
  end;
end;

procedure TfrmClientCarteDlg.deleteRow(sg: TStringGrid);
var
  i,j: Integer;
begin
  with sg do begin
    if RowCount = 2 then for i := 0 to ColCount - 1 do Cells[i, 1] := ''
    else begin
      for j := Row to RowCount -2 do for i :=0 to ColCount -1 do Cells[i, j] := Cells[i, j+1];
      for i := 0 to ColCount do Cells[i, RowCount -1] := '';
      RowCount :=RowCount -1;
    end;
  end;
end;

procedure TfrmClientCarteDlg.edtDateExit(Sender: TObject);
var grd:TStringGrid;
begin
  inherited;
  if edtDate.Parent = pnlGMAT then grd := grdGMAT
  else if edtDate.Parent = pnlTOEFL then grd := grdTOEFL
  else exit;//グリッドが設定できない場合は後続進まないのでExit
  grd.Cells[grd.Col,grd.Row] := FormatDateTime('yyyy/mm/dd',edtDate.Date);
  edtDate.Visible := False;
end;

procedure TfrmClientCarteDlg.fillScoreNoAuto(sg: TStringGrid);
begin
  if sg.Cells[0,sg.Row] = '' then sg.Cells[0,sg.Row] := IntToStr(sg.Row);
end;

procedure TfrmClientCarteDlg.getClientInfo;
begin
  With SQLQuery1.SQL do begin
    Clear;
    Add('SELECT ');
    Add('CLIENT_ID,');
    Add('LAST_NAME,');
    Add('FIRST_NAME,');
    Add('MIDDLE_NAME,');
    Add('EMAIL_ADDRESS,');
    Add('WORK_PLACE,');
    Add('SPONSORED_FLG,');
    Add('UNIVERSITY_NAME,');
    Add('UNIVERSITY_MAJOR,');
    Add('UNIVERSITY_DEGREE,');
    Add('UNIVERSITY_GPA,');
    Add('ACADEMIC_AWARDS_FLG,');
    Add('PUBLICATION_FLG,');
    Add('STUDIED_ABROAD_FLG,');
    Add('STUDIED_ABROAD_PLACE,');
    Add('USE_ENGLISH_AT_WORK_FLG,');
    Add('FUTURE_GOAL,');
    Add('CLIENT_MEMO,');
    Add('COUNSELOR_MEMO');
    Add(' FROM CLIENT ');
    Add(' WHERE CLIENT_ID = ' + IntToStr(g_ClientId));
  end;
  cdsClientCarte.Open;
  edtLastName.Text := cdsClientCarte.Fields[1].AsString;
  edtFirstName.Text := cdsClientCarte.Fields[2].AsString;
  //MiddleName
  edtEmail.Text := cdsClientCarte.Fields[4].AsString;
  edtWorkPlace.Text := cdsClientCarte.Fields[5].AsSTring;
  cmbSponsored.ItemIndex := getcmbIndex(cdsClientCarte.Fields[6].AsInteger);
  edtUniversityName.Text := cdsClientCarte.Fields[7].AsString;
  edtMajor.Text := cdsClientCarte.Fields[8].AsString;
  edtDegree.Text := cdsClientCarte.Fields[9].AsString;
  edtGPA.Text := cdsClientCarte.Fields[10].AsString;
  cmbAcademicAward.ItemIndex := getcmbIndex(cdsClientCarte.Fields[11].AsInteger);
  cmbPublication.ItemIndex := getcmbIndex(cdsClientCarte.Fields[12].AsInteger);
  cmbStudyAbroad.ItemIndex := getcmbIndex(cdsClientCarte.Fields[13].AsInteger);
  edtPlace.Text := cdsClientCarte.Fields[14].AsString;
  cmbUseEnglish.ItemIndex := getcmbIndex(cdsClientCarte.Fields[15].AsInteger);
  edtFutureGoal.Text := cdsClientCarte.Fields[16].AsString;
  cdsClientCarte.Close;
end;

function TfrmClientCarteDlg.getcmbIndex(intDiv: Integer): Integer;
var i:Integer;
begin
  result := -1;
  for i := 0 to 2 do begin
    if IntToStr(intDiv) = cmbDivAllYesNo[i] then begin
      result := i;
      break;
    end;
  end;
end;

procedure TfrmClientCarteDlg.getGMATInfo;
var i:Integer;
begin
  With SQLQuery1.SQL do begin
    Clear;
    Add('SELECT ');
    Add('    SCORE_NO,');
    Add('    TEST_DATE,');
    Add('    TOTAL,');
    Add('    VERBAL,');
    Add('    MATH,');
    Add('    AWA,');
    Add('    INTEGRATED_REASONING,');
    Add('    MEMO');
    Add(' FROM');
    Add('    CLIENT_GMAT');
    Add(' WHERE CLIENT_ID = ' + IntToStr(g_ClientId));
    Add(' ORDER BY SCORE_NO DESC');
  end;
  cdsClientCarte.Close;
  cdsClientCarte.Open;
  if cdsClientCarte.RecordCount = 0 then grdGMAT.RowCount := 2
                                    else grdGMAT.RowCount := cdsClientCarte.RecordCount + 1;
  for i := 1 to cdsClientCarte.RecordCount do begin
    grdGMAT.Cells[0,i] := cdsClientCarte.Fields[0].AsString;
    grdGMAT.Cells[1,i] := cdsClientCarte.Fields[1].AsString;
    grdGMAT.Cells[2,i] := cdsClientCarte.Fields[2].AsString;
    grdGMAT.Cells[3,i] := cdsClientCarte.Fields[3].AsString;
    grdGMAT.Cells[4,i] := cdsClientCarte.Fields[4].AsString;
    grdGMAT.Cells[5,i] := cdsClientCarte.Fields[5].AsString;
    grdGMAT.Cells[6,i] := cdsClientCarte.Fields[6].AsString;
    grdGMAT.Cells[7,i] := cdsClientCarte.Fields[7].AsString;
    cdsClientCarte.Next;
  end;
end;

procedure TfrmClientCarteDlg.getSchoolInfo;
var i:Integer;
begin
  With SQLQuery1.SQL do begin
    Clear;
    Add('SELECT ');
    Add('    C.SCHOOL_ID,');
    Add('    C.PERSONAL_RANK,');
    Add('    S.SCHOOL_NAME,');
    Add('    C.ROUND,');
    Add('    C.RESULT');
    Add(' FROM');
    Add('    CLIENT_SCHOOL_MAP C');
    Add('        INNER JOIN');
    Add('    SCHOOL S ON C.SCHOOL_ID = S.SCHOOL_ID');
    Add(' WHERE C.CLIENT_ID = ' + IntToStr(g_ClientId));
    Add(' ORDER BY C.PERSONAL_RANK');
  end;
  cdsClientCarte.Open;
  if cdsClientCarte.RecordCount = 0 then grdSchool.RowCount := 2
                                    else grdSchool.RowCount := cdsClientCarte.RecordCount + 1;
  for i := 1 to cdsClientCarte.RecordCount do begin
    grdSchool.Cells[0,i] := cdsClientCarte.Fields[0].AsString;
    grdSchool.Cells[1,i] := cdsClientCarte.Fields[1].AsString;
    grdSchool.Cells[2,i] := cdsClientCarte.Fields[2].AsString;
    grdSchool.Cells[3,i] := cdsClientCarte.Fields[3].AsString;
    cdsClientCarte.Next;
  end;
end;

procedure TfrmClientCarteDlg.getTOEFLInfo;
var i:Integer;
begin
  With SQLQuery1.SQL do begin
    Clear;
    Add('SELECT ');
    Add('    SCORE_NO,');
    Add('    TEST_DATE,');
    Add('    TOTAL,');
    Add('    READING,');
    Add('    LISTENING,');
    Add('    SPEAKING,');
    Add('    WRITING,');
    Add('    MEMO');
    Add(' FROM');
    Add('    CLIENT_TOEFL');
    Add(' WHERE CLIENT_ID = ' + IntToStr(g_ClientId));
    Add(' ORDER BY SCORE_NO DESC');
  end;
  cdsClientCarte.Close;
  cdsClientCarte.Open;
  With grdTOEFL do begin
    if cdsClientCarte.RecordCount = 0 then RowCount := 2
                                      else RowCount := cdsClientCarte.RecordCount + 1;
    for i := 1 to cdsClientCarte.RecordCount do begin
      Cells[0, i] := cdsClientCarte.Fields[0].AsString;
      Cells[1, i] := cdsClientCarte.Fields[1].AsString;
      Cells[2, i] := cdsClientCarte.Fields[2].AsString;
      Cells[3, i] := cdsClientCarte.Fields[3].AsString;
      Cells[4, i] := cdsClientCarte.Fields[4].AsString;
      Cells[5, i] := cdsClientCarte.Fields[5].AsString;
      Cells[6, i] := cdsClientCarte.Fields[6].AsString;
      Cells[7, i] := cdsClientCarte.Fields[7].AsString;
      cdsClientCarte.Next;
    end;
  end;
end;

procedure TfrmClientCarteDlg.grdGMATClick(Sender: TObject);
var
  c, r: Integer;
begin
  inherited;
  hideAllcmb;
  c := grdGMAT.Col;
  r := grdGMAT.Row;
  Case grdGMAT.Col of
    1: begin
      edtDate.Parent := pnlGMAT;
      edtDate.Top := grdGMAT.Top + grdGMAT.CellRect(c,r).Top + 1;
      edtDate.Height := grdGMAT.RowHeights[grdGMAT.row];
      edtDate.Left := grdGMAT.Left + grdGMAT.CellRect(c,r).Left + 1;
      edtDate.Width := grdGMAT.ColWidths[grdGMAT.col];
      if Length(grdGMAT.Cells[c,r]) > 0 then edtDate.Date := StrToDateDef(grdGMAT.Cells[c,r],Now);
      edtDate.Visible := True;
      edtDate.SetFocus;
    end;
    2: begin
      cmbGMATTotal.Top := grdGMAT.Top + grdGMAT.CellRect(c,r).Top + 1;
      cmbGMATTotal.Height := grdGMAT.RowHeights[grdGMAT.row];
      cmbGMATTotal.Left := pnlGMAT.Left + grdGMAT.Left + grdGMAT.CellRect(c,r).Left + 1;
      cmbGMATTotal.Width := grdGMAT.ColWidths[grdGMAT.col];
      cmbGMATTotal.Visible := True;
      cmbGMATTotal.DroppedDown := True;
      cmbGMATTotal.SetFocus;
    end;
    3: begin
      cmbGMATInd.Top :=  grdGMAT.Top + grdGMAT.CellRect(c,r).Top + 1;
      cmbGMATInd.Height := grdGMAT.RowHeights[grdGMAT.row];
      cmbGMATInd.Left := pnlGMAT.Left + grdGMAT.Left + grdGMAT.CellRect(c,r).Left + 1;
      cmbGMATInd.Width := grdGMAT.ColWidths[grdGMAT.col];
      cmbGMATInd.Visible := True;
      cmbGMATInd.DroppedDown := True;
      cmbGMATInd.SetFocus;
    end;
    4: begin
      cmbGMATInd.Top :=  grdGMAT.Top + grdGMAT.CellRect(c,r).Top + 1;
      cmbGMATInd.Height := grdGMAT.RowHeights[grdGMAT.row];
      cmbGMATInd.Left := pnlGMAT.Left + grdGMAT.Left + grdGMAT.CellRect(c,r).Left + 1;
      cmbGMATInd.Width := grdGMAT.ColWidths[grdGMAT.col];
      cmbGMATInd.Visible := True;
      cmbGMATInd.DroppedDown := True;
      cmbGMATInd.SetFocus;
    end;
    5: begin
      cmbGMATAWA.Top :=  grdGMAT.Top + grdGMAT.CellRect(c,r).Top + 1;
      cmbGMATAWA.Height := grdGMAT.RowHeights[grdGMAT.row];
      cmbGMATAWA.Left := pnlGMAT.Left + grdGMAT.Left + grdGMAT.CellRect(c,r).Left + 1;
      cmbGMATAWA.Width := grdGMAT.ColWidths[grdGMAT.col];
      cmbGMATAWA.Visible := True;
      cmbGMATAWA.DroppedDown := True;
      cmbGMATAWA.SetFocus;
    end;
  end;
end;

procedure TfrmClientCarteDlg.grdSchoolClick(Sender: TObject);
var c,r: Integer;
begin
  inherited;
  hideAllcmb;
  c := grdSchool.Col;
  r := grdSchool.Row;
  Case grdSchool.Col of
    1: begin
      cmbRank.Top :=  grdSchool.Top + grdSchool.CellRect(c,r).Top + 1;
      cmbRank.Height := grdSchool.RowHeights[grdschool.row];
      cmbRank.Left := pnlUpperGrid.Left + grdSchool.Left + grdSchool.CellRect(c,r).Left + 1;
      cmbRank.Width := grdSchool.ColWidths[grdSchool.col];
      cmbRank.Visible := True;
      cmbRank.DroppedDown := True;
    end;
    2: begin
      cmbSchool.Top := grdSchool.Top + grdSchool.CellRect(c,r).Top + 1;
      cmbSchool.Height := grdSchool.RowHeights[grdschool.row];
      cmbSchool.Left := pnlUpperGrid.Left + grdSchool.Left + grdSchool.CellRect(c,r).Left + 1;
      cmbSchool.Width := grdSchool.ColWidths[grdSchool.col];
      cmbSchool.Visible := True;
      cmbSchool.DroppedDown := True;
    end;
    3: begin
      cmbRound.Top :=  grdSchool.Top + grdSchool.CellRect(c,r).Top + 1;
      cmbRound.Height := grdSchool.RowHeights[grdschool.row];
      cmbRound.Left := pnlUpperGrid.Left + grdSchool.Left + grdSchool.CellRect(c,r).Left + 1;
      cmbRound.Width := grdSchool.ColWidths[grdSchool.col];
      cmbRound.Visible := True;
      cmbRound.DroppedDown := True;
    end;
  end;
end;

procedure TfrmClientCarteDlg.grdTOEFLClick(Sender: TObject);
var c,r: Integer;
begin
  inherited;
  hideAllcmb;
  c := grdTOEFL.Col;
  r := grdTOEFL.Row;
  Case grdTOEFL.Col of
    1: begin
      edtDate.Parent := pnlTOEFL;
      edtDate.Top := grdTOEFL.Top + grdTOEFL.CellRect(c,r).Top + 1;
      edtDate.Height := grdTOEFL.RowHeights[grdTOEFL.row];
      edtDate.Left := grdTOEFL.Left + grdTOEFL.CellRect(c,r).Left + 1;
      edtDate.Width := grdTOEFL.ColWidths[grdTOEFL.Col];
      if Length(grdTOEFL.Cells[c,r]) > 0 then edtDate.Date := StrToDateDef(grdTOEFL.Cells[c,r],Now);
      edtDate.Visible := True;
      edtDate.SetFocus;
    end;
    2: begin
      cmbToeflTotal.Top := grdTOEFL.Top + grdTOEFL.CellRect(c,r).Top + 1;
      cmbToeflTotal.Height := grdTOEFL.RowHeights[grdtoefl.row];
      cmbToeflTotal.Left := grdTOEFL.Left + grdTOEFL.CellRect(c,r).Left + 1;
      cmbToeflTotal.Width := grdTOEFL.ColWidths[grdtoefl.col];
      cmbToeflTotal.Visible := True;
      cmbToeflTotal.DroppedDown := True;
    end;
    3: begin
      cmbToeflInd.Top :=  grdTOEFL.Top + grdTOEFL.CellRect(c,r).Top + 1;
      cmbToeflInd.Height := grdTOEFL.RowHeights[grdtoefl.row];
      cmbToeflInd.Left := grdTOEFL.Left + grdTOEFL.CellRect(c,r).Left + 1;
      cmbToeflInd.Width := grdTOEFL.ColWidths[grdtoefl.col];
      cmbToeflInd.Visible := True;
      cmbToeflInd.DroppedDown := True;
    end;
    4: begin
      cmbToeflInd.Top :=  grdTOEFL.Top + grdTOEFL.CellRect(c,r).Top + 1;
      cmbToeflInd.Height := grdTOEFL.RowHeights[grdtoefl.row];
      cmbToeflInd.Left := grdTOEFL.Left + grdTOEFL.CellRect(c,r).Left + 1;
      cmbToeflInd.Width := grdTOEFL.ColWidths[grdtoefl.col];
      cmbToeflInd.Visible := True;
      cmbToeflInd.DroppedDown := True;
    end;
    5: begin
      cmbToeflInd.Top :=  grdTOEFL.Top + grdTOEFL.CellRect(c,r).Top + 1;
      cmbToeflInd.Height := grdTOEFL.RowHeights[grdtoefl.row];
      cmbToeflInd.Left := grdTOEFL.Left + grdTOEFL.CellRect(c,r).Left + 1;
      cmbToeflInd.Width := grdTOEFL.ColWidths[grdtoefl.col];
      cmbToeflInd.Visible := True;
      cmbToeflInd.DroppedDown := True;
    end;
    6: begin
      cmbToeflInd.Top :=  grdTOEFL.Top + grdTOEFL.CellRect(c,r).Top + 1;
      cmbToeflInd.Height := grdTOEFL.RowHeights[grdtoefl.row];
      cmbToeflInd.Left := grdTOEFL.Left + grdTOEFL.CellRect(c,r).Left + 1;
      cmbToeflInd.Width := grdTOEFL.ColWidths[grdtoefl.col];
      cmbToeflInd.Visible := True;
      cmbToeflInd.DroppedDown := True;
    end;
  end;
end;

function TfrmClientCarteDlg.hasRecord(sg: TStringGrid): Boolean;
var i:Integer;
begin
  result := False;
  case sg.RowCount of
    1: exit; //ありえないけど万一あった場合はFalse
    2: begin
      for i := 0 to sg.ColCount do begin
        if Length(sg.Cells[i,1]) > 0 then begin
          result := True;
          exit;
        end;
      end;
    end else result := True;
  end;
end;

procedure TfrmClientCarteDlg.hideAllcmb;
begin
  cmbSchool.Visible := False;
  cmbRank.Visible := False;
  cmbRound.Visible := False;
  cmbToeflTotal.Visible := False;
  cmbToeflInd.Visible := False;
  cmbGMATTotal.Visible := False;
  cmbGMATInd.Visible := False;
  cmbGMATAWA.Visible := False;
  edtDate.Visible := False;
end;

procedure TfrmClientCarteDlg.initialize(OpenMode: TOpenMode; conn:TSQLConnection);
begin
  SQLQuery1.SQLConnection := conn;
  setupGrdSchool;
  setupCombobox;
  case OpenMode of
    omNew: initializeNew;//新規作成
    omModify: initializeModify;//変更
  end;
end;

procedure TfrmClientCarteDlg.initializeModify;
begin
  btnOK.Caption := 'Update';
  //ClientIdからclient、client_school_map、client_toefl、client_gmat取得
  getClientInfo;
  getSchoolInfo;
  getGMATInfo;
  getTOEFLInfo;
end;

procedure TfrmClientCarteDlg.initializeNew;
begin
  btnOK.Caption := 'Register';
  //ClientId最大値取得
  SQLQuery1.SQL.Clear;
  SQLQuery1.SQL.Add('SELECT MAX(CLIENT_ID) + 1 FROM CLIENT');
  cdsClientCarte.Open;
  g_ClientId := StrToIntDef(cdsClientCarte.Fields[0].AsString,-1);
  //ShowMessage(IntToStr(m_ClientId));

end;

function TfrmClientCarteDlg.isDynamicComp(Sender: TObject): Boolean;
begin
  result := False;
  if (Sender = cmbSchool)
  OR (Sender = cmbRank)
  OR (Sender = cmbRound)
  OR (Sender = cmbGMATTotal)
  OR (Sender = cmbGMATInd)
  OR (Sender = cmbGMATAWA)
  OR (Sender = cmbToeflTotal)
  OR (Sender = cmbToeflInd) then result := True;
end;

function TfrmClientCarteDlg.isSufficientRecord: Boolean;
begin
  result := True;
  try
    resetLabelColor;
    //Client入力項目チェック
    if not checkRequiredValue(edtFirstName) then result := False;
    if not checkRequiredValue(edtLastName) then result := False;
    if not checkRequiredValue(edtEmail) then result := False;
    if StrToFloatDef(edtGPA.Text,-1) = -1 then begin
      if MessageDlg('GPA Entered Is Not Number' + #13#10
                    + 'Put 0 Automatically?',mtConfirmation,[mbYes,mbNo],0,mbYes) <> mrYes then begin
                      lblGPA.Color := clError;
                      result := False;
                    end else edtGPA.Text := '0';
    end;
    //School入力チェック
    if not checkStringGridIdDuplication(grdSchool,0) then result := False;
    //GMAT入力チェック
    if not checkStringGridIdDuplication(grdGMAT,0) then result := False;
    //TOEFL入力チェック
    if not checkStringGridIdDuplication(grdTOEFL,0) then result := False;
  except
    result := False;
  end;
end;

function TfrmClientCarteDlg.ModifyRecord: String;
var tran: TDBXTransaction;
begin
  try
    //Check
    if not isSufficientRecord then begin
      result := 'Data is not sufficient.';
      exit;
    end;

    tran := SQLQuery1.SQLConnection.BeginTransaction;
    //Update Client
    createUpdateClientSQL;
    SQLQuery1.ExecSQL();
    //Delete Insert School_Map
    createDeleteSchoolMapSQL;
    SQLQuery1.ExecSQL();
    if hasRecord(grdSchool) then begin
      createInsertSchoolMapSQL;
      SQLQuery1.ExecSQL();
    end;
    //Delete Insert GMAT
    createDeleteGMATSQL;
    SQLQuery1.ExecSQL();
    if hasRecord(grdGMAT) then begin
      createInsertGMATSQL;
      SQLQuery1.ExecSQL();
    end;
    //Delete Insert TOEFL
    createDeleteTOEFLSQL;
    SQLQuery1.ExecSQL();
    if hasRecord(grdTOEFL) then begin
      createInsertTOEFLSQL;
      SQLQuery1.ExecSQL();
    end;

    SQLQuery1.SQLConnection.CommitFreeAndNil(tran);
    result := '';
  except
    on E: Exception do begin
      SQLQuery1.SQLConnection.RollbackFreeAndNil(tran);
      result := e.Message + ':' + e.StackTrace;
    end;
  end;
end;

procedure TfrmClientCarteDlg.resetLabelColor;
var i :Integer;
begin
  for i := 0 to pnlBasic.ControlCount -1 do begin
    if pnlBasic.Controls[i].ClassType = TLabel then TLabel(pnlBasic.Controls[i]).Color := pnlBasic.Color;
  end;
end;

procedure TfrmClientCarteDlg.setupCombobox;
var i: Integer;
begin
  cmbSchool.Items := SchoolList;
  cmbSchool.Items[0] := '';
  cmbSchool.OnClick := cmbSchoolClick;
  cmbSchool.Visible := False;
  cmbSchool.OnCloseUp := componentExit;
  for i := 1 to 30 do cmbRank.Items.Add(IntToStr(i));
  cmbRank.OnClick := cmbRankClick;
  cmbRank.Visible := False;
  cmbRank.OnCloseUp := componentExit;
  for i := 1 to 4 do cmbRound.Items.Add(IntToStr(i));
  cmbRound.OnClick := cmbRoundClick;
  cmbRound.Visible := False;
  cmbRound.OnCloseUp := componentExit;
  for i := 120 downto 60 do cmbToeflTotal.Items.Add(IntToStr(i));
  cmbToeflTotal.OnClick := cmbToeflTotalClick;
  cmbToeflTotal.Visible := False;
  cmbToeflTotal.OnCloseUp := componentExit;
  for i := 30 downto 0 do cmbToeflInd.Items.Add(IntToStr(i));
  cmbToeflInd.OnClick := cmbToeflIndClick;
  cmbToeflInd.Visible := False;
  cmbToeflInd.OnCloseUp := componentExit;
  for i := 80 downto 0 do cmbGMATTotal.Items.Add(IntToStr(i * 10));
  cmbGMATTotal.OnClick := cmbGMATTotalClick;
  cmbGMATTotal.Visible := False;
  cmbGMATTotal.OnCloseUp := componentExit;
  for i := 70 downto 0 do cmbGMATInd.Items.Add(IntToStr(i));
  cmbGMATInd.OnClick := cmbGMATIndClick;
  cmbGMATInd.Visible := False;
  cmbGMATInd.OnCloseUp := componentExit;
  for i := 12 downto 0 do cmbGMATAWA.Items.Add(FloatToStr(i/2));
  cmbGMATAWA.OnClick := cmbGMATAWAClick;
  cmbGMATAWA.Visible := False;
  cmbGMATAWA.OnCloseUp := componentExit;
end;

procedure TfrmClientCarteDlg.setupGrdSchool;
begin
  With grdSchool do begin
  grdSchool.RowCount := 2;
    ColCount := 4;
    Cells[0, 0] := 'SCHOOL_ID';
    Cells[1, 0] := 'PERSONAL_RANK';
    ColWidths[1] := 100;
    Cells[2, 0] := 'SCHOOL_NAME';
    ColWidths[2] := 236;
    Cells[3, 0] := 'ROUND';
    ColWidths[3] := 80;
  end;

  With grdTOEFL do
  begin
    RowCount := 2;
    ColCount := 8;
    DefaultColWidth := 100;
    Cells[0, 0] := 'SCORE_NO';
    Cells[1, 0] := 'TEST_DATE';
    Cells[2, 0] := 'TOTAL';
    Cells[3, 0] := 'READING';
    Cells[4, 0] := 'LISTENNG';
    Cells[5, 0] := 'SPEAKING';
    Cells[6, 0] := 'WRITING';
    Cells[7, 0] := 'MEMO';
  end;

  With grdGMAT do
  begin
    RowCount := 2;
    ColCount := 8;
    DefaultColWidth := 100;
    Cells[0, 0] := 'SCORE_NO';
    Cells[1, 0] := 'TEST_DATE';
    Cells[2, 0] := 'TOTAL';
    Cells[3, 0] := 'VERBAL';
    Cells[4, 0] := 'MATH';
    Cells[5, 0] := 'AWA';
    Cells[6, 0] := 'IR';
    Cells[7, 0] := 'MEMO';
  end;
end;

procedure TfrmClientCarteDlg.SpeedButton1Click(Sender: TObject);
begin
  inherited;
  addNewRow(grdTOEFL);
end;

procedure TfrmClientCarteDlg.SpeedButton2Click(Sender: TObject);
begin
  inherited;
  deleteRow(grdTOEFL);
end;

procedure TfrmClientCarteDlg.Splitter1Moved(Sender: TObject);
begin
  inherited;
  pnlGMAT.Width := pnlBasic.Width;
end;

procedure TfrmClientCarteDlg.Splitter3Moved(Sender: TObject);
begin
  inherited;
  pnlBasic.Width := pnlGMAT.Width;
end;

end.
