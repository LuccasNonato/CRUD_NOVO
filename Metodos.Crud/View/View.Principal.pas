unit View.Principal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Data.DB,
  Vcl.Grids, Vcl.DBGrids, strutils, Utils, System.JSON,
  Cadastro.Model.Conexao, Cadastro.Model.Conexao.Interfaces,
  Cadastro.Model.Interfaces, ppDesignLayer, ppParameter, ppComm, ppRelatv,
  ppProd, ppClass, ppReport, ppBands, ppCache, System.RegularExpressions,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.UI.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Phys, FireDAC.Phys.SQLite, FireDAC.Phys.SQLiteDef,
  FireDAC.Stan.ExprFuncs, FireDAC.Comp.Client, FireDAC.Comp.DataSet, ppModule,
  daDataModule, ppDB, ppDBPipe, ppDBBDE, ppStrtch, ppMemo, ppCtrls, ppPrnabl,
  ppVar;

type
  TMenu = class(TForm)
    PnlMenu: TPanel;
    PnlBusca: TPanel;
    PnlClientes: TPanel;
    PnlCidades: TPanel;
    DBGridBusca: TDBGrid;
    DsBusca: TDataSource;
    EdtBuscar: TEdit;
    LblBuscar: TLabel;
    PnlAltera: TPanel;
    PnlAcoes: TPanel;
    PnlIncluir: TPanel;
    PnlExcluir: TPanel;
    PnlAlterar: TPanel;
    PnlForm: TPanel;
    PnlAcaoSalvar: TPanel;
    PnlCancelar: TPanel;
    PnlSalvar: TPanel;
    BtnAcaoCidades: TButton;
    BtnAcaoClientes: TButton;
    PnlRelatorio: TPanel;
    PnlCidadesCadastro: TPanel;
    EdtCodigoCidade: TLabeledEdit;
    EdtNome: TLabeledEdit;
    EdtEstado: TLabeledEdit;
    EdtCep: TLabeledEdit;
    PnlClientesCadastro: TPanel;
    edtCodigoCidadeCliente: TLabeledEdit;
    EdtCodigo: TLabeledEdit;
    EdtCPF: TLabeledEdit;
    EdtNomeCliente: TLabeledEdit;
    EdtTelefone: TLabeledEdit;
    EdtEndereco: TLabeledEdit;
    EdtBairro: TLabeledEdit;
    EdtComplemento: TLabeledEdit;
    EdtEmail: TLabeledEdit;
    EdtCepCliente: TLabeledEdit;
    PnlRelatorioView: TPanel;
    GrpInicial: TGroupBox;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    EdtCodigoIni: TEdit;
    EdtCodigoCidadeIni: TEdit;
    EdtEstadoIni: TEdit;
    GrpFinal: TGroupBox;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    EdtCodigoFim: TEdit;
    EdtCodigoCidadeFim: TEdit;
    EdtEstadoFim: TEdit;
    CbxListarAgrupado: TCheckBox;
    BtnImprimir: TButton;
    BtnPesquisar: TButton;
    ppReport1: TppReport;
    ppParameterList1: TppParameterList;
    ppHeaderBand1: TppHeaderBand;
    ppDetailBand1: TppDetailBand;
    ppFooterBand1: TppFooterBand;
    ppBDEPipeline1: TppBDEPipeline;
    ppDBPipeline1: TppDBPipeline;
    FDQuery1: TFDQuery;
    FDConnection1: TFDConnection;
    dsRelatorio: TDataSource;
    ppLabel1: TppLabel;
    ppLabel2: TppLabel;
    ppLabel3: TppLabel;
    ppLabel4: TppLabel;
    ppLabel5: TppLabel;
    ppLabel6: TppLabel;
    ppDBText1: TppDBText;
    ppDBMemo1: TppDBMemo;
    ppDBText2: TppDBText;
    ppDBMemo2: TppDBMemo;
    ppDBMemo3: TppDBMemo;
    ppLine1: TppLine;
    ppLine2: TppLine;
    ppSystemVariable1: TppSystemVariable;
    ppLine3: TppLine;
    ppLine4: TppLine;
    ppLine5: TppLine;
    ppLine6: TppLine;
    procedure PnlCidadesClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure PnlClientesClick(Sender: TObject);
    procedure BtnAcaoCidadesClick(Sender: TObject);
    procedure BtnAcaoClientesClick(Sender: TObject);
    procedure PnlIncluirClick(Sender: TObject);
    procedure PnlAlterarClick(Sender: TObject);
    procedure PnlCancelarClick(Sender: TObject);
    procedure PnlSalvarClick(Sender: TObject);
    procedure PnlRelatorioClick(Sender: TObject);
    procedure PnlExcluirClick(Sender: TObject);
    procedure DBGridBuscaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGridBuscaKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGridBuscaCellClick(Column: TColumn);
    procedure BtnPesquisarClick(Sender: TObject);
    procedure BtnImprimirClick(Sender: TObject);
  private
    { Private declarations }
    FConexao : TModelConexao;
    FBusca : iEntidade;
    FCadastro : iModelFactory;
    Tipo : string;
    SqlPadrao : string;

    procedure HabilitaPanel(Painel: TPanel);
    procedure SetPainelAtivo(Painel: TPanel; FormClass: TFormClass);
    procedure HabilitaCadastro;
    procedure LimparCampos;
    procedure CamposRecebeRegistrosClientes;
    procedure CamposRecebeRegistrosCidades;
    function  ValidaCamposCidade : boolean;
    function  ValidaCamposClientes : Boolean;
    procedure PegaUltimoRegistro;
    function  VerificaSeExisteCidade: boolean;
  public
    { Public declarations }
  end;

