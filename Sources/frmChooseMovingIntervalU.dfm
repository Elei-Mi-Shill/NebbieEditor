object frmChooseMovingInterval: TfrmChooseMovingInterval
  Left = 237
  Top = 245
  BorderStyle = bsToolWindow
  Caption = 'frmChooseMovingInterval'
  ClientHeight = 152
  ClientWidth = 235
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
  object Label3: TLabel
    Left = 8
    Top = 96
    Width = 67
    Height = 13
    Caption = 'Nuovo VNUM'
    FocusControl = jvVENew
  end
  object gbEntityType: TGroupBox
    Left = 144
    Top = 8
    Width = 81
    Height = 73
    Caption = 'Tipo di entit'#224
    TabOrder = 0
    object cbRooms: TCheckBox
      Left = 8
      Top = 16
      Width = 65
      Height = 17
      Caption = 'Stanze'
      TabOrder = 0
    end
    object cbItems: TCheckBox
      Left = 8
      Top = 32
      Width = 65
      Height = 17
      Caption = 'Oggetti'
      TabOrder = 1
    end
    object cbMobs: TCheckBox
      Left = 8
      Top = 48
      Width = 65
      Height = 17
      Caption = 'Creature'
      TabOrder = 2
    end
  end
  object gbMovingInterval: TGroupBox
    Left = 8
    Top = 8
    Width = 129
    Height = 73
    Caption = 'Intervallo da spostare'
    TabOrder = 1
    object Label1: TLabel
      Left = 8
      Top = 24
      Width = 46
      Height = 13
      Caption = 'Dall'#39'entit'#224
      FocusControl = JvVEFrom
    end
    object Label2: TLabel
      Left = 10
      Top = 48
      Width = 39
      Height = 13
      Caption = 'All'#39'entit'#224
      FocusControl = JvVETo
    end
    object JvVEFrom: TJvValidateEdit
      Left = 64
      Top = 16
      Width = 57
      Height = 21
      CriticalPoints.MaxValueIncluded = False
      CriticalPoints.MinValueIncluded = False
      EditText = '1'
      HasMaxValue = True
      HasMinValue = True
      MaxValue = 999999.000000000000000000
      TabOrder = 0
      OnChange = JvVEFromChange
    end
    object JvVETo: TJvValidateEdit
      Left = 64
      Top = 40
      Width = 57
      Height = 21
      CriticalPoints.MaxValueIncluded = False
      CriticalPoints.MinValueIncluded = False
      EditText = '1'
      HasMaxValue = True
      HasMinValue = True
      MaxValue = 999999.000000000000000000
      TabOrder = 1
    end
  end
  object jvVENew: TJvValidateEdit
    Left = 80
    Top = 88
    Width = 57
    Height = 21
    CriticalPoints.MaxValueIncluded = False
    CriticalPoints.MinValueIncluded = False
    EditText = '1'
    HasMaxValue = True
    HasMinValue = True
    MaxValue = 999999.000000000000000000
    TabOrder = 2
  end
  object BitBtn1: TBitBtn
    Left = 8
    Top = 120
    Width = 75
    Height = 25
    TabOrder = 3
    Kind = bkOK
  end
  object BitBtn2: TBitBtn
    Left = 152
    Top = 120
    Width = 75
    Height = 25
    TabOrder = 4
    Kind = bkCancel
  end
end
