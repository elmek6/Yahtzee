object frmAbout: TfrmAbout
  Left = 271
  Top = 130
  BorderStyle = bsDialog
  Caption = 'Yahtzee Hakk'#305'nda'
  ClientHeight = 321
  ClientWidth = 417
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Memo1: TMemo
    Left = 8
    Top = 24
    Width = 401
    Height = 253
    Lines.Strings = (
      
        'Bu program 02 Ekim 2006 tarihinde '#214'v'#252'n'#231' Mete taraf'#305'ndan yaz'#305'lm'#305#351 +
        't'#305'r.'
      
        'Program'#305'n orijinalini ve kodlar'#305'n'#305' (Delphi 6) a'#351'a'#287#305'daki adresler' +
        'den temin '
      'edeblilrsiniz.'
      ''
      'www.verikenti.net'
      'www.bilgi.ofisi.com'
      'email: elmek6@yahoo.com, elmek6@gmail.com'
      ''
      
        'Yahtzee '#252'lkemizde yayg'#305'n olmasa da yurt d'#305#351#305'nda sevilen bir zar ' +
        'oyunudur.'
      
        'Oyunu en fazla 3 ki'#351'i oynayabilirsiniz. Kutucuklara isim yazman'#305 +
        'z yeterlidir.'
      
        'Oyunda ama'#231' 5 zar ile ilgili kutucuklardan en y'#252'ksek puan'#305' almak' +
        '.'
      ''
      'Her kutucu'#287'a yazmak i'#231'in 3 kere zarlar'#305' atma hakk'#305' vard'#305'r.'
      
        'Bu s'#305'rada istedi'#287'iniz zarlar'#305' tutup sadece di'#287'erlerini atabilirs' +
        'iniz.'
      
        'Zar atma hakk'#305' bitti'#287'inde mecbur olarak el bir kutuya yazd'#305'r'#305'l'#305'r' +
        '.'
      ''
      
        'Daha fazla bilgiyi Acemiyim kutucu'#287'unu se'#231'erek ve ilgili tu'#351'lar'#305 +
        'n '#252'zerinde fare '
      'imlecini bekleterek '#246'rnekler ile g'#246'rebilrisiniz.'
      ''
      
        'Sitemizde bir'#231'ok k'#252#231#252'k oyun mevcuttur g'#246'r'#252#351', istek ve '#351'ikayetler' +
        'inizi belirtirseniz '
      'seviniriz. ('#304'hale, Tetris, Q, ...)'
      ''
      #304'yi e'#287'lenceler')
    ReadOnly = True
    ScrollBars = ssVertical
    TabOrder = 0
  end
  object BitBtn1: TBitBtn
    Left = 332
    Top = 288
    Width = 75
    Height = 25
    Caption = 'Kapat'
    TabOrder = 1
    OnClick = BitBtn1Click
  end
end
