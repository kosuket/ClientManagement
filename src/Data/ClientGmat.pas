unit ClientGmat;

interface
uses
  DBImportableData;
type TClientGmat = class(TDBImportableData)
  private
    FClient_id: Int64;
    FScore_no: Integer;
    FTest_date: TDateTime;
    FTotal: Integer;
    FVerbal: Integer;
    FMath: Integer;
    FAwa: Integer;
    FIntegrated_reasoning: Integer;
    FMemo: string;
  published
    property Client_id: Int64 read FClient_id write FClient_id;
    property Score_no: Integer read FScore_no write FScore_no;
    property Test_date: TDateTime read FTest_date write FTest_date;
    property Total: Integer read FTotal write FTotal;
    property Verbal: Integer read FVerbal write FVerbal;
    property Math: Integer read FMath write FMath;
    property Awa: Integer read FAwa write FAwa;
    property Integrated_reasoning: Integer read FIntegrated_reasoning write FIntegrated_reasoning;
    property Memo: string read FMemo write FMemo;
  protected
    function GetTableName: string; override;
end;

implementation

{ TClientGmat }

function TClientGmat.GetTableName: string;
begin
  Result := 'CLIENT_GMAT';
end;

end.
