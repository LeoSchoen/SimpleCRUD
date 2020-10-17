unit ClientesConsulta;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, IBDatabase, DB, DBClient, Menus, DBXpress, FMTBcd, SqlExpr, ConsultaSql,
  Provider, Grids, DBGrids, UDMConexaoDB, Buttons, ExtCtrls, StdCtrls,
  ClientesCadastro, ORMUtils, ClientesORM;

type
  TFClientesConsulta = class(TForm)
    dsClientes: TDataSource;
    dspClientes: TDataSetProvider;
    sdsClientes: TSQLDataSet;
    gridClientes: TDBGrid;
    cdsClientes: TClientDataSet;
    Panel1: TPanel;
    btAdicionar: TSpeedButton;
    btExcluir: TSpeedButton;
    btRefresh: TSpeedButton;
    btEditar: TSpeedButton;
    pnlDivisor: TPanel;
    sdsClientesCLIENTE_ID: TIntegerField;
    sdsClientesTIPO_PESSOA: TStringField;
    sdsClientesCPF_CNPJ: TStringField;
    sdsClientesNOME: TStringField;
    sdsClientesCEP: TStringField;
    sdsClientesLOGRADOURO: TStringField;
    sdsClientesNUMERO: TStringField;
    sdsClientesCOMPLEMENTO: TStringField;
    sdsClientesREFERENCIA: TStringField;
    sdsClientesBAIRRO: TStringField;
    sdsClientesCIDADE: TStringField;
    sdsClientesUF: TStringField;
    cdsClientesCLIENTE_ID: TIntegerField;
    cdsClientesTIPO_PESSOA: TStringField;
    cdsClientesCPF_CNPJ: TStringField;
    cdsClientesNOME: TStringField;
    cdsClientesCEP: TStringField;
    cdsClientesLOGRADOURO: TStringField;
    cdsClientesNUMERO: TStringField;
    cdsClientesCOMPLEMENTO: TStringField;
    cdsClientesREFERENCIA: TStringField;
    cdsClientesBAIRRO: TStringField;
    cdsClientesCIDADE: TStringField;
    cdsClientesUF: TStringField;
    grbFiltro: TGroupBox;
    lbNome: TLabel;
    edNome: TEdit;
    lbTipoPessoa: TLabel;
    edCpfCnpj: TEdit;
    cbTipoPessoa: TComboBox;
    lbCpfCnpj: TLabel;
    btnFiltrar: TButton;
    sdsClientesCODIGO_IBGE: TStringField;
    cdsClientesCODIGO_IBGE: TStringField;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnFiltrarClick(Sender: TObject);
    procedure btRefreshClick(Sender: TObject);
    procedure AtualizaLinhaGrid(cliente: TCliente; acao: TAcao);
    procedure btAdicionarClick(Sender: TObject);
    procedure btEditarClick(Sender: TObject);
    procedure btExcluirClick(Sender: TObject);
    procedure gridClientesDblClick(Sender: TObject);
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
  FClientesConsulta: TFClientesConsulta;

implementation

uses
  MyStrUtils, DocumentosUtils, CepUtils, Constantes;

{$R *.dfm}

procedure TFClientesConsulta.FormCreate(Sender: TObject);
begin
  CriaSqlQuery;
  CarregaSql;
end;

procedure TFClientesConsulta.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Free;
end;

procedure TFClientesConsulta.btnFiltrarClick(Sender: TObject);
begin
  AplicaFiltro;
  CarregaSql;
end;

