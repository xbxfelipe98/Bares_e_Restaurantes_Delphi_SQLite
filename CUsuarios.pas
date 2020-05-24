unit CUsuarios;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.Controls.Presentation, FMX.StdCtrls, FMX.Objects, FMX.Layouts, FMX.Edit;

type
  TCaUsuarios = class(TForm)
    Layout1: TLayout;
    Layout2: TLayout;
    Rectangle2: TRectangle;
    btnLista: TButton;
    layBot: TLayout;
    Rectangle3: TRectangle;
    btnSalvar: TButton;
    layPrincipal: TLayout;
    Rectangle1: TRectangle;
    Layout5: TLayout;
    Layout6: TLayout;
    Layout7: TLayout;
    Layout8: TLayout;
    Layout9: TLayout;
    Layout10: TLayout;
    Layout11: TLayout;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Layout12: TLayout;
    Layout13: TLayout;
    Layout14: TLayout;
    Layout15: TLayout;
    Layout16: TLayout;
    edtSenha: TEdit;
    edtID: TEdit;
    edtNome: TEdit;
    edtUsuario: TEdit;
    lMenu: TLayout;
    Rectangle4: TRectangle;
    btnTelaPricipal: TButton;
    btnUsuarios: TButton;
    bttnProdutos: TButton;
    btnMesas: TButton;
    btnClientes: TButton;
    btnRelatorios: TButton;
    layCampos: TLayout;
    procedure btnSalvarClick(Sender: TObject);
    procedure btnListaClick(Sender: TObject);
    procedure btnUsuariosClick(Sender: TObject);
    procedure btnTelaPricipalClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  CaUsuarios: TCaUsuarios;

implementation

{$R *.fmx}

uses pasModulo, Usuarios, Principal;

procedure TCaUsuarios.btnListaClick(Sender: TObject);
begin
  if (lMenu.Visible = false) then
  begin
    lMenu.Visible := true;


  end
  else
  begin
    lmenu.Visible := false;

  end;
end;

procedure TCaUsuarios.btnSalvarClick(Sender: TObject);
begin
  dm.con.Connected := false;
  if(edtSenha.Text = '') or (edtNome.Text = '') or (edtUsuario.Text = '') then
  begin
      ShowMessage('Todos os campos devem ser preenchidos!');
  END
  else
  begin
    if (edtID.Text = '') then
    Begin
      dm.con.Connected := true;
      dm.QueryInsertUsuario.close;

      dm.QueryInsertUsuario.ParamByName('SENHA').AsString := edtSenha.Text;
      dm.QueryInsertUsuario.ParamByName('NOME').AsString := edtNome.Text;
      dm.QueryInsertUsuario.ParamByName('USUARIO').AsString := edtUsuario.Text;

      dm.QueryInsertUsuario.ExecSQL;
      frmUsuarios := TfrmUsuarios.Create(Self);
      frmUsuarios.Show;
      close;
    End
    ELSE
    Begin

      dm.con.Connected := true;
      dm.QueryUpdateUsuario.Close;

      dm.QueryUpdateUsuario.ParamByName('SENHA').AsString := edtSenha.Text;
      dm.QueryUpdateUsuario.ParamByName('NOME').AsString := edtNome.Text;
      dm.QueryUpdateUsuario.ParamByName('USUARIO').AsString := edtUsuario.Text;
      dm.QueryUpdateUsuario.ParamByName('ID').AsString := edtID.Text;

      dm.QueryUpdateUsuario.ExecSQL;

      dm.QueryUpdateUsuario.ExecSQL;
      frmUsuarios := TfrmUsuarios.Create(Self);
      frmUsuarios.Show;
      close;

    end;
  end;
end;

procedure TCaUsuarios.btnTelaPricipalClick(Sender: TObject);
begin
  frmUsuarios := frmUsuarios.Create(Self);
  frmUsuarios.Show;
  close;
end;

procedure TCaUsuarios.btnUsuariosClick(Sender: TObject);
begin
  frmUsuarios := TfrmUsuarios.Create(Self);
  frmUsuarios.Show;
  close;
end;

procedure TCaUsuarios.FormActivate(Sender: TObject);
begin
  if edtID.Text <> '' then
  begin
    dm.con.Connected := false;
    dm.con.Connected := true;
    dm.QueryBuscaUsuario.Close;

    dm.QueryBuscaUsuario.ParamByName('ID').AsString := edtID.Text;
    dm.QueryBuscaUsuario.Open;

    edtNome.Text := dm.QueryBuscaUsuario.FieldByName('NOME').Value;
    edtUsuario.Text := dm.QueryBuscaUsuario.FieldByName('USUARIO').Value;
    edtSenha.Text := dm.QueryBuscaUsuario.FieldByName('SENHA').Value;

  end;

end;

end.
