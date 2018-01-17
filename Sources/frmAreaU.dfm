object frmArea: TfrmArea
  Left = 380
  Top = 255
  BorderIcons = [biMinimize, biMaximize]
  BorderStyle = bsDialog
  Caption = 'frmArea'
  ClientHeight = 287
  ClientWidth = 517
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsMDIChild
  OldCreateOrder = False
  Position = poDefaultPosOnly
  PrintScale = poNone
  Scaled = False
  Visible = True
  OnClose = FormClose
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnHide = FormHide
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object pcEntities: TPageControl
    Left = 0
    Top = 54
    Width = 517
    Height = 233
    ActivePage = tsItems
    Align = alClient
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    object tsZone: TTabSheet
      Caption = 'Zone'
      ImageIndex = 3
      OnShow = tsZoneShow
      object Label1: TLabel
        Left = 0
        Top = 8
        Width = 25
        Height = 13
        Caption = 'Zone'
        FocusControl = JvVEZoneID
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label2: TLabel
        Left = 0
        Top = 32
        Width = 53
        Height = 13
        Caption = 'Description'
        FocusControl = edtZoneDescription
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object lblTop: TLabel
        Left = 0
        Top = 56
        Width = 50
        Height = 13
        Caption = 'Top Room'
        FocusControl = JvVETopRoom
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label3: TLabel
        Left = 0
        Top = 80
        Width = 40
        Height = 13
        Caption = 'Lifespan'
        FocusControl = JvVEZoneLifeSpan
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object SpeedButton1: TSpeedButton
        Left = 272
        Top = 176
        Width = 113
        Height = 22
        Action = aApplyModifies
        Glyph.Data = {
          36040000424D3604000000000000360000002800000010000000100000000100
          2000000000000004000000000000000000000000000000000000DDDDDD00DDDD
          DD00DDDDDD00DDDDDD00DDDDDD00DDDDDD00DDDDDD00DDDDDD00DDDDDD00DDDD
          DD00DDDDDD00DDDDDD00DDDDDD00DDDDDD00DDDDDD00DDDDDD00DDDDDD00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00DDDDDD00DDDDDD00FFFF
          FF0005A8050005A8050005A8050005A8050005A8050005A8050005A8050005A8
          050005A8050005A8050005A8050005A80500FFFFFF00DDDDDD00DDDDDD00FFFF
          FF0005A8050005A8050005A8050005A8050005A8050005A8050005A8050005A8
          050005A8050005A8050005A8050005A80500FFFFFF00DDDDDD00DDDDDD00FFFF
          FF0005A8050005A8050005A8050053C35300FFFFFF00E1F4E10005A8050005A8
          050005A8050005A8050005A8050005A80500FFFFFF00DDDDDD00DDDDDD00FFFF
          FF0005A8050005A8050024B32400F0FAF000FFFFFF00FFFFFF0063C9630005A8
          050005A8050005A8050005A8050005A80500FFFFFF00DDDDDD00DDDDDD00FFFF
          FF0005A8050005A80500B2E4B200FFFFFF00A2DFA200E1F4E100E1F4E10005A8
          050005A8050005A8050005A8050005A80500FFFFFF00DDDDDD00DDDDDD00FFFF
          FF0005A8050005A8050024B3240063C9630005A8050063C96300FFFFFF0063C9
          630005A8050005A8050005A8050005A80500FFFFFF00DDDDDD00DDDDDD00FFFF
          FF0005A8050005A8050005A8050005A8050005A8050005A80500D1EFD100E1F4
          E10015AD150005A8050005A8050005A80500FFFFFF00DDDDDD00DDDDDD00FFFF
          FF0005A8050005A8050005A8050005A8050005A8050005A8050034B83400FFFF
          FF0092D9920005A8050005A8050005A80500FFFFFF00DDDDDD00DDDDDD00FFFF
          FF0005A8050005A8050005A8050005A8050005A8050005A8050005A8050092D9
          9200FFFFFF0053C3530005A8050005A80500FFFFFF00DDDDDD00DDDDDD00FFFF
          FF0005A8050005A8050005A8050005A8050005A8050005A8050005A8050005A8
          0500D1EFD100F0FAF00034B8340005A80500FFFFFF00DDDDDD00DDDDDD00FFFF
          FF0005A8050005A8050005A8050005A8050005A8050005A8050005A8050005A8
          050015AD150092D99200B2E4B20005A80500FFFFFF00DDDDDD00DDDDDD00FFFF
          FF0005A8050005A8050005A8050005A8050005A8050005A8050005A8050005A8
          050005A8050005A8050005A8050005A80500FFFFFF00DDDDDD00DDDDDD00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00DDDDDD00DDDDDD00DDDD
          DD00DDDDDD00DDDDDD00DDDDDD00DDDDDD00DDDDDD00DDDDDD00DDDDDD00DDDD
          DD00DDDDDD00DDDDDD00DDDDDD00DDDDDD00DDDDDD00DDDDDD00}
      end
      object SpeedButton2: TSpeedButton
        Left = 392
        Top = 176
        Width = 113
        Height = 22
        Action = aUndoModifies
        Glyph.Data = {
          36040000424D3604000000000000360000002800000010000000100000000100
          2000000000000004000000000000000000000000000000000000DDDDDD00DDDD
          DD00DDDDDD00DDDDDD00DDDDDD00DDDDDD00DDDDDD00DDDDDD00DDDDDD00DDDD
          DD00DDDDDD00DDDDDD00DDDDDD00DDDDDD00DDDDDD00DDDDDD00DDDDDD00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00DDDDDD00DDDDDD00FFFF
          FF000E0EDD000E0EDD000E0EDD000E0EDD000E0EDD000E0EDD000E0EDD000E0E
          DD000E0EDD000E0EDD000E0EDD000E0EDD00FFFFFF00DDDDDD00DDDDDD00FFFF
          FF000E0EDD000E0EDD001D1DDF00B4B4F4001D1DDF000E0EDD000E0EDD002C2C
          E1000E0EDD000E0EDD000E0EDD000E0EDD00FFFFFF00DDDDDD00DDDDDD00FFFF
          FF000E0EDD000E0EDD00A5A5F200FFFFFF00D3D3F9000E0EDD006969EA00F1F1
          FD00A5A5F2000E0EDD000E0EDD000E0EDD00FFFFFF00DDDDDD00DDDDDD00FFFF
          FF000E0EDD000E0EDD005A5AE800FFFFFF00FFFFFF00B4B4F400FFFFFF00FFFF
          FF008787EE000E0EDD000E0EDD000E0EDD00FFFFFF00DDDDDD00DDDDDD00FFFF
          FF000E0EDD000E0EDD000E0EDD009696F000FFFFFF00FFFFFF00FFFFFF00F1F1
          FD001D1DDF000E0EDD000E0EDD000E0EDD00FFFFFF00DDDDDD00DDDDDD00FFFF
          FF000E0EDD000E0EDD000E0EDD000E0EDD00A5A5F200FFFFFF00FFFFFF00C3C3
          F7000E0EDD000E0EDD000E0EDD000E0EDD00FFFFFF00DDDDDD00DDDDDD00FFFF
          FF000E0EDD000E0EDD000E0EDD000E0EDD003B3BE300FFFFFF00FFFFFF00F1F1
          FD002C2CE1000E0EDD000E0EDD000E0EDD00FFFFFF00DDDDDD00DDDDDD00FFFF
          FF000E0EDD000E0EDD000E0EDD000E0EDD006969EA00FFFFFF00FFFFFF00FFFF
          FF00C3C3F7000E0EDD000E0EDD000E0EDD00FFFFFF00DDDDDD00DDDDDD00FFFF
          FF000E0EDD000E0EDD000E0EDD000E0EDD00A5A5F200FFFFFF00D3D3F900F1F1
          FD00FFFFFF008787EE000E0EDD000E0EDD00FFFFFF00DDDDDD00DDDDDD00FFFF
          FF000E0EDD000E0EDD000E0EDD000E0EDD00C3C3F700FFFFFF003B3BE3003B3B
          E300F1F1FD00FFFFFF000E0EDD000E0EDD00FFFFFF00DDDDDD00DDDDDD00FFFF
          FF000E0EDD000E0EDD000E0EDD000E0EDD004A4AE6003B3BE3000E0EDD000E0E
          DD002C2CE1003B3BE3000E0EDD000E0EDD00FFFFFF00DDDDDD00DDDDDD00FFFF
          FF000E0EDD000E0EDD000E0EDD000E0EDD000E0EDD000E0EDD000E0EDD000E0E
          DD000E0EDD000E0EDD000E0EDD000E0EDD00FFFFFF00DDDDDD00DDDDDD00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00DDDDDD00DDDDDD00DDDD
          DD00DDDDDD00DDDDDD00DDDDDD00DDDDDD00DDDDDD00DDDDDD00DDDDDD00DDDD
          DD00DDDDDD00DDDDDD00DDDDDD00DDDDDD00DDDDDD00DDDDDD00}
      end
      object edtZoneDescription: TEdit
        Left = 56
        Top = 24
        Width = 441
        Height = 21
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
        OnKeyPress = edtZoneDescriptionKeyPress
      end
      object JvVEZoneID: TJvValidateEdit
        Left = 56
        Top = 0
        Width = 49
        Height = 21
        CriticalPoints.MaxValueIncluded = False
        CriticalPoints.MinValueIncluded = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
      end
      object JvVETopRoom: TJvValidateEdit
        Left = 56
        Top = 48
        Width = 49
        Height = 21
        CriticalPoints.MaxValueIncluded = False
        CriticalPoints.MinValueIncluded = False
        EditText = '99'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 2
      end
      object JvVEZoneLifeSpan: TJvValidateEdit
        Left = 56
        Top = 72
        Width = 49
        Height = 21
        CriticalPoints.MaxValueIncluded = False
        CriticalPoints.MinValueIncluded = False
        EditText = '20'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 3
      end
      object rgResetMode: TRadioGroup
        Left = 0
        Top = 96
        Width = 185
        Height = 105
        Caption = 'Reset mode'
        TabOrder = 4
      end
    end
    object tsRooms: TTabSheet
      Caption = 'Rooms'
      ImageIndex = 1
      OnShow = tsRoomsShow
      object lbRooms: TListBox
        Tag = 1
        Left = 0
        Top = 0
        Width = 509
        Height = 205
        Style = lbOwnerDrawFixed
        Align = alClient
        DragMode = dmAutomatic
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Courier New'
        Font.Style = []
        ItemHeight = 18
        ParentFont = False
        Sorted = True
        TabOrder = 0
        OnDblClick = lbRoomsDblClick
        OnDragDrop = lbRoomsDragDrop
        OnDragOver = lbRoomsDragOver
        OnDrawItem = DrawListIcons
      end
    end
    object tsMobs: TTabSheet
      Caption = 'Mobs'
      OnShow = tsMobsShow
      object lbMobs: TListBox
        Tag = 2
        Left = 0
        Top = 0
        Width = 509
        Height = 205
        Style = lbOwnerDrawFixed
        Align = alClient
        DragMode = dmAutomatic
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Courier New'
        Font.Style = []
        ItemHeight = 18
        ParentFont = False
        TabOrder = 0
        OnDblClick = lbMobsDblClick
        OnDragDrop = lbMobsDragDrop
        OnDragOver = lbMobsDragOver
        OnDrawItem = DrawListIcons
      end
    end
    object tsItems: TTabSheet
      Caption = 'Items'
      ImageIndex = 2
      OnShow = tsItemsShow
      object lbItems: TListBox
        Tag = 3
        Left = 0
        Top = 0
        Width = 509
        Height = 205
        Style = lbOwnerDrawFixed
        Align = alClient
        DragMode = dmAutomatic
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Courier New'
        Font.Style = []
        ItemHeight = 18
        ParentFont = False
        TabOrder = 0
        OnDblClick = lbItemsDblClick
        OnDragDrop = lbItemsDragDrop
        OnDragOver = lbItemsDragOver
        OnDrawItem = DrawListIcons
      end
    end
    object tsUnresolvedSpecials: TTabSheet
      Caption = 'Speciali non riconosciute'
      ImageIndex = 6
      OnShow = tsUnresolvedSpecialsShow
      object lbSpecials: TListBox
        Left = 0
        Top = 0
        Width = 625
        Height = 281
        ItemHeight = 13
        TabOrder = 0
        OnDblClick = lbSpecialsDblClick
      end
    end
    object tsInits: TTabSheet
      Caption = 'Inizializzazioni'
      ImageIndex = 5
      OnShow = tsInitsShow
      object lbInitializations: TListBox
        Left = 0
        Top = 0
        Width = 509
        Height = 205
        Style = lbOwnerDrawFixed
        Align = alClient
        Color = clBlack
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clSilver
        Font.Height = -12
        Font.Name = 'Courier New'
        Font.Style = []
        ItemHeight = 16
        ParentFont = False
        TabOrder = 0
        OnDrawItem = lbInitializationsDrawItem
      end
    end
    object tsStatistics: TTabSheet
      Caption = 'Statistics'
      ImageIndex = 4
      OnShow = tsStatisticsShow
      object lbStatistics: TListBox
        Left = 0
        Top = 0
        Width = 509
        Height = 205
        Align = alClient
        Color = clInfoBk
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clInfoText
        Font.Height = -12
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ItemHeight = 13
        ParentFont = False
        TabOrder = 0
      end
    end
  end
  object ammbArea: TActionMainMenuBar
    Left = 0
    Top = 0
    Width = 517
    Height = 25
    UseSystemFont = False
    ActionManager = amArea
    Caption = 'ammbArea'
    ColorMap.HighlightColor = 11319482
    ColorMap.BtnSelectedColor = clBtnFace
    ColorMap.UnusedColor = 11319482
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Tahoma'
    Font.Style = []
    Spacing = 0
  end
  object tnArea: TToolBar
    Left = 0
    Top = 25
    Width = 517
    Height = 29
    Caption = 'tbArea'
    Images = dmMain.ilMain
    ParentShowHint = False
    ShowHint = False
    TabOrder = 2
    object ToolButton12: TToolButton
      Left = 0
      Top = 2
      Action = aReopen
    end
    object ToolButton11: TToolButton
      Left = 23
      Top = 2
      Action = aSave
    end
    object ToolButton13: TToolButton
      Left = 46
      Top = 2
      Width = 8
      Caption = 'ToolButton13'
      ImageIndex = 56
      Style = tbsDivider
    end
    object ToolButton1: TToolButton
      Left = 54
      Top = 2
      Action = aNewitem
      ParentShowHint = False
      ShowHint = True
    end
    object ToolButton3: TToolButton
      Left = 77
      Top = 2
      Action = aDeleteItem
      ParentShowHint = False
      ShowHint = True
    end
    object ToolButton2: TToolButton
      Left = 100
      Top = 2
      Action = aEditItem
      ParentShowHint = False
      ShowHint = True
    end
    object ToolButton4: TToolButton
      Left = 123
      Top = 2
      Action = aClone
      ParentShowHint = False
      ShowHint = True
    end
    object ToolButton8: TToolButton
      Left = 146
      Top = 2
      Width = 8
      Caption = 'ToolButton8'
      ImageIndex = 16
      Style = tbsDivider
    end
    object ToolButton5: TToolButton
      Left = 154
      Top = 2
      Action = aShowErrors
      ParentShowHint = False
      ShowHint = True
    end
    object ToolButton7: TToolButton
      Left = 177
      Top = 2
      Width = 8
      Caption = 'ToolButton7'
      ImageIndex = 16
      Style = tbsDivider
    end
    object ToolButton6: TToolButton
      Left = 185
      Top = 2
      Action = aCloseWindow
      ParentShowHint = False
      ShowHint = True
    end
    object ToolButton10: TToolButton
      Left = 208
      Top = 2
      Width = 8
      Caption = 'ToolButton10'
      ImageIndex = 17
      Style = tbsDivider
    end
    object ToolButton9: TToolButton
      Left = 216
      Top = 2
      Action = aMoveEntityGroup
      ParentShowHint = False
      ShowHint = True
    end
  end
  object amArea: TActionManager
    ActionBars = <
      item
        Items = <
          item
            Items = <
              item
                Action = aNewitem
                Caption = '&Nuova entit'#224
                ImageIndex = 18
              end
              item
                Action = aDeleteItem
                Caption = '&Elimina entit'#224
                ImageIndex = 21
              end
              item
                Action = aEditItem
                Caption = '&Modifica entit'#224
                ImageIndex = 20
              end
              item
                Action = aClone
                Caption = '&Clona l'#39'oggetto'
                ImageIndex = 48
              end
              item
                Caption = '-'
              end
              item
                Action = aMoveEntityGroup
                Caption = '&Sposta gruppo di entit'#224
                ImageIndex = 55
              end
              item
                Caption = '-'
              end
              item
                Action = aExportEntities
                Caption = 'Es&porta'
                ImageIndex = 69
              end
              item
                Action = aImportEntities
                Caption = '&Importa'
                ImageIndex = 70
              end
              item
                Caption = '-'
              end
              item
                Action = aShowErrors
                Caption = 'M&ostra gli errori'
                ImageIndex = 44
              end>
            Caption = '&Entities'
          end
          item
            Items = <
              item
                Action = aCloseWindow
                Caption = '&Chiudi'
                ImageIndex = 15
              end>
            Caption = '&Window'
          end>
        ActionBar = ammbArea
      end
      item
        Items = <
          item
            Action = aNewitem
            Caption = '&Nuova entit'#224
            ImageIndex = 18
            ShowCaption = False
          end
          item
            Action = aDeleteItem
            Caption = '&Elimina entit'#224
            ImageIndex = 21
            ShowCaption = False
          end
          item
            Action = aEditItem
            Caption = '&Modifica entit'#224
            ImageIndex = 20
            ShowCaption = False
          end
          item
            Action = aClone
            ImageIndex = 48
          end
          item
            Action = aShowErrors
            ImageIndex = 44
          end
          item
            Action = aCloseWindow
            Caption = '&Chiudi'
            ImageIndex = 15
            ShowCaption = False
          end>
      end>
    Images = dmMain.ilMain
    Left = 376
    StyleName = 'XP Style'
    object aCloseWindow: TAction
      Category = 'Window'
      Caption = 'Chiudi'
      Hint = 'Chiudi la finestra della zona'
      ImageIndex = 15
      OnExecute = aCloseWindowExecute
    end
    object aNewitem: TAction
      Category = 'Entities'
      Caption = 'Nuova entit'#224
      Hint = 'Aggiungi una nuova entit'#224
      ImageIndex = 18
      OnExecute = aNewitemExecute
    end
    object aDeleteItem: TAction
      Category = 'Entities'
      Caption = 'Elimina entit'#224
      Hint = 'Elimina entit'#224' selezionata'
      ImageIndex = 21
      OnExecute = aDeleteItemExecute
    end
    object aEditItem: TAction
      Category = 'Entities'
      Caption = 'Modifica entit'#224
      Hint = 'Modifica l'#39'entit'#224' selezionata'
      ImageIndex = 20
      OnExecute = aEditItemExecute
    end
    object aShowErrors: TAction
      Category = 'Entities'
      Caption = 'Mostra gli errori'
      Hint = 'Mostra gli errori dell'#39'oggetto selezionato'
      ImageIndex = 44
      OnExecute = aShowErrorsExecute
    end
    object aClone: TAction
      Category = 'Entities'
      Caption = 'Clona l'#39'oggetto'
      Hint = 'Clona l'#39'oggetto selezionato'
      ImageIndex = 48
      OnExecute = aCloneExecute
    end
    object aApplyModifies: TAction
      Category = 'ZoneData'
      Caption = 'Applica modifiche'
      ImageIndex = 4
      OnExecute = aApplyModifiesExecute
    end
    object aUndoModifies: TAction
      Category = 'ZoneData'
      Caption = 'Annulla modifiche'
      ImageIndex = 3
      OnExecute = aUndoModifiesExecute
    end
    object aMoveEntityGroup: TAction
      Category = 'Entities'
      Caption = 'Sposta gruppo di entit'#224
      Hint = 'Modifica il VNUM di un gruppo di entit'#224
      ImageIndex = 55
      OnExecute = aMoveEntityGroupExecute
    end
    object aSave: TAction
      Category = 'ZoneData'
      Caption = 'Salva'
      ImageIndex = 19
      OnExecute = aSaveExecute
    end
    object aReopen: TAction
      Category = 'ZoneData'
      Caption = 'Riapri'
      ImageIndex = 49
      OnExecute = aReopenExecute
    end
    object aExportEntities: TAction
      Category = 'Entities'
      Caption = 'Esporta'
      ImageIndex = 69
      OnExecute = aExportEntitiesExecute
    end
    object aImportEntities: TAction
      Category = 'Entities'
      Caption = 'Importa'
      ImageIndex = 70
      OnExecute = aImportEntitiesExecute
    end
  end
end
