unit ConversionUtils;

interface

uses
  SysUtils, StrUtils, Variants, Classes, MyStrUtils;

function AsInteger(value: string): Integer;
function AsFloat(value: string): Extended;

implementation

function AsInteger(value: string): Integer;
begin
  result := StrToInt(IfEmpty(value, '0'))
end;

function AsFloat(value: string): Extended;
begin
  result := StrToFloat(IfEmpty(value, '0'))
end;

end.
