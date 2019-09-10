object frmOyuncular: TfrmOyuncular
  Left = 299
  Top = 223
  BorderStyle = bsDialog
  Caption = 'Yahtzee'
  ClientHeight = 180
  ClientWidth = 220
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
  object lblOyuncu1: TLabel
    Left = 16
    Top = 52
    Width = 46
    Height = 13
    Caption = 'Oyuncu 1'
  end
  object lblOyuncu2: TLabel
    Left = 16
    Top = 76
    Width = 46
    Height = 13
    Caption = 'Oyuncu 2'
  end
  object lblOyuncu3: TLabel
    Left = 16
    Top = 100
    Width = 46
    Height = 13
    Caption = 'Oyuncu 3'
  end
  object Label1: TLabel
    Left = 16
    Top = 16
    Width = 182
    Height = 13
    Caption = 'Oynayacak oyuncular'#305'n isimlerini yaz'#305'n.'
  end
  object txtOyuncu1: TEdit
    Left = 80
    Top = 48
    Width = 121
    Height = 21
    MaxLength = 10
    TabOrder = 0
    Text = 'Ben'
  end
  object txtOyuncu2: TEdit
    Left = 80
    Top = 72
    Width = 121
    Height = 21
    MaxLength = 10
    TabOrder = 1
  end
  object txtOyuncu3: TEdit
    Left = 80
    Top = 96
    Width = 121
    Height = 21
    MaxLength = 10
    TabOrder = 2
  end
  object BitBtn1: TBitBtn
    Left = 52
    Top = 136
    Width = 117
    Height = 33
    Caption = 'BA'#350'LAT'
    Default = True
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 3
    OnClick = BitBtn1Click
  end
end
