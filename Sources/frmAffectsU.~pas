unit frmAffectsU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, GeneralTypesU, JvExStdCtrls, JvEdit, JvValidateEdit,
  ComCtrls, Buttons, ExtCtrls;

type
  TfrmAffects = class(TForm)
    cbAffect: TComboBox;
    pcEditApply: TPageControl;
    tsText: TTabSheet;
    tsSex: TTabSheet;
    tsDMGFlags: TTabSheet;
    tsSpellAffects: TTabSheet;
    tsWPSpells: TTabSheet;
    tsEatSpells: TTabSheet;
    JvVEDirect: TJvValidateEdit;
    cbWPSpell: TComboBox;
    cbEatSpell: TComboBox;
    gbDamageType: TGroupBox;
    gbSpellAffects: TGroupBox;
    bbOk: TBitBtn;
    BitBtn2: TBitBtn;
    rgGender: TRadioGroup;
    lblMultiply: TLabel;
    tsRaceSlayer: TTabSheet;
    tsAlign: TTabSheet;
    gbAlign: TGroupBox;
    cbSlayRace: TComboBox;
    Panel1: TPanel;
    lblItemGroups: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure cbAffectChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    { Private declarations }
    FApply:RAppliedEffect;
    FDamageFlags:Array of TCheckBox;
    FSpellAffects:Array of TCheckBox;
    FAligns:Array of TCheckBox;
    FItemGroups: SApplyGroups;
    procedure SetItemGroups(const Value: SApplyGroups);
  public
    { Public declarations }
    Procedure SetApply(aApply:RAppliedEffect);
    Function GetApply:RAppliedEffect;
    Property Apply:RAppliedEffect read GetApply write SetApply;
    Property ItemGroups:SApplyGroups read FItemGroups write SetItemGroups;
  end;

var
  frmAffects: TfrmAffects;

implementation

{$R *.dfm}
Uses
  Math, UtilsU;

{ TfrmAffects }

Procedure EncodeFlags(Value:Cardinal;cbFlags:Array of TCheckBox);
var
  LI:Integer;
Begin
  For LI:=0 to High(cbFlags) Do
    cbFlags[LI].Checked:=Value And (1 shl cbFlags[LI].Tag)>0;
End;

Function DecodeFlags(cbFlags:Array of TCheckBox):Cardinal;
var
  LI:Integer;
Begin
  Result:=0;
  For LI:=0 to High(cbFlags) Do
    Begin
      If cbFlags[LI].Checked Then
        Result:=Result+(1 shl cbFlags[LI].Tag);
    End;
End;

function TfrmAffects.GetApply: RAppliedEffect;

  Procedure SetApply(ApplyID:integer);
  var
    LI:Integer;
  Begin
    cbAffect.ItemIndex:=-1;
    For LI:=0 to pred(cbAffect.Items.Count) Do
      If PObjApply(cbAffect.Items.Objects[LI]).ID=ApplyID Then
        Begin
          cbAffect.ItemIndex:=LI;
          Break;
        End;
  End;

var
  LObjAffect:PObjApply;
