unit ClientesCadastro;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, Buttons, StdCtrls, ORMUtils, ClientesORM;

const
  tipoPessoa: array[0..1] of string = ('F','J');

type
  TRetorno = (rtOk, rtCancel);

  TFClientesCadastro = class(TForm)
    lbClienteID: TLabel;
    edClienteID: TEdit;
    lbTipoPessoa: TLabel;
    cbTipoPessoa: TComboBox;
    lbCpfCnpj: TLabel;
    edCpfCnpj: TEdit;
    lbNome: TLabel;
    edNome: TEdit;
    lbCep: TLabel;
    edCep: TEdit;
    lbLogradouro: TLabel;
    edLogradouro: TEdit;
    lbNumero: TLabel;
    edNumero: TEdit;
    lbComplemento: TLabel;
    edComplemento: TEdit;
    lbReferencia: TLabel;
    edReferencia: TEdit;
    lbBairro: TLabel;
    edBairro: TEdit;
    lbCidade: TLabel;
    edCidade: TEdit;
    lbUf: TLabel;
    edUf: TEdit;
    lbCodigoIbge: TLabel;
    edCodigoIbge: TEdit;
    btnOk: TSpeedButton;
    btnCancelar: TSpeedButton;
    Panel1: TPanel;
    btBuscaCep: TSpeedButton;
    btFechar: TSpeedButton;
    procedure FormCreate(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure DoKeyUpPadrao(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edPrecoVendaKeyPress(Sender: TObject; var Key: Char);
    procedure DoKeyPressOnlyNumber(Sender: TObject; var Key: Char);
    procedure edCpfCnpjExit(Sender: TObject);
    procedure edCepEnter(Sender: TObject);
    procedure edCepExit(Sender: TObject);
    procedure edCpfCnpjEnter(Sender: TObject);
    procedure DoEnterPadrao(Sender: TObject);
    procedure DoExitPadrao(Sender: TObject);
    procedure btBuscaCepClick(Sender: TObject);
    procedure btFecharClick(Sender: TObject);
  private
    { Private declarations }
    procedure Gravar;
    procedure Cancelar;
    procedure FormataCpfCnpj;
    function ValidaCpfCnpj: Boolean;
    function ChecaCamposObrigatorio: Boolean;
    procedure ConfiguraObrigatorio;
  public
    { Public declarations }
    Acao: TAcao;
    Cliente: TCliente;
    Retorno: TRetorno;
    procedure CarregaCadastro(ClienteID: Integer; Acao: TAcao);
    procedure CarregaComponentes;
  end;

var
  FClientesCadastro: TFClientesCadastro;

  function AbreCadastro(ClienteID: Integer; Acao: TAcao; out cliente: TCliente): Boolean;

implementation

uses StrUtils, MyStrUtils, DocumentosUtils, CepUtils, Constantes;

{$R *.dfm}

function AbreCadastro(clienteID: Integer; acao: TAcao; out cliente: TCliente): Boolean;
var clientesCadastro: TFClientesCadastro;
begin
  Result := False;
  clientesCadastro := TFClientesCadastro.Create(nil);
  try
    clientesCadastro.Acao := acao;
    clientesCadastro.CarregaCadastro(clienteID, acao);
    clientesCadastro.CarregaComponentes;
    clientesCadastro.ShowModal;
    if clientesCadastro.Retorno = rtOk then
    begin
      cliente := clientesCadastro.Cliente;
      Result := True;
    end;
  finally
    clientesCadastro.Free;
  end;
end;

procedure TFClientesCadastro.ConfiguraObrigatorio;
begin
  cbTipoPessoa.Color := corCampoObrigatorio;
  edNome.Color := corCampoObrigatorio;
  edCpfCnpj.Color := corCampoObrigatorio;
end;

procedure TFClientesCadastro.FormCreate(Sender: TObject);
begin
  Retorno := rtCancel;
  ConfiguraObrigatorio;
end;

procedure TFClientesCadastro.Cancelar;
begin
  CarregaComponentes;
end;

procedure TFClientesCadastro.CarregaCadastro(ClienteID: Integer;
  Acao: TAcao);
begin
  Cliente := TCliente.Create(clienteID, acao)
end;

procedure TFClientesCadastro.CarregaComponentes;
begin
  edClienteID.Text := IntToStr(Cliente.ClienteID);
  cbTipoPessoa.ItemIndex := AnsiIndexStr(Cliente.TipoPessoa, tipoPessoa);
  edCpfCnpj.Text := Cliente.CpfCnpj;
  if (not IsEmpty(edCpfCnpj.Text)) then
    FormataCpfCnpj;
  edNome.Text := Cliente.Nome;
  edCep.Text := FormataCep(Cliente.Cep);
  edLogradouro.Text := Cliente.Logradouro;
  edNumero.Text := Cliente.Numero;
  edComplemento.Text := Cliente.Complemento;
  edReferencia.Text := Cliente.Referencia;
  edBairro.Text := Cliente.Bairro;
  edCidade.Text := Cliente.Cidade;
  edUf.Text := Cliente.Uf;
  edCodigoIbge.Text := Cliente.CodigoIbge;
end;

function TFClientesCadastro.ChecaCamposObrigatorio: Boolean;
begin
  Result := False;
  if (cbTipoPessoa.ItemIndex = -1) then
    raise exception.CreateFmt(exceptCampoNaoInformado,['Pessoa']);
  if (IsEmpty(edCpfCnpj.Text)) then
    raise exception.CreateFmt(exceptCampoNaoInformado,['CPF/CNPJ']);
  if not ValidaCpfCnpj then
    raise exception.create('O campo CPF/CNPJ é inválido!');
  if (IsEmpty(edNome.Text)) then
    raise exception.CreateFmt(exceptCampoNaoInformado,['Nome']);
  Result := True;
end;

procedure TFClientesCadastro.Gravar;
begin
  Cliente.TipoPessoa := tipoPessoa[cbTipoPessoa.ItemIndex];
  Cliente.CpfCnpj := SomenteNumeros(edCpfCnpj.Text);
  Cliente.Nome := edNome.Text;
  Cliente.Cep := SomenteNumeros(edCep.Text);
  Cliente.Logradouro := edLogradouro.Text;
  Cliente.Numero := edNumero.Text;
  Cliente.Complemento := edComplemento.Text;
  Cliente.Referencia := edReferencia.Text;
  Cliente.Bairro := edBairro.Text;
  Cliente.Cidade := edCidade.Text;
  Cliente.Uf := edUf.Text;
  Cliente.CodigoIbge := edCodigoIbge.Text;
  Cliente.Salvar;
end;

procedure TFClientesCadastro.btnOkClick(Sender: TObject);
begin
  if not ChecaCamposObrigatorio then
    Exit;
  Gravar;
  Retorno := rtOk;
end;

procedure TFClientesCadastro.btnCancelarClick(Sender: TObject);
begin
  Cancelar;
end;

procedure TFClientesCadastro.DoKeyUpPadrao(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = VK_RETURN) then
  begin
    Perform(CM_DIALOGKEY, VK_TAB, 0);
    Key := 0;
  end;
end;

procedure TFClientesCadastro.edPrecoVendaKeyPress(Sender: TObject;
  var Key: Char);
begin
  if not (Key in [#8, '0'..'9', '-', DecimalSeparator]) then
    Key := #0
  else if ((Key = DecimalSeparator) or (Key = '-')) and
          (Pos(Key, (Sender as TEdit).Text) > 0)
  then
    Key := #0
  else if (Key = '-') and ((Sender as TEdit).SelStart <> 0)
  then
    Key := #0;
end;

procedure TFClientesCadastro.DoKeyPressOnlyNumber(Sender: TObject;
  var Key: Char);
const
  CTRL_C = #3;
  CTRL_V = #22;
  BACK_SPACE = #8;
begin
  if not (Key in [CTRL_C, CTRL_V]) then
  begin
    if not (Key in [BACK_SPACE, '0'..'9']) then
      Key := #0;
  end;
end;

procedure TFClientesCadastro.edCpfCnpjEnter(Sender: TObject);
begin
  DoEnterPadrao(Sender);
  edCpfCnpj.Text := SomenteNumeros(edCpfCnpj.Text);
end;

function TFClientesCadastro.ValidaCpfCnpj: Boolean;
const
  tpFisica = 0;
var
  cpfCnpj: String;
begin
  Result := False;
  cpfCnpj := SomenteNumeros(edCpfCnpj.Text);
  if (cbTipoPessoa.ItemIndex = tpFisica) then
  begin
    if ValidaCpf(cpfCnpj) then
      Result := True;
  end
  else
  begin
    if ValidaCnpj(cpfCnpj) then
      Result := True;
  end;
end;

procedure TFClientesCadastro.FormataCpfCnpj;
const
  tpFisica = 0;
var
  cpfCnpj: String;
begin
  cpfCnpj := SomenteNumeros(edCpfCnpj.Text);
  if (not IsEmpty(cpfCnpj)) then
  begin
    if (cbTipoPessoa.ItemIndex = tpFisica)
    then edCpfCnpj.Text := FormataCpf(cpfCnpj)
    else edCpfCnpj.Text := FormataCnpj(cpfCnpj);
  end;    
end;

procedure TFClientesCadastro.edCpfCnpjExit(Sender: TObject);
begin
  DoExitPadrao(Sender);
  if (not IsEmpty(edCpfCnpj.Text)) then
  begin
    FormataCpfCnpj;
    if not ValidaCpfCnpj then
      raise exception.create('CPF/CNPJ informado é inválida');
  end;
end;

procedure TFClientesCadastro.edCepEnter(Sender: TObject);
begin
  DoEnterPadrao(Sender);
  edCep.Text := SomenteNumeros(edCep.Text);
end;

procedure TFClientesCadastro.edCepExit(Sender: TObject);
begin
  DoExitPadrao(Sender);
  edCep.Text := FormataCep(edCep.Text);
end;

procedure TFClientesCadastro.DoEnterPadrao(Sender: TObject);
begin
  if Sender is TComboBox then
    TComboBox(Sender).Font.Style := [fsBold];
  if Sender is TEdit then
    TEdit(Sender).Font.Style := [fsBold];
end;

procedure TFClientesCadastro.DoExitPadrao(Sender: TObject);
begin
  if Sender is TComboBox then
    TComboBox(Sender).Font.Style := [];
  if Sender is TEdit then
    TEdit(Sender).Font.Style := [];
end;

procedure TFClientesCadastro.btBuscaCepClick(Sender: TObject);
begin
  if (IsEmpty(edCep.Text)) then
    raise Exception.Create('Informe um CEP primeiro.');

  try
    with TEndereco.Create(edCep.Text) do
    begin
      edLogradouro.Text := Logradouro;
      edBairro.Text := Bairro;
      edCidade.Text := Cidade;
      edUf.Text := Uf;
      edCodigoIbge.Text := CodigoIbge;
    end;
  except
    on e: exception do
      raise exception.create(e.message)
  end;
end;

procedure TFClientesCadastro.btFecharClick(Sender: TObject);
begin
  Close;
end;

end.
