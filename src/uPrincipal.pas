unit uPrincipal;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, ConexaoDB, ToolWin, ComCtrls, ImgList;

type
  TFPrincipal = class(TForm)
    mnPrincipal: TMainMenu;
    Cadastros1: TMenuItem;
    mniClientes: TMenuItem;
    mniProdutos: TMenuItem;
    Vendas1: TMenuItem;
    mniPedidos: TMenuItem;
    Ajuda1: TMenuItem;
    Sobre1: TMenuItem;
    procedure mniClientesClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure mniProdutosClick(Sender: TObject);
    procedure mniPedidosClick(Sender: TObject);
    procedure Sobre1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FPrincipal: TFPrincipal;

implementation

uses ClientesConsulta, ProdutosConsulta, PedidosConsulta, About;

{$R *.dfm}

procedure TFPrincipal.FormCreate(Sender: TObject);
begin
  AbreConexaoDB;
end;

procedure TFPrincipal.mniClientesClick(Sender: TObject);
begin
  with TFClientesConsulta.Create(nil) do
    Show;
end;

procedure TFPrincipal.mniProdutosClick(Sender: TObject);
begin
  with TFProdutosConsulta.Create(nil) do
    Show;
end;

procedure TFPrincipal.mniPedidosClick(Sender: TObject);
begin
  with TFPedidosConsulta.Create(nil) do
    Show;
end;

procedure TFPrincipal.Sobre1Click(Sender: TObject);
begin
  with TFAbout.Create(nil) do
    ShowModal;
end;

end.
