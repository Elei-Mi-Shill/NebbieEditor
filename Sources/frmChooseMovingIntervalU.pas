unit frmChooseMovingIntervalU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, JvExStdCtrls, JvEdit, JvValidateEdit, Buttons;

type
  TfrmChooseMovingInterval = class(TForm)
    Label3: TLabel;
    gbEntityType: TGroupBox;
    cbRooms: TCheckBox;
    cbItems: TCheckBox;
    cbMobs: TCheckBox;
    gbMovingInterval: TGroupBox;
    JvVEFrom: TJvValidateEdit;
    JvVETo: TJvValidateEdit;
    Label1: TLabel;
    Label2: TLabel;
    jvVENew: TJvValidateEdit;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    procedure JvVEFromChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmChooseMovingInterval: TfrmChooseMovingInterval;

implementation

{$R *.dfm}

procedure TfrmChooseMovingInterval.JvVEFromChange(Sender: TObject);
begin
  If JvVEFrom.AsInteger>1 then
    JvVETo.MinValue:=JvVEFrom.AsInteger
  Else
    JvVETo.MinValue:=1;
end;

end.
