unit uIMaquina;

interface

uses
  uTroco, System.Generics.Collections;

type
  IMaquina = interface ['{C5B69046-5724-4B84-8CEC-78AFA0B7124A}']
    function MontarTroco(dTroco: Double): TList<TTroco>;
  end;

implementation

end.
