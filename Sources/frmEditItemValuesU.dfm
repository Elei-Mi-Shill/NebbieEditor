object frmEditItemValues: TfrmEditItemValues
  Left = 529
  Top = 294
  AutoSize = True
  BorderStyle = bsToolWindow
  Caption = 'Imposta i valori dell'#39'oggetto'
  ClientHeight = 289
  ClientWidth = 291
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
  PixelsPerInch = 96
  TextHeight = 13
  object pcEditMasks: TPageControl
    Left = 0
    Top = 0
    Width = 289
    Height = 257
    ActivePage = tsArmor
    MultiLine = True
    TabOrder = 0
    object tsUnknown: TTabSheet
      Caption = 'tsUnknown'
      TabVisible = False
    end
    object tsLightSource: TTabSheet
      Caption = 'tsLightSource'
      ImageIndex = 1
      TabVisible = False
      object lblDuration: TLabel
        Left = 0
        Top = 8
        Width = 58
        Height = 13
        Caption = 'Durata (Ore)'
      end
      object cbEternal: TCheckBox
        Left = 0
        Top = 24
        Width = 57
        Height = 17
        Caption = 'Eterna'
        TabOrder = 0
        OnClick = cbEternalClick
      end
      object JvVELightDuration: TJvValidateEdit
        Left = 64
        Top = 0
        Width = 33
        Height = 21
        CriticalPoints.MaxValueIncluded = False
        CriticalPoints.MinValueIncluded = False
        HasMinValue = True
        TabOrder = 1
      end
    end
    object tsSUSpellcaster: TTabSheet
      Caption = 'tsSUSpellcaster'
      ImageIndex = 2
      TabVisible = False
      object Label1: TLabel
        Left = 0
        Top = 8
        Width = 30
        Height = 13
        Caption = 'Livello'
      end
      object Label2: TLabel
        Left = 0
        Top = 32
        Width = 85
        Height = 13
        Caption = 'Primo incantesimo'
      end
      object Label3: TLabel
        Left = 0
        Top = 56
        Width = 102
        Height = 13
        Caption = 'Secondo incantesimo'
      end
      object Label4: TLabel
        Left = 0
        Top = 80
        Width = 86
        Height = 13
        Caption = 'Terzo incantesimo'
      end
      object JvVESUSpellLevel: TJvValidateEdit
        Left = 224
        Top = 0
        Width = 33
        Height = 21
        CriticalPoints.MaxValueIncluded = False
        CriticalPoints.MinValueIncluded = False
        HasMinValue = True
        TabOrder = 0
        OnChange = TimerChechValues
        OnExit = tmrRefreshTimer
      end
      object cbSUSpell1: TComboBox
        Left = 112
        Top = 24
        Width = 145
        Height = 21
        Style = csDropDownList
        ItemHeight = 0
        Sorted = True
        TabOrder = 1
        OnChange = SUSCChangeSpell
      end
      object cbSUSpell2: TComboBox
        Left = 112
        Top = 48
        Width = 145
        Height = 21
        Style = csDropDownList
        ItemHeight = 0
        Sorted = True
        TabOrder = 2
        OnChange = SUSCChangeSpell
      end
      object cbSUSpell3: TComboBox
        Left = 112
        Top = 72
        Width = 145
        Height = 21
        Style = csDropDownList
        ItemHeight = 0
        Sorted = True
        TabOrder = 3
        OnChange = SUSCChangeSpell
      end
    end
    object tsMUSpellcaster: TTabSheet
      Caption = 'tsMUSpellcaster'
      ImageIndex = 3
      TabVisible = False
      object Label5: TLabel
        Left = 0
        Top = 8
        Width = 30
        Height = 13
        Caption = 'Livello'
      end
      object Label6: TLabel
        Left = 0
        Top = 80
        Width = 57
        Height = 13
        Caption = 'Incantesimo'
      end
      object Label7: TLabel
        Left = 0
        Top = 32
        Width = 129
        Height = 13
        Caption = 'Numero massimo di cariche'
      end
      object Label8: TLabel
        Left = 0
        Top = 56
        Width = 131
        Height = 13
        Caption = 'Numero di cariche rimanenti'
      end
      object JvVEMUSpellLevel: TJvValidateEdit
        Left = 176
        Top = 0
        Width = 33
        Height = 21
        CriticalPoints.MaxValueIncluded = False
        CriticalPoints.MinValueIncluded = False
        EditText = '1'
        HasMinValue = True
        MaxValue = 1.000000000000000000
        MinValue = 1.000000000000000000
        TabOrder = 0
        OnChange = TimerChechValues
        OnExit = tmrRefreshTimer
      end
      object cbMUSpell: TComboBox
        Left = 64
        Top = 72
        Width = 145
        Height = 21
        Style = csDropDownList
        ItemHeight = 0
        Sorted = True
        TabOrder = 3
        OnChange = MUSCChangeSpell
      end
      object JvVEMUMaxCharges: TJvValidateEdit
        Left = 176
        Top = 24
        Width = 33
        Height = 21
        CriticalPoints.MaxValueIncluded = False
        CriticalPoints.MinValueIncluded = False
        EditText = '1'
        HasMinValue = True
        MaxValue = 1.000000000000000000
        MinValue = 1.000000000000000000
        TabOrder = 1
      end
      object JvVEMUCurrentCharges: TJvValidateEdit
        Left = 176
        Top = 48
        Width = 33
        Height = 21
        CriticalPoints.MaxValueIncluded = False
        CriticalPoints.MinValueIncluded = False
        EditText = '1'
        HasMinValue = True
        MaxValue = 1.000000000000000000
        MinValue = 1.000000000000000000
        TabOrder = 2
      end
    end
    object tsWeapons: TTabSheet
      Caption = 'tsWeapons'
      ImageIndex = 4
      TabVisible = False
      object Label9: TLabel
        Left = 0
        Top = 8
        Width = 35
        Height = 13
        Caption = 'Danno:'
      end
      object Label10: TLabel
        Left = 60
        Top = 8
        Width = 6
        Height = 13
        Caption = 'd'
      end
      object Label11: TLabel
        Left = 0
        Top = 32
        Width = 65
        Height = 13
        Caption = 'Tipo di danno'
      end
      object JvVEWPNoDices: TJvValidateEdit
        Left = 40
        Top = 2
        Width = 19
        Height = 21
        CriticalPoints.MaxValueIncluded = False
        CriticalPoints.MinValueIncluded = False
        EditText = '1'
        HasMaxValue = True
        HasMinValue = True
        MaxValue = 3.000000000000000000
        MinValue = 1.000000000000000000
        TabOrder = 0
        OnChange = JvVEWPSizeDicesChange
      end
      object JvVEWPSizeDices: TJvValidateEdit
        Left = 70
        Top = 2
        Width = 22
        Height = 21
        CriticalPoints.MaxValueIncluded = False
        CriticalPoints.MinValueIncluded = False
        EditText = '1'
        HasMaxValue = True
        HasMinValue = True
        MaxValue = 12.000000000000000000
        MinValue = 1.000000000000000000
        TabOrder = 1
        OnChange = JvVEWPSizeDicesChange
      end
      object cbWPDamages: TComboBox
        Left = 72
        Top = 24
        Width = 177
        Height = 21
        ItemHeight = 0
        Sorted = True
        TabOrder = 2
      end
      object stType: TStaticText
        Left = 98
        Top = 2
        Width = 65
        Height = 19
        AutoSize = False
        BevelKind = bkSoft
        Caption = 'Minuscolo'
        Color = clInfoBk
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clInfoText
        Font.Height = -12
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentColor = False
        ParentFont = False
        TabOrder = 3
      end
      object stLevel: TStaticText
        Left = 169
        Top = 2
        Width = 79
        Height = 19
        AutoSize = False
        BevelKind = bkSoft
        Caption = 'Per principianti'
        Color = clInfoBk
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clInfoText
        Font.Height = -12
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentColor = False
        ParentFont = False
        TabOrder = 4
      end
    end
    object tsFireWeapons: TTabSheet
      Caption = 'tsFireWeapons'
      ImageIndex = 5
      TabVisible = False
      object Label12: TLabel
        Left = 0
        Top = 8
        Width = 80
        Height = 13
        Caption = 'Forza necessaria'
      end
      object Label13: TLabel
        Left = 0
        Top = 32
        Width = 112
        Height = 13
        Caption = 'Distanza massima di tiro'
      end
      object Label14: TLabel
        Left = 0
        Top = 56
        Width = 71
        Height = 13
        Caption = 'Bonus al range'
      end
      object Label15: TLabel
        Left = 0
        Top = 80
        Width = 74
        Height = 13
        Caption = 'Tipo di proiettile'
      end
      object JvVEFWStrength: TJvValidateEdit
        Left = 200
        Top = 0
        Width = 33
        Height = 21
        CriticalPoints.MaxValueIncluded = False
        CriticalPoints.MinValueIncluded = False
        HasMinValue = True
        TabOrder = 0
      end
      object JvVEFWMaxDistance: TJvValidateEdit
        Left = 200
        Top = 24
        Width = 33
        Height = 21
        CriticalPoints.MaxValueIncluded = False
        CriticalPoints.MinValueIncluded = False
        EditText = '1'
        HasMinValue = True
        MaxValue = 1.000000000000000000
        MinValue = 1.000000000000000000
        TabOrder = 1
      end
      object JvVEFWRangeBonus: TJvValidateEdit
        Left = 200
        Top = 48
        Width = 33
        Height = 21
        CriticalPoints.MaxValueIncluded = False
        CriticalPoints.MinValueIncluded = False
        HasMinValue = True
        TabOrder = 2
      end
      object cbFWWeaponType: TComboBox
        Left = 88
        Top = 72
        Width = 145
        Height = 21
        Style = csDropDownList
        ItemHeight = 0
        TabOrder = 3
      end
    end
    object tsMissiles: TTabSheet
      Caption = 'tsMissiles'
      ImageIndex = 6
      TabVisible = False
      object Label16: TLabel
        Left = 0
        Top = 8
        Width = 101
        Height = 13
        Caption = 'Percentuale di rottura'
      end
      object Label17: TLabel
        Left = 0
        Top = 32
        Width = 35
        Height = 13
        Caption = 'Danno:'
      end
      object Label18: TLabel
        Left = 192
        Top = 32
        Width = 6
        Height = 13
        Caption = 'd'
      end
      object Label19: TLabel
        Left = 0
        Top = 56
        Width = 74
        Height = 13
        Caption = 'Tipo di proiettile'
      end
      object JvVEMissPerc: TJvValidateEdit
        Left = 200
        Top = 0
        Width = 33
        Height = 21
        CriticalPoints.MaxValueIncluded = False
        CriticalPoints.MinValueIncluded = False
        HasMaxValue = True
        HasMinValue = True
        MaxValue = 100.000000000000000000
        TabOrder = 0
      end
      object JvVEMissNoDice: TJvValidateEdit
        Left = 152
        Top = 24
        Width = 33
        Height = 21
        CriticalPoints.MaxValueIncluded = False
        CriticalPoints.MinValueIncluded = False
        EditText = '1'
        HasMaxValue = True
        HasMinValue = True
        MaxValue = 3.000000000000000000
        MinValue = 1.000000000000000000
        TabOrder = 1
      end
      object JvVEMissSizeDice: TJvValidateEdit
        Left = 200
        Top = 24
        Width = 33
        Height = 21
        CriticalPoints.MaxValueIncluded = False
        CriticalPoints.MinValueIncluded = False
        EditText = '1'
        HasMaxValue = True
        HasMinValue = True
        MaxValue = 8.000000000000000000
        MinValue = 1.000000000000000000
        TabOrder = 2
      end
      object cbMissMissileType: TComboBox
        Left = 88
        Top = 48
        Width = 145
        Height = 21
        Style = csDropDownList
        ItemHeight = 0
        TabOrder = 3
      end
    end
    object tsArmor: TTabSheet
      Caption = 'tsArmor'
      ImageIndex = 7
      TabVisible = False
      object Label20: TLabel
        Left = 0
        Top = 8
        Width = 49
        Height = 13
        Caption = 'AC attuale'
      end
      object Label21: TLabel
        Left = 0
        Top = 32
        Width = 76
        Height = 13
        Caption = 'Tipo di armatura'
      end
      object cbARMORAC: TComboBox
        Left = 136
        Top = 0
        Width = 145
        Height = 21
        Style = csDropDownList
        ItemHeight = 13
        TabOrder = 0
        OnChange = cbARMORACChange
      end
      object cbARMORMAXAC: TComboBox
        Left = 136
        Top = 24
        Width = 145
        Height = 21
        Style = csDropDownList
        ItemHeight = 13
        TabOrder = 1
        OnChange = cbARMORMAXACChange
      end
      object rgARMORLevel: TRadioGroup
        Left = 0
        Top = 52
        Width = 131
        Height = 72
        Caption = 'Livello'
        Items.Strings = (
          'Per novizi'
          'Per esperti (+2 AC)'
          'Per elite (+5 AC)')
        TabOrder = 2
        OnClick = rgARMORLevelClick
      end
      object stARMORType: TStaticText
        Left = 137
        Top = 59
        Width = 143
        Height = 16
        AutoSize = False
        BevelKind = bkSoft
        Caption = 'stARMORType'
        Color = clInfoBk
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clInfoText
        Font.Height = -12
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentColor = False
        ParentFont = False
        TabOrder = 3
      end
      object stARMORSpellfail: TStaticText
        Left = 137
        Top = 78
        Width = 143
        Height = 16
        AutoSize = False
        BevelKind = bkSoft
        Caption = 'StaticText1'
        Color = clInfoBk
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clInfoText
        Font.Height = -12
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentColor = False
        ParentFont = False
        TabOrder = 4
      end
      object stARMORSkillFail: TStaticText
        Left = 137
        Top = 98
        Width = 143
        Height = 16
        AutoSize = False
        BevelKind = bkSoft
        Caption = 'StaticText1'
        Color = clInfoBk
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clInfoText
        Font.Height = -12
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentColor = False
        ParentFont = False
        TabOrder = 5
      end
      object stRealAC: TStaticText
        Left = 137
        Top = 117
        Width = 143
        Height = 16
        AutoSize = False
        BevelKind = bkSoft
        Caption = 'stRealAC'
        Color = clInfoBk
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clInfoText
        Font.Height = -12
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentColor = False
        ParentFont = False
        TabOrder = 6
      end
      object stMinLevel: TStaticText
        Left = 137
        Top = 137
        Width = 143
        Height = 16
        AutoSize = False
        BevelKind = bkSoft
        Caption = 'stRealAC'
        Color = clInfoBk
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clInfoText
        Font.Height = -12
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentColor = False
        ParentFont = False
        TabOrder = 7
      end
    end
    object tsTrap: TTabSheet
      Caption = 'tsTrap'
      ImageIndex = 8
      TabVisible = False
      object Label22: TLabel
        Left = 0
        Top = 192
        Width = 33
        Height = 13
        Hint = 'Il danno della trappola '#233' dato dal livello moltiplicato per 3'
        Caption = 'Livello:'
        ParentShowHint = False
        ShowHint = True
      end
      object Label23: TLabel
        Left = 96
        Top = 192
        Width = 36
        Height = 13
        Hint = 'Numero di volte che la trappola pu'#242' scattare'
        Caption = 'Cariche'
        ParentShowHint = False
        ShowHint = True
      end
      object gbTrapActivation: TGroupBox
        Left = 0
        Top = 0
        Width = 281
        Height = 81
        Caption = 'Attivazione'
        TabOrder = 0
      end
      object RGTrapDMG: TRadioGroup
        Left = 0
        Top = 88
        Width = 281
        Height = 89
        Caption = 'Tipo di danno'
        Columns = 3
        TabOrder = 1
      end
      object JvVETRAPlvl: TJvValidateEdit
        Left = 56
        Top = 184
        Width = 33
        Height = 21
        Hint = 'Il danno della trappola '#233' dato dal livello moltiplicato per 3'
        CriticalPoints.MaxValueIncluded = False
        CriticalPoints.MinValueIncluded = False
        HasMinValue = True
        MinValue = -1.000000000000000000
        ParentShowHint = False
        ShowHint = True
        TabOrder = 2
      end
      object JvVETRAPCharges: TJvValidateEdit
        Left = 152
        Top = 184
        Width = 33
        Height = 21
        Hint = 'Numero di volte che la trappola pu'#242' scattare'
        CriticalPoints.MaxValueIncluded = False
        CriticalPoints.MinValueIncluded = False
        HasMinValue = True
        MinValue = -1.000000000000000000
        ParentShowHint = False
        ShowHint = True
        TabOrder = 3
      end
    end
    object tsContainer: TTabSheet
      Caption = 'tsContainer'
      ImageIndex = 9
      TabVisible = False
      object Label24: TLabel
        Left = 0
        Top = 16
        Width = 42
        Height = 13
        Caption = 'Capacit'#224
      end
      object Label25: TLabel
        Left = 0
        Top = 152
        Width = 56
        Height = 13
        Caption = 'Key VNUM:'
      end
      object Label33: TLabel
        Left = 0
        Top = 176
        Width = 76
        Height = 13
        Caption = 'Riduzione peso:'
        FocusControl = jvVECONTReduction
      end
      object jvVECONTCapacity: TJvValidateEdit
        Left = 56
        Top = 8
        Width = 49
        Height = 21
        CriticalPoints.MaxValueIncluded = False
        CriticalPoints.MinValueIncluded = False
        HasMaxValue = True
        HasMinValue = True
        MaxValue = 10000.000000000000000000
        TabOrder = 0
      end
      object gbContainerFlags: TGroupBox
        Left = 0
        Top = 32
        Width = 281
        Height = 105
        Caption = ' Flags '
        TabOrder = 1
      end
      object cbCONTKeyNumber: TComboBox
        Left = 64
        Top = 144
        Width = 217
        Height = 21
        ItemHeight = 0
        TabOrder = 2
        OnChange = TimerChechValues
        OnExit = cbCONTKeyNumberExit
      end
      object jvVECONTReduction: TJvValidateEdit
        Left = 82
        Top = 171
        Width = 49
        Height = 21
        CriticalPoints.MaxValueIncluded = False
        CriticalPoints.MinValueIncluded = False
        Enabled = False
        HasMaxValue = True
        HasMinValue = True
        MaxValue = 75.000000000000000000
        TabOrder = 3
      end
    end
    object tsNote: TTabSheet
      Caption = 'tsNote'
      ImageIndex = 10
      TabVisible = False
      object Label27: TLabel
        Left = 0
        Top = 8
        Width = 32
        Height = 13
        Caption = 'Lingua'
      end
      object cbNOTELanguage: TComboBox
        Left = 40
        Top = 0
        Width = 145
        Height = 21
        Style = csDropDownList
        ItemHeight = 0
        TabOrder = 0
      end
    end
    object tsDrinkContainer: TTabSheet
      Caption = 'tsDrinkContainer'
      ImageIndex = 11
      TabVisible = False
      object Label28: TLabel
        Left = 0
        Top = 8
        Width = 133
        Height = 13
        Caption = 'Massima quantit'#224' contenuta'
      end
      object Label29: TLabel
        Left = 0
        Top = 32
        Width = 76
        Height = 13
        Caption = 'Quantit'#224' rimasta'
      end
      object Label30: TLabel
        Left = 0
        Top = 56
        Width = 49
        Height = 13
        Caption = 'Contenuto'
      end
      object JvVELCMaxUnits: TJvValidateEdit
        Left = 176
        Top = 0
        Width = 33
        Height = 21
        CriticalPoints.MaxValueIncluded = False
        CriticalPoints.MinValueIncluded = False
        EditText = '1'
        HasMinValue = True
        MaxValue = 1.000000000000000000
        MinValue = 1.000000000000000000
        TabOrder = 0
        OnChange = JvVELCMaxUnitsChange
      end
      object JvVELCCurrUnits: TJvValidateEdit
        Left = 176
        Top = 24
        Width = 33
        Height = 21
        CriticalPoints.MaxValueIncluded = False
        CriticalPoints.MinValueIncluded = False
        HasMaxValue = True
        HasMinValue = True
        MaxValue = 1.000000000000000000
        TabOrder = 1
      end
      object cbLCLiquid: TComboBox
        Left = 64
        Top = 48
        Width = 145
        Height = 21
        Style = csDropDownList
        ItemHeight = 0
        TabOrder = 2
      end
      object gbDrinkContainerFlags: TGroupBox
        Left = 0
        Top = 72
        Width = 281
        Height = 81
        Caption = 'Flags'
        TabOrder = 3
      end
    end
    object tsKey: TTabSheet
      Caption = 'tsKey'
      ImageIndex = 12
      TabVisible = False
      object gbKeyFlags: TGroupBox
        Left = 0
        Top = 0
        Width = 273
        Height = 105
        Caption = ' Flags '
        TabOrder = 0
      end
    end
    object tsFood: TTabSheet
      Caption = 'tsFood'
      ImageIndex = 13
      TabVisible = False
      object Label32: TLabel
        Left = 0
        Top = 16
        Width = 64
        Height = 13
        Caption = 'Ore di saziet'#224
      end
      object JvVEFOODFullness: TJvValidateEdit
        Left = 80
        Top = 8
        Width = 33
        Height = 21
        CriticalPoints.MaxValueIncluded = False
        CriticalPoints.MinValueIncluded = False
        TabOrder = 0
      end
      object gbFOODFlags: TGroupBox
        Left = 0
        Top = 32
        Width = 281
        Height = 105
        Caption = ' Flags '
        TabOrder = 1
      end
    end
    object tsMoney: TTabSheet
      Caption = 'tsMoney'
      ImageIndex = 14
      TabVisible = False
      object Label31: TLabel
        Left = 0
        Top = 8
        Width = 62
        Height = 13
        Caption = 'Monete d'#39'oro'
      end
      object JvVEMONEY: TJvValidateEdit
        Left = 176
        Top = 0
        Width = 33
        Height = 21
        CriticalPoints.MaxValueIncluded = False
        CriticalPoints.MinValueIncluded = False
        HasMinValue = True
        TabOrder = 0
      end
    end
    object tsAudio: TTabSheet
      Caption = 'tsAudio'
      ImageIndex = 15
      TabVisible = False
      object Label26: TLabel
        Left = 0
        Top = 8
        Width = 34
        Height = 13
        Hint = 
          'Questo numero indica ogni quanto tempo l'#39'oggetto visualizza la s' +
          'tirnga del rumore (contenuta nella Action Description); dovrebbe' +
          ' essere un multiplo di 15; se '#233' 0 l'#39'oggetto non produce rumore.'
        Caption = 'Timing:'
        ParentShowHint = False
        ShowHint = True
      end
      object JvVEAUDTiming: TJvValidateEdit
        Left = 56
        Top = 0
        Width = 33
        Height = 21
        Hint = 
          'Questo numero indica ogni quanto tempo l'#39'oggetto visualizza la s' +
          'tirnga del rumore (contenuta nella Action Description); dovrebbe' +
          ' essere un multiplo di 15; se '#233' 0 l'#39'oggetto non produce rumore.'
        CriticalPoints.MaxValueIncluded = False
        CriticalPoints.MinValueIncluded = False
        HasMinValue = True
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
      end
    end
  end
  object BitBtn1: TBitBtn
    Left = 0
    Top = 264
    Width = 75
    Height = 25
    TabOrder = 1
    Kind = bkOK
  end
  object BitBtn2: TBitBtn
    Left = 216
    Top = 264
    Width = 75
    Height = 25
    TabOrder = 2
    Kind = bkCancel
  end
  object tmrRefresh: TTimer
    Enabled = False
    OnTimer = tmrRefreshTimer
    Left = 144
    Top = 256
  end
end
