unit DocumentosUtils;

interface

uses
  SysUtils;

function FormataCpf(cpf: string): string;
function FormataCnpj(cnpj: string): string;
function ValidaCpf(cpf: string): boolean;
function ValidaCnpj(cnpj: string): boolean;

implementation

function FormataCpf(cpf: string): string;
begin
  Result := '';
  if cpf <> '' then
    Result := Format('%s.%s.%s-%s',[Copy(cpf, 1,3), Copy(cpf, 4,3),
        Copy(cpf,7,3), Copy(cpf, 10,2)]);
end;

function FormataCnpj(cnpj: string): string;
begin
  Result := '';
  if cnpj <> '' then
    Result := Format('%s.%s.%s/%s-%s',[ Copy(cnpj,1,2), Copy(cnpj,3,3),
        Copy(cnpj,6,3), Copy(cnpj,9,4), Copy(cnpj,13,2)]);
end;

function ValidaCnpj(cnpj: string): boolean;

  function n(i: byte): integer;
  begin
    result := StrToInt(cnpj[i]);
  end;

var
   d1,d2: word;
   digito, calculado: string;
begin
  Result := False;
  if cnpj = '' then
    Exit;
  if length(cnpj) <> 14 then
    Exit;

  d1 := (n(12)*2) + (n(11)*3) + (n(10)*4) + (n(9)*5) + (n(8)*6) + (n(7)*7) + (n(6)*8) + (n(5)*9) + (n(4)*2) + (n(3)*3) + (n(2)*4) + (n(1)*5);
  d1 := 11-(d1 mod 11);

  if d1>=10 then
    d1:=0;

  d2 := (n(12)*3) + (n(11)*4) + (n(10)*5) + (n(9)*6) + (n(8)*7) + (n(7)*8) + (n(6)*9) + (n(5)*2) + (n(4)*3) + (n(3)*4) + (n(2)*5) + (n(1)*6);
  d2 := (d1*2) + d2;
  d2 := 11-(d2 mod 11);

  if d2 >= 10 then
    d2:=0;

  calculado := IntToStr(d1) + IntToStr(d2);
  digito := cnpj[13] + cnpj[14];
  Result := (calculado = digito);
end;

function ValidaCpf(cpf: string): boolean;

  function n(i: byte): integer;
  begin
    result := StrToInt(cpf[i]);
  end;

var
   d1, d2: Word;
   digito, calculado: string;
begin
  Result := False;
  if cpf = '' then
    Exit;
  if length(cpf) <> 11 then
    Exit;

  d1 := (n(9)*2) + (n(8)*3) + (n(7)*4) + (n(6)*5) + (n(5)*6) + (n(4)*7) + (n(3)*8) + (n(2)*9) + (n(1)*10);
  d1 := 11 - (d1 mod 11);

  if d1>=10 then
    d1 := 0;

  d2 := (d1*2) + (n(9)*3) + (n(8)*4) + (n(7)*5) + (n(6)*6) + (n(5)*7) + (n(4)*8) + (n(3)*9) + (n(2)*10) + (n(1)*11);
  d2 := 11 - (d2 mod 11);

  if d2>=10 then
    d2 := 0;

  calculado := inttostr(d1) + inttostr(d2);
  digito := cpf[10] + cpf[11];

  Result := calculado=digito;
end;

end.
