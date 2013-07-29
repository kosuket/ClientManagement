unit FWSQLBaseDlgfrm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.FMTBcd, Data.DB, Data.SqlExpr,
  Vcl.ExtCtrls, MySQLAccessor, Datasnap.DBClient, Datasnap.Provider;

type
  TFWSQLBaseDialogframe = class(TForm)
    pnlBase: TPanel;
    pnlTitle: TPanel;
    Image1: TImage;
    lblTitle: TPanel;
    SQLQuery1: TSQLQuery;
  private
    { Private declarations }
    DataSource: TDataSource;
    Provider: TDataSetProvider;
  protected
    Accessor: TMySQLAccessor;
    CDataSet: TClientDataSet;
    procedure loadQuery(sql: String); virtual;
  public
    { Public declarations }
    constructor Create(AOwner: TComponent; Accessor: TMySQLAccessor); reintroduce; overload; virtual;
  end;

var
  FWSQLBaseDialogframe: TFWSQLBaseDialogframe;

implementation

{$R *.dfm}

{ TFWSQLBaseDialogframe }

constructor TFWSQLBaseDialogframe.Create(AOwner: TComponent;
  Accessor: TMySQLAccessor);
begin
  inherited Create(AOwner);
  Self.Accessor := Accessor;
  // Create DataSet coumponents
  DataSource := TDataSource.Create(Self);
  Provider := TDataSetProvider.Create(Self);
  CDataSet := TClientDataSet.Create(Self);

  // bind them
  Provider.Name := 'Provider';
  CDataSet.ProviderName := Provider.Name;
  DataSource.DataSet := CDataSet;
end;

procedure TFWSQLBaseDialogframe.loadQuery(sql: String);
begin
  CDataSet.Close;
  Provider.DataSet := Accessor.ExecuteQuery(sql);
  CDataSet.Open;
end;

end.
