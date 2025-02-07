unit Cadastro.Model.Conexao;

interface

uses
  Cadastro.Model.Conexao.Interfaces, Data.DB, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Stan.Param,
  FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt, FireDAC.VCLUI.Wait,
  FireDAC.Comp.UI, FireDAC.Comp.DataSet, FireDAC.Comp.Client, FireDAC.Stan.ExprFuncs, FireDAC.Phys.SQLiteDef,
  FireDAC.Phys.SQLite, System.IniFiles, System.IOUtils, vcl.dialogs, system.SysUtils;

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
      function GetDatabasePath: string;

    end;
implementation

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

function TModelConexao.GetDatabasePath: string;
begin
  Result := FParamsDataBase;
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
var
  Ini: TIniFile;
  ConfigFile, DBPath: string;
begin
  ConfigFile := ExtractFilePath(ParamStr(0)) + 'Config.ini';

  if not FileExists(ConfigFile) then
  begin

    Ini := TIniFile.Create(ConfigFile);
    try
      DBPath := '';


      with TOpenDialog.Create(nil) do
      try
        Filter := 'SQLite Database|*.db';
        Title := 'Selecione o banco de dados';
        if Execute then
          DBPath := FileName;
      finally
        Free;
      end;


      if DBPath = '' then
        raise Exception.Create('Nenhum banco de dados foi selecionado!');


      Ini.WriteString('DATABASE', 'Driver', 'SQLite');
      Ini.WriteString('DATABASE', 'Database', DBPath);
      Ini.WriteString('DATABASE', 'User', '');
      Ini.WriteString('DATABASE', 'Password', '');
    finally
      Ini.Free;
    end;
  end;

  Ini := TIniFile.Create(ConfigFile);
  try
    FDriverName := Ini.ReadString('DATABASE', 'Driver', 'SQLite');
    FParamsDataBase := Ini.ReadString('DATABASE', 'Database', '');
    FParamsUserName := Ini.ReadString('DATABASE', 'User', '');
    FParamsPassword := Ini.ReadString('DATABASE', 'Password', '');
  finally
    Ini.Free;
  end;

  if FParamsDataBase = '' then
    raise Exception.Create('O caminho do banco de dados não foi definido no INI!');

  FConexao.DriverName := FDriverName;
  FConexao.Params.Clear;
  FConexao.Params.Add('Database=' + FParamsDataBase);

  if FParamsUserName <> '' then
    FConexao.Params.Add('User_Name=' + FParamsUserName);

  if FParamsPassword <> '' then
    FConexao.Params.Add('Password=' + FParamsPassword);

  if FDriverName <> '' then
    FConexao.Params.Add('DriverID=' + FDriverName);
end;


function TModelConexao.ParamsUserName(Value: string): iConexaoParametros;
begin
  Result := Self;
  FParamsUserName := Value;
end;

end.
