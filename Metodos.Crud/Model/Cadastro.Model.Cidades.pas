unit Cadastro.Model.Cidades;

interface

uses
  Cadastro.Model.Interfaces, Cadastro.Controller.Cadastro,
  Cadastro.Controller.intarfaces;

Type
  TCadastroCidades = class(TInterfacedObject, iCidades)
    private
     FCodigoCidade : integer;
     FNomeCidade : string;
     FEstado : string;
     FCep : string;
     Cadastrar : iControllerCadastro;
    public
      constructor Create;
      destructor  Destroy; override;
      class function New : iCidades;

       function CodigoCidade(aValue : integer) : iCidades; overload;
       function CodigoCidade : integer; overload;

       function NomeCidade(aValue : string) : iCidades; overload;
       function NomeCidade : string; overload;

       function Estado(aValue : string) : iCidades; overload;
       function Estado : string; overload;

       function Cep(aValue : string) : iCidades; overload;
       function Cep : string; overload;


    end;
implementation

{ TCadastroCidades }


function TCadastroCidades.Cep: string;
begin
  Result := FCep;
end;

function TCadastroCidades.Cep(aValue: string): iCidades;
begin
  Result := Self;
  FCep := aValue;
end;

function TCadastroCidades.CodigoCidade: integer;
begin
  Result := FCodigoCidade;
end;

function TCadastroCidades.CodigoCidade(aValue: integer): iCidades;
begin
  Result := Self;
  FCodigoCidade := aValue;
end;

constructor TCadastroCidades.Create;
begin

end;

destructor TCadastroCidades.Destroy;
begin
  inherited;
end;

function TCadastroCidades.Estado: string;
begin
  Result := FEstado;
end;

function TCadastroCidades.Estado(aValue: string): iCidades;
begin
  Result := Self;
  FEstado := aValue;
end;

class function TCadastroCidades.New: iCidades;
begin
  Result := Self.Create;
end;

function TCadastroCidades.NomeCidade: string;
begin
  Result := FNomeCidade;
end;

function TCadastroCidades.NomeCidade(aValue: string): iCidades;
begin
  Result := Self;
  FNomeCidade := aValue;
end;

end.
