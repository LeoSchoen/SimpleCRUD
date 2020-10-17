unit ProdutosORM;

interface

uses
  SysUtils, Variants, Classes, DB, SqlExpr, ConexaoDB, ORMUtils;

type
  TProduto = class
  private
    FProdutoID: Integer;
    FDescricao: String;
    FUnidade: String;
    FPrecoVenda: Extended;
    FOldDescricao: String;
    FOldUnidade: String;
    FOldPrecoVenda: Extended;
    FAcao: TAcao;
  public
    constructor Create; overload;
    constructor Create(produtoID: Integer; acao: TAcao); overload;
    constructor Create(produtoID: Integer); overload;
    procedure Buscar(produtoID: Integer);
    function Salvar: Integer;
    function Excluir: Boolean;
  published
    property ProdutoID: Integer read FProdutoID;
    property Descricao: String read FDescricao write FDescricao;
    property Unidade: String read FUnidade write FUnidade;
    property PrecoVenda: Extended read FPrecoVenda write FPrecoVenda;
    property Acao: TAcao read FAcao write FAcao;
  end;

implementation

{ TProduto }

procedure TProduto.Buscar(produtoID: Integer);
var queryProdutos: TSQLQuery;
begin
  queryProdutos := TSQLQuery.Create(nil);
  queryProdutos.SQLConnection := SimpleCrudSQLConnection;
  queryProdutos.SQL.Clear;
  queryProdutos.SQL.Add('SELECT PRODUTOS.PRODUTO_ID, ');
  queryProdutos.SQL.Add('       PRODUTOS.DESCRICAO, ');
  queryProdutos.SQL.Add('       PRODUTOS.UNIDADE, ');
  queryProdutos.SQL.Add('       PRODUTOS.PRECO_VENDA');
  queryProdutos.SQL.Add('FROM PRODUTOS');
  queryProdutos.SQL.Add('WHERE PRODUTOS.PRODUTO_ID = :PRODUTO_ID');
  queryProdutos.ParamByName('PRODUTO_ID').AsInteger := produtoID;
  queryProdutos.Open;
  queryProdutos.First;
  if (queryProdutos.Eof) then
  begin
    FProdutoID := 0;
    if FAcao <> paVisualizacao then
      FAcao := paInclusao;
  end
  else
  begin
    FAcao := paEdicao;
    FProdutoID := queryProdutos.FieldByName('PRODUTO_ID').AsInteger;
    FDescricao := queryProdutos.FieldByName('DESCRICAO').AsString;
    FUnidade := queryProdutos.FieldByName('UNIDADE').AsString;
    FPrecoVenda := queryProdutos.FieldByName('PRECO_VENDA').AsFloat;
    FOldDescricao := FDescricao;
    FOldUnidade := FUnidade;
    FOldPrecoVenda := FPrecoVenda;
  end;
end;

constructor TProduto.Create;
begin
  FProdutoID := 0;
  FDescricao := '';
  FUnidade := '';
  FPrecoVenda := 0;
  FAcao := paSemAcao;
end;

constructor TProduto.Create(produtoID: Integer);
begin
  FProdutoID := produtoID;
  FDescricao := '';
  FUnidade := '';
  FPrecoVenda := 0;
  Buscar(FProdutoID);
end;

constructor TProduto.Create(produtoID: Integer; acao: TAcao);
begin
  FProdutoID := produtoID;
  FAcao := acao;
  FDescricao := '';
  FUnidade := '';
  FPrecoVenda := 0;
  Buscar(FProdutoID);
end;

function TProduto.Excluir: Boolean;
var queryProdutos: TSQLQuery;
begin
  Result := False;
  queryProdutos := TSQLQuery.Create(nil);
  try
    queryProdutos.SQLConnection := SimpleCrudSQLConnection;
    // Montando Scrip de Update
    queryProdutos.SQL.Clear;
    queryProdutos.SQL.Add('DELETE FROM PRODUTOS');
    queryProdutos.SQL.Add('WHERE (PRODUTO_ID = :PRODUTO_ID)');
    // Executando update
    queryProdutos.ParamByName('PRODUTO_ID').AsInteger := FProdutoID;
    queryProdutos.ExecSQL;
  finally
    Result := True;
    FreeAndNil(queryProdutos);
  end;
