object frmChooseEntityType: TfrmChooseEntityType
  Left = 192
  Top = 107
  Width = 214
  Height = 151
  Caption = 'Entit'#224' da importare'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object rgEntityTypes: TRadioGroup
    Left = 0
    Top = 0
    Width = 204
    Height = 89
    Caption = 'Tipi di entit'#224
    Items.Strings = (
      'Stanze'
      'Oggetti'
      'Mob')
    TabOrder = 0
    OnClick = rgEntityTypesClick
  end
  object bbOk: TBitBtn
    Left = 0
    Top = 96
    Width = 75
    Height = 24
    Enabled = False
    TabOrder = 1
    Kind = bkOK
  end
  object BitBtn1: TBitBtn
    Left = 128
    Top = 96
    Width = 75
    Height = 24
    TabOrder = 2
    Kind = bkAbort
  end
end
