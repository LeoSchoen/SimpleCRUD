unit BuscaRapida;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, FMTBcd, StdCtrls, Grids, DBGrids, DBClient, DB, Provider,
  SqlExpr, ConexaoDB, ConsultaSql;

type
  TBuscaRapida = class
  private
    FTabela: string;
    FColunaCodigoNome: string;
    FColunaCodigoTitulo: string;
    FColunaDescricaoNome: string;
    FColunaDescricaoTitulo: string;
    FOrdenarPor: string;
    FValorID: Integer;
    FValorDescricao: string;
  public
    constructor Create;
    function Execute: Boolean;
  published
    property Tabela: string read FTabela write FTabela;
    property ColunaCodigoNome: string read FColunaCodigoNome write FColunaCodigoNome;
    property ColunaCodigoTitulo: string read FColunaCodigoTitulo write FColunaCodigoTitulo;
    property ColunaDescricaoNome: string read FColunaDescricaoNome write FColunaDescricaoNome;
    property ColunaDescricaoTitulo: string read FColunaDescricaoTitulo write FColunaDescricaoTitulo;
    property ValorID: Integer read FValorID write FValorID;
    property ValorDescricao: string read FValorDescricao write FValorDescricao;
  end;

  TFBuscaRapida = class(TForm)
    gridBuscaRapida: TDBGrid;
    grbFiltro: TGroupBox;
    lbCliente: TLabel;
    btnFiltrar: TButton;
    edDescricao: TEdit;
    sdsBuscaRapida: TSQLDataSet;
    sdsBuscaRapidaID: TIntegerField;
    sdsBuscaRapidaDESCRICAO: TStringField;
    dspBuscaRapida: TDataSetProvider;
    dsBuscaRapida: TDataSource;
    cdsBuscaRapida: TClientDataSet;
    cdsBuscaRapidaID: TIntegerField;
    cdsBuscaRapidaDESCRICAO: TStringField;
    procedure btnFiltrarClick(Sender: TObject);
    procedure gridBuscaRapidaDblClick(Sender: TObject);
    procedure edDescricaoKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
    FiltroSql: TLayoutQuery;
    procedure MontaFiltro;
  public
    { Public declarations }
    tabela: string;
    colunaCodigoNome: string;
    colunaCodigoTitulo: string;
    colunaDescricaoNome: string;
    colunaDescricaoTitulo: string;
    ordenarPor: string;
    valorID: Integer;
    valorDescricao: string;
    procedure CarregaBuscaRapida;
    procedure CarregaSql;
  end;

var
  FBuscaRapida: TFBuscaRapida;

implementation

uses MyStrUtils;

{$R *.dfm}

{ TBuscaRapida }

constructor TBuscaRapida.Create;
begin
  FTabela := '';
  FColunaCodigoNome := '';
  FColunaCodigoTitulo := 'Código';
  FColunaDescricaoNome := '';
  FColunaDescricaoTitulo := 'Descrição';
  FValorID := 0;
  FValorDescricao := '';
end;

function TBuscaRapida.Execute: Boolean;
var buscaRapida: TFBuscaRapida;
begin
  Result := False;
  buscaRapida := TFbuscaRapida.Create(nil);
  try
    buscaRapida.tabela := FTabela;
    buscaRapida.colunaCodigoNome := FColunaCodigoNome;
    buscaRapida.colunaCodigoTitulo := FColunaCodigoTitulo;
    buscaRapida.colunaDescricaoNome := FColunaDescricaoNome;
    buscaRapida.colunaDescricaoTitulo := FColunaDescricaoTitulo;
    buscaRapida.CarregaBuscaRapida;
    buscaRapida.CarregaSql;
    buscaRapida.ShowModal;

     if (buscaRapida.valorID > 0) then
     begin
       FValorID := buscaRapida.valorID;
       FValorDescricao := buscaRapida.valorDescricao;
       Result := True;
     end;
  finally
    buscaRapida.Free;
  end;
end;

{ TFBuscaRapida }

procedure TFBuscaRapida.CarregaBuscaRapida;
begin
  FiltroSql := TLayoutQuery.Create;
  FiltroSql.Query :=
      Format('SELECT %s ID, %s DESCRICAO FROM %s',[colunaCodigoNome, colunaDescricaoNome, tabela]);
  FiltroSql.OrderBy := ordenarPor;
  gridBuscaRapida.Columns[0].Title.Caption := colunaCodigoTitulo;
  gridBuscaRapida.Columns[1].Title.Caption := colunaDescricaoTitulo;
end;

procedure TFBuscaRapida.CarregaSql;
begin
  cdsBuscaRapida.Close;
  sdsBuscaRapida.CommandText := FiltroSql.SqlQuery;
  cdsBuscaRapida.Open;
end;

procedure TFBuscaRapida.MontaFiltro;
begin
  if (IsEmpty(edDescricao.Text)) then
    FiltroSql.Conditions := ''
  else
    FiltroSql.Conditions := Format('UPPER(%s) LIKE UPPER(''%%%s%%'')', [colunaDescricaoNome, edDescricao.Text]);
end;

procedure TFBuscaRapida.btnFiltrarClick(Sender: TObject);
begin
  MontaFiltro;
  CarregaSql;
end;

procedure TFBuscaRapida.gridBuscaRapidaDblClick(Sender: TObject);
begin
  valorID := cdsBuscaRapidaID.Value;
  valorDescricao := cdsBuscaRapidaDESCRICAO.Value;
  Close;
end;

procedure TFBuscaRapida.edDescricaoKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = VK_RETURN) then
    btnFiltrar.Click;
end;

end.
