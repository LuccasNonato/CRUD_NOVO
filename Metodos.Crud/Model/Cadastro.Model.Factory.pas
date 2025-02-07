unit Cadastro.Model.Factory;

interface

uses
  Cadastro.Model.Interfaces, Cadastro.Model.Clientes;

type

  TModelFactory = class(TInterfacedObject, iModelFactory)
  private
    public
      constructor Create;
      destructor Destroy; override;
      class function New: iModelFactory;

      function Cliente: iClientes;
      function Cidades: iCidades;
      procedure CriarCliente(Value : iClientes);
      procedure CriarCidade(Value : iCidades);
      procedure EditarCidade(Value : iCidades);
      procedure EditarCliente(Value : iClientes);
      procedure ExcluirCidade(Value : iCidades);
      procedure ExcluirCliente(Value : iClientes);
  end;

implementation

uses
  Cadastro.Model.Cidades, System.SysUtils, Vcl.Dialogs,
  Cadastro.Model.Entidade.Cidades, Cadastro.Model.Entidade.Clientes;

{ TModelFactory }

constructor TModelFactory.Create;
begin
  inherited;
end;

procedure TModelFactory.CriarCidade(Value : iCidades);
begin
  TModelEntidadeCidades.New.CadastrarCid(Value);
end;


procedure TModelFactory.CriarCliente(Value : iClientes);
begin
  TModelEntidadeClientes.New.CadastrarCli(Value);
end;

destructor TModelFactory.Destroy;
begin
  inherited;
end;

procedure TModelFactory.EditarCidade(Value: iCidades);
begin
  TModelEntidadeCidades.New.EditarCid(Value);
end;

procedure TModelFactory.EditarCliente(Value: iClientes);
begin
  TModelEntidadeClientes.New.EditarCli(Value);
end;

procedure TModelFactory.ExcluirCidade(Value: iCidades);
begin
  TModelEntidadeCidades.New.DeletarCid(Value);
end;

procedure TModelFactory.ExcluirCliente(Value: iClientes);
begin
  TModelEntidadeClientes.New.DeletarCli(Value);
end;

function TModelFactory.Cidades: iCidades;
begin
 Result := TCadastroCidades.new;
end;

function TModelFactory.Cliente: iClientes;
begin
  Result := TCadastroCliente.New;
end;

class function TModelFactory.New: iModelFactory;
begin
  Result := Self.Create;
end;

end.