end;

function TProduto.Salvar: Integer;

  function InsereProduto: Integer;
  var queryProdutos: TSQLQuery;
  begin
    queryProdutos := TSQLQuery.Create(nil);
    try
      queryProdutos.SQLConnection := SimpleCrudSQLConnection;
      queryProdutos.SQL.Clear;
      // Construindo Sql
      queryProdutos.SQL.Add('INSERT INTO PRODUTOS (');
      queryProdutos.SQL.Add('    DESCRICAO, ');
      queryProdutos.SQL.Add('    UNIDADE, ');
      queryProdutos.SQL.Add('    PRECO_VENDA)');
      queryProdutos.SQL.Add('VALUES (');
      queryProdutos.SQL.Add('    :DESCRICAO, ');
      queryProdutos.SQL.Add('    :UNIDADE, ');
      queryProdutos.SQL.Add('    :PRECO_VENDA)');
      queryProdutos.SQL.Add('RETURNING PRODUTO_ID');
      // Setando Parametro
      queryProdutos.ParamByName('DESCRICAO').AsString := FDescricao;
      queryProdutos.ParamByName('UNIDADE').AsString := FUnidade;
      queryProdutos.ParamByName('PRECO_VENDA').AsFloat := FPrecoVenda;
      // Executando update
      queryProdutos.Open;
      // Retornando ProdutoID
      FProdutoID := queryProdutos.Fields[0].AsInteger;
      FAcao := paEdicao;
    finally
      FreeAndNil(queryProdutos);
    end;
  end;

  function AlteraProduto: Integer;
  var queryProdutos: TSQLQuery;
    separator: string;
  begin
    Result := 0;
    separator := '';
    queryProdutos := TSQLQuery.Create(nil);
    try
      queryProdutos.SQLConnection := SimpleCrudSQLConnection;
      // Montando Scrip de Update
      queryProdutos.SQL.Clear;
      queryProdutos.SQL.Add('UPDATE PRODUTOS SET ');
      if (FDescricao <> FOldDescricao) then
      begin
        queryProdutos.SQL.Add(Format('%sDESCRICAO = %s', [separator, QuotedStr(FDescricao)]));
        FOldDescricao := FDescricao;
        separator := ',';
      end;
      if (FUnidade <> FOldUnidade) then
      begin
        queryProdutos.SQL.Add(Format('%sUNIDADE = %s', [separator, QuotedStr(FUnidade)]));
        FOldUnidade := FUnidade;
        separator := ',';
      end;
      if (FPrecoVenda <> FOldPrecoVenda) then
      begin
        queryProdutos.SQL.Add(Format('%sPRECO_VENDA = %s',
          [separator, StringReplace(FormatFloat('0.#0', FPrecoVenda), ',', '.', [rfReplaceAll])]));
        FOldPrecoVenda := FPrecoVenda;
        separator := ',';
      end;
      queryProdutos.SQL.Add('WHERE (PRODUTO_ID = :PRODUTO_ID)');
      // Retorna se não tiver alteração
      if separator = '' then
        Exit;
      // Executando update
      queryProdutos.ParamByName('PRODUTO_ID').AsInteger := FProdutoID;
      queryProdutos.ExecSQL;
    finally
      Result := FProdutoID;
      FreeAndNil(queryProdutos);
    end;
  end;

begin
  Result := 0;
  case FAcao of
    paInclusao: Result := InsereProduto;
    paEdicao: Result := AlteraProduto;
    paVisualizacao: raise exception.Create('Não é possivel alterar um registro no modo de visualização');
  end;
end;

end.
