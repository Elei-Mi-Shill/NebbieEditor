unit frmChooseEntityTypeU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls;

type
  TfrmChooseEntityType = class(TForm)
    rgEntityTypes: TRadioGroup;
    bbOk: TBitBtn;
    BitBtn1: TBitBtn;
    procedure rgEntityTypesClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmChooseEntityType: TfrmChooseEntityType;

implementation

{$R *.dfm}

procedure TfrmChooseEntityType.rgEntityTypesClick(Sender: TObject);
begin
  bbOk.Enabled:=rgEntityTypes.ItemIndex>=0;
end;

end.
