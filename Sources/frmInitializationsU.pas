unit frmInitializationsU;

interface

uses
  Windows, GeneralTypesU, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, ExtCtrls, StdCtrls, JvExStdCtrls, JvEdit,
  JvValidateEdit, JvExControls, JvSpeedButton, Buttons, ActnList,
  XPStyleActnCtrls, ActnMan, fraVariableU;

type
  TfrmInitializations = class(TForm)
    pcInitializations: TPageControl;
    tsLoadItem: TTabSheet;
    tsPutItem: TTabSheet;
    tsLoadMobile: TTabSheet;
    tsEquipItem: TTabSheet;
    tsGiveItem: TTabSheet;
    pblButtons: TPanel;
    tsReaction: TTabSheet;
    rgLoadItemAction: TRadioGroup;
    Label1: TLabel;
    cbLoadItem: TComboBox;
    Label2: TLabel;
    JvVELoadItemLimit: TJvValidateEdit;
    StaticText1: TStaticText;
    Label3: TLabel;
    cbLoadItemRoom: TComboBox;
    Label4: TLabel;
    JvVELoadItemRoomLimit: TJvValidateEdit;
    lbLoadItemInventory: TListBox;
    amInitializations: TActionManager;
    aApply: TAction;
    aUndo: TAction;
    JvSpeedButton1: TJvSpeedButton;
    JvSpeedButton2: TJvSpeedButton;
    JvSpeedButton3: TJvSpeedButton;
    aAddItem: TAction;
    aDeleteItem: TAction;
    aEdit: TAction;
    Label5: TLabel;
    cbLoadMob: TComboBox;
    Label6: TLabel;
    JvVELoadMobLimit: TJvValidateEdit;
    Label7: TLabel;
    cbLoadMOBRoom: TComboBox;
    pcLoadMobExtras: TPageControl;
    tsLoadMobEquipment: TTabSheet;
    tsLoadMobInventory: TTabSheet;
    tsLoadMobReactions: TTabSheet;
    lbLoadMobEquipment: TListBox;
    lbLoadMobInventory: TListBox;
    lbLoadMobReactions: TListBox;
    JvSpeedButton4: TJvSpeedButton;
    JvSpeedButton5: TJvSpeedButton;
    JvSpeedButton6: TJvSpeedButton;
    JvSpeedButton7: TJvSpeedButton;
    JvSpeedButton8: TJvSpeedButton;
    JvSpeedButton9: TJvSpeedButton;
    JvSpeedButton10: TJvSpeedButton;
    JvSpeedButton11: TJvSpeedButton;
    Label8: TLabel;
    edtEquipItemLocation: TEdit;
    Label9: TLabel;
    cbEquipItem: TComboBox;
    Label10: TLabel;
    cbGiveItem: TComboBox;
    Label11: TLabel;
    cbPutItem: TComboBox;
    JvSpeedButton13: TJvSpeedButton;
    JvSpeedButton14: TJvSpeedButton;
    JvSpeedButton15: TJvSpeedButton;
    lbPutItemInventory: TListBox;
    StaticText2: TStaticText;
    JvSpeedButton16: TJvSpeedButton;
    JvSpeedButton17: TJvSpeedButton;
    JvSpeedButton18: TJvSpeedButton;
    lbEquipItemInventory: TListBox;
    StaticText3: TStaticText;
    JvSpeedButton19: TJvSpeedButton;
    JvSpeedButton20: TJvSpeedButton;
    JvSpeedButton21: TJvSpeedButton;
    lbGiveItemInventory: TListBox;
    StaticText4: TStaticText;
    cbReactionKind: TComboBox;
    Label13: TLabel;
    rgReaction: TRadioGroup;
    fvTarget: TfraVariable;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    procedure aApplyExecute(Sender: TObject);
    procedure aUndoExecute(Sender: TObject);
    procedure cbEquipItemChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure aAddItemExecute(Sender: TObject);
    procedure aDeleteItemExecute(Sender: TObject);
    procedure aEditExecute(Sender: TObject);
    procedure cbReactionKindChange(Sender: TObject);
    procedure DrawItem(Control: TWinControl; Index: Integer; Rect: TRect;
      State: TOwnerDrawState);
  private
    FInit: TBaseInitialization;
    FZone: TZone;
    { Private declarations }
    Procedure Apply;
    Procedure Change(aBaseInit:TBaseInitialization);
    procedure SetInit(const Value: TBaseInitialization);
    procedure SetZone(const Value: TZone);
    Function TestCanSave:Boolean;
    Procedure RefreshInventory;
  public
    { Public declarations }
    Property Zone:TZone read FZone write SetZone;
    Property Init:TBaseInitialization read FInit write SetInit;
  end;

