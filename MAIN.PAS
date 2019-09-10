unit main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Buttons, ImgList, Grids;

type
  TfrmMain = class(TForm)
    cmd1: TSpeedButton;
    cmd2: TSpeedButton;
    cmd3: TSpeedButton;
    cmd4: TSpeedButton;
    cmd5: TSpeedButton;
    cmd6: TSpeedButton;
    lbl1: TStaticText;
    lbl2: TStaticText;
    lbl3: TStaticText;
    lbl4: TStaticText;
    lbl5: TStaticText;
    lbl6: TStaticText;
    cmdDarSokak: TSpeedButton;
    cmdGenisSokak: TSpeedButton;
    cmdDoluEv: TSpeedButton;
    cmd3Turdes: TSpeedButton;
    cmd4Turdes: TSpeedButton;
    cmdYahtzee: TSpeedButton;
    lblDarSokak: TStaticText;
    lblGenisSokak: TStaticText;
    lblDoluEv: TStaticText;
    lbl3Turdes: TStaticText;
    lbl4Turdes: TStaticText;
    lblYahtzee: TStaticText;
    cmdSans: TSpeedButton;
    lblSans: TStaticText;
    StaticText16: TStaticText;
    StaticText17: TStaticText;
    StaticText18: TStaticText;
    imgZar1: TImage;
    imgZar2: TImage;
    imgZar3: TImage;
    imgZar4: TImage;
    imgZar5: TImage;
    cmdSalla: TSpeedButton;
    imgZarlar: TImageList;
    lblZarSay: TLabel;
    lblKalsin1: TLabel;
    lblKalsin2: TLabel;
    lblKalsin3: TLabel;
    lblKalsin4: TLabel;
    lblKalsin5: TLabel;
    sgMain: TStringGrid;
    chkAcemiyim: TCheckBox;
    tmrZarlar: TTimer;
    frmMain: TBitBtn;
    lblOyuncu1: TLabel;
    Bevel1: TBevel;
    lblOyuncu2: TLabel;
    Bevel2: TBevel;
    lblOyuncu3: TLabel;
    Bevel3: TBevel;
    procedure cmdSallaClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure cmdSpesyalClick(Sender: TObject);
    procedure imgZarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure chkAcemiyimClick(Sender: TObject);
    procedure tmrZarlarTimer(Sender: TObject);
    procedure frmMainClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    ZarAt     :Boolean;
    zarAnim   :Integer;
    zarlar    :array[1..5] of integer;
    iZarSay   :Integer;
    OyuncuSay :Integer;
    Siradaki  :Integer;

    Tablo   :array [1..3] of array[1..16] of integer;

    function TurdesSay(hane: Integer): Integer;
    function ZarlarToplam: Integer;
    function EnCokBitisik: Integer;
    function DoluEv: Integer;
    function RakamTop(hane: Integer): Integer;
    procedure Yazdirilabilirler;
    procedure TabloYaz;
    procedure YeniOyun;
    procedure ButonlarDiz;
  end;

const
  _birler =1;
  _ikiler =2;
  _ucler  =3;
  _dortler=4;
  _besler =5;
  _altilar=6;
  _araTop =7;
  _bonus  =8;
  _3Turdes=9;
  _4Turdes=10;
  _doluEv =11;
  _darS   =12;
  _genisS =13;
  _yahtzee=14;
  _sans   =15;
  _toplam =16;

var
  frmMain: TfrmMain;

implementation

uses oyuncular, about;

{$R *.dfm}

procedure TfrmMain.cmdSallaClick(Sender: TObject);
  var
    i   :Integer;
begin
  inc(iZarSay);
  ZarAt := False;

//  iZarSay:=1;

  lblZarSay.Caption := IntToStr(iZarSay);

  cmdSalla.Enabled := False;
  tmrZarlar.Enabled:= True;

end;

procedure TfrmMain.FormCreate(Sender: TObject);
begin
  Randomize;
end;