var
  Menu: TMenu;
  PainelClicado: TPanel;

implementation

uses
  Cadastro.Model.Entidade.Clientes,
  Cadastro.Model.Entidade.Cidades, Cadastro.Model.Factory,
  Cadastro.Model.Cidades, View.Cadastro.Relatorio, Cadastro.Model.Clientes;

{$R *.dfm}

procedure TMenu.BtnAcaoCidadesClick(Sender: TObject);
begin
  PnlCidadesClick(nil);
  pnlClientes.Enabled := not pnlClientes.Enabled;
  DBGridBusca.Enabled := not DBGridBusca.Enabled;
  HabilitaPanel(PnlCidades);
  BtnAcaoCidades.Caption := IfThen(BtnAcaoCidades.Caption = '-', '+', '-');
  BtnAcaoClientes.Enabled := not BtnAcaoClientes.Enabled;
  PnlRelatorio.Enabled := not(PnlRelatorio.Enabled);
end;

procedure TMenu.BtnAcaoClientesClick(Sender: TObject);
begin
  PnlClientesClick(nil);
  PnlCidades.Enabled := not PnlCidades.Enabled;
  DBGridBusca.Enabled := not DBGridBusca.Enabled;
  PnlClientesCadastro.Visible := not PnlClientesCadastro.Visible;
  HabilitaPanel(PnlClientes);
  BtnAcaoClientes.Caption := IfThen(BtnAcaoClientes.Caption = '-', '+', '-');
  BtnAcaoCidades.Enabled := not BtnAcaoCidades.Enabled;
  PnlRelatorio.Enabled := not(PnlRelatorio.Enabled);
end;

procedure TMenu.BtnImprimirClick(Sender: TObject);
var
  FiltroRelatorio: string;
