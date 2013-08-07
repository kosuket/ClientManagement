unit LoadColumns;

interface
uses
  LoadColumn;
type TLoadColumns = class
  protected
    procedure SetUpLoadColumns; virtual; abstract;
  public
    constructor Create;
    function GetLoadColumn(HeaderName: string): TLoadColumn;
end;

implementation
uses
  System.Rtti;

{ TLoadColumns }

constructor TLoadColumns.Create;
begin
  SetUpLoadColumns;
end;

function TLoadColumns.GetLoadColumn(HeaderName: string): TLoadColumn;
var
  Cxt: TRttiContext;
  Tp: TRttiType;
  Prp: TRttiProperty;
begin
  Cxt := TRttiContext.Create;
  try
    Tp := Cxt.GetType(Self.ClassType);
    Prp := Tp.GetProperty(HeaderName);
    if Assigned(Prp) then begin
      Result := Prp.GetValue(Self).AsType<TLoadColumn>;
    end else begin
      Result := nil;
    end;
  finally
    Cxt.Free;
  end;
end;

end.
