unit Utils;

interface

uses
  System.SysUtils, System.Classes, REST.Client, REST.Types, IPPeerClient,
  REST.Response.Adapter, Data.Bind.Components, Data.Bind.ObjectScope, System.JSON,
  IdSSL, IdSSLOpenSSL, IdIOHandlerSocket, system.Rtti, vcl.controls;

type
  TValidadorCampos = class
  public
  class function ValidarCampos(ARoot: TComponent): Boolean;
  end;

  TBuscaCEP = class
  private
    FRESTClient: TRESTClient;
    FRESTRequest: TRESTRequest;
    FRESTResponse: TRESTResponse;
    FSSLHandler: TIdSSLIOHandlerSocketOpenSSL; // Usando TIdSSLIOHandlerSocket
    function ProcessarResposta: TJSONObject;
  public
    constructor Create;
    destructor Destroy; override;
    function Consultar(const CEP: string): TJSONObject;
    function IsValidCEP(const CEP: string): Boolean;
  end;

implementation

uses
  Vcl.StdCtrls, Vcl.Dialogs, Vcl.ExtCtrls;
{ TBuscaCEP }

constructor TBuscaCEP.Create;
begin

  FRESTClient := TRESTClient.Create(nil);
  FRESTClient.BaseURL := 'https://viacep.com.br/ws';


  FRESTRequest := TRESTRequest.Create(nil);
  FRESTRequest.Client := FRESTClient;
  FRESTRequest.Method := rmGET;
  FRESTRequest.Accept := 'application/json';


  FRESTResponse := TRESTResponse.Create(nil);
  FRESTRequest.Response := FRESTResponse;


  FSSLHandler := TIdSSLIOHandlerSocketOpenSSL.Create(nil);
  FSSLHandler.SSLOptions.SSLVersions := [sslvTLSv1_2];
end;

destructor TBuscaCEP.Destroy;
begin
  FreeAndNil(FRESTResponse);
  FreeAndNil(FRESTRequest);
  FreeAndNil(FRESTClient);
  FreeAndNil(FSSLHandler);
  inherited;
end;

function TBuscaCEP.Consultar(const CEP: string): TJSONObject;
begin
  if not IsValidCEP(CEP) then
    raise Exception.Create('CEP inválido.');

  try
    FRESTRequest.Resource := Format('%s/json/', [CEP]);
    FRESTRequest.Execute;


    if FRESTResponse.StatusCode <> 200 then
      raise Exception.Create(Format('Erro HTTP %d: %s', [FRESTResponse.StatusCode, FRESTResponse.StatusText]));

    Result := ProcessarResposta;
  except
    on E: Exception do
      raise Exception.Create('Erro ao consultar CEP: ' + E.Message);
  end;
end;

function TBuscaCEP.ProcessarResposta: TJSONObject;
begin
  Result := TJSONObject.ParseJSONValue(FRESTResponse.Content) as TJSONObject;
  if not Assigned(Result) then
    raise Exception.Create('Resposta inválida.');
end;

function TBuscaCEP.IsValidCEP(const CEP: string): Boolean;
begin
  Result := (Length(CEP) = 8) and (StrToIntDef(CEP, -1) <> -1);
end;

{ TValidadorCampos }

class function TValidadorCampos.ValidarCampos(ARoot: TComponent): Boolean;
var
  I: Integer;
  Campo: TComponent;
begin
  Result := True;

  for I := 0 to ARoot.ComponentCount - 1 do
  begin
    Campo := ARoot.Components[I];

    if (Campo is TEdit) and (Trim(TEdit(Campo).Text) = '') then
    begin
      ShowMessage(Format('O campo "%s" é obrigatório.', [Campo.Name]));
      TEdit(Campo).SetFocus;
      Result := False;
      Exit;
    end;
  end;


end;





end.

