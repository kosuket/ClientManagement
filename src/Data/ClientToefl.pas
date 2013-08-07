unit ClientToefl;

interface
uses
  DBImportableData;
type TClientToefl = class(TDBImportableData)
  private
    FClient_id: Int64;
    FScore_no: Integer;
    FTotal: Integer;
    FTest_date: TDateTime;
    FReading: Integer;
    FListening: Integer;
    FSpeaking: Integer;
    FWriting: Integer;
    FMemo: string;
  published
    property Client_id: Int64 read FClient_id write FClient_id;
    property Score_no: Integer read FScore_no write FScore_no;
    property Total: Integer read FTotal write FTotal;
    property Test_date: TDateTime read FTest_date write FTest_date;
    property Reading: Integer read FReading write FReading;
    property Listening: Integer read FListening write FListening;
    property Speaking: Integer read FSpeaking write FSpeaking;
    property Writing: Integer read FWriting write FWriting;
    property Memo: string read FMemo write FMemo;
  protected
    function GetTableName: string; override;
end;

implementation

{ TClientToefl }

function TClientToefl.GetTableName: string;
begin
  Result := 'CLIENT_TOEFL';
end;

end.
