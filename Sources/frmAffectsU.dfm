object frmAffects: TfrmAffects
  Left = 286
  Top = 206
  BorderStyle = bsToolWindow
  Caption = 'Affect'
  ClientHeight = 279
  ClientWidth = 497
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
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object cbAffect: TComboBox
    Left = 0
    Top = 40
    Width = 497
    Height = 21
    Style = csDropDownList
    ItemHeight = 13
    Sorted = True
    TabOrder = 0
    OnChange = cbAffectChange
  end
  object pcEditApply: TPageControl
    Left = 0
    Top = 64
    Width = 497
    Height = 177
    ActivePage = tsText
    TabOrder = 1
    object tsText: TTabSheet
      Caption = 'tsText'
      TabVisible = False
      object lblMultiply: TLabel
        Left = 0
        Top = 8
        Width = 43
        Height = 13
        Caption = 'Multipli di'
      end
      object JvVEDirect: TJvValidateEdit
        Left = 80
        Top = 0
        Width = 121
        Height = 21
        CriticalPoints.ColorAbove = clRed
        CriticalPoints.MaxValueIncluded = False
        CriticalPoints.MinValueIncluded = False
        TabOrder = 0
      end
    end
    object tsSex: TTabSheet
      Caption = 'tsSex'
      ImageIndex = 1
      TabVisible = False
      object rgGender: TRadioGroup
        Left = 0
        Top = 0
        Width = 185
        Height = 105
        Caption = 'Sesso'
        TabOrder = 0
      end
    end
    object tsDMGFlags: TTabSheet
      Caption = 'tsDMGFlags'
      ImageIndex = 2
      TabVisible = False
      object gbDamageType: TGroupBox
        Left = 0
        Top = 0
        Width = 489
        Height = 167
        Align = alClient
        Caption = 'Tipo di danno'
        TabOrder = 0
      end
    end
    object tsSpellAffects: TTabSheet
      Caption = 'tsSpellAffects'
      ImageIndex = 3
      TabVisible = False
      object gbSpellAffects: TGroupBox
        Left = 0
        Top = 0
        Width = 489
        Height = 167
        Align = alClient
        Caption = 'Incantesimi'
        TabOrder = 0
      end
    end
    object tsWPSpells: TTabSheet
      Caption = 'tsWPSpells'
      ImageIndex = 4
      TabVisible = False
      object cbWPSpell: TComboBox
        Left = 0
        Top = 0
        Width = 265
        Height = 21
        Style = csDropDownList
        ItemHeight = 0
        Sorted = True
        TabOrder = 0
      end
    end
    object tsEatSpells: TTabSheet
      Caption = 'tsEatSpells'
      ImageIndex = 5
      TabVisible = False
      object cbEatSpell: TComboBox
        Left = 0
        Top = 0
        Width = 265
        Height = 21
        Style = csDropDownList
        ItemHeight = 0
        Sorted = True
        TabOrder = 0
      end
    end
    object tsRaceSlayer: TTabSheet
      Caption = 'Race Slayer'
      ImageIndex = 6
      TabVisible = False
      object cbSlayRace: TComboBox
        Left = 0
        Top = 0
        Width = 193
        Height = 21
        Style = csDropDownList
        ItemHeight = 0
        Sorted = True
        TabOrder = 0
      end
    end
    object tsAlign: TTabSheet
      Caption = 'Align slayer'
      ImageIndex = 7
      TabVisible = False
      object gbAlign: TGroupBox
        Left = 0
        Top = 0
        Width = 489
        Height = 167
        Align = alClient
        Caption = ' Allineamento verso cui '#233' efficace '
        TabOrder = 0
      end
    end
  end
  object bbOk: TBitBtn
    Left = 0
    Top = 248
    Width = 73
    Height = 25
    Enabled = False
    TabOrder = 2
    Kind = bkOK
  end
  object BitBtn2: TBitBtn
    Left = 424
    Top = 248
    Width = 73
    Height = 25
    TabOrder = 3
    Kind = bkCancel
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 497
    Height = 41
    BevelOuter = bvLowered
    BevelWidth = 2
    BorderWidth = 1
    Color = clInfoBk
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clInfoText
    Font.Height = -12
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 4
    object lblItemGroups: TLabel
      Left = 3
      Top = 3
      Width = 491
      Height = 35
      Align = alClient
      AutoSize = False
      Caption = 'Item groups: [Undefined]'
      Color = clInfoBk
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clInfoText
      Font.Height = -12
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentColor = False
      ParentFont = False
      WordWrap = True
    end
  end
end
