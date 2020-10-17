unit PedidosItensORM;

interface

uses
  SysUtils, Variants, Classes, DB, SqlExpr, ConexaoDB, ORMUtils;

type
  TPedidoItem = class(TObject)
  private
    FPedidoItemID: Integer;
    FPedidoID: Integer; 
    FProdutoID: Integer;
    FUnidade: ShortString;
    FQuantidade: Extended;
    FValorUnitario: Extended;
    FTotal: Extended;
    FOldPedidoID: Integer;
    FOldProdutoID: Integer;
    FOldUnidade: ShortString;
    FOldQuantidade: Extended;
    FOldValorUnitario: Extended;
    FOldTotal: Extended;
    FAcao: TAcao;
  public
    constructor Create; overload;
    constructor Create(pedidoItemID: Integer; acao: TAcao); overload;
    constructor Create(pedidoItemID: Integer); overload;
    procedure Buscar(pedidoItemID: Integer);
    function Salvar: Integer;
    function Excluir: Boolean;
  published
    property PedidoItemID: Integer read FPedidoItemID;
    property PedidoID: Integer read FPedidoID write FPedidoID;
    property ProdutoID: Integer read FProdutoID write FProdutoID;
    property Unidade: ShortString read FUnidade write FUnidade;
    property Quantidade: Extended read FQuantidade write FQuantidade;
    property ValorUnitario: Extended read FValorUnitario write FValorUnitario;
    property Total: Extended read FTotal write FTotal;
    property Acao: TAcao read FAcao write FAcao;
  end;

implementation

uses MyDateUtils;

{ TPedidoItem }

procedure TPedidoItem.Buscar(pedidoItemID: Integer);

  procedure SetOlds;
  begin
    FOldPedidoID := FPedidoID;
    FOldProdutoID := FProdutoID;
    FOldUnidade := FUnidade;
    FOldQuantidade := FQuantidade;
    FOldValorUnitario := FValorUnitario;
    FOldTotal := FTotal;
  end;

var queryPedidosItens: TSQLQuery;
begin
  queryPedidosItens := TSQLQuery.Create(nil);
  queryPedidosItens.SQLConnection := SimpleCrudSQLConnection;
  queryPedidosItens.SQL.Clear;
  queryPedidosItens.SQL.Add('SELECT PEDIDOS_ITENS.PEDIDO_ITEM_ID, ');
  queryPedidosItens.SQL.Add('       PEDIDOS_ITENS.PEDIDO_ID, ');
  queryPedidosItens.SQL.Add('       PEDIDOS_ITENS.PRODUTO_ID, ');
  queryPedidosItens.SQL.Add('       PEDIDOS_ITENS.UNIDADE, ');
  queryPedidosItens.SQL.Add('       PEDIDOS_ITENS.QUANTIDADE, ');
  queryPedidosItens.SQL.Add('       PEDIDOS_ITENS.VALOR_UNITARIO, ');
  queryPedidosItens.SQL.Add('       PEDIDOS_ITENS.TOTAL');
  queryPedidosItens.SQL.Add('FROM PEDIDOS_ITENS');
  queryPedidosItens.SQL.Add('WHERE PEDIDOS_ITENS.PEDIDO_ITEM_ID = :PEDIDO_ITEM_ID');
  queryPedidosItens.ParamByName('PEDIDO_ITEM_ID').AsInteger := pedidoItemID;
  queryPedidosItens.Open;
  queryPedidosItens.First;

  if (queryPedidosItens.Eof) then
  begin
    FPedidoItemID := 0;
    if FAcao <> paVisualizacao then
      FAcao := paInclusao;
  end
  else
  begin
    FAcao := paEdicao;
    FPedidoItemID := queryPedidosItens.FieldByName('PEDIDO_ITEM_ID').AsInteger;
    FPedidoID := queryPedidosItens.FieldByName('PEDIDO_ID').AsInteger;
    FProdutoID := queryPedidosItens.FieldByName('PRODUTO_ID').AsInteger;
    FUnidade := queryPedidosItens.FieldByName('UNIDADE').AsString;
    FQuantidade := queryPedidosItens.FieldByName('QUANTIDADE').AsFloat;
    FValorUnitario := queryPedidosItens.FieldByName('VALOR_UNITARIO').AsFloat;
    FTotal := queryPedidosItens.FieldByName('TOTAL').AsFloat;
    SetOlds;
  end;
end;

constructor TPedidoItem.Create;
begin
  FPedidoItemID := 0;
  FPedidoID := 0;
  FProdutoID := 0;
  FUnidade := '';
  FQuantidade := 0;
  FValorUnitario := 0;
  FTotal := 0;
end;

constructor TPedidoItem.Create(pedidoItemID: Integer);
begin
  FPedidoItemID := pedidoItemID;
  FPedidoID := 0;
  FProdutoID := 0;
  FUnidade := '';
  FQuantidade := 0;
  FValorUnitario := 0;
  FTotal := 0;
  Buscar(FPedidoItemID);
end;

constructor TPedidoItem.Create(pedidoItemID: Integer; acao: TAcao);
begin
  FAcao := acao;
  Create(pedidoItemID);
end;

function TPedidoItem.Excluir: Boolean;
var queryPedidosItens: TSQLQuery;
begin
  Result := False;
  queryPedidosItens := TSQLQuery.Create(nil);
  try
    queryPedidosItens.SQLConnection := SimpleCrudSQLConnection;
    // Montando Scrip de Update
    queryPedidosItens.SQL.Clear;
    queryPedidosItens.SQL.Add('DELETE FROM PEDIDOS_ITENS');
    queryPedidosItens.SQL.Add('WHERE (PEDIDO_ITEM_ID = :PEDIDO_ITEM_ID)');
    // Executando update
    queryPedidosItens.ParamByName('PEDIDO_ITEM_ID').AsInteger := FPedidoItemID;
    queryPedidosItens.ExecSQL;
  finally
    Result := True;
    FreeAndNil(queryPedidosItens);
  end;
