unit Cadastro.Model.Conexao;

interface

uses
  Cadastro.Model.Conexao.Interfaces, Data.DB, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Stan.Param,
  FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt, FireDAC.VCLUI.Wait,
  FireDAC.Comp.UI, FireDAC.Comp.DataSet, FireDAC.Comp.Client, FireDAC.Stan.ExprFuncs, FireDAC.Phys.SQLiteDef,
  FireDAC.Phys.SQLite;

Type
  TModelConexao = class(TInterfacedObject, iConexao, iConexaoParametros)
    private
     FParent : TCustomConnection;
     FConexao : TFDConnection;

     FDataBase : string;
     FDriverName : string;
     FParamsDataBase : string;
     FParamsUserName : string;
     FParamsPassword : string;
    procedure Parametros;

    public
      constructor Create;
      destructor  Destroy; override;
      class function New : iConexao;

      function  Connection : TCustomConnection;

      function DataBase(Value : string) : iConexaoParametros;
      function DriverName(Value : string) : iConexaoParametros;
      function ParamsDataBase(Value : string) : iConexaoParametros;
      function ParamsUserName(Value : string) : iConexaoParametros;
      function ParamsPassword(Value : string) : iConexaoParametros;

    end;
implementation

uses
  System.SysUtils;

{ TModelConexao }

function TModelConexao.Connection: TCustomConnection;
begin
  Result := FConexao;
end;

constructor TModelConexao.Create;
begin
   FConexao := TFDConnection.Create(nil);
   Parametros;
   FConexao.Connected := True;
end;

function TModelConexao.DataBase(Value: string): iConexaoParametros;
begin
  Result := Self;
  FDataBase := Value;
end;

destructor TModelConexao.Destroy;
begin
  FreeAndNil(FConexao);
  inherited;
end;

function TModelConexao.DriverName(Value: string): iConexaoParametros;
begin
  Result := Self;
  FDriverName := Value;
end;

class function TModelConexao.New: iConexao;
begin
  Result := Self.Create;
end;

function TModelConexao.ParamsDataBase(Value: string): iConexaoParametros;
begin
  Result := Self;
  FParamsDataBase := Value;
end;

function TModelConexao.ParamsPassword(Value: string): iConexaoParametros;
begin
  Result := Self;
  FParamsPassword := Value;
end;

procedure TModelConexao.Parametros;
begin
  Self.ParamsDataBase('C:\Users\Luccas\Desktop\Sinqia\bd\Banco.db');
  Self.DriverName('sqlite');
  FConexao.DriverName := FDriverName;
  FConexao.Params.Database := FParamsDataBase;
end;

function TModelConexao.ParamsUserName(Value: string): iConexaoParametros;
begin
  Result := Self;
  FParamsUserName := Value;
end;

end.
