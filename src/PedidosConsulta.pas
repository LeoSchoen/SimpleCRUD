unit PedidosConsulta;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, IBDatabase, DB, DBClient, Menus, DBXpress, FMTBcd, SqlExpr, ConsultaSql,
  Provider, Grids, DBGrids, UDMConexaoDB, Buttons, ExtCtrls, StdCtrls, Mask,
  PedidosCadastro, ORMUtils, PedidosORM, ConexaoDB;

type
  TFPedidosConsulta = class(TForm)
    dsPedidos: TDataSource;
    dspPedidos: TDataSetProvider;
    sdsPedidos: TSQLDataSet;
    gridPedidos: TDBGrid;
    cdsPedidos: TClientDataSet;
    Panel1: TPanel;
    btAdicionar: TSpeedButton;
    btExcluir: TSpeedButton;
    btRefresh: TSpeedButton;
    btEditar: TSpeedButton;
    pnlDivisor: TPanel;
    grbFiltro: TGroupBox;
    lbCliente: TLabel;
    edClienteNome: TEdit;
    btnFiltrar: TButton;
    sdsPedidosPEDIDO_ID: TIntegerField;
    sdsPedidosTIPO_OPERACAO: TStringField;
    sdsPedidosREFERENCIA: TStringField;
    sdsPedidosNUMERO_PEDIDO: TStringField;
    sdsPedidosDATA_EMISSAO: TSQLTimeStampField;
    sdsPedidosCLIENTE_ID: TIntegerField;
    sdsPedidosCLIENTE_NOME: TStringField;
    sdsPedidosVALOR_TOTAL: TFloatField;
    cdsPedidosPEDIDO_ID: TIntegerField;
    cdsPedidosTIPO_OPERACAO: TStringField;
    cdsPedidosREFERENCIA: TStringField;
    cdsPedidosNUMERO_PEDIDO: TStringField;
    cdsPedidosDATA_EMISSAO: TSQLTimeStampField;
    cdsPedidosCLIENTE_ID: TIntegerField;
    cdsPedidosCLIENTE_NOME: TStringField;
    cdsPedidosVALOR_TOTAL: TFloatField;
    cbTipoOperacao: TComboBox;
    lbTipoOperacao: TLabel;
    edEmissaoInicial: TMaskEdit;
    lbEmissaoInicial: TLabel;
    lbEmissaoFinal: TLabel;
    edEmissaoFinal: TMaskEdit;
    edClienteID: TEdit;
    btBuscaCep: TSpeedButton;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnFiltrarClick(Sender: TObject);
    procedure btRefreshClick(Sender: TObject);
    procedure edClienteIDKeyPress(Sender: TObject; var Key: Char);
    procedure DateKeyPress(Sender: TObject; var Key: Char);
    procedure KeyUpPadrao(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btEditarClick(Sender: TObject);
    procedure btAdicionarClick(Sender: TObject);
    procedure btExcluirClick(Sender: TObject);
    procedure btBuscaCepClick(Sender: TObject);
    procedure edClienteIDExit(Sender: TObject);
    procedure gridPedidosDblClick(Sender: TObject);
  private
    { Private declarations }
    FiltroSql: TLayoutQuery;
    procedure CriaSqlQuery;
    procedure CarregaSql;
    procedure AplicaFiltro;
    procedure AtualizaLinhaGrid(pedido: TPedido; acao: TAcao);
    procedure ValidaCliente(clienteID: Integer);
  public
    { Public declarations }
  end;

var
  FPedidosConsulta: TFPedidosConsulta;

implementation

uses
  MyStrUtils, MyDateUtils, Constantes, BuscaRapida;

{$R *.dfm}

procedure TFPedidosConsulta.FormCreate(Sender: TObject);

  procedure MontaFiltroPadrao;
  const
    tpTodos = 0;
  begin
    cbTipoOperacao.ItemIndex := tpTodos;
    edEmissaoInicial.Text := MaskDate(PrimeiroDiaMes(Now));
    edEmissaoFinal.Text := MaskDate(UltimoDiaMes(Now));
  end;

begin
  CriaSqlQuery;
  MontaFiltroPadrao;
  AplicaFiltro;
  CarregaSql;
end;

procedure TFPedidosConsulta.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Free;
end;

procedure TFPedidosConsulta.btnFiltrarClick(Sender: TObject);
begin
  AplicaFiltro;
  CarregaSql;
end;

procedure TFPedidosConsulta.CriaSqlQuery;
begin
  FiltroSql := TLayoutQuery.Create;
  FiltroSql.Query :=
      'SELECT PEDIDO.PEDIDO_ID, ' +
             'CASE PEDIDO.TIPO_OPERACAO ' +
               'WHEN ''E'' THEN ''Entrada'' ' +
               'WHEN ''S'' THEN ''Saída'' ' +
             'END TIPO_OPERACAO, ' +
             'PEDIDO.REFERENCIA, ' +
             'PEDIDO.NUMERO_PEDIDO, ' +
             'PEDIDO.DATA_EMISSAO, ' +
             'PEDIDO.CLIENTE_ID, ' +
             'CLIENTE.NOME CLIENTE_NOME, ' +
             'PEDIDO.VALOR_TOTAL ' +
      'FROM PEDIDOS PEDIDO ' +
      'LEFT JOIN CLIENTES CLIENTE ' +
        'ON CLIENTE.CLIENTE_ID = PEDIDO.CLIENTE_ID';
  FiltroSql.OrderBy := 'PEDIDO.DATA_EMISSAO, PEDIDO.NUMERO_PEDIDO';
end;

procedure TFPedidosConsulta.CarregaSql;
begin
  cdsPedidos.Close;
  sdsPedidos.CommandText := FiltroSql.SqlQuery;
  cdsPedidos.Open;
  TNumericField(cdsPedidos.FieldByName('VALOR_TOTAL')).DisplayFormat := ',0.00;-,0.00';
end;

procedure TFPedidosConsulta.AplicaFiltro;
const
  tipoOperacao : array[1..2] of string = ('E','S');
  dataVazia = '  /  /    ';
var sqlFiltro: string;
begin
  sqlFiltro := '';

  // Filtro por Tipo de Operacao
  if (cbTipoOperacao.ItemIndex > 0) then
    sqlFiltro := sqlFiltro + format(' AND PEDIDO.TIPO_OPERACAO = %s',
        [QuotedStr(tipoOperacao[cbTipoOperacao.ItemIndex])]);

  // Filtro por Periodo de Emissao
  if ((edEmissaoInicial.Text <> dataVazia) and (edEmissaoFinal.Text = dataVazia)) then
    sqlFiltro := sqlFiltro + format(' AND PEDIDO.DATA_EMISSAO > %s', [QuotedStr(AsStrDate(edEmissaoInicial.Text))])
  else
  if ((edEmissaoInicial.Text <> dataVazia) and (edEmissaoFinal.Text <> dataVazia)) then
    sqlFiltro := sqlFiltro + format(' AND PEDIDO.DATA_EMISSAO BETWEEN %s AND %s',
      [QuotedStr(AsStrDate(edEmissaoInicial.Text)), QuotedStr(AsStrDate(edEmissaoFinal.Text))]);

  // Filtro por Cliente
  if (edClienteID.Text <> '0') then
    sqlFiltro := sqlFiltro + format(' AND PEDIDO.CLIENTE_ID = %s)', [QuotedStr(edClienteID.Text)]);

  // Setando Filtro
  FiltroSql.Conditions := Copy(sqlFiltro, 6, Length(sqlFiltro));
end;

procedure TFPedidosConsulta.btRefreshClick(Sender: TObject);
begin
  cdsPedidos.Close;
  cdsPedidos.Open;
end;

procedure TFPedidosConsulta.AtualizaLinhaGrid(pedido: TPedido;
  acao: TAcao);
begin
  if (acao = paInclusao) then
  begin
    cdsPedidos.Append;
    cdsPedidos.FieldByName('PEDIDO_ID').AsInteger := Pedido.PedidoID;
  end
  else
    cdsPedidos.Edit;
  cdsPedidos.FieldByName('TIPO_OPERACAO').AsString := iif(Pedido.TipoOperacao = 'S', 'Saída', 'Entrada');
  cdsPedidos.FieldByName('NUMERO_PEDIDO').AsString := Pedido.NumeroPedido;
  cdsPedidos.FieldByName('DATA_EMISSAO').AsDateTime := Pedido.DataEmissao;
  cdsPedidos.FieldByName('REFERENCIA').AsString := Pedido.Referencia;
  cdsPedidos.FieldByName('CLIENTE_ID').AsInteger := Pedido.ClienteID;
  cdsPedidos.FieldByName('VALOR_TOTAL').AsFloat := Pedido.ValorTotal;
end;

procedure TFPedidosConsulta.btEditarClick(Sender: TObject);
var pedido: TPedido;
begin
  if PedidosCadastro.AbreCadastro(cdsPedidosPEDIDO_ID.Value, paEdicao, pedido) then
    AtualizaLinhaGrid(pedido, paEdicao);
end;

procedure TFPedidosConsulta.btAdicionarClick(Sender: TObject);
var pedido: TPedido;
begin
  if PedidosCadastro.AbreCadastro(0, paInclusao, pedido) then
    AtualizaLinhaGrid(pedido, paInclusao);
end;

procedure TFPedidosConsulta.btExcluirClick(Sender: TObject);
var pedido : TPedido;
begin
  if Application.MessageBox(mensagemConfirmacaoDeExclusao,
    'Application.Title', MB_YESNO) = IDYES then
  begin
    pedido := TPedido.Create(cdsPedidosPEDIDO_ID.Value);
    if pedido.Excluir then
      cdsPedidos.Delete
    else
      raise Exception.Create('Não foi possível excluir o registro');
  end;
end;

procedure TFPedidosConsulta.edClienteIDKeyPress(Sender: TObject;
  var Key: Char);
begin
  if not (Key in [#8, '0'..'9']) then
  begin
    Key := #0;
  end;
end;

procedure TFPedidosConsulta.DateKeyPress(Sender: TObject;
  var Key: Char);
begin
  if (Key = #32) then
    TMaskEdit(Sender).Text := MaskDate(now);
end;

procedure TFPedidosConsulta.KeyUpPadrao(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (Key = VK_RETURN) then
  begin
    Perform(CM_DIALOGKEY, VK_TAB, 0);
    Key := 0;
  end;
end;

procedure TFPedidosConsulta.btBuscaCepClick(Sender: TObject);
var buscaRapida: TBuscaRapida;
begin
  buscaRapida := TBuscaRapida.Create;
  buscaRapida.tabela := 'CLIENTES';
  buscaRapida.ColunaCodigoNome := 'CLIENTE_ID';
  buscaRapida.colunaCodigoTitulo := 'Código';
  buscaRapida.colunaDescricaoNome := 'NOME';
  buscaRapida.colunaDescricaoTitulo := 'Nome';
  if buscaRapida.Execute then
  begin
    edClienteID.Text := IntToStr(buscaRapida.ValorID);
    edClienteNome.Text := buscaRapida.ValorDescricao;
  end;
end;

procedure TFPedidosConsulta.ValidaCliente(clienteID: Integer);
begin
  with TSQLQuery.Create(nil) do
  begin
    SQLConnection := SimpleCrudSQLConnection;
    try
      SQL.Clear;
      SQL.Add('SELECT CLIENTES.NOME');
      SQL.Add('FROM CLIENTES');
      SQL.Add('WHERE CLIENTES.CLIENTE_ID = :CLIENTE_ID ');
      ParamByName('CLIENTE_ID').AsInteger := clienteID;
      Open;
      if (not eof) then
        edClienteNome.Text := FieldByName('NOME').AsString
      else
        edClienteNome.Text := 'Cliente não encontrado'
    finally
      Free;
    end;                  
  end;
end;

procedure TFPedidosConsulta.edClienteIDExit(Sender: TObject);
begin
  ValidaCliente(StrToInt(edClienteID.Text));
end;

procedure TFPedidosConsulta.gridPedidosDblClick(Sender: TObject);
begin
  btEditar.Click;
end;

end.
