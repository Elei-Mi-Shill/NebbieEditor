object fraSpecial: TfraSpecial
  Left = 0
  Top = 0
  Width = 305
  Height = 131
  AutoSize = True
  TabOrder = 0
  object cbSpecial: TComboBox
    Left = 0
    Top = 0
    Width = 305
    Height = 21
    Style = csDropDownList
    ItemHeight = 13
    Sorted = True
    TabOrder = 0
    OnChange = cbSpecialChange
    OnKeyDown = cbSpecialKeyDown
  end
  object gbParams: TGroupBox
    Left = 0
    Top = 42
    Width = 305
    Height = 89
    Caption = 'Parametri'
    TabOrder = 1
    object lbParams: TListBox
      Left = 8
      Top = 16
      Width = 289
      Height = 65
      ItemHeight = 13
      TabOrder = 0
      OnDblClick = lbParamsDblClick
    end
  end
  object stProcDesc: TStaticText
    Left = 0
    Top = 24
    Width = 59
    Height = 17
    BevelKind = bkSoft
    Caption = 'stProcDesc'
    Color = clInfoBk
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clInfoText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentColor = False
    ParentFont = False
    TabOrder = 2
  end
end
