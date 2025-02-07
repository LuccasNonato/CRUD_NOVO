unit Cadastro.Model.Interfaces;

interface

uses
  Cadastro.Controller.intarfaces;

 type


     iCidades = interface
       ['{3511B8DF-F0B8-4A04-804E-CF3E3FB8EA81}']
       function CodigoCidade(aValue : integer) : iCidades; overload;
       function CodigoCidade : integer; overload;

       function NomeCidade(aValue : string) : iCidades; overload;
       function NomeCidade : string; overload;

       function Estado(aValue : string) : iCidades; overload;
       function Estado : string; overload;

       function Cep(aValue : string) : iCidades; overload;
       function Cep : string; overload;
     end;

     iClientes = interface
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

       function CodigoCidade(aValue : integer): iClientes; overload;
       function CodigoCidade : integer; overload;

       function CEPCliente(aValue : string): iClientes; overload;
       function CepCliente : string; overload;
     end;

     iModelFactory = interface
       ['{F4F3D7D3-79F5-4A42-B5E4-8D9F4C2C95A5}']
       procedure CriarCliente(Value : iClientes);
       procedure EditarCliente(Value : iClientes);
       procedure ExcluirCliente(Value : iClientes);

       procedure CriarCidade(Value : iCidades);
       procedure EditarCidade(Value : iCidades);
       procedure ExcluirCidade(Value : iCidades);

     end;


implementation

end.
