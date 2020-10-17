unit URLUtils;

interface

uses
  SysUtils, Variants, Classes;

function URLDecode(const s: String): String;

implementation

function URLDecode(const s: String): String;
var
  sAnsi: String;
  sUtf8: String;
  sWide: WideString;
  i, len: Cardinal;
  ESC: string[2];
  CharCode: integer;
  c: char;
begin
  sAnsi := PChar(s);
  SetLength(sUtf8, Length(sAnsi));
  i := 1;
  len := 1;
  while (i <= Cardinal(Length(sAnsi))) do
  begin
    if (sAnsi[i] <> '%') then
    begin
      if (sAnsi[i] = '+')
      then c := ' '
      else c := sAnsi[i];
      sUtf8[len] := c;
      Inc(len);
    end
    else
    begin
      Inc(i);
      ESC := Copy(sAnsi, i, 2);
      Inc(i, 1);
      try
        CharCode := StrToInt('$' + ESC);
        c := Char(CharCode);
        sUtf8[len] := c;
        Inc(len);
      except
      end;
    end;
    Inc(i);
  end;
  Dec(len);
  SetLength(sUtf8, len);

  sWide := UTF8Decode(sUtf8);
  len := Length(sWide);

  Result := sWide;
end;

end.
