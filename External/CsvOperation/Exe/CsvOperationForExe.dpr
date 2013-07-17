program CsvOperationForExe;

uses
  Vcl.Forms,
  MainFrm in 'MainFrm.pas' {FrmMain},
  CsvLoader in '..\src\CsvLoader.pas',
  MySQLAccessor in '..\..\Utils\dbaccess\MySQLAccessor.pas',
  CsvOutput in '..\src\CsvOutput.pas',
  CsvOpUtils in '..\src\CsvOpUtils.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFrmMain, FrmMain);
  Application.Run;
end.