begin
  If cbAffect.ItemIndex>=0 then
    Begin
      LObjAffect:=PObjApply(cbAffect.Items.Objects[cbAffect.ItemIndex]);
      Result.ID:=LObjAffect^.ID;
      Case LObjAffect^.EditFunction Of
      AEF_DMFFLAGS: Result.SpecF:=DecodeFlags(FDamageFlags);
      AEF_SPELLAFFECTS: Result.SpecF:=DecodeFlags(FSpellAffects);
      AEF_EATSPELLS:
        If cbEatSpell.ItemIndex>=0 Then
          Result.SpecI:=PSpell(cbEatSpell.Items.Objects[cbEatSpell.ItemIndex]).ID
        Else
          Result.SpecI:=0;
      //AEF_SEX: Result.SpecI:=cbGender.ItemIndex;
      AEF_TEXT: Result.SpecI:=JvVEDirect.AsInteger;
      AEF_SEX:
        If rgGender.ItemIndex>=0 Then
          Result.SpecI:=PMobGender(rgGender.Items.Objects[rgGender.ItemIndex])^.ID
        Else
          Result.SpecI:=0;
      AEF_WPSPELLS:
        If cbWPSpell.ItemIndex>=0 Then
          Result.SpecI:=PSpell(cbWPSpell.Items.Objects[cbWPSpell.ItemIndex]).ID
        Else
          Result.SpecI:=0;
      AEF_RACESLAY:
        If cbSlayRace.ItemIndex>=0 Then
          Result.SpecI:=PRace(cbSlayRace.Items.Objects[cbSlayRace.ItemIndex]).ID
        Else
          Result.SpecI:=0;
      AEF_ALIGNSLAY: Result.SpecF:=DecodeFlags(FAligns);
      Else
        Result.SpecI:=0;
      End;
    End
  Else
    Result.ID:=-1;
end;

procedure TfrmAffects.SetApply(aApply: RAppliedEffect);

  Procedure SetSpellAffectFlags(Flags:Cardinal);
  Var
    LI:Integer;
  Begin
    For LI:=0 to High(FSpellAffects) Do
      FSpellAffects[LI].Checked:=((1 shl FSpellAffects[LI].Tag) And Flags)>0;
  End;

  Procedure SetGender(ID_Gender:Integer);
  var
    LI:Integer;
  Begin
    rgGender.ItemIndex:=-1;
    For LI:=0 to High(CMobGenders) Do
      If CMobGenders[LI].ID=ID_Gender Then
        Begin
          rgGender.ItemIndex:=LI;
          Break;
        End;
  End;

  Function EncodeRace(ID_Race:Integer;aList:TStrings):Integer;
  var
    LI:Integer;
  Begin
    Result:=-1;
    For LI:=0 to Pred(aList.Count) Do
      If PRace(aList.Objects[LI])^.ID=ID_Race Then
        Begin
          Result:=LI;
          Break;
        End;
  End;

  Function EncodeSpell(ID_Spell:Integer;aList:TStrings):Integer;
  var
    LI:Integer;
  Begin
    Result:=-1;
    For LI:=0 to Pred(aList.Count) Do
      If PSpell(aList.Objects[LI])^.ID=ID_Spell Then
        Begin
          Result:=LI;
          Break;
        End;
  End;

Var
  LI:Integer;

begin
  FApply:=aApply;
  For LI:=0 to Pred(cbAffect.Items.Count) Do
    If PObjApply(cbAffect.Items.Objects[LI])^.ID=FApply.ID Then
      Begin
        cbAffect.ItemIndex:=LI;
        Case PObjApply(cbAffect.Items.Objects[LI])^.EditFunction Of
        AEF_DMFFLAGS: EncodeFlags(FApply.SpecF,FDamageFlags);
        AEF_SPELLAFFECTS: EncodeFlags(FApply.SpecF,FSpellAffects);
        AEF_TEXT: JvVEDirect.AsInteger:=FApply.SpecI;
        AEF_SEX: SetGender(FApply.SpecI);
        AEF_EATSPELLS: cbEatSpell.ItemIndex:=EncodeSpell(FApply.SpecI,cbEatSpell.Items);
        AEF_WPSPELLS: cbWPSpell.ItemIndex:=EncodeSpell(FApply.SpecI,cbWPSpell.Items);
        AEF_RACESLAY: cbSlayRace.ItemIndex:=EncodeRace(FApply.SpecI,cbSlayRace.Items);
        AEF_ALIGNSLAY: EncodeFlags(FApply.SpecF,FAligns);
        End;
        Break;
      End;
end;

procedure TfrmAffects.FormCreate(Sender: TObject);
var
  LI:Integer;
  LLen:Integer;
  LRect:TRect;
  LMaxLines:Integer;
