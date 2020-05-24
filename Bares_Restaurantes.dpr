program Bares_Restaurantes;

uses
  System.StartUpCopy,
  FMX.Forms,
  Login in 'Login.pas' {Form1},
  pasModulo in 'pasModulo.pas' {dm: TDataModule},
  Principal in 'Principal.pas' {frmPrincipal},
  Usuarios in 'Usuarios.pas' {frmUsuarios},
  CUsuarios in 'CUsuarios.pas' {CaUsuarios},
  Mesas in 'Mesas.pas' {frmMesas};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(Tdm, dm);
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.CreateForm(TfrmUsuarios, frmUsuarios);
  Application.CreateForm(TCaUsuarios, CaUsuarios);
  Application.CreateForm(TfrmMesas, frmMesas);
  Application.Run;
end.