begin
  FDConnection1.Connected := True;
  if SqlPadrao = '' then
    SqlPadrao := FDQuery1.SQL.Text
  else
    FDQuery1.SQL.Text := SqlPadrao;

  FiltroRelatorio := '';

  if Pos('WHERE', UpperCase(FDQuery1.SQL.Text)) = 0 then
    FiltroRelatorio := ' WHERE 1=1 ';

  if (EdtCodigoIni.Text <> '') and (EdtCodigoFim.Text <> '') then
    FiltroRelatorio := FiltroRelatorio + ' AND clientes.Codigo_Cliente BETWEEN :CodigoClienteIni AND :CodigoClienteFim';

  if (EdtCodigoCidadeIni.Text <> '') and (EdtCodigoCidadeFim.Text <> '') then
    FiltroRelatorio := FiltroRelatorio + ' AND cidades.Codigo_cidade BETWEEN :CodigoCidadeIni AND :CodigoCidadeFim';

  if (Edtestadoini.Text <> '') and (EdtEstadoFim.Text <> '') then
    FiltroRelatorio := FiltroRelatorio + ' AND cidades.Estado IN (:EstadoIni, :EstadoFim)'
  else if (Edtestadoini.Text <> '') then
    FiltroRelatorio := FiltroRelatorio + ' AND cidades.Estado = :EstadoIni'
  else if (EdtEstadoFim.Text <> '') then
    FiltroRelatorio := FiltroRelatorio + ' AND cidades.Estado = :EstadoFim';

  if CbxListarAgrupado.Checked then
    FiltroRelatorio := FiltroRelatorio + ' GROUP BY CIDADES.CODIGO_CIDADE';

  FDQuery1.SQL.Text := FDQuery1.SQL.Text + FiltroRelatorio;

  if (EdtCodigoIni.Text <> '') and (EdtCodigoFim.Text <> '') then
  begin
    FDQuery1.ParamByName('CodigoClienteIni').AsString := EdtCodigoIni.Text;
    FDQuery1.ParamByName('CodigoClienteFim').AsString := EdtCodigoFim.Text;
  end;

  if (EdtCodigoCidadeIni.Text <> '') and (EdtCodigoCidadeFim.Text <> '') then
  begin
    FDQuery1.ParamByName('CodigoCidadeIni').AsString := EdtCodigoCidadeIni.Text;
    FDQuery1.ParamByName('CodigoCidadeFim').AsString := EdtCodigoCidadeFim.Text;
  end;

  if (Edtestadoini.Text <> '') then
    FDQuery1.ParamByName('EstadoIni').AsString := Edtestadoini.Text;

  if (EdtEstadoFim.Text <> '') then
    FDQuery1.ParamByName('EstadoFim').AsString := EdtEstadoFim.Text;

  FDQuery1.Close;
  FDQuery1.Open;
  FDConnection1.Connected := False;

  ppReport1.PrintReport;
end;


procedure TMenu.BtnPesquisarClick(Sender: TObject);
begin
  FBusca.Filtros(EdtBuscar.Text).Listar(DsBusca);
  DsBusca.DataSet.Refresh;
end;


procedure TMenu.CamposRecebeRegistrosCidades;
begin
 EdtCodigoCidade.Text := DsBusca.DataSet.FieldByName('codigo_Cidade').AsString;
 edtNome.Text := DsBusca.DataSet.FieldByName('Nome').AsString;
 EdtEstado.Text := DsBusca.DataSet.FieldByName('Estado').AsString;
 EdtCep.Text := DsBusca.DataSet.FieldByName('CepFinal').AsString;
end;

procedure TMenu.CamposRecebeRegistrosClientes;
begin
  edtCodigo.Text := DsBusca.DataSet.FieldByName('codigo_Cliente').AsString;
  edtcpf.Text := DsBusca.DataSet.FieldByName('cgc_cpf_cliente').AsString;
  EdtNomeCliente.Text := DsBusca.DataSet.FieldByName('nome').AsString;
  EdtTelefone.Text := DsBusca.DataSet.FieldByName('telefone').AsString;
  EdtEndereco.Text := DsBusca.DataSet.FieldByName('endereco').AsString;
  edtCodigoCidadeCliente.Text := DsBusca.DataSet.FieldByName('codigo_cidade').AsString;
  edtComplemento.Text := DsBusca.DataSet.FieldByName('complemento').AsString;
  EdtEmail.Text := DsBusca.DataSet.FieldByName('e_mail').AsString;
  EdtCepCliente.Text := DsBusca.DataSet.FieldByName('cep').AsString;
  EdtBairro.Text := DsBusca.DataSet.FieldByName('bairro').AsString;

