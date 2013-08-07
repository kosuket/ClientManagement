unit LoadColumn;

interface
uses
  System.Classes, DBImportableData, Generics.Collections;
type TTargetProperty = class
  private
    FDataClass: TClass;
    FPropertyName: string;
  public
    constructor Create(DataClass: TClass; PropertyName: string);
    property DataClass: TClass read FDataClass write FDataClass;
    property PropertyName: string read FPropertyName write FPropertyName;
end;
type TLoadColumn = class
  private
    FMstColFlg: Boolean;
    FHeaderName: string;
    FTargetPropertyList: TList<TTargetProperty>;
  public
    constructor Create(MstColFlg: Boolean; HeaderName: string;
          DataClass: TClass; PropertyName: string);
    destructor Destroy; override;
    property MstColFlg: Boolean read FMstColFlg write FMstColFlg;
    property HeaderName: string read FHeaderName write FHeaderName;
    property TargetPropertyList: TList<TTargetProperty> read FTargetPropertyList write FTargetPropertyList;
    procedure AddTargetProperty(DataClass: TClass; PropertyName: string);
end;

implementation

{ TLoadColumn }

procedure TLoadColumn.AddTargetProperty(DataClass: TClass;
  PropertyName: string);
begin
  FTargetPropertyList.Add(TTargetProperty.Create(DataClass, PropertyName));
end;

constructor TLoadColumn.Create(MstColFlg: Boolean; HeaderName: string;
  DataClass: TClass; PropertyName: string);
begin
  inherited Create;
  FMstColFlg := MstColFlg;
  FHeaderName := HeaderName;
  FTargetPropertyList := TList<TTargetProperty>.Create;
  FTargetPropertyList.Add(TTargetProperty.Create(DataClass, PropertyName));
end;

destructor TLoadColumn.Destroy;
begin
  FTargetPropertyList.Clear;
  FTargetPropertyList.Free;
  inherited Destroy;
end;

{ TTargetProperty }

constructor TTargetProperty.Create(DataClass: TClass; PropertyName: string);
begin
  inherited Create;
  FDataClass := DataClass;
  FPropertyName := PropertyName;
end;

end.
