unit frmExtraEditorU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, GeneralTypesU ,fraEditorBarU, Buttons,
  AdvTxtEditorU;

type
  TfrmExtraEditor = class(TForm)
    Label1: TLabel;
    edtKeys: TEdit;
    reExtra: TRichEdit;
    frmEditingTools: TfrmEditingTools;
    bbOk: TBitBtn;
    BitBtn2: TBitBtn;
    rulExtra: TRuler;
    procedure edtKeysChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure edtKeysKeyPress(Sender: TObject; var Key: Char);
    procedure reExtraChange(Sender: TObject);
  private
    procedure SetDescription(const Value: RExtra);
    function GetDescription: RExtra;
    { Private declarations }
  public
    { Public declarations }
    property Description:RExtra read GetDescription write SetDescription;
  end;

var
  frmExtraEditor: TfrmExtraEditor;

implementation

{$R *.dfm}
Uses
  UtilsU, dmMainU;

procedure TfrmExtraEditor.edtKeysChange(Sender: TObject);
begin
  reExtra.Enabled:=(edtKeys.Text<>'');
  frmEditingTools.Enabled:=reExtra.Enabled;
  bbOk.Enabled:=reExtra.Enabled And (reExtra.Text<>'');
end;

procedure TfrmExtraEditor.FormCreate(Sender: TObject);
var
  LI:Integer;
begin
  RulExtra.Length:=dmMain.DescColumns;
  reExtra.Width:=RulExtra.Width+50;
  edtKeys.Width:=RulExtra.Width+10;
  reExtra.Clear;
  edtKeys.Clear;
end;

procedure TfrmExtraEditor.SetDescription(const Value: RExtra);
var
  LStrings:TStrings;
begin
  reExtra.OnChange:=Nil;
  LStrings:=TStringList.Create;
  Try
    //LStrings.Text:=Value.Description;
    NebbieToRtf(Value.Description,reExtra,frmEditingTools.ataAttributes);
  Finally
    LStrings.Free;
  End;
  reExtra.OnChange:=reExtraChange;
  edtKeys.Text:=Value.KeyList;
end;

procedure TfrmExtraEditor.edtKeysKeyPress(Sender: TObject; var Key: Char);
begin
  If Key in ['A'..'Z'] Then
    Key:=Chr(Ord(Key)-Ord('A')+Ord('a'));
  If Not(Key in ['a'..'z',' ','0'..'9',#8]) Then
    Begin
      Beep;
      Key:=#0;
    End
end;

function TfrmExtraEditor.GetDescription: RExtra;
begin
  Result.KeyList:=edtKeys.Text;
  RTFToNebbie2(reExtra,Not reExtra.WantReturns,Result.Description)
end;

procedure TfrmExtraEditor.reExtraChange(Sender: TObject);
begin
  bbOk.Enabled:=reExtra.Enabled And (reExtra.Text<>'');
end;

end.
