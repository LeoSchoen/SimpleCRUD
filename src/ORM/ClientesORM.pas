unit ClientesORM;

interface

uses
  SysUtils, Variants, Classes, DB, SqlExpr, ConexaoDB, ORMUtils;

type
  TCliente = class
  private
    FClienteID: Integer;
    FTipoPessoa: string;
    FCpfCnpj: string;
    FNome: string;
    FCep: string;
    FLogradouro: string;
    FNumero: string;
    FComplemento: string;
    FReferencia: string;
    FBairro: string;
    FCidade: string;
    FUf: string;
    FCodigoIbge: string;
    FOldTipoPessoa: string;
    FOldCpfCnpj: string;
    FOldNome: string;
    FOldCep: string;
    FOldLogradouro: string;
    FOldNumero: string;
    FOldComplemento: string;
    FOldReferencia: string;
    FOldBairro: string;
    FOldCidade: string;
    FOldUf: string;
    FOldCodigoIbge: string;
    FAcao: TAcao;
  public
    constructor Create; overload;
    constructor Create(clienteID: Integer; acao: TAcao); overload;
    constructor Create(clienteID: Integer); overload;
    procedure Buscar(clienteID: Integer);
    function Salvar: Integer;
    function Excluir: Boolean;
  published
    property ClienteID: Integer read FClienteID;
    property TipoPessoa: string read FTipoPessoa write FTipoPessoa;
    property CpfCnpj: string read FCpfCnpj write FCpfCnpj;
    property Nome: string read FNome write FNome;
    property Cep: string read FCep write FCep;
    property Logradouro: string read FLogradouro write FLogradouro;
    property Numero: string read FNumero write FNumero;
    property Complemento: string read FComplemento write FComplemento;
    property Referencia: string read FReferencia write FReferencia;
    property Bairro: string read FBairro write FBairro;
    property Cidade: string read FCidade write FCidade;
    property Uf: string read FUf write FUf;
    property CodigoIbge: string read FCodigoIbge write FCodigoIbge;
    property Acao: TAcao read FAcao write FAcao;
  end;

implementation

{ TCliente }

procedure TCliente.Buscar(clienteID: Integer);

  procedure SetOlds;
  begin
    FOldTipoPessoa := FTipoPessoa;
    FOldCpfCnpj := FCpfCnpj;
    FOldNome := FNome;
    FOldCep := FCep;
    FOldLogradouro := FLogradouro;
    FOldNumero := FNumero;
    FOldComplemento := FComplemento;
    FOldReferencia := FReferencia;
    FOldBairro := FBairro;
    FOldCidade := FCidade;
    FOldUf := FUf;
    FOldCodigoIbge := FCodigoIbge;
  end;

