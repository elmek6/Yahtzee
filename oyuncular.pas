unit oyuncular;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons;

type
  TfrmOyuncular = class(TForm)
    txtOyuncu1: TEdit;
    lblOyuncu1: TLabel;
    txtOyuncu2: TEdit;
    lblOyuncu2: TLabel;
    txtOyuncu3: TEdit;
    lblOyuncu3: TLabel;
    BitBtn1: TBitBtn;
    Label1: TLabel;
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmOyuncular: TfrmOyuncular;

implementation

{$R *.dfm}

procedure TfrmOyuncular.BitBtn1Click(Sender: TObject);
begin
  close;
end;

end.
