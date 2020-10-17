unit PedidosORM;

interface

uses
  SysUtils, Variants, Classes, DB, SqlExpr, ConexaoDB, ORMUtils, PedidosItensORM,
  Contnrs;

type

  TListaItens = class(TObjectList)
  private
    function GetItem(Idx: Integer): TPedidoItem;
    procedure SetItem(Idx: Integer; const Value: TPedidoItem);
  public
    property Items[Idx: Integer]: TPedidoItem read GetItem write SetItem; default;
    function Add(AItem: TPedidoItem): Integer;
    function Count: Integer;
  end;

  TPedido = class
  private
    FPedidoID: Integer;
    FReferencia: String;
    FNumeroPedido: String;
    FDataEmissao: TDateTime;
    FClienteID: Integer;
    FTipoOperacao: string;
    FValorTotal: Extended;
    FOldReferencia: String;
    FOldNumeroPedido: String;
    FOldDataEmissao: TDateTime;
    FOldClienteID: Integer;
    FOldTipoOperacao: string;
    FOldValorTotal: Extended;
    FAcao: TAcao;
  public
    Itens: TListaItens;
    ItensExcluidos: TListaItens;    
    constructor Create; overload;
    constructor Create(pedidoID: Integer; acao: TAcao); overload;
    constructor Create(pedidoID: Integer); overload;
    procedure Buscar(pedidoID: Integer);
    function Salvar: Integer;
    function Excluir: Boolean;
  published
    property PedidoID: Integer read FPedidoID;
    property Referencia: String read FReferencia write FReferencia;
    property NumeroPedido: String read FNumeroPedido write FNumeroPedido;
    property DataEmissao: TDateTime read FDataEmissao write FDataEmissao;
    property ClienteID: Integer read FClienteID write FClienteID;
    property TipoOperacao: string read FTipoOperacao write FTipoOperacao;
    property ValorTotal: Extended read FValorTotal write FValorTotal;
    property Acao: TAcao read FAcao write FAcao;
  end;

implementation

uses MyDateUtils;

{ TPedido }

procedure TPedido.Buscar(pedidoID: Integer);

  procedure SetOlds;
  begin
    FOldTipoOperacao := FTipoOperacao;
    FOldNumeroPedido := FNumeroPedido;
    FOldDataEmissao := FDataEmissao;
    FOldReferencia := FReferencia;
    FOldClienteID := FClienteID;
    FOldValorTotal := FValorTotal;
  end;

var queryPedidos: TSQLQuery;
begin
  queryPedidos := TSQLQuery.Create(nil);
  queryPedidos.SQLConnection := SimpleCrudSQLConnection;
  queryPedidos.SQL.Clear;
  queryPedidos.SQL.Add('SELECT PEDIDOS.PEDIDO_ID, ');
  queryPedidos.SQL.Add('       PEDIDOS.TIPO_OPERACAO, ');
  queryPedidos.SQL.Add('       PEDIDOS.NUMERO_PEDIDO, ');
  queryPedidos.SQL.Add('       PEDIDOS.DATA_EMISSAO, ');
  queryPedidos.SQL.Add('       PEDIDOS.REFERENCIA, ');
  queryPedidos.SQL.Add('       PEDIDOS.CLIENTE_ID, ');
  queryPedidos.SQL.Add('       PEDIDOS.VALOR_TOTAL');
  queryPedidos.SQL.Add('FROM PEDIDOS');
  queryPedidos.SQL.Add('WHERE PEDIDOS.PEDIDO_ID = :PEDIDO_ID');
  queryPedidos.ParamByName('PEDIDO_ID').AsInteger := pedidoID;
  queryPedidos.Open;
  queryPedidos.First;

  if (queryPedidos.Eof) then
  begin
    FPedidoID := 0;
    if FAcao <> paVisualizacao then
      FAcao := paInclusao;
  end
  else
  begin
    FAcao := paEdicao;
    FPedidoID := queryPedidos.FieldByName('PEDIDO_ID').AsInteger;
    FTipoOperacao := queryPedidos.FieldByName('TIPO_OPERACAO').AsString;
    FNumeroPedido := queryPedidos.FieldByName('NUMERO_PEDIDO').AsString;
    FDataEmissao := queryPedidos.FieldByName('DATA_EMISSAO').AsDateTime;
    FReferencia := queryPedidos.FieldByName('REFERENCIA').AsString;
    FClienteID := queryPedidos.FieldByName('CLIENTE_ID').AsInteger;
    FValorTotal := queryPedidos.FieldByName('VALOR_TOTAL').AsFloat;
    SetOlds;
  end;
end;

constructor TPedido.Create;
begin
  FPedidoID := 0;
  FTipoOperacao := '';
  FNumeroPedido := '';
  FReferencia := '';
  FClienteID := 0;
  FValorTotal := 0;