end;

procedure TMenu.DBGridBuscaCellClick(Column: TColumn);
begin
  if BtnAcaoClientes.Enabled then
   begin
     CamposRecebeRegistrosClientes;
   end
   else
   begin
     CamposRecebeRegistrosCidades;
   end;
end;

procedure TMenu.DBGridBuscaKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if BtnAcaoClientes.Enabled then
   begin
     CamposRecebeRegistrosClientes;
   end
   else
   begin
     CamposRecebeRegistrosCidades;
   end;
end;

procedure TMenu.DBGridBuscaKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if BtnAcaoClientes.Enabled then
   begin
     CamposRecebeRegistrosClientes;
   end
   else
   begin
     CamposRecebeRegistrosCidades;
   end;
end;

procedure TMenu.FormCreate(Sender: TObject);
var
  Conexao: TModelConexao;
begin
  DBGridBusca.Align := alClient;
  pnlAltera.Align := alLeft;

  Conexao := TModelConexao.Create;
  try
    FDConnection1.Close;
    FDConnection1.Params.Values['Database'] := Conexao.GetDatabasePath;
    FDConnection1.Open;
  finally
    Conexao.Free;
  end;

  FBusca := TModelEntidadeClientes.New;
  FBusca.Listar(DsBusca);
end;

procedure TMenu.HabilitaCadastro;
begin
  PnlSalvar.Enabled := not(PnlSalvar.Enabled);
  PnlCancelar.Enabled := not(PnlCancelar.Enabled);

  if PnlSalvar.Color = clMoneyGreen then
    PnlSalvar.Color := clMenu
  else
    PnlSalvar.Color := clMoneyGreen;

  if PnlCancelar.Color = clInactiveCaption then
    PnlCancelar.Color := clMenu
  else
      PnlCancelar.Color := clInactiveCaption;

  PnlClientesCadastro.Enabled := not(PnlClientesCadastro.Enabled);
  PnlCidadesCadastro.Enabled := not(PnlCidadesCadastro.Enabled);
end;

procedure TMenu.HabilitaPanel(Painel: TPanel);
begin
  pnlAltera.Visible := not pnlAltera.Visible;
  pnlAltera.Enabled := True;

  if pnlAltera.Visible then
  begin
    PnlClientesCadastro.Visible := (Painel = pnlClientes);
    PnlCidadesCadastro.Visible := (Painel = pnlCidades);
    PnlRelatorioView.Visible := (Painel = pnlRelatorioView);

    if Painel = pnlCidades then
    pnlCidades.Color := clActiveCaption
    else
    pnlCidades.Color := clBtnFace;

    if Painel = pnlClientes then
      PnlClientes.Color := clActiveCaption
    else
      PnlClientes.Color := clBtnFace;

    if Painel = pnlRelatorioView then
      pnlRelatorio.Color := clActiveCaption
    else
    pnlRelatorio.Color := clBtnFace;

  end
  else
  begin
    pnlAltera.Align := alLeft;
    DBGridBusca.Visible := True;

    PnlClientesCadastro.Visible := False;
    pnlCidadesCadastro.Visible := False;
    pnlRelatorioView.Visible := False;

    pnlCidades.Color := clBtnFace;
    PnlClientes.Color := clBtnFace;
    pnlRelatorio.Color := clBtnFace;
  end;
end;



procedure TMenu.LimparCampos;
begin
  //Cidade
  EdtCodigoCidade.Text := '';
  EdtCep.Text := '';
  edtNome.Text := '';
  edtestado.Text := '';

  //Clientes
  edtCodigo.Text := '';
  edtcpf.Text := '';
  EdtNomeCliente.Text := '';
  EdtEmail.Text := '';
  EdtCodigoCidade.Text := '';
  EdtEndereco.Text := '';
  edtbairro.Text := '';
  EdtCepCliente.Text := '';
  edtComplemento.Text := '';
  EdtTelefone.Text := '';
  edtCodigoCidadeCliente.Text := '';

