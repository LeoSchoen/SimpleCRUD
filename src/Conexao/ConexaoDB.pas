unit ConexaoDB;

interface

uses
  Forms, Dialogs, inifiles, SysUtils, DBXpress, DB, SqlExpr, UDMConexaoDB, ConfiguraConexao;

type
  TConexao = record
    servdor: string;
    banco: string;
    usuario: string;
    senha: string;
  end;

  function CarregaIni: Boolean;
  procedure AbreConexaoDB;
  function ConfiguraDB: Boolean;
  function SimpleCrudSQLConnection: TSQLConnection;

implementation

var Conexao: TConexao;
    conexaoFalhou: Boolean;

function CarregaIni: Boolean;
var configIni : TIniFile;
  caminhoConfigIni: string;
begin
  Result := False;
  caminhoConfigIni := ChangeFileExt(ExtractFilePath(Application.ExeName),'Config.ini');
  // Se o aquivo config nao existe, ou a conexão anterior falhou, abre a tela pra gerar o Config
  if (not FileExists(caminhoConfigIni)) or (conexaoFalhou) then
  begin
    conexaoFalhou := False;
    Result := ConfiguraConfigIni;
  end;
  // Carregando String de Conexão com Banco de Dados
  configIni := TIniFile.Create(caminhoConfigIni) ;
  try
    Conexao.servdor := configIni.ReadString('CONNECTION','Server','');
    Conexao.banco := configIni.ReadString('CONNECTION','Database','');
    Conexao.usuario := configIni.ReadString('CONNECTION','User_Name','');
    Conexao.senha := configIni.ReadString('CONNECTION','Password','');
  finally
    configIni.Free;
    Result := True;
  end;
end;

function ConfiguraDB: Boolean;
begin
  Result := False;
  if Assigned(DMConexaoDB.SQLConnection) then
  begin
    DMConexaoDB.SQLConnection.DriverName := 'Interbase';
    DMConexaoDB.SQLConnection.GetDriverFunc := 'getSQLDriverINTERBASE';
    DMConexaoDB.SQLConnection.LibraryName := 'dbexpint.dll';
    DMConexaoDB.SQLConnection.VendorLib := 'gds32.dll';
    DMConexaoDB.SQLConnection.LoginPrompt := False;
    DMConexaoDB.SQLConnection.Params.Values['DriverName'] := 'Interbase';
    DMConexaoDB.SQLConnection.Params.Values['SQLDialect'] := '3';
    DMConexaoDB.SQLConnection.Params.Values['DataBase'] := Format('%s:%s', [Conexao.servdor,Conexao.banco]);
    DMConexaoDB.SQLConnection.Params.Values['User_Name'] := Conexao.usuario;
    DMConexaoDB.SQLConnection.Params.Values['Password'] := Conexao.senha;
    DMConexaoDB.SQLConnection.Params.Values['RoleName'] := 'RoleName';
    DMConexaoDB.SQLConnection.Params.Values['SQLDialect'] := '3';
    DMConexaoDB.SQLConnection.Params.Values['BlobSize'] := '-3';
    DMConexaoDB.SQLConnection.Params.Values['CommitRetain'] := 'False';
    DMConexaoDB.SQLConnection.Params.Values['WaitOnLocks'] := 'True';
    DMConexaoDB.SQLConnection.Params.Values['Interbase TransIsolation'] := 'ReadCommited';
    DMConexaoDB.SQLConnection.Params.Values['Trim Char'] := 'False';
    try
      DMConexaoDB.SQLConnection.Open;
      Result := True;
    except
      conexaoFalhou := True;
      Result := False;
    end;
  end;
end;

procedure AbreConexaoDB;
var dbConfigurado: Boolean;
begin
  dbConfigurado := false;
  conexaoFalhou := false;
  repeat
    if CarregaIni then
      dbConfigurado := ConfiguraDB;
  until dbConfigurado;
end;

function SimpleCrudSQLConnection: TSQLConnection;
begin
  Result := DMConexaoDB.SQLConnection;
end;

end.
