unit uFrmMaquinaDinheiro;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  Vcl.Grids, Vcl.StdCtrls, Vcl.ExtCtrls, System.StrUtils, uTroco,
  System.Generics.Collections, uMaquinaDinheiro;

type
  TfrmMaquinaDinheiro = class(TForm)
    btnTroco: TButton;
    strgridTroco: TStringGrid;
    edtTroco: TEdit;
    lblTroco: TLabel;
    procedure edtTrocoChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnTrocoClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    bFormatando: Boolean;
    listaTroco: TList<TTroco>;
    function FormatarMoeda(sValor: String) : String;
    procedure FormatarGridTroco;
    procedure CalcularTroco;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmMaquinaDinheiro: TfrmMaquinaDinheiro;

implementation

{$R *.dfm}

{ TForm1 }

procedure TfrmMaquinaDinheiro.btnTrocoClick(Sender: TObject);
begin
  if StrToFloat(ReplaceStr(edtTroco.Text, '.', '')) <= 0 then begin
    MessageDlg('O valor do troco deve ser maior que zero!', mtWarning, [mbok], 0);
    edtTroco.SetFocus;
    Exit;
  end;

  CalcularTroco();
end;

procedure TfrmMaquinaDinheiro.CalcularTroco;
var
  oMaquinaDinheiro: TMaquinaDinheiro;
  dTroco: Double;
  iCont: Integer;
begin
  oMaquinaDinheiro := TMaquinaDinheiro.Create;
  try
    dTroco := StrToFloat(ReplaceStr(edtTroco.Text, '.', ''));
    listaTroco := oMaquinaDinheiro.MontarTroco(dTroco);

    strgridTroco.RowCount := 1;

    for iCont := 0 to listaTroco.Count - 1 do begin
      if (listaTroco[iCont].Quantidade > 0) then begin
        strgridTroco.RowCount := strgridTroco.RowCount + 1;
        strgridTroco.Cells[0, strgridTroco.RowCount - 1] := listaTroco[iCont].Cedula;
        strgridTroco.Cells[1, strgridTroco.RowCount - 1] := IntToStr(listaTroco[iCont].Quantidade);
      end;
    end;
  finally
    FreeAndNil(oMaquinaDinheiro);
  end;
end;

procedure TfrmMaquinaDinheiro.edtTrocoChange(Sender: TObject);
begin
  if Not bFormatando then begin
    bFormatando := True;
    edtTroco.Text := FormatarMoeda(edtTroco.Text);
    edtTroco.SelStart := Length(edtTroco.Text);
    bFormatando := False;
  end;
end;

procedure TfrmMaquinaDinheiro.FormatarGridTroco;
begin
  strgridTroco.Cells[0, 0] := 'Cédula';
  strgridTroco.Cells[1, 0] := 'Quantidade';
end;

function TfrmMaquinaDinheiro.FormatarMoeda(sValor: String): String;
var
  iPosicao: Integer;
  sDecimal, sCentena, sMilhar, sMilhao: String;
begin
  //Removendo caracteres especiais
  for iPosicao := 1 to Length(sValor) do
    if not (sValor[iPosicao] in ['0'..'9']) then
      Delete(sValor, iPosicao, 1);

  //Removendo zeros a esquerda
  while (Copy(sValor, 1, 1) = '0') and (Length(sValor) > 0) do begin
    sValor := RightStr(sValor, Length(sValor) - 1);
  end;

  if Length(sValor) = 0 then begin
    sValor := '0,00';
  end else if Length(sValor) = 1 then begin
    sValor := '0,0'+sValor;
  end else if Length(sValor) = 2 then begin
    sValor := '0,'+sValor;
  end else begin
    sValor := DupeString(' ', 11 - Length(sValor))+sValor;
    sMilhao := IfThen(Copy(sValor, 1, 3) <> '   ', Trim(Copy(sValor, 1, 3))+'.');
    sMilhar := IfThen(Copy(sValor, 4, 3) <> '   ', Trim(Copy(sValor, 4, 3))+'.');
    sCentena := IfThen(Copy(sValor, 7, 3) <> '   ', Trim(Copy(sValor, 7, 3))+',');
    sDecimal := Copy(sValor, 10, 2);
    sValor := sMilhao+sMilhar+sCentena+sDecimal
  end;

  Result := sValor;
end;

procedure TfrmMaquinaDinheiro.FormCreate(Sender: TObject);
begin
  FormatarGridTroco();
end;

procedure TfrmMaquinaDinheiro.FormDestroy(Sender: TObject);
begin
  listaTroco := nil;
end;

end.
