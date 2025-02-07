unit Cadastro.Controller.Factory.Interfaces;

interface

uses
  Cadastro.Model.Conexao.Interfaces;

 type

     iFactoryQuery = interface
       ['{49B3E949-8BE4-4884-A55A-B79B70C86BBD}']
       function Query(Connection : iConexao) : iQuery;
     end;

implementation

end.
