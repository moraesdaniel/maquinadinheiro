program MaquinaDinheiro;

uses
  Vcl.Forms,
  uFrmMaquinaDinheiro in 'uFrmMaquinaDinheiro.pas' {frmMaquinaDinheiro},
  uIMaquina in 'uIMaquina.pas',
  uMaquinaDinheiro in 'uMaquinaDinheiro.pas',
  uTroco in 'uTroco.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmMaquinaDinheiro, frmMaquinaDinheiro);
  Application.Run;
end.