var
  frmInitializations: TfrmInitializations;

implementation

uses dmMainU, UtilsU;

{$R *.dfm}

{ TfrmInitializations }

procedure TfrmInitializations.Apply;
var
  LI:Integer;
  LReaction:TReaction;
  LReactionTarget:PReactionTarget;
begin
  pcInitializations.Show;
  If Assigned(FZone) And Assigned(FInit) Then
    Begin
      Case FInit.Command of
      ifEquipItem:
        Begin
          FZone.FillList(cbEquipItem.Items,ptRoomVNUM);
          SetSelectedEntityInComboBox(cbEquipItem,FInit.VNUM);
        End;
      ifFear:
        Begin
          rgReaction.ItemIndex:=0;
          LReaction:=(FInit as TReaction);
          For LI:=0 to Pred(cbReactionKind.Items.Count) Do
            Begin
              LReactionTarget:=PReactionTarget(cbReactionKind.Items.Objects[LI]);
              If LReactionTarget^.ID=LReaction.Kind Then
                Begin
                  cbReactionKind.ItemIndex:=LI;
                  fvTarget.ParameterType:=LReactionTarget^.Par;
                  fvTarget.ParamLabel:='Paura verso '+LReactionTarget^.Name;
                  fvTarget.ParamValue:=IntToStr(FInit.RefVNUM);
                  Break;
                End;
            End;
          tsReaction.Show;
        End;
      ifGiveObject:
        Begin
          FZone.FillList(cbGiveItem.Items,ptItemVNUM);
          SetSelectedEntityInComboBox(cbGiveItem,FInit.VNUM);
          tsGiveItem.Show;
        End;
      ifHate:
        Begin
          rgReaction.ItemIndex:=1;
          LReaction:=(FInit as TReaction);
          For LI:=0 to Pred(cbReactionKind.Items.Count) Do
            Begin
              LReactionTarget:=PReactionTarget(cbReactionKind.Items.Objects[LI]);
              If LReactionTarget^.ID=LReaction.Kind Then
                Begin
                  cbReactionKind.ItemIndex:=LI;
                  fvTarget.ParameterType:=LReactionTarget^.Par;
                  fvTarget.ParamLabel:='Odio verso '+LReactionTarget^.Name;
                  fvTarget.ParamValue:=IntToStr(FInit.RefVNUM);
                End;
            End;
          tsReaction.Show;
        End;
      ifLoadMobile:
        Begin
          FZone.FillList(cbLoadMob.Items,ptMobVNUM);
          FZone.FillList(cbLoadMOBRoom.Items,ptRoomVNUM);
          JvVELoadMobLimit.AsInteger:=FInit.Limit;
          SetSelectedEntityInComboBox(cbLoadMob,FInit.VNUM);
          SetSelectedEntityInComboBox(cbLoadMOBRoom,FInit.RefVNUM);
          tsLoadMobile.Show;
        End;
      ifRemoveObject:
        Begin
          rgLoadItemAction.ItemIndex:=1;
          FZone.FillList(cbLoadItem.Items,ptItemVNUM);
          FZone.FillList(cbLoadItemRoom.Items,ptRoomVNUM);
          JvVELoadItemLimit.AsInteger:=FInit.Limit;
          SetSelectedEntityInComboBox(cbLoadItem,FInit.VNUM);
          SetSelectedEntityInComboBox(cbLoadItemRoom,FInit.RefVNUM);
          JvVELoadItemRoomLimit.AsInteger:=(FInit as TItemInit).RoomLimit;
          tsLoadItem.Show;
        End;
      ifLoadObject:
        Begin
          rgLoadItemAction.ItemIndex:=0;
          FZone.FillList(cbLoadItem.Items,ptItemVNUM);
          FZone.FillList(cbLoadItemRoom.Items,ptRoomVNUM);
          JvVELoadItemLimit.AsInteger:=FInit.Limit;
          SetSelectedEntityInComboBox(cbLoadItem,FInit.VNUM);
          SetSelectedEntityInComboBox(cbLoadItemRoom,FInit.RefVNUM);
          JvVELoadItemRoomLimit.AsInteger:=(FInit as TItemInit).RoomLimit;
          lbLoadItemInventory.Clear;
          tsLoadItem.Show;
        End;
      ifPutObject:
        Begin
          FZone.FillList(cbPutItem.Items,ptItemVNUM);
          SetSelectedEntityInComboBox(cbPutItem,FInit.VNUM);
          tsPutItem.Show;
        End;
      else
        pcInitializations.Hide;
      End;
      RefreshInventory;
    End;
