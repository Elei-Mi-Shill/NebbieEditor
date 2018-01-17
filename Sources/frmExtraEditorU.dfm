object frmExtraEditor: TfrmExtraEditor
  Left = 469
  Top = 410
  AutoSize = True
  BorderStyle = bsToolWindow
  Caption = 'frmExtraEditor'
  ClientHeight = 225
  ClientWidth = 474
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
  DesignSize = (
    474
    225)
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 0
    Top = 8
    Width = 36
    Height = 13
    Caption = 'Key list:'
    FocusControl = edtKeys
  end
  object edtKeys: TEdit
    Left = 40
    Top = 0
    Width = 434
    Height = 21
    TabOrder = 0
    OnChange = edtKeysChange
    OnKeyPress = edtKeysKeyPress
  end
  object reExtra: TRichEdit
    Left = 0
    Top = 60
    Width = 474
    Height = 133
    Color = clBlack
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clSilver
    Font.Height = -11
    Font.Name = 'Courier New'
    Font.Style = []
    Lines.Strings = (
      '0--------1---------2---------3---------4---------5---------6')
    ParentFont = False
    ScrollBars = ssBoth
    TabOrder = 1
    WordWrap = False
    OnChange = reExtraChange
  end
  inline frmEditingTools: TfrmEditingTools
    Left = 0
    Top = 24
    Width = 465
    Height = 17
    AutoSize = True
    TabOrder = 2
    inherited btnJustify: TButton
      Left = 272
      Top = 0
      Width = 97
    end
    inherited btnCompact: TButton
      Left = 368
      Top = 0
      Width = 97
    end
    inherited ataAttributes: TAdvTextAttributes
      RichEditor = reExtra
      Charset = DEFAULT_CHARSET
      FGColor = clSilver
      FontName = 'Courier New'
      Size = 8
      UnderlineType = utUnderline
    end
  end
  object bbOk: TBitBtn
    Left = 0
    Top = 200
    Width = 75
    Height = 25
    TabOrder = 3
    Kind = bkOK
  end
  object BitBtn2: TBitBtn
    Left = 399
    Top = 200
    Width = 75
    Height = 25
    Anchors = [akTop, akRight]
    TabOrder = 4
    Kind = bkCancel
  end
  object rulExtra: TRuler
    Left = 2
    Top = 40
    Width = 424
    Height = 18
    BorderStyle = sbsSunken
    Caption = '|--------1---------2---------3---------4---------5---------|'
    Color = clInfoBk
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clInfoText
    Font.Height = -11
    Font.Name = 'Courier New'
    Font.Style = []
    ParentColor = False
    ParentFont = False
    TabOrder = 5
    Transparent = False
    Length = 60
    Editor = reExtra
  end
end
