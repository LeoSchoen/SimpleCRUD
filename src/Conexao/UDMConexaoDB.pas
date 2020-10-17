unit UDMConexaoDB;

interface

uses
  SysUtils, Classes, DBXpress, DB, SqlExpr;

type
  TDMConexaoDB = class(TDataModule)
    SQLConnection: TSQLConnection;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DMConexaoDB: TDMConexaoDB;

implementation

{$R *.dfm}

end.