end;

procedure TfrmInitializations.Change(aBaseInit: TBaseInitialization);
begin
  Case aBaseInit.Command Of
  ifLoadObject,ifRemoveObject:
    Begin
      Case rgLoadItemAction.ItemIndex Of
      0: FInit.Command:=ifLoadObject;
      1: FInit.Command:=ifRemoveObject;
      End;
      FInit.RefVNUM:=SpecialStrToVNUM(cbLoadItemRoom.Text);
      FInit.Limit:=JvVELoadItemLimit.AsInteger;
      (FInit as TItemInit).RoomLimit:=JvVELoadItemRoomLimit.AsInteger;
    End;
  ifLoadMobile:
    Begin
      FInit.RefVNUM:=SpecialStrToVNUM(cbLoadMOBRoom.Text);
      FInit.Limit:=JvVELoadMobLimit.AsInteger;
    End;
  ifPutObject:
    Begin
      aBaseInit.VNUM:=SpecialStrToVNUM(cbPutItem.Text);
    End;
  ifEquipItem:
    Begin
      aBaseInit.VNUM:=SpecialStrToVNUM(cbEquipItem.Text);
    End;
  ifGiveObject:
    Begin
      aBaseInit.VNUM:=SpecialStrToVNUM(cbGiveItem.Text);
    End;
  ifHate,ifFear:
    Begin
      Case rgReaction.ItemIndex Of
      0: aBaseInit.Command:=ifFear;
      1: aBaseInit.Command:=ifHate;
      End;
      if cbReactionKind.ItemIndex>=0 then
        (aBaseInit as TReaction).Kind:=PReactionTarget(cbReactionKind.Items.Objects[cbReactionKind.ItemIndex])^.ID;
      aBaseInit.RefVNUM:=StrToIntDef(fvTarget.ParamValue,0);
    End;
  End;
End;

procedure TfrmInitializations.SetInit(const Value: TBaseInitialization);
begin
  FInit := Value;
  Apply;
end;

procedure TfrmInitializations.SetZone(const Value: TZone);
begin
  FZone := Value;
  fvTarget.Zone:=FZone;
  Apply;
end;

procedure TfrmInitializations.aApplyExecute(Sender: TObject);
begin
  Change(FInit);
  ModalResult:=mrOk;
end;

procedure TfrmInitializations.aUndoExecute(Sender: TObject);
begin
  ModalResult:=mrCancel;
end;

procedure TfrmInitializations.cbEquipItemChange(Sender: TObject);
begin
  TestCanSave;
end;

function TfrmInitializations.TestCanSave: Boolean;
var
  LVNUM:Integer;
begin
  If Assigned(FInit) Then
    Begin
      Case FInit.Command Of
      ifEquipItem:
        Begin
          LVNUM:=SpecialStrToVNUM(cbEquipItem.Text);
          aApply.Enabled:=LVNUM>0;
        End;
      ifGiveObject:
        Begin
          LVNUM:=SpecialStrToVNUM(cbGiveItem.Text);
          aApply.Enabled:=LVNUM>0;
        End;
      ifLoadMobile:
        Begin
          LVNUM:=SpecialStrToVNUM(cbLoadMOBRoom.Text);
          aApply.Enabled:=LVNUM>0;
        End;
      ifLoadObject,ifRemoveObject:
        Begin
          LVNUM:=SpecialStrToVNUM(cbLoadItemRoom.Text);
          aApply.Enabled:=LVNUM>0;
        End;
      ifPutObject:
        Begin
          LVNUM:=SpecialStrToVNUM(cbPutItem.Text);
          aApply.Enabled:=LVNUM>0;
        End;
      Else
        aApply.Enabled:=False;
      End;
    End
  Else
    aApply.Enabled:=False;
  Result:=aApply.Enabled;
