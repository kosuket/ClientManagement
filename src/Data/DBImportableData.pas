// Abstract class that supports any data class
// used for csv import
unit DBImportableData;

interface
uses
  System.Rtti, System.Classes, System.SysUtils;
type TDBImportableData = class
  private
    DateFormat: TFormatSettings;
    procedure SetValue(Column, Value: string);
    procedure GetColumnValueStrings(var Cols: TStrings; var Vals: TStrings);
    function GetPropertyValueForInsert(Prp: TRttiProperty): string;
    function IsString(Prp: TRttiProperty): Boolean;
    function IsReal(Prp: TRttiProperty): Boolean;
    function IsInt(Prp: TRttiProperty): Boolean;
    function IsDateTime(Prp: TRttiProperty): Boolean;
  protected
    function GetTableName: string; virtual; abstract;
  public
    constructor Create;
    procedure SetPropertyValue(var Prp: TRttiProperty; Value: string);
    procedure SetValues(Columns: TStrings; Values: TStrings);
    function GetInsertSql: string;
  end;

implementation

constructor TDBImportableData.Create;
begin
  inherited;
  DateFormat := TFormatSettings.Create;
  DateFormat.DateSeparator := '/';
end;

procedure TDBImportableData.GetColumnValueStrings(var Cols: TStrings; var Vals: TStrings);
var
  Cxt: TRttiContext;
  Tp: TRttiType;
  Prp: TRttiProperty;
begin
  Cxt := TRttiContext.Create;
  try
    Tp := Cxt.GetType(Self.ClassType);
    for Prp in Tp.GetProperties do begin
      Cols.Add(Prp.Name);
      Vals.Add(GetPropertyValueForInsert(Prp));
    end;
  finally
    Cxt.Free;
  end;
end;

function TDBImportableData.GetInsertSql: string;
var
  Sql: string;
  Cols, Vals: TStrings;
begin
  Cols := TStringList.Create;
  Vals := TStringList.Create;
  try
    Cols.Delimiter := ',';
    Cols.StrictDelimiter := True;
    Vals.QuoteChar := ' ';
    Vals.Delimiter := ',';
    Vals.StrictDelimiter := True;
    GetColumnValueStrings(Cols, Vals);

    Sql := Concat('INSERT INTO ', GetTableName, ' (');
    Sql := Concat(Sql, Cols.DelimitedText);
    Sql := Concat(Sql, ') VALUES (');
    Sql := Concat(Sql, Vals.DelimitedText);
    Sql := Concat(Sql, ')');
    Result := Sql;
  finally
    Vals.Free;
    Cols.Free;
  end;
end;

function TDBImportableData.GetPropertyValueForInsert(
  Prp: TRttiProperty): string;
var
  Val: string;
begin
  if IsString(Prp) then begin
    Val := '''' + Prp.GetValue(Self).AsType<string> + '''';
  end else if IsInt(Prp) then begin
    Val := IntToStr(Prp.GetValue(Self).AsType<Integer>);
  end else if IsReal(Prp) then begin
    Val := FloatToStr(Prp.GetValue(Self).AsType<Double>);
  end else if IsDateTime(Prp) then begin
    Val := 'STR_TO_DATE(''';
    Val := Concat(Val, DateToStr(Prp.GetValue(Self).AsType<TDateTime>, DateFormat));
    Val := Concat(Val, ''', ''%Y/%m/%d'')');
  end;
  Result := Val;
end;

function TDBImportableData.IsDateTime(Prp: TRttiProperty): Boolean;
begin
  Result := CompareText(Prp.PropertyType.Name, 'TDateTime') = 0;
end;

function TDBImportableData.IsInt(Prp: TRttiProperty): Boolean;
begin
  Result := (CompareText(Prp.PropertyType.Name, 'Integer') = 0) or
            (CompareText(Prp.PropertyType.Name, 'Int64') = 0);
end;

function TDBImportableData.IsReal(Prp: TRttiProperty): Boolean;
begin
  Result := CompareText(Prp.PropertyType.Name, 'Double') = 0;
end;

function TDBImportableData.IsString(Prp: TRttiProperty): Boolean;
begin
  Result := CompareText(Prp.PropertyType.Name, 'string') = 0;
end;

procedure TDBImportableData.SetPropertyValue(var Prp: TRttiProperty; Value: string);
begin
  if IsString(Prp) then begin
    Prp.SetValue(Self, Value);
  end else if IsReal(Prp) then begin
    Prp.SetValue(Self, StrToFloat(Value));
  end else if IsInt(Prp) then begin
    Prp.SetValue(Self, StrToInt(Value));
  end else if IsDateTime(Prp) then begin
    Prp.SetValue(Self, StrToDateTime(Value, DateFormat));
  end else begin
    raise Exception.Create('unknown datatype:' + Prp.PropertyType.Name);
  end;
end;

procedure TDBImportableData.SetValue(Column, Value: string);
var
  Cxt: TRttiContext;
  Tp: TRttiType;
  Prp: TRttiProperty;
begin
  Cxt := TRttiContext.Create;
  try
    Tp := Cxt.GetType(Self.ClassType);
    Prp := Tp.GetProperty(Column);
    // Case to abort
    if not Assigned(Prp) then begin
      raise Exception.Create('no such property:' + Column);
    end;
    // regular case
    SetPropertyValue(Prp, Value);
  finally
    Cxt.Free;
  end;
end;

procedure TDBImportableData.SetValues(Columns, Values: TStrings);
var
  i: Integer;
  ErrMsg: string;
begin
  if Columns.Count <> Values.Count then begin
    ErrMsg := 'counts do not match:(columns,values)=('
          + IntToStr(Columns.Count) + ','
          + IntToStr(Values.Count)
          + ')';
    raise Exception.Create(ErrMsg);
  end;
  for i := 0 to Columns.Count - 1 do begin
    SetValue(Columns[i], Values[i]);
  end;
end;

end.