var queryClientes: TSQLQuery;
begin
  queryClientes := TSQLQuery.Create(nil);
  try
    queryClientes.SQLConnection := SimpleCrudSQLConnection;
    queryClientes.SQL.Clear;
    queryClientes.SQL.Add('SELECT CLIENTES.CLIENTE_ID, ');
    queryClientes.SQL.Add('       CLIENTES.TIPO_PESSOA, ');
    queryClientes.SQL.Add('       CLIENTES.CPF_CNPJ, ');
    queryClientes.SQL.Add('       CLIENTES.NOME, ');
    queryClientes.SQL.Add('       CLIENTES.CEP, ');
    queryClientes.SQL.Add('       CLIENTES.LOGRADOURO, ');
    queryClientes.SQL.Add('       CLIENTES.NUMERO, ');
    queryClientes.SQL.Add('       CLIENTES.COMPLEMENTO, ');
    queryClientes.SQL.Add('       CLIENTES.REFERENCIA, ');
    queryClientes.SQL.Add('       CLIENTES.BAIRRO, ');
    queryClientes.SQL.Add('       CLIENTES.CIDADE, ');
    queryClientes.SQL.Add('       CLIENTES.UF, ');
    queryClientes.SQL.Add('       CLIENTES.CODIGO_IBGE ');
    queryClientes.SQL.Add('FROM CLIENTES');
    queryClientes.SQL.Add('WHERE CLIENTES.CLIENTE_ID = :CLIENTE_ID');
    queryClientes.ParamByName('CLIENTE_ID').AsInteger := clienteID;
    queryClientes.Open;
    queryClientes.First;
    if (queryClientes.Eof) then
    begin
      FClienteID := 0;
      if FAcao <> paVisualizacao then
        FAcao := paInclusao;
    end
    else
    begin
      FAcao := paEdicao;
      FClienteID := queryClientes.FieldByName('CLIENTE_ID').AsInteger;
      FTipoPessoa := queryClientes.FieldByName('TIPO_PESSOA').AsString;
      FCpfCnpj := queryClientes.FieldByName('CPF_CNPJ').AsString;
      FNome := queryClientes.FieldByName('NOME').AsString;
      FCep := queryClientes.FieldByName('CEP').AsString;
      FLogradouro := queryClientes.FieldByName('LOGRADOURO').AsString;
      FNumero := queryClientes.FieldByName('NUMERO').AsString;
      FComplemento := queryClientes.FieldByName('COMPLEMENTO').AsString;
      FReferencia := queryClientes.FieldByName('REFERENCIA').AsString;
      FBairro := queryClientes.FieldByName('BAIRRO').AsString;
      FCidade := queryClientes.FieldByName('CIDADE').AsString;
      FUf := queryClientes.FieldByName('UF').AsString;
      FCodigoIbge := queryClientes.FieldByName('CODIGO_IBGE').AsString;
      SetOlds;
    end;
  finally
    queryClientes.Close;
    FreeAndNil(queryClientes);
  end;
end;

constructor TCliente.Create;
begin
  FClienteID := 0;
  FTipoPessoa := '';
  FCpfCnpj := '';
  FNome := '';
  FCep := '';
  FLogradouro := '';
  FNumero := '';
  FComplemento := '';
  FReferencia := '';
  FBairro := '';
  FCidade := '';
  FUf := '';
  FCodigoIbge := '';
  FAcao := paSemAcao;
end;

constructor TCliente.Create(clienteID: Integer);
begin
  FClienteID := clienteID;
  FTipoPessoa := '';
  FCpfCnpj := '';
  FNome := '';
  FCep := '';
  FLogradouro := '';
  FNumero := '';
  FComplemento := '';
  FReferencia := '';
  FBairro := '';
  FCidade := '';
  FUf := '';
  FCodigoIbge := '';
  Buscar(FClienteID);
end;

constructor TCliente.Create(clienteID: Integer; acao: TAcao);
begin
  FAcao := acao;
  Create(clienteID);
end;

function TCliente.Excluir: Boolean;
var queryClientes: TSQLQuery;
begin
  Result := False;
  queryClientes := TSQLQuery.Create(nil);
  try
    queryClientes.SQLConnection := SimpleCrudSQLConnection;
    // Montando Scrip de Update
    queryClientes.SQL.Clear;
    queryClientes.SQL.Add('DELETE FROM CLIENTES');
    queryClientes.SQL.Add('WHERE (CLIENTE_ID = :CLIENTE_ID)');
    // Executando update
    queryClientes.ParamByName('CLIENTE_ID').AsInteger := FClienteID;
    queryClientes.ExecSQL;
  finally
    Result := True;
    FreeAndNil(queryClientes);
  end;
end;

