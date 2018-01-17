unit fraVariableU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, 
  Dialogs, GeneralTypesU, ComCtrls, StdCtrls, ExtCtrls, JvExStdCtrls,
  JvEdit, JvValidateEdit, UtilsU;

type
  TfraVariable = class(TFrame)
    pcVariables: TPageControl;
    tsBoolean: TTabSheet;
    rgBoolean: TRadioGroup;
    tsRace: TTabSheet;
    lblRace: TLabel;
    cbRace: TComboBox;
    tsInteger: TTabSheet;
    lblInteger: TLabel;
    JvVEInteger: TJvValidateEdit;
    tsAlign: TTabSheet;
    JvVEAlign: TJvValidateEdit;
    lblAlign: TLabel;
    tsClass: TTabSheet;
    lblClass: TLabel;
    cbClass: TComboBox;
    tsGender: TTabSheet;
    lblGender: TLabel;
    cbGender: TComboBox;
    tsVNUM: TTabSheet;
    lblVNUM: TLabel;
    cbVNUM: TComboBox;
    tsPercent: TTabSheet;
    lblPercent: TLabel;
    JvVEPercent: TJvValidateEdit;
    tsDirection: TTabSheet;
    lblDirection: TLabel;
    cbDirection: TComboBox;
    tsMessage: TTabSheet;
    lblMessage: TLabel;
    stAlign: TStaticText;
    edtMessage: TEdit;
    tsBretheWeapon: TTabSheet;
    lblBretheWeapon: TLabel;
    cbBretheWeapon: TComboBox;
    tsKey: TTabSheet;
    lblKey: TLabel;
    edtKey: TEdit;
    procedure JvVEAlignChange(Sender: TObject);
    procedure edtKeyKeyPress(Sender: TObject; var Key: Char);
  private
    FParameterType: EParameterType;
    FParamLabel: String;
    FZone: TZone;
    function GetValue: String;
    procedure SetParameterType(const Value: EParameterType);
    procedure SetValue(const Value: String);
    procedure SetParamLabel(const Value: String);
    procedure SetZone(const Value: TZone);
    { Private declarations }
  public
    { Public declarations }
    Property Zone:TZone read FZone write SetZone;
    Property ParameterType:EParameterType read FParameterType write SetParameterType;
    Property ParamLabel:String read FParamLabel write SetParamLabel;
    Property ParamValue:String read GetValue write SetValue;
  end;

implementation

{$R *.dfm}

{ TfraVariable }

function TfraVariable.GetValue: String;
begin
  Case FParameterType Of
    ptInteger: Result:=JvVEInteger.Text;
    ptPercent: Result:=JvVEPercent.Text;
    ptBoolean: Result:=IntToStr(rgBoolean.ItemIndex);
    ptDirection:
      If cbDirection.ItemIndex>=0 Then
        Result:=IntToStr(Succ(PDirection(cbDirection.Items.Objects[cbDirection.ItemIndex])^.ID));
    ptClass:
      If cbClass.ItemIndex>=0 Then
        Result:=IntToStr(PLimit(cbClass.Items.Objects[cbClass.ItemIndex])^.ID);
    ptMobVNUM,ptRoomVNUM,ptItemVNUM:
      Result:=IntToStr(SpecialStrToVNUM(cbVNUM.Text));
    ptMessage: Result:=edtMessage.Text;
    ptBretheWP:
      If cbBretheWeapon.ItemIndex>=0 Then
        Result:=IntToStr(PBretheWeaponType(cbBretheWeapon.Items.Objects[cbBretheWeapon.ItemIndex])^.ID);
    ptRace:
      If cbRace.ItemIndex>=0 Then
        Result:=IntToStr(PRace(cbRace.Items.Objects[cbRace.ItemIndex])^.ID);
    ptGender:
      If cbGender.ItemIndex>=0 Then
        Result:=IntToStr(PMobGender(cbGender.Items.Objects[cbGender.ItemIndex])^.ID);
    ptAlign: Result:=JvVEAlign.Text;
    ptKeyList: Result:=edtKey.Text;
  End;
end;

procedure TfraVariable.SetParameterType(const Value: EParameterType);
begin
  FParameterType := Value;
  Case FParameterType Of
    ptKeyList:
      Begin
        lblKey.Caption:=FParamLabel;
        tsKey.Show;
      End;
    ptInteger:
      Begin
        lblInteger.Caption:=FParamLabel;
        tsInteger.Show;
      End;
    ptPercent:
      Begin
        lblPercent.Caption:=FParamLabel;
        tsPercent.Show;
      End;
    ptBoolean:
      Begin
        rgBoolean.Caption:=FParamLabel;
        tsBoolean.Show;
      End;
    ptDirection:
      Begin
        lblDirection.Caption:=FParamLabel;
        If Assigned(FZone) Then
          FZone.FillList(cbDirection.Items,FParameterType);
        tsDirection.Show;
      End;
    ptClass:
      Begin
        lblClass.Caption:=FParamLabel;
        If Assigned(FZone) Then
          FZone.FillList(cbClass.Items,FParameterType);
        tsClass.Show;
      End;
    ptMobVNUM,ptRoomVNUM,ptItemVNUM:
      Begin
        lblVNUM.Caption:=FParamLabel;
        If Assigned(FZone) Then
          FZone.FillList(cbVNUM.Items,FParameterType);
        tsVNUM.Show;
      End;
    ptMessage:
      Begin
        lblMessage.Caption:=FParamLabel;
        tsMessage.Show;
      End;
    ptBretheWP:
      Begin
        lblBretheWeapon.Caption:=FParamLabel;
        If Assigned(FZone) Then
          FZone.FillList(cbBretheWeapon.Items,FParameterType);
        tsBretheWeapon.Show;
      End;
    ptRace:
      Begin
        lblRace.Caption:=FParamLabel;
        If Assigned(FZone) Then
          FZone.FillList(cbRace.Items,FParameterType);
        tsRace.Show;
      End;
    ptGender:
      Begin
        lblGender.Caption:=FParamLabel;
        If Assigned(FZone) Then
          FZone.FillList(cbGender.Items,FParameterType);
        tsGender.Show;
      End;
    ptAlign:
      Begin
        lblAlign.Caption:=FParamLabel;
        tsAlign.Show;
      End;
  End;
