unit ProdutosCadastro;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, Buttons, StdCtrls, ORMUtils, ProdutosORM;

type
  TRetorno = (rtOk, rtCancel);

  TFProdutosCadastro = class(TForm)
    lbProdutoID: TLabel;
    edProdutoID: TEdit;
    lbDescricao: TLabel;
    edDescricao: TEdit;
    lbUnidade: TLabel;
    edUnidade: TEdit;
    lbPrecoVenda: TLabel;
    edPrecoVenda: TEdit;
    btnOk: TSpeedButton;
    btnCancelar: TSpeedButton;
    Panel1: TPanel;
    btFechar: TSpeedButton;
    procedure FormCreate(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure KeyUpPadrao(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edPrecoVendaKeyPress(Sender: TObject; var Key: Char);
    procedure edPrecoVendaExit(Sender: TObject);
    procedure btFecharClick(Sender: TObject);
  private
    { Private declarations }
    procedure Gravar;
    procedure Cancelar;
    function ChecaCamposObrigatorio: Boolean;
    procedure ConfiguraObrigatorio;
  public
    { Public declarations }
    Acao: TAcao;
    Retorno: TRetorno;
    Produto: TProduto;
    procedure CarregaCadastro(ProdutoID: Integer; Acao: TAcao);
    procedure CarregaComponentes;
  end;

var
  FProdutosCadastro: TFProdutosCadastro;

  function AbreCadastro(produtoID: Integer; acao: TAcao; out produto: TProduto): Boolean;

implementation

uses StrUtils, MyStrUtils, Constantes;

{$R *.dfm}

function AbreCadastro(produtoID: Integer; acao: TAcao; out produto: TProduto): Boolean;
var produtosCadastro: TFProdutosCadastro;
begin
  Result := False;
  produtosCadastro := TFProdutosCadastro.Create(nil);
  try
    produtosCadastro.Acao := acao;
    produtosCadastro.CarregaCadastro(produtoID, acao);
    produtosCadastro.CarregaComponentes;
    produtosCadastro.ShowModal;
    if (produtosCadastro.Retorno = rtOk) then
    begin
      produto := produtosCadastro.Produto;
      Result := True;
    end;      
  finally
    produtosCadastro.Free;
  end;          
end;

procedure TFProdutosCadastro.ConfiguraObrigatorio;
begin
  edDescricao.Color := corCampoObrigatorio;
end;

procedure TFProdutosCadastro.FormCreate(Sender: TObject);
begin
  Retorno := rtCancel;
  ConfiguraObrigatorio;
end;

procedure TFProdutosCadastro.Cancelar;
begin
  CarregaComponentes;
end;

procedure TFProdutosCadastro.CarregaCadastro(ProdutoID: Integer;
  Acao: TAcao);
begin
  Produto := TProduto.Create(produtoID, acao)
end;

procedure TFProdutosCadastro.CarregaComponentes;
begin
  edProdutoID.Text := IntToStr(Produto.ProdutoID);
  edDescricao.Text := Produto.Descricao;
  edUnidade.Text := Produto.Unidade;
  edPrecoVenda.Text := FormatFloat('#0.00', Produto.PrecoVenda);
end;

function TFProdutosCadastro.ChecaCamposObrigatorio: Boolean;
begin
  Result := False;
  if (IsEmpty(edDescricao.Text)) then
    raise exception.CreateFmt(exceptCampoNaoInformado,['Descrição do Produto']);
  Result := True;
end;

procedure TFProdutosCadastro.Gravar;
begin
  Produto.Descricao := edDescricao.Text;
  Produto.Unidade := edUnidade.Text;
  Produto.PrecoVenda := StrToFloat(edPrecoVenda.Text);
  Produto.Salvar;
end;

procedure TFProdutosCadastro.btnOkClick(Sender: TObject);
begin
  if not ChecaCamposObrigatorio then
    Exit;
  Gravar;
  Retorno := rtOk;
end;

procedure TFProdutosCadastro.btnCancelarClick(Sender: TObject);
begin
  Cancelar;
end;

procedure TFProdutosCadastro.KeyUpPadrao(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = VK_RETURN) then
  begin
    Perform(CM_DIALOGKEY, VK_TAB, 0);
    Key := 0;
  end;
end;

procedure TFProdutosCadastro.edPrecoVendaKeyPress(Sender: TObject;
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

procedure TFProdutosCadastro.edPrecoVendaExit(Sender: TObject);
var preco: Extended;
begin
  preco := StrToFloat(edPrecoVenda.Text);
  edPrecoVenda.Text := FormatFloat('#0.00', preco)
end;

procedure TFProdutosCadastro.btFecharClick(Sender: TObject);
begin
  Close;
end;

end.
