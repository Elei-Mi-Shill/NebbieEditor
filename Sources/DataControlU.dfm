object frmDataControl: TfrmDataControl
  Left = -217
  Top = 223
  AutoSize = True
  BorderStyle = bsDialog
  Caption = 'Data control Dialog'
  ClientHeight = 721
  ClientWidth = 1161
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  PrintScale = poNone
  Scaled = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object pcListViewer: TPageControl
    Left = 0
    Top = 0
    Width = 1161
    Height = 721
    ActivePage = tsRooms
    TabOrder = 0
    object tsRooms: TTabSheet
      Caption = 'Rooms'
      object lbRoomType: TListBox
        Left = 8
        Top = 16
        Width = 153
        Height = 150
        ItemHeight = 13
        TabOrder = 0
      end
      object StaticText1: TStaticText
        Left = 8
        Top = 0
        Width = 153
        Height = 17
        AutoSize = False
        BorderStyle = sbsSunken
        Caption = 'Room Type'
        TabOrder = 1
      end
      object lbRoomFlags: TListBox
        Left = 168
        Top = 16
        Width = 177
        Height = 150
        ItemHeight = 13
        TabOrder = 2
      end
      object StaticText2: TStaticText
        Left = 168
        Top = 0
        Width = 177
        Height = 17
        AutoSize = False
        BorderStyle = sbsSunken
        Caption = 'Room Flags'
        TabOrder = 3
      end
      object lbDirections: TListBox
        Left = 352
        Top = 16
        Width = 129
        Height = 150
        ItemHeight = 13
        TabOrder = 4
      end
      object StaticText3: TStaticText
        Left = 352
        Top = 0
        Width = 129
        Height = 17
        AutoSize = False
        BorderStyle = sbsSunken
        Caption = 'Directions'
        TabOrder = 5
      end
      object StaticText4: TStaticText
        Left = 488
        Top = 0
        Width = 105
        Height = 17
        AutoSize = False
        BorderStyle = sbsSunken
        Caption = 'Exit Commands'
        TabOrder = 6
      end
      object lbOpenCommands: TListBox
        Left = 488
        Top = 16
        Width = 105
        Height = 150
        ItemHeight = 13
        TabOrder = 7
      end
      object StaticText5: TStaticText
        Left = 600
        Top = 0
        Width = 177
        Height = 17
        AutoSize = False
        BorderStyle = sbsSunken
        Caption = 'Teleport Types'
        TabOrder = 8
      end
      object lbTeleportFlags: TListBox
        Left = 600
        Top = 16
        Width = 177
        Height = 150
        ItemHeight = 13
        TabOrder = 9
      end
      object lbExitFlags: TListBox
        Left = 784
        Top = 16
        Width = 305
        Height = 150
        ItemHeight = 13
        TabOrder = 10
      end
      object StaticText26: TStaticText
        Left = 784
        Top = 0
        Width = 305
        Height = 17
        AutoSize = False
        BorderStyle = sbsSunken
        Caption = 'Exit Flags'
        TabOrder = 11
      end
    end
    object tsItems: TTabSheet
      Caption = 'Items'
      ImageIndex = 1
      object lbItemTypes: TListBox
        Left = 0
        Top = 16
        Width = 153
        Height = 150
        ItemHeight = 13
        TabOrder = 0
      end
      object StaticText6: TStaticText
        Left = 0
        Top = 0
        Width = 153
        Height = 17
        AutoSize = False
        BorderStyle = sbsSunken
        Caption = 'Item Type'
        TabOrder = 1
      end
      object lbItemFlags: TListBox
        Left = 160
        Top = 16
        Width = 153
        Height = 150
        ItemHeight = 13
        TabOrder = 2
      end
      object StaticText7: TStaticText
        Left = 160
        Top = 0
        Width = 153
        Height = 17
        AutoSize = False
        BorderStyle = sbsSunken
        Caption = 'Item Flags'
        TabOrder = 3
      end
      object lbWearFlags: TListBox
        Left = 320
        Top = 16
        Width = 153
        Height = 150
        ItemHeight = 13
        TabOrder = 4
      end
      object StaticText8: TStaticText
        Left = 320
        Top = 0
        Width = 153
        Height = 17
        AutoSize = False
        BorderStyle = sbsSunken
        Caption = 'Wear Flags'
        TabOrder = 5
      end
      object lbApplies: TListBox
        Left = 480
        Top = 16
        Width = 369
        Height = 150
        ItemHeight = 13
        TabOrder = 6
      end
      object StaticText9: TStaticText
        Left = 480
        Top = 0
        Width = 369
        Height = 17
        AutoSize = False
        BorderStyle = sbsSunken
        Caption = 'Applies'
        TabOrder = 7
      end
      object lbArmorTypes: TListBox
        Left = 792
        Top = 192
        Width = 153
        Height = 150
        ItemHeight = 13
        TabOrder = 8
      end
      object StaticText14: TStaticText
        Left = 792
        Top = 176
        Width = 153
        Height = 17
        AutoSize = False
        BorderStyle = sbsSunken
        Caption = 'Armor types'
        TabOrder = 9
      end
      object lbMissileTypes: TListBox
        Left = 0
        Top = 192
        Width = 257
        Height = 150
        ItemHeight = 13
        TabOrder = 10
      end
      object StaticText13: TStaticText
        Left = 0
        Top = 176
        Width = 257
        Height = 17
        AutoSize = False
        BorderStyle = sbsSunken
        Caption = 'Missile types'
        TabOrder = 11
      end
      object lbKeyFlags: TListBox
        Left = 808
        Top = 368
        Width = 153
        Height = 150
        ItemHeight = 13
        TabOrder = 12
      end
      object StaticText21: TStaticText
        Left = 808
        Top = 352
        Width = 153
        Height = 17
        AutoSize = False
        BorderStyle = sbsSunken
        Caption = 'Key flags'
        TabOrder = 13
      end
      object lbLanguages: TListBox
        Left = 648
        Top = 368
        Width = 153
        Height = 150
        ItemHeight = 13
        TabOrder = 14
      end
      object StaticText18: TStaticText
        Left = 648
        Top = 352
        Width = 153
        Height = 17
        AutoSize = False
        BorderStyle = sbsSunken
        Caption = 'Languages'
        TabOrder = 15
      end
      object lbTrapFlags: TListBox
        Left = 488
        Top = 368
        Width = 153
        Height = 150
        ItemHeight = 13
        TabOrder = 16
      end
      object StaticText15: TStaticText
        Left = 488
        Top = 352
        Width = 153
        Height = 17
        AutoSize = False
        BorderStyle = sbsSunken
        Caption = 'Trap flags'
        TabOrder = 17
      end
      object lbWPDamages: TListBox
        Left = 328
        Top = 368
        Width = 153
        Height = 150
        ItemHeight = 13
        TabOrder = 18
      end
      object StaticText12: TStaticText
        Left = 328
        Top = 352
        Width = 153
        Height = 17
        AutoSize = False
        BorderStyle = sbsSunken
        Caption = 'Weapon damages'
        TabOrder = 19
      end
      object lbAllSpells: TListBox
        Left = 0
        Top = 368
        Width = 321
        Height = 150
        ItemHeight = 13
        TabOrder = 20
      end
      object StaticText11: TStaticText
        Left = 0
        Top = 352
        Width = 321
        Height = 17
        AutoSize = False
        BorderStyle = sbsSunken
        Caption = 'All Spells'
        TabOrder = 21
      end
      object lbTrapDamages: TListBox
        Left = 264
        Top = 192
        Width = 257
        Height = 150
        ItemHeight = 13
        TabOrder = 22
      end
      object StaticText16: TStaticText
        Left = 264
        Top = 176
        Width = 257
        Height = 17
        AutoSize = False
        BorderStyle = sbsSunken
        Caption = 'Trap dmages'
        TabOrder = 23
      end
      object lbContainerFlags: TListBox
        Left = 528
        Top = 192
        Width = 257
        Height = 150
        ItemHeight = 13
        TabOrder = 24
      end
      object StaticText17: TStaticText
        Left = 528
        Top = 176
        Width = 257
        Height = 17
        AutoSize = False
        BorderStyle = sbsSunken
        Caption = 'Container flags'
        TabOrder = 25
      end
      object StaticText19: TStaticText
        Left = 952
        Top = 176
        Width = 153
        Height = 17
        AutoSize = False
        BorderStyle = sbsSunken
        Caption = 'Liquids'
        TabOrder = 26
      end
      object lbLiquids: TListBox
        Left = 952
        Top = 192
        Width = 153
        Height = 150
        ItemHeight = 13
        TabOrder = 27
      end
      object StaticText20: TStaticText
        Left = 968
        Top = 352
        Width = 169
        Height = 17
        AutoSize = False
        BorderStyle = sbsSunken
        Caption = 'Drink container flags'
        TabOrder = 28
      end
      object lbDrinkContainerFlags: TListBox
        Left = 968
        Top = 368
        Width = 169
        Height = 150
        ItemHeight = 13
        TabOrder = 29
      end
      object StaticText22: TStaticText
        Left = 264
        Top = 528
        Width = 153
        Height = 17
        AutoSize = False
        BorderStyle = sbsSunken
        Caption = 'Food flags'
        TabOrder = 30
      end
      object lbFoodFlags: TListBox
        Left = 264
        Top = 544
        Width = 153
        Height = 150
        ItemHeight = 13
        TabOrder = 31
      end
      object lbSpellAffects: TListBox
        Left = 856
        Top = 16
        Width = 257
        Height = 150
        ItemHeight = 13
        TabOrder = 32
      end
      object StaticText23: TStaticText
        Left = 856
        Top = 0
        Width = 257
        Height = 17
        AutoSize = False
        BorderStyle = sbsSunken
        Caption = 'Spell affects'
        TabOrder = 33
      end
      object lbDamageFlags: TListBox
        Left = 0
        Top = 544
        Width = 257
        Height = 150
        ItemHeight = 13
        TabOrder = 34
      end
      object StaticText24: TStaticText
        Left = 0
        Top = 528
        Width = 257
        Height = 17
        AutoSize = False
        BorderStyle = sbsSunken
        Caption = 'Damage flags'
        TabOrder = 35
      end
    end
    object tsMobiles: TTabSheet
      Caption = 'Mob'
      ImageIndex = 2
      object lbMobTypes: TListBox
        Left = 0
        Top = 16
        Width = 177
        Height = 150
        ItemHeight = 13
        TabOrder = 0
      end
      object StaticText10: TStaticText
        Left = 0
        Top = 0
        Width = 177
        Height = 17
        AutoSize = False
        BorderStyle = sbsSunken
        Caption = 'Mob Types'
        TabOrder = 1
      end
      object StaticText25: TStaticText
        Left = 184
        Top = 0
        Width = 177
        Height = 17
        AutoSize = False
        BorderStyle = sbsSunken
        Caption = 'Mob genders'
        TabOrder = 2
      end
      object lbGenders: TListBox
        Left = 184
        Top = 16
        Width = 177
        Height = 150
        ItemHeight = 13
        TabOrder = 3
      end
      object lbMobLocations: TListBox
        Left = 368
        Top = 16
        Width = 313
        Height = 150
        ItemHeight = 13
        TabOrder = 4
      end
      object StaticText28: TStaticText
        Left = 368
        Top = 0
        Width = 313
        Height = 17
        AutoSize = False
        BorderStyle = sbsSunken
        Caption = 'Mob locations'
        TabOrder = 5
      end
      object StaticText29: TStaticText
        Left = 688
        Top = 0
        Width = 273
        Height = 17
        AutoSize = False
        BorderStyle = sbsSunken
        Caption = 'XP per level table'
        TabOrder = 6
      end
      object lbXPPerLevel: TListBox
        Left = 688
        Top = 16
        Width = 273
        Height = 150
        ItemHeight = 13
        TabOrder = 7
      end
      object lbMobPos: TListBox
        Left = 968
        Top = 16
        Width = 177
        Height = 150
        ItemHeight = 13
        TabOrder = 8
      end
      object StaticText30: TStaticText
        Left = 968
        Top = 0
        Width = 177
        Height = 17
        AutoSize = False
        BorderStyle = sbsSunken
        Caption = 'Mob positions'
        TabOrder = 9
      end
      object StaticText31: TStaticText
        Left = 0
        Top = 168
        Width = 177
        Height = 17
        AutoSize = False
        BorderStyle = sbsSunken
        Caption = 'Races'
        TabOrder = 10
      end
      object lbRaces: TListBox
        Left = 0
        Top = 184
        Width = 177
        Height = 150
        ItemHeight = 13
        TabOrder = 11
      end
      object lbMobAffects: TListBox
        Left = 184
        Top = 184
        Width = 177
        Height = 150
        ItemHeight = 13
        TabOrder = 12
      end
      object StaticText32: TStaticText
        Left = 184
        Top = 168
        Width = 177
        Height = 17
        AutoSize = False
        BorderStyle = sbsSunken
        Caption = 'Mob affects'
        TabOrder = 13
      end
      object lbMobActions: TListBox
        Left = 368
        Top = 184
        Width = 177
        Height = 150
        ItemHeight = 13
        TabOrder = 14
      end
      object StaticText33: TStaticText
        Left = 368
        Top = 168
        Width = 177
        Height = 17
        AutoSize = False
        BorderStyle = sbsSunken
        Caption = 'Mob actions'
        TabOrder = 15
      end
      object lbAlign: TListBox
        Left = 552
        Top = 184
        Width = 177
        Height = 150
        ItemHeight = 13
        TabOrder = 16
      end
      object StaticText34: TStaticText
        Left = 552
        Top = 168
        Width = 177
        Height = 17
        AutoSize = False
        BorderStyle = sbsSunken
        Caption = 'Mob aligns'
        TabOrder = 17
      end
      object StaticText36: TStaticText
        Left = 736
        Top = 168
        Width = 177
        Height = 17
        AutoSize = False
        BorderStyle = sbsSunken
        Caption = 'Mob reactions'
        TabOrder = 18
      end
      object lbReactionTargets: TListBox
        Left = 736
        Top = 184
        Width = 177
        Height = 150
        ItemHeight = 13
        TabOrder = 19
      end
      object lbBRetheWeapons: TListBox
        Left = 920
        Top = 184
        Width = 177
        Height = 150
        ItemHeight = 13
        TabOrder = 20
      end
      object StaticText38: TStaticText
        Left = 920
        Top = 168
        Width = 177
        Height = 17
        AutoSize = False
        BorderStyle = sbsSunken
        Caption = 'Brethe weapon types'
        TabOrder = 21
      end
    end
    object tsZone: TTabSheet
      Caption = 'Zone'
      ImageIndex = 3
      object lbIniCommands: TListBox
        Left = 0
        Top = 16
        Width = 177
        Height = 150
        ItemHeight = 13
        TabOrder = 0
      end
      object StaticText27: TStaticText
        Left = 0
        Top = 0
        Width = 177
        Height = 17
        AutoSize = False
        BorderStyle = sbsSunken
        Caption = 'Zone Commands'
        TabOrder = 1
      end
      object lbSpecProcs: TListBox
        Left = 184
        Top = 16
        Width = 305
        Height = 150
        ItemHeight = 13
        TabOrder = 2
      end
      object StaticText35: TStaticText
        Left = 184
        Top = 0
        Width = 305
        Height = 17
        AutoSize = False
        BorderStyle = sbsSunken
        Caption = 'Special procedures'
        TabOrder = 3
      end
      object lbClassCombo: TListBox
        Left = 0
        Top = 184
        Width = 489
        Height = 505
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Courier New'
        Font.Style = []
        ItemHeight = 14
        ParentFont = False
        TabOrder = 4
      end
      object StaticText37: TStaticText
        Left = 0
        Top = 168
        Width = 489
        Height = 17
        AutoSize = False
        BorderStyle = sbsSunken
        Caption = 'Available multiclass combinations'
        TabOrder = 5
      end
    end
  end
  object BitBtn1: TBitBtn
    Left = 1080
    Top = 0
    Width = 79
    Height = 21
    TabOrder = 1
    Kind = bkClose
  end
end
