unit ConfiguraConexao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, StdCtrls, ExtCtrls, IniFiles;

type
  TFConfiguraConexao = class(TForm)
    lbBanco: TLabel;
    lbUsuario: TLabel;
    lbSenha: TLabel;
    edBanco: TEdit;
    edUsuario: TEdit;
    edSenha: TEdit;
    Panel1: TPanel;
    btnOk: TSpeedButton;
    btnCancelar: TSpeedButton;
    btBanco: TSpeedButton;
    lbServidor: TLabel;
    edServidor: TEdit;
    procedure btBancoClick(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    retorno: Boolean;
  end;

var
  FConfiguraConexao: TFConfiguraConexao;

  function ConfiguraConfigIni: Boolean;

implementation


{$R *.dfm}

function ConfiguraConfigIni: Boolean;
begin
  with TFConfiguraConexao.Create(nil) do
  begin
    ShowModal;
    Result := retorno;
    Free;
  end;
end;

procedure TFConfiguraConexao.btBancoClick(Sender: TObject);
begin
  with TOpenDialog.Create(nil) do
  begin
    try
      Title := 'Selecione o Base de Dados';
      InitialDir := ChangeFileExt(ExtractFilePath(Application.ExeName),'Config.ini');
      if not Execute then
        Abort;
      edBanco.Text := FileName;
    finally
      Free;
    end;
  end;
end;

procedure TFConfiguraConexao.btnOkClick(Sender: TObject);

  function ValidaCampos: Boolean;
  begin
    Result := False;
    if edServidor.Text = '' then
    begin
      edBanco.SetFocus;
      ShowMessage('Servidor não informada.');
      Exit;
    end;
    if edBanco.Text = '' then
    begin
      edBanco.SetFocus;
      ShowMessage('Base de Dados não informada.');
      Exit;
    end;
    if edUsuario.Text = '' then
    begin
      edUsuario.SetFocus;
      ShowMessage('Nome de usuário não informado.');
      Exit;
    end;
    if edSenha.Text = '' then
    begin
      edSenha.SetFocus;
      ShowMessage('Senha não foi informada.');
      Exit;
    end;
    Result := True;
  end;

var caminhoConfigIni: string;
  configIni : TIniFile;
begin
  if not ValidaCampos then
    Exit;
  caminhoConfigIni := ChangeFileExt(ExtractFilePath(Application.ExeName),'Config.ini');
  configIni := TIniFile.Create(caminhoConfigIni) ;
  try
    configIni.WriteString('CONNECTION','Server', edServidor.Text);
    configIni.WriteString('CONNECTION','Database', edBanco.Text);
    configIni.WriteString('CONNECTION','User_Name', edUsuario.Text);
    configIni.WriteString('CONNECTION','Password', edSenha.Text);
  finally
    configIni.Free;
    retorno := True;
  end;
  Close;
end;

procedure TFConfiguraConexao.btnCancelarClick(Sender: TObject);
begin
  retorno := false;
  Close;
end;

end.
