unit fraSpecialU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, 
  Dialogs, StdCtrls, GeneralTypesU;

type
  TfraSpecial = class(TFrame)
    cbSpecial: TComboBox;
    gbParams: TGroupBox;
    lbParams: TListBox;
    stProcDesc: TStaticText;
    procedure cbSpecialKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cbSpecialChange(Sender: TObject);
    procedure lbParamsDblClick(Sender: TObject);
  private
    FSpecialKind: ESpecialProcTarget;
    SpParams:Array[0..3] of String;
    FZone: TZone;
    FOnChanged: TNotifyEvent;
    procedure SetSpecialKind(const Value: ESpecialProcTarget);
    procedure SetZone(const Value: TZone);
    procedure SetOnChanged(const Value: TNotifyEvent);
    { Private declarations }
  public
    { Public declarations }
    Property Zone:TZone read FZone write SetZone;
    Procedure LoadSpecial(List:ESpecialProcTarget); Overload;
    Procedure ApplySpecial(aSpecial:RProcedure);
    Procedure ChangeSpecial(var aSpecial:RProcedure);
    Procedure RefreshParameters;
    destructor Destroy; override;
  published
    property SpecialKind:ESpecialProcTarget read FSpecialKind write SetSpecialKind;
    property OnChanged:TNotifyEvent read FOnChanged write SetOnChanged;
  end;

implementation

uses frmChangeSpecialParU;

{$R *.dfm}

{ TfraSpecial }

procedure TfraSpecial.LoadSpecial(List: ESpecialProcTarget);
var
  Li:Integer;
  LSpecial:TSpecialProcedureItem;

begin
  FSpecialKind:=List;
  cbSpecial.Clear;
  Case List of
  sptObject:
    For LI:=0 to Pred(ProcedureList.Count) Do
      Begin
        LSpecial:=ProcedureList[LI] as TSpecialProcedureItem;
        If LSpecial.Target=sptObject then
          cbSpecial.AddItem((ProcedureList[LI] as TSpecialProcedureItem).Token,ProcedureList[LI]);
      End;
  sptMobile:
    For LI:=0 to Pred(ProcedureList.Count) Do
      Begin
        LSpecial:=ProcedureList[LI] as TSpecialProcedureItem;
        If LSpecial.Target=sptMobile then
          cbSpecial.AddItem((ProcedureList[LI] as TSpecialProcedureItem).Token,ProcedureList[LI]);
      End;
  sptRoom:
    For LI:=0 to Pred(ProcedureList.Count) Do
      Begin
        LSpecial:=ProcedureList[LI] as TSpecialProcedureItem;
        If LSpecial.Target=sptRoom then
          cbSpecial.AddItem((ProcedureList[LI] as TSpecialProcedureItem).Token,ProcedureList[LI]);
      End;
  End;
end;

procedure TfraSpecial.SetSpecialKind(const Value: ESpecialProcTarget);
begin
  FSpecialKind := Value;
end;

procedure TfraSpecial.ApplySpecial(aSpecial: RProcedure);
var
  LI:Integer;
  LSpecial:TSpecialProcedureItem;
begin
  cbSpecial.ItemIndex:=-1;
  For LI:=0 to Pred(cbSpecial.Items.Count) Do
    Begin
      LSpecial:=(cbSpecial.Items.Objects[LI] as TSpecialProcedureItem);
      If LSpecial.ID=aSpecial.ID Then
        Begin
          cbSpecial.ItemIndex:=LI;
          Break;
        End;
    End;
  cbSpecial.OnChange(cbSpecial);
  If cbSpecial.ItemIndex>=0 Then
    Begin
      For LI:=0 to 3 Do
        spParams[LI]:=aSpecial.spValues[LI];
    End;
  RefreshParameters;
end;

procedure TfraSpecial.ChangeSpecial(var aSpecial: RProcedure);
var
  LSpecialProc:TSpecialProcedureItem;
  LI:Integer;
begin
  If cbSpecial.ItemIndex=-1 Then
    Begin
      aSpecial.ID:=0;
      aSpecial.Name:='';
    End
  Else
    Begin
      LSpecialProc:=cbSpecial.Items.Objects[cbSpecial.ItemIndex] as TSpecialProcedureItem;
      aSpecial.ID:=LSpecialProc.ID;
      aSpecial.Name:=LSpecialProc.Token;
      For LI:=0 to 3 Do
        aSpecial.SpValues[LI]:=spParams[LI];
    End;
  //If Assigned(FOnChanged) Then
  //  FOnChanged(Self);
end;

procedure TfraSpecial.cbSpecialKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  Case Key Of
  VK_CANCEL,VK_DELETE:
    Begin
      cbSpecial.ItemIndex:=-1;
      Key:=0;
      cbSpecial.OnChange(cbSpecial);
    End;
  End;
end;

destructor TfraSpecial.Destroy;
begin
  inherited Destroy;
end;

procedure TfraSpecial.SetZone(const Value: TZone);
begin
  FZone := Value;
end;

procedure TfraSpecial.cbSpecialChange(Sender: TObject);
begin
  RefreshParameters;
  If Assigned(FOnChanged) Then
    FOnChanged(Self);
end;

procedure TfraSpecial.RefreshParameters;
var
  LI:Integer;
  LSpecial:TSpecialProcedureItem;
  LStr:String;
begin
  lbParams.Clear;
  stProcDesc.Caption:='';
  If cbSpecial.ItemIndex>=0 then
    Begin
      LSpecial:=cbSpecial.Items.Objects[cbSpecial.ItemIndex] as TSpecialProcedureItem;
      stProcDesc.Caption:=LSpecial.Description;
      For LI:=0 to Pred(LSpecial.CountPar) Do
        Begin
          LStr:=LSpecial.Parameters[LI].ParLabel+'=';
          Case LSpecial.Parameters[LI].ParType Of
          ptMessage:LStr:=LStr+'"'+SpParams[LI]+'"';
          ptKeyList:LStr:=LStr+SpParams[LI];
          Else
            If Assigned(FZone) Then
              LStr:=LStr+FZone.DecodeParameterValue(LSpecial.Parameters[LI].ParType,spParams[LI],True)
            Else
              LStr:=LStr+spParams[LI];
          End;
          lbParams.AddItem(LStr,nil);
        End;
    End
end;

procedure TfraSpecial.SetOnChanged(const Value: TNotifyEvent);
begin
  FOnChanged := Value;
end;

procedure TfraSpecial.lbParamsDblClick(Sender: TObject);
var
  LIndex:Integer;
  LSpecial:TSpecialProcedureItem;
begin
  LIndex:=lbParams.ItemIndex;
  If LIndex>=0 then
    Begin
      LSpecial:=(cbSpecial.Items.Objects[cbSpecial.ItemIndex] as TSpecialProcedureItem);
      With TfrmChangeSpecialPar.Create(Self) Do
        Try
          Caption:=cbSpecial.Text;
          fraVariable.Zone:=FZone;
          fraVariable.ParameterType:=LSpecial.Parameters[LIndex].ParType;
          fraVariable.ParamLabel:=LSpecial.Parameters[LIndex].ParLabel;
          fraVariable.ParamValue:=spParams[LIndex];
          If ShowModal=mrOk Then
            Begin
              spParams[LIndex]:=fraVariable.ParamValue;
              RefreshParameters;
            End;
        Finally
          Free;
        End;
    End;
end;

end.
