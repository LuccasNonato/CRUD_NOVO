unit Cadastro.Model.Clientes;

interface

uses
  Cadastro.Model.Interfaces, Cadastro.Model.Cidades,
  Cadastro.Controller.intarfaces, Cadastro.Controller.Cadastro;

Type
  TCadastroCliente = class(TInterfacedObject, iClientes)
    private
     FCodigoCliente : integer;
     FCGCCPFCliente : string;
     FNomeCliente : string;
     FTelefoneCliente : string;
     FEnderecoCliente : string;
     FBairroCliente : string;
     FComplementoCliente : string;
     FEMailCliente : string;

     //cidades
     FCep : string;
     FCodigoCidade : integer;

     Cadastro : TControllerCadastro;

    public
      constructor Create;
      destructor  Destroy; override;
      class function New : iClientes;

       function CodigoCliente(aValue : integer) : iClientes; overload;
       function CodigoCliente : integer; overload;

       function CGCCPFCliente(aValue : string) : iClientes; overload;
       function CGCCPFCliente : string; overload;

       function NomeCliente(aValue : string) : iClientes; overload;
       function NomeCliente : string; overload;

       function TelefoneCliente(aValue : string) : iClientes; overload;
       function TelefoneCliente : string; overload;

       function EnderecoCliente(aValue : string) : iClientes; overload;
       function EnderecoCliente : string; overload;

       function BairroCliente(aValue : string) : iClientes; overload;
       function BairroCliente : string; overload;

       function ComplementoCliente(aValue : string) : iClientes; overload;
       function ComplementoCliente : string; overload;

       function EMailCliente(aValue : string) : iClientes; overload;
       function EMailCliente : string; overload;

       function CodigoCidade(aValue : integer) : iClientes; overload;
       function CodigoCidade : integer; overload;

       function CEPCliente(aValue : string): iClientes; overload;
       function CepCliente : string; overload;

       function &end: icontrollerCadastro;

    end;
implementation

{ TCadastroCliente }

function TCadastroCliente.&end: iControllerCadastro;
begin
  Cadastro.New.CadastrarCidades;
end;

function TCadastroCliente.BairroCliente: string;
begin
  Result := FBairroCliente;
end;

function TCadastroCliente.BairroCliente(aValue: string): iClientes;
begin
  Result := Self;
  FBairroCliente := aValue;
end;

function TCadastroCliente.CEPCliente(aValue: string): iClientes;
begin
  Result := Self;
  FCep := aValue;
end;

function TCadastroCliente.CEPCliente: string;
begin
  Result :=  FCep;
end;

function TCadastroCliente.CGCCPFCliente: string;
begin
  Result := FCGCCPFCliente;
end;

function TCadastroCliente.CGCCPFCliente(aValue: string): iClientes;
begin
  Result := Self;
  FCGCCPFCliente := aValue;
end;

function TCadastroCliente.CodigoCliente(aValue: integer): iClientes;
begin
  Result := Self;
  FCodigoCliente := aValue;
end;

function TCadastroCliente.CodigoCidade(aValue: integer): iClientes;
begin
 Result := Self;
 FCodigoCidade := aValue;
end;

function TCadastroCliente.CodigoCidade: integer;
begin
  Result := FCodigoCidade;
end;

function TCadastroCliente.CodigoCliente: integer;
begin
  Result := FCodigoCliente;
end;

function TCadastroCliente.ComplementoCliente(aValue: string): iClientes;
begin
  Result := Self;
  FComplementoCliente := aValue;
end;

function TCadastroCliente.ComplementoCliente: string;
begin
  Result := FComplementoCliente;
end;

constructor TCadastroCliente.Create;
begin

end;

destructor TCadastroCliente.Destroy;
begin

  inherited;
end;

function TCadastroCliente.EMailCliente(aValue: string): iClientes;
begin
  Result := Self;
  FEMailCliente := aValue;
end;

function TCadastroCliente.EMailCliente: string;
begin
   Result := FEMailCliente;
end;

function TCadastroCliente.EnderecoCliente: string;
begin
   Result := FEnderecoCliente;
end;

function TCadastroCliente.EnderecoCliente(aValue: string): iClientes;
begin
  Result := Self;
  FEnderecoCliente := aValue;
end;

class function TCadastroCliente.New: iClientes;
begin
  Result := Self.Create;
end;

function TCadastroCliente.NomeCliente(aValue: string): iClientes;
begin
  Result := Self;
  FNomeCliente := aValue;
end;

function TCadastroCliente.NomeCliente: string;
begin
  Result := FNomeCliente;
end;

function TCadastroCliente.TelefoneCliente: string;
begin
  Result := FTelefoneCliente;
end;

function TCadastroCliente.TelefoneCliente(aValue: string): iClientes;
begin
  Result := Self;
  FTelefoneCliente := aValue;
end;

end.
