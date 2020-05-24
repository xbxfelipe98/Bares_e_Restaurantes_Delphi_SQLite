unit Usuarios;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Objects,
  FMX.Layouts, FMX.Controls.Presentation, FMX.StdCtrls, FMX.ListView.Types,
  FMX.ListView.Appearances, FMX.ListView.Adapters.Base, FMX.ListView,
  System.Rtti, System.Bindings.Outputs, Fmx.Bind.Editors, Data.Bind.EngExt,
  Fmx.Bind.DBEngExt, Data.Bind.Components, Data.Bind.DBScope;

type
  TfrmUsuarios = class(TForm)
    Layout1: TLayout;
    Rectangle1: TRectangle;
    Layout2: TLayout;
    btnLista: TButton;
    Rectangle2: TRectangle;
    lista: TListView;
    BindingsList1: TBindingsList;
    layBot: TLayout;
    Rectangle3: TRectangle;
    Button1: TButton;
    btnExcluir: TButton;
    btnEditar: TButton;
    lMenu: TLayout;
    btnUsuarios: TButton;
    btnTelaPricipal: TButton;
    bttnProdutos: TButton;
    btnMesas: TButton;
    btnClientes: TButton;
    btnRelatorios: TButton;
    LinkListControlToField1: TLinkListControlToField;
    BindSourceDB3: TBindSourceDB;
    Rectangle4: TRectangle;
    LinkPropertyToFieldIndex: TLinkPropertyToField;
    procedure FormTouch(Sender: TObject; const Touches: TTouches;
    const Action: TTouchAction);
    procedure btnListaClick(Sender: TObject);
    procedure btnTelaPricipalClick(Sender: TObject);
    procedure listaClick(Sender: TObject);
    procedure listaItemClick(const Sender: TObject; const AItem: TListViewItem);
    procedure Button1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure btnEditarClick(Sender: TObject);

  private
    { Private declarations }
    VID : string;
  public
    { Public declarations }
  end;

var
  frmUsuarios: TfrmUsuarios;

implementation

{$R *.fmx}

uses pasModulo, Principal, CUsuarios;

procedure TfrmUsuarios.btnEditarClick(Sender: TObject);
begin
  if (VID <> '') then
  begin
  CaUsuarios := TCaUsuarios.Create(Self);
  CaUsuarios.edtID.Text := VID;
  CaUsuarios.Show;

  close;
  end
  else
  begin
    ShowMessage('Selecione um registro!');
  end;

end;

procedure TfrmUsuarios.btnExcluirClick(Sender: TObject);
begin

    if (VID <> '') then
    begin

      MessageDlg('Deseja exluir o registro infomado?',
      System.UITypes.TMsgDlgType.mtInformation,
      [System.UITypes.TMsgDlgBtn.mbYes, System.UITypes.TMsgDlgBtn.mbNo], 0,
      procedure(const BotaoPressionado: TModalResult)
        begin
          case BotaoPressionado of
              mrYes: begin

                dm.con.Connected := true;
                dm.QueryDeletaUsuario.Close;
                //dm.QueryDeletaUsuario.sql.Clear;

                //dm.QueryDeletaUsuario.SQL.Add('delete from usuarios where id = :id');

                dm.QueryDeletaUsuario.ParamByName('id').AsString := VID;

                dm.QueryDeletaUsuario.ExecSQL;

                ShowMessage('Dado Excluido!');
                dm.ClientDataSet1.active := false;
                dm.ClientDataSet1.active := true;

              end;
              mrNo: begin
                //ShowMessage('Voc� respondeu n�o');
              end;
          end;
        end
      );
    end;


end;

procedure TfrmUsuarios.btnListaClick(Sender: TObject);
begin
  if (lMenu.Visible = false) then
  begin
    lMenu.Visible := true;

    {FloatAnimation1.Inverse := False;
    FloatAnimation1.StartValue := - 200;
    FloatAnimation1.StopValue := 0 ;
    FloatAnimation1.Start; }

  end
  else
  begin
    lmenu.Visible := false;

  end;
end;

procedure TfrmUsuarios.btnTelaPricipalClick(Sender: TObject);
begin
  frmPrincipal := TfrmPrincipal.Create(Self);
  frmPrincipal.Show;
  close;
end;

procedure TfrmUsuarios.Button1Click(Sender: TObject);
begin

  CaUsuarios := TCaUsuarios.Create(Self);
  CaUsuarios.Show;
  close;

end;

procedure TfrmUsuarios.FormShow(Sender: TObject);
begin
  dm.ClientDataSet1.active := false;
  dm.ClientDataSet1.active := true;
end;

procedure TfrmUsuarios.FormTouch(Sender: TObject; const Touches: TTouches;
  const Action: TTouchAction);
begin
  //VID := dm.QueryListLogin.FieldByName('ID').Value;
  //ShowMessage(VID.ToString);
end;

procedure TfrmUsuarios.listaClick(Sender: TObject);
begin
  //VID := dm.SQLDataSet1.FieldByName('ID').Value;
  //ShowMessage(VID.ToString);
end;

procedure TfrmUsuarios.listaItemClick(const Sender: TObject;
  const AItem: TListViewItem);
begin
     VID := dm.ClientDataSet1.FieldByName('ID').Value;
     //lista.ItemIndex.ToString;
     //ShowMessage(VID);
end;

end.