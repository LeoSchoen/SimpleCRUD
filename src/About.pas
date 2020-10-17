unit About;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls;

type
  TFAbout = class(TForm)
    GroupBox1: TGroupBox;
    imgSimpleCRUD: TImage;
    tbSimpleCRUD: TLabel;
    lbByLeandroSchoen: TLabel;
    btFechar: TButton;
    mmSobre: TMemo;
    procedure btFecharClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FAbout: TFAbout;

implementation

{$R *.dfm}

procedure TFAbout.btFecharClick(Sender: TObject);
begin
  Close;
end;

end.
