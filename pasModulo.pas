unit pasModulo;

interface

uses
  System.SysUtils, System.Classes, Data.DbxSqlite, Data.FMTBcd, Data.DB,
  Data.SqlExpr, FMX.Platform, FMX.virtualkeyboard, Datasnap.Provider,
  Datasnap.DBClient ;

type
  Tdm = class(TDataModule)
    con: TSQLConnection;
    QueryLogin: TSQLQuery;
    QueryListLogin: TSQLQuery;
    SQLDataSet1: TSQLDataSet;
    ClientDataSet1: TClientDataSet;
    DataSetProvider1: TDataSetProvider;
    QueryInsertUsuario: TSQLQuery;
    QueryDeletaUsuario: TSQLQuery;
    QueryUpdateUsuario: TSQLQuery;
    QueryBuscaUsuario: TSQLQuery;
    QueryListMesas: TSQLQuery;
    cdListMesas: TClientDataSet;
    dspListMesas: TDataSetProvider;
    dsListMesas: TSQLDataSet;
    cdListMesas2: TClientDataSet;
    dsListMesas2: TSQLDataSet;
    dpsListMesas2: TDataSetProvider;
    procedure conBeforeConnect(Sender: TObject);


  private
    { Private declarations }
  public
    { Public declarations }

   end;

var
  dm: Tdm;

implementation

{%CLASSGROUP 'FMX.Controls.TControl'}

{$R *.dfm}



procedure Tdm.conBeforeConnect(Sender: TObject);
begin
  {$IFDEF ANDROID}

  con.Params.Values['Database'] := GetHomePath + PathDelim + 'Limner.db';

  {$ENDIF}
end;

end.