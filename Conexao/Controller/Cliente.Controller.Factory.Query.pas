unit Cliente.Controller.Factory.Query;

interface

uses
  Cadastro.Controller.Factory.Interfaces, Cadastro.Model.Conexao.Interfaces;

Type
  TControllerFactoryQuery = class(TInterfacedObject, iFactoryQuery)
    private
    public
      constructor Create;
      destructor  Destroy; override;
      class function New : iFactoryQuery;

      function Query(Connection : iConexao) : iQuery;
    end;
implementation

uses
  Cadastro.Model.Query;

{ TControllerFactoryQuery }

constructor TControllerFactoryQuery.Create;
begin

end;

destructor TControllerFactoryQuery.Destroy;
begin

  inherited;
end;

class function TControllerFactoryQuery.New: iFactoryQuery;
begin
  Result := Self.Create;
end;

function TControllerFactoryQuery.Query(Connection : iConexao): iQuery;
begin
  Result := TModelQuery.New(Connection);
end;

end.
