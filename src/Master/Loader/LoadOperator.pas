unit LoadOperator;

interface
uses
  System.Classes;

type ILoadOperator = interface
  procedure SetColumnHeader(Columns: TStrings);
  procedure AddValueRow(Values: TStrings);
end;
implementation
end.
