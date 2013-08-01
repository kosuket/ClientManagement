unit frmClient;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.FMTBcd,
  Vcl.AppEvnts, Datasnap.Provider, Data.DB, Datasnap.DBClient, Data.SqlExpr,
  Vcl.StdCtrls, Vcl.Imaging.jpeg, Vcl.ExtCtrls, Vcl.Samples.Spin, Vcl.ComCtrls,
  Vcl.Grids, Vcl.DBGrids, FWGridBasefrm,frmClientdlg,frmMaildlg, Vcl.Buttons,
  Vcl.Menus, MySQLAccessor;

type
  TClientframe = class(TFWGridBaseframe)
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
    Memo1: TMemo;
    btnMail: TButton;
    pmGrid: TPopupMenu;
    pmDetail: TMenuItem;
    pmMail: TMenuItem;
    btnAdd: TSpeedButton;
    btnClear: TSpeedButton;
    procedure btnAddClick(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure btnMailClick(Sender: TObject);
    procedure btnClearClick(Sender: TObject);
    procedure pmDetailClick(Sender: TObject);
    procedure pmMailClick(Sender: TObject);
    procedure pmGridPopup(Sender: TObject);
  private
    { Private declarations }
      slSchoolId: TStringList;
      procedure clearCond(ctrl:TWinControl);
      function isMailable: Boolean;
  protected
    //SQL¶¬ŠÖŒW
    function createSQLFix: String;  override;
    function createWhere: String;  override;
    procedure afterLoadProc; override;
  public
    { Public declarations }
    frmClientDialog: TfrmClientCarteDlg;
    frmMailDialog: TMailDlgframe;
    constructor Create(AOwner: TComponent; Accessor: TMySQLAccessor); reintroduce; overload;
    procedure Initialize; override;
  end;

var
  Clientframe: TClientframe;
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

procedure TClientframe.afterLoadProc;
begin
  inherited;
  DBGrid1.Columns[0].Visible := false;
end;

procedure TClientframe.btnAddClick(Sender: TObject);
begin
  inherited;
  try
    frmClientDialog := TfrmClientCarteDlg.Create(Self, Accessor);
    frmClientDialog.SchoolList := cmbSchoolName.Items;
    frmClientDialog.slSchoolId := slSchoolId;
    frmClientDialog.initialize(omNew);
    frmClientDialog.ShowModal;
  finally
    frmClientDialog.Destroy;
  end;
end;

procedure TClientframe.btnClearClick(Sender: TObject);
begin
  inherited;
  clearCond(pgctrlCond);
end;

procedure TClientframe.btnMailClick(Sender: TObject);
var slRecepient,slAddress: TStringList;
    i: Integer;
begin
  inherited;
  if not isMailable then exit;

  slRecepient := TStringList.Create;
  slAddress := TStringList.Create;
  try
    DBGrid1.DataSource.DataSet.First;
    for i := 0 to DBGrid1.DataSource.DataSet.RecordCount -1 do begin
      slRecepient.Add(DBGrid1.Fields[1].Text + ' ' + DBGrid1.Fields[2].Text);
      slAddress.Add(DBGrid1.Fields[3].Text);
      DBGrid1.DataSource.DataSet.Next;
    end;
    frmMailDialog := TMailDlgframe.Create(Self, Accessor);
    frmMailDialog.setRecepient(slRecepient,slAddress);
    frmMailDialog.ShowModal;
  finally
    slRecepient.Free;
    slAddress.Free;
    frmMailDialog.Destroy;
  end;
end;

procedure TClientframe.clearCond(ctrl: TWinControl);
var i :Integer;
begin
  for i := 0 to ctrl.ControlCount -1 do begin
    if ctrl.Controls[i].ClassType = TComboBox then TCombobox(ctrl.Controls[i]).ItemIndex := 0;
    if LowerCase(ctrl.Controls[i].Name) = 'edtgmatscore' then TSpinEdit(ctrl.Controls[i]).Value := defGMATValue;
    if LowerCase(ctrl.Controls[i].Name) = 'edttoeflscore' then TSpinEdit(ctrl.Controls[i]).Value := defTOEFLTValue;
    if ctrl.Controls[i].ClassType = TEdit then TEdit(ctrl.Controls[i]).Text := '';
    //Ä‹Aˆ—
    if (ctrl.Controls[i].ClassType = TPanel) OR (ctrl.Controls[i].ClassType = TTabsheet) OR (ctrl.Controls[i].ClassType = TScrollbox) then clearCond(TPanel(ctrl.Controls[i]));
  end;
end;

constructor TClientframe.create(AOwner: TComponent; Accessor: TMySQLAccessor);
begin
  inherited;
  slSchoolId := TStringList.Create;
  if m_DebugMode then Memo1.Visible := True
                 else Memo1.Visible := False;
end;

function TClientframe.createSQLFix: String;
var sl: TstringList;
begin
  inherited;
  sl := TStringList.Create;
  sl.Add('SELECT ');
  sl.Add('    C.CLIENT_ID,C.FIRST_NAME, C.LAST_NAME, C.EMAIL_ADDRESS, C.TOEFL, C.GMAT');
  sl.Add('FROM');
  sl.Add('    (SELECT ');
  sl.Add('            CL.CLIENT_ID,');
  sl.Add('            CL.LAST_NAME,');
  sl.Add('            CL.FIRST_NAME,');
  sl.Add('            CL.MIDDLE_NAME,');
  sl.Add('            CL.EMAIL_ADDRESS,');
  sl.Add('            CL.WORK_PLACE,');
  sl.Add('            CL.SPONSORED_FLG,');
  sl.Add('            CL.UNIVERSITY_NAME,');
  sl.Add('            CL.UNIVERSITY_MAJOR,');
  sl.Add('            CL.UNIVERSITY_DEGREE,');
  sl.Add('            CL.UNIVERSITY_GPA,');
  sl.Add('            CL.ACADEMIC_AWARDS_FLG,');
  sl.Add('            CL.PUBLICATION_FLG,');
  sl.Add('            CL.STUDIED_ABROAD_FLG,');
  sl.Add('            CL.STUDIED_ABROAD_PLACE,');
  sl.Add('            CL.USE_ENGLISH_AT_WORK_FLG,');
  sl.Add('            CL.FUTURE_GOAL,');
  sl.Add('            CL.CLIENT_MEMO,');
  sl.Add('            CL.COUNSELOR_MEMO,');
  sl.Add('            MAX(T.TOTAL) TOEFL,');
  sl.Add('            MAX(G.TOTAL) GMAT');
  sl.Add('    FROM');
  sl.Add('        CLIENT CL');
  sl.Add('    LEFT JOIN CLIENT_TOEFL T ON CL.CLIENT_ID = T.CLIENT_ID');
  sl.Add('    LEFT JOIN CLIENT_GMAT G ON CL.CLIENT_ID = G.CLIENT_ID');
  sl.Add('    GROUP BY CL.CLIENT_ID) C');
  result := sl.Text;
  sl.Free;
end;


function TClientframe.createWhere: String;
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
    sl.Insert(0,' WHERE ');
    result := sl.Text;
  end else result := '';
  if m_DebugMode then begin
    Memo1.Lines.Clear;
    Memo1.Lines := sl;
  end;
  sl.Free;
end;

procedure TClientframe.DBGrid1DblClick(Sender: TObject);
begin
  inherited;
  try
    if not hasData then exit;
    frmClientDialog := TfrmClientCarteDlg.Create(Self, Accessor);
    frmClientDialog.SchoolList := cmbSchoolName.Items;
    frmClientDialog.slSchoolId := slSchoolId;
    frmClientDialog.g_ClientId := StrToIntDef(DBGrid1.Fields[0].Text,-1);
    frmClientDialog.initialize(omModify);
    frmClientDialog.g_DebugMode := m_DebugMode;
    if frmClientDialog.ShowModal = mrOk then btnLoadClick(self);
  finally
    if Assigned(frmClientDialog) then frmClientDialog.Destroy;
  end;
end;

procedure TClientframe.Initialize;
var i: Integer;
begin
  inherited;
  try
    slSchoolId.Add('-1');
    cmbSchoolName.Items.Add('All');
    loadQuery('SELECT SCHOOL_ID, SCHOOL_NAME FROM SCHOOL');
    for i := 0 to cDataSet.RecordCount  -1 do begin
      slSchoolId.Add(cDataSet.Fields[0].AsString);
      cmbSchoolName.Items.Add(cDataSet.Fields[1].AsString);
      cDataSet.Next;
    end;
    cDataSet.Close;
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

function TClientframe.isMailable: Boolean;
begin
  result := False;
  if not hasData then begin
    ShowMessage('Data Not Loaded');
    exit;
  end;
  if Length(DBGrid1.Fields[3].Text) = 0 then begin
    ShowMessage('Mail Address Cannot Be Specified');
    exit;
  end;
  result := True;
end;

procedure TClientframe.pmDetailClick(Sender: TObject);
begin
  inherited;
  DBGrid1DblClick(Self);
end;

procedure TClientframe.pmGridPopup(Sender: TObject);
begin
  inherited;
  pmDetail.Enabled := False;
  pmMail.Enabled := False;
  if not hasData then exit;
  pmDetail.Enabled := True;
  pmMail.Enabled := True;
end;

procedure TClientframe.pmMailClick(Sender: TObject);
var slRecepient,slAddress: TStringList;
begin
  inherited;
  if not isMailable then exit;

  slRecepient := TStringList.Create;
  slAddress := TStringList.Create;
  try
    slRecepient.Add(DBGrid1.Fields[1].Text + ' ' + DBGrid1.Fields[2].Text);
    slAddress.Add(DBGrid1.Fields[3].Text);
    frmMailDialog := TMailDlgframe.Create(Self, Accessor);
    frmMailDialog.setRecepient(slRecepient,slAddress);
    frmMailDialog.ShowModal;
  finally
    slRecepient.Free;
    slAddress.Free;
    frmMailDialog.Destroy;
  end;
end;

end.
