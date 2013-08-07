// Data class that represents Client table.
unit Client;

interface
uses
  DBImportableData;
type TClient = class(TDBImportableData)
  private
    FClient_id: Int64;
    FLast_name: string;
    FFirst_name: string;
    FMiddle_name: string;
    FEmail_address: string;
    FWork_place: string;
    FSponsored_flg: Integer;
    FUniversity_name: string;
    FUniversity_major: string;
    FUniversity_degree: string;
    FUniversity_gpa: Double;
    FAcademic_awards_flg: Integer;
    FPublication_flg: Integer;
    FStudied_abroad_flg: Integer;
    FStudied_abroad_place: string;
    FUse_english_at_work_flg: Integer;
    FFuture_goal: string;
    FClient_memo: string;
    FCounselor_memo: string;
    FAlpha_flg: Integer;
    FStandard_flg: Integer;
  published
    property Client_id: Int64 read FClient_id write FClient_id;
    property Last_name: string read FLast_name write FLast_name;
    property First_name: string read FFirst_name write FFirst_name;
    property Middle_name: string read FMiddle_name write FMiddle_name;
    property Email_address: string read FEmail_address write FEmail_address;
    property Work_place: string read FWork_place write FWork_place;
    property Sponsored_flg: Integer read FSponsored_flg write FSponsored_flg;
    property University_name: string read FUniversity_name write FUniversity_name;
    property University_major: string read FUniversity_major write FUniversity_major;
    property University_degree: string read FUniversity_degree write FUniversity_degree;
    property University_gpa: Double read FUniversity_gpa write FUniversity_gpa;
    property Academic_awards_flg: Integer read FAcademic_awards_flg write FAcademic_awards_flg;
    property Publication_flg: Integer read FPublication_flg write FPublication_flg;
    property Studied_abroad_flg: Integer read FStudied_abroad_flg write FStudied_abroad_flg;
    property Studied_abroad_place: string read FStudied_abroad_place write FStudied_abroad_place;
    property Use_english_at_work_flg: Integer read FUse_english_at_work_flg write FUse_english_at_work_flg;
    property Future_goal: string read FFuture_goal write FFuture_goal;
    property Client_memo: string read FClient_memo write FClient_memo;
    property Counselor_memo: string read FCounselor_memo write FCounselor_memo;
    property Alpha_flg: Integer read FAlpha_flg write FAlpha_flg;
    property Standard_flg: Integer read FStandard_flg write FStandard_flg;
  protected
    function GetTableName: string; override;
  end;
implementation
{ TClient }

function TClient.GetTableName: string;
begin
  Result := 'CLIENT';
end;

end.
