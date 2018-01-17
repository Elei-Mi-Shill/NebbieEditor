unit frmChooseVNumU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons;

type
  TfrmChooseVNum = class(TForm)
    Label1: TLabel;
    btnFirst: TButton;
    btnLast: TButton;
    BitBtn1: TBitBtn;
    procedure btnFirstClick(Sender: TObject);
    procedure btnLastClick(Sender: TObject);
  private
    FResultVNum: Integer;
    FFirstVNum: Integer;
    FLastVNum: Integer;
    procedure SetFirstVNum(const Value: Integer);
    procedure SetLastVNum(const Value: Integer);
    { Private declarations }
  public
    { Public declarations }
  published
    property FirstVNum:Integer read FFirstVNum write SetFirstVNum;
    property LastVNum:Integer read FLastVNum write SetLastVNum;
    property ResultVNum:Integer read FResultVNum;
  end;

var
  frmChooseVNum: TfrmChooseVNum;

implementation

{$R *.dfm}

{ TfrmChooseVNum }

procedure TfrmChooseVNum.SetFirstVNum(const Value: Integer);
begin
  FFirstVNum := Value;
  btnFirst.Caption:=IntToStr(Value);
end;

procedure TfrmChooseVNum.SetLastVNum(const Value: Integer);
begin
  FLastVNum := Value;
  btnLast.Caption:=IntToStr(Value);
end;

procedure TfrmChooseVNum.btnFirstClick(Sender: TObject);
begin
  FResultVNum:=FFirstVNum;
  ModalResult:=mrOk;
end;

procedure TfrmChooseVNum.btnLastClick(Sender: TObject);
begin
  FResultVNum:=FLastVNum;
  ModalResult:=mrOk;
end;

end.