procedure TfrmMain.cmdSpesyalClick(Sender: TObject);
begin
  if ZarAt then begin
    ShowMessage('Eli yazdýrdýnýz, tekrar zarlarý atýn');
    exit;
  end;

  ZarAt := True;
  if sender=cmd1 then Tablo[Siradaki, _birler]:= RakamTop(1)
  else if sender=cmd2 then Tablo[Siradaki, _ikiler]:= RakamTop(2)
  else if sender=cmd3 then Tablo[Siradaki, _ucler]:= RakamTop(3)
  else if sender=cmd4 then Tablo[Siradaki, _dortler]:= RakamTop(4)
  else if sender=cmd5 then Tablo[Siradaki, _besler]:= RakamTop(5)
  else if sender=cmd6 then Tablo[Siradaki, _altilar]:= RakamTop(6);


  //3 Turdes, Zarlarin toplami
  if sender=cmd3Turdes then begin
    if TurdesSay(3)>=3 then
      Tablo[Siradaki, _3Turdes] := ZarlarToplam
    else
      Tablo[Siradaki, _3Turdes] := 0;

  end;


  //4 Turdes, Zarlarin toplami
  if sender=cmd4Turdes then begin
    if TurdesSay(4)>=4 then
      Tablo[Siradaki, _4Turdes] := ZarlarToplam
    else
      Tablo[Siradaki, _4Turdes] := 0;

  end;


  //Dolu ev, 25 puan
  if sender=cmdDoluEv then
    Tablo[Siradaki, _DoluEv] := DoluEv;


  //Dar sokak, 30 puan
  if sender=cmdDarSokak then begin
    if EnCokBitisik>=4 then
      Tablo[Siradaki, _DarS] := 30
    else
      Tablo[Siradaki, _DarS] := 0;
  end;


  //Genis sokak, 40 puan
  if sender=cmdGenisSokak then begin
    if EnCokBitisik=5 then
      Tablo[Siradaki, _GenisS] := 40
    else
      Tablo[Siradaki, _GenisS] := 0;
  end;


  //5 Turdes Yahtzee, 50 puan
  if sender=cmdYahtzee then begin
    if TurdesSay(5)>=5 then
      Tablo[Siradaki, _Yahtzee] := 50
    else
      Tablo[Siradaki, _Yahtzee] := 0;
  end;


  //Sans, Zarlarin Toplami
  if sender=cmdSans then begin
    Tablo[Siradaki, _Sans] := ZarlarToplam;
  end;

//  (sender as TSpeedbutton).Enabled := False;

  lblKalsin1.Visible := False;
  lblKalsin2.Visible := False;
  lblKalsin3.Visible := False;
  lblKalsin4.Visible := False;
  lblKalsin5.Visible := False;

  TabloYaz;

  if Siradaki>=OyuncuSay then
    Siradaki:=1
  else
    inc(Siradaki);

  ButonlarDiz;

  lblOyuncu1.Transparent := Siradaki<>1;
  lblOyuncu2.Transparent := Siradaki<>2;
  lblOyuncu3.Transparent := Siradaki<>3;

  iZarSay:=0;
  cmdSalla.Enabled := True;
  lblZarSay.Caption := 'Tekrar zar atin';
end;

function TfrmMain.TurdesSay(hane: Integer): Integer;
  var
    i, z    :Integer;
    say     :Integer;
begin
  result := 0;

  for z := 1 to 6 do
  begin

    say := 0;

    for i := 1 to 5 do
      if zarlar[i]=z then
        inc(say);


    if say>=hane then result:=say;

  end;

end;

function TfrmMain.ZarlarToplam: Integer;
  var
    i     :Integer;
begin
  result := 0;

  for i := 1 to 5 do
    inc(result, zarlar[i]);
end;

procedure TfrmMain.imgZarClick(Sender: TObject);
begin
  //ilk el zar tutma olmaz
  if iZarSay=0 then exit;

  if Sender=imgZar1 then lblKalsin1.Visible := not lblKalsin1.Visible;
  if Sender=imgZar2 then lblKalsin2.Visible := not lblKalsin2.Visible;
  if Sender=imgZar3 then lblKalsin3.Visible := not lblKalsin3.Visible;
  if Sender=imgZar4 then lblKalsin4.Visible := not lblKalsin4.Visible;
  if Sender=imgZar5 then lblKalsin5.Visible := not lblKalsin5.Visible;
end;

function TfrmMain.EnCokBitisik: integer;
  var
    i     :Integer;
    say   :Integer;
    s     :array[1..6]of char;
