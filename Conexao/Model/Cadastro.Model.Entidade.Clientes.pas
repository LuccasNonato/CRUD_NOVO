unit Cadastro.Model.Entidade.Clientes;

interface

uses
  Cadastro.Model.Conexao.Interfaces, Data.DB, Cliente.Controller.Factory.Query,
  Cadastro.Model.Interfaces, System.SysUtils;

Type
  TModelEntidadeClientes = class(TInterfacedObject, iEntidade)
  private
    FQuery : iQuery;
    FiltrosSQL : string;
  public
    constructor Create;
    destructor Destroy; override;
    class function New : iEntidade;

    function Listar(Value : TDataSource): iEntidade;
    function Filtros(Value : string): iEntidade;

    function CadastrarCli(CadastroModel: iClientes): iEntidade;
    function EditarCli(CadastroModel: iClientes): iEntidade;
    function DeletarCli(CadastroModel: iClientes): iEntidade;

    function CadastrarCid(CadastroModel : iCidades): iEntidade;
    function EditarCid(CadastroModel : iCidades) : iEntidade;
    function DeletarCid(CadastroModel : iCidades) : iEntidade;
  end;

implementation

{ TModelEntidadeClientes }

function TModelEntidadeClientes.CadastrarCid(CadastroModel: iCidades): iEntidade;
begin
  Result := Self;
end;

function TModelEntidadeClientes.CadastrarCli(CadastroModel: iClientes): iEntidade;
begin
  Result := Self;

  if not Assigned(CadastroModel) then
    raise Exception.Create('CadastroModel não pode ser nil');

  // SQL para inserir cliente
  FQuery.SQL('INSERT INTO CLIENTES (Codigo_Cliente, CGC_CPF_Cliente, Nome, Telefone, Endereco, Codigo_Cidade, Complemento, E_mail, Cep, bairro) ' +
             'VALUES (:Codigo_Cliente, :CGC_CPF_Cliente, :Nome, :Telefone, :Endereco, :Codigo_Cidade, :Complemento, :E_mail, :Cep, :bairro)');

  // Preencher parâmetros com os dados do CadastroModel
  FQuery.Parametro('Codigo_Cliente', IntToStr(CadastroModel.CodigoCliente));
  FQuery.Parametro('CGC_CPF_Cliente', CadastroModel.CgcCpfCliente);
  FQuery.Parametro('Nome', CadastroModel.NomeCliente);
  FQuery.Parametro('Telefone', CadastroModel.TelefoneCliente);
  FQuery.Parametro('Endereco', CadastroModel.EnderecoCliente);
  FQuery.Parametro('Codigo_Cidade', IntToStr(CadastroModel.CodigoCidade));
  FQuery.Parametro('Complemento', CadastroModel.ComplementoCliente);
  FQuery.Parametro('E_mail', CadastroModel.EMailCliente);
  FQuery.Parametro('Cep', CadastroModel.CEPCliente);
  FQuery.Parametro('bairro', CadastroModel.BairroCliente);

  FQuery.ExecSQL;
end;

function TModelEntidadeClientes.EditarCid(CadastroModel: iCidades): iEntidade;
begin
  Result := Self;
end;

function TModelEntidadeClientes.EditarCli(CadastroModel: iClientes): iEntidade;
begin
  Result := Self;

  FQuery.SQL('UPDATE CLIENTES SET CGC_CPF_Cliente = :CGC_CPF_Cliente, Nome = :Nome, Telefone = :Telefone, Endereco = :Endereco, ' +
             'Codigo_Cidade = :Codigo_Cidade, Complemento = :Complemento, E_mail = :E_mail, Cep = :Cep, Bairro = :Bairro ' +
             'WHERE Codigo_Cliente = :Codigo_Cliente');

  FQuery.Parametro('Codigo_Cliente', IntToStr(CadastroModel.CodigoCliente));
  FQuery.Parametro('CGC_CPF_Cliente', CadastroModel.CgcCpfCliente);
  FQuery.Parametro('Nome', CadastroModel.NomeCliente);
  FQuery.Parametro('Telefone', CadastroModel.TelefoneCliente);
  FQuery.Parametro('Endereco', CadastroModel.EnderecoCliente);
  FQuery.Parametro('Codigo_Cidade', IntToStr(CadastroModel.CodigoCidade));
  FQuery.Parametro('Complemento', CadastroModel.ComplementoCliente);
  FQuery.Parametro('E_mail', CadastroModel.EMailCliente);
  FQuery.Parametro('Cep', CadastroModel.CEPCliente);
  FQuery.Parametro('Bairro', CadastroModel.BairroCliente);

  FQuery.ExecSQL;
end;

function TModelEntidadeClientes.Filtros(Value: string): iEntidade;
begin
  Result := Self;

  if Trim(Value) <> '' then
    FiltrosSQL := ' AND Nome = ' + QuotedStr(Value)
  else
    FiltrosSQL := '';
end;

function TModelEntidadeClientes.DeletarCid(CadastroModel: iCidades): iEntidade;
begin
  Result := Self;
end;

function TModelEntidadeClientes.DeletarCli(CadastroModel: iClientes): iEntidade;
begin
  Result := Self;

  FQuery.SQL('DELETE FROM CLIENTES WHERE Codigo_Cliente = :Codigo_Cliente');
  FQuery.Parametro('Codigo_Cliente', IntToStr(CadastroModel.CodigoCliente));

  FQuery.ExecSQL;
end;

constructor TModelEntidadeClientes.Create;
begin
  FQuery := TControllerFactoryQuery.New.Query(nil);
  FiltrosSQL := '';
end;

destructor TModelEntidadeClientes.Destroy;
begin
  inherited;
end;

function TModelEntidadeClientes.Listar(Value: TDataSource): iEntidade;
var
  SQLBase: string;
begin
  Result := Self;

  SQLBase := 'SELECT * FROM CLIENTES';

  if FiltrosSQL <> '' then
    SQLBase := SQLBase + ' WHERE 1=1 ' + FiltrosSQL;

  FQuery.SQL(SQLBase);
  Value.DataSet := FQuery.DataSet;
end;

class function TModelEntidadeClientes.New: iEntidade;
begin
  Result := Self.Create;
end;

end.

