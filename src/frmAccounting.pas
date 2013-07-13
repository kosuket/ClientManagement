unit frmAccounting;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, FWGridBasefrm, Data.FMTBcd,
  Vcl.AppEvnts, Datasnap.Provider, Data.DB, Datasnap.DBClient, Data.SqlExpr,
  Vcl.StdCtrls, Vcl.Imaging.jpeg, Vcl.ExtCtrls, Vcl.Grids, Vcl.DBGrids,
  Vcl.ComCtrls;

type
  TAccountingframe = class(TFWGridBaseframe)
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
  private
    { Private declarations }
  protected
    //SQL�����֌W
    procedure createSQLFix;  override;
    procedure createWhere;  override;
  public
    { Public declarations }
  end;

var
  Accountingframe: TAccountingframe;

implementation

{$R *.dfm}

{ TAccountingframe }

procedure TAccountingframe.createSQLFix;
begin
  inherited;
  SQLQuery1.SQL.Add('SELECT ');
  SQLQuery1.SQL.Add('    C.CLIENT_ID,');
  SQLQuery1.SQL.Add('    C.LAST_NAME,');
  SQLQuery1.SQL.Add('    C.FIRST_NAME,');
  SQLQuery1.SQL.Add('    C.MIDDLE_NAME,');
  SQLQuery1.SQL.Add('    C.EMAIL_ADDRESS,');
  SQLQuery1.SQL.Add('    SUM(B.BOOK_AMOUNT) CHARGE');
  SQLQuery1.SQL.Add('FROM');
  SQLQuery1.SQL.Add('    CLIENT C');
  SQLQuery1.SQL.Add('        LEFT JOIN');
  SQLQuery1.SQL.Add('    BILLING_REQUEST B ON C.CLIENT_ID = B.CLIENT_ID');
end;

procedure TAccountingframe.createWhere;
  procedure _checkforand(sl: TStrings);
  begin
    if sl.Count > 0 then sl.Add(' AND ');
  end;
begin
  inherited;
  if cmbPeriod.ItemIndex <> 0 then begin
    _checkforand(SQLQuery1.SQL);
    SQLQuery1.SQL.Add(' B.BOOK_DATE BETWEEN ' + '''' + FormatDateTime('yyyy/mm/dd',edtFirstDate.Date) + '''' + ' AND ' + '''' + FormatDateTime('yyyy/mm/dd',edtLastDate.Date) + '''');
  end;
  if Length(edtFirstName.Text) > 0 then begin
    _checkforand(SQLQuery1.SQL);
    SQLQuery1.SQL.Add(' C.FIRST_NAME = ' + '''' + edtFirstName.Text + '''');
  end;
  if Length(edtLastName.Text) > 0 then begin
    _checkforand(SQLQuery1.SQL);
    SQLQuery1.SQL.Add(' C.LAST_NAME = ' + '''' + edtLastName.Text + '''');
  end;
  SQLQuery1.SQL.Add('GROUP BY C.CLIENT_ID');
end;

end.
