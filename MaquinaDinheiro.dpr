program MaquinaDinheiro;

uses
  Vcl.Forms,
  uFrmMaquinaDinheiro in 'uFrmMaquinaDinheiro.pas' {frmMaquinaDinheiro};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmMaquinaDinheiro, frmMaquinaDinheiro);
  Application.Run;
end.
