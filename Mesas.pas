unit Mesas;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.ListView.Types, FMX.ListView.Appearances, FMX.ListView.Adapters.Base,
  FMX.ListView, FMX.Controls.Presentation, FMX.StdCtrls, FMX.Objects,
  FMX.Layouts, Data.Bind.EngExt, Fmx.Bind.DBEngExt, System.Rtti,
  System.Bindings.Outputs, Fmx.Bind.Editors, Data.Bind.Components,
  Data.Bind.DBScope;

type
  TfrmMesas = class(TForm)
    layPrincipal: TLayout;
    layTopo: TLayout;
    Rectangle2: TRectangle;
    btnLista: TButton;
    layBot: TLayout;
    Rectangle3: TRectangle;
    Button2: TButton;
    btnExcluir: TButton;
    btnEditar: TButton;
    layLista: TLayout;
    liwMesas: TListView;
    layMenu: TLayout;
    Rectangle4: TRectangle;
    btnTelaPricipal: TButton;
    Button1: TButton;
    bttnProdutos: TButton;
    btnMesas: TButton;
    btnClientes: TButton;
    btnRelatorios: TButton;
    BindSourceDB1: TBindSourceDB;
    BindingsList1: TBindingsList;
    LinkListControlToField1: TLinkListControlToField;
    LinkPropertyToFieldIndex: TLinkPropertyToField;
    LinkPropertyToFieldAlternatingColors: TLinkPropertyToField;
    StyleBook1: TStyleBook;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmMesas: TfrmMesas;

implementation

{$R *.fmx}

uses pasModulo;

end.
