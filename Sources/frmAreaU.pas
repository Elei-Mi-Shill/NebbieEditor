unit frmAreaU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, ImgList, XPStyleActnCtrls, ActnList, ActnMan,
  XPMan, ToolWin, ActnCtrls, ActnMenus, Contnrs,frmRoomU, JvExStdCtrls,
  JvEdit, JvValidateEdit, GeneralTypesU, ExtCtrls, frmMobU, frmObjectsU, Math,
  Buttons;

type
  TfrmArea = class(TForm)
    pcEntities: TPageControl;
    tsMobs: TTabSheet;
    lbMobs: TListBox;
    ammbArea: TActionMainMenuBar;
    amArea: TActionManager;
    aCloseWindow: TAction;
    aNewitem: TAction;
    aDeleteItem: TAction;
    aEditItem: TAction;
    tsRooms: TTabSheet;
    lbRooms: TListBox;
    tsItems: TTabSheet;
    tsZone: TTabSheet;
    Label1: TLabel;
    Label2: TLabel;
    edtZoneDescription: TEdit;
    lblTop: TLabel;
    JvVEZoneID: TJvValidateEdit;
    JvVETopRoom: TJvValidateEdit;
    JvVEZoneLifeSpan: TJvValidateEdit;
    Label3: TLabel;
    rgResetMode: TRadioGroup;
    lbItems: TListBox;
    aShowErrors: TAction;
    aClone: TAction;
    aApplyModifies: TAction;
    aUndoModifies: TAction;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    tnArea: TToolBar;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    ToolButton4: TToolButton;
    ToolButton5: TToolButton;
    ToolButton6: TToolButton;
    ToolButton7: TToolButton;
    ToolButton8: TToolButton;
    tsStatistics: TTabSheet;
    lbStatistics: TListBox;
    tsInits: TTabSheet;
    lbInitializations: TListBox;
    aMoveEntityGroup: TAction;
    ToolButton9: TToolButton;
    ToolButton10: TToolButton;
    tsUnresolvedSpecials: TTabSheet;
    lbSpecials: TListBox;
    aSave: TAction;
    aReopen: TAction;
    ToolButton11: TToolButton;
    ToolButton12: TToolButton;
    ToolButton13: TToolButton;
    aExportEntities: TAction;
    aImportEntities: TAction;
    procedure aCloseWindowExecute(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure aNewitemExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure aDeleteItemExecute(Sender: TObject);
    procedure tsZoneShow(Sender: TObject);
    Procedure RefreshList(aList:EEntityList);
    procedure lbRoomsDblClick(Sender: TObject);
    procedure lbMobsDblClick(Sender: TObject);
    procedure lbItemsDblClick(Sender: TObject);
    procedure DrawListIcons(Control: TWinControl; Index: Integer;
      Rect: TRect; State: TOwnerDrawState);
    procedure aShowErrorsExecute(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure aEditItemExecute(Sender: TObject);
    procedure aCloneExecute(Sender: TObject);
    procedure aApplyModifiesExecute(Sender: TObject);
    procedure aUndoModifiesExecute(Sender: TObject);
    procedure tsStatisticsShow(Sender: TObject);
    procedure tsRoomsShow(Sender: TObject);
    procedure tsMobsShow(Sender: TObject);
    procedure tsItemsShow(Sender: TObject);
    procedure FormHide(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure edtZoneDescriptionKeyPress(Sender: TObject; var Key: Char);
    procedure lbInitializationsDrawItem(Control: TWinControl;
      Index: Integer; Rect: TRect; State: TOwnerDrawState);
    procedure tsInitsShow(Sender: TObject);
    procedure aMoveEntityGroupExecute(Sender: TObject);
    procedure tsUnresolvedSpecialsShow(Sender: TObject);
    procedure lbSpecialsDblClick(Sender: TObject);
    procedure aReopenExecute(Sender: TObject);
    procedure aSaveExecute(Sender: TObject);
    procedure aExportEntitiesExecute(Sender: TObject);
    procedure aImportEntitiesExecute(Sender: TObject);
    procedure lbMobsDragOver(Sender, Source: TObject; X, Y: Integer;
      State: TDragState; var Accept: Boolean);
    procedure lbItemsDragOver(Sender, Source: TObject; X, Y: Integer;
      State: TDragState; var Accept: Boolean);
    procedure lbRoomsDragOver(Sender, Source: TObject; X, Y: Integer;
      State: TDragState; var Accept: Boolean);
    procedure lbRoomsDragDrop(Sender, Source: TObject; X, Y: Integer);
    procedure lbMobsDragDrop(Sender, Source: TObject; X, Y: Integer);
    procedure lbItemsDragDrop(Sender, Source: TObject; X, Y: Integer);
  private
    { Private declarations }
    FZone:TZone;
    FfrmRoom:TfrmRoom;
    FfrmItem:TfrmObjects;
    FfrmMOB:TfrmMob;
    procedure OnFormClose(Sender: TObject; var Action: TCloseAction);
    procedure SetZone(const Value: TZone);
    Function CreateRoomForm:TfrmRoom;
    Function CreateObjectFrom:TfrmObjects;
    Function CreateMobileForm:TfrmMob;
  public
    { Public declarations }
    Procedure Changed(Sender:TObject;Lists:SEntityList);
    Procedure SaveExecute(Sender: TObject);
    Procedure SaveAsExecute(Sender: TObject);
    Property Zone:TZone read FZone write SetZone;
    Procedure ShowRoom(VNUM:Integer);
    Procedure ShowMob(VNUM:Integer);
    Procedure ShowObject(VNUM:Integer);
  end;

  TZoneItem=Class(TObject)
  Private
    FZone:TZone;
    FForm:TfrmArea;
    FLogErrors:TStrings;
    FLogWarnings:TStrings;
    FOnChange: TChangeNotification;
    procedure SetForm(const Value: TfrmArea);
    Procedure FormDestroy(Sender:TObject);
    procedure SetOnChange(const Value: TChangeNotification);
    Procedure ZoneChanged(Sender:TObject;ChangedLists:SEntityList);
  public
    Property OnChange:TChangeNotification read FOnChange write SetOnChange;
    Property Zone:TZone read FZone;
    Property EditForm:TfrmArea read FForm write SetForm;
    Property Errors:TStrings read FLogErrors;
    Property Warnings:TStrings read FLogWarnings;
    Constructor Create; Virtual;
    destructor Destroy; override;
    Procedure OpenForm;
    Function LoadZone(aZoneFile:String):HRESULT;
    Function Reload:HRESULT;
    Function SaveZone(aZoneFile:String=''):HRESULT;
    Function ShortZoneInfo:String;
  End;

var
  frmArea: TfrmArea;

implementation

uses DateUtils, UtilsU, frmChooseVNumU, dmMainU, Types, frmShowErrorsU,
  frmMainU, frmChooseMovingIntervalU, frmChooseEntityTypeU,
  frmEntityChooserU;
{$R *.dfm}

Type
  RMoveEntityList=Record
    OldVNUM,NewVNUM:Integer;
    CanMove,Exists,InOtherZones:Array[EEntityList] of Boolean;
  End;

{ TZoneList }

constructor TZoneItem.Create;
begin
  Inherited Create;
  FLogErrors:=TStringList.Create;
  FLogWarnings:=TStringList.Create;
  FZone:=TZone.Create;
  FZone.OnChange:=ZoneChanged;
  FForm:=Nil;
end;

destructor TZoneItem.Destroy;
begin
  if Assigned(FForm) Then
    Begin
      FForm.OnDestroy:=Nil;
      FreeAndNil(FForm);
    End;
  FreeAndNil(FZone);
  FreeAndNil(FLogErrors);
  FreeAndNil(FLogWarnings);
  inherited Destroy;
end;

procedure TZoneItem.FormDestroy(Sender: TObject);
begin
  FForm.OnDestroy:=Nil;
  FForm:=Nil;
end;

function TZoneItem.LoadZone(aZoneFile: String): HRESULT;
begin
  Result:=FZone.LoadZone(aZoneFile,FLogErrors);
end;

procedure TZoneItem.OpenForm;
begin
  If Not Assigned(FForm) Then
    Begin
      FForm:=TfrmArea.Create(frmMain);
      FForm.OnDestroy:=FormDestroy;
    End;
  FForm.Zone:=FZone;
  FForm.Caption:=ShortZoneInfo;
  FForm.Show;
end;

function TZoneItem.Reload: HRESULT;
begin
  FLogErrors.Clear;
  Result:=FZone.LoadZone(FZone.FileName,FLogErrors);
end;

function TZoneItem.SaveZone(aZoneFile: String): HRESULT;
begin
  Try
    FZone.SaveZone(aZoneFile);
    Result:=S_OK;
  Except
    Result:=E_FAIL;
  End;
end;

procedure TZoneItem.SetForm(const Value: TfrmArea);
begin
  If Value<>FForm Then
    FreeAndNil(FForm);
  FForm := Value;
  If Assigned(FForm) Then
    Begin
      FForm.OnDestroy:=FormDestroy;
      FZone.OnChange:=FForm.Changed;
      FZone.Changed([elInit,elItems,elMobiles,elRooms]);
    End
  Else
    FZone.OnChange:=Nil;
end;

procedure TZoneItem.SetOnChange(const Value: TChangeNotification);
begin
  FOnChange := Value;
end;

function TZoneItem.ShortZoneInfo: String;
var
  FirstRoomVNUM,LastRoomVNUM:Integer;
begin
  If FZone.Rooms.First<>Nil Then
    Begin
      FirstRoomVNUM:=(FZone.Rooms.First as TRoom).VNum;
      LastRoomVNUM:=(FZone.Rooms.Last as TRoom).VNum;
    End
  Else
    Begin
      FirstRoomVNUM:=-1;
      LastRoomVNUM:=-1;
    End;
  Result:='['+ForceStrLen(VNUMToStr(FZone.TopRoom),6,' ',True) +'] ['+ForceStrLen(VNUMToStr(FirstRoomVNUM),6,' ',True) +'-'+ForceStrLen(VNUMToStr(LastRoomVNUM),6,' ',True) +'] ['+ForceStrLen(IntToStr(FZone.ZoneID),6,' ',True)+'] - '+FZone.Name;
end;

procedure TZoneItem.ZoneChanged(Sender: TObject;ChangedLists:SEntityList);
begin
  If Assigned(FForm) Then
    FForm.Changed(FZone,ChangedLists);
  If Assigned(FOnChange) Then
    FOnChange(Self,ChangedLists);
end;

procedure TfrmArea.aCloseWindowExecute(Sender: TObject);
begin
  try
    Close;
  Except
    On E:Exception Do
      dmMain.clMain.LogException(Self,'Close',E);
  End;
end;

procedure TfrmArea.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  //frmMain.aSave.OnExecute:=Nil;
  //frmMain.aSaveAs.OnExecute:=Nil;
  pcEntities.ActivePageIndex:=0;
  Free;
end;

procedure TfrmArea.aNewitemExecute(Sender: TObject);
var
  LI,LJ:Integer;
  LStr:String;
begin
  Case pcEntities.ActivePageIndex Of
    1: // Room
      Begin
        LI:=FZone.GetFirstFreeVNum(elRooms,0);
        LJ:=FZone.GetLastFreeVNum(elRooms);
        If LI=LJ Then
          Begin
            If Not Assigned(FfrmRoom) Then
              FfrmRoom:=CreateRoomForm;
            FfrmRoom.RoomData:=FZone.AddRoom(LI);
            FfrmRoom.Show;
          End
        Else
          With TfrmChooseVNum.Create(Self) Do
            Try
              FirstVNum:=LI;
              LastVNum:=LJ;
              If ShowModal=mrOk Then
                Begin
                  LI:=ResultVNum;
                  If Not Assigned(FfrmRoom) Then
                    FfrmRoom:=CreateRoomForm;
                  FfrmRoom.RoomData:=FZone.AddRoom(LI);
                  FfrmRoom.Show;
                End;
            Finally
              Free;
            End;
        RefreshList(elRooms);
      End;
    2: // Mobiles
      Begin
        LI:=FZone.GetFirstFreeVNum(elMobiles,0);
        LJ:=FZone.GetLastFreeVNum(elMobiles);
        If LI=LJ Then
          Begin
            If Not Assigned(FfrmMOB) Then
              FfrmMOB:=CreateMobileForm;
            FfrmMOB.Mob:=FZone.AddMobile(LI);
            FfrmMOB.Show;
          End
        Else
          With TfrmChooseVNum.Create(Self) Do
            Try
              FirstVNum:=LI;
              LastVNum:=LJ;
              If ShowModal=mrOk Then
                Begin
                  LI:=ResultVNum;
                  If Not Assigned(FfrmMOB) Then
                    FfrmMOB:=CreateMobileForm;
                  FfrmMOB.Mob:=FZone.AddMobile(LI);
                  FfrmRoom.Show;
                End;
            Finally
              Free;
            End;
        RefreshList(elMobiles);
      End;
    3: // Items
      Begin
        LI:=FZone.GetFirstFreeVNum(elItems,0);
        LJ:=FZone.GetLastFreeVNum(elItems);
        If LI=LJ Then
          Begin
            If Not Assigned(FfrmItem) Then
              FfrmItem:=CreateObjectFrom;
            FfrmItem.ItemData:=FZone.AddItem(LI);
            FfrmItem.Show;
          End
        Else
          With TfrmChooseVNum.Create(Self) Do
            Try
              FirstVNum:=LI;
              LastVNum:=LJ;
              If ShowModal=mrOk Then
                Begin
                  LI:=ResultVNum;
                  If Not Assigned(FfrmItem) Then
                    FfrmItem:=CreateObjectFrom;
                  FfrmItem.ItemData:=FZone.AddItem(LI);
                  FfrmItem.Show;
                End;
            Finally
              Free;
            End;
        RefreshList(elItems);
      End;
    4:
      Begin
        LStr:='';
        If InputQuery('Modifica speciale','Speciale',LStr) Then
          Begin
            lbSpecials.Items.Add(LStr);
            FZone.UnresolvedSpecials.Assign(lbSpecials.Items);
          End;
      End;
  End;
end;

procedure TfrmArea.FormCreate(Sender: TObject);
var
  LI:Integer;
begin
  {FfrmRoom:=TfrmRoom.Create(Self);
  FfrmItem:=TfrmObjects.Create(Self);
  FfrmMOB:=TfrmMob.Create(Self);}
  FfrmRoom:=Nil;
  FfrmItem:=Nil;
  FfrmMOB:=Nil;
  For LI:=0 to High(CResetModes) Do
    rgResetMode.Items.Add(CResetModes[LI].Name);
end;

procedure TfrmArea.aDeleteItemExecute(Sender: TObject);
begin
  Case pcEntities.ActivePageIndex Of
    1: // Room
      Begin
        If lbRooms.ItemIndex>=0 then
          Begin
            FZone.Initializations.DeleteRoomInstances(FZone.Rooms[lbRooms.ItemIndex].VNum);
            FZone.Rooms.Delete(lbRooms.ItemIndex);
          End;
        RefreshList(elRooms);
      End;
    2: // Mobiles
      Begin
        If lbMobs.ItemIndex>=0 then
          Begin
            FZone.Initializations.DeleteMobileInstances(FZone.Mobs[lbMobs.ItemIndex].VNum);
            FZone.Mobs.Delete(lbMobs.ItemIndex);
          End;
        RefreshList(elMobiles);
      End;
    3: // Items
      Begin
        If lbItems.ItemIndex>=0 then
          Begin
            FZone.Initializations.DeleteObjectInstances(FZone.Items[lbItems.ItemIndex].VNum);
            FZone.Items.Delete(lbItems.ItemIndex);
          End;
        RefreshList(elItems);
      End;
    4:
      Begin
        If lbSpecials.ItemIndex>=0 Then
          Begin
            lbSpecials.Items.Delete(lbSpecials.ItemIndex);
            FZone.UnresolvedSpecials.Assign(lbSpecials.Items);
          End;
      End;
  End;
end;

procedure TfrmArea.tsZoneShow(Sender: TObject);
begin
  aDeleteItem.Enabled:=False;
  aNewitem.Enabled:=False;
  aEditItem.Enabled:=False;
  aShowErrors.Enabled:=False;
  aClone.Enabled:=False;
  aMoveEntityGroup.Enabled:=False;
end;

procedure TfrmArea.RefreshList(aList: EEntityList);
var
  LI:Integer;
  LMobRates:RMobRatings;
begin
  Case aList of
  elInit:
    Begin
      JvVEZoneID.AsInteger:=Zone.ZoneID;
      JvVEZoneLifeSpan.AsInteger:=Zone.LifeSpan;
      JvVETopRoom.AsInteger:=Zone.TopRoom;
      edtZoneDescription.Text:=Zone.Name;
      rgResetMode.ItemIndex:=Zone.ResetMode;
      Caption:='Zone - '+FZone.Name;
    End;
  elRooms:
    Begin
      lbRooms.Clear;
      For LI:=0 to Pred(FZone.Rooms.Count) Do
        With (FZone.Rooms[LI] as TRoom) Do
          lbRooms.AddItem(ListName,FZone.Rooms[LI]);
    End;
  elMobiles:
    Begin
      lbMobs.Clear;
      For LI:=0 to Pred(FZone.Mobs.Count) Do
        With (FZone.Mobs[LI] as TMobile) Do
          lbMobs.AddItem('$c0014lvl.:'+ForceStrLen(IntToStr(Level),2,' ',True)+' $c0011CR:'+ForceStrLen(FormatFloat('0.00',GetCreatureRating(LMobRates)),5,' ',True)+'$c0007 '+ListName,FZone.Mobs[LI]);
    End;
  elItems:
    Begin
      lbItems.Clear;
      For LI:=0 to Pred(FZone.Items.Count) Do
        Begin
          Assert(Assigned(FZone.Items[LI]));
          With (FZone.Items[LI] as TItem) Do
            lbItems.AddItem('$c0011lvl:'+ForceStrLen(IntToStr(GetLevel),3,' ',True)+'$c0007 '+ListName,FZone.Items[LI]);
        End;
    End;
  End;
end;

procedure TfrmArea.lbRoomsDblClick(Sender: TObject);
begin
  If lbRooms.ItemIndex>=0 Then
    Begin
      If Not Assigned(FfrmRoom) Then
        FfrmRoom:=CreateRoomForm;
      FfrmRoom.RoomData:=(FZone.Rooms[lbRooms.ItemIndex] as TRoom);
      FfrmRoom.Show;
    End;
end;

procedure TfrmArea.lbMobsDblClick(Sender: TObject);
begin
  If lbMobs.ItemIndex>=0 Then
    Begin
      If Not Assigned(FfrmMOB) Then
        FfrmMOB:=CreateMobileForm;
      FfrmMOB.Mob:=(FZone.Mobs[lbMobs.ItemIndex] as TMobile);
      FfrmMOB.Show;
    End;
end;

procedure TfrmArea.lbItemsDblClick(Sender: TObject);
begin
  If lbItems.ItemIndex>=0 Then
    Begin
      If Not Assigned(FfrmItem) Then
        FfrmItem:=CreateObjectFrom;
      FfrmItem.ItemData:=(FZone.Items[lbItems.ItemIndex] as TItem);
      FfrmItem.Show;
    End;
end;

procedure TfrmArea.DrawListIcons(Control: TWinControl; Index: Integer;
  Rect: TRect; State: TOwnerDrawState);
var
  LRect:TRect;
  LEntity:TGeneralEntity;
  LLB:TListBox;
  LColState:EColorMode;
begin
  LLB:=(Control as TListBox);
  LColState:=cmNormal;
  If (odGrayed in State) or (odDisabled in State) Then
    Begin
      LLB.Canvas.Brush.Color:=LLB.Color;
      LLB.Canvas.Font.Color:=clGrayText;
      LColState:=cmDisabled;
    End
  Else If odSelected in State Then
    Begin
      LLB.Canvas.Brush.Color:=clHighlight;
      LLB.Canvas.Font.Color:=clHighlightText;
      LColState:=cmSelected;
    End;
  If odChecked in State Then
    LLB.Font.Style:=LLB.Font.Style+[fsBold]
  Else
    LLB.Font.Style:=LLB.Font.Style-[fsBold];
  LLB.Canvas.FillRect(Rect);
  LRect:=Rect;
  LRect.Right:=LRect.Left+16;
  LEntity:=(LLB.Items.Objects[Index] as TGeneralEntity);
  Case Control.Tag Of
  1:
    Begin
      If LEntity.EType=-1 Then
        Begin
          dmMain.DrawIcon(ilTerrain,LLB.Canvas,LRect,(LEntity as TRoom).ETrueType);
          dmMain.DrawIcon(ilTerrainFlag,LLB.Canvas,LRect,0);
        End
      Else
        dmMain.DrawIcon(ilTerrain,LLB.Canvas,LRect,LEntity.EType);
      If (LEntity.Flags And RFM_Death)>0 Then
        dmMain.DrawIcon(ilTerrainFlag,LLB.Canvas,LRect,1);
    End;
  2:
    Begin
      dmMain.DrawIcon(ilMOB,LLB.Canvas,LRect,LEntity.EType);
      If FZone.Initializations.CountInstancesOfMob(LEntity.VNum)=0 Then
        dmMain.DrawIcon(ilGeneral,LLB.Canvas,LRect,54);
    End;
  3:
    Begin
      dmMain.DrawIcon(ilObject,LLB.Canvas,LRect,Pred(LEntity.EType));
      If FZone.Initializations.CountInstancesOfItem(LEntity.VNum)=0 Then
        dmMain.DrawIcon(ilGeneral,LLB.Canvas,LRect,54);
    End;
  End;
  LRect.Left:=Succ(LRect.Right);
  LRect.Right:=LRect.Left+16;
  If LEntity.IsCorrect Then
    dmMain.DrawIcon(ilChecked,LLB.Canvas,LRect,1)
  Else
    dmMain.DrawIcon(ilChecked,LLB.Canvas,LRect,0);
  Rect.Left:=Succ(LRect.Right);
  PaintNebbieString(LLB.Canvas,LLB.Items[Index],Rect,LColState);
  //LLB.Canvas.TextRect(Rect,Rect.Left,Rect.Top,LLB.Items[Index]);
end;

procedure TfrmArea.aShowErrorsExecute(Sender: TObject);
Var
  LEntity:TGeneralEntity;
begin
  LEntity:=Nil;
  Case pcEntities.ActivePageIndex Of
    1: // Room
      Begin
        If lbRooms.ItemIndex>=0 Then
          LEntity:=(FZone.Rooms[lbRooms.ItemIndex] as TGeneralEntity);
      End;
    2: // Mobiles
      Begin
        If lbMobs.ItemIndex>=0 Then
          LEntity:=(FZone.Mobs[lbMobs.ItemIndex] as TGeneralEntity);
      End;
    3: // Items
      Begin
        If lbItems.ItemIndex>=0 Then
          LEntity:=(FZone.Items[lbItems.ItemIndex] as TGeneralEntity);
      End;
  End;
  If Assigned(LEntity) Then
    With TfrmShowErrors.Create(Self) Do
      Try
        memErrors.Lines.Assign(LEntity.Errors);
        If LEntity is TMobile Then
          If FZone.Initializations.CountInstancesOfMob(LEntity.VNum)=0 Then
            memErrors.Lines.Insert(0,'Nessuna istanza di questo MOB viene inizializzata in questa zona!');
        If LEntity is TItem Then
          If FZone.Initializations.CountInstancesOfItem(LEntity.VNum)=0 Then
            memErrors.Lines.Insert(0,'Nessuna istanza di questo oggetto viene inizializzata in questa zona!');
        ShowModal;
      Finally
        Free;
      End;
end;

procedure TfrmArea.SaveAsExecute(Sender: TObject);
begin
  If dmMain.sdMain.Execute Then
    Zone.FileName:=dmMain.sdMain.FileName
  Else
    Abort;
  Zone.SaveZone(Zone.Filename);
end;

procedure TfrmArea.SaveExecute(Sender: TObject);
begin
  If Zone.FileName='' Then
    If dmMain.sdMain.Execute Then
      Zone.FileName:=dmMain.sdMain.FileName
    Else
      Abort;
  Zone.SaveZone(Zone.Filename);
end;

procedure TfrmArea.FormShow(Sender: TObject);
begin
  pcEntities.ActivePageIndex:=0;
end;

procedure TfrmArea.Changed(Sender:TObject;Lists:SEntityList);
begin
  If elInit in Lists Then RefreshList(elInit);
  If elRooms in Lists Then RefreshList(elRooms);
  If elMobiles in Lists Then RefreshList(elMobiles);
  If elItems in Lists Then RefreshList(elItems);
end;

procedure TfrmArea.aEditItemExecute(Sender: TObject);
var
  LStr:String;
begin
  Case pcEntities.ActivePageIndex Of
    1: // Room
      Begin
        If lbRooms.ItemIndex>=0 Then
          Begin
            If Not Assigned(FfrmRoom) Then
              FfrmRoom:=CreateRoomForm;
            FfrmRoom.RoomData:=(FZone.Rooms[lbRooms.ItemIndex] as TRoom);
            FfrmRoom.Show;
          End;
      End;
    2: // Mobiles
      Begin
        If lbMobs.ItemIndex>=0 Then
          Begin
            If Not Assigned(FfrmMOB) Then
              FfrmMOB:=CreateMobileForm;
            FfrmMOB.Mob:=(FZone.Mobs[lbMobs.ItemIndex] as TMobile);
            FfrmMOB.Show;
          End;
      End;
    3: // Items
      Begin
        If lbItems.ItemIndex>=0 Then
          Begin
            If Not Assigned(FfrmItem) Then
              FfrmItem:=CreateObjectFrom;
            FfrmItem.ItemData:=(FZone.Items[lbItems.ItemIndex] as TItem);
            FfrmItem.Show;
          End;
      End;
    4:
      Begin
        If lbSpecials.ItemIndex>=0 Then
          Begin
            LStr:=lbSpecials.Items[lbSpecials.ItemIndex];
            If InputQuery('Modifica speciale','Speciale',LStr) Then
              Begin
                lbSpecials.Items[lbSpecials.ItemIndex]:=LStr;
                FZone.UnresolvedSpecials.Assign(lbSpecials.Items);
              End;
          End;
      End;
  End;
end;

procedure TfrmArea.aCloneExecute(Sender: TObject);
var
  LI,LJ:Integer;
  LGeneralEntity:TGeneralEntity;
begin
  Case pcEntities.ActivePageIndex Of
    1: // Room
      Begin
        If lbRooms.ItemIndex>=0 Then
          Begin
            LI:=FZone.GetFirstFreeVNum(elRooms,0);
            LJ:=FZone.GetLastFreeVNum(elRooms);
            If LI=LJ Then
              Begin
                LGeneralEntity:=TRoom.Create;
                Try
                  LGeneralEntity.Assign(FZone.Rooms[lbRooms.ItemIndex]);
                  LGeneralEntity.VNum:=LI;
                  FZone.AddRoom(LGeneralEntity as TRoom);
                  RefreshList(elRooms);
                Except
                  LGeneralEntity.Free;
                End;
              End
            Else
              With TfrmChooseVNum.Create(Self) Do
                Try
                  FirstVNum:=LI;
                  LastVNum:=LJ;
                  If ShowModal=mrOk Then
                    Begin
                      LI:=ResultVNum;
                      LGeneralEntity:=TRoom.Create;
                      Try
                        LGeneralEntity.Assign(FZone.Rooms[lbRooms.ItemIndex]);
                        LGeneralEntity.VNum:=LI;
                        FZone.AddRoom(LGeneralEntity as TRoom);
                        RefreshList(elRooms);
                      Except
                        LGeneralEntity.Free;
                      End;
                    End;
                Finally
                  Free;
                End;
          End;
      End;
    2: // Mobiles
      Begin
        If lbMobs.ItemIndex>=0 Then
          Begin
            LI:=FZone.GetFirstFreeVNum(elMobiles,0);
            LJ:=FZone.GetLastFreeVNum(elMobiles);
            If LI=LJ Then
              Begin
                LGeneralEntity:=TMobile.Create;
                Try
                  LGeneralEntity.Assign(FZone.Mobs[lbMobs.ItemIndex]);
                  LGeneralEntity.VNum:=LI;
                  FZone.AddMobile(LGeneralEntity as TMobile);
                  RefreshList(elMobiles);
                Except
                  LGeneralEntity.Free;
                End;
              End
            Else
              With TfrmChooseVNum.Create(Self) Do
                Try
                  FirstVNum:=LI;
                  LastVNum:=LJ;
                  If ShowModal=mrOk Then
                    Begin
                      LI:=ResultVNum;
                      LGeneralEntity:=TMobile.Create;
                      Try
                        LGeneralEntity.Assign(FZone.Mobs[lbMobs.ItemIndex]);
                        LGeneralEntity.VNum:=LI;
                        FZone.AddMobile(LGeneralEntity as TMobile);
                        RefreshList(elMobiles);
                      Except
                        LGeneralEntity.Free;
                      End;
                    End;
                Finally
                  Free;
                End;
          End;
      End;
    3: // Items
      Begin
        If lbItems.ItemIndex>=0 Then
          Begin
            LI:=FZone.GetFirstFreeVNum(elItems,0);
            LJ:=FZone.GetLastFreeVNum(elItems);
            If LI=LJ Then
              Begin
                LGeneralEntity:=TItem.Create;
                Try
                  LGeneralEntity.Assign(FZone.Items[lbItems.ItemIndex]);
                  LGeneralEntity.VNum:=LI;
                  FZone.AddItem(LGeneralEntity as TItem);
                  RefreshList(elItems);
                Except
                  LGeneralEntity.Free;
                End;
              End
            Else
              With TfrmChooseVNum.Create(Self) Do
                Try
                  FirstVNum:=LI;
                  LastVNum:=LJ;
                  If ShowModal=mrOk Then
                    Begin
                      LI:=ResultVNum;
                      LGeneralEntity:=TItem.Create;
                      Try
                        LGeneralEntity.Assign(FZone.Items[lbItems.ItemIndex]);
                        LGeneralEntity.VNum:=LI;
                        FZone.AddItem(LGeneralEntity as TItem);
                        RefreshList(elItems);
                      Except
                        LGeneralEntity.Free;
                      End;
                    End;
                Finally
                  Free;
                End;
          End;
      End;
  End;
end;

procedure TfrmArea.SetZone(const Value: TZone);
begin
  FZone := Value;
  If Assigned(FZone) Then
    Begin
      If Assigned(FfrmRoom) Then
        FfrmRoom.Zone:=FZone;
      If Assigned(FfrmItem) Then
        FfrmItem.Zone:=FZone;
      If Assigned(FfrmMOB) Then
        FfrmMOB.Zone:=FZone;
      lbSpecials.Items.Assign(FZone.UnresolvedSpecials);
      tsUnresolvedSpecials.TabVisible:=lbSpecials.Count>0;
      Changed(FZone,[elInit,elItems,elMobiles,elRooms]);
    End;
end;

procedure TfrmArea.aApplyModifiesExecute(Sender: TObject);
begin
  FZone.Name:=edtZoneDescription.Text;
  FZone.ZoneID:=JvVEZoneID.AsInteger;
  FZone.LifeSpan:=JvVEZoneLifeSpan.AsInteger;
  FZone.TopRoom:=JvVETopRoom.AsInteger;
  If rgResetMode.ItemIndex>=0 Then
    FZone.ResetMode:=CResetModes[rgResetMode.ItemIndex].ID
  Else
    rgResetMode.ItemIndex:=CResetModes[0].ID;
  FZone.Changed([elInit]);
end;

procedure TfrmArea.aUndoModifiesExecute(Sender: TObject);
begin
  edtZoneDescription.Text:=FZone.Name;
  JvVEZoneID.AsInteger:=FZone.ZoneID;
  JvVEZoneLifeSpan.AsInteger:=FZone.LifeSpan;
  JvVETopRoom.AsInteger:=FZone.TopRoom;
  GetResetModeIndex(FZone.ResetMode);
end;

procedure TfrmArea.tsStatisticsShow(Sender: TObject);
var
  LI:Integer;
  LFirst:Integer;
  LLast:Integer;
  LUnused:Integer;
  LMobStats:Array[0..7] of Integer;
  LSumLevels:Integer;
begin
  aDeleteItem.Enabled:=False;
  aNewitem.Enabled:=False;
  aEditItem.Enabled:=False;
  aShowErrors.Enabled:=False;
  aClone.Enabled:=False;
  aMoveEntityGroup.Enabled:=False;
  lbStatistics.Clear;
  lbStatistics.AddItem('Filename:"'+FZone.FileName+'"',nil);
  LUnused:=0;
  If FZone.Rooms.Count>0 Then
    Begin
      LFirst:=FZone.Rooms[0].VNum;
      LLast:=LFirst;
      For LI:=1 to Pred(FZone.Rooms.Count) Do
        Begin
          LUnused:=LUnused+FZone.Rooms[LI].VNum-LLast-1;
          LLast:=FZone.Rooms[LI].VNum;
        End;
    End
  Else
    Begin
      LFirst:=-1;
      LLast:=-1;
    End;
  lbStatistics.AddItem(
    Format('La zona ha %d stanze dalla [%s] alla [%s] con in mezzo %d VNUM inutilizzati',[FZone.Rooms.Count,VNUMToStr(LFirst),VNUMToStr(LLast),LUnused]),
    Nil
  );
  LUnused:=0;
  If FZone.Items.Count>0 Then
    Begin
      LFirst:=FZone.Items[0].VNum;
      LLast:=LFirst;
      For LI:=1 to Pred(FZone.Items.Count) Do
        Begin
          LUnused:=LUnused+FZone.Items[LI].VNum-LLast-1;
          LLast:=FZone.Items[LI].VNum;
        End;
    End
  Else
    Begin
      LFirst:=-1;
      LLast:=-1;
    End;
  lbStatistics.AddItem(
    Format('La zona ha %d oggetti dal [%s] al [%s] con in mezzo %d VNUM inutilizzati.',[FZone.Items.Count,VNUMToStr(LFirst),VNUMToStr(LLast),LUnused]),
    Nil
  );
  LUnused:=0;
  For LI:=0 to High(LMobStats) Do
    FillMemory(@LMobStats[LI],SizeOf(LMobStats[LI]),0);
  If FZone.Mobs.Count>0 Then
    Begin
      LFirst:=FZone.Mobs[0].VNum;
      LSumLevels:=(FZone.Mobs[0] as TMobile).Level;
      Case (FZone.Mobs[0] as TMobile).Level of
      0..5: Inc(LMobStats[0]);
      6..15: Inc(LMobStats[1]);
      16..25: Inc(LMobStats[2]);
      26..35: Inc(LMobStats[3]);
      36..45: Inc(LMobStats[4]);
      46..50: Inc(LMobStats[5]);
      51..52: Inc(LMobStats[6]);
      53..60: Inc(LMobStats[7]);
      End;
      LLast:=LFirst;
      For LI:=1 to Pred(FZone.Mobs.Count) Do
        Begin
          LUnused:=LUnused+FZone.Mobs[LI].VNum-LLast-1;
          LSumLevels:=LSumLevels+(FZone.Mobs[LI] as TMobile).Level;
          Case (FZone.Mobs[LI] as TMobile).Level of
          0..5: Inc(LMobStats[0]);
          6..15: Inc(LMobStats[1]);
          16..25: Inc(LMobStats[2]);
          26..35: Inc(LMobStats[3]);
          36..45: Inc(LMobStats[4]);
          46..50: Inc(LMobStats[5]);
          51: Inc(LMobStats[6]);
          52..60: Inc(LMobStats[7]);
          End;
          LLast:=FZone.Mobs[LI].VNum;
        End;
    End
  Else
    Begin
      LFirst:=-1;
      LLast:=-1;
      LSumLevels:=0;
    End;
  lbStatistics.AddItem(
    Format('La zona ha %d mobs dal [%s] al [%s] con in mezzo %d VNUM inutilizzati.',[FZone.Mobs.Count,VNUMToStr(LFirst),VNUMToStr(LLast),LUnused]),
    Nil
  );
  If FZone.Mobs.Count>0 Then
    Begin
      lbStatistics.AddItem('Informazioni sui MOB',nil);
      lbStatistics.AddItem(
        'Il livello medio dei '+IntToStr(FZone.Mobs.Count)+' mobs é '+FormatFloat('0.0',LSumLevels/FZone.Mobs.Count)+' di cui:',
        Nil
      );
      lbStatistics.AddItem(IntToStr(LMobStats[0])+' mobs fra il 1 ed il 5 livello',nil);
      lbStatistics.AddItem(IntToStr(LMobStats[1])+' mobs fra il 6 ed il 15 livello',nil);
      lbStatistics.AddItem(IntToStr(LMobStats[2])+' mobs fra il 16 ed il 25 livello',nil);
      lbStatistics.AddItem(IntToStr(LMobStats[3])+' mobs fra il 26 ed il 35 livello',nil);
      lbStatistics.AddItem(IntToStr(LMobStats[4])+' mobs fra il 36 ed il 45 livello',nil);
      lbStatistics.AddItem(IntToStr(LMobStats[5])+' mobs fra il 46 ed il 50 livello',nil);
      lbStatistics.AddItem(IntToStr(LMobStats[6])+' mobs di livello 51',nil);
      lbStatistics.AddItem(IntToStr(LMobStats[7])+' mobs di livello superiore al 51',nil);
    End;
end;

procedure TfrmArea.tsRoomsShow(Sender: TObject);
begin
  aDeleteItem.Enabled:=True;
  aNewitem.Enabled:=True;
  aEditItem.Enabled:=True;
  aShowErrors.Enabled:=True;
  aClone.Enabled:=True;
  aMoveEntityGroup.Enabled:=True;
end;

procedure TfrmArea.tsMobsShow(Sender: TObject);
begin
  aDeleteItem.Enabled:=True;
  aNewitem.Enabled:=True;
  aEditItem.Enabled:=True;
  aShowErrors.Enabled:=True;
  aClone.Enabled:=True;
  aMoveEntityGroup.Enabled:=True;
end;

procedure TfrmArea.tsItemsShow(Sender: TObject);
begin
  aDeleteItem.Enabled:=True;
  aNewitem.Enabled:=True;
  aEditItem.Enabled:=True;
  aShowErrors.Enabled:=True;
  aClone.Enabled:=True;
  aMoveEntityGroup.Enabled:=True;
end;

procedure TfrmArea.FormHide(Sender: TObject);
begin
  pcEntities.ActivePageIndex:=0;
end;

procedure TfrmArea.FormDestroy(Sender: TObject);
begin
  //FfrmItem.Parent:=Nil;
  lbInitializations.Clear;
  lbItems.Clear;
  lbRooms.Clear;
  lbMobs.Clear;
  lbSpecials.Clear;
  If Assigned(FfrmItem) Then
    FfrmItem.Close;
  //FfrmMOB.Parent:=Nil;
  If Assigned(FfrmMOB) Then
    FfrmMOB.Close;
  //FreeAndNil(FfrmMOB);
  If Assigned(FfrmRoom) Then
    FfrmRoom.Close;
  //FfrmRoom.Parent:=Nil;
end;

procedure TfrmArea.edtZoneDescriptionKeyPress(Sender: TObject;
  var Key: Char);
begin
  If Key>#127 then
    Begin
      Key:=#0;
      Beep;
    End;
end;

procedure TfrmArea.lbInitializationsDrawItem(Control: TWinControl;
  Index: Integer; Rect: TRect; State: TOwnerDrawState);
begin
  If odSelected in State Then
    PaintNebbieString(lbInitializations.Canvas,lbInitializations.Items[Index],Rect,cmSelected)
  Else
    PaintNebbieString(lbInitializations.Canvas,lbInitializations.Items[Index],Rect,cmNormal);
end;

procedure TfrmArea.tsInitsShow(Sender: TObject);
begin
  lbInitializations.Clear;
  If Assigned(FZone) Then
    FZone.ZoneInit(lbInitializations.Items);
end;

procedure TfrmArea.ShowMob(VNUM: Integer);
var
  LPos:Integer;
begin
  LPos:=FZone.Mobs.IndexOf(VNUM);
  If LPos>=0 Then
    Begin
      If Not Assigned(FfrmMob) Then
        FfrmMob:=CreateMobileForm;
      FfrmMob.Zone:=FZone;
      FfrmMob.Mob:=FZone.Mobs[LPos] as TMobile;
      FfrmMob.Show;
    End;
end;

procedure TfrmArea.ShowObject(VNUM: Integer);
var
  LPos:Integer;
begin
  LPos:=FZone.Items.IndexOf(VNUM);
  If LPos>=0 Then
    Begin
      If Not Assigned(FfrmItem) Then
        FfrmItem:=CreateObjectFrom;
      FfrmItem.Zone:=FZone;
      FfrmItem.ItemData:=FZone.Items[LPos] as TItem;
      FfrmItem.Show;
    End;
end;

procedure TfrmArea.ShowRoom(VNUM: Integer);
var
  LPos:Integer;
begin
  LPos:=FZone.Rooms.IndexOf(VNUM);
  If LPos>=0 Then
    Begin
      If Not Assigned(FfrmRoom) Then
        FfrmRoom:=CreateRoomForm;
      FfrmRoom.Zone:=FZone;
      FfrmRoom.RoomData:=FZone.Rooms[LPos] as TRoom;
      FfrmRoom.Show;
    End;
end;

procedure TfrmArea.aMoveEntityGroupExecute(Sender: TObject);
var
  LEntitiesToMove:Array of RMoveEntityList;
  LInvolvedLists:SEntityList;
  LStartInterval,LEndInterval,LNewIntervalBase:Integer;
  LPos,LNPos,LIntLen:Integer;
  LOVNUM,LNVNUM:Integer;
  LReport:TStrings;
  LReq,LReqS:Integer;
begin
  LReport:=TStringList.Create;;
  Try
    With TfrmChooseMovingInterval.Create(Self) Do
      Try
        Case pcEntities.ActivePageIndex Of
        1: cbRooms.Checked:=True;
        2: cbMobs.Checked:=True;
        3: cbItems.Checked:=True;
        End;
        If ShowModal=mrOk Then
          Begin
            LInvolvedLists:=[];
            If cbRooms.Checked THen
              Include(LInvolvedLists,elRooms);
            If cbMobs.Checked THen
              Include(LInvolvedLists,elMobiles);
            If cbItems.Checked THen
              Include(LInvolvedLists,elItems);
            LStartInterval:=JvVEFrom.AsInteger;
            LEndInterval:=JvVETo.AsInteger;
            LNewIntervalBase:=jvVENew.AsInteger;
            LIntLen:=LEndInterval-LStartInterval+1;
            SetLength(LEntitiesToMove,LIntLen);
            Case Sign(LStartInterval-LNewIntervalBase) Of
            -1:
              For LPos:=0 to LEndInterval-LStartInterval Do
                Begin
                  LOVNUM:=LPos+LStartInterval;
                  LNVNUM:=LPos+LNewIntervalBase;
                  LNPos:=LNVNUM-LStartInterval;
                  LEntitiesToMove[LPos].OldVNUM:=LOVNUM;
                  LEntitiesToMove[LPos].NewVNUM:=LNVNUM;
                  If elRooms in LInvolvedLists Then
                    Begin
                      LEntitiesToMove[LPos].Exists[elRooms]:=FZone.Rooms.IndexOf(LOVNUM)>=0;
                      If LEntitiesToMove[LPos].Exists[elRooms] Then
                        Begin
                          If LNVNUM in [LStartInterval,LEndInterval] Then
                            LEntitiesToMove[LPos].CanMove[elRooms]:=(Not LEntitiesToMove[LNPos].Exists[elRooms]) Or LEntitiesToMove[LNPos].CanMove[elRooms]
                          Else
                            LEntitiesToMove[LPos].CanMove[elRooms]:=FZone.Rooms.IndexOf(LEntitiesToMove[LPos].NewVNUM)=-1;
                        End;
                    End;
                  If elMobiles in LInvolvedLists Then
                    Begin
                      LEntitiesToMove[LPos].Exists[elMobiles]:=FZone.Mobs.IndexOf(LOVNUM)>=0;
                      If LEntitiesToMove[LPos].Exists[elMobiles] Then
                        Begin
                          If LNVNUM in [LStartInterval,LEndInterval] Then
                            LEntitiesToMove[LPos].CanMove[elMobiles]:=(Not LEntitiesToMove[LNPos].Exists[elMobiles]) Or LEntitiesToMove[LNPos].CanMove[elMobiles]
                          Else
                            LEntitiesToMove[LPos].CanMove[elMobiles]:=FZone.Mobs.IndexOf(LEntitiesToMove[LPos].NewVNUM)=-1;
                        End;
                    End;
                  If elItems in LInvolvedLists Then
                    Begin
                      LEntitiesToMove[LPos].Exists[elItems]:=FZone.Items.IndexOf(LOVNUM)>=0;
                      If LEntitiesToMove[LPos].Exists[elItems] Then
                        Begin
                          If LNVNUM in [LStartInterval,LEndInterval] Then
                            LEntitiesToMove[LPos].CanMove[elItems]:=(Not LEntitiesToMove[LNPos].Exists[elItems]) Or LEntitiesToMove[LNPos].CanMove[elItems]
                          Else
                            LEntitiesToMove[LPos].CanMove[elItems]:=FZone.Items.IndexOf(LEntitiesToMove[LPos].NewVNUM)=-1;
                        End;
                    End;
                End;
            0: Raise EInvalidOperation.Create('L''intrervallo di partenza e quello di destinazione coincidono!'#13'Operazione non necessaria!');
            1:
              For LPos:=LEndInterval-LStartInterval DownTo 0 Do
                Begin
                  LOVNUM:=LPos+LStartInterval;
                  LNVNUM:=LPos+LNewIntervalBase;
                  LNPos:=LNVNUM-LStartInterval;
                  LEntitiesToMove[LPos].OldVNUM:=LOVNUM;
                  LEntitiesToMove[LPos].NewVNUM:=LNVNUM;
                  If elRooms in LInvolvedLists Then
                    Begin
                      LEntitiesToMove[LPos].Exists[elRooms]:=FZone.Rooms.IndexOf(LOVNUM)>=0;
                      If LEntitiesToMove[LPos].Exists[elRooms] Then
                        Begin
                          If (LNVNUM<=LEndInterval) And (LNVNUM>=LStartInterval) Then
                            LEntitiesToMove[LPos].CanMove[elRooms]:=(Not LEntitiesToMove[LNPos].Exists[elRooms]) Or LEntitiesToMove[LNPos].CanMove[elRooms]
                          Else
                            LEntitiesToMove[LPos].CanMove[elRooms]:=FZone.Rooms.IndexOf(LEntitiesToMove[LPos].NewVNUM)=-1;
                        End;
                    End;
                  If elMobiles in LInvolvedLists Then
                    Begin
                      LEntitiesToMove[LPos].Exists[elMobiles]:=FZone.Mobs.IndexOf(LOVNUM)>=0;
                      If LEntitiesToMove[LPos].Exists[elMobiles] Then
                        Begin
                          If (LNVNUM<=LEndInterval) And (LNVNUM>=LStartInterval) Then
                            LEntitiesToMove[LPos].CanMove[elMobiles]:=(Not LEntitiesToMove[LNPos].Exists[elMobiles]) Or LEntitiesToMove[LNPos].CanMove[elMobiles]
                          Else
                            LEntitiesToMove[LPos].CanMove[elMobiles]:=FZone.Mobs.IndexOf(LEntitiesToMove[LPos].NewVNUM)=-1;
                        End;
                    End;
                  If elItems in LInvolvedLists Then
                    Begin
                      LEntitiesToMove[LPos].Exists[elItems]:=FZone.Items.IndexOf(LOVNUM)>=0;
                      If LEntitiesToMove[LPos].Exists[elItems] Then
                        Begin
                          If (LNVNUM<=LEndInterval) And (LNVNUM>=LStartInterval) Then
                            LEntitiesToMove[LPos].CanMove[elItems]:=(Not LEntitiesToMove[LNPos].Exists[elItems]) Or LEntitiesToMove[LNPos].CanMove[elItems]
                          Else
                            LEntitiesToMove[LPos].CanMove[elItems]:=FZone.Items.IndexOf(LEntitiesToMove[LPos].NewVNUM)=-1;
                        End;
                    End;
                End;
            End;
          End
        Else
          Begin
            LIntLen:=0;
            LStartInterval:=0;
            LNewIntervalBase:=0;
            LEndInterval:=0;
            LInvolvedLists:=[];
          End;
      Finally
        Free;
      End;
    LReq:=0;
    LReqS:=0;
    If ((LIntLen Or LEndInterval Or LNewIntervalBase Or LStartInterval)>0) And (LInvolvedLists<>[]) Then
      Begin
        If elRooms in LInvolvedLists Then
          Begin
            LReport.Add('*Verifica delle stanze');
            For LPos:=0 to High(LEntitiesToMove) Do
              If LEntitiesToMove[LPos].Exists[elRooms] Then
                Begin
                  Inc(LReq);
                  If Not LEntitiesToMove[LPos].CanMove[elRooms] Then
                    LReport.Add(Format('**La stanza %s non può essere spostata al vnum %s',[VNUMToStr(LEntitiesToMove[LPos].OldVNUM),VNUMToStr(LEntitiesToMove[LPos].NewVNUM)]))
                  Else
                    Inc(LReqs);
                End;
          End;
        If elMobiles in LInvolvedLists Then
          Begin
            LReport.Add('*Verifica delle creature');
            For LPos:=0 to High(LEntitiesToMove) Do
              If LEntitiesToMove[LPos].Exists[elMobiles] Then
                Begin
                  Inc(LReq);
                  If Not LEntitiesToMove[LPos].CanMove[elMobiles] Then
                    LReport.Add(Format('**La creatura %s non può essere spostata al vnum %s',[VNUMToStr(LEntitiesToMove[LPos].OldVNUM),VNUMToStr(LEntitiesToMove[LPos].NewVNUM)]))
                  Else
                    Inc(LReqs);
                End;
          End;
        If elItems in LInvolvedLists Then
          Begin
            LReport.Add('*Verifica degli oggetti');
            For LPos:=0 to High(LEntitiesToMove) Do
              If LEntitiesToMove[LPos].Exists[elItems] Then
                Begin
                  Inc(LReq);
                  If Not LEntitiesToMove[LPos].CanMove[elItems] Then
                    LReport.Add(Format('**L''oggetto %s non può essere spostato al vnum %s',[VNUMToStr(LEntitiesToMove[LPos].OldVNUM),VNUMToStr(LEntitiesToMove[LPos].NewVNUM)]))
                  Else
                    Inc(LReqs);
                End;
          End;
        If LReqS<>LReq Then
          Begin
            If LReqS>0 then
              Begin
                If MessageDlg(Format('Di %d richieste, %d non potranno essere soddisfatte poiché i VNUM sono già occupati!'#13'Si desidera Completare almeno le operazioni consentite?',[LReq,LReq-LReqS]),mtWarning,[mbYes,mbNo,mbCancel],0)=mrYes Then
                  Begin
                    LReport.Clear;
                    For LPos:=0 to High(LEntitiesToMove) Do
                      Begin
                        If elRooms in LInvolvedLists Then
                          Begin
                            If LEntitiesToMove[LPos].Exists[elRooms] Then
                              Case FZone.RenumberEntity(LEntitiesToMove[LPos].OldVNUM,LEntitiesToMove[LPos].NewVNUM,elRooms) Of
                              E_ACCESSDENIED: LReport.Add(Format('Il VNUM %d è già occupato da un''altra stanza!',[LEntitiesToMove[LPos].NewVNUM]));
                              E_POINTER: LReport.Add(Format('Stanza %d inesistente.',[LEntitiesToMove[LPos].OldVNUM]));
                              S_OK: LReport.Add(Format('Stanza %d spostata in %d.',[LEntitiesToMove[LPos].OldVNUM,LEntitiesToMove[LPos].NewVNUM]));
                              End;
                          End;
                        If elMobiles in LInvolvedLists Then
                          Begin
                            If LEntitiesToMove[LPos].Exists[elMobiles] Then
                              Case FZone.RenumberEntity(LEntitiesToMove[LPos].OldVNUM,LEntitiesToMove[LPos].NewVNUM,elMobiles) Of
                              E_ACCESSDENIED: LReport.Add(Format('Il VNUM %d è già occupato da un''altra creatura!',[LEntitiesToMove[LPos].NewVNUM]));
                              E_POINTER: LReport.Add(Format('Creatura %d inesistente.',[LEntitiesToMove[LPos].OldVNUM]));
                              S_OK: LReport.Add(Format('Creatura %d spostata in %d.',[LEntitiesToMove[LPos].OldVNUM,LEntitiesToMove[LPos].NewVNUM]));
                              End;
                          End;
                        If elItems in LInvolvedLists Then
                          Begin
                            If LEntitiesToMove[LPos].Exists[elItems] Then
                              Case FZone.RenumberEntity(LEntitiesToMove[LPos].OldVNUM,LEntitiesToMove[LPos].NewVNUM,elItems) Of
                              E_ACCESSDENIED: LReport.Add(Format('Il VNUM %d è già occupato da un altro oggetto!',[LEntitiesToMove[LPos].NewVNUM]));
                              E_POINTER: LReport.Add(Format('Oggetto %d inesistente.',[LEntitiesToMove[LPos].OldVNUM]));
                              S_OK: LReport.Add(Format('Oggetto %d spostato in %d.',[LEntitiesToMove[LPos].OldVNUM,LEntitiesToMove[LPos].NewVNUM]));
                              End;
                          End;
                      End;
                    With TfrmShowErrors.Create(frmMain) Do
                      Try
                        memErrors.Lines.Assign(LReport);
                        ShowModal;
                      Finally
                        Free;
                      End;
                    FZone.Changed(LInvolvedLists);
                  End;
              End
            Else
              MessageDlg('Nessuna delle richieste di spostamento può essere soddisfatta poiché tutti i VNUM di destinazione erano già occupati!',mtError,[mbOk],0);
          End
        Else
          Begin
            LReport.Clear;
            For LPos:=0 to High(LEntitiesToMove) Do
              Begin
                If elRooms in LInvolvedLists Then
                  Begin
                    If LEntitiesToMove[LPos].Exists[elRooms] Then
                      Case FZone.RenumberEntity(LEntitiesToMove[LPos].OldVNUM,LEntitiesToMove[LPos].NewVNUM,elRooms) Of
                      E_ACCESSDENIED: LReport.Add(Format('Il VNUM %d è già occupato da un''altra stanza!',[LEntitiesToMove[LPos].NewVNUM]));
                      E_POINTER: LReport.Add(Format('Stanza %d inesistente.',[LEntitiesToMove[LPos].OldVNUM]));
                      S_OK: LReport.Add(Format('Stanza %d spostata in %d.',[LEntitiesToMove[LPos].OldVNUM,LEntitiesToMove[LPos].NewVNUM]));
                      End;
                  End;
                If elMobiles in LInvolvedLists Then
                  Begin
                    If LEntitiesToMove[LPos].Exists[elMobiles] Then
                      Case FZone.RenumberEntity(LEntitiesToMove[LPos].OldVNUM,LEntitiesToMove[LPos].NewVNUM,elMobiles) Of
                      E_ACCESSDENIED: LReport.Add(Format('Il VNUM %d è già occupato da un''altra creatura!',[LEntitiesToMove[LPos].NewVNUM]));
                      E_POINTER: LReport.Add(Format('Creatura %d inesistente.',[LEntitiesToMove[LPos].OldVNUM]));
                      S_OK: LReport.Add(Format('Creatura %d spostata in %d.',[LEntitiesToMove[LPos].OldVNUM,LEntitiesToMove[LPos].NewVNUM]));
                      End;
                  End;
                If elItems in LInvolvedLists Then
                  Begin
                    If LEntitiesToMove[LPos].Exists[elItems] Then
                      Case FZone.RenumberEntity(LEntitiesToMove[LPos].OldVNUM,LEntitiesToMove[LPos].NewVNUM,elItems) Of
                      E_ACCESSDENIED: LReport.Add(Format('Il VNUM %d è già occupato da un altro oggetto!',[LEntitiesToMove[LPos].NewVNUM]));
                      E_POINTER: LReport.Add(Format('Oggetto %d inesistente.',[LEntitiesToMove[LPos].OldVNUM]));
                      S_OK: LReport.Add(Format('Oggetto %d spostato in %d.',[LEntitiesToMove[LPos].OldVNUM,LEntitiesToMove[LPos].NewVNUM]));
                      End;
                  End;
              End;
            With TfrmShowErrors.Create(frmMain) Do
              Try
                memErrors.Lines.Assign(LReport);
                ShowModal;
              Finally
                Free;
              End;
            FZone.Changed(LInvolvedLists);
          End;
      End;
  Finally
    SetLength(LEntitiesToMove,0);
    LReport.Free;
  End;
end;

procedure TfrmArea.tsUnresolvedSpecialsShow(Sender: TObject);
begin
  aDeleteItem.Enabled:=True;
  aNewitem.Enabled:=True;
  aEditItem.Enabled:=True;
  aShowErrors.Enabled:=False;
  aClone.Enabled:=False;
  aMoveEntityGroup.Enabled:=False;
end;

procedure TfrmArea.lbSpecialsDblClick(Sender: TObject);
begin
  aEditItem.Execute;
end;

procedure TfrmArea.aReopenExecute(Sender: TObject);
begin
  if FZone.FileName<>'' Then
      Begin
        If Succeeded(FZone.LoadZone(FZone.FileName)) Then
          MessageDlg('Area ricaricata da disco!',mtWarning,[mbOk],0)
        Else
          MessageDlg('Errore imprevisto nel ricaricare l''area dal disco!',mtError,[mbOk],0);
      End
  Else
    MessageDlg('Impossibile caricare un''area che non é stata salvata su disco!',mtError,[mbOk],0);
end;

procedure TfrmArea.aSaveExecute(Sender: TObject);
begin
  if FZone.FileName='' Then
    Begin
      If dmMain.sdMain.Execute Then
        Begin
          If Succeeded(FZone.SaveZone(dmMain.sdMain.FileName)) Then
            MessageDlg('Zona '+FZone.Name+' salvata con successo!',mtInformation,[mbOk],0)
          Else
            MessageDlg('Errore imprevisto nel salvataggio della zona '+FZone.Name+'!',mtError,[mbOk],0);
        End
    End
  Else
    If Succeeded(FZone.SaveZone(FZone.FileName)) Then
      MessageDlg('Zona '+FZone.Name+' salvata con successo!',mtInformation,[mbOk],0)
    Else
      MessageDlg('Errore imprevisto nel salvataggio della zona '+FZone.Name+'!',mtError,[mbOk],0);
end;

function TfrmArea.CreateMobileForm: TfrmMob;
begin
  result:=TfrmMob.Create(frmMain);
  result.Zone:=FZone;
  result.OnClose:=OnFormClose;
end;

function TfrmArea.CreateObjectFrom: TfrmObjects;
begin
  result:=TfrmObjects.Create(frmMain);
  result.Zone:=FZone;
  result.OnClose:=OnFormClose;
end;

function TfrmArea.CreateRoomForm: TfrmRoom;
begin
  result:=TfrmRoom.Create(frmMain);
  result.Zone:=FZone;
  result.OnClose:=OnFormClose;
end;

procedure TfrmArea.OnFormClose(Sender: TObject; var Action: TCloseAction);
begin
  try
    If Sender=FfrmItem Then
      FreeAndNil(FfrmItem)
    Else If Sender=FfrmMOB Then
      FreeAndNil(FfrmMOB)
    Else If Sender=FfrmRoom Then
      FreeAndNil(FfrmRoom);
  Except
    on E:Exception Do
      dmMain.clMain.LogException(Self,'OnClose',E);
  End;
end;

procedure TfrmArea.aExportEntitiesExecute(Sender: TObject);
var
  Proceed:Boolean;
begin
  with TfrmChooseEntityType.Create(self) do
    try
      Proceed:=ShowModal=mrOk;
    finally
      free;
    End;
  if proceed Then
    with TfrmEntityChooser.Create(Self) do
      Try
        if ShowModal=mrOk Then
          Begin
          End;
      Finally
        Free;
      End;
end;

procedure TfrmArea.aImportEntitiesExecute(Sender: TObject);
begin
  dmMain.odMain.FileName:='';
  dmMain.odMain.Filter:='File con stanze|*.wld|File di oggetti|*.obj|File di MOB|*.mob|';
  if dmMain.odMain.Execute Then
    with TfrmEntityChooser.Create(Self) do
      Try
        if ShowModal=mrOk Then
          Begin
          End;
      Finally
        Free;
      End;
end;

procedure TfrmArea.lbMobsDragOver(Sender, Source: TObject; X, Y: Integer;
  State: TDragState; var Accept: Boolean);
begin
  If Source is TListBox Then
    Accept:=((Source as TListBox).Name='lbMobs') And (Source<>Sender)
  Else
    Accept:=False;
end;

procedure TfrmArea.lbItemsDragOver(Sender, Source: TObject; X, Y: Integer;
  State: TDragState; var Accept: Boolean);
begin
  If Source is TListBox Then
    Accept:=((Source as TListBox).Name='lbItems') And (Source<>Sender)
  Else
    Accept:=False;
end;

procedure TfrmArea.lbRoomsDragOver(Sender, Source: TObject; X, Y: Integer;
  State: TDragState; var Accept: Boolean);
begin
  If Source is TListBox Then
    Accept:=((Source as TListBox).Name='lbRooms') And (Source<>Sender)
  Else
    Accept:=False;
end;

procedure TfrmArea.lbRoomsDragDrop(Sender, Source: TObject; X, Y: Integer);
var
  LSourceLB:TListBox;
  LOldRoom,LNewRoom:TRoom;
  LI,LJ:Integer;
begin
  If Source is TListBox Then
    Begin
      LSourceLB:=(Source as TListBox);
      If (LSourceLB.Name='lbRooms') And (Source<>Sender) Then
        Begin
          For LI:=0 to Pred(LSourceLB.Count) Do
            Begin
              If LSourceLB.Selected[LI] Then
                Begin
                  If Assigned(LSourceLB.Items.Objects[LI]) Then
                    If LSourceLB.Items.Objects[LI] Is TRoom Then
                      Begin
                        LOldRoom:=LSourceLB.Items.Objects[LI] As TRoom;
                        If Not Zone.Rooms.Find(LOldRoom.VNum,LJ) Then
                          Begin
                            LNewRoom:=TRoom.Create;
                            LNewRoom.Assign(LOldRoom);
                            Zone.Rooms.Add(LNewRoom);
                          End
                        Else
                          MessageDlg('Esiste già un oggetto con questo VNUM. L''operazione non può essere completata!',mtError,[mbOk],0);
                      End;
                End;
              RefreshList(elRooms);
            End;
        End;
    End;
end;

procedure TfrmArea.lbMobsDragDrop(Sender, Source: TObject; X, Y: Integer);
var
  LSourceLB:TListBox;
  LOldMob,LNewMob:Tmobile;
  LI,LJ:Integer;
begin
  If Source is TListBox Then
    Begin
      LSourceLB:=(Source as TListBox);
      If (LSourceLB.Name='lbMobs') And (Source<>Sender) Then
        Begin
          For LI:=0 to Pred(LSourceLB.Count) Do
            Begin
              If LSourceLB.Selected[LI] Then
                Begin
                  If Assigned(LSourceLB.Items.Objects[LI]) Then
                    If LSourceLB.Items.Objects[LI] Is TMobile Then
                      Begin
                        LOldMob:=LSourceLB.Items.Objects[LI] As TMobile;
                        If Not Zone.Mobs.Find(LOldMob.VNum,LJ) Then
                          Begin
                            LNewMob:=TMobile.Create;
                            LNewMob.Assign(LOldMob);
                            Zone.Mobs.Add(LNewMob);
                          End
                        Else
                          MessageDlg('Esiste già un oggetto con questo VNUM. L''operazione non può essere completata!',mtError,[mbOk],0);
                      End;
                End;
              RefreshList(elMobiles);
            End;
        End;
    End;
end;

procedure TfrmArea.lbItemsDragDrop(Sender, Source: TObject; X, Y: Integer);
var
  LSourceLB:TListBox;
  LOldItem,LNewItem:TItem;
  LI,LJ:Integer;
begin
  If Source is TListBox Then
    Begin
      LSourceLB:=(Source as TListBox);
      If (LSourceLB.Name='lbItems') And (Source<>Sender) Then
        Begin
          For LI:=0 to Pred(LSourceLB.Count) Do
            Begin
              If LSourceLB.Selected[LI] Then
                Begin
                  If Assigned(LSourceLB.Items.Objects[LI]) Then
                    If LSourceLB.Items.Objects[LI] Is TItem Then
                      Begin
                        LOldItem:=LSourceLB.Items.Objects[LI] As TItem;
                        If Not Zone.Items.Find(LOldItem.VNum,LJ) Then
                          Begin
                            LNewItem:=TItem.Create;
                            LNewItem.Assign(LOldItem);
                            Zone.Items.Add(LNewItem);
                          End
                        Else
                          MessageDlg('Esiste già un oggetto con questo VNUM. L''operazione non può essere completata!',mtError,[mbOk],0);
                      End;
                End;
              RefreshList(elItems);
            End;
        End;
    End;
end;

end.
