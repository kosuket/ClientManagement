// Provides basic feature of
// viewing and editing database
{ TODO : Adjust grid appearance (zebra, highlight modified row) }
unit DBGridBaseFrm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, MySQLAccessor, Vcl.Grids, Vcl.DBGrids,
  Data.DB, Datasnap.Provider, Datasnap.DBClient, Vcl.StdCtrls, CsvOutput, CsvLoader;

type
  TFrmDBGridBase = class(TForm)
    MainGrid: TDBGrid;
  private
    { Private declarations }
    DataSource: TDataSource;
    Provider: TDataSetProvider;
    CsvOutput: TCsvOutput;
    CsvLoader: TCsvLoader;
  protected
    Accessor: TMySQLAccessor;
    CDataSet: TClientDataSet;
    procedure AddRow;
    procedure DeleteRow;
    procedure Commit;
    procedure LoadQuery(Sql: string);
    procedure LoadTable(Table: string);
    procedure ExportData(DestFile, Table: string);
    procedure ImportData(DestFile, Table: string);
  public
    { Public declarations }
    constructor Create(AOwner: TComponent; Accessor: TMySQLAccessor); reintroduce;
    destructor Destroy; override;
    procedure Embed(AParent: TWinControl);
  end;

var
  FrmDBGridBase: TFrmDBGridBase;

implementation

{$R *.dfm}

{ TFrmDBEdit }

procedure TFrmDBGridBase.AddRow;
begin
  CDataSet.Insert;
end;

procedure TFrmDBGridBase.Commit;
begin
  CDataSet.ApplyUpdates(0);
  CDataSet.Close;
end;

constructor TFrmDBGridBase.Create(AOwner: TComponent; Accessor: TMySQLAccessor);
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
  MainGrid.DataSource := DataSource;

  // CSV tools
  CsvOutput := TCsvOutput.Create(Accessor);
  CsvLoader := TCsvLoader.Create(Accessor);
end;

destructor TFrmDBGridBase.Destroy;
begin
  CsvLoader.Free;
  CsvOutput.Free;
  CDataSet.Free;
  Provider.Free;
  DataSource.Free;
  inherited;
end;

procedure TFrmDBGridBase.DeleteRow;
begin
  if CDataSet.RecordCount > 0 then begin
    CDataSet.Delete;
  end;
end;

procedure TFrmDBGridBase.Embed(AParent: TWinControl);
begin
  Parent := AParent;
  Align := alClient;
  BorderStyle := bsNone;
end;

procedure TFrmDBGridBase.ExportData(DestFile, Table: string);
begin
  CsvOutput.ExecuteOverWrite(DestFile, Table);
end;

procedure TFrmDBGridBase.ImportData(DestFile, Table: string);
begin
  CsvLoader.Execute(DestFile, Table, ',');
end;

procedure TFrmDBGridBase.LoadQuery(Sql: string);
begin
  CDataSet.Close;
  Provider.DataSet := Accessor.ExecuteQuery(Sql);
  CDataSet.Open;
end;

procedure TFrmDBGridBase.LoadTable(Table: string);
begin
  LoadQuery(Concat('SELECT * FROM ', Table));
end;

end.
