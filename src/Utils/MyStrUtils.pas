unit MyStrUtils;

interface

uses
  SysUtils, StrUtils, Variants, Classes;

function StrZero(numero, tamanho: integer): string;
function IsEmpty(value: string): Boolean;
function IfEmpty(value, search: string): string;
function SomenteNumeros(valor: string):string;
function iif(expressao: Boolean; valorVerdadeiro, valorFalso: String): string;
function ExtractStr(const Str: string; const Delim1, Delim2: string): string;
function StreamToString(aStream: TStream): string;

implementation

function StrZero(numero, tamanho: integer): string;
var
  strNumero: string;
  diferenca: Integer;
begin
  strNumero := IntToStr(numero);
  diferenca := tamanho - Length(strNumero);
  if diferenca > 0 then
    strNumero := StringOfChar('0', diferenca) + strNumero;
  Result := strNumero;
end;

function IsEmpty(value: string): Boolean;
begin
  Result := Length(Trim(value))=0;
end;

function IfEmpty(value, search: string): string;
begin
  if (not IsEmpty(value))
  then result := value
  else result := search;
end;

function SomenteNumeros(valor: string): string;
var
  i, j: Word;
begin
  j := 0;
  for i := 1 to Length(valor) do
  begin
    if valor[i] in ['0'..'9'] then
    begin
      Inc(j);
      valor[j] := valor[i];
    end;
  end;
  SetLength(valor, j);
  Result := valor;
end;

function iif(expressao: Boolean; valorVerdadeiro, valorFalso: String): string;
begin
  if expressao then
    Result := valorVerdadeiro
  else
    Result := valorFalso;
end;

function ExtractStr(const str: string; const Delim1, Delim2: string): string;
var
  pos1, pos2: integer;
begin
  result := '';
  pos1 := Pos(Delim1, str);
  if pos1 > 0 then
  begin
    pos1 := pos1 + Length(Delim1);
    pos2 := PosEx(Delim2, str, pos1);
    if pos2 > 0 then
      result := Copy(str, pos1, pos2 - pos1);
  end;
end;

function StreamToString(aStream: TStream): string;
var
  SS: TStringStream;
begin
  if aStream <> nil then
  begin
    SS := TStringStream.Create('');
    try
      SS.CopyFrom(aStream, 0);
      Result := SS.DataString;
    finally
      SS.Free;
    end;
  end else
  begin
    Result := '';
  end;
end;

end.