procedure TFClientesConsulta.CriaSqlQuery;
begin
  FiltroSql := TLayoutQuery.Create;
  FiltroSql.Query :=
    'SELECT CLIENTES.CLIENTE_ID,  '+
           'CASE CLIENTES.TIPO_PESSOA '+
                'WHEN ''F'' THEN ''Física'' '+
                'WHEN ''J'' THEN ''Jurídica'' '+
                'ELSE '''' '+
           'END TIPO_PESSOA, '+
           'CASE CLIENTES.TIPO_PESSOA '+
             'WHEN ''F'' THEN '+
                'SUBSTRING(CLIENTES.CPF_CNPJ FROM 1 FOR 3) || ''.'' '+
                    '|| SUBSTRING(CLIENTES.CPF_CNPJ FROM 3 FOR 3) || ''.'' '+
                    '|| SUBSTRING(CLIENTES.CPF_CNPJ FROM 6 FOR 3) || ''-'' '+
                    '|| SUBSTRING(CLIENTES.CPF_CNPJ FROM 9 FOR 2) '+
             'WHEN ''J'' THEN '+
                'SUBSTRING(CLIENTES.CPF_CNPJ FROM 1 FOR 2) || ''.'' '+
                    '|| SUBSTRING(CLIENTES.CPF_CNPJ FROM 3 FOR 3) || ''.'' '+
                    '|| SUBSTRING(CLIENTES.CPF_CNPJ FROM 6 FOR 3) || ''/'' '+
                    '|| SUBSTRING(CLIENTES.CPF_CNPJ FROM 9 FOR 4) || ''-'' '+
                    '|| SUBSTRING(CLIENTES.CPF_CNPJ FROM 13 FOR 2) '+
             'ELSE CLIENTES.CPF_CNPJ  '+
           'END AS CPF_CNPJ, '+
           'CLIENTES.NOME,  '+
           'CLIENTES.CEP,  '+
                'SUBSTRING(CLIENTES.CEP FROM 1 FOR 2) || ''.'' '+
                    '|| SUBSTRING(CLIENTES.CEP FROM 3 FOR 3) || ''-'' '+
                    '|| SUBSTRING(CLIENTES.CEP FROM 6 FOR 3) CEP,'+
           'CLIENTES.LOGRADOURO,  '+
           'CLIENTES.NUMERO,  '+
           'CLIENTES.COMPLEMENTO,  '+
           'CLIENTES.REFERENCIA,  '+
           'CLIENTES.BAIRRO,  '+
           'CLIENTES.CIDADE,  '+
           'CLIENTES.UF,  '+
           'CLIENTES.CODIGO_IBGE '+
    'FROM CLIENTES CLIENTES ';
  FiltroSql.OrderBy := 'CLIENTES.NOME';

end;

procedure TFClientesConsulta.CarregaSql;
begin
  cdsClientes.Close;
  sdsClientes.CommandText := FiltroSql.SqlQuery;
  cdsClientes.Open;
end;

procedure TFClientesConsulta.AplicaFiltro;
var sqlFiltro: string;
begin
  sqlFiltro := '';
  // Filtro por Nome
  if (not IsEmpty(edNome.Text)) then
    sqlFiltro := sqlFiltro + format(' AND UPPER(CLIENTES.NOME) LIKE UPPER(''%%%s%%'')', [edNome.Text]);
  // Filtro por Tipo de Pessoa
  if (not IsEmpty(cbTipoPessoa.Text)) then
    sqlFiltro := sqlFiltro + format(' AND CLIENTES.TIPO_PESSOA = %s', [QuotedStr(cbTipoPessoa.Text[1])]);
  // Filtro por CPF/CNPJ
  if (not IsEmpty(edCpfCnpj.Text)) then
    sqlFiltro := sqlFiltro + format(' AND CLIENTES.CPF_CNPJ LIKE ''%%%s%%''', [edCpfCnpj.Text]);

  // Seta Condicoes
  FiltroSql.Conditions := Copy(sqlFiltro, 6, Length(sqlFiltro));
end;

procedure TFClientesConsulta.btRefreshClick(Sender: TObject);
begin
  cdsClientes.Close;
  cdsClientes.Open;
end;

procedure TFClientesConsulta.AtualizaLinhaGrid(cliente: TCliente;
  acao: TAcao);
begin
  if (acao = paInclusao) then
  begin
    cdsClientes.Append;
    cdsClientes.FieldByName('CLIENTE_ID').AsInteger := Cliente.ClienteID;
  end
  else
    cdsClientes.Edit;
  cdsClientes.FieldByName('TIPO_PESSOA').AsString := iif(Cliente.TipoPessoa = 'F',
      'Física','Jurídica');
  cdsClientes.FieldByName('CPF_CNPJ').AsString := iif(Cliente.TipoPessoa = 'F',
      FormataCpf(Cliente.CpfCnpj), FormataCnpj(Cliente.CpfCnpj));
  cdsClientes.FieldByName('NOME').AsString := Cliente.Nome;
  cdsClientes.FieldByName('CEP').AsString := FormataCep(Cliente.Cep);
  cdsClientes.FieldByName('LOGRADOURO').AsString := Cliente.Logradouro;
  cdsClientes.FieldByName('NUMERO').AsString := Cliente.Numero;
  cdsClientes.FieldByName('COMPLEMENTO').AsString := Cliente.Complemento;
  cdsClientes.FieldByName('REFERENCIA').AsString := Cliente.Referencia;
  cdsClientes.FieldByName('BAIRRO').AsString := Cliente.Bairro;
  cdsClientes.FieldByName('CIDADE').AsString := Cliente.Cidade;
  cdsClientes.FieldByName('UF').AsString := Cliente.Uf;
  cdsClientes.FieldByName('CODIGO_IBGE').AsString := Cliente.CodigoIbge;
end;

procedure TFClientesConsulta.btAdicionarClick(Sender: TObject);
var cliente: TCliente;
begin
  if ClientesCadastro.AbreCadastro(0, paInclusao, cliente) then
    AtualizaLinhaGrid(cliente, paInclusao);
end;

procedure TFClientesConsulta.btEditarClick(Sender: TObject);
var cliente: TCliente;
begin
  if ClientesCadastro.AbreCadastro(cdsClientesCLIENTE_ID.Value, paEdicao, cliente) then
    AtualizaLinhaGrid(cliente, paEdicao);
end;

procedure TFClientesConsulta.btExcluirClick(Sender: TObject);
var cliente : TCliente;
begin
  if Application.MessageBox(mensagemConfirmacaoDeExclusao,
    'Application.Title', MB_YESNO) = IDYES then
  begin
    cliente := TCliente.Create(cdsClientesCLIENTE_ID.Value);
    if cliente.Excluir then
      cdsClientes.Delete
    else
      raise Exception.Create('Não foi possível excluir o registro');
  end;
end;

procedure TFClientesConsulta.gridClientesDblClick(Sender: TObject);
begin
  btEditar.Click;
end;

end.
