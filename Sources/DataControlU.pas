unit DataControlU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, UtilsU, ComCtrls, Buttons;

type
  TfrmDataControl = class(TForm)
    pcListViewer: TPageControl;
    tsRooms: TTabSheet;
    lbRoomType: TListBox;
    StaticText1: TStaticText;
    lbRoomFlags: TListBox;
    StaticText2: TStaticText;
    lbDirections: TListBox;
    StaticText3: TStaticText;
    StaticText4: TStaticText;
    lbOpenCommands: TListBox;
    StaticText5: TStaticText;
    lbTeleportFlags: TListBox;
    tsItems: TTabSheet;
    lbItemTypes: TListBox;
    StaticText6: TStaticText;
    lbItemFlags: TListBox;
    StaticText7: TStaticText;
    lbWearFlags: TListBox;
    StaticText8: TStaticText;
    lbApplies: TListBox;
    StaticText9: TStaticText;
    lbArmorTypes: TListBox;
    StaticText14: TStaticText;
    lbMissileTypes: TListBox;
    StaticText13: TStaticText;
    lbKeyFlags: TListBox;
    StaticText21: TStaticText;
    lbLanguages: TListBox;
    StaticText18: TStaticText;
    lbTrapFlags: TListBox;
    StaticText15: TStaticText;
    lbWPDamages: TListBox;
    StaticText12: TStaticText;
    lbAllSpells: TListBox;
    StaticText11: TStaticText;
    lbTrapDamages: TListBox;
    StaticText16: TStaticText;
    lbContainerFlags: TListBox;
    StaticText17: TStaticText;
    StaticText19: TStaticText;
    lbLiquids: TListBox;
    StaticText20: TStaticText;
    lbDrinkContainerFlags: TListBox;
    StaticText22: TStaticText;
    lbFoodFlags: TListBox;
    lbSpellAffects: TListBox;
    StaticText23: TStaticText;
    lbDamageFlags: TListBox;
    StaticText24: TStaticText;
    tsMobiles: TTabSheet;
    lbMobTypes: TListBox;
    StaticText10: TStaticText;
    StaticText25: TStaticText;
    lbGenders: TListBox;
    lbExitFlags: TListBox;
    StaticText26: TStaticText;
    tsZone: TTabSheet;
    lbIniCommands: TListBox;
    StaticText27: TStaticText;
    lbMobLocations: TListBox;
    StaticText28: TStaticText;
    StaticText29: TStaticText;
    lbXPPerLevel: TListBox;
    lbMobPos: TListBox;
    StaticText30: TStaticText;
    StaticText31: TStaticText;
    lbRaces: TListBox;
    lbMobAffects: TListBox;
    StaticText32: TStaticText;
    lbMobActions: TListBox;
    StaticText33: TStaticText;
    lbAlign: TListBox;
    StaticText34: TStaticText;
    lbSpecProcs: TListBox;
    StaticText35: TStaticText;
    BitBtn1: TBitBtn;
    StaticText36: TStaticText;
    lbReactionTargets: TListBox;
    lbClassCombo: TListBox;
    StaticText37: TStaticText;
    lbBRetheWeapons: TListBox;
    StaticText38: TStaticText;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmDataControl: TfrmDataControl;

implementation

uses dmMainU, GeneralTypesU;

{$R *.dfm}

procedure TfrmDataControl.FormCreate(Sender: TObject);
begin
  FillListWithStrings(lbRoomType.Items,GenerateRoomTypeString,Length(CRoomTypes));
  FillListWithStrings(lbRoomFlags.Items,GenerateRoomFlagString,Length(CRoomFlags));
  FillListWithStrings(lbDirections.Items,GenerateDirectionString,Length(CDirections));
  FillListWithStrings(lbOpenCommands.Items,GenerateOpenCommandString,Length(COpenCommands));
  FillListWithStrings(lbTeleportFlags.Items,GenerateTeleportFlagString,Length(CTEleportFlags));
  FillListWithStrings(lbItemTypes.Items,GenerateItemTypeString,Length(CItemTypes));
  FillListWithStrings(lbItemFlags.Items,GenerateObjFlagString,Length(CObjFlags));
  FillListWithStrings(lbWearFlags.Items,GenerateWearFlagString,Length(CWearFlags));
  FillListWithStrings(lbApplies.Items,GenerateApplyString,Length(CObjApplies));
  FillListWithStrings(lbMobTypes.Items,GenerateMobileTypeString,Length(CMobTypeList));
  FillListWithStrings(lbAllSpells.Items,GenerateSpellString,Length(CSpells));
  FillListWithStrings(lbWPDamages.Items,GenerateWPDamageString,Length(CWPDamages));
  FillListWithStrings(lbMissileTypes.Items,GenerateMissileTypeString,Length(CMissileTypes));
  FillListWithStrings(lbArmorTypes.Items,GenerateArmorTypeString,Length(CArmorTypes));
  FillListWithStrings(lbTrapFlags.Items,GenerateTrapFlagString,Length(CTrapFlags));
  FillListWithStrings(lbTrapDamages.Items,GenerateTrapDMGString,Length(CTrapDMG));
  FillListWithStrings(lbContainerFlags.Items,GenerateContainerFlagString,Length(CContainerFlags));
  FillListWithStrings(lbLanguages.Items,GenerateLanguageString,Length(CLanguages));
  FillListWithStrings(lbLiquids.Items,GenerateLiquidString,Length(CLiquids));
  FillListWithStrings(lbDrinkContainerFlags.Items,GenerateLiquidString,Length(CDrinkContainerFlags));
  FillListWithStrings(lbKeyFlags.Items,GenerateKeyFlagList,Length(CKeyFlags));
  FillListWithStrings(lbFoodFlags.Items,GenerateFoodFlagList,Length(CFoodFlags));
  FillListWithStrings(lbSpellAffects.Items,GenerateSpellAffectList,Length(CSpellAffects));
  FillListWithStrings(lbDamageFlags.Items,GenerateDamageFlagString,Length(CDamageFlags));
  FillListWithStrings(lbGenders.Items,GenerateGenderString,Length(CMobGenders));
  FillListWithStrings(lbExitFlags.Items,GenerateExitFlagList,Length(CExitFlags));
  FillListWithStrings(lbIniCommands.Items,GenerateIniCommandList,Length(CIniCommands));
  FillListWithStrings(lbMobLocations.Items,GenerateMobLocationList,Length(CMobLocations));
  FillListWithStrings(lbXPPerLevel.Items,GenerateXPPerLevelList,Length(CXPPerLevel));
  FillListWithStrings(lbMobPos.Items,GenerateMobPosList,Length(CMobPos));
  FillListWithStrings(lbRaces.Items,GenerateRaceList,Length(CRaces));
  FillListWithStrings(lbMobAffects.Items,GenerateMobAffectList,Length(CMobAffects));
  FillListWithStrings(lbMobActions.Items,GenerateMobActionList,Length(CMobActions));
  FillListWithStrings(lbAlign.Items,GenerateAlignList,Length(CAlignment));
  FillListWithStrings(lbSpecProcs.Items,GenerateSpecialProcList,ProcedureList.Count);
  FillListWithStrings(lbReactionTargets.Items,GenerateReactionTargetList,Length(CReactionTargets));
  FillListWithStrings(lbClassCombo.Items,GenerateClassCombinationList,Length(CClassCombinations));
  FillListWithStrings(lbBRetheWeapons.Items,GenerateBretheTypeList,Length(CBretheWeaponTypes));
end;

end.
