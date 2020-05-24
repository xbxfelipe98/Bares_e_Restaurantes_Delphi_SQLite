unit cConect;

interface

  type tConect = class

  Private

  Protected

  Public
    constructor Create;
    destructor Destroy; override;

  end;


implementation
  uses  pasModulo;
{ Tpessoa }
//ctrl shit c para criar
  constructor tConect.Create;
  begin


  end;

  destructor tConect.Destroy;
  begin
    dm.con.Connected := true;
    dm.QueryLogin.Close;
    inherited;
  end;

end.
