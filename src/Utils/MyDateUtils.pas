unit MyDateUtils;

interface

uses
  SysUtils, DateUtils, Variants, Classes;

const
  EmptyStrDate = '  /  /    ';

function MaskDate(date: TDateTime): string;
function AsStrDate(date: string): string; overload;
function AsStrDate(date: TDateTime): string; overload;
function PrimeiroDiaMes(data: TDateTime): TDateTime;
function UltimoDiaMes(data: TDateTime): TDateTime;

implementation

function MaskDate(date: TDateTime): string;
var strDate: string;
begin
  DateTimeToString(strDate, 'dd/mm/yyyy', date);
  Result := strDate;
end;

function AsStrDate(date: string): string;
begin
  Result := format('%s-%s-%s',
      [Copy(date, 4, 2), Copy(date, 1, 2), Copy(date, 7, 4)])
end;

function AsStrDate(date: TDateTime): string;
begin
  Result := FormatDateTime('yyyy-mm-dd', date)
end;

function PrimeiroDiaMes(data: TDateTime): TDateTime;
var ano, mes, dia : word;
begin
  DecodeDate(Date, ano, mes, dia);
  Result := EncodeDate(ano, mes, 1);
end;

function UltimoDiaMes(data: TDateTime): TDateTime;
var ano, mes, dia : word;
begin
  DecodeDate(data, ano, mes, dia);
  Result := EndOfAMonth(ano, mes);
end;

end.
