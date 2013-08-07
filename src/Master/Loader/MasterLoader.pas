unit MasterLoader;

interface
uses
  System.Classes, LoadOperator, MySQLAccessor;

type TLoadKind = (Client);

type TMasterLoader = class
  private
    FAccessor: TMySQLAccessor;
    function getLoadOperator(LoadKind: TLoadKind): ILoadOperator;
    procedure LoadCsvFile(LoadKind: TLoadKind; FilePath: string);
    procedure LoadTsvFile(LoadKind: TLoadKind; FilePath: string);
    procedure LoadDelimitedFile(LoadKind: TLoadKind; FilePath: string; Delim: Char);
  public
    constructor Create(Accessor: TMySQLAccessor);
    procedure MakeTemplate(LoadKind: TLoadKind; FilePath: string);
    procedure LoadFile(LoadKind: TLoadKind; FilePath: string);
end;

implementation
uses
  SysUtils, ClientLoadOperator;

constructor TMasterLoader.Create(Accessor: TMySQLAccessor);
begin
  inherited Create;
  FAccessor := Accessor;
end;

procedure TMasterLoader.LoadCsvFile(LoadKind: TLoadKind; FilePath: string);
begin
  LoadDelimitedFile(LoadKind, FilePath, ',');
end;

procedure TMasterLoader.LoadFile(LoadKind: TLoadKind; FilePath: string);
var
  Ext: string;
begin
  Ext := ExtractFileExt(FilePath);
  if AnsiCompareText(Ext, '.csv') = 0 then begin
    LoadCsvFile(LoadKind, FilePath);
  end else if AnsiCompareText(Ext, '.tsv') = 0 then begin
    LoadTsvFile(LoadKind, FilePath);
  end else begin
    // Assume TSV
    LoadTsvFile(LoadKind, FilePath);
  end;
end;

procedure TMasterLoader.LoadDelimitedFile(LoadKind: TLoadKind; FilePath: string; Delim: Char);
var
  Cols, Vals: TStrings;
  Reader: TStreamReader;
  LoadOperator: ILoadOperator;
begin
  LoadOperator := GetLoadOperator(LoadKind);
  if not FileExists(FilePath) then begin
    raise Exception.Create('File does not exist:' + FilePath);
  end;

  Cols := TStringList.Create;
  Vals := TStringList.Create;
  Reader := TStreamReader.Create(FilePath, TEncoding.Default);
  try
    // Colum row
    if not Reader.EndOfStream then begin
      Cols.Delimiter := Delim;
      Cols.StrictDelimiter := True;
      Cols.DelimitedText := Reader.ReadLine;
    end;
    LoadOperator.SetColumnHeader(Cols);

    // Value rows
    Vals.Delimiter := Delim;
    Vals.StrictDelimiter := True;
    while not Reader.EndOfStream do begin
      Vals.DelimitedText := Reader.ReadLine;
      LoadOperator.AddValueRow(Vals);
    end;
  finally
    Reader.Free;
    Vals.Free;
    Cols.Free;
  end;
end;

procedure TMasterLoader.LoadTsvFile(LoadKind: TLoadKind; FilePath: string);
var
  Tab: Char;
begin
  Tab := Chr(9);
  LoadDelimitedFile(LoadKind, FilePath, Tab);
end;

procedure TMasterLoader.MakeTemplate(LoadKind: TLoadKind; FilePath: string);
begin
  GetLoadOperator(LoadKind).MakeTemplateTsv(FilePath);
end;

function TMasterLoader.GetLoadOperator(LoadKind: TLoadKind): ILoadOperator;
begin
  if LoadKind = Client then begin
    Result := TClientLoadOperator.Create(FAccessor);
  end else begin
    raise Exception.Create('unknown Load Kind');
  end;
end;

end.