end;

procedure TMenu.PegaUltimoRegistro;
var
  LastCodigoCliente, LastCodigoCidade: Integer;
  FQuery: TFDQuery;
begin
  FQuery := TFDQuery.Create(nil);
  try
    FDConnection1.Connected := True;
    FQuery.Connection := FDConnection1;

    FQuery.SQL.Text := 'SELECT MAX(Codigo_Cliente) FROM CLIENTES';
    FQuery.Open;
    if FQuery.Fields[0].IsNull then
      LastCodigoCliente := 0
    else
      LastCodigoCliente := FQuery.Fields[0].AsInteger;

    FQuery.SQL.Text := 'SELECT MAX(Codigo_Cidade) FROM CIDADES';
    FQuery.Open;
    if FQuery.Fields[0].IsNull then
      LastCodigoCidade := 0
    else
      LastCodigoCidade := FQuery.Fields[0].AsInteger;

    EdtCodigo.Text := IntToStr(LastCodigoCliente + 1);
    EdtCodigoCidade.Text := IntToStr(LastCodigoCidade + 1);
  finally
    FDConnection1.Connected := False;
    FQuery.Free;
  end;
end;

procedure TMenu.PnlAlterarClick(Sender: TObject);
begin
 Tipo := 'A';

 HabilitaCadastro;
end;

procedure TMenu.PnlCancelarClick(Sender: TObject);
begin
 if PnlSalvar.Enabled then
    HabilitaCadastro;
end;

procedure TMenu.PnlCidadesClick(Sender: TObject);
begin
  PnlCidadesCadastro.Visible := True;
  pnlCidades.Color := clActiveCaption;
  PnlClientes.Color := clBtnFace;

  //BUSCA
  FBusca:= TModelEntidadeCidades.new;
  FBusca.Listar(DsBusca);

end;

procedure TMenu.PnlClientesClick(Sender: TObject);
begin
  pnlCidades.Color := clBtnFace;
  PnlClientes.Color := clActiveCaption;

  FBusca:= TModelEntidadeClientes.new;
  FBusca.Listar(DsBusca);
end;

procedure TMenu.PnlExcluirClick(Sender: TObject);
var
 FCadastroI : iCidades;
 FCadastroCli : iClientes;
begin
    FCadastro := TModelFactory.New;

    if BtnAcaoCidades.Enabled then
    begin
    FCadastroI := TCadastroCidades.New;

    FCadastroI.CodigoCidade(StrToInt(EdtCodigoCidade.Text))
              .NomeCidade(EdtNome.Text)
              .Estado(EdtEstado.Text)
              .Cep(EdtCep.Text);
    FCadastro.ExcluirCidade(FCadastroI);
    end
    else
    begin
    FCadastroCli := TCadastroCliente.New;
    FCadastroCli.CodigoCliente(strtoint(EdtCodigo.Text))
                .CGCCPFCliente(EdtCPF.Text)
                .NomeCliente(EdtNomeCliente.Text)
                .TelefoneCliente(EdtTelefone.Text)
                .EnderecoCliente(EdtEndereco.Text)
                .BairroCliente(EdtBairro.Text)
                .ComplementoCliente(EdtComplemento.Text)
                .EMailCliente(EdtEmail.Text)
                .CodigoCidade(strtoint(edtCodigoCidadeCliente.Text))
                .CEPCliente(EdtCepCliente.Text);
     FCadastro.ExcluirCliente(FCadastroCli);
     end;

 if PnlSalvar.Enabled then
    HabilitaCadastro;

 LimparCampos;
 FBusca.Listar(DsBusca);
end;

procedure TMenu.PnlIncluirClick(Sender: TObject);
begin
  Tipo := 'I';
  HabilitaCadastro;
  LimparCampos;
  PegaUltimoRegistro;
end;