end;

procedure TfrmInitializations.FormCreate(Sender: TObject);
var
  LI:Integer;
begin
  cbReactionKind.Clear;
  For LI:=0 to High(CReactionTargets) Do
    cbReactionKind.AddItem(CReactionTargets[LI].Name,@CReactionTargets[LI]);
end;

procedure TfrmInitializations.aDeleteItemExecute(Sender: TObject);
var
  LInit:TBaseInitialization;
  LPos:Integer;
begin
  Case FInit.Command Of
  ifEquipItem:
    If lbEquipItemInventory.ItemIndex>=0 then
      Begin
        LInit:=lbEquipItemInventory.Items.Objects[lbEquipItemInventory.ItemIndex] as TBaseInitialization;
        LPos:=(FInit as TItemInit).Inventory.IndexOf(LInit);
        If LPos>=0 Then
          (FInit as TItemInit).Inventory.Delete(LPos);
      End;
  ifGiveObject:
    If lbGiveItemInventory.ItemIndex>=0 then
      Begin
        LInit:=lbGiveItemInventory.Items.Objects[lbGiveItemInventory.ItemIndex] as TBaseInitialization;
        LPos:=(FInit as TItemInit).Inventory.IndexOf(LInit);
        If LPos>=0 Then
          (FInit as TItemInit).Inventory.Delete(LPos);
      End;
  ifHate,ifFear: ;
  ifLoadMobile:
    Case pcLoadMobExtras.ActivePageIndex Of
    0:
      If lbLoadMobEquipment.ItemIndex>=0 then
        FreeAndNil((FInit as TMobileInit).Equipment[lbLoadMobEquipment.ItemIndex]);
    1:
      If lbLoadMobInventory.ItemIndex>=0 then
        Begin
          LInit:=lbLoadMobInventory.Items.Objects[lbLoadMobInventory.ItemIndex] as TBaseInitialization;
          LPos:=(FInit as TMobileInit).Inventory.IndexOf(LInit);
          If LPos>=0 Then
            (FInit as TMobileInit).Inventory.Delete(LPos);
        End;
    2:
      if lbLoadMobReactions.ItemIndex>=0 Then
        Begin
          LInit:=lbLoadMobReactions.Items.Objects[lbLoadMobReactions.ItemIndex] as TBaseInitialization;
          LPos:=(FInit as TMobileInit).Reactions.IndexOf(LInit);
          If LPos>=0 Then
            (FInit as TMobileInit).Reactions.Delete(LPos);
        End;
    End;
  ifLoadObject,ifRemoveObject:
    If lbLoadItemInventory.ItemIndex>=0 then
      Begin
        LInit:=lbLoadItemInventory.Items.Objects[lbLoadItemInventory.ItemIndex] as TBaseInitialization;
        LPos:=(FInit as TItemInit).Inventory.IndexOf(LInit);
        If LPos>=0 Then
          (FInit as TItemInit).Inventory.Delete(LPos);
      End;
  ifPutObject:
    If lbPutItemInventory.ItemIndex>=0 then
      Begin
        LInit:=lbPutItemInventory.Items.Objects[lbPutItemInventory.ItemIndex] as TBaseInitialization;
        LPos:=(FInit as TItemInit).Inventory.IndexOf(LInit);
        If LPos>=0 Then
          (FInit as TItemInit).Inventory.Delete(LPos);
      End;
  End;
  RefreshInventory;
end;

procedure TfrmInitializations.RefreshInventory;
var
  LPos,LI:integer;
  LInventory:TInitList;
  LMobInit:TMobileInit;
  LReaction:TReaction;
  LString:String;
