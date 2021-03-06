unit AreaU;

interface

uses Classes, Contnrs;

type
   TArea = Class(TObject)
  private
    FFileName: String;
    FEntities: TObjectList;
    procedure SetFileName(const Value: String);
   Public
      Property FileName:String read FFileName write SetFileName;
      Constructor Create;
      Destructor Destroy; Override;
      Property Entities:TObjectList read FEntities;
   End;

implementation

uses GeneralTypesU, UtilsU;


{ TArea }

constructor TArea.Create;
begin
   FEntities:=TObjectList.Create(True);
end;

destructor TArea.Destroy;
begin
   FEntities.Free;
   inherited Destroy;
end;

procedure TArea.SetFileName(const Value: String);
begin
  FFileName := Value;
end;

end.
