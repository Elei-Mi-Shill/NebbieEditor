unit frmEntityChooserU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, CheckLst;

type
  TfrmEntityChooser = class(TForm)
    clbEntityList: TCheckListBox;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmEntityChooser: TfrmEntityChooser;

implementation

{$R *.dfm}

end.