procedure TMenu.PnlRelatorioClick(Sender: TObject);
begin
  PainelClicado := PnlRelatorio;

  if pnlCidades.Color = clMenu then
    pnlCidades.Color := clActiveCaption
  else
    pnlCidades.Color := clMenu;

  BtnAcaoClientes.Enabled := not BtnAcaoClientes.Enabled;
  BtnAcaoCidades.Enabled := not BtnAcaoCidades.Enabled;

  PnlAcoes.Visible := not PnlAcoes.Visible;
  PnlAcaoSalvar.Visible := PnlAcoes.Visible;

  HabilitaPanel(PnlRelatorioView);

end;

procedure TMenu.PnlSalvarClick(Sender: TObject);
var
 FCadastroI : iCidades;
 FCadastroCli : iClientes;
begin
    FCadastro := TModelFactory.New;

    if BtnAcaoCidades.Enabled then
    begin
     if not ValidaCamposCidade then
     exit;

    FCadastroI := TCadastroCidades.New;

    FCadastroI.CodigoCidade(StrToInt(EdtCodigoCidade.Text))
              .NomeCidade(EdtNome.Text)
              .Estado(EdtEstado.Text)
              .Cep(EdtCep.Text);

     if TIPO = 'I' then
     begin
      FCadastro.CriarCidade(FCadastroI);
     end
     else
     begin
       FCadastro.EditarCidade(FCadastroI);
     end;

    end
    else
    begin
    if not VerificaSeExisteCidade then
    exit;

    if not ValidaCamposClientes then
    exit;

    FCadastroCli := TCadastroCliente.New;
    FCadastroCli.CodigoCliente(strtoint(EdtCodigo.Text))
                .CGCCPFCliente(EdtCPF.Text)
                .NomeCliente(EdtNomeCliente.Text)
                .TelefoneCliente(EdtTelefone.Text)
                .EnderecoCliente(EdtEndereco.Text)
                .BairroCliente(EdtBairro.Text)
                .ComplementoCliente(EdtComplemento.Text)
                .EMailCliente(EdtEmail.Text)
                .CodigoCidade(strtoint(edtCodigoCidadeCliente.Text))
                .CEPCliente(EdtCepCliente.Text);

     if Tipo = 'I' then
     begin
      FCadastro.CriarCliente(FCadastroCli);
     end
     else
     begin
      FCadastro.EditarCliente(FCadastroCli);
     end;
    end;


    FBusca.Listar(DsBusca);

 if PnlSalvar.Enabled then
    HabilitaCadastro;

 LimparCampos;
end;

procedure TMenu.SetPainelAtivo(Painel: TPanel; FormClass: TFormClass);
begin
  PainelClicado := Painel;

  if Painel = pnlCidades then
    pnlCidades.Color := clActiveCaption
  else
    pnlCidades.Color := clBtnFace;

  if Painel = pnlClientes then
    PnlClientes.Color := clActiveCaption
  else
    PnlClientes.Color := clBtnFace;
end;

function TMenu.ValidaCamposCidade: Boolean;
begin
  Result := True;

  if Trim(EdtCodigoCidade.Text) = '' then
  begin
    ShowMessage('O campo Código da Cidade é obrigatório.');
    EdtCodigoCidade.SetFocus;
    Result := False;
    Exit;
  end;

  if Trim(EdtCep.Text) = '' then
  begin
    ShowMessage('O campo CEP é obrigatório.');
    EdtCep.SetFocus;
    Result := False;
    Exit;
  end;

  if Trim(EdtNome.Text) = '' then
  begin
    ShowMessage('O campo Nome é obrigatório.');
    EdtNome.SetFocus;
    Result := False;
    Exit;
  end;

  if Trim(EdtEstado.Text) = '' then
  begin
    ShowMessage('O campo Estado é obrigatório.');
    EdtEstado.SetFocus;
    Result := False;
    Exit;
  end
  else if Length(EdtEstado.Text) <> 2 then
  begin
    ShowMessage('O campo Estado deve ter exatamente 2 caracteres.');
    EdtEstado.SetFocus;
    Result := False;
    Exit;
  end;
