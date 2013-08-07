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
    FEmail_address: TLoadColumn;
    FWork_place: TLoadColumn;
    FSponsored_flg: TLoadColumn;
    FUniversity_name: TLoadColumn;
    FUniversity_major: TLoadColumn;
    FUniversity_degree: TLoadColumn;
    FUniversity_gpa: TLoadColumn;
    FAcademic_awards_flg: TLoadColumn;
    FPublication_flg: TLoadColumn;
    FStudied_abroad_flg: TLoadColumn;
    FStudied_abroad_place: TLoadColumn;
    FUse_english_at_work_flg: TLoadColumn;
    FFuture_goal: TLoadColumn;
    FClient_memo: TLoadColumn;
    FCounselor_memo: TLoadColumn;
    FAlpha_flg: TLoadColumn;
    FStandard_flg: TLoadColumn;
    // CLIENT_GMAT
    FTest_date_gmat: TLoadColumn;
    FTotal_gmat: TLoadColumn;
    FVerbal_gmat: TLoadColumn;
    FMath_gmat: TLoadColumn;
    FAwa_gmat: TLoadColumn;
    FIntegrated_reasoning_gmat: TLoadColumn;
    FMemo_gmat: TLoadColumn;
    // CLIENT_TOEFL
    FTest_date_toefl: TLoadColumn;
    FTotal_toefl: TLoadColumn;
    FReading_toefl: TLoadColumn;
    FListening_toefl: TLoadColumn;
    FSpeaking_toefl: TLoadColumn;
    FWriting_toefl: TLoadColumn;
    FMemo_toefl: TLoadColumn;
  public
    // CLIENT
    property Last_name: TLoadColumn read FLast_name write FLast_name;
    property First_name: TLoadColumn read FFirst_name write FFirst_name;
    property Middle_name: TLoadColumn read FMiddle_name write FMiddle_name;
    property Email_address: TLoadColumn read FEmail_address write FEmail_address;
    property Work_place: TLoadColumn read FWork_place write FWork_place;
    property Sponsored_flg: TLoadColumn read FSponsored_flg write FSponsored_flg;
    property University_name: TLoadColumn read FUniversity_name write FUniversity_name;
    property University_major: TLoadColumn read FUniversity_major write FUniversity_major;
    property University_degree: TLoadColumn read FUniversity_degree write FUniversity_degree;
    property University_gpa: TLoadColumn read FUniversity_gpa write FUniversity_gpa;
    property Academic_awards_flg: TLoadColumn read FAcademic_awards_flg write FAcademic_awards_flg;
    property Publication_flg: TLoadColumn read FPublication_flg write FPublication_flg;
    property Studied_abroad_flg: TLoadColumn read FStudied_abroad_flg write FStudied_abroad_flg;
    property Studied_abroad_place: TLoadColumn read FStudied_abroad_place write FStudied_abroad_place;
    property Use_english_at_work_flg: TLoadColumn read FUse_english_at_work_flg write FUse_english_at_work_flg;
    property Future_goal: TLoadColumn read FFuture_goal write FFuture_goal;
    property Client_memo: TLoadColumn read FClient_memo write FClient_memo;
    property Counselor_memo: TLoadColumn read FCounselor_memo write FCounselor_memo;
    property Alpha_flg: TLoadColumn read FAlpha_flg write FAlpha_flg;
    property Standard_flg: TLoadColumn read FStandard_flg write FStandard_flg;
    // CLIENT_GMAT
    property Test_date_gmat: TLoadColumn read FTest_date_gmat write FTest_date_gmat;
    property Total_gmat: TLoadColumn read FTotal_gmat write FTotal_gmat;
    property Verbal_gmat: TLoadColumn read FVerbal_gmat write FVerbal_gmat;
    property Math_gmat: TLoadColumn read FMath_gmat write FMath_gmat;
    property Awa_gmat: TLoadColumn read FAwa_gmat write FAwa_gmat;
    property Integrated_reasoning_gmat: TLoadColumn read FIntegrated_reasoning_gmat write FIntegrated_reasoning_gmat;
    property Memo_gmat: TLoadColumn read FMemo_gmat write FMemo_gmat;
    // CLIENT_TOEFL
    property Test_date_toefl: TLoadColumn read FTest_date_toefl write FTest_date_toefl;
    property Total_toefl: TLoadColumn read FTotal_toefl write FTotal_toefl;
    property Reading_toefl: TLoadColumn read FReading_toefl write FReading_toefl;
    property Listening_toefl: TLoadColumn read FListening_toefl write FListening_toefl;
    property Speaking_toefl: TLoadColumn read FSpeaking_toefl write FSpeaking_toefl;
    property Writing_toefl: TLoadColumn read FWriting_toefl write FWriting_toefl;
    property Memo_toefl: TLoadColumn read FMemo_toefl write FMemo_toefl;

    // methods
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
  FEmail_address := TLoadColumn.Create(True, 'EMAIL_ADDRESS', TClient, 'Email_address');
  FWork_place := TLoadColumn.Create(True, 'WORK_PLACE', TClient, 'Work_place');
  FSponsored_flg := TLoadColumn.Create(True, 'SPONSORED_FLG', TClient, 'Sponsored_flg');
  FUniversity_name := TLoadColumn.Create(True, 'UNIVERSITY_NAME', TClient, 'University_name');
  FUniversity_major := TLoadColumn.Create(True, 'UNIVERSITY_MAJOR', TClient, 'University_major');
  FUniversity_degree := TLoadColumn.Create(True, 'UNIVERSITY_DEGREE', TClient, 'University_degree');
  FUniversity_gpa := TLoadColumn.Create(True, 'UNIVERSITY_GPA', TClient, 'University_gpa');
  FAcademic_awards_flg := TLoadColumn.Create(True, 'ACADEMIC_AWARDS_FLG', TClient, 'Academic_awards_flg');
  FPublication_flg := TLoadColumn.Create(True, 'PUBLICATION_FLG', TClient, 'Publication_flg');
  FStudied_abroad_flg := TLoadColumn.Create(True, 'STUDIED_ABROAD_FLG', TClient, 'Studied_abroad_flg');
  FStudied_abroad_place := TLoadColumn.Create(True, 'STUDIED_ABROAD_PLACE', TClient, 'Studied_abroad_place');
  FUse_english_at_work_flg := TLoadColumn.Create(True, 'USE_ENGLISH_AT_WORK_FLG', TClient, 'Use_english_at_work_flg');
  FFuture_goal := TLoadColumn.Create(True, 'FUTURE_GOAL', TClient, 'Future_goal');
  FClient_memo := TLoadColumn.Create(True, 'CLIENT_MEMO', TClient, 'Client_memo');
  FCounselor_memo := TLoadColumn.Create(True, 'COUNSELOR_MEMO', TClient, 'Counselor_memo');
  FAlpha_flg := TLoadColumn.Create(True, 'ALPHA_FLG', TClient, 'Alpha_flg');
  FStandard_flg := TLoadColumn.Create(True, 'STANDARD_FLG', TClient, 'Standard_flg');
  // CLIENT_GMAT
  FTest_date_gmat := TLoadColumn.Create(True, 'TEST_DATE_GMAT', TClientGmat, 'Test_date');
  FTotal_gmat := TLoadColumn.Create(True, 'TOTAL_GMAT', TClientGmat, 'Total');
  FVerbal_gmat  := TLoadColumn.Create(True, 'VERBAL_GMAT', TClientGmat, 'Verbal');
  FMath_gmat  := TLoadColumn.Create(True, 'MATH_GMAT', TClientGmat, 'Math');
  FAwa_gmat  := TLoadColumn.Create(True, 'AWA_GMAT', TClientGmat, 'Awa');
  FIntegrated_reasoning_gmat  := TLoadColumn.Create(True, 'INTEGRATED_REASONING_GMAT', TClientGmat, 'Integrated_reasoning');
  FMemo_gmat  := TLoadColumn.Create(True, 'MEMO_GMAT', TClientGmat, 'Memo');
  // CLIENT_TOEFL
  FTest_date_toefl := TLoadColumn.Create(True, 'TEST_DATE_TOEFL', TClientToefl, 'Test_date');
  FTotal_toefl := TLoadColumn.Create(True, 'TOTAL_TOEFL', TClientToefl, 'Total');
  FReading_toefl  := TLoadColumn.Create(True, 'READING_TOEFL', TClientToefl, 'Reading');
  FListening_toefl  := TLoadColumn.Create(True, 'LISTENING_TOEFL', TClientToefl, 'Listening');
  FSpeaking_toefl  := TLoadColumn.Create(True, 'SPEAKING_TOEFL', TClientToefl, 'Speaking');
  FWriting_toefl  := TLoadColumn.Create(True, 'WRITING_TOEFL', TClientToefl, 'Writing');
  FMemo_toefl  := TLoadColumn.Create(True, 'MEMO_TOEFL', TClientToefl, 'Memo');
end;
end.