end;

function TPedidoItem.Salvar: Integer;

  function InserePedidoItem: Integer;
  var queryPedidosItens: TSQLQuery;
  begin
    queryPedidosItens := TSQLQuery.Create(nil);
    try
      queryPedidosItens.SQLConnection := SimpleCrudSQLConnection;
      queryPedidosItens.SQL.Clear;
      // Construindo Sql
      queryPedidosItens.SQL.Add('INSERT INTO PEDIDOS_ITENS (');
      queryPedidosItens.SQL.Add('    PEDIDO_ID, ');
      queryPedidosItens.SQL.Add('    PRODUTO_ID, ');
      queryPedidosItens.SQL.Add('    UNIDADE, ');
      queryPedidosItens.SQL.Add('    QUANTIDADE, ');
      queryPedidosItens.SQL.Add('    VALOR_UNITARIO, ');
      queryPedidosItens.SQL.Add('    TOTAL) ');
      queryPedidosItens.SQL.Add('VALUES (');
      queryPedidosItens.SQL.Add('    :PEDIDO_ID, ');
      queryPedidosItens.SQL.Add('    :PRODUTO_ID, ');
      queryPedidosItens.SQL.Add('    :UNIDADE, ');
      queryPedidosItens.SQL.Add('    :QUANTIDADE, ');
      queryPedidosItens.SQL.Add('    :VALOR_UNITARIO, ');
      queryPedidosItens.SQL.Add('    :TOTAL) ');
      queryPedidosItens.SQL.Add('RETURNING PEDIDO_ITEM_ID');

      // Setando Parametro
      queryPedidosItens.ParamByName('PEDIDO_ID').AsInteger := FPedidoID;
      queryPedidosItens.ParamByName('PRODUTO_ID').AsInteger := FProdutoID;
      queryPedidosItens.ParamByName('UNIDADE').AsString := FUnidade;
      queryPedidosItens.ParamByName('QUANTIDADE').AsFloat := FQuantidade;
      queryPedidosItens.ParamByName('VALOR_UNITARIO').AsFloat := FValorUnitario;
      queryPedidosItens.ParamByName('TOTAL').AsFloat := FTotal;

      // Executando update
      queryPedidosItens.Open;
      // Retornando PedidoItemID
      FPedidoItemID := queryPedidosItens.Fields[0].AsInteger;
      FAcao := paEdicao;
    finally
      FreeAndNil(queryPedidosItens);
    end;
  end;

  function AlteraPedidoItem: Integer;
  var queryPedidosItens: TSQLQuery;
    separator: string;
  begin
    Result := 0;
    separator := '';
    queryPedidosItens := TSQLQuery.Create(nil);
    try
      queryPedidosItens.SQLConnection := SimpleCrudSQLConnection;
      // Montando Scrip de Update
      queryPedidosItens.SQL.Clear;
      queryPedidosItens.SQL.Add('UPDATE PEDIDOS_ITENS SET ');
      if (FPedidoID <> FOldPedidoID) then
      begin
        queryPedidosItens.SQL.Add(Format('%sPEDIDO_ID = %d', [separator, FPedidoID]));
        FOldPedidoID := FPedidoID;
        separator := ',';
      end;
      if (FProdutoID <> FOldProdutoID) then
      begin
        queryPedidosItens.SQL.Add(Format('%sPRODUTO_ID = %d', [separator, FProdutoID]));
        FOldProdutoID := FProdutoID;
        separator := ',';
      end;
      if (FUnidade <> FOldUnidade) then
      begin
        queryPedidosItens.SQL.Add(Format('%sUNIDADE = %s', [separator, QuotedStr(FUnidade)]));
        FOldUnidade := FUnidade;
        separator := ',';
      end;
      if (FQuantidade <> FOldQuantidade) then
      begin
        queryPedidosItens.SQL.Add(Format('%sQUANTIDADE = %s', 
            [separator, StringReplace(FormatFloat('0.#0', FQuantidade), ',', '.', [rfReplaceAll])]));
        FOldQuantidade := FQuantidade;
        separator := ',';
      end;
      if (FValorUnitario <> FOldValorUnitario) then
      begin
        queryPedidosItens.SQL.Add(Format('%sVALOR_UNITARIO = %s', 
            [separator, StringReplace(FormatFloat('0.#0', FValorUnitario), ',', '.', [rfReplaceAll])]));
        FOldValorUnitario := FValorUnitario;
        separator := ',';
      end;
      if (FTotal <> FOldTotal) then
      begin
        queryPedidosItens.SQL.Add(Format('%sTOTAL = %s', 
            [separator, StringReplace(FormatFloat('0.#0', FTotal), ',', '.', [rfReplaceAll])]));
        FOldTotal := FTotal;
        separator := ',';
      end;
      queryPedidosItens.SQL.Add('WHERE (PEDIDO_ITEM_ID = :PEDIDO_ITEM_ID)');
      // Retorna se nao tiver alteracao
      if separator = '' then
        Exit;
      // Executando update
      queryPedidosItens.ParamByName('PEDIDO_ITEM_ID').AsInteger := FPedidoItemID;
      queryPedidosItens.ExecSQL;
    finally
      Result := FPedidoItemID;
      FreeAndNil(queryPedidosItens);
    end;
  end;

begin
  Result := 0;
  case FAcao of
    paInclusao: Result := InserePedidoItem;
    paEdicao: Result := AlteraPedidoItem;
    paVisualizacao: raise exception.Create('Não é possivel alterar um registro no modo de visualização.');
  end;
end;
  
end.  