end;

function TMenu.ValidaCamposClientes : Boolean;
begin
  Result := True;
  if Trim(edtcodigo.Text) = '' then
  begin
    ShowMessage('O campo Código é obrigatório.');
    edtcodigo.SetFocus;
    Result := False;
    Exit;
  end;

  if Trim(edtcpf.Text) = '' then
  begin
    ShowMessage('O campo CPF é obrigatório.');
    edtcpf.SetFocus;
    Result := False;
    Exit;
  end
  else if not TRegEx.IsMatch(edtcpf.Text, '^\d{3}\.\d{3}\.\d{3}\-\d{2}$') then
  begin
    ShowMessage('CPF inválido. O formato deve ser XXX.XXX.XXX-XX.');
    edtcpf.SetFocus;
    Result := False;
    Exit;
  end;

  if Trim(EdtNomeCliente.Text) = '' then
  begin
    ShowMessage('O campo Nome do Cliente é obrigatório.');
    EdtNomeCliente.SetFocus;
    Result := False;
    Exit;
  end;

  if Trim(EdtEmail.Text) = '' then
  begin
    ShowMessage('O campo Email é obrigatório.');
    EdtEmail.SetFocus;
    Result := False;
    Exit;
  end
  else if not TRegEx.IsMatch(EdtEmail.Text, '^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$') then
  begin
    ShowMessage('Email inválido. O formato deve ser exemplo@dominio.com.');
    EdtEmail.SetFocus;
    Result := False;
    Exit;
  end;

  if Trim(edtcodigocidadecliente.Text) = '' then
  begin
    ShowMessage('O campo Código da Cidade é obrigatório.');
    edtcodigocidadecliente.SetFocus;
    Result := False;
    Exit;
  end;

  if Trim(EdtEndereco.Text) = '' then
  begin
    ShowMessage('O campo Endereço é obrigatório.');
    EdtEndereco.SetFocus;
    Result := False;
    Exit;
  end;

  if Trim(edtbairro.Text) = '' then
  begin
    ShowMessage('O campo Bairro é obrigatório.');
    edtbairro.SetFocus;
    Result := False;
    Exit;
  end;

  if Trim(edtcepcliente.Text) = '' then
  begin
    ShowMessage('O campo CEP é obrigatório.');
    edtcepcliente.SetFocus;
    Result := False;
    Exit;
  end
  else if not TRegEx.IsMatch(edtcepcliente.Text, '^\d{5}\-\d{3}$') then
  begin
    ShowMessage('CEP inválido. O formato deve ser XXXXX-XXX.');
    edtcepcliente.SetFocus;
    Result := False;
    Exit;
  end;

  if Trim(edtcomplemento.Text) = '' then
  begin
    ShowMessage('O campo Complemento é obrigatório.');
    edtcomplemento.SetFocus;
    Result := False;
    Exit;
  end;

  if Trim(edttelefone.Text) = '' then
  begin
    ShowMessage('O campo Telefone é obrigatório.');
    edttelefone.SetFocus;
    Result := False;
    Exit;
  end;

end;


function TMenu.VerificaSeExisteCidade: boolean;
var
  CodigoCidade: Integer;
  FQuery: TFDQuery;
begin
  Result := True;
  FQuery := TFDQuery.Create(nil);
  try
    FDConnection1.Connected := True;
    FQuery.Connection := FDConnection1;

    FQuery.SQL.Text := 'SELECT COUNT(*) FROM CIDADES WHERE Codigo_Cidade = :Codigo_Cidade';
    FQuery.ParamByName('Codigo_Cidade').AsInteger := StrToInt(EdtCodigoCidadeCliente.Text);
    FQuery.Open;

    if FQuery.Fields[0].AsInteger = 0 then
    begin
      ShowMessage('Cidade não encontrada no banco de dados!');
      Result := False;
    end;

  finally
    FDConnection1.Connected := False;
    FQuery.Free;
  end;
end;

end.
