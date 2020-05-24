unit Login;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.Controls.Presentation, FMX.StdCtrls, FMX.Edit, FMX.Objects, FMX.Layouts;

type
  TForm1 = class(TForm)
    lblUsuario: TLabel;
    lblSenha: TLabel;
    edtUsuario: TEdit;
    edtSenha: TEdit;
    btnLogin: TButton;
    btnSair: TButton;
    layPrincipal: TLayout;
    layTopo: TLayout;
    layCampos: TLayout;
    Image1: TImage;


    procedure btnLoginClick(Sender: TObject);
    procedure btnSairClick(Sender: TObject);

  private
    procedure limpar;
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.fmx}

uses pasModulo, cConect, Principal;

procedure TForm1.btnLoginClick(Sender: TObject);
begin
  if (edtUsuario.Text = '') and (edtSenha.Text = '') then
  begin

      ShowMessage('Campos us�ario e senha obrigatorios!');
      showmessage( GetHomePath + PathDelim + 'Limner.db');
  end
  else
  begin
    try
      dm.con.Connected := true;
      dm.QueryLogin.Close;
      dm.QueryLogin.ParamByName('usuario').AsString := edtUsuario.Text;
      dm.QueryLogin.ParamByName('senha').AsString := edtSenha.Text;
      dm.QueryLogin.Open;


      if not dm.QueryLogin.IsEmpty then
      BEGIN
      //ABRIR PROXIMA TELA
       frmPrincipal :=  TfrmPrincipal.Create(Self);
       frmPrincipal.show;
      END

      ELSE
      BEGIN
        showmessage('Dados Incorretos');
        limpar;
      END;

    except
      on E:Exception do
      ShowMessage(E.Message);
    end;

  end;
end;


procedure TForm1.btnSairClick(Sender: TObject);
begin
  Close;
end;

procedure TForm1.limpar;
begin
  edtUsuario.Text:= '';
  edtSenha.Text := '';
end;

end.
