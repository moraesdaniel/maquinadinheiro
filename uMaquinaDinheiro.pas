unit uMaquinaDinheiro;

interface

uses
  uIMaquina, System.Generics.Collections, uTroco, System.Math;

type
  TMaquinaDinheiro = class(TInterfacedObject, IMaquina)
    function MontarTroco(dTroco: Double): TList<TTroco>;
    private
      listaTroco: TList<TTroco>;
      function DivReal(dDividendo, dDivisor: Double): Integer;
    public
      constructor Create;
      destructor Destroy; override;
  end;

implementation

uses
  System.SysUtils, Vcl.Dialogs;

{ TMaquinaDinheiro }

constructor TMaquinaDinheiro.Create;
begin
  listaTroco := TList<TTroco>.Create;
  //Criando notas
  listaTroco.Add(TTroco.Create('Nota de 100,00', 100, 0));
  listaTroco.Add(TTroco.Create('Nota de 50,00', 50, 0));
  listaTroco.Add(TTroco.Create('Nota de 20,00', 20, 0));
  listaTroco.Add(TTroco.Create('Nota de 10,00', 10, 0));
  listaTroco.Add(TTroco.Create('Nota de 5,00', 5, 0));
  listaTroco.Add(TTroco.Create('Nota de 2,00', 2, 0));
  //Criando moedas
  listaTroco.Add(TTroco.Create('Moeda de 1,00', 1, 0));
  listaTroco.Add(TTroco.Create('Moeda de 0,50', 0.50, 0));
  listaTroco.Add(TTroco.Create('Moeda de 0,25', 0.25, 0));
  listaTroco.Add(TTroco.Create('Moeda de 0,10', 0.10, 0));
  listaTroco.Add(TTroco.Create('Moeda de 0,05', 0.05, 0));
  listaTroco.Add(TTroco.Create('Moeda de 0,01', 0.01, 0));
end;

destructor TMaquinaDinheiro.Destroy;
begin
  FreeAndNil(listaTroco);
  inherited;
end;

function TMaquinaDinheiro.DivReal(dDividendo, dDivisor: Double): Integer;
var
  iQuociente: Integer;
  dProduto: Double;
begin
  dProduto := dDividendo / dDivisor;
  dProduto := SimpleRoundTo(dProduto, -2);
  iQuociente := Trunc(dProduto);
  Result := iQuociente;
end;

function TMaquinaDinheiro.MontarTroco(dTroco: Double): TList<TTroco>;
var
  iCont, iQtd: Integer;
begin
  for iCont := 0 to listaTroco.Count - 1 do begin
    iQtd := DivReal(dTroco, listaTroco[iCont].ValorCedula);
    listaTroco[iCont].Quantidade := iQtd;
    dTroco := dTroco - (iQtd * listaTroco[iCont].ValorCedula);
    if dTroco = 0 then begin
      Break;
    end;
  end;

  Result := listaTroco;
end;

end.
