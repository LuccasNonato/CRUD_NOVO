unit Cadastro.Model.Conexao.Interfaces;

interface

uses
 Data.DB, Cadastro.Model.Interfaces;

type

  iConexao = interface
    ['{01CB28B7-04E1-404B-BD68-F3FE31991329}']
    function  Connection : TCustomConnection;
  end;

  iQuery = interface
    ['{3745E9AD-5520-4CC9-8537-54C5765F2F51}']
    function SQL(Value : string) : iQuery;
    function ExecSQL: iQuery;
    function Parametro(Nome: string; Valor: Variant): iQuery;
    function DataSet : TDataSet;
  end;

  iConexaoParametros = interface
    ['{8DDBF2A4-51C6-46F7-97A6-F69B8FBF8C87}']
    function DataBase(Value : string) : iConexaoParametros;
    function DriverName(Value : string) : iConexaoParametros;
    function ParamsDataBase(Value : string) : iConexaoParametros;
    function ParamsUserName(Value : string) : iConexaoParametros;
    function ParamsPassword(Value : string) : iConexaoParametros;
  end;

  iEntidade = interface
    ['{A063F4D0-706F-4D7F-900A-BE9DA5CC33E3}']
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

end.