begin
  If Assigned(FZone) And Assigned(FInit) Then
    Case FInit.Command Of
    ifEquipItem:
      Begin
        lbEquipItemInventory.Clear;
        LInventory:=(FInit as TItemInit).Inventory;
        For LI:=0 to Pred(LInventory.Count) Do
          Begin
            LPos:=FZone.Items.IndexOf(LInventory[LI].VNUM);
            If LPos>=0 Then
              lbEquipItemInventory.AddItem(FZone.Items[LPos].ListName,LInventory[LI])
            Else
              lbEquipItemInventory.AddItem(IntToStr(LInventory[LI].VNUM)+' [Oggetto sconosciuto]',LInventory[LI]);
          End;
      End;
    ifFear: ;
    ifGiveObject:
      Begin
        lbGiveItemInventory.Clear;
        LInventory:=(FInit as TItemInit).Inventory;
        For LI:=0 to Pred(LInventory.Count) Do
          Begin
            LPos:=FZone.Items.IndexOf(LInventory[LI].VNUM);
            If LPos>=0 Then
              lbGiveItemInventory.AddItem(FZone.Items[LPos].ListName,LInventory[LI])
            Else
              lbGiveItemInventory.AddItem(IntToStr(LInventory[LI].VNUM)+' [Oggetto sconosciuto]',LInventory[LI]);
          End;
      End;
    ifHate: ;
    ifLoadMobile:
      Begin
        lbLoadMobInventory.Clear;
        LMobInit:=FInit as TMobileInit;
        LInventory:=LMobInit.Inventory;
        For LI:=0 to Pred(LInventory.Count) Do
          Begin
            LPos:=FZone.Items.IndexOf(LInventory[LI].VNUM);
            If LPos>=0 Then
              lbLoadMobInventory.AddItem(FZone.Items[LPos].ListName,LInventory[LI])
            Else
              lbLoadMobInventory.AddItem(IntToStr(LInventory[LI].VNUM)+' [Oggetto sconosciuto]',LInventory[LI]);
          End;
        lbLoadMobEquipment.Clear;
        For LI:=0 to High(LMobInit.Equipment) Do
          If Assigned(LMobInit.Equipment[LI]) Then
            Begin
              LPos:=FZone.Items.IndexOf(LMobInit.Equipment[LI].VNUM);
              If LPos>=0 Then
                lbLoadMobEquipment.AddItem(CMobLocations[LI].Name+' - '+FZone.Items[LPos].ListName,LMobInit.Equipment[LI])
              Else
                lbLoadMobEquipment.AddItem(CMobLocations[LI].Name+' - '+VNumToStr(LMobInit.Equipment[LI].VNUM)+' [Oggetto sconosciuto]',LMobInit.Equipment[LI])
            End
          Else
            lbLoadMobEquipment.AddItem(CMobLocations[LI].Name+' - (Empty)',Nil);
        lbLoadMobReactions.Clear;
        LInventory:=LMobInit.Reactions;
        For LI:=0 to Pred(LInventory.Count) Do
          Begin
            LReaction:=LInventory[LI] as TReaction;
            Case LReaction.Command of
            ifFear: LString:='Paura verso ';
            ifHate: LString:='Odio verso ';
            End;
            LPos:=GetReactionTargetIndex(LReaction.Kind);
            If LPos>=0 Then
              LString:=LString+CReactionTargets[LPos].Name+' '+FZone.DecodeParameterValue(CReactionTargets[LPos].Par,IntToStr(LReaction.RefVNUM),True)
            Else
              LString:=LString+'qualcosa di sconosciuto:'+IntToStr(LReaction.RefVNUM);
            lbLoadMobReactions.AddItem(LString,LInventory[LI]);
          End;
      End;
    ifLoadObject,ifRemoveObject:
      Begin
        lbLoadItemInventory.Clear;
        LInventory:=(FInit as TItemInit).Inventory;
        For LI:=0 to Pred(LInventory.Count) Do
          Begin
            LPos:=FZone.Items.IndexOf(LInventory[LI].VNUM);
            If LPos>=0 Then
              lbLoadItemInventory.AddItem(FZone.Items[LPos].ListName,LInventory[LI])
            Else
              lbLoadItemInventory.AddItem(IntToStr(LInventory[LI].VNUM)+' [Oggetto sconosciuto]',LInventory[LI]);
          End;
      End;
    ifPutObject:
      Begin
        lbPutItemInventory.Clear;
        LInventory:=(FInit as TItemInit).Inventory;
        For LI:=0 to Pred(LInventory.Count) Do
          Begin
            LPos:=FZone.Items.IndexOf(LInventory[LI].VNUM);
            If LPos>=0 Then
              lbPutItemInventory.AddItem(FZone.Items[LPos].ListName,LInventory[LI])
            Else
              lbPutItemInventory.AddItem(IntToStr(LInventory[LI].VNUM)+' [Oggetto sconosciuto]',LInventory[LI]);
          End;
      End;
    End;