end;

constructor TPedido.Create(pedidoID: Integer);
begin
  FPedidoID := pedidoID;
  FTipoOperacao := '';
  FNumeroPedido := '';
  FReferencia := '';
  FClienteID := 0;
  FValorTotal := 0;
  Buscar(FPedidoID);
end;

constructor TPedido.Create(pedidoID: Integer; acao: TAcao);
begin
  FAcao := acao;
  Create(pedidoID);
end;

function TPedido.Excluir: Boolean;
var queryPedidos: TSQLQuery;
begin
  Result := False;
  queryPedidos := TSQLQuery.Create(nil);
  try
    queryPedidos.SQLConnection := SimpleCrudSQLConnection;
    // Montando Scrip de Update
    queryPedidos.SQL.Clear;
    queryPedidos.SQL.Add('DELETE FROM PEDIDOS');
    queryPedidos.SQL.Add('WHERE (PEDIDO_ID = :PEDIDO_ID)');
    // Executando update
    queryPedidos.ParamByName('PEDIDO_ID').AsInteger := FPedidoID;
    queryPedidos.ExecSQL;
  finally
    Result := True;
    FreeAndNil(queryPedidos);
  end;
end;

function TPedido.Salvar: Integer;

  function VerificaSeExiteRegistroRepetido(var msgExcept: string): Boolean;
  var queryValidade: TSQLQuery;
  begin
    Result := False;
    queryValidade := TSQLQuery.Create(nil);
    try
      queryValidade.SQLConnection := SimpleCrudSQLConnection;
      queryValidade.SQL.Clear;
      queryValidade.SQL.Add('SELECT COUNT(1) QTDE FROM PEDIDOS');
      queryValidade.SQL.Add('WHERE PEDIDOS.PEDIDO_ID <> :PEDIDO_ID');
      queryValidade.SQL.Add('  AND PEDIDOS.TIPO_OPERACAO = :TIPO_OPERACAO');
      queryValidade.SQL.Add('  AND PEDIDOS.NUMERO_PEDIDO = :NUMERO_PEDIDO');
      queryValidade.ParamByName('PEDIDO_ID').AsInteger := FPedidoID;
      queryValidade.ParamByName('TIPO_OPERACAO').AsString := FTipoOperacao;
      queryValidade.ParamByName('NUMERO_PEDIDO').AsString := FNumeroPedido;
      queryValidade.Open;
      queryValidade.First;
      if not queryValidade.eof then
      begin
        if queryValidade.FieldByName('QTDE').AsInteger > 0 then
        begin
          Result := True;
          msgExcept := Format('Já exite um Pedido cadastrado com esta Numeração e Operação: %s.',
              [QuotedStr(FNumeroPedido)])
        end;
      end;
    finally
      queryValidade.Close;
      FreeAndNil(queryValidade);
    end;
  end;

  function InserePedido: Integer;
  var queryPedidos: TSQLQuery;
  begin
    queryPedidos := TSQLQuery.Create(nil);
    try
      queryPedidos.SQLConnection := SimpleCrudSQLConnection;
      queryPedidos.SQL.Clear;
      // Construindo Sql
      queryPedidos.SQL.Add('INSERT INTO PEDIDOS (');
      queryPedidos.SQL.Add('    TIPO_OPERACAO, ');
      queryPedidos.SQL.Add('    NUMERO_PEDIDO, ');
      queryPedidos.SQL.Add('    DATA_EMISSAO, ');
      queryPedidos.SQL.Add('    REFERENCIA, ');
      queryPedidos.SQL.Add('    CLIENTE_ID, ');
      queryPedidos.SQL.Add('    VALOR_TOTAL) ');
      queryPedidos.SQL.Add('VALUES (');
      queryPedidos.SQL.Add('    :TIPO_OPERACAO, ');
      queryPedidos.SQL.Add('    :NUMERO_PEDIDO, ');
      queryPedidos.SQL.Add('    :DATA_EMISSAO, ');
      queryPedidos.SQL.Add('    :REFERENCIA, ');
      queryPedidos.SQL.Add('    :CLIENTE_ID, ');
      queryPedidos.SQL.Add('    :VALOR_TOTAL) ');
      queryPedidos.SQL.Add('RETURNING PEDIDO_ID');

      // Setando Parametro
      queryPedidos.ParamByName('TIPO_OPERACAO').AsString := FTipoOperacao;
      queryPedidos.ParamByName('NUMERO_PEDIDO').AsString := FNumeroPedido;
      queryPedidos.ParamByName('DATA_EMISSAO').AsDate := FDataEmissao;
      queryPedidos.ParamByName('REFERENCIA').AsString := FReferencia;
      queryPedidos.ParamByName('CLIENTE_ID').AsInteger := FClienteID;
      queryPedidos.ParamByName('VALOR_TOTAL').AsFloat := FValorTotal;

      // Executando update
      queryPedidos.Open;
      // Retornando PedidoID
      FPedidoID := queryPedidos.Fields[0].AsInteger;
      FAcao := paEdicao;
    finally
      FreeAndNil(queryPedidos);
    end;
  end;

  function AlteraPedido: Integer;
  var queryPedidos: TSQLQuery;
    separator: string;
  begin
    Result := 0;
    separator := '';
    queryPedidos := TSQLQuery.Create(nil);
    try
      queryPedidos.SQLConnection := SimpleCrudSQLConnection;
      // Montando Scrip de Update
      queryPedidos.SQL.Clear;
      queryPedidos.SQL.Add('UPDATE PEDIDOS SET ');
      if (FTipoOperacao <> FOldTipoOperacao) then
      begin
        queryPedidos.SQL.Add(Format('%sTIPO_OPERACAO = %s', [separator, QuotedStr(FTipoOperacao)]));
        FOldTipoOperacao := FTipoOperacao;
        separator := ',';
      end;
      if (FNumeroPedido <> FOldNumeroPedido) then
      begin
        queryPedidos.SQL.Add(Format('%sNUMERO_PEDIDO = %s', [separator, QuotedStr(FNumeroPedido)]));
        FOldNumeroPedido := FNumeroPedido;
        separator := ',';
      end;
      if (FDataemissao <> FOldDataemissao) then
      begin
        queryPedidos.SQL.Add(Format('%sDATA_EMISSAO = %s', [separator, QuotedStr(AsStrDate(FDataemissao))]));
        FOldDataemissao := FDataemissao;
        separator := ',';
      end;
      if (FReferencia <> FOldReferencia) then
      begin
        queryPedidos.SQL.Add(Format('%sREFERENCIA = %s', [separator, QuotedStr(FReferencia)]));
        FOldReferencia := FReferencia;
        separator := ',';
      end;
      if (FClienteID <> FOldClienteID) then
      begin
        queryPedidos.SQL.Add(Format('%sCLIENTE_ID = %s', [separator, FClienteID]));
        FOldClienteID := FClienteID;
        separator := ',';
      end;
      if (FValorTotal <> FOldValorTotal) then
      begin
        queryPedidos.SQL.Add(Format('%sVALOR_TOTAL = %s', 
            [separator, StringReplace(FormatFloat('0.#0', FValorTotal), ',', '.', [rfReplaceAll])]));
        FOldValorTotal := FValorTotal;
        separator := ',';
      end;
      queryPedidos.SQL.Add('WHERE (PEDIDO_ID = :PEDIDO_ID)');
      // Retorna se nao tiver alteracao
      if separator = '' then
        Exit;
      // Executando update
      queryPedidos.ParamByName('PEDIDO_ID').AsInteger := FPedidoID;
      queryPedidos.ExecSQL;
    finally
      Result := FPedidoID;
      FreeAndNil(queryPedidos);
    end;
  end;

  procedure SalvarItensDoPedido;
  var i: Word;
  begin
    if Assigned(Itens) then
    begin
      for i := 0 to pred(Itens.Count) do
      begin
        if (Itens[i].PedidoID = 0) then
          Itens[i].PedidoID := FPedidoID;
        Itens[i].Salvar;
      end;
    end;
  end;

  procedure ExcluirItensDoPedido;
  var i: Word;
  begin
    if Assigned(ItensExcluidos) then
    begin
      for i := 0 to pred(ItensExcluidos.Count) do
      begin
        ItensExcluidos[i].Excluir;
      end;
    end;
  end;

var msgExcepty: String;
begin
  Result := 0;
  if VerificaSeExiteRegistroRepetido(msgExcepty) then
    raise exception.Create(msgExcepty);

  case FAcao of
    paInclusao: Result := InserePedido;
    paEdicao: Result := AlteraPedido;
    paVisualizacao: raise exception.Create('Não é possivel alterar um registro no modo de visualização');
  end;

  SalvarItensDoPedido;
  ExcluirItensDoPedido;
end;

{ TListaItens }

function TListaItens.Add(AItem: TPedidoItem): Integer;
begin
  Result := inherited Add(AItem);
end;

function TListaItens.Count: Integer;
begin
  Result := inherited Count;
end;

function TListaItens.GetItem(Idx: Integer): TPedidoItem;
begin
  Result := inherited Items[Idx] as TPedidoItem;
end;

procedure TListaItens.SetItem(Idx: Integer; const Value: TPedidoItem);
begin
  inherited Items[Idx] := Value;
end;

end.
