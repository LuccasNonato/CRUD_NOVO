program Crudproj;

uses
  Vcl.Forms,
  Utils in 'Utils\Utils.pas',
  Cadastro.Model.Cidades in 'Metodos.Crud\Model\Cadastro.Model.Cidades.pas',
  Cadastro.Model.Clientes in 'Metodos.Crud\Model\Cadastro.Model.Clientes.pas',
  Cadastro.Model.Factory in 'Metodos.Crud\Model\Cadastro.Model.Factory.pas',
  Cadastro.Model.Interfaces in 'Metodos.Crud\Model\Cadastro.Model.Interfaces.pas',
  Cadastro.Controller.Factory.Interfaces in 'Conexao\Controller\Cadastro.Controller.Factory.Interfaces.pas',
  Cliente.Controller.Factory.Query in 'Conexao\Controller\Cliente.Controller.Factory.Query.pas',
  Cadastro.Model.Conexao.Interfaces in 'Conexao\Model\Cadastro.Model.Conexao.Interfaces.pas',
  Cadastro.Model.Conexao in 'Conexao\Model\Cadastro.Model.Conexao.pas',
  Cadastro.Model.Entidade.Clientes in 'Conexao\Model\Cadastro.Model.Entidade.Clientes.pas',
  Cadastro.Model.Query in 'Conexao\Model\Cadastro.Model.Query.pas',
  View.Principal in 'Metodos.Crud\View\View.Principal.pas' {Menu},
  Cadastro.Model.Entidade.Cidades in 'Conexao\Model\Cadastro.Model.Entidade.Cidades.pas',
  Cadastro.Controller.intarfaces in 'Metodos.Crud\Controller\Cadastro.Controller.intarfaces.pas',
  View.Cadastro.Relatorio in 'Metodos.Crud\View\View.Cadastro.Relatorio.pas' {FrmRelatorio},
  Cadastro.Controller.Cadastro in 'Metodos.Crud\Controller\Cadastro.Controller.Cadastro.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TMenu, Menu);
  Application.CreateForm(TFrmRelatorio, FrmRelatorio);
  Application.Run;
end.
