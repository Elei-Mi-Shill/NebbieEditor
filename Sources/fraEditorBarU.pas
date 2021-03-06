unit fraEditorBarU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, AdvTxtEditorU, ColorGrd, Buttons, StdCtrls;

type
  TfrmEditingTools = class(TFrame)
    cgColors: TColorGrid;
    ataAttributes: TAdvTextAttributes;
    btnJustify: TButton;
    btnCompact: TButton;
    sbUnderlined: TSpeedButton;
    procedure btnJustifyClick(Sender: TObject);
    procedure btnCompactClick(Sender: TObject);
    procedure ataAttributesEditorSelectionChanged(Sender: TObject);
    procedure sbUnderlinedClick(Sender: TObject);
    procedure cgColorsClick(Sender: TObject);
    procedure ataAttributesKeyFilter(Sender: TObject; var Key: Char);
    procedure ataAttributesAfterEditorChanged(Sender: TObject);
  private
    FWantRecallLine: Boolean;
    FLineLength: Integer;
    procedure SetLineLength(const Value: Integer);
    procedure SetWantRecallLine(const Value: Boolean);
    { Private declarations }
  public
    { Public declarations }
  published
    Property LineLength:Integer read FLineLength write SetLineLength;
    Property WantRecallLine:Boolean read FWantRecallLine write SetWantRecallLine;
  end;

implementation

{$R *.dfm}

Uses
  ComCtrls, UtilsU, dmMainU;

procedure TfrmEditingTools.btnJustifyClick(Sender: TObject);
begin
  If Assigned(ataAttributes.RichEditor) Then
    JustifyRTF(ataAttributes.RichEditor,dmMain.DescColumns);
end;

procedure TfrmEditingTools.btnCompactClick(Sender: TObject);
begin
  If Assigned(ataAttributes.RichEditor) Then
    CompactRTF(ataAttributes.RichEditor,dmMain.DescColumns,True);
end;

procedure TfrmEditingTools.ataAttributesEditorSelectionChanged(
  Sender: TObject);
begin
  cgColors.BackgroundIndex:=cgColors.ColorToIndex(ataAttributes.BGColor);
  cgColors.ForegroundIndex:=cgColors.ColorToIndex(ataAttributes.FGColor);
  sbUnderlined.Down:=afsUnderline in ataAttributes.Style;
end;

procedure TfrmEditingTools.sbUnderlinedClick(Sender: TObject);
begin
  If sbUnderlined.Down Then
    ataAttributes.Style:=ataAttributes.Style+[afsUnderline]
  Else
    ataAttributes.Style:=ataAttributes.Style-[afsUnderline];
end;

procedure TfrmEditingTools.cgColorsClick(Sender: TObject);
begin
  If cgColors.BackgroundIndex>7 Then
    cgColors.BackgroundIndex:=cgColors.BackgroundIndex And 7;
  If ataAttributes.BGColor<>cgColors.BackgroundColor Then
    ataAttributes.BGColor:=cgColors.BackgroundColor;
  If ataAttributes.FGColor<>cgColors.ForegroundColor Then
    ataAttributes.FGColor:=cgColors.ForegroundColor;
end;

procedure TfrmEditingTools.ataAttributesKeyFilter(Sender: TObject;
  var Key: Char);
Var
  LReplStr:String;
begin
  If Sender is TRichEdit Then
    Begin
      LReplStr:='';
      Case Key of
      '�':
        Begin
          LReplStr:='a''';
          Key:=#0;
        End;
      '�':
        Begin
          LReplStr:='i''';
          Key:=#0;
        End;
      '�','�':
        Begin
          LReplStr:='e''';
          Key:=#0;
        End;
      '�':
        Begin
          LReplStr:='o''';
          Key:=#0;
        End;
      '�':
        Begin
          LReplStr:='u''';
          Key:=#0;
        End;
      '�':
        Begin
          LReplStr:='Eur';
          Key:=#0;
        End;
      '�','�','�','�','~':
        Begin
          LReplStr:='';
          Key:=#0;
        End;
      #13: If Not (Sender as TRichEdit).WantReturns Then Key:=#0;
      #10: If Not (Sender as TRichEdit).WantReturns Then Key:=#0;
      End;
      If Key>#127 Then
        Key:=#0;
      If LReplStr<>'' Then
        (Sender as TRichEdit).SelText:=LReplStr;
    End;
end;

procedure TfrmEditingTools.ataAttributesAfterEditorChanged(
  Sender: TObject);
begin
  If Assigned(ataAttributes.RichEditor) Then
    Begin
      sbUnderlined.Enabled:=True;
      cgColors.Enabled:=True;
      btnCompact.Enabled:=ataAttributes.RichEditor.WantReturns;
      btnJustify.Enabled:=ataAttributes.RichEditor.WantReturns;
      btnCompact.Visible:=ataAttributes.RichEditor.WantReturns;
      btnJustify.Visible:=ataAttributes.RichEditor.WantReturns;
    End
  Else
    Begin
      sbUnderlined.Enabled:=False;
      cgColors.Enabled:=False;
      btnCompact.Enabled:=False;
      btnJustify.Enabled:=False;
      btnCompact.Show;
      btnJustify.Show;
    End;
end;

procedure TfrmEditingTools.SetLineLength(const Value: Integer);
begin
  FLineLength := Value;
end;

procedure TfrmEditingTools.SetWantRecallLine(const Value: Boolean);
begin
  FWantRecallLine := Value;
end;

end.