end;

procedure TfrmInitializations.aEditExecute(Sender: TObject);
var
  LPos:Integer;
  LInit:TBaseInitialization;
begin
  Case FInit.Command Of
  ifEquipItem:
    If lbEquipItemInventory.ItemIndex>=0 Then
      With TfrmInitializations.Create(Self) Do
        Try
          Zone:=Self.FZone;
          Init:=Self.lbEquipItemInventory.Items.Objects[Self.lbEquipItemInventory.ItemIndex] as TBaseInitialization;
          ShowModal;
        Finally
          Free;
        End;
  ifFear: ;
  ifGiveObject:
    If lbGiveItemInventory.ItemIndex>=0 Then
      With TfrmInitializations.Create(Self) Do
        Try
          Zone:=Self.FZone;
          Init:=Self.lbGiveItemInventory.Items.Objects[Self.lbGiveItemInventory.ItemIndex] as TBaseInitialization;
          ShowModal;
        Finally
          Free;
        End;
  ifHate: ;
  ifLoadMobile:
    Case pcLoadMobExtras.ActivePageIndex Of
    0:
      Begin
        LPos:=lbLoadMobEquipment.ItemIndex;
        If LPos>=0 Then
          If Assigned((FInit as TMobileInit).Equipment[LPos]) Then
            With TfrmInitializations.Create(Self) Do
              Try
                Zone:=Self.FZone;
                edtEquipItemLocation.Text:=CMobLocations[LPos].Name;
                Init:=(Self.FInit as TMobileInit).Equipment[LPos];
                ShowModal;
              Finally
                Free;
              End
          Else
            Begin
              LInit:=TItemInit.Create;
              Try
                LInit.Command:=ifPutObject;
                LInit.RefVNUM:=FInit.VNUM;
                (LInit as TItemInit).RoomLimit:=LPos;
                With TfrmInitializations.Create(Self) Do
                  Try
                    Zone:=Self.FZone;
                    edtEquipItemLocation.Text:=CMobLocations[LPos].Name;
                    Init:=LInit;
                    if ShowModal=mrOk Then
                      (Self.FInit as TMobileInit).Equipment[LPos]:=LInit as TItemInit
                    Else
                      LInit.Free;
                  Finally
                    Free;
                  End;
              Except
                LInit.Free;
              End;
            End;
      End;
    1:
      If lbLoadMobInventory.ItemIndex>=0 Then
        With TfrmInitializations.Create(Self) Do
          Try
            Zone:=Self.FZone;
            Init:=Self.lbLoadMobInventory.Items.Objects[Self.lbLoadMobInventory.ItemIndex] as TBaseInitialization;
            ShowModal;
          Finally
            Free;
          End;
    2:
      If lbLoadMobReactions.ItemIndex>=0 Then
        With TfrmInitializations.Create(Self) Do
          Try
            Zone:=Self.FZone;
            Init:=Self.lbLoadMobReactions.Items.Objects[Self.lbLoadMobReactions.ItemIndex] as TBaseInitialization;
            ShowModal;
          Finally
            Free;
          End;
    End;
  ifLoadObject,ifRemoveObject:
    If lbLoadItemInventory.ItemIndex>=0 Then
      With TfrmInitializations.Create(Self) Do
        Try
          Zone:=Self.FZone;
          Init:=Self.lbLoadItemInventory.Items.Objects[Self.lbLoadItemInventory.ItemIndex] as TBaseInitialization;
          ShowModal;
        Finally
          Free;
        End;
  ifPutObject:
    If lbPutItemInventory.ItemIndex>=0 Then
      With TfrmInitializations.Create(Self) Do
        Try
          Zone:=Self.FZone;
          Init:=Self.lbPutItemInventory.Items.Objects[Self.lbPutItemInventory.ItemIndex] as TBaseInitialization;
          ShowModal;
        Finally
          Free;
        End;
  End;
  RefreshInventory;
end;

