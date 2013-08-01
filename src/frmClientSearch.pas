unit frmClientSearch;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, FWGridBasefrm, Vcl.AppEvnts,
  Vcl.StdCtrls, Vcl.Imaging.jpeg, Vcl.ExtCtrls, Vcl.Grids, Vcl.DBGrids;

type
  TClientSearchframe = class(TFWGridBaseframe)
    pnlBasic: TPanel;
    lblFirstName: TLabel;
    lblLastName: TLabel;
    lblEmail: TLabel;
    lblFutureGoal: TLabel;
    edtFirstName: TEdit;
    edtLastName: TEdit;
    edtEmail: TEdit;
    edtFutureGoal: TEdit;
    procedure DBGrid1DblClick(Sender: TObject);
  private
    { Private declarations }
  protected
    //SQL¶¬ŠÖŒW
    function createSQLFix: String;  override;
    function createWhere: String;  override;
  public
    { Public declarations }
    g_SelectedClientId: Int64;
    g_SelectedFirstName: String;
    g_SelectedLastName: String;
    g_SelectedPkgBillId: Int64;
    g_SelectedAlphaFlg: Integer;
    g_SelectedStandardFlg: Integer;
    g_SelectedRestHour: Double;
  end;

var
  ClientSearchframe: TClientSearchframe;

implementation

{$R *.dfm}

{ TClientSearchframe }

function TClientSearchframe.createSQLFix: String;
var sl: TstringList;
begin
  inherited;
  sl := TStringList.Create;
  sl.Add('SELECT ');
  sl.Add('    C.CLIENT_ID,C.FIRST_NAME, C.LAST_NAME, C.EMAIL_ADDRESS, C.WORK_PLACE, C.SPONSORED_FLG, C.TOEFL, C.GMAT, C.UNIVERSITY_NAME, C.ALPHA_FLG, C.STANDARD_FLG, C.BILL_ID, C.REST_HOUR');
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
  sl.Add('            CL.ALPHA_FLG,');
  sl.Add('            CL.STANDARD_FLG,');
  sl.Add('            MAX(T.TOTAL) TOEFL,');
  sl.Add('            MAX(G.TOTAL) GMAT,');
  sl.Add('            MIN(B.BILL_ID) BILL_ID,');
  sl.Add('            SUM(B.TOTAL_HOUR - B.CURRENT_HOUR) REST_HOUR');
  sl.Add('    FROM');
  sl.Add('        CLIENT CL');
  sl.Add('    LEFT JOIN CLIENT_TOEFL T ON CL.CLIENT_ID = T.CLIENT_ID');
  sl.Add('    LEFT JOIN CLIENT_GMAT G ON CL.CLIENT_ID = G.CLIENT_ID');
  sl.Add('    LEFT JOIN BILLING_REQUEST B ON CL.CLIENT_ID = B.CLIENT_ID AND ((B.BILLING_TYPE = 4 AND B.TOTAL_HOUR > B.CURRENT_HOUR) OR (B.BILLING_TYPE = 3))');
  sl.Add('    GROUP BY CL.CLIENT_ID) C');
  result := sl.Text;
  sl.Free;
end;

function TClientSearchframe.createWhere: String;
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
  if sl.Count > 0 then begin
    sl.Insert(0,' WHERE ');
    result := sl.Text;
  end else result := '';
  sl.Free;
end;

procedure TClientSearchframe.DBGrid1DblClick(Sender: TObject);
begin
  inherited;
  g_SelectedClientId  := StrToInt64Def(DBGrid1.Fields[0].Text,-1);
  g_SelectedFirstName := DBGrid1.Fields[1].Text;
  g_SelectedLastName  := DBGrid1.Fields[2].Text;
  g_SelectedAlphaFlg  := StrToIntDef(DBGrid1.Fields[9].Text,0);
  g_SelectedStandardFlg := StrToIntDef(DBGrid1.Fields[10].Text,0);
  g_SelectedPkgBillId := StrToInt64Def(DBGrid1.Fields[11].Text,-1);
  g_SelectedRestHour  := StrToFloatDef(DBGrid1.Fields[12].Text,0);
  ModalResult := mrOk;
end;

end.
