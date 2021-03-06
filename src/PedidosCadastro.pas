unit PedidosCadastro;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, Buttons, StdCtrls, Grids, DBGrids, Mask, DB, SqlExpr,
  ConexaoDB, FMTBcd, DBClient, Provider, ORMUtils, PedidosORM, PedidosItensORM,
  ClientesORM, ProdutosORM;

const
  tipoOperacao: array[0..1] of string = ('S','E');

type
  TRetorno = (rtOk, rtCancel);

  TFPedidosCadastro = class(TForm)
    btnOk: TSpeedButton;
    btnCancelar: TSpeedButton;
    separator: TPanel;
    lbPedidoId: TLabel;
    lbReferencia: TLabel;
    lbNumeroPedido: TLabel;
    lbDataEmissao: TLabel;
    lbClienteId: TLabel;
    lbTipoOperacao: TLabel;
    lbValorTotal: TLabel;
    edPedidoId: TEdit;
    edReferencia: TEdit;
    edNumeroPedido: TEdit;
    edClienteID: TEdit;
    edValorTotal: TEdit;
    cbTipoOperacao: TComboBox;
    edClienteNome: TEdit;
    edBuscaRapidaCliente: TSpeedButton;
    edDataEmissao: TMaskEdit;
    sdsItensPedido: TSQLDataSet;
    dspItensPedido: TDataSetProvider;
    dsItensPedido: TDataSource;
    cdsItensPedido: TClientDataSet;
    GroupBox1: TGroupBox;
    gridItensPedido: TDBGrid;
    edProdutoID: TEdit;
    edProdutoDescricao: TEdit;
    lbProduto: TLabel;
    lbUnidade: TLabel;
    edUnidade: TEdit;
    lbQuantidade: TLabel;
    edQuantidade: TEdit;
    lbValorUnitario: TLabel;
    edValorUnitario: TEdit;
    btAdicionar: TSpeedButton;
    btExcluir: TSpeedButton;
    btBuscaRapidaProduto: TSpeedButton;
    sdsItensPedidoPEDIDO_ITEM_ID: TIntegerField;
    sdsItensPedidoPEDIDO_ID: TIntegerField;
    sdsItensPedidoPRODUTO_ID: TIntegerField;
    sdsItensPedidoDESCRICAO: TStringField;
    sdsItensPedidoUNIDADE: TStringField;
    sdsItensPedidoQUANTIDADE: TFMTBCDField;
    sdsItensPedidoVALOR_UNITARIO: TFMTBCDField;
    sdsItensPedidoTOTAL: TFMTBCDField;
    cdsItensPedidoPEDIDO_ITEM_ID: TIntegerField;
    cdsItensPedidoPEDIDO_ID: TIntegerField;
    cdsItensPedidoPRODUTO_ID: TIntegerField;
    cdsItensPedidoDESCRICAO: TStringField;
    cdsItensPedidoUNIDADE: TStringField;
    cdsItensPedidoQUANTIDADE: TFMTBCDField;
    cdsItensPedidoVALOR_UNITARIO: TFMTBCDField;
    cdsItensPedidoTOTAL: TFMTBCDField;
    btFechar: TSpeedButton;
    btEditar: TSpeedButton;
    procedure FormCreate(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure DoKeyUpPadrao(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edPrecoVendaKeyPress(Sender: TObject; var Key: Char);
    procedure DoKeyPressOnlyNumber(Sender: TObject; var Key: Char);
    procedure DoEnterPadrao(Sender: TObject);
    procedure DoExitPadrao(Sender: TObject);
    procedure edClienteIDExit(Sender: TObject);
    procedure edBuscaRapidaClienteClick(Sender: TObject);
    procedure btAdicionarClick(Sender: TObject);
    procedure btBuscaRapidaProdutoClick(Sender: TObject);
    procedure edProdutoIDExit(Sender: TObject);
    procedure edValorUnitarioExit(Sender: TObject);
    procedure btFecharClick(Sender: TObject);
    procedure btExcluirClick(Sender: TObject);
    procedure gridItensPedidoDblClick(Sender: TObject);
    procedure btEditarClick(Sender: TObject);
    procedure DoKeyPressFloat(Sender: TObject; var Key: Char);
    procedure cbTipoOperacaoExit(Sender: TObject);
  private
    { Private declarations }
    recnoItemEditado: Integer;
    procedure Gravar;
    procedure Cancelar;
    function ChecaCamposObrigatorio: Boolean;
    procedure ValidaCliente(clienteID: Integer);
    function ValidaProduto(produtoID: Integer): Boolean;
    procedure LimparPainelInclusaoItens;
    procedure AtualizaValorTotalDoPedido;
    procedure AdicionarItemNaGrade;
    procedure ExcluirItemSelecionado;
    procedure EditarItemSelecionado;
    procedure ConfiguraObrigatorio;
    procedure ProximoNumeroPedido(tipoOperacao: string);
  public
    { Public declarations }
    Acao: TAcao;
    Pedido: TPedido;
    Retorno: TRetorno;
    procedure CarregaCadastro(PedidoID: Integer; Acao: TAcao);
    procedure GarregaItens;
    procedure CarregaComponentes;
    procedure CancelaExclusaoDosItens;
  end;

var
  FPedidosCadastro: TFPedidosCadastro;

  function AbreCadastro(PedidoID: Integer; Acao: TAcao; out pedido: TPedido): Boolean;

implementation

uses StrUtils, MyStrUtils, MyDateUtils, ConversionUtils, BuscaRapida, Constantes;

{$R *.dfm}

function AbreCadastro(pedidoID: Integer; acao: TAcao; out pedido: TPedido): Boolean;
var pedidosCadastro: TFPedidosCadastro;
begin
  Result := False;
  pedidosCadastro := TFPedidosCadastro.Create(nil);
  try
    pedidosCadastro.Acao := acao;
    pedidosCadastro.CarregaCadastro(pedidoID, acao);
    pedidosCadastro.CarregaComponentes;
    pedidosCadastro.ShowModal;
    if pedidosCadastro.Retorno = rtOk then
    begin
      pedido := pedidosCadastro.Pedido;
      Result := True;
    end;
  finally
    pedidosCadastro.Free;
  end;
end;

procedure TFPedidosCadastro.GarregaItens;

  procedure ConfiguraColunasNumericas;
  const
    colunas: array[0..2] of string = ('QUANTIDADE', 'VALOR_UNITARIO', 'TOTAL');
  var i: byte;
  begin
    for i := 0 to 2 do
      TNumericField(cdsItensPedido.FieldByName(colunas[i])).DisplayFormat := ',0.00;-,0.00';
  end;

begin
  cdsItensPedido.Close;
  cdsItensPedido.Params.ParamByName('PEDIDO_ID').AsInteger := Pedido.PedidoID;
  cdsItensPedido.Open;
  ConfiguraColunasNumericas;
end;

procedure TFPedidosCadastro.ValidaCliente(clienteID: Integer);
var cliente: TCliente;
begin
  if (clienteID = 0) then
    Exit;
  cliente := TCliente.Create(clienteID, paVisualizacao);
  try
    if (cliente.ClienteID > 0) then
      edClienteNome.Text := cliente.Nome
    else
    begin
      edClienteNome.Text := clienteNaoEncontrado;
      edClienteID.SetFocus;
    end;
  finally
    FreeAndNil(cliente);
  end;
end;

procedure TFPedidosCadastro.AtualizaValorTotalDoPedido;
var recno: word;
  valorTotal: Extended;
begin
  valorTotal := 0;
  recno := cdsItensPedido.RecNo;
  try
    cdsItensPedido.DisableControls;
    cdsItensPedido.First;
    while not cdsItensPedido.eof do
    begin
      valorTotal := valorTotal + cdsItensPedido.FieldByName('TOTAL').AsFloat;
      cdsItensPedido.Next;
    end;
    edValorTotal.Text := FormatFloat('#0.00', valorTotal);
  finally
    cdsItensPedido.RecNo := recno;
    cdsItensPedido.EnableControls;
  end;
end;

procedure TFPedidosCadastro.CarregaComponentes;
begin
  edPedidoID.Text := IntToStr(Pedido.PedidoID);
  cbTipoOperacao.ItemIndex := AnsiIndexStr(Pedido.tipoOperacao, tipoOperacao);
  edNumeroPedido.Text := Pedido.NumeroPedido;
  if (Pedido.DataEmissao = 0)
    then edDataEmissao.Text := FormatDateTime('dd/mm/yyyy', now)
    else edDataEmissao.Text := FormatDateTime('dd/mm/yyyy', Pedido.DataEmissao);
  edReferencia.Text := Pedido.Referencia;
  edClienteID.Text := IntToStr(Pedido.ClienteID);
  ValidaCliente(Pedido.ClienteID);
  edValorTotal.Text := FormatFloat('#0.00', Pedido.ValorTotal);
  GarregaItens;
  AtualizaValorTotalDoPedido;
end;

procedure TFPedidosCadastro.CarregaCadastro(PedidoID: Integer;
  Acao: TAcao);
begin
  Pedido := TPedido.Create(pedidoID, acao)
end;

function TFPedidosCadastro.ChecaCamposObrigatorio: Boolean;
begin
  Result := False;
  if (cbTipoOperacao.ItemIndex = -1) then
    raise exception.CreateFmt(exceptCampoNaoInformado,['Tipo de Opera��o']);
  if (IsEmpty(edNumeroPedido.Text)) then
    raise exception.CreateFmt(exceptCampoNaoInformado,['N�mero do Pedido']);
  if (IsEmpty(edDataEmissao.Text) or (edDataEmissao.Text = EmptyStrDate)) then
    raise exception.CreateFmt(exceptCampoNaoInformado,['Data de Emiss�o']);
  Result := True;
end;

procedure TFPedidosCadastro.Gravar;

  procedure GravarItens;
  var itemPedido: TPedidoItem;
    i : Word;
  begin
    i := 0;
    if (not assigned(Pedido.Itens)) then
      Pedido.Itens := TListaItens.Create;
    cdsItensPedido.First;
    while not cdsItensPedido.Eof do
    begin
      if (Pedido.Itens.Count <= i) then
        Pedido.Itens.Add(TPedidoItem.Create(cdsItensPedido.FieldByName('PEDIDO_ITEM_ID').AsInteger, paEdicao));

      Pedido.Itens[i].PedidoID := cdsItensPedido.FieldByName('PEDIDO_ID').AsInteger;
      Pedido.Itens[i].ProdutoID := cdsItensPedido.FieldByName('PRODUTO_ID').AsInteger;
      Pedido.Itens[i].Unidade := cdsItensPedido.FieldByName('UNIDADE').AsString;
      Pedido.Itens[i].Quantidade := cdsItensPedido.FieldByName('QUANTIDADE').AsFloat;
      Pedido.Itens[i].ValorUnitario := cdsItensPedido.FieldByName('VALOR_UNITARIO').AsFloat;
      Pedido.Itens[i].Total := cdsItensPedido.FieldByName('TOTAL').AsFloat;
      Inc(i);
      cdsItensPedido.Next;
    end;
  end;

var recno: Word;
begin
  try
    cdsItensPedido.DisableControls;
    recno := cdsItensPedido.RecNo;

    Pedido.TipoOperacao := tipoOperacao[cbTipoOperacao.ItemIndex];
    Pedido.NumeroPedido := edNumeroPedido.Text;
    Pedido.DataEmissao := StrToDate(edDataEmissao.Text);
    Pedido.Referencia := edReferencia.Text;
    Pedido.ClienteId := AsInteger(edClienteId.Text);
    Pedido.ValorTotal := AsFloat(edValorTotal.Text);
    GravarItens;
    Pedido.Salvar;
  finally
    GarregaItens;
    cdsItensPedido.RecNo := recno;
    cdsItensPedido.EnableControls;
    FreeAndNil(Pedido.Itens);
  end;
end;

procedure TFPedidosCadastro.CancelaExclusaoDosItens;
begin
  FreeAndNil(Pedido.ItensExcluidos);
end;

procedure TFPedidosCadastro.Cancelar;
begin
  CarregaComponentes;
  CancelaExclusaoDosItens;
end;

procedure TFPedidosCadastro.ConfiguraObrigatorio;
begin
  cbTipoOperacao.Color := corCampoObrigatorio;
  edClienteID.Color := corCampoObrigatorio;
  edNumeroPedido.Color := corCampoObrigatorio;
  edDataEmissao.Color := corCampoObrigatorio;
end;

procedure TFPedidosCadastro.FormCreate(Sender: TObject);
begin
  Retorno := rtCancel;
  recnoItemEditado := -1;
  ConfiguraObrigatorio;
end;

procedure TFPedidosCadastro.btnOkClick(Sender: TObject);
begin
  if not ChecaCamposObrigatorio then
    Exit;
  Gravar;
  Retorno := rtOk;
end;

procedure TFPedidosCadastro.btnCancelarClick(Sender: TObject);
begin
  Cancelar;
end;

procedure TFPedidosCadastro.btFecharClick(Sender: TObject);
begin
  Close;
end;

procedure TFPedidosCadastro.DoKeyUpPadrao(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = VK_RETURN) then
  begin
    Perform(CM_DIALOGKEY, VK_TAB, 0);
    Key := 0;
  end;
end;

procedure TFPedidosCadastro.edPrecoVendaKeyPress(Sender: TObject;
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

procedure TFPedidosCadastro.DoKeyPressOnlyNumber(Sender: TObject;
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

procedure TFPedidosCadastro.DoKeyPressFloat(Sender: TObject;
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

procedure TFPedidosCadastro.DoEnterPadrao(Sender: TObject);
begin
  if Sender is TComboBox then
    TComboBox(Sender).Font.Style := [fsBold];
  if Sender is TEdit then
    TEdit(Sender).Font.Style := [fsBold];
end;

procedure TFPedidosCadastro.DoExitPadrao(Sender: TObject);
begin
  if Sender is TComboBox then
    TComboBox(Sender).Font.Style := [];
  if Sender is TEdit then
    TEdit(Sender).Font.Style := [];
end;

procedure TFPedidosCadastro.edClienteIDExit(Sender: TObject);
begin
  DoExitPadrao(Sender);
  ValidaCliente(AsInteger(edClienteID.Text));
end;

procedure TFPedidosCadastro.edBuscaRapidaClienteClick(Sender: TObject);
var buscaRapida: TBuscaRapida;
begin
  buscaRapida := TBuscaRapida.Create;
  try
    buscaRapida.tabela := 'CLIENTES';
    buscaRapida.ColunaCodigoNome := 'CLIENTE_ID';
    buscaRapida.colunaCodigoTitulo := 'C�digo';
    buscaRapida.colunaDescricaoNome := 'NOME';
    buscaRapida.colunaDescricaoTitulo := 'Nome';
    if buscaRapida.Execute then
    begin
      edClienteID.Text := IntToStr(buscaRapida.ValorID);
      edClienteNome.Text := buscaRapida.ValorDescricao;
    end;
  finally
    FreeAndNil(buscaRapida);
  end;
end;

function TFPedidosCadastro.ValidaProduto(produtoID: Integer): Boolean;
var produto: TProduto;
begin
  Result := False;
  produto := TProduto.Create(produtoID, paVisualizacao);
  try
    if (produto.ProdutoID > 0) then
    begin
      edProdutoDescricao.Text := produto.Descricao;
      edUnidade.Text := produto.Unidade;
      edValorUnitario.Text := FormatFloat('#0.00', produto.PrecoVenda);
      Result := True;
    end
    else
    begin
      edProdutoDescricao.Text := ProdutoNaoEncontrado;
      edProdutoID.SetFocus;
    end;
  finally
    FreeAndNil(produto);
  end;
end;

procedure TFPedidosCadastro.btBuscaRapidaProdutoClick(Sender: TObject);
var buscaRapida: TBuscaRapida;
begin
  buscaRapida := TBuscaRapida.Create;
  try
    buscaRapida.tabela := 'PRODUTOS';
    buscaRapida.ColunaCodigoNome := 'PRODUTO_ID';
    buscaRapida.colunaCodigoTitulo := 'C�digo';
    buscaRapida.colunaDescricaoNome := 'DESCRICAO';
    buscaRapida.colunaDescricaoTitulo := 'Descri��o';
    if buscaRapida.Execute then
    begin
      edProdutoID.Text := IntToStr(buscaRapida.ValorID);
      edProdutoDescricao.Text := buscaRapida.ValorDescricao;
      edProdutoID.SetFocus;
    end;
  finally
    FreeAndNil(buscaRapida);
  end;
end;

procedure TFPedidosCadastro.edProdutoIDExit(Sender: TObject);
begin
  if (AsInteger(edProdutoID.Text) <> 0) then
  begin
    DoExitPadrao(Sender);
    ValidaProduto(AsInteger(edProdutoID.Text));
  end;    
end;

procedure TFPedidosCadastro.LimparPainelInclusaoItens;
begin
  edProdutoID.Text := '';
  edProdutoDescricao.Text := '';
  edUnidade.Text := '';
  edQuantidade.Text := '';
  edValorUnitario.Text := '';
  edProdutoID.SetFocus;
end;

procedure TFPedidosCadastro.AdicionarItemNaGrade;
var quantidade, valorUnitario, valorTotal: Extended;
begin
  // Formatando Valores
  quantidade := AsFloat(edQuantidade.Text);
  valorUnitario := AsFloat(edValorUnitario.Text);
  valorTotal := valorUnitario*quantidade;
  try
    if (recnoItemEditado = -1) then
    begin
      cdsItensPedido.Append;
      cdsItensPedido.FieldByName('PEDIDO_ITEM_ID').AsInteger := 0;
      cdsItensPedido.FieldByName('PEDIDO_ID').AsInteger := Pedido.PedidoID;
    end
    else
    begin
      // Colocando o foco no item alterado
      cdsItensPedido.RecNo := recnoItemEditado;
      cdsItensPedido.Edit;
    end;
    cdsItensPedido.FieldByName('PRODUTO_ID').AsInteger := AsInteger(edProdutoID.Text);
    cdsItensPedido.FieldByName('DESCRICAO').AsString := edProdutoDescricao.Text;
    cdsItensPedido.FieldByName('UNIDADE').AsString := edUnidade.Text;
    cdsItensPedido.FieldByName('QUANTIDADE').AsFloat := quantidade;
    cdsItensPedido.FieldByName('VALOR_UNITARIO').AsFloat := valorUnitario;
    cdsItensPedido.FieldByName('TOTAL').AsFloat := valorTotal;
    cdsItensPedido.Post;    
    AtualizaValorTotalDoPedido;
  finally
    recnoItemEditado := -1;
    LimparPainelInclusaoItens;
  end;
end;

procedure TFPedidosCadastro.ExcluirItemSelecionado;
begin
  if (cdsItensPedido.FieldByName('PEDIDO_ITEM_ID').AsInteger <> 0) then
  begin
    if not (Assigned(Pedido.ItensExcluidos)) then
       Pedido.ItensExcluidos := TListaItens.Create;
    Pedido.ItensExcluidos.Add(TPedidoItem.Create(cdsItensPedido.FieldByName('PEDIDO_ITEM_ID').AsInteger, paEdicao));
  end;
  cdsItensPedido.Delete;
  AtualizaValorTotalDoPedido;
  LimparPainelInclusaoItens;
  recnoItemEditado := -1;
end;

procedure TFPedidosCadastro.EditarItemSelecionado;
begin
  recnoItemEditado := cdsItensPedido.RecNo;
  edProdutoID.Text := cdsItensPedido.FieldByName('PRODUTO_ID').AsString;
  edProdutoDescricao.Text := cdsItensPedido.FieldByName('DESCRICAO').AsString;
  edUnidade.Text := cdsItensPedido.FieldByName('UNIDADE').AsString;
  edQuantidade.Text := FormatFloat('#0.00', cdsItensPedido.FieldByName('QUANTIDADE').AsFloat);
  edValorUnitario.Text := FormatFloat('#0.00', cdsItensPedido.FieldByName('VALOR_UNITARIO').AsFloat);
end;

procedure TFPedidosCadastro.btAdicionarClick(Sender: TObject);
begin
  AdicionarItemNaGrade;
end;

procedure TFPedidosCadastro.btExcluirClick(Sender: TObject);
begin
  ExcluirItemSelecionado;
end;

procedure TFPedidosCadastro.edValorUnitarioExit(Sender: TObject);
begin
  DoExitPadrao(Sender);
  if (AsInteger(edProdutoID.Text) = 0) then
    exit;
  if (IsEmpty(edProdutoDescricao.Text) or (edProdutoDescricao.Text = produtoNaoEncontrado)) then
    exit;
  if (IsEmpty(edUnidade.Text)) then
    exit;
  if (AsFloat(edQuantidade.Text) = 0) then
    exit;
  if (AsFloat(edValorUnitario.Text) = 0) then
    exit;
  AdicionarItemNaGrade;
end;

procedure TFPedidosCadastro.gridItensPedidoDblClick(Sender: TObject);
begin
  EditarItemSelecionado;
end;

procedure TFPedidosCadastro.btEditarClick(Sender: TObject);
begin
  EditarItemSelecionado;
end;

procedure TFPedidosCadastro.ProximoNumeroPedido(tipoOperacao: string);
begin
  with TSQLQuery.Create(nil) do
  begin
    SQLConnection := SimpleCrudSQLConnection;
    try
      SQL.Clear;
      SQL.Add('SELECT CAST(COALESCE(MAX(PEDIDOS.NUMERO_PEDIDO),''0'') AS INTEGER) AS NUMERO_PEDIDO');
      SQL.Add('FROM PEDIDOS');
      SQL.Add('WHERE PEDIDOS.TIPO_OPERACAO = :TIPO_OPERACAO ');
      ParamByName('TIPO_OPERACAO').AsString := tipoOperacao;
      Open;
      if (not eof) then
        edNumeroPedido.Text := StrZero(FieldByName('NUMERO_PEDIDO').AsInteger + 1, 8)
      else
        edClienteNome.Text := StrZero(1, 8)
    finally
      Free;
    end;
  end;
end;

procedure TFPedidosCadastro.cbTipoOperacaoExit(Sender: TObject);
begin
  DoExitPadrao(Sender);
  if pedido.PedidoID = 0 then
  begin
    if cbTipoOperacao.ItemIndex > -1 then
    begin
      if IsEmpty(edNumeroPedido.Text) then
        ProximoNumeroPedido(cbTipoOperacao.Text[1]);
    end;
  end;    
end;

end.
