unit frmCounseling;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, FWGridBasefrm, Vcl.AppEvnts,
  Vcl.StdCtrls, Vcl.Imaging.jpeg, Vcl.ExtCtrls, Vcl.Grids, Vcl.DBGrids,
  Vcl.ComCtrls, Vcl.Buttons;

type
  TCounselingframe = class(TFWGridBaseframe)
    pnlCounseling: TPanel;
    lblPeriod: TLabel;
    lblBetween: TLabel;
    lblFirstName: TLabel;
    lblLastName: TLabel;
    cmbPeriod: TComboBox;
    edtFirstDate: TDateTimePicker;
    edtLastDate: TDateTimePicker;
    edtFirstName: TEdit;
    edtLastName: TEdit;
    btnClear: TSpeedButton;
    lblCounselingType: TLabel;
    cmbCounselingType: TComboBox;
    lblContentType: TLabel;
    edtContentType: TEdit;
    btnAdd: TSpeedButton;
    procedure btnClearClick(Sender: TObject);
    procedure cmbPeriodChange(Sender: TObject);
  private
    { Private declarations }
    procedure clearCond(ctrl:TWinControl);
  protected
    //SQL生成関係
    function createSQLFix: String;  override;
    function createWhere: String;  override;
  public
    { Public declarations }
    procedure initialize; override;
  end;

var
  Counselingframe: TCounselingframe;

implementation

{$R *.dfm}

{ TCounselingframe }

procedure TCounselingframe.btnClearClick(Sender: TObject);
begin
  inherited;
  clearCond(pnlCounseling);
end;

procedure TCounselingframe.clearCond(ctrl: TWinControl);
var i :Integer;
begin
  cmbPeriod.ItemIndex := 1;
  cmbPeriod.OnChange(Self);
  for i := 0 to ctrl.ControlCount -1 do begin
    if ctrl.Controls[i].ClassType = TEdit then TEdit(ctrl.Controls[i]).Text := '';
    if ctrl.Controls[i].ClassType = TCheckBox then TCheckBox(ctrl.Controls[i]).Checked := False;
    //再帰処理
    if (ctrl.Controls[i].ClassType = TPanel) OR (ctrl.Controls[i].ClassType = TTabsheet) OR (ctrl.Controls[i].ClassType = TScrollbox) then clearCond(TPanel(ctrl.Controls[i]));
  end;
end;

procedure TCounselingframe.cmbPeriodChange(Sender: TObject);
var d: TDate;
    YY,MM,DD:Word;
begin
  inherited;
  DecodeDate(Now,YY,MM,DD);
  d := StrToDateDef(IntToStr(YY)+'/'+IntToStr(MM)+'/'+'01',Now);
  case cmbPeriod.ItemIndex of
    0: begin
      edtFirstDate.Enabled := False;
      edtLastDate.Enabled := False;
    end;
    1: begin
      edtFirstDate.Enabled := True;
      edtLastDate.Enabled := True;
      edtFirstDate.Date := d;
      edtLastDate.Date := IncMonth(d,1) - 1;
    end;
    2: begin
      edtFirstDate.Enabled := True;
      edtLastDate.Enabled := True;
      edtFirstDate.Date := IncMonth(d,-1);
      edtLastDate.Date := d - 1;
    end;
    3: begin
      edtFirstDate.Enabled := True;
      edtLastDate.Enabled := True;
      edtFirstDate.Date := IncMonth(d,-2);
      edtLastDate.Date := IncMonth(d,-1) - 1;
    end;
  end;
end;

function TCounselingframe.createSQLFix: String;
begin
  result := 'SELECT '
          + '    CL.CLIENT_ID,'
          + '    CL.FIRST_NAME,'
          + '    CL.LAST_NAME,'
          + '    CO.COUNSELING_DATE,'
          + '    CO.START_TIME,'
          + '    CO.END_TIME,'
          + '    CO.COUNSELING_TYPE,'
          + '    CONTENT_TYPE'
          + ' FROM'
          + '    COUNSELING CO'
          + '        INNER JOIN'
          + '    CLIENT CL ON CO.CLIENT_ID = CL.CLIENT_ID';
end;

function TCounselingframe.createWhere: String;
  procedure _checkforand(sl: TStrings);
  begin
    if sl.Count > 0 then sl.Add(' AND ');
  end;
var sl: TstringList;
begin
  inherited;
  sl := TStringList.Create;
  if Length(edtFirstName.Text) > 0 then begin
    _checkforand(sl);
    sl.Add(' CL.FIRST_NAME LIKE ' + '''' + '%' + edtFirstName.Text + '%' + '''');
  end;
  if Length(edtLastName.Text) > 0 then begin
    _checkforand(sl);
    sl.Add(' CL.LAST_NAME LIKE ' + '''' + '%' + edtLastName.Text + '%' + '''');
  end;
  if cmbPeriod.ItemIndex <> 0 then begin
    _checkforand(sl);
    sl.Add(' CO.COUNSELING_DATE BETWEEN ' + '''' + FormatDateTime('yyyy/mm/dd',edtFirstDate.Date) + '''' + ' AND ' + '''' + FormatDateTime('yyyy/mm/dd',edtLastDate.Date) + '''');
  end;
  if Length(edtContentType.Text) > 0 then begin
    _checkforand(sl);
    sl.Add(' CO.CONTENT_TYPE LIKE ' + '''' + '%' + edtContentType.Text + '%' + '''');
  end;
  if sl.Count > 0 then sl.Insert(0,' WHERE ');
  sl.Add(' ORDER BY CO.COUNSELING_DATE DESC');
  result := sl.Text;
end;

procedure TCounselingframe.initialize;
begin
  inherited;
  cmbPeriod.ItemIndex := 1;
  cmbPeriod.OnChange(Self);
  cmbCounselingType.ItemIndex := 0;
end;

end.
