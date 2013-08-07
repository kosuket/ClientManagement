program PrjDataTest;

uses
  Vcl.Forms,
  DataTest in 'DataTest.pas' {FrmMain},
  MySQLAccessor in '..\..\External\Utils\DBAccess\MySQLAccessor.pas',
  Client in '..\data\Client.pas',
  DBImportableData in '..\data\DBImportableData.pas',
  ClientInserter in '..\Dao\ClientInserter.pas',
  ClientLoadOperator in '..\Master\ClientLoader\ClientLoadOperator.pas',
  MasterLoader in '..\Master\Loader\MasterLoader.pas',
  LoadColumn in '..\Master\Loader\LoadColumn.pas',
  ClientGmat in '..\Data\ClientGmat.pas',
  ClientToefl in '..\Data\ClientToefl.pas',
  LoadOperator in '..\Master\Loader\LoadOperator.pas',
  ClientLoadColumns in '..\Master\ClientLoader\ClientLoadColumns.pas',
  LoadColumns in '..\Master\Loader\LoadColumns.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFrmMain, FrmMain);
  Application.Run;
end.
