unit Cadastro.Model.Query;

interface

uses
  Cadastro.Model.Conexao.Interfaces, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Stan.Param,
  FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt, FireDAC.VCLUI.Wait,
  FireDAC.Comp.UI, Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

Type
  TModelQuery = class(TInterfacedObject, iQuery)
    private
      FParent : iConexao;
      FQuery : TFDQuery;
    public
      constructor Create(Parent : iConexao);
      destructor  Destroy; override;
      class function New(Parent : iConexao) : iQuery;

      function SQL(Value : string) : iQuery;
      function ExecSQL: iQuery;
      function Parametro(Nome: string; Valor: Variant): iQuery;
      function DataSet : TDataSet;

    end;
implementation

uses
  System.SysUtils, Cadastro.Model.Conexao;

{ TModelQuery }

constructor TModelQuery.Create(Parent : iConexao);
begin
  FParent := Parent;
  FQuery  := TFDQuery.Create(nil);

  if not Assigned(FParent) then
    FParent :=  TModelConexao.New;


  FQuery.Connection := TFDConnection(FParent.Connection);
end;

function TModelQuery.DataSet: TDataSet;
begin
  Result := FQuery;
end;

destructor TModelQuery.Destroy;
begin
  FreeAndNil(FQuery);
  inherited;
end;

class function TModelQuery.New(Parent : iConexao): iQuery;
begin
  Result := Self.Create(Parent);
end;

function TModelQuery.SQL(Value: string): iQuery;
begin
  Result := Self;
  FQuery.SQL.Clear;
  FQuery.SQL.Add(Value);

  if Pos('SELECT', UpperCase(Value)) = 1 then
    FQuery.Active := True;
end;

function TModelQuery.ExecSQL: iQuery;
begin
  Result := Self;

  if FQuery.SQL.Text <> '' then
    FQuery.ExecSQL;
end;

function TModelQuery.Parametro(Nome: string; Valor: Variant): iQuery;
begin
  Result := Self;
  FQuery.ParamByName(Nome).Value := Valor;
end;

end.