procedure TfrmInitializations.aAddItemExecute(Sender: TObject);
var
  LPos:Integer;
  LInit:TBaseInitialization;
begin
  Case FInit.Command Of
  ifHate,ifFear: ;
  ifEquipItem,ifGiveObject,ifLoadObject,ifRemoveObject,ifPutObject:
    Begin
      LInit:=TItemInit.Create;
      Try
        LInit.Command:=ifPutObject;
        LInit.RefVNUM:=FInit.VNUM;
        With TfrmInitializations.Create(Self) Do
          Try
            Zone:=Self.FZone;
            Init:=LInit;
            if ShowModal=mrOk Then
              (Self.FInit as TItemInit).Inventory.Add(LInit)
            Else
              LInit.Free;
          Finally
            Free;
          End;
      Except
        LInit.Free;
      End;
    End;
  ifLoadMobile:
    Case pcLoadMobExtras.ActivePageIndex Of
    0:
      Begin
        LPos:=lbLoadMobEquipment.ItemIndex;
        If LPos>=0 Then
          If Assigned((FInit as TMobileInit).Equipment[LPos]) Then
            With TfrmInitializations.Create(Self) Do
              Try
                Zone:=Self.FZone;
                edtEquipItemLocation.Text:=CMobLocations[LPos].Name;
                Init:=(Self.FInit as TMobileInit).Equipment[LPos];
                ShowModal;
              Finally
                Free;
              End
          Else
            Begin
              LInit:=TItemInit.Create;
              Try
                LInit.Command:=ifPutObject;
                LInit.RefVNUM:=FInit.VNUM;
                (LInit as TItemInit).RoomLimit:=LPos;
                With TfrmInitializations.Create(Self) Do
                  Try
                    Zone:=Self.FZone;
                    edtEquipItemLocation.Text:=CMobLocations[LPos].Name;
                    Init:=LInit;
                    if ShowModal=mrOk Then
                      (Self.FInit as TMobileInit).Equipment[LPos]:=LInit as TItemInit
                    Else
                      LInit.Free;
                  Finally
                    Free;
                  End;
              Except
                LInit.Free;
              End;
            End;
      End;
    1:
      Begin
        LInit:=TItemInit.Create;
        Try
          LInit.Command:=ifGiveObject;
          LInit.RefVNUM:=FInit.VNUM;
          With TfrmInitializations.Create(Self) Do
            Try
              Zone:=Self.FZone;
              Init:=LInit;
              if ShowModal=mrOk Then
                (Self.FInit as TMobileInit).Inventory.Add(LInit)
              Else
                LInit.Free;
            Finally
              Free;
            End;
        Except
          LInit.Free;
        End;
      End;
    2:
      Begin
        LInit:=TReaction.Create;
        Try
          LInit.Command:=ifFear;
          With TfrmInitializations.Create(Self) Do
            Try
              Zone:=Self.FZone;
              Init:=LInit;
              if ShowModal=mrOk Then
                (Self.FInit as TMobileInit).Reactions.Add(LInit)
              Else
                LInit.Free;
            Finally
              Free;
            End;
        Except
          LInit.Free;
          Raise ;
        End;
      End;
    End;
  End;
  RefreshInventory;
end;

procedure TfrmInitializations.cbReactionKindChange(Sender: TObject);
var
  LReactionTarget:PReactionTarget;
begin
  if cbReactionKind.ItemIndex>=0 then
    Begin
      LReactionTarget:=PReactionTarget(cbReactionKind.Items.Objects[cbReactionKind.ItemIndex]);
      fvTarget.ParameterType:=LReactionTarget^.Par;
      Case rgReaction.ItemIndex Of
      0: fvTarget.ParamLabel:='Paura verso '+LReactionTarget^.Name;
      1: fvTarget.ParamLabel:='Odio verso '+LReactionTarget^.Name;
      End;
    End;
end;

procedure TfrmInitializations.DrawItem(Control: TWinControl;
  Index: Integer; Rect: TRect; State: TOwnerDrawState);
var
  LLB:TListBox;
begin
  LLB:=Control as TListBox;
  if odSelected in State Then
    PaintNebbieString(LLB.Canvas,LLB.Items[Index],Rect,cmSelected)
  Else
    PaintNebbieString(LLB.Canvas,LLB.Items[Index],Rect,cmNormal);
end;

end.
