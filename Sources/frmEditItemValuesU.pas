unit frmEditItemValuesU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, JvExStdCtrls, JvEdit, JvValidateEdit,
  GeneralTypesU, Buttons, ExtCtrls, Contnrs, Spin;

type
  TfrmEditItemValues = class(TForm)
    pcEditMasks: TPageControl;
    tsUnknown: TTabSheet;
    tsLightSource: TTabSheet;
    lblDuration: TLabel;
    cbEternal: TCheckBox;
    JvVELightDuration: TJvValidateEdit;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    tsSUSpellcaster: TTabSheet;
    tsMUSpellcaster: TTabSheet;
    tsWeapons: TTabSheet;
    tsFireWeapons: TTabSheet;
    tsMissiles: TTabSheet;
    tsArmor: TTabSheet;
    tsTrap: TTabSheet;
    tsContainer: TTabSheet;
    tsNote: TTabSheet;
    tsDrinkContainer: TTabSheet;
    tsKey: TTabSheet;
    tsFood: TTabSheet;
    tsMoney: TTabSheet;
    Label1: TLabel;
    JvVESUSpellLevel: TJvValidateEdit;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    cbSUSpell1: TComboBox;
    cbSUSpell2: TComboBox;
    cbSUSpell3: TComboBox;
    JvVEMUSpellLevel: TJvValidateEdit;
    Label5: TLabel;
    Label6: TLabel;
    cbMUSpell: TComboBox;
    Label7: TLabel;
    JvVEMUMaxCharges: TJvValidateEdit;
    Label8: TLabel;
    JvVEMUCurrentCharges: TJvValidateEdit;
    JvVEWPNoDices: TJvValidateEdit;
    Label9: TLabel;
    JvVEWPSizeDices: TJvValidateEdit;
    Label10: TLabel;
    Label11: TLabel;
    cbWPDamages: TComboBox;
    Label12: TLabel;
    JvVEFWStrength: TJvValidateEdit;
    Label13: TLabel;
    JvVEFWMaxDistance: TJvValidateEdit;
    Label14: TLabel;
    JvVEFWRangeBonus: TJvValidateEdit;
    cbFWWeaponType: TComboBox;
    Label15: TLabel;
    Label16: TLabel;
    JvVEMissPerc: TJvValidateEdit;
    Label17: TLabel;
    JvVEMissNoDice: TJvValidateEdit;
    Label18: TLabel;
    JvVEMissSizeDice: TJvValidateEdit;
    Label19: TLabel;
    cbMissMissileType: TComboBox;
    Label20: TLabel;
    cbARMORAC: TComboBox;
    Label21: TLabel;
    gbTrapActivation: TGroupBox;
    RGTrapDMG: TRadioGroup;
    Label22: TLabel;
    JvVETRAPlvl: TJvValidateEdit;
    Label23: TLabel;
    JvVETRAPCharges: TJvValidateEdit;
    Label24: TLabel;
    jvVECONTCapacity: TJvValidateEdit;
    gbContainerFlags: TGroupBox;
    Label25: TLabel;
    cbCONTKeyNumber: TComboBox;
    tmrRefresh: TTimer;
    tsAudio: TTabSheet;
    JvVEAUDTiming: TJvValidateEdit;
    Label26: TLabel;
    Label27: TLabel;
    cbNOTELanguage: TComboBox;
    Label28: TLabel;
    JvVELCMaxUnits: TJvValidateEdit;
    Label29: TLabel;
    JvVELCCurrUnits: TJvValidateEdit;
    Label30: TLabel;
    cbLCLiquid: TComboBox;
    gbDrinkContainerFlags: TGroupBox;
    JvVEMONEY: TJvValidateEdit;
    Label31: TLabel;
    gbKeyFlags: TGroupBox;
    Label32: TLabel;
    JvVEFOODFullness: TJvValidateEdit;
    gbFOODFlags: TGroupBox;
    cbARMORMAXAC: TComboBox;
    stType: TStaticText;
    stLevel: TStaticText;
    Label33: TLabel;
    jvVECONTReduction: TJvValidateEdit;
    rgARMORLevel: TRadioGroup;
    stARMORType: TStaticText;
    stARMORSpellfail: TStaticText;
    stARMORSkillFail: TStaticText;
    stRealAC: TStaticText;
    stMinLevel: TStaticText;
    procedure cbEternalClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure cbARMORACChange(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure cbCONTKeyNumberExit(Sender: TObject);
    procedure tmrRefreshTimer(Sender: TObject);
    procedure TimerChechValues(Sender: TObject);
    procedure JvVELCMaxUnitsChange(Sender: TObject);
    procedure cbARMORMAXACChange(Sender: TObject);
    procedure SUSCChangeSpell(Sender: TObject);
    procedure MUSCChangeSpell(Sender: TObject);
    procedure JvVEWPSizeDicesChange(Sender: TObject);
    procedure rgARMORLevelClick(Sender: TObject);
  private
    FValues:array[1..4] of Integer;
    FcbTrapFlags:Array of TCheckBox;
    FcbContainerFlags:Array of TCheckBox;
    FcbLiquidContainerFlags:Array of TCheckBox;
    FcbKeyFlags:Array of TCheckBox;
    FcbFoodFlags:Array of TCheckBox;
    FItemsList:Array of RIndexedString;
    function GetMaskType: Integer;
    function GetValues(Index: Integer): Integer;
    procedure SetValues(Index: Integer; const Value: Integer);
    Procedure AssignValueToControl(Index,Value:Integer);
    Function GetValueFromControl(Index:Integer):Integer;
    Procedure cbCONTKeyVNUMReset;
    Procedure OnCheckContainerOpenable(Sender:TObject);
    Procedure CheckOpenableContainer;
    { Private declarations }
  public
    { Public declarations }
    Procedure FillWithObjects(ObjectList:TObjectList);
    Property MaskType:Integer read GetMaskType;
    procedure SetMaskType(const Value: Integer;ItemType:Integer);
    Property Values[Index:Integer]:Integer read GetValues write SetValues;
  end;

var
  frmEditItemValues: TfrmEditItemValues;

implementation

uses UtilsU, Types, Math, StdConvs;

{$R *.dfm}

{ TfrmEditItemValues }

procedure TfrmEditItemValues.AssignValueToControl(Index, Value:Integer);

  Function GetSpellIndex(ID:Integer;List:TStrings):Integer;
  var
    LI:Integer;
  Begin
    For LI:=0 to Pred(List.Count) Do
      If PSpell(List.Objects[LI])^.ID=ID Then
        Begin
          Result:=LI;
          Exit;
        End;
    Result:=-1;        
  End;
  
  Function GetDamage(ID:Integer;List:TStrings):Integer;
  var
    LI:Integer;
  Begin
    For LI:=0 to Pred(List.Count) Do
      If PWPDamage(List.Objects[LI])^.ID=ID Then
        Begin
          Result:=LI;
          Exit;
        End;
    Result:=-1;
  End;

  Function GetMissileType(ID:Integer;List:TStrings):Integer;
  var
    LI:Integer;
  Begin
    For LI:=0 to Pred(List.Count) Do
      If PMissileType(List.Objects[LI])^.ID=ID Then
        Begin
          Result:=LI;
          Exit;
        End;
    Result:=-1;
  End;

  Function GetArmorType(ID:Integer;List:TStrings):Integer;
  var
    LI:Integer;
  Begin
    For LI:=0 to Pred(List.Count) Do
      If PArmorType(List.Objects[LI])^.AC=ID Then
        Begin
          Result:=LI;
          Exit;
        End;
    Result:=-1;
  End;

  Function GetLanguage(ID:Integer;List:TStrings):Integer;
  var
    LI:Integer;
  Begin
    For LI:=0 to Pred(List.Count) Do
      If PLanguage(List.Objects[LI])^.ID=ID Then
        Begin
          Result:=LI;
          Exit;
        End;
    Result:=-1;
  End;

  Function GetLiquid(ID:Integer;List:TStrings):Integer;
  var
    LI:Integer;
  Begin
    For LI:=0 to Pred(List.Count) Do
      If PLiquid(List.Objects[LI])^.ID=ID Then
        Begin
          Result:=LI;
          Exit;
        End;
    Result:=-1;
  End;

  Function GetTrapDamage(Tipo:Integer;List:TStrings):Integer;
  var
    LI:Integer;
  Begin
    Result:=-1;
    For LI:=0 to Pred(List.Count) Do
      If PTrapDMG(List.Objects[LI]).Tipo=Tipo Then
        Begin
          Result:=LI;
          Break;
        End;
  End;

  Procedure EncodeFlags(Value:Cardinal;cbFlags:Array of TCheckBox);
  var
    LI:Integer;
  Begin
    For LI:=0 to High(cbFlags) Do
      cbFlags[LI].Checked:=Value And (1 shl cbFlags[LI].Tag)>0;
  End;

begin
  Case pcEditMasks.ActivePageIndex Of
  IEM_Lightsource:
    Case Index Of
      3: Begin
          If Value>=0 then
            Begin
              cbEternal.Checked:=False;
              JvVELightDuration.AsInteger:=Value;
            End
          Else
            Begin
              cbEternal.Checked:=True;
              JvVELightDuration.AsInteger:=0;
            End;
         End;
      1,2,4:  FValues[Index]:=Value;
     End;
  IEM_SU_SPELLCASTER:
    Begin
      If Value<0 then
        Value:=0;
      Case Index Of
      1: JvVESUSpellLevel.AsInteger:=Value;
      2: cbSUSpell1.ItemIndex:=GetSpellIndex(Value,cbSUSpell1.Items);
      3: cbSUSpell2.ItemIndex:=GetSpellIndex(Value,cbSUSpell2.Items);
      4: cbSUSpell3.ItemIndex:=GetSpellIndex(Value,cbSUSpell3.Items);
      End;
    End;
  IEM_MU_SPELLCASTER:
    Begin
      If Value<0 then
        Value:=0;
      Case Index Of
      1: JvVEMUSpellLevel.AsInteger:=Value;
      2: JvVEMUMaxCharges.AsInteger:=Value;
      3: JvVEMUCurrentCharges.AsInteger:=Value;
      4: cbMUSpell.ItemIndex:=GetSpellIndex(Value,cbMUSpell.Items);
      End;
    End;
  IEM_WEAPON:
    Begin
      If Value<0 then
        Value:=0;
      Case Index Of
      1: ;
      2: JvVEWPNoDices.AsInteger:=Value;
      3: JvVEWPSizeDices.AsInteger:=Value;
      4: cbWPDamages.ItemIndex:=GetDamage(Value,cbWPDamages.Items);
      End;
    End;
  IEM_FIREWP:
    Begin
      If Value<0 then
        Value:=0;
      Case Index Of
      1: JvVEFWStrength.AsInteger:=Value;
      2: JvVEFWMaxDistance.AsInteger:=Value;
      3: JvVEFWRangeBonus.AsInteger:=Value;
      4: cbFWWeaponType.ItemIndex:=GetMissileType(Value,cbFWWeaponType.Items);
      End;
    End;
  IEM_MISSILES:
    Begin
      If Value<0 then
        Value:=0;
      Case Index Of
      1: JvVEMissPerc.AsInteger:=Value;
      2: JvVEMissNoDice.AsInteger:=Value;
      3: JvVEMissSizeDice.AsInteger:=Value;
      4: cbMissMissileType.ItemIndex:=GetMissileType(Value,cbMissMissileType.Items);
      End;
    End;
  IEM_ARMOR:
    Begin
      If Value<0 then
        Value:=0;
      Case Index Of
      1: cbARMORAC.ItemIndex:=GetArmorType(Value,cbARMORAC.Items);
      2: cbARMORMAXAC.ItemIndex:=GetArmorType(Value,cbARMORMAXAC.Items);
      3:
        Case Value Of
        0: rgARMORLevel.ItemIndex:=0;
        1..2: rgARMORLevel.ItemIndex:=1;
        3..5: rgARMORLevel.ItemIndex:=2;
        Else
          rgARMORLevel.ItemIndex:=0;
        End;
      4: ;
      End;
    End;
  IEM_TRAP:
    Begin
      Case Index Of
      1: EncodeFlags(Value,FcbTrapFlags);
      2: RGTrapDMG.ItemIndex:=Max(GetTrapDamage(Value,RGTrapDMG.Items),0);
      3: JvVETRAPlvl.AsInteger:=Value;
      4: JvVETRAPCharges.AsInteger:=Value;
      End;
    End;
  IEM_CONTAINER:
    Begin
      Case Index Of
      1: jvVECONTCapacity.AsInteger:=Value;
      2:
        Begin
          EncodeFlags(Value,FcbContainerFlags);
          CheckOpenableContainer;
        End;
      3:
        Begin
          cbCONTKeyNumber.OnChange:=Nil;
          cbCONTKeyNumber.Text:=VNUMToStr(Value);
          cbCONTKeyVNUMReset;
        End;
      4: jvVECONTReduction.Value:=Value;
      End;
    End;
  IEM_NOTE:
    Begin
      Case Index Of
      1: cbNOTELanguage.ItemIndex:=GetLanguage(Value,cbNOTELanguage.Items);
      2..4: ;
      End;
    End;
  IEM_DRINKCONAINER:
    Begin
      Case Index Of
      1: JvVELCMaxUnits.AsInteger:=Value;
      2: JvVELCCurrUnits.AsInteger:=Value;
      3: cbLCLiquid.ItemIndex:=GetLiquid(Value,cbLCLiquid.Items);
      4: EncodeFlags(Value,FcbLiquidContainerFlags);
      End;
    End;
  IEM_FOOD:
    Begin
      Case Index Of
      1: JvVEFOODFullness.AsInteger:=Value;
      2..3: ;
      4: EncodeFlags(Value,FcbFoodFlags);
      End;
    End;
  IEM_KEY:
    Begin
      Case Index Of
      1: EncodeFlags(Value,FcbKeyFlags);
      2..4: ;
      End;
    End;
  IEM_MONEY:
      Case Index Of
      1: JvVEMONEY.AsInteger:=Value;
      2..4: ;
      End;
  IEM_AUDIO:
    Begin
      Case Index Of
      1: JvVEAUDTiming.AsInteger:=Value;
      2..4: ;
      End;
    End;
  End;
end;

function TfrmEditItemValues.GetMaskType: Integer;
begin
  Result:=pcEditMasks.ActivePageIndex;
end;

function TfrmEditItemValues.GetValueFromControl(Index:Integer): Integer;

  Function GetDecodeFlags(cbFlags:Array of TCheckBox):Cardinal;
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

begin
  Case pcEditMasks.ActivePageIndex Of
  IEM_Lightsource: // LightSource
    Case Index Of
      3: Begin
          If cbEternal.Checked then
            Result:=-1
          Else
            Result:=JvVELightDuration.AsInteger;
         End;
      1,2,4:  Result:=FValues[Index];
      Else
        Result:=0;
     End;
  IEM_SU_SPELLCASTER:
    Case Index Of
      1: Result:=JvVESUSpellLevel.AsInteger;
      2:
        If cbSUSpell1.ItemIndex>=0 then
          Result:=PSpell(cbSUSpell1.Items.Objects[cbSUSpell1.ItemIndex])^.ID
        Else
          Result:=0;
      3:
        If cbSUSpell2.ItemIndex>=0 then
          Result:=PSpell(cbSUSpell2.Items.Objects[cbSUSpell2.ItemIndex])^.ID
        Else
          Result:=0;
      4:
        If cbSUSpell3.ItemIndex>=0 then
          Result:=PSpell(cbSUSpell3.Items.Objects[cbSUSpell3.ItemIndex])^.ID
        Else
          Result:=0;
      Else
        Result:=0;
    End;
  IEM_MU_SPELLCASTER:
    Case Index Of
      1: Result:=JvVEMUSpellLevel.AsInteger;
      2: Result:=JvVEMUMaxCharges.AsInteger;
      3: Result:=JvVEMUCurrentCharges.AsInteger;
      4:
        If cbMUSpell.ItemIndex>=0 then
          Result:=PSpell(cbMUSpell.Items.Objects[cbMUSpell.ItemIndex])^.ID
        Else
          Result:=0;
      Else
        Result:=0;
    End;
  IEM_WEAPON:
    Case Index Of
      1: Result:=FValues[1];
      2: Result:=JvVEWPNoDices.AsInteger;
      3: Result:=JvVEWPSizeDices.AsInteger;
      4:
        If cbWPDamages.ItemIndex>=0 then
          Result:=PWPDamage(cbWPDamages.Items.Objects[cbWPDamages.ItemIndex])^.ID
        Else
          Result:=0;
      Else
        Result:=0;
    End;
  IEM_FIREWP:
    Case Index Of
      1: Result:=JvVEFWStrength.AsInteger;
      2: Result:=JvVEFWMaxDistance.AsInteger;
      3: Result:=JvVEFWRangeBonus.AsInteger;
      4:
        If cbFWWeaponType.ItemIndex>=0 then
          Result:=PMissileType(cbFWWeaponType.Items.Objects[cbFWWeaponType.ItemIndex])^.ID
        Else
          Result:=0;
      Else
        Result:=0;
    End;
  IEM_MISSILES:
    Case Index Of
      1: Result:=JvVEMissPerc.AsInteger;
      2: Result:=JvVEMissNoDice.AsInteger;
      3: Result:=JvVEMissSizeDice.AsInteger;
      4:
        If cbMissMissileType.ItemIndex>=0 then
          Result:=PMissileType(cbMissMissileType.Items.Objects[cbMissMissileType.ItemIndex])^.ID
        Else
          Result:=0;
      Else
        Result:=0;
    End;
  IEM_ARMOR:
    Case Index Of
      1:
        If cbARMORAC.ItemIndex>=0 then
          Result:=PArmorType(cbARMORAC.Items.Objects[cbARMORAC.ItemIndex])^.AC
        Else
          Result:=0;
      2:
        If cbARMORMAXAC.ItemIndex>=0 then
          Result:=PArmorType(cbARMORMAXAC.Items.Objects[cbARMORMAXAC.ItemIndex])^.AC
        Else
          Result:=0;
      3:
        Case rgARMORLevel.ItemIndex Of
        1:  Result:=2;
        2:  Result:=5;
        Else
          Result:=0;
        End;
      4: Result:=FValues[Index];
      Else
        Result:=0;
    End;
  IEM_TRAP:
    Case Index Of
      1: Result:=GetDecodeFlags(FcbTrapFlags);
      2:
        If RGTrapDMG.ItemIndex=-1 Then
          Result:=0
        Else
          Result:=PTrapDMG(RGTrapDMG.Items.Objects[RGTrapDMG.ItemIndex]).Tipo;
      3: Result:=JvVETRAPlvl.AsInteger;
      4: Result:=JvVETRAPCharges.AsInteger;
      Else
        Result:=0;
    End;
  IEM_CONTAINER:
    Case Index Of
      1: Result:=jvVECONTCapacity.AsInteger;
      2: Result:=GetDecodeFlags(FcbContainerFlags);
      3: Result:=SpecialStrToVNUM(cbCONTKeyNumber.Text);
      4: Result:=jvVECONTReduction.Value;
      Else
        Result:=0;
    End;
  IEM_NOTE:
    Case Index Of
      1:
        If cbNOTELanguage.ItemIndex>=0 then
          Result:=PLanguage(cbNOTELanguage.Items.Objects[cbNOTELanguage.ItemIndex])^.ID
        Else
          Result:=0;
      2..4: Result:=FValues[Index];
      Else
        Result:=0;
    End;
  IEM_DRINKCONAINER:
    Case Index Of
      1: Result:=JvVELCMaxUnits.AsInteger;
      2: Result:=JvVELCCurrUnits.AsInteger;
      3:
        If cbLCLiquid.ItemIndex>=0 then
          Result:=PLiquid(cbLCLiquid.Items.Objects[cbLCLiquid.ItemIndex])^.ID
        Else
          Result:=0;
      4: Result:=GetDecodeFlags(FcbLiquidContainerFlags);
      Else
        Result:=0;
    End;
  IEM_FOOD:
    Case Index Of
      1: Result:=JvVEFOODFullness.AsInteger;
      2..3: Result:=FValues[Index];
      4: Result:=GetDecodeFlags(FcbFoodFlags);
      Else
        Result:=0;
    End;
  IEM_KEY:
    Case Index Of
      1: Result:=GetDecodeFlags(FcbKeyFlags);
      2..4: Result:=FValues[Index];
      Else
        Result:=0;
    End;
  IEM_MONEY:
    Case Index Of
      1: Result:=JvVEMONEY.AsInteger;
      2..4: Result:=FValues[Index];
      Else
        Result:=0;
    End;
  IEM_AUDIO:
    Case Index Of
      1: Result:=JvVEAUDTiming.AsInteger;
      2..4: Result:=FValues[Index];
      Else
        Result:=0;
    End;
  Else
    Case Index Of
    1..4: Result:=FValues[Index];
    Else
      Result:=0;
    End;
  End;
end;

function TfrmEditItemValues.GetValues(Index: Integer): Integer;
begin
  If Index in [1..4] then
    Result:=GetValueFromControl(Index)
  Else
    Raise EOverflow.Create('List index out of range: '+IntToStr(Index));
end;

procedure TfrmEditItemValues.SetMaskType(const Value: Integer;ItemType:Integer);
var
  LI:Integer;
  LName:String;
begin
  pcEditMasks.ActivePageIndex:=Value;
  Case ItemType Of
  1: // Potion
    Begin
      cbSUSpell1.Clear;
      cbSUSpell2.Clear;
      cbSUSpell3.Clear;
      For LI:=0 to High(CSpells) Do
        If CSpells[LI].SpellBalance[satPotion].Useable Then
          Begin
            If CSpells[LI].MaxLevel>0 Then
              LName:=CSpells[LI].Name+'('+IntToStr(CSpells[LI].MaxLevel)+')'
            Else
              LName:=CSpells[LI].Name;
            cbSUSpell1.AddItem(LName,@CSpells[LI]);
            cbSUSpell2.AddItem(LName,@CSpells[LI]);
            cbSUSpell3.AddItem(LName,@CSpells[LI]);
          End;
    End;
  2: // Scroll
    Begin
      cbSUSpell1.Clear;
      cbSUSpell2.Clear;
      cbSUSpell3.Clear;
      For LI:=0 to High(CSpells) Do
        If CSpells[LI].SpellBalance[satScroll].Useable Then
          Begin
            If CSpells[LI].MaxLevel>0 Then
              LName:=CSpells[LI].Name+'('+IntToStr(CSpells[LI].MaxLevel)+')'
            Else
              LName:=CSpells[LI].Name;
            cbSUSpell1.AddItem(LName,@CSpells[LI]);
            cbSUSpell2.AddItem(LName,@CSpells[LI]);
            cbSUSpell3.AddItem(LName,@CSpells[LI]);
          End;
    End;
  3: // Wand
    Begin
      cbMUSpell.Clear;
      For LI:=0 to High(CSpells) Do
        If CSpells[LI].SpellBalance[satWand].Useable Then
          Begin
            If CSpells[LI].MaxLevel>0 Then
              LName:=CSpells[LI].Name+'('+IntToStr(CSpells[LI].MaxLevel)+')'
            Else
              LName:=CSpells[LI].Name;
            cbMUSpell.AddItem(LName,@CSpells[LI]);
          End;
    End;
  4: // Staff
    Begin
      cbMUSpell.Clear;
      For LI:=0 to High(CSpells) Do
        If CSpells[LI].SpellBalance[satStaff].Useable Then
          Begin
            If CSpells[LI].MaxLevel>0 Then
              LName:=CSpells[LI].Name+'('+IntToStr(CSpells[LI].MaxLevel)+')'
            Else
              LName:=CSpells[LI].Name;
            cbMUSpell.AddItem(LName,@CSpells[LI]);
          End;
    End;
  End;
end;

procedure TfrmEditItemValues.SetValues(Index: Integer;
  const Value: Integer);
begin
  If Index in [1..4] then
    Begin
      FValues[Index]:=Value;
      AssignValueToControl(Index,Value);
    End
  Else
    Raise EOverflow.Create('List index out of range: '+IntToStr(Index));
end;

procedure TfrmEditItemValues.cbEternalClick(Sender: TObject);
begin
  JvVELightDuration.Enabled:=Not cbEternal.Checked;
end;

procedure TfrmEditItemValues.FormCreate(Sender: TObject);
var
  LI,LMaxLines:Integer;
  LRect:TRect;
begin
  cbWPDamages.Clear;
  For LI:=0 to High(CWPDamages) Do
    Begin
      If CWPDamages[LI].SubType in [1..3] Then
        cbWPDamages.AddItem(CWPDamages[LI].Name+'['+CBaseDMG[CWPDamages[LI].SubType]+']',@CWPDamages[LI])
      Else
        cbWPDamages.AddItem(CWPDamages[LI].Name+'[]',@CWPDamages[LI]);
    End;
  cbFWWeaponType.Clear;
  cbMissMissileType.Clear;
  For LI:=0 to High(CMissileTypes) Do
    Begin
      cbFWWeaponType.AddItem(CMissileTypes[LI].MissName,@CMissileTypes[LI]);
      cbMissMissileType.AddItem(CMissileTypes[LI].MissName,@CMissileTypes[LI]);
    End;
  cbARMORAC.Clear;
  For LI:=0 to High(CArmorTypes) Do
    Begin
      cbARMORAC.AddItem(CArmorTypes[LI].Name+'['+IntToStr(CArmorTypes[LI].AC)+']',@CArmorTypes[LI]);
      cbARMORMAXAC.AddItem(CArmorTypes[LI].Name+'['+IntToStr(CArmorTypes[LI].AC)+']',@CArmorTypes[LI]);
    End;
  cbNOTELanguage.Clear;
  For LI:=0 to High(CLanguages) Do
    cbNOTELanguage.AddItem(CLanguages[LI].Name,@CLanguages[LI]);
  LRect.Bottom:=16;
  LRect.Right:=75;
  SetLength(FcbTrapFlags,Length(CTrapFlags));
  LMaxLines:=(gbTrapActivation.Height-15) Div LRect.Bottom;
  For LI:=0 to High(CTrapFlags) Do
    Begin
      LRect.Top:=15+((LI MOD LMaxLines)*LRect.Bottom);
      LRect.Left:=5+((LI Div LMaxLines)*LRect.Right);
      FcbTrapFlags[LI]:=CreateCheckBox(gbTrapActivation,CTrapFlags[LI].ID,CTrapFlags[LI].Name,CTrapFlags[LI].Description,LRect);
    End;
  RGTrapDMG.Items.Clear;
  For LI:=0 to High(CTrapDMG) Do
    RGTrapDMG.Items.AddObject(CTrapDMG[LI].Name,@CTrapDMG[LI]);
  SetLength(FcbContainerFlags,Length(CContainerFlags));
  LMaxLines:=(gbContainerFlags.Height-15) Div LRect.Bottom;
  For LI:=0 to High(CContainerFlags) Do
    Begin
      LRect.Top:=15+((LI MOD LMaxLines)*LRect.Bottom);
      LRect.Left:=5+((LI Div LMaxLines)*LRect.Right);
      If (CContainerFlags[LI].Flags And 1)=1 Then
        FcbContainerFlags[LI]:=CreateCheckBox(gbContainerFlags,CContainerFlags[LI].ID,CContainerFlags[LI].Name,CContainerFlags[LI].Description,LRect,OnCheckContainerOpenable)
      Else
        FcbContainerFlags[LI]:=CreateCheckBox(gbContainerFlags,CContainerFlags[LI].ID,CContainerFlags[LI].Name,CContainerFlags[LI].Description,LRect);
    End;

  SetLength(FcbKeyFlags,Length(CKeyFlags));
  LMaxLines:=(gbKeyFlags.Height-15) Div LRect.Bottom;
  For LI:=0 to High(CKeyFlags) Do
    Begin
      LRect.Top:=15+((LI MOD LMaxLines)*LRect.Bottom);
      LRect.Left:=5+((LI Div LMaxLines)*LRect.Right);
      FcbKeyFlags[LI]:=CreateCheckBox(gbKeyFlags,CKeyFlags[LI].ID,CKeyFlags[LI].Name,CKeyFlags[LI].Description,LRect);
    End;
  For LI:=0 to High(CLiquids) Do
    With CLiquids[LI] Do
      cbLCLiquid.Items.AddObject(
        Name+'('+IntToStr(Drunkness)+','+IntToStr(Fullness)+','+IntToStr(Thirst)+')',
      @CLiquids[LI]);
  SetLength(FcbLiquidContainerFlags,Length(CDrinkContainerFlags));
  LMaxLines:=(gbDrinkContainerFlags.Height-15) Div LRect.Bottom;
  For LI:=0 to High(CDrinkContainerFlags) Do
    Begin
      LRect.Top:=15+((LI MOD LMaxLines)*LRect.Bottom);
      LRect.Left:=5+((LI Div LMaxLines)*LRect.Right);
      FcbLiquidContainerFlags[LI]:=CreateCheckBox(gbDrinkContainerFlags,CDrinkContainerFlags[LI].ID,CDrinkContainerFlags[LI].Name,CDrinkContainerFlags[LI].Description,LRect)
    End;
  SetLength(FcbFoodFlags,Length(CFoodFlags));
  LMaxLines:=(gbFOODFlags.Height-15) Div LRect.Bottom;
  For LI:=0 to High(CFoodFlags) Do
    Begin
      LRect.Top:=15+((LI MOD LMaxLines)*LRect.Bottom);
      LRect.Left:=5+((LI Div LMaxLines)*LRect.Right);
      FcbFoodFlags[LI]:=CreateCheckBox(gbFOODFlags,CFoodFlags[LI].ID,CFoodFlags[LI].Name,CFoodFlags[LI].Description,LRect)
    End;
end;

procedure TfrmEditItemValues.cbARMORACChange(Sender: TObject);
begin
  If cbARMORAC.ItemIndex>=0 then
    Begin
      If cbARMORMAXAC.ItemIndex<cbARMORAC.ItemIndex Then
        cbARMORMAXAC.ItemIndex:=cbARMORAC.ItemIndex
    End
  Else
    cbARMORMAXAC.ItemIndex:=1;
end;

procedure TfrmEditItemValues.FormDestroy(Sender: TObject);
begin
  SetLength(FcbTrapFlags,0);
  SetLength(FcbContainerFlags,0);
  SetLength(FcbLiquidContainerFlags,0);
  SetLength(FcbKeyFlags,0);
  SetLength(FcbFoodFlags,0);
  cbLCLiquid.Clear;
  cbCONTKeyNumber.Clear;
  SetLength(FItemsList,0);
end;

procedure TfrmEditItemValues.cbCONTKeyNumberExit(Sender: TObject);
var
  VNUM:Integer;
  LI:Integer;
begin
  tmrRefresh.Enabled:=False;
  VNUM:=SpecialStrToVNUM(cbCONTKeyNumber.Text);
  For LI:=0 to High(FItemsList) Do
    If FItemsList[LI].ID=VNUM Then
      cbCONTKeyNumber.Text:=VNUMToStr(VNUM)+' ['+FItemsList[LI].Name+']';
end;

procedure TfrmEditItemValues.FillWithObjects(ObjectList: TObjectList);
var
  LI:Integer;
begin
  SetLength(FItemsList,ObjectList.Count);
  cbCONTKeyNumber.Clear;
  For LI:=0 to Pred(ObjectList.Count) Do
    Begin
      FItemsList[LI].ID:=(ObjectList[LI] as TItem).VNum;
      FItemsList[LI].Name:=(ObjectList[LI] as TItem).ShortDesc;
      cbCONTKeyNumber.AddItem(VNUMToStr(FItemsList[LI].ID)+' ['+FItemsList[LI].Name+']',ObjectList[LI]);
    End;
end;

procedure TfrmEditItemValues.tmrRefreshTimer(Sender: TObject);
begin
  tmrRefresh.Enabled:=False;
  Case pcEditMasks.ActivePageIndex of
  IEM_CONTAINER:
    cbCONTKeyVNUMReset;
  IEM_SU_SPELLCASTER:
    Begin
      JvVESUSpellLevel.OnChange:=Nil;
      If cbSUSpell1.ItemIndex>=0 Then
        JvVESUSpellLevel.AsInteger:=Max(JvVESUSpellLevel.AsInteger,PSpell(cbSUSpell1.Items.Objects[cbSUSpell1.ItemIndex]).MaxLevel);
      If cbSUSpell2.ItemIndex>=0 Then
        JvVESUSpellLevel.AsInteger:=Max(JvVESUSpellLevel.AsInteger,PSpell(cbSUSpell2.Items.Objects[cbSUSpell2.ItemIndex]).MaxLevel);
      If cbSUSpell3.ItemIndex>=0 Then
        JvVESUSpellLevel.AsInteger:=Max(JvVESUSpellLevel.AsInteger,PSpell(cbSUSpell3.Items.Objects[cbSUSpell3.ItemIndex]).MaxLevel);
      JvVESUSpellLevel.OnChange:=TimerChechValues;
    End;
  IEM_MU_SPELLCASTER:
    Begin
      JvVEMUSpellLevel.OnChange:=Nil;
      If cbMUSpell.ItemIndex>=0 Then
        JvVEMUSpellLevel.AsInteger:=Max(JvVEMUSpellLevel.AsInteger,PSpell(cbMUSpell.Items.Objects[cbMUSpell.ItemIndex]).MaxLevel);
      JvVEMUSpellLevel.OnChange:=TimerChechValues;
    End;
  End;
end;

procedure TfrmEditItemValues.cbCONTKeyVNUMReset;
var
  VNUM:Integer;
  LI:Integer;
begin
  cbCONTKeyNumber.OnChange:=nil;
  VNUM:=SpecialStrToVNUM(cbCONTKeyNumber.Text);
  For LI:=0 to High(FItemsList) Do
    If FItemsList[LI].ID=VNUM Then
      Begin
        cbCONTKeyNumber.Text:=VNUMToStr(VNUM)+' ['+FItemsList[LI].Name+']';
        cbCONTKeyNumber.SelectAll;
        cbCONTKeyNumber.OnChange:=TimerChechValues;
        Exit;
      End;
  If VNUM>=0 Then
    cbCONTKeyNumber.Text:=VNUMToStr(VNUM)+' [Unknown item]'
  Else
    cbCONTKeyNumber.Text:=VNUMToStr(VNUM)+' [No key]';
  cbCONTKeyNumber.SelectAll;
  cbCONTKeyNumber.OnChange:=TimerChechValues;
end;

procedure TfrmEditItemValues.TimerChechValues(Sender: TObject);
begin
  tmrRefresh.Enabled:=True;
end;

procedure TfrmEditItemValues.OnCheckContainerOpenable(Sender: TObject);
begin
  cbCONTKeyNumber.Enabled:=(Sender As TCheckBox).Checked;
end;

procedure TfrmEditItemValues.CheckOpenableContainer;
var
  LI:Integer;
begin
  For LI:=0 To High(FcbContainerFlags) Do
    If Assigned(FcbContainerFlags[LI].OnClick) Then
      FcbContainerFlags[LI].OnClick(FcbContainerFlags[LI]);
end;

procedure TfrmEditItemValues.JvVELCMaxUnitsChange(Sender: TObject);
begin
  JvVELCCurrUnits.MaxValue:=JvVELCMaxUnits.AsInteger;
end;

procedure TfrmEditItemValues.cbARMORMAXACChange(Sender: TObject);
begin
  If cbARMORAC.ItemIndex>=0 then
    Begin
      If cbARMORMAXAC.ItemIndex<cbARMORAC.ItemIndex Then
        cbARMORAC.ItemIndex:=cbARMORMAXAC.ItemIndex;
      Case cbARMORMAXAC.ItemIndex Of
      0..1: stARMORType.Caption:='Vestiti';
      2..4: stARMORType.Caption:='Armatura leggera';
      5..7: stARMORType.Caption:='Armatura media';
      8..10: stARMORType.Caption:='Armatura pesante';
      Else
        stARMORType.Caption:='Undefined';
      End;
      stARMORSkillFail.Caption:='Skillfail: '+IntToStr(Max(0,cbARMORMAXAC.ItemIndex-4));
      stARMORSpellfail.Caption:='Spellfail: '+IntToStr(Max(0,cbARMORMAXAC.ItemIndex-1));
      Case rgARMORLevel.ItemIndex of
      -1,0:
        Begin
          stRealAC.Caption:='AC'+IntToStr(cbARMORMAXAC.ItemIndex);
          stMinLevel.Caption:='Livello minimo 0';
        End;
      1:
        Begin
          stRealAC.Caption:='AC'+IntToStr(cbARMORMAXAC.ItemIndex+2);
          stMinLevel.Caption:='Livello minimo 10';
        End;
      2:
        Begin
          stRealAC.Caption:='AC'+IntToStr(cbARMORMAXAC.ItemIndex+5);
          stMinLevel.Caption:='Livello minimo 30';
        End;
      Else
        stRealAC.Caption:='Invald AC';
        stMinLevel.Caption:='Livello indefinito';
      End;
    End
  Else
    Begin
      stMinLevel.Caption:='Livello minimo 0';
      stRealAC.Caption:='Invald AC';
      stARMORType.Caption:='Undefined';
      stARMORSkillFail.Caption:='Skillfail: invalid';
      stARMORSpellfail.Caption:='Spellfail: invalid';
      stRealAC.Caption
    End;
end;

procedure TfrmEditItemValues.SUSCChangeSpell(Sender: TObject);
begin
  If cbSUSpell1.ItemIndex>0 Then
    JvVESUSpellLevel.AsInteger:=Max(JvVESUSpellLevel.AsInteger,PSpell(cbSUSpell1.Items.Objects[cbSUSpell1.ItemIndex]).MaxLevel);
  If cbSUSpell2.ItemIndex>0 Then
    JvVESUSpellLevel.AsInteger:=Max(JvVESUSpellLevel.AsInteger,PSpell(cbSUSpell2.Items.Objects[cbSUSpell2.ItemIndex]).MaxLevel);
  If cbSUSpell3.ItemIndex>0 Then
    JvVESUSpellLevel.AsInteger:=Max(JvVESUSpellLevel.AsInteger,PSpell(cbSUSpell3.Items.Objects[cbSUSpell3.ItemIndex]).MaxLevel);
end;

procedure TfrmEditItemValues.MUSCChangeSpell(Sender: TObject);
begin
  If cbMUSpell.ItemIndex>=0 Then
    JvVEMUSpellLevel.AsInteger:=Max(JvVEMUSpellLevel.AsInteger,PSpell(cbMUSpell.Items.Objects[cbMUSpell.ItemIndex]).MaxLevel);
end;

procedure TfrmEditItemValues.JvVEWPSizeDicesChange(Sender: TObject);
begin
  try
    case JvVEWPSizeDices.Value of
    0: stType.Caption:='#ERROR';
    1..3: stType.Caption:='Minuscolo';
    4..6: stType.Caption:='Piccolo';
    7..8: stType.Caption:='Normale';
    9..10: stType.Caption:='2 Mani';
    11..12: stType.Caption:='Ad asta';
    Else
      stType.Caption:='Non usabile';
    End;
  Except
    stType.Caption:='Indefinito';
  End;
  try
    case JvVEWPNoDices.Value of
    0: stLevel.Caption:='#ERROR';
    1: stLevel.Caption:='Per principianti';
    2: stLevel.Caption:='Per esperti';
    3: stLevel.Caption:='Per elite';
    Else
      stLevel.Caption:='Per dei';
    End;
  Except
    stLevel.Caption:='Indefinito';
  End;
end;

procedure TfrmEditItemValues.rgARMORLevelClick(Sender: TObject);
begin
  Case cbARMORMAXAC.ItemIndex Of
  0..1: stARMORType.Caption:='Vestiti';
  2..4: stARMORType.Caption:='Armatura leggera';
  5..7: stARMORType.Caption:='Armatura media';
  8..10: stARMORType.Caption:='Armatura pesante';
  Else
    stARMORType.Caption:='Undefined';
  End;
  stARMORSkillFail.Caption:='Skillfail: '+IntToStr(Max(0,cbARMORMAXAC.ItemIndex-4));
  stARMORSpellfail.Caption:='Spellfail: '+IntToStr(Max(0,cbARMORMAXAC.ItemIndex-1));
  Case rgARMORLevel.ItemIndex of
  -1,0:
    Begin
      stRealAC.Caption:='AC'+IntToStr(cbARMORMAXAC.ItemIndex);
      stMinLevel.Caption:='Livello minimo 0';
    End;
  1:
    Begin
      stRealAC.Caption:='AC'+IntToStr(cbARMORMAXAC.ItemIndex+2);
      stMinLevel.Caption:='Livello minimo 10';
    End;
  2:
    Begin
      stRealAC.Caption:='AC'+IntToStr(cbARMORMAXAC.ItemIndex+5);
      stMinLevel.Caption:='Livello minimo 30';
    End;
  Else
    stRealAC.Caption:='Invald AC';
    stMinLevel.Caption:='Livello indefinito';
  End;
end;

end.
