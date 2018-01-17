object frmChooseVNum: TfrmChooseVNum
  Left = 321
  Top = 176
  BorderStyle = bsDialog
  Caption = 'Choose VNUM'
  ClientHeight = 114
  ClientWidth = 166
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poOwnerFormCenter
  PrintScale = poNone
  Scaled = False
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 8
    Width = 153
    Height = 39
    Caption = 
      'Choose wether VNum you prefer for the entity you are going to cr' +
      'eate.'
    WordWrap = True
  end
  object btnFirst: TButton
    Left = 8
    Top = 56
    Width = 75
    Height = 25
    Caption = 'btnFirst'
    TabOrder = 0
    OnClick = btnFirstClick
  end
  object btnLast: TButton
    Left = 88
    Top = 56
    Width = 75
    Height = 25
    Caption = 'btnLast'
    TabOrder = 1
    OnClick = btnLastClick
  end
  object BitBtn1: TBitBtn
    Left = 8
    Top = 88
    Width = 153
    Height = 25
    TabOrder = 2
    Kind = bkAbort
  end
end
