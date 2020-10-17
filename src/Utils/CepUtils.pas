unit CepUtils;

interface

uses
  SysUtils, Variants, Classes, MyStrUtils, URLUtils;

type
  TEndereco = class
  private
    FCep: string;
    FLogradouro: string;
    FBairro: string;
    FCidade: string;
    FUf: string;
    FCodigoIbge: string;
    procedure SetCep(Avalue: string);
    procedure GetCep(const Value: string);
  public
    constructor Create; overload;
    constructor Create(cep: String); overload;
    procedure BuscarCep;
  published
    property Cep: string read FCep write SetCep;
    property Logradouro: string read FLogradouro write FLogradouro;
    property Bairro: string read FBairro write FBairro;
    property Cidade: string read FCidade write FCidade;
    property Uf: string read FUf write FUf;
    property CodigoIbge: string read FCodigoIbge write FCodigoIbge;
  end;

  function FormataCep(cep: string): string;

implementation

uses IdBaseComponent, IdComponent, IdTCPConnection,
  IdTCPClient, IdHTTP;

function FormataCep(cep: string): string;
begin
  Result := '';
  cep := SomenteNumeros(cep);
  if cep <> '' then
    Result := Format('%s.%s-%s',[Copy(cep, 1,2), Copy(cep, 3,3), Copy(cep,6,3)])
end;

{ TEndereco }

constructor TEndereco.Create;
begin
  FCep := '';
  FLogradouro := '';
  FBairro := '';
  FCidade := '';
  FUf := '';
  FCodigoIbge := '';
end;

procedure TEndereco.BuscarCep;

  function BuscaViaCep: string;
  var
   stmResponse : TStringStream;
   lURL : String;
  begin
    try
      stmResponse := TStringStream.Create('');
      lURL := Format('http://viacep.com.br/ws/%s/xml/', [FCep]);
      with TIdHTTP.Create(nil) do
      begin
        AllowCookies := True;
        ProxyParams.BasicAuthentication := False;
        ProxyParams.ProxyPort := 0;
        Request.ContentLength := -1;
        Request.ContentRangeEnd := 0;
        Request.ContentRangeStart := 0;
        Request.ContentRangeInstanceLength := 0;
        Request.Accept := 'text/html, */*';
        Request.BasicAuthentication := False;
        Request.ContentEncoding := 'ISO-8859-1';
        Request.AcceptCharSet := 'ISO-8859-1';
        Response.ContentEncoding := 'ISO-8859-1';
        Request.UserAgent := 'Mozilla/3.0 (compatible; Indy Library)';
        HTTPOptions := [hoForceEncodeParams];
        Get(lURL, stmResponse);
      end;
      stmResponse.Position := 0;
      Result := StreamToString(stmResponse);
    finally
      FreeAndNil(stmResponse);
    end;
  end;

var
 stmResponse : TStringStream;
 lURL, response : String;
begin
  response := URLDecode(BuscaViaCep);

  if (ExtractStr(response, '<erro>', '</erro>') = 'true') then
    raise exception.create('CEP não encontrado');

  FLogradouro := ExtractStr(response, '<logradouro>', '</logradouro>');
  FBairro := ExtractStr(response, '<bairro>', '</bairro>');
  FCidade := ExtractStr(response, '<localidade>', '</localidade>');
  FUf := ExtractStr(response, '<uf>', '</uf>');
  FCodigoIbge := ExtractStr(response, '<ibge>', '</ibge>');
end;

constructor TEndereco.Create(cep: String);
begin
  Create;
  FCep := SomenteNumeros(cep);
  BuscarCep;
end;

procedure TEndereco.GetCep(const Value: string);
begin
  FCep := Value;
end;

procedure TEndereco.SetCep(AValue: string);
begin
  FCep := SomenteNumeros(AValue);
end;

end.