begin
  say    :=0;
  result :=0;

  s:='------';
  for i := 1 to 5 do
    s[(zarlar[i])]:='+';
{
    -++++-
    --++++
    ++++-+
    +-++++
}
  //en cok bitisik zarlar toplami=resume
  for i := 1 to 6 do begin
    if s[i]='+' then inc(say)
    else say:=0;

    if say>result then
      result:=say;
  end;

end;

function TfrmMain.DoluEv: Integer;
  var
    i     :Integer;
    asay,
    adeg,
    bsay,
    bdeg  :Integer;
begin

  result := 0;//False;
  aSay :=1;
  bSay :=0;

  aDeg :=zarlar[1];
  bDeg :=0;

  for i := 2 to 5 do
  begin
    if (bSay=0)and(aDeg<>zarlar[i])then
      bDeg:=zarlar[i];

    if zarlar[i]=aDeg then
      inc(aSay);

    if zarlar[i]=bDeg then
      inc(bSay);
  end;

  //iki turun toplamlari 5 ve farklari 3 degilse (4 1 gibi)
  if (aSay+bSay=5)and(abs(aSay-bSay)<>3) then
      result:=25;//True;
end;

function TfrmMain.RakamTop(hane: Integer): Integer;
  var
  i     :Integer;
begin
  result := 0;
  for i := 1 to 5 do
    if zarlar[i]=hane then
      inc(result, hane);
end;

procedure TfrmMain.Yazdirilabilirler;
begin
  if not chkAcemiyim.Checked then
    exit;

  lbl1.Caption := IntToStr(RakamTop(1));
  lbl2.Caption := IntToStr(RakamTop(2));
  lbl3.Caption := IntToStr(RakamTop(3));
  lbl4.Caption := IntToStr(RakamTop(4));
  lbl5.Caption := IntToStr(RakamTop(5));
  lbl6.Caption := IntToStr(RakamTop(6));

  if TurdesSay(3)>=3 then
    lbl3Turdes.Caption := IntToStr(ZarlarToplam)
  else
    lbl3Turdes.Caption := '0';

  if TurdesSay(4)>=4 then
    lbl4Turdes.Caption := IntToStr(ZarlarToplam)
  else
    lbl4Turdes.Caption := '0';

  lblDoluEv.Caption := IntToStr(DoluEv);

  if EnCokBitisik>=4 then
    lblDarSokak.Caption := '30'
  else
    lblDarSokak.Caption := '0';

  if EnCokBitisik=5 then
    lblGenisSokak.Caption := '40'
  else
    lblGenisSokak.Caption := '0';

  if TurdesSay(5)>=5 then
    lblYahtzee.Caption := '50'
  else
    lblYahtzee.Caption := '0';

  lblSans.Caption := IntToStr(ZarlarToplam);

end;

procedure TfrmMain.FormShow(Sender: TObject);
  var
    grRect:TGridRect;
begin
  grRect.Top := -1;
  grRect.Left := -1;
  grRect.Right := -1;
  grRect.Bottom := -1;
  sgMain.Selection := grRect;

  YeniOyun;

end;

procedure TfrmMain.TabloYaz;
  var
    r, c    :Integer;
    bonus,
    araTop,
    Toplam  :Integer;
begin
  araTop :=0;
  Toplam :=0;

  c := Siradaki;

    for r := 1 to 16-1 do
    begin

      if (r<=6)and(Tablo[c][r]<>-1) then
        inc(araTop, Tablo[c][r]);

      if araTop>=63 then
        Tablo[c][_bonus] := 35;

      if (Tablo[c][r]<>-1) then
        inc(toplam, Tablo[c][r]);


      if Tablo[c][r]=-1 then
        sgMain.Cells[c-1, r-1]:=''
      else
        sgMain.Cells[c-1, r-1]:=inttostr(Tablo[c][r]);

    end;

//  Tablo[c][_araTop] := araTop;
//  Tablo[c][_toplam] := Toplam;
    sgMain.Cells[c-1, _aratop-1]:=inttostr(araTop);
    sgMain.Cells[c-1, _toplam-1]:=inttostr(Toplam);

end;


