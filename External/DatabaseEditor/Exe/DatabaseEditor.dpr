program DatabaseEditor;

uses
  Vcl.Forms,
  MainFrm in '..\Src\MainFrm.pas' {FrmMain},
  DBGridBaseFrm in '..\Src\DBGridBaseFrm.pas' {FrmDBGridBase},
  MySQLAccessor in '..\..\Utils\DBAccess\MySQLAccessor.pas',
  DBEditFrm in '..\Src\DBEditFrm.pas' {FrmDBEdit},
  CsvOutput in '..\..\CsvOperation\Src\CsvOutput.pas',
  CsvOpUtils in '..\..\CsvOperation\Src\CsvOpUtils.pas',
  CsvLoader in '..\..\CsvOperation\Src\CsvLoader.pas',
  TableListFrm in '..\Src\TableListFrm.pas' {FrmTableList};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFrmMain, FrmMain);
  Application.Run;
end.
