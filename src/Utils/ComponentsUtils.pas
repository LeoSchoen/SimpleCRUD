unit ComponentsUtils;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, Buttons, StdCtrls;

procedure DoExitPadrao(Sender: TObject);

implementation

procedure DoExitPadrao(Sender: TObject);
begin
  if Sender is TComboBox then
    TComboBox(Sender).Font.Style := [];
  if Sender is TEdit then
    TEdit(Sender).Font.Style := [];
end;


end.
