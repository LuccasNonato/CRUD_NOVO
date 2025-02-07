unit Cadastro.Controller.Cadastro;

interface

uses
  Cadastro.Controller.intarfaces, Cadastro.Model.Conexao.Interfaces,
  Cadastro.Model.Interfaces, system.Generics.Collections;

Type
  TControllerCadastro = class(TInterfacedObject, iControllerCadastro)
    private
      FBusca : iEntidade;
      FCidades : iCidades;
      FClientes : iClientes;
    public
      constructor Create;
      destructor  Destroy; override;
      class function New : iControllerCadastro;

     function CadastrarClientes : iControllerCadastro;
     function CadastrarCidades : iControllerCadastro;

     function EditarCidades : iControllerCadastro;
     function EditarClientes : iControllerCadastro;

     function DeletarCidades : iControllerCadastro;
     function DeletarClientes : iControllerCadastro;

    end;
implementation

uses
  Cadastro.Model.Entidade.Cidades, Cadastro.Model.Cidades;

{ TControllerCadastroCidades }

function TControllerCadastro.CadastrarCidades: iControllerCadastro;
begin
  FBusca.CadastrarCid(FCidades);
end;

function TControllerCadastro.CadastrarClientes: iControllerCadastro;
begin
  FBusca.CadastrarCli(FClientes);
end;

constructor TControllerCadastro.Create;
begin
  FBusca := TModelEntidadeCidades.new;
end;

function TControllerCadastro.DeletarCidades: iControllerCadastro;
begin
  FBusca.DeletarCid(FCidades);
end;

function TControllerCadastro.DeletarClientes: iControllerCadastro;
begin
  FBusca.DeletarCli(FClientes);
end;

destructor TControllerCadastro.Destroy;
begin

  inherited;
end;

function TControllerCadastro.EditarCidades: iControllerCadastro;
begin
  FBusca.EditarCid(FCidades);
end;

function TControllerCadastro.EditarClientes: iControllerCadastro;
begin
  FBusca.EditarCli(FClientes);
end;

class function TControllerCadastro.New: iControllerCadastro;
begin
  Result := Self.Create;
end;

end.
