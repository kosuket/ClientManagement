unit LoadOperator;

interface
uses
  System.Classes;

type ILoadOperator = interface
  procedure SetColumnHeader(Columns: TStrings);
  procedure AddValueRow(Values: TStrings);
  procedure MakeTemplateTsv(FilePath: string);
end;
implementation
end.