procedure TfrmMain.chkAcemiyimClick(Sender: TObject);
begin
  if chkAcemiyim.Checked then
    Yazdirilabilirler;

  lbl1.Visible := chkAcemiyim.Checked;
  lbl2.Visible := chkAcemiyim.Checked;
  lbl3.Visible := chkAcemiyim.Checked;
  lbl4.Visible := chkAcemiyim.Checked;
  lbl5.Visible := chkAcemiyim.Checked;
  lbl6.Visible := chkAcemiyim.Checked;

  lbl3Turdes.Visible := chkAcemiyim.Checked;
  lbl4Turdes.Visible := chkAcemiyim.Checked;
  lblDoluEv.Visible := chkAcemiyim.Checked;
  lblDarSokak.Visible := chkAcemiyim.Checked;
  lblGenisSokak.Visible := chkAcemiyim.Checked;
  lblYahtzee.Visible := chkAcemiyim.Checked;
  lblSans.Visible := chkAcemiyim.Checked;

end;

procedure TfrmMain.tmrZarlarTimer(Sender: TObject);
begin
  if not lblKalsin1.Visible then zarlar[1]:=random(6)+1;
  if not lblKalsin2.Visible then zarlar[2]:=random(6)+1;
  if not lblKalsin3.Visible then zarlar[3]:=random(6)+1;
  if not lblKalsin4.Visible then zarlar[4]:=random(6)+1;
  if not lblKalsin5.Visible then zarlar[5]:=random(6)+1;

  imgZarlar.GetBitmap(zarlar[1]-1, imgZar1.Picture.Bitmap);
  imgZarlar.GetBitmap(zarlar[2]-1, imgZar2.Picture.Bitmap);
  imgZarlar.GetBitmap(zarlar[3]-1, imgZar3.Picture.Bitmap);
  imgZarlar.GetBitmap(zarlar[4]-1, imgZar4.Picture.Bitmap);
  imgZarlar.GetBitmap(zarlar[5]-1, imgZar5.Picture.Bitmap);
  imgZar1.Refresh;
  imgZar2.Refresh;
  imgZar3.Refresh;
  imgZar4.Refresh;
  imgZar5.Refresh;

  inc(zarAnim);
  if zarAnim>10 then begin
    zarAnim:=0;
    tmrZarlar.Enabled:= False;
    if iZarSay<3 then
    cmdSalla.Enabled := True;
    Yazdirilabilirler;
  end;
end;

procedure TfrmMain.frmMainClick(Sender: TObject);
begin
  frmAbout.ShowModal;
end;

procedure TfrmMain.YeniOyun;
  var
    o,p   :integer;

begin
  for o := 1 to 3 do
    for p := 1 to 16 do
      Tablo[o][p]:=-1;

  frmOyuncular.ShowModal;

  ZarAt:=True;
  Siradaki:=1;
  OyuncuSay :=1;
  lblOyuncu1.Caption := frmOyuncular.txtOyuncu1.Text;
  lblOyuncu2.Caption := frmOyuncular.txtOyuncu2.Text;
  lblOyuncu3.Caption := frmOyuncular.txtOyuncu3.Text;

  if frmOyuncular.txtOyuncu2.Text<>'' then
    OyuncuSay :=2;

  if frmOyuncular.txtOyuncu3.Text<>'' then
    OyuncuSay :=3;

end;

procedure TfrmMain.ButonlarDiz;
begin
  //Butonlarin dizilimi
  cmd1.Enabled := (Tablo[Siradaki, _birler]) = -1;
  cmd2.Enabled := (Tablo[Siradaki, _ikiler]) = -1;
  cmd3.Enabled := (Tablo[Siradaki, _ucler]) = -1;
  cmd4.Enabled := (Tablo[Siradaki, _dortler]) = -1;
  cmd5.Enabled := (Tablo[Siradaki, _besler]) = -1;
  cmd6.Enabled := (Tablo[Siradaki, _altilar]) = -1;

  cmd3Turdes.Enabled  := (Tablo[Siradaki, _3Turdes]) = -1;
  cmd4Turdes.Enabled  := (Tablo[Siradaki, _4Turdes]) = -1;
  cmdDoluEv.Enabled   := (Tablo[Siradaki, _DoluEv]) = -1;
  cmdDarSokak.Enabled := (Tablo[Siradaki, _DarS]) = -1;
  cmdGenisSokak.Enabled := (Tablo[Siradaki, _GenisS]) = -1;
  cmdYahtzee.Enabled  := (Tablo[Siradaki, _Yahtzee]) = -1;
  cmdSans.Enabled     := (Tablo[Siradaki, _Sans]) = -1;
end;

end.