function TCliente.Salvar: Integer;

  function VerificaSeExiteRegistroRepetido(var msgExcept: string): Boolean;
  var queryValidade: TSQLQuery;
  begin
    Result := False;
    queryValidade := TSQLQuery.Create(nil);
    try
      queryValidade.SQLConnection := SimpleCrudSQLConnection;
      queryValidade.SQL.Clear;
      queryValidade.SQL.Add('SELECT COUNT(1) QTDE FROM CLIENTES');
      queryValidade.SQL.Add('WHERE CLIENTES.CLIENTE_ID <> :CLIENTE_ID');
      queryValidade.SQL.Add('  AND CLIENTES.CPF_CNPJ = :CPF_CNPJ');
      queryValidade.ParamByName('CLIENTE_ID').AsInteger := FClienteID;
      queryValidade.ParamByName('CPF_CNPJ').AsString := FCpfCnpj;
      queryValidade.Open;
      queryValidade.First;
      if not queryValidade.eof then
      begin
        if queryValidade.FieldByName('QTDE').AsInteger > 0 then
        begin
          Result := True;
          msgExcept := Format('Já exite um Cliente cadastrado com este CPF/CNPJ: %s.',
              [QuotedStr(FCpfCnpj)])
        end;
      end;
    finally
      queryValidade.Close;
      FreeAndNil(queryValidade);
    end;
  end;

  function InsereCliente: Integer;
  var queryClientes: TSQLQuery;
  begin
    queryClientes := TSQLQuery.Create(nil);
    try
      queryClientes.SQLConnection := SimpleCrudSQLConnection;
      queryClientes.SQL.Clear;
      // Construindo Sql
      queryClientes.SQL.Add('INSERT INTO CLIENTES (');
      queryClientes.SQL.Add('    TIPO_PESSOA, ');
      queryClientes.SQL.Add('    CPF_CNPJ, ');
      queryClientes.SQL.Add('    NOME, ');
      queryClientes.SQL.Add('    CEP, ');
      queryClientes.SQL.Add('    LOGRADOURO, ');
      queryClientes.SQL.Add('    NUMERO, ');
      queryClientes.SQL.Add('    COMPLEMENTO, ');
      queryClientes.SQL.Add('    REFERENCIA, ');
      queryClientes.SQL.Add('    BAIRRO, ');
      queryClientes.SQL.Add('    CIDADE, ');
      queryClientes.SQL.Add('    UF, ');
      queryClientes.SQL.Add('    CODIGO_IBGE) ');
      queryClientes.SQL.Add('VALUES (');
      queryClientes.SQL.Add('    :TIPO_PESSOA, ');
      queryClientes.SQL.Add('    :CPF_CNPJ, ');
      queryClientes.SQL.Add('    :NOME, ');
      queryClientes.SQL.Add('    :CEP, ');
      queryClientes.SQL.Add('    :LOGRADOURO, ');
      queryClientes.SQL.Add('    :NUMERO, ');
      queryClientes.SQL.Add('    :COMPLEMENTO, ');
      queryClientes.SQL.Add('    :REFERENCIA, ');
      queryClientes.SQL.Add('    :BAIRRO, ');
      queryClientes.SQL.Add('    :CIDADE, ');
      queryClientes.SQL.Add('    :UF, ');
      queryClientes.SQL.Add('    :CODIGO_IBGE) ');
      queryClientes.SQL.Add('RETURNING CLIENTE_ID');
      // Setando Parametro
      queryClientes.ParamByName('TIPO_PESSOA').AsString := FTipoPessoa;
      queryClientes.ParamByName('CPF_CNPJ').AsString := FCpfCnpj;
      queryClientes.ParamByName('NOME').AsString := FNome;
      queryClientes.ParamByName('CEP').AsString := FCep;
      queryClientes.ParamByName('LOGRADOURO').AsString := FLogradouro;
      queryClientes.ParamByName('NUMERO').AsString := FNumero;
      queryClientes.ParamByName('COMPLEMENTO').AsString := FComplemento;
      queryClientes.ParamByName('REFERENCIA').AsString := FReferencia;
      queryClientes.ParamByName('BAIRRO').AsString := FBairro;
      queryClientes.ParamByName('CIDADE').AsString := FCidade;
      queryClientes.ParamByName('UF').AsString := FUf;
      queryClientes.ParamByName('CODIGO_IBGE').AsString := FCodigoIbge;
      // Executando update
      queryClientes.Open;
      // Retornando ClienteID
      FClienteID := queryClientes.Fields[0].AsInteger;
      FAcao := paEdicao;
    finally
      queryClientes.Close;
      FreeAndNil(queryClientes);
    end;
  end;

  function AlteraCliente: Integer;
  var queryClientes: TSQLQuery;
    separator: string;
  begin
    Result := 0;
    separator := '';
    queryClientes := TSQLQuery.Create(nil);
    try
      queryClientes.SQLConnection := SimpleCrudSQLConnection;
      // Montando Scrip de Update
      queryClientes.SQL.Clear;
      queryClientes.SQL.Add('UPDATE CLIENTES SET ');
      if (FTipoPessoa <> FOldTipoPessoa) then
      begin
        queryClientes.Sql.Add(Format('%sTIPO_PESSOA = %s', [separator, QuotedStr(FTipoPessoa)]));
        FOldTipoPessoa := FTipoPessoa;
        separator := ',';
      end;
      if (FCpfCnpj <> FOldCpfCnpj) then
      begin
        queryClientes.Sql.Add(Format('%sCPF_CNPJ = %s', [separator, QuotedStr(FCpfCnpj)]));
        FOldCpfCnpj := FCpfCnpj;
        separator := ',';
      end;
      if (FNome <> FOldNome) then
      begin
        queryClientes.Sql.Add(Format('%sNOME = %s', [separator, QuotedStr(FNome)]));
        FOldNome := FNome;
        separator := ',';
      end;
      if (FCep <> FOldCep) then
      begin
        queryClientes.Sql.Add(Format('%sCEP = %s', [separator, QuotedStr(FCep)]));
        FOldCep := FCep;
        separator := ',';
      end;
      if (FLogradouro <> FOldLogradouro) then
      begin
        queryClientes.Sql.Add(Format('%sLOGRADOURO = %s', [separator, QuotedStr(FLogradouro)]));
        FOldLogradouro := FLogradouro;
        separator := ',';
      end;
      if (FNumero <> FOldNumero) then
      begin
        queryClientes.Sql.Add(Format('%sNUMERO = %s', [separator, QuotedStr(FNumero)]));
        FOldNumero := FNumero;
        separator := ',';
      end;
      if (FComplemento <> FOldComplemento) then
      begin
        queryClientes.Sql.Add(Format('%sCOMPLEMENTO = %s', [separator, QuotedStr(FComplemento)]));
        FOldComplemento := FComplemento;
        separator := ',';
      end;
      if (FReferencia <> FOldReferencia) then
      begin
        queryClientes.Sql.Add(Format('%sREFERENCIA = %s', [separator, QuotedStr(FReferencia)]));
        FOldReferencia := FReferencia;
        separator := ',';
      end;
      if (FBairro <> FOldBairro) then
      begin
        queryClientes.Sql.Add(Format('%sBAIRRO = %s', [separator, QuotedStr(FBairro)]));
        FOldBairro := FBairro;
        separator := ',';
      end;
      if (FCidade <> FOldCidade) then
      begin
        queryClientes.Sql.Add(Format('%sCIDADE = %s', [separator, QuotedStr(FCidade)]));
        FOldCidade := FCidade;
        separator := ',';
      end;
      if (FUf <> FOldUf) then
      begin
        queryClientes.Sql.Add(Format('%sUF = %s', [separator, QuotedStr(FUf)]));
        FOldUf := FUf;
        separator := ',';
      end;
      if (FCodigoIbge <> FOldCodigoIbge) then
      begin
        queryClientes.Sql.Add(Format('%sCODIGO_IBGE = %s', [separator, QuotedStr(FCodigoIbge)]));
        FOldCodigoIbge := FCodigoIbge;
        separator := ',';
      end;

      queryClientes.SQL.Add('WHERE (CLIENTE_ID = :CLIENTE_ID)');
      // Retorna se nao tiver alteracao
      if separator = '' then
        Exit;
      // Executando update
      queryClientes.ParamByName('CLIENTE_ID').AsInteger := FClienteID;
      queryClientes.ExecSQL;
    finally
      Result := FClienteID;
      FreeAndNil(queryClientes);
    end;
  end;

var msgExcepty: String;
begin
  Result := 0;
  if VerificaSeExiteRegistroRepetido(msgExcepty) then
    raise exception.Create(msgExcepty);

  case FAcao of
    paInclusao: Result := InsereCliente;
    paEdicao: Result := AlteraCliente;
    paVisualizacao: raise exception.Create('Não é possivel alterar um registro no modo de visualização');
  end;
end;

end.