begin
  cbAffect.Clear;
  For LI:=0 to High(CObjApplies) Do
    If CObjApplies[LI].EditFunction>=0 then
      cbAffect.AddItem(CObjApplies[LI].Name,@CObjApplies[LI]);
  cbWPSpell.Clear;
  cbEatSpell.Clear;
  For LI:=0 to High(CSpells) Do
    Begin
      If CSpells[LI].SpellBalance[satWeapon].Useable Then
        cbWPSpell.AddItem(CSpells[LI].Name,@CSpells[LI]);
      If CSpells[LI].SpellBalance[satPotion].Useable Then // As potions
        cbEatSpell.AddItem(CSpells[LI].Name,@CSpells[LI]);
    End;
  cbSlayRace.Clear;
  For LI:=0 to High(CRaces) Do
    cbSlayRace.AddItem(CRaces[LI].Name,@CRaces[LI]);
  LRect.Bottom:=16;
  LRect.Right:=90;
  LMaxLines:=(gbDamageType.ClientHeight-15) Div LRect.Bottom;
  SetLength(FDamageFlags,Length(CDamageFlags));
  For LI:=0 to High(CDamageFlags) Do
    Begin
      LRect.Top:=15+((LI MOD LMaxLines)*LRect.Bottom);
      LRect.Left:=5+((LI Div LMaxLines)*LRect.Right);
      FDamageFlags[LI]:=CreateCheckBox(gbDamageType,CDamageFlags[LI].ID,CDamageFlags[LI].Name,CDamageFlags[LI].Description,LRect);
    End;
  LRect.Right:=120;
  LMaxLines:=(gbSpellAffects.ClientHeight-15) Div LRect.Bottom;
  SetLength(FSpellAffects,0);
  For LI:=0 to High(CSpellAffects) Do
    If CSpellAffects[LI].Useable Then
      Begin
        LLen:=Length(FSpellAffects);
        SetLength(FSpellAffects,Succ(LLen));
        LRect.Top:=15+((LLen MOD LMaxLines)*LRect.Bottom);
        LRect.Left:=5+((LLen Div LMaxLines)*LRect.Right);
        FSpellAffects[LLen]:=CreateCheckBox(gbSpellAffects,CSpellAffects[LI].ID,CSpellAffects[LI].Name,CSpellAffects[LI].Desc,LRect);
      End;
  LMaxLines:=(gbAlign.ClientHeight-15) Div LRect.Bottom;

  SetLength(FAligns,Length(CAlignment));
  For LI:=0 to High(CAlignment) Do
    Begin
      LRect.Top:=15+((LI MOD LMaxLines)*LRect.Bottom);
      LRect.Left:=5+((LI Div LMaxLines)*LRect.Right);
      FAligns[LI]:=CreateCheckBox(gbAlign,CAlignment[LI].ID,CAlignment[LI].Name,CAlignment[LI].Description,LRect);
    End;

  rgGender.Items.Clear;
  For LI:=0 to High(CMobGenders) Do
    rgGender.Items.AddObject(CMobGenders[LI].Name,@CMobGenders[LI])
end;

procedure TfrmAffects.cbAffectChange(Sender: TObject);

  Function GetMaxApply(Groups:SApplyGroups;aApply:PObjApply):Integer;
  var
    LG:EApplyGroup;
    Applied:Boolean;
  Begin
    Result:=0;
    Applied:=False;
    If Assigned(aApply) Then
      Begin
        Result:=MaxInt;
        For LG:=Low(EApplyGroup) to High(EApplyGroup) Do
          If (LG<>agGeneric) And (LG in Groups) Then
            Begin
              Result:=Min(Result, aApply^.Maximi[LG]);
              Applied:=True;
              Break;
            End;
      End;
    If Not Applied Then
      Result:=0
  End;

Var
  LApply:PObjApply;

