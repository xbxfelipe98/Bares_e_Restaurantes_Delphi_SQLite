unit cDialogo;

interface

  type Tmenssagem = class

  Private
    TMR : TModalResult;

  Protected

  Public
    constructor Create;
    destructor Destroy; override;

    property MR :TModalResult read TMR write TMR;


  end;

implementation
  uses vcl.Dialogs, Usuarios;
{ TfrmUsuarios }

//ctrl shit c para criar
constructor Tmenssagem.Create;
begin

end;

destructor Tmenssagem.Destroy;
begin
  showmessage(Nome);
  inherited;
end;

end.

