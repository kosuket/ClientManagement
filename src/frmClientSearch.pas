unit frmClientSearch;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, FWGridBasefrm, Vcl.AppEvnts,
  Vcl.StdCtrls, Vcl.Imaging.jpeg, Vcl.ExtCtrls, Vcl.Grids, Vcl.DBGrids,
  Vcl.Buttons;

type
  TMultiMode = (mmSingle,mmMulti);
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
    Splitter2: TSplitter;
    pnlMulti: TPanel;
    Panel3: TPanel;
    sgSelected: TStringGrid;
    btnAdd: TSpeedButton;
    btnDelete: TSpeedButton;
    btnOK: TButton;
    procedure DBGrid1DblClick(Sender: TObject);
    procedure btnAddClick(Sender: TObject);
    procedure btnDeleteClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnOKClick(Sender: TObject);
  private
    { Private declarations }
  protected
    //SQL¶¬ŠÖŒW
    function createSQLFix: String;  override;
    function createWhere: String;  override;
    //ƒOƒŠƒbƒhŠÖŒW
    procedure afterLoadProc; override;
  public
    { Public declarations }
    MultiMode: TMultiMode;
    g_SelectedClientId: Int64;
    g_SelectedFirstName: String;
    g_SelectedLastName: String;
    g_SelectedPkgBillId: Int64;
    g_SelectedAlphaFlg: Integer;
    g_SelectedStandardFlg: Integer;
    g_SelectedRestHour: Double;
    procedure setUpSelectedGridForMullti(slClientId,slClientName,slPkgBillId,slAlphaFlg,slStandardFlg,slRestHour: TStrings);
  end;

var
  ClientSearchframe: TClientSearchframe;

implementation

{$R *.dfm}

{ TClientSearchframe }

procedure TClientSearchframe.afterLoadProc;
begin
  inherited;
  DBGrid1.Columns[0].Visible := false;
  DBGrid1.Columns[9].Visible := false;
  DBGrid1.Columns[10].Visible := false;
  DBGrid1.Columns[11].Visible := false;
  DBGrid1.Columns[12].Visible := false;
end;

procedure TClientSearchframe.btnAddClick(Sender: TObject);
var i,row: Integer;
begin
  inherited;
  for i := 0 to sgSelected.RowCount -1 do if DBGrid1.Fields[0].Text = sgSelected.Cells[0,row] then exit;
  if (sgSelected.RowCount = 2) AND (sgSelected.Cells[0,1] = '') then row := 1
  else begin
    sgSelected.RowCount := sgSelected.RowCount + 1;
    row := sgSelected.RowCount -1;
  end;
  sgSelected.Cells[0,row] := DBGrid1.Fields[0].Text;
  sgSelected.Cells[1,row] := DBGrid1.Fields[1].Text + ' ' + DBGrid1.Fields[2].Text;
  sgSelected.Cells[2,row]  := DBGrid1.Fields[9].Text;
  sgSelected.Cells[3,row] := DBGrid1.Fields[10].Text;
  sgSelected.Cells[4,row] := DBGrid1.Fields[11].Text;
  sgSelected.Cells[5,row] := DBGrid1.Fields[12].Text;
end;

procedure TClientSearchframe.btnDeleteClick(Sender: TObject);
var i: Integer;
begin
  inherited;
  if sgSelected.RowCount > 2 then begin
    for i := sgSelected.Row + 1 to sgSelected.RowCount -1 do begin
      sgSelected.Cells[0,i -1] := sgSelected.Cells[0,i];
      sgSelected.Cells[1,i -1] := sgSelected.Cells[1,i];
      sgSelected.Cells[2,i -1] := sgSelected.Cells[1,i];
      sgSelected.Cells[3,i -1] := sgSelected.Cells[1,i];
      sgSelected.Cells[4,i -1] := sgSelected.Cells[1,i];
      sgSelected.Cells[5,i -1] := sgSelected.Cells[1,i];
    end;
    sgSelected.RowCount := sgSelected.RowCount -1;
  end else begin
    sgSelected.Cells[0,1] := '';
    sgSelected.Cells[1,1] := '';
    sgSelected.Cells[2,1] := '';
    sgSelected.Cells[3,1] := '';
    sgSelected.Cells[4,1] := '';
    sgSelected.Cells[5,1] := '';
  end;
end;

procedure TClientSearchframe.btnOKClick(Sender: TObject);
begin
  inherited;
  ModalResult := mrOK;
end;

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
  sl.Add('    CASE CL.SPONSORED_FLG ');
  sl.Add('      WHEN 0 THEN "Private" ');
  sl.Add('      WHEN 1 THEN "Corporate" END "SPONSORED_FLG",');
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
  if MultiMode = mmSingle then begin
    g_SelectedClientId  := StrToInt64Def(DBGrid1.Fields[0].Text,-1);
    g_SelectedFirstName := DBGrid1.Fields[1].Text;
    g_SelectedLastName  := DBGrid1.Fields[2].Text;
    g_SelectedAlphaFlg  := StrToIntDef(DBGrid1.Fields[9].Text,0);
    g_SelectedStandardFlg := StrToIntDef(DBGrid1.Fields[10].Text,0);
    g_SelectedPkgBillId := StrToInt64Def(DBGrid1.Fields[11].Text,-1);
    g_SelectedRestHour  := StrToFloatDef(DBGrid1.Fields[12].Text,0);
    ModalResult := mrOk;
  end else if MultiMode = mmMulti then btnAddClick(Self);
end;

procedure TClientSearchframe.FormShow(Sender: TObject);
begin
  inherited;
  if MultiMode = mmSingle then begin
    pnlMulti.Visible := False;
    btnOK.Visible := False;
  end else begin
    pnlMulti.Visible := True;
    btnOK.Visible := True;
    sgSelected.Cells[0,0] := 'CLIENT_ID';
    sgSelected.Cells[1,0] := 'CLIENT NAME';
    sgSelected.Cells[2,0] := 'PACKAGE BILL_ID';
    sgSelected.Cells[3,0] := 'ALPHA_FLG';
    sgSelected.Cells[4,0] := 'STANDARD_FLG';
    sgSelected.Cells[5,0] := 'PACKAGE REST HOUR';
  end;
end;

procedure TClientSearchframe.setUpSelectedGridForMullti(slClientId,
  slClientName, slPkgBillId, slAlphaFlg, slStandardFlg, slRestHour: TStrings);
var i: Integer;
begin
  if slClientId.Count = 0 then begin
    sgSelected.RowCount := 2;
    exit;
  end;
  sgSelected.RowCount := slClientId.Count + 1;
  for i := 0 to slClientId.Count -1 do begin
    with sgSelected do begin
      Cells[0,i+1] := slClientId[i];
      Cells[1,i+1] := slClientName[i];
      Cells[2,i+1] := slAlphaFlg[i];
      Cells[3,i+1] := slStandardFlg[i];
      Cells[4,i+1] := slPkgBillId[i];
      Cells[5,i+1] := slRestHour[i];
    end;
  end;
end;

end.