end;

procedure TfraVariable.SetParamLabel(const Value: String);
begin
  FParamLabel:=Value;
  Case FParameterType Of
    ptInteger: lblInteger.Caption:=FParamLabel;
    ptPercent: lblPercent.Caption:=FParamLabel;
    ptBoolean: rgBoolean.Caption:=FParamLabel;
    ptDirection: lblMessage.Caption:=FParamLabel;
    ptClass: lblClass.Caption:=FParamLabel;
    ptMobVNUM,ptRoomVNUM,ptItemVNUM: lblVNUM.Caption:=FParamLabel;
    ptMessage: lblMessage.Caption:=FParamLabel;
    ptBretheWP: lblBretheWeapon.Caption:=FParamLabel;
    ptRace: lblRace.Caption:=FParamLabel;
    ptGender: lblGender.Caption:=FParamLabel;
    ptAlign: lblAlign.Caption:=FParamLabel;
    ptKeyList: lblKey.Caption:=FParamLabel;                              
  End;
end;

procedure TfraVariable.SetValue(const Value: String);
var
  LI:Integer;
  LValue:Integer;
begin
  Case FParameterType Of
    ptInteger: JvVEInteger.Text:=Value;
    ptPercent: JvVEPercent.Text:=Value;
    ptBoolean:
      If Value='1' Then rgBoolean.ItemIndex:=1 else rgBoolean.ItemIndex:=0;
    ptDirection:
      Begin
        LValue:=StrToIntDef(Value,0);
        For LI:=0 to Pred(cbDirection.Items.Count) Do
          If PDirection(cbDirection.Items.Objects[LI])^.ID=LValue-1 Then
            Begin
              cbDirection.ItemIndex:=LI;
              Break;
            End;
      End;
    ptClass:
      Begin
        LValue:=StrToIntDef(Value,0);
        For LI:=0 to Pred(cbClass.Items.Count) Do
          If PRace(cbClass.Items.Objects[LI])^.ID=LValue Then
            Begin
              cbClass.ItemIndex:=LI;
              Break;
            End;
      End;
    ptMobVNUM,ptRoomVNUM,ptItemVNUM:
      Begin
        LValue:=StrToIntDef(Value,0);
        generalTypesU.SetSelectedEntityInComboBox(cbVNUM,LValue);
      End;
    ptMessage: edtMessage.Text:=Value;
    ptBretheWP:
      Begin
        LValue:=StrToIntDef(Value,0);
        For LI:=0 to Pred(cbBretheWeapon.Items.Count) Do
          If PBretheWeaponType(cbBretheWeapon.Items.Objects[LI])^.ID=LValue Then
            Begin
              cbBretheWeapon.ItemIndex:=LI;
              Break;
            End;
      End;
    ptRace:
      Begin
        LValue:=StrToIntDef(Value,0);
        For LI:=0 to Pred(cbRace.Items.Count) Do
          If PRace(cbRace.Items.Objects[LI])^.ID=LValue Then
            Begin
              cbRace.ItemIndex:=LI;
              Break;
            End;
      End;
    ptGender:
      Begin
        LValue:=StrToIntDef(Value,0);
        For LI:=0 to Pred(cbGender.Items.Count) Do
          If PMobGender(cbGender.Items.Objects[LI])^.ID=LValue Then
            Begin
              cbGender.ItemIndex:=LI;
              Break;
            End;
      End;
    ptAlign:
      Begin
        LValue:=StrToIntDef(Value,0);
        JvVEAlign.AsInteger:=LValue;
      End;
    ptKeyList: edtKey.Text:=Value;
  End;
end;

procedure TfraVariable.SetZone(const Value: TZone);
begin
  FZone := Value;
  If Assigned(FZone) Then
    Case FParameterType Of
    ptMobVNUM,ptItemVNUM,ptRoomVNUM: FZone.FillList(cbVNUM.Items,FParameterType);
    ptClass: FZone.FillList(cbClass.Items,FParameterType);
    ptGender: FZone.FillList(cbGender.Items,FParameterType);
    ptRace: FZone.FillList(cbRace.Items,FParameterType);
    ptDirection: FZone.FillList(cbDirection.Items,FParameterType);
    ptBretheWP: FZone.FillList(cbBretheWeapon.Items,FParameterType);
    End;
end;

procedure TfraVariable.JvVEAlignChange(Sender: TObject);
var
  LI:Integer;
begin
  stAlign.Caption:='';
  For LI:=0 To High(CAlignment) Do
    If Between(JvVEAlign.AsInteger,CAlignment[LI].Min,CAlignment[LI].Max) Then
      Begin
        stAlign.Caption:=CAlignment[LI].Name;
        Break;
      End;
end;

procedure TfraVariable.edtKeyKeyPress(Sender: TObject; var Key: Char);
begin
  Case Key of
  ' ','-': Key:=#0;
  End;
end;

end.
