program DatabaseEditor;

uses
  Vcl.Forms,
  DBEditorMainFrm in '..\Src\DBEditorMainFrm.pas' {FrmDBEditorMain},
  DBGridBaseFrm in '..\Src\DBGridBaseFrm.pas' {FrmDBGridBase},
  MySQLAccessor in '..\..\Utils\DBAccess\MySQLAccessor.pas',
  DBEditFrm in '..\Src\DBEditFrm.pas' {FrmDBEdit},
  CsvOutput in '..\..\CsvOperation\Src\CsvOutput.pas',
  CsvOpUtils in '..\..\CsvOperation\Src\CsvOpUtils.pas',
  CsvLoader in '..\..\CsvOperation\Src\CsvLoader.pas',
  TableListFrm in '..\Src\TableListFrm.pas' {FrmTableList},
  MainFrm in 'MainFrm.pas' {FrmMain};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFrmMain, FrmMain);
  Application.Run;
end.
