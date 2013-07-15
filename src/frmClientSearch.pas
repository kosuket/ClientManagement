unit frmClientSearch;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.FMTBcd,
  Vcl.AppEvnts, Datasnap.Provider, Data.DB, Datasnap.DBClient, Data.SqlExpr,
  Vcl.StdCtrls, Vcl.Imaging.jpeg, Vcl.ExtCtrls, Vcl.Samples.Spin, Vcl.ComCtrls,
  Vcl.Grids, Vcl.DBGrids, FWGridBasefrm,frmClientdlg,frmMaildlg, Vcl.Buttons;

type
  TClientSearchframe = class(TFWGridBaseframe)
    pgctrlCond: TPageControl;
    tbBasic: TTabSheet;
    ScrollBox1: TScrollBox;
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
    tbSchoolScore: TTabSheet;
    pnlSchoolScore: TPanel;
    lblSchool: TLabel;
    lblRound: TLabel;
    lblGMAT: TLabel;
    lblTOEFL: TLabel;
    cmbSchoolName: TComboBox;
    cmbRound: TComboBox;
    edtGMATScore: TSpinEdit;
    cmbGMATCond: TComboBox;
    edtTOEFLScore: TSpinEdit;
    cmbTOEFLCond: TComboBox;
    btnAdd: TButton;
    Memo1: TMemo;
    btnMail: TButton;
    btnClear: TButton;
    procedure btnAddClick(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure btnMailClick(Sender: TObject);
    procedure btnClearClick(Sender: TObject);
  private
    { Private declarations }
      slSchoolId: TStringList;
      procedure clearCond(ctrl:TWinControl);
  protected
    //SQL生成関係
    procedure createSQLFix;  override;
    procedure createWhere;  override;
  public
    { Public declarations }
    frmClientDialog: TfrmClientCarteDlg;
    frmMailDialog: TMailDlgframe;
    constructor create(AOwner: TComponent); override;
    procedure Initialize; override;
  end;

var
  ClientSearchframe: TClientSearchframe;
const
  cmbIndexYes = 1;
  cmbIndexNo  = 2;
  cmbIndexAll = 0;
  defGMATValue =700;
  defTOEFLTValue=100;
  cmbDivAllYesNo : Array[0..2] of String =(
  '-1',
  '1',
  '0');
implementation

{$R *.dfm}

procedure TClientSearchframe.btnAddClick(Sender: TObject);
begin
  inherited;
  try
    frmClientDialog := TfrmClientCarteDlg.Create(Self);
    frmClientDialog.g_OpenMode := omNew;
    frmClientDialog.SchoolList := cmbSchoolName.Items;
    frmClientDialog.slSchoolId := slSchoolId;
    frmClientDialog.initialize(omNew,SQLQuery1.SQLConnection);
    frmClientDialog.ShowModal;
  finally
    frmClientDialog.Destroy;
  end;
end;

procedure TClientSearchframe.btnClearClick(Sender: TObject);
begin
  inherited;
  clearCond(pgctrlCond);
end;

procedure TClientSearchframe.btnMailClick(Sender: TObject);
var slRecepient,slAddress: TStringList;
    i: Integer;
begin
  inherited;
  if not DBGrid1.DataSource.DataSet.Active then begin
    ShowMessage('Data Not Loaded');
    exit;
  end;
  if Length(DBGrid1.Fields[3].Text) = 0 then begin
    ShowMessage('Mail Address Cannot Be Specified');
    exit;
  end;
  slRecepient := TStringList.Create;
  slAddress := TStringList.Create;
  try
    DBGrid1.DataSource.DataSet.First;
    for i := 0 to DBGrid1.DataSource.DataSet.RecordCount -1 do begin
      slRecepient.Add(DBGrid1.Fields[1].Text + ' ' + DBGrid1.Fields[2].Text);
      slAddress.Add(DBGrid1.Fields[3].Text);
      DBGrid1.DataSource.DataSet.Next;
    end;
    frmMailDialog := TMailDlgframe.Create(Self);
    frmMailDialog.setRecepient(slRecepient,slAddress);
    frmMailDialog.ShowModal;
  finally
    slRecepient.Free;
    frmMailDialog.Destroy;
  end;
end;

procedure TClientSearchframe.clearCond(ctrl: TWinControl);
var i :Integer;
begin
  for i := 0 to ctrl.ControlCount -1 do begin
    if ctrl.Controls[i].ClassType = TComboBox then TCombobox(ctrl.Controls[i]).ItemIndex := 0;
    if LowerCase(ctrl.Controls[i].Name) = 'edtgmatscore' then TSpinEdit(ctrl.Controls[i]).Value := defGMATValue;
    if LowerCase(ctrl.Controls[i].Name) = 'edttoeflscore' then TSpinEdit(ctrl.Controls[i]).Value := defTOEFLTValue;
    if ctrl.Controls[i].ClassType = TEdit then TEdit(ctrl.Controls[i]).Text := '';
    //再帰処理
    if (ctrl.Controls[i].ClassType = TPanel) OR (ctrl.Controls[i].ClassType = TTabsheet) OR (ctrl.Controls[i].ClassType = TScrollbox) then clearCond(TPanel(ctrl.Controls[i]));
  end;
end;

constructor TClientSearchframe.create(AOwner: TComponent);
begin
  inherited;
  slSchoolId := TStringList.Create;
  if m_DebugMode then Memo1.Visible := True
                 else Memo1.Visible := False;
end;

procedure TClientSearchframe.createSQLFix;
begin
  inherited;
  SQLQuery1.SQL.Add('SELECT ');
  SQLQuery1.SQL.Add('    C.CLIENT_ID,C.FIRST_NAME, C.LAST_NAME, C.EMAIL_ADDRESS, C.TOEFL, C.GMAT');
  SQLQuery1.SQL.Add('FROM');
  SQLQuery1.SQL.Add('    (SELECT ');
  SQLQuery1.SQL.Add('            CL.CLIENT_ID,');
  SQLQuery1.SQL.Add('            CL.LAST_NAME,');
  SQLQuery1.SQL.Add('            CL.FIRST_NAME,');
  SQLQuery1.SQL.Add('            CL.MIDDLE_NAME,');
  SQLQuery1.SQL.Add('            CL.EMAIL_ADDRESS,');
  SQLQuery1.SQL.Add('            CL.WORK_PLACE,');
  SQLQuery1.SQL.Add('            CL.SPONSORED_FLG,');
  SQLQuery1.SQL.Add('            CL.UNIVERSITY_NAME,');
  SQLQuery1.SQL.Add('            CL.UNIVERSITY_MAJOR,');
  SQLQuery1.SQL.Add('            CL.UNIVERSITY_DEGREE,');
  SQLQuery1.SQL.Add('            CL.UNIVERSITY_GPA,');
  SQLQuery1.SQL.Add('            CL.ACADEMIC_AWARDS_FLG,');
  SQLQuery1.SQL.Add('            CL.PUBLICATION_FLG,');
  SQLQuery1.SQL.Add('            CL.STUDIED_ABROAD_FLG,');
  SQLQuery1.SQL.Add('            CL.STUDIED_ABROAD_PLACE,');
  SQLQuery1.SQL.Add('            CL.USE_ENGLISH_AT_WORK_FLG,');
  SQLQuery1.SQL.Add('            CL.FUTURE_GOAL,');
  SQLQuery1.SQL.Add('            CL.CLIENT_MEMO,');
  SQLQuery1.SQL.Add('            CL.COUNSELOR_MEMO,');
  SQLQuery1.SQL.Add('            MAX(T.TOTAL) TOEFL,');
  SQLQuery1.SQL.Add('            MAX(G.TOTAL) GMAT');
  SQLQuery1.SQL.Add('    FROM');
  SQLQuery1.SQL.Add('        CLIENT CL');
  SQLQuery1.SQL.Add('    LEFT JOIN CLIENT_TOEFL T ON CL.CLIENT_ID = T.CLIENT_ID');
  SQLQuery1.SQL.Add('    LEFT JOIN CLIENT_GMAT G ON CL.CLIENT_ID = G.CLIENT_ID');
  SQLQuery1.SQL.Add('    GROUP BY CL.CLIENT_ID) C');
end;


procedure TClientSearchframe.createWhere;
  procedure _checkforand(sl: TstringList);
  begin
    if sl.Count > 0 then sl.Add(' AND ');
  end;
var sl: TstringList;
    i: Integer;
begin
  inherited;
  sl := TStringList.Create;
  if edtFirstName.Text <> '' then sl.Add('FIRST_NAME LIKE ' + '''' + '%' + edtFirstName.Text + '%' + '''');

  if edtLastName.Text <> '' then begin
    _checkforand(sl);
    sl.Add('LAST_NAME LIKE ' + '''' + '%' + edtLastName.Text + '%' + '''');
  end;
  if edtEmail.Text <> '' then begin
    _checkforand(sl);
    sl.Add('EMAIL_ADDRESS LIKE ' + '''' + '%' + edtEmail.Text + '%' + '''');
  end;
  if cmbSponsored.ItemIndex <> cmbIndexAll then begin
    _checkforand(sl);
    sl.Add('SPONSORED_FLG = '  + cmbDivAllYesNo[cmbSponsored.ItemIndex]);
  end;
  if edtUniversityName.Text <> '' then begin
    _checkforand(sl);
    sl.Add('UNIVERSITY_NAME LIKE ' + '''' + '%' + edtUniversityName.Text + '%' + '''');
  end;
  if StrToIntDef(edtGPA.Text,-1) <> -1 then begin
    _checkforand(sl);
    sl.Add('UNIVERSITY_GPA = ' + edtGPA.Text);
  end;
  if edtDegree.Text <> '' then begin
    _checkforand(sl);
    sl.Add('UNIVERSITY_DEGREE LIKE ' + '''' + '%' + edtDegree.Text + '%' + '''');
  end;
  if edtMajor.Text <> '' then begin
    _checkforand(sl);
    sl.Add('UNIVERISTY_MAJOR LIKE ' + '''' + '%' + edtMajor.Text + '%' + '''');
  end;
  if cmbAcademicAward.ItemIndex <> cmbIndexAll then begin
    _checkforand(sl);
    sl.Add('ACADEMIC_AWARDS_FLG = ' + cmbDivAllYesNo[cmbAcademicAward.ItemIndex]);
  end;
  if cmbPublication.ItemIndex <> cmbIndexAll then begin
    _checkforand(sl);
    sl.Add('PUBLICATION_FLG = ' + cmbDivAllYesNo[cmbAcademicAward.ItemIndex]);
  end;
  if cmbStudyAbroad.ItemIndex <> cmbIndexAll then begin
    _checkforand(sl);
    sl.Add('STUDIED_ABROAD_FLG = ' + cmbDivAllYesNo[cmbPublication.ItemIndex]);
  end;
  if edtPlace.Text <> '' then begin
    _checkforand(sl);
    sl.Add('STUDIED_ABROAD_PLACE LIKE ' + '''' + '%' + edtPlace.Text + '%' + '''');
  end;
  if edtWorkPlace.Text <> '' then begin
    _checkforand(sl);
    sl.Add('WORK_PLACE LIKE ' + '''' + '%' + edtWorkPlace.Text + '%' + '''');
  end;
  if cmbUseEnglish.ItemIndex <> cmbIndexAll then begin
    _checkforand(sl);
    sl.Add('USE_ENGLISH_AT_WORK_FLG = ' + cmbDivAllYesNo[cmbUseEnglish.ItemIndex]);
  end;
  if edtFutureGoal.Text <> '' then begin
    _checkforand(sl);
    sl.Add('FUTURE_GOAL LIKE ' + '''' + '%' + edtFutureGoal.Text + '%' + '''');
  end;
  if (cmbSchoolName.ItemIndex <> cmbIndexAll) AND (cmbRound.ItemIndex <> cmbIndexAll) then begin
      _checkforand(sl);
      sl.Add('CLIENT_ID = (SELECT CLIENT_ID FROM CLIENT_SCHOOL_MAP WHERE C.CLIENT_ID = CLIENT_ID AND SCHOOL_ID = ' + slSchoolId[cmbSchoolName.ItemIndex] + ' AND ROUND = ' + '''' + IntToStr(cmbRound.ItemIndex) + '''' + ')');
  end else begin
    if cmbSchoolName.ItemIndex <> cmbIndexAll  then begin
      _checkforand(sl);
      sl.Add('CLIENT_ID = (SELECT CLIENT_ID FROM CLIENT_SCHOOL_MAP WHERE C.CLIENT_ID = CLIENT_ID AND SCHOOL_ID = ' + slSchoolId[cmbSchoolName.ItemIndex] +')');
    end;
    if cmbRound.ItemIndex <> cmbIndexAll then begin
      _checkforand(sl);
      sl.Add('CLIENT_ID IN (SELECT CLIENT_ID FROM CLIENT_SCHOOL_MAP WHERE C.CLIENT_ID = CLIENT_ID AND ROUND = ' + '''' + IntToStr(cmbRound.ItemIndex) + '''' + ')');
    end;
  end;
  if cmbGMATCond.ItemIndex <> cmbIndexAll then begin
    _checkforand(sl);
    case cmbGMATCond.ItemIndex of
      1: sl.Add('(GMAT <= ' + IntToStr(edtGMATScore.Value) + ' OR GMAT IS NULL)');
      2: sl.Add('GMAT <= ' + IntToStr(edtGMATScore.Value));
      3: sl.Add('(GMAT >= ' + IntToStr(edtGMATScore.Value) + ' OR GMAT IS NULL)');
      4: sl.Add('GMAT >= ' + IntToStr(edtGMATScore.Value));
    end;
  end;
  if cmbTOEFLCond.ItemIndex <> cmbIndexAll then begin
    _checkforand(sl);
    case cmbTOEFLCond.ItemIndex of
      1: sl.Add('(TOEFL <= ' + IntToStr(edtTOEFLScore.Value) + ' OR TOEFL IS NULL)');
      2: sl.Add('TOEFL <= ' + IntToStr(edtTOEFLScore.Value));
      3: sl.Add('(TOEFL >= ' + IntToStr(edtTOEFLScore.Value) + ' OR TOEFL IS NULL)');
      4: sl.Add('TOEFL >= ' + IntToStr(edtTOEFLScore.Value));
    end;
  end;
  if sl.Count > 0 then begin
    SQLQuery1.SQL.Add(' WHERE ');
    for i := 0 to sl.Count -1 do begin
      SQLQuery1.SQL.Add(sl[i]);
    end;
  end;
  if m_DebugMode then begin
    Memo1.Lines.Clear;
    Memo1.Lines := SQLQuery1.SQL;
  end;
  sl.Free;
end;

procedure TClientSearchframe.DBGrid1DblClick(Sender: TObject);
  function _hasRecord:Boolean;
  begin
    result := true;
  end;
begin
  inherited;
  try
    if not _hasRecord then exit;  //1行しかなくてデータが入っていないときはExit
    frmClientDialog := TfrmClientCarteDlg.Create(Self);
    frmClientDialog.g_OpenMode := omModify;
    frmClientDialog.SchoolList := cmbSchoolName.Items;
    frmClientDialog.slSchoolId := slSchoolId;
    frmClientDialog.g_ClientId := StrToIntDef(DBGrid1.Fields[0].Text,-1);
    frmClientDialog.initialize(omModify,SQLQuery1.SQLConnection);
    frmClientDialog.g_DebugMode := m_DebugMode;
    if frmClientDialog.ShowModal = mrOk then btnLoadClick(self);
  finally
    frmClientDialog.Destroy;
  end;
end;

procedure TClientSearchframe.Initialize;
var i: Integer;
begin
  inherited;
  try
    slSchoolId.Add('-1');
    cmbSchoolName.Items.Add('All');
    cdsSchoolName.Open;
    for i := 0 to sqlqSchoolName.RecordCount  -1 do begin
      slSchoolId.Add(cdsSchoolName.Fields[0].AsString);
      cmbSchoolName.Items.Add(cdsSchoolName.Fields[1].AsString);
      cdsSchoolName.Next;
    end;
    cmbSponsored.ItemIndex := 0;
    cmbAcademicAward.ItemIndex := 0;
    cmbPublication.ItemIndex := 0;
    cmbStudyAbroad.ItemIndex := 0;
    cmbUseEnglish.ItemIndex := 0;
    cmbSchoolName.ItemIndex := 0;
    cmbRound.ItemIndex := 0;
    cmbGMATCond.ItemIndex := 0;
    cmbTOEFLCond.ItemIndex := 0;
  except
    ShowMessage('Something Wrong Happened');
  end;
end;

end.