begin
  bbOk.Enabled:=cbAffect.ItemIndex>=0;
  if bbOk.Enabled then
    Begin
      pcEditApply.Show;
      LApply:=PObjApply(cbAffect.Items.Objects[cbAffect.ItemIndex]);
      pcEditApply.ActivePageIndex:=LApply^.EditFunction;
      Case pcEditApply.ActivePageIndex Of
        AEF_TEXT:
          Begin
            lblMultiply.Caption:='(Multipli di '+IntToStr(LApply^.Mag_Mod)+')';
            If LApply^.Mag_Mod<0 then
              Begin
                JvVEDirect.MinValue:=GetMaxApply(FItemGroups,LApply)*LApply^.Mag_Mod;
                JvVEDirect.CriticalPoints.CheckPoints:=cpBoth;
                JvVEDirect.CriticalPoints.ColorAbove:=clRed;
                JvVEDirect.CriticalPoints.ColorBelow:=clRed;
                JvVEDirect.CriticalPoints.MinValue:=GetMaxApply(FItemGroups,LApply)*LApply^.Mag_Mod;
                JvVEDirect.CriticalPoints.MaxValue:=0;
              End
            Else
              Begin
                JvVEDirect.CriticalPoints.MaxValue:=GetMaxApply(FItemGroups,LApply)*LApply^.Mag_Mod;
                JvVEDirect.CriticalPoints.MinValue:=0;
                JvVEDirect.CriticalPoints.ColorAbove:=clRed;
                JvVEDirect.CriticalPoints.ColorBelow:=clRed;
                JvVEDirect.CriticalPoints.CheckPoints:=cpBoth;
              End;
          End;
      End;
    End
  Else
    pcEditApply.Hide;
end;

procedure TfrmAffects.FormShow(Sender: TObject);
begin
  bbOk.Enabled:=cbAffect.ItemIndex>=0;
  if bbOk.Enabled then
    Begin
      pcEditApply.Show;
      pcEditApply.ActivePageIndex:=PObjApply(cbAffect.Items.Objects[cbAffect.ItemIndex]).EditFunction;
    End
  Else
    pcEditApply.Hide;
end;

procedure TfrmAffects.SetItemGroups(const Value: SApplyGroups);

  Function GetCanApply(Groups:SApplyGroups;aApply:PObjApply):Boolean;
  var
    LG:EApplyGroup;
  Begin
    Result:=False;
    For LG:=Low(EApplyGroup) to High(EApplyGroup) Do
      If (LG IN Groups) And (aApply^.Weights[LG]<>0) Then
        Begin
          Result:=True;
          Break;
        End;
  End;

var
  LI:Integer;
  LG:EApplyGroup;
  LS:String;
begin
  FItemGroups := Value;
  LS:='';
  cbAffect.Clear;
  For LG:=Low(EApplyGroup) to High(EApplyGroup) Do
    If LG in FItemGroups Then
      Begin
        If LS<>'' Then
          LS:=LS+', ';
        Case LG of
        ag2ndWeapon: LS:=LS+'Off hand weapon';
        agArmor: LS:=LS+'Armor';
        agBag: LS:=LS+'Bag';
        agFireWeapon: LS:=LS+'Fireweapon';
        agGeneric: LS:=LS+'Generic item';
        agHoldable: LS:=LS+'Holdable item';
        agJewel: LS:=LS+'Jewel';
        agShield: LS:=LS+'Shield';
        agStaff: LS:=LS+'Staff';
        agThrowable: LS:=LS+'Throwable weapon';
        agWand: LS:=LS+'Wand';
        agWeapon: LS:=LS+'Weapon';
        End;
      End;
  If LS='' Then
    LS:='[Undefined]';
  lblItemGroups.Caption:='Item groups:'+LS;
  For LI:=0 to High(CObjApplies) Do
    If (CObjApplies[LI].EditFunction>=0) And GetCanApply(FItemGroups,@CObjApplies[LI]) then
      cbAffect.AddItem(CObjApplies[LI].Name,@CObjApplies[LI]);
end;

procedure TfrmAffects.FormDestroy(Sender: TObject);
begin
  SetLength(FAligns,0);
  SetLength(FDamageFlags,0);
  SetLength(FSpellAffects,0);
end;

end.
