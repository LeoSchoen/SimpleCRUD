unit ConsultaSql;

interface

uses
  SysUtils, Variants, Classes;

type
  TLayoutQuery = class
  private
    FQuery: String;
    FConditions: String;
    FOrderBy: String;
    function GetSqlQuery: string;
  public
    constructor Create; overload;
  published
    property Query: string read FQuery write FQuery;
    property Conditions: string read FConditions write FConditions;
    property OrderBy: string read FOrderBy write FOrderBy;
    property SqlQuery: string read GetSqlQuery;
  end;

implementation

{ TLayoutQuery }

constructor TLayoutQuery.Create;
begin
  FQuery := '';
  FConditions := '';
  FOrderBy := '';
end;

function TLayoutQuery.GetSqlQuery: string;
var sqlQuery: String;
begin
  sqlQuery := FQuery;
  if FConditions <> '' then
    sqlQuery := sqlQuery + ' WHERE ' + FConditions;
  if FOrderBy <> '' then
    sqlQuery := sqlQuery + ' ORDER BY ' + FOrderBy;
  result := sqlQuery;
end;

end.
