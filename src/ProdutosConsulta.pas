unit ProdutosConsulta;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, IBDatabase, DB, DBClient, Menus, DBXpress, FMTBcd, SqlExpr, ConsultaSql,
  Provider, Grids, DBGrids, UDMConexaoDB, Buttons, ExtCtrls, StdCtrls, ORMUtils,
  ProdutosORM, uPrincipal;

type
  TFProdutosConsulta = class(TForm)
    dsProdutos: TDataSource;
    dspProdutos: TDataSetProvider;
    sdsProdutos: TSQLDataSet;
    gridProdutos: TDBGrid;
    cdsProdutos: TClientDataSet;
    Panel1: TPanel;
    btAdicionar: TSpeedButton;
    btExcluir: TSpeedButton;
    btRefresh: TSpeedButton;
    btEditar: TSpeedButton;
    pnlDivisor: TPanel;
    grbFiltro: TGroupBox;
    lbDescricao: TLabel;
    edDescricao: TEdit;
    btnFiltrar: TButton;
    sdsProdutosPRODUTO_ID: TIntegerField;
    sdsProdutosDESCRICAO: TStringField;
    sdsProdutosUNIDADE: TStringField;
    sdsProdutosPRECO_VENDA: TFloatField;
    cdsProdutosPRODUTO_ID: TIntegerField;
    cdsProdutosDESCRICAO: TStringField;
    cdsProdutosUNIDADE: TStringField;
    cdsProdutosPRECO_VENDA: TFloatField;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnFiltrarClick(Sender: TObject);
    procedure btRefreshClick(Sender: TObject);
    procedure btAdicionarClick(Sender: TObject);
    procedure btEditarClick(Sender: TObject);
    procedure AtualizaLinhaGrid(produto: TProduto; acao: TAcao);
    procedure btExcluirClick(Sender: TObject);
    procedure gridProdutosDblClick(Sender: TObject);
  private
    { Private declarations }
    FiltroSql: TLayoutQuery;
    procedure CriaSqlQuery;
    procedure CarregaSql;
    procedure AplicaFiltro;
  public
    { Public declarations }
  end;

var
  FProdutosConsulta: TFProdutosConsulta;

implementation

uses
  MyStrUtils, Constantes, ProdutosCadastro;

{$R *.dfm}

procedure TFProdutosConsulta.FormCreate(Sender: TObject);
begin
  CriaSqlQuery;
  CarregaSql;
end;

procedure TFProdutosConsulta.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Free;
end;

procedure TFProdutosConsulta.btnFiltrarClick(Sender: TObject);
begin
  AplicaFiltro;
  CarregaSql;
end;

procedure TFProdutosConsulta.CriaSqlQuery;
begin
  FiltroSql := TLayoutQuery.Create;
  FiltroSql.Query :=
      'SELECT PRODUTO.PRODUTO_ID, '+
             'PRODUTO.DESCRICAO, '+
             'PRODUTO.UNIDADE, '+
             'PRODUTO.PRECO_VENDA '+
      'FROM PRODUTOS PRODUTO ' ;
  FiltroSql.OrderBy := 'PRODUTO.DESCRICAO';
end;

procedure TFProdutosConsulta.CarregaSql;
begin
  cdsProdutos.Close;
  sdsProdutos.CommandText := FiltroSql.SqlQuery;
  cdsProdutos.Open;
  TNumericField(cdsProdutos.FieldByName('PRECO_VENDA')).DisplayFormat := ',0.00;-,0.00';
end;

procedure TFProdutosConsulta.AplicaFiltro;
var sqlFiltro: string;
begin
  sqlFiltro := '';
  if (not IsEmpty(edDescricao.Text)) then
    sqlFiltro := sqlFiltro + format(' AND UPPER(PRODUTO.DESCRICAO) LIKE UPPER(''%%%s%%'')', [edDescricao.Text]);
  FiltroSql.Conditions := Copy(sqlFiltro, 6, Length(sqlFiltro));
end;

procedure TFProdutosConsulta.btRefreshClick(Sender: TObject);
begin
  cdsProdutos.Close;
  cdsProdutos.Open;
end;

procedure TFProdutosConsulta.AtualizaLinhaGrid(produto: TProduto; acao: TAcao);
begin
  if (acao = paInclusao) then
  begin
    cdsProdutos.Append;
    cdsProdutos.FieldByName('PRODUTO_ID').AsInteger := Produto.ProdutoID;
  end
  else
    cdsProdutos.Edit;
  cdsProdutos.FieldByName('DESCRICAO').AsString := Produto.Descricao;
  cdsProdutos.FieldByName('UNIDADE').AsString := Produto.Unidade;
  cdsProdutos.FieldByName('PRECO_VENDA').AsFloat := Produto.PrecoVenda;
end;

procedure TFProdutosConsulta.btAdicionarClick(Sender: TObject);
var produto: TProduto;
begin
  if ProdutosCadastro.AbreCadastro(0, paInclusao, produto) then
    AtualizaLinhaGrid(produto, paInclusao);
end;

procedure TFProdutosConsulta.btEditarClick(Sender: TObject);
var produto: TProduto;
begin
  if ProdutosCadastro.AbreCadastro(cdsProdutosPRODUTO_ID.Value, paEdicao, produto) then
    AtualizaLinhaGrid(produto, paEdicao);
end;

procedure TFProdutosConsulta.btExcluirClick(Sender: TObject);
var produto : TProduto;
begin
  if Application.MessageBox(mensagemConfirmacaoDeExclusao,
    'Application.Title', MB_YESNO) = IDYES then
  begin
    produto := TProduto.Create(cdsProdutosPRODUTO_ID.Value);
    if produto.Excluir then
      cdsProdutos.Delete
    else
      raise Exception.Create('Não foi possível excluir o registro');
  end;
end;

procedure TFProdutosConsulta.gridProdutosDblClick(Sender: TObject);
begin
  btEditar.Click;
end;

end.
