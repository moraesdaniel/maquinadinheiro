unit uTroco;

interface

type
  TTroco = class
  private
    FCedula: String;
    FValorCedula: Double;
    FQuantidade: Integer;
  protected
    { protected declarations }
  public
    constructor Create(sCedula: String; dValorCedula: Double; iQuantidade: Integer);
  published
    property Cedula: String read FCedula write FCedula;
    property ValorCedula: Double read FValorCedula write FValorCedula;
    property Quantidade: Integer read FQuantidade write FQuantidade;
  end;

implementation

{ TTroco }

constructor TTroco.Create(sCedula: String; dValorCedula: Double;
  iQuantidade: Integer);
begin
  FCedula := sCedula;
  FValorCedula := dValorCedula;
  FQuantidade := iQuantidade;
end;

end.
