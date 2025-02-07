unit Cadastro.Model.Entidade.Cidades;

interface

uses
  Cadastro.Model.Conexao.Interfaces, Data.DB, Cliente.Controller.Factory.Query,
  Cadastro.Model.Interfaces, Cadastro.Model.Cidades;

Type
  TModelEntidadeCidades = class(TInterfacedObject, iEntidade)
    private
      FQuery : iQuery;
      FiltrosSQL : string;
    public
      constructor Create;
      destructor  Destroy; override;
      class function New : iEntidade;

      function Listar(Value : TDataSource): iEntidade;
      function Filtros(Value : string): iEntidade;

      function CadastrarCid(CadastroModel : iCidades): iEntidade;
      function EditarCid(CadastroModel : iCidades) : iEntidade;
      function DeletarCid(CadastroModel : iCidades) : iEntidade;

      function CadastrarCli(CadastroModel : iClientes): iEntidade;
      function EditarCli(CadastroModel : iClientes) : iEntidade;
      function DeletarCli(CadastroModel : iClientes) : iEntidade;

    end;
implementation

uses
  System.SysUtils;



{ TModelEntidadeCidades }

function TModelEntidadeCidades.CadastrarCid(CadastroModel : iCidades): iEntidade;
var
  SQL : string;
begin
  Result := Self;

  FQuery.SQL('INSERT INTO CIDADES (Codigo_Cidade, Nome, Estado, CepInicial, CepFinal) ' +
             'VALUES (:Codigo, :Nome, :Estado, :CepInicial, :CepFinal)');
  FQuery.Parametro('Codigo', IntToStr(CadastroModel.CodigoCidade));
  FQuery.Parametro('Nome', CadastroModel.NomeCidade);
  FQuery.Parametro('Estado', CadastroModel.Estado);
  FQuery.Parametro('CepInicial', CadastroModel.Cep);
  FQuery.Parametro('CepFinal', CadastroModel.Cep);

  FQuery.ExecSQL;
end;

function TModelEntidadeCidades.CadastrarCli(
  CadastroModel: iClientes): iEntidade;
begin
  Result := Self;
end;

constructor TModelEntidadeCidades.Create;
begin
  FQuery := TControllerFactoryQuery.New.Query(nil);
end;

function TModelEntidadeCidades.DeletarCid(CadastroModel: iCidades): iEntidade;
begin
  Result := Self;

  FQuery.SQL('DELETE FROM CIDADES WHERE Codigo_Cidade = :CodigoCidade');
  FQuery.Parametro('CodigoCidade', IntToStr(CadastroModel.CodigoCidade));

  FQuery.ExecSQL;
end;

function TModelEntidadeCidades.DeletarCli(CadastroModel: iClientes): iEntidade;
begin

end;

destructor TModelEntidadeCidades.Destroy;
begin

  inherited;
end;

function TModelEntidadeCidades.EditarCid(CadastroModel: iCidades): iEntidade;
begin
  Result := Self;

  FQuery.SQL('UPDATE CIDADES SET Nome = :NomeCidade, Estado = :Estado, CepInicial = :CepInicial, CepFinal = :CepFinal ' +
             'WHERE Codigo_Cidade = :CodigoCidade');

  FQuery.Parametro('CodigoCidade', IntToStr(CadastroModel.CodigoCidade));
  FQuery.Parametro('NomeCidade', CadastroModel.NomeCidade);
  FQuery.Parametro('Estado', CadastroModel.Estado);
  FQuery.Parametro('CepInicial', CadastroModel.Cep);
  FQuery.Parametro('CepFinal', CadastroModel.Cep);

  FQuery.ExecSQL;
end;

function TModelEntidadeCidades.EditarCli(CadastroModel: iClientes): iEntidade;
begin
  Result := Self;
end;

function TModelEntidadeCidades.Filtros(Value: string): iEntidade;
begin
  Result := Self;

  if Trim(Value) <> '' then
    FiltrosSQL := ' AND Nome = ' + QuotedStr(Value)
  else
    FiltrosSQL := '';
end;

function TModelEntidadeCidades.Listar(Value: TDataSource): iEntidade;
var
  SQLBase: string;
begin
  Result := Self;

  SQLBase := 'SELECT * FROM CIDADES';

  if FiltrosSQL <> '' then
    SQLBase := SQLBase + ' WHERE 1=1 ' + FiltrosSQL;

  FQuery.SQL(SQLBase);
  Value.DataSet := FQuery.DataSet;
end;

class function TModelEntidadeCidades.New: iEntidade;
begin
  Result := Self.Create;
end;

end.
