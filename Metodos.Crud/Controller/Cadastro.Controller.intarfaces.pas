unit Cadastro.Controller.intarfaces;

interface

type

   iControllerCadastro = interface
     ['{3143169F-380C-4CC1-964D-4B5837877389}']
     function CadastrarClientes : iControllerCadastro;
     function CadastrarCidades : iControllerCadastro;

     function EditarCidades : iControllerCadastro;
     function EditarClientes : iControllerCadastro;

     function DeletarCidades : iControllerCadastro;
     function DeletarClientes : iControllerCadastro;
   end;

implementation

end.
