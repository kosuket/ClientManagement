unit frmBilling;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, FWGridBasefrm, Data.FMTBcd,
  Vcl.AppEvnts, Datasnap.Provider, Data.DB, Datasnap.DBClient, Data.SqlExpr,
  Vcl.StdCtrls, Vcl.Imaging.jpeg, Vcl.ExtCtrls, Vcl.Grids, Vcl.DBGrids,
  Vcl.ComCtrls;

type
  TBillingframe = class(TFWGridBaseframe)
    pnlAccounting: TPanel;
    lblPeriod: TLabel;
    cmbPeriod: TComboBox;
    edtFirstDate: TDateTimePicker;
    lblBetween: TLabel;
    edtLastDate: TDateTimePicker;
    lblFirstName: TLabel;
    edtFirstName: TEdit;
    lblLastName: TLabel;
    edtLastName: TEdit;
    chkExcludeZero: TCheckBox;
    procedure cmbPeriodChange(Sender: TObject);
  private
    { Private declarations }
  protected
    //SQL�����֌W
    procedure createSQLFix;  override;
    procedure createWhere;  override;
  public
    { Public declarations }
    procedure Initialize; override;
  end;

var
  Billingframe: TBillingframe;

implementation

{$R *.dfm}

{ TAccountingframe }

procedure TBillingframe.cmbPeriodChange(Sender: TObject);
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

procedure TBillingframe.createSQLFix;
begin
  inherited;
  SQLQuery1.SQL.Add('SELECT A.CLIENT_ID,A.FIRST_NAME,A.LAST_NAME,A.EMAIL_ADDRESS,A.CHARGE FROM (');
  SQLQuery1.SQL.Add('SELECT ');
  SQLQuery1.SQL.Add('    C.CLIENT_ID,');
  SQLQuery1.SQL.Add('    C.LAST_NAME,');
  SQLQuery1.SQL.Add('    C.FIRST_NAME,');
  SQLQuery1.SQL.Add('    C.MIDDLE_NAME,');
  SQLQuery1.SQL.Add('    C.EMAIL_ADDRESS,');
  SQLQuery1.SQL.Add('    IFNULL(SUM(B.BOOK_AMOUNT),0) CHARGE');
  SQLQuery1.SQL.Add('FROM');
  SQLQuery1.SQL.Add('    CLIENT C');
  SQLQuery1.SQL.Add('        LEFT JOIN');
  SQLQuery1.SQL.Add('    BILLING_REQUEST B ON C.CLIENT_ID = B.CLIENT_ID');
end;

procedure TBillingframe.createWhere;
  procedure _checkforand(sl: TStrings);
  begin
    if sl.Count > 0 then sl.Add(' AND ');
  end;
var sl: TstringList;
    i: Integer;
begin
  inherited;
  if cmbPeriod.ItemIndex <> 0 then begin
    _checkforand(SQLQuery1.SQL);
    SQLQuery1.SQL.Add(' B.BOOK_DATE BETWEEN ' + '''' + FormatDateTime('yyyy/mm/dd',edtFirstDate.Date) + '''' + ' AND ' + '''' + FormatDateTime('yyyy/mm/dd',edtLastDate.Date) + '''');
  end;
  SQLQuery1.SQL.Add('GROUP BY C.CLIENT_ID) A');

  sl := TStringList.Create;
  if Length(edtFirstName.Text) > 0 then begin
    _checkforand(sl);
    sl.Add(' A.FIRST_NAME = ' + '''' + edtFirstName.Text + '''');
  end;
  if Length(edtLastName.Text) > 0 then begin
    _checkforand(sl);
    sl.Add(' A.LAST_NAME = ' + '''' + edtLastName.Text + '''');
  end;
  if chkExcludeZero.Checked then begin
    _checkforand(sl);
    sl.Add(' A.CHARGE > 0 ');
  end;
  if sl.Count > 0 then begin
    SQLQuery1.SQL.Add(' WHERE ');
    for i := 0 to sl.Count -1 do begin
      SQLQuery1.SQL.Add(sl[i]);
    end;
  end;
end;

procedure TBillingframe.Initialize;
begin
  inherited;
  cmbPeriod.ItemIndex := 1;
  cmbPeriod.OnChange(Self);
end;

end.