program simplecrud;

uses
  Forms,
  uPrincipal in 'uPrincipal.pas' {FPrincipal},
  ClientesConsulta in 'ClientesConsulta.pas' {FClientesConsulta},
  UDMConexaoDB in 'Conexao\UDMConexaoDB.pas' {DMConexaoDB: TDataModule},
  ConexaoDB in 'Conexao\ConexaoDB.pas',
  ConfiguraConexao in 'Conexao\ConfiguraConexao.pas' {FConfiguraConexao},
  ConsultaSql in 'Conexao\ConsultaSql.pas',
  ProdutosConsulta in 'ProdutosConsulta.pas' {FProdutosConsulta},
  PedidosConsulta in 'PedidosConsulta.pas' {FPedidosConsulta},
  MyStrUtils in 'Utils\MyStrUtils.pas',
  MyDateUtils in 'Utils\MyDateUtils.pas',
  ProdutosCadastro in 'ProdutosCadastro.pas' {FProdutosCadastro},
  ProdutosORM in 'ORM\ProdutosORM.pas',
  ClientesORM in 'ORM\ClientesORM.pas',
  ClientesCadastro in 'ClientesCadastro.pas' {FClientesCadastro},
  ORMUtils in 'ORM\ORMUtils.pas',
  DocumentosUtils in 'Utils\DocumentosUtils.pas',
  CepUtils in 'Utils\CepUtils.pas',
  PedidosCadastro in 'PedidosCadastro.pas' {FPedidosCadastro},
  PedidosORM in 'ORM\PedidosORM.pas',
  BuscaRapida in 'BuscaRapida.pas' {FBuscaRapida},
  PedidosItensORM in 'ORM\PedidosItensORM.pas',
  ConversionUtils in 'Utils\ConversionUtils.pas',
  Constantes in 'Utils\Constantes.pas',
  ComponentsUtils in 'Utils\ComponentsUtils.pas',
  About in 'About.pas' {FAbout},
  URLUtils in 'Utils\URLUtils.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'SimpleCrud';
  Application.CreateForm(TDMConexaoDB, DMConexaoDB);
  Application.CreateForm(TFPrincipal, FPrincipal);
  Application.Run;
end.
