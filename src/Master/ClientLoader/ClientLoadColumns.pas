unit ClientLoadColumns;

interface
uses
  LoadColumn, LoadColumns;
type TClientLoadColumns = class(TLoadColumns)
  private
    // CLIENT
    FLast_name: TLoadColumn;
    FFirst_name: TLoadColumn;
    FMiddle_name: TLoadColumn;
    // CLIENT_GMAT
    FTest_date_gmat: TLoadColumn;
    FTotal_gmat: TLoadColumn;
    // CLIENT_TOEFL
    FTest_date_toefl: TLoadColumn;
    FTotal_toefl: TLoadColumn;
  public
    property Last_name: TLoadColumn read FLast_name write FLast_name;
    property First_name: TLoadColumn read FFirst_name write FFirst_name;
    property Middle_name: TLoadColumn read FMiddle_name write FMiddle_name;
    property Test_date_gmat: TLoadColumn read FTest_date_gmat write FTest_date_gmat;
    property Total_gmat: TLoadColumn read FTotal_gmat write FTotal_gmat;
    property Test_date_toefl: TLoadColumn read FTest_date_toefl write FTest_date_toefl;
    property Total_toefl: TLoadColumn read FTotal_toefl write FTotal_toefl;
    procedure SetUpLoadColumns; override;
end;

implementation
uses
  Client, ClientGmat, ClientToefl;

{ TClientLoadColumns }

procedure TClientLoadColumns.SetUpLoadColumns;
begin
    // CLIENT
    FLast_name := TLoadColumn.Create(True, 'LAST_NAME', TClient, 'Last_name');
    FFirst_name := TLoadColumn.Create(True, 'FIRST_NAME', TClient, 'First_name');
    FMiddle_name := TLoadColumn.Create(True, 'MIDDLE_NAME', TClient, 'Middle_name');
    // CLIENT_GMAT
    FTest_date_gmat := TLoadColumn.Create(True, 'TEST_DATE_GMAT', TClientGmat, 'Test_date');
    FTotal_gmat := TLoadColumn.Create(True, 'TOTAL_GMAT', TClientGmat, 'Total');
    // CLIENT_TOEFL
    FTest_date_toefl := TLoadColumn.Create(True, 'TEST_DATE_TOEFL', TClientToefl, 'Test_date');
    FTotal_toefl := TLoadColumn.Create(True, 'TOTAL_TOEFL', TClientToefl, 'Total');
end;
end.
