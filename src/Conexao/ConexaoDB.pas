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
  procedure ConfiguraDB;
  function SimpleCrudSQLConnection: TSQLConnection;

implementation

var Conexao: TConexao;

function CarregaIni: Boolean;
var configIni : TIniFile;
  caminhoConfigIni: string;
begin
  Result := False;
  caminhoConfigIni := ChangeFileExt(ExtractFilePath(Application.ExeName),'Config.ini');
  if FileExists(caminhoConfigIni) then
  begin
    configIni := TIniFile.Create(caminhoConfigIni) ;
    try
      Conexao.banco := configIni.ReadString('CONNECTION','Database','');
      Conexao.usuario := configIni.ReadString('CONNECTION','User_Name','');
      Conexao.senha := configIni.ReadString('CONNECTION','Password','');
    finally
      configIni.Free;
      Result := True;
    end;
  end
  else
  begin
    Result := not ConfiguraConfigIni;
  end;
end;

procedure ConfiguraDB;
begin
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
    DMConexaoDB.SQLConnection.Open;
  end;
end;

procedure AbreConexaoDB;
var dbConfigurado: Boolean;
begin
  dbConfigurado := false;
  repeat
    if CarregaIni then
    begin
      ConfiguraDB;
      dbConfigurado := True;
    end;
  until dbConfigurado;
end;

function SimpleCrudSQLConnection: TSQLConnection;
begin
  Result := DMConexaoDB.SQLConnection;
end;

end.
