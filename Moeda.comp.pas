unit Moeda.comp;

interface

uses System.Classes,System.RegularExpressions,IdHTTP;

type

TMoedaTipo = (Dolar,Euro,BTC,Ouro,Libra,Iene);
TMoedaHoje = class(TComponent)
  private
  FTMoeda: TMoedaTipo;
  FMoeda: string;
  FPart:string;
  procedure SetMoeda;
  public
   function GetCotacao: String;
  published
   property Moeda: TMoedaTipo Read FTMoeda Write FTMoeda;
end;

procedure Register;

implementation

procedure Register;
begin
  RegisterComponents('iNoveFast', [TMoedaHoje]);
end;

function TMoedaHoje.GetCotacao: String;
var
IdHttp1 : TIdHttp;
ssResponse : TStringStream;
rMatch : TMatch;
begin
  Result := '0';
  ssResponse := TStringStream.Create();
  try
    SetMoeda;
    IdHttp1 := TIdHTTP.Create(nil);
    IdHttp1.Get(FMoeda,ssResponse);
    rMatch := TRegEx.Match(ssResponse.DataString,FPart,[roMultiLine]);
    if rMatch.Success then
      Result := rMatch.Groups.Item[1].Value;
  finally
    ssResponse.Free;
  end;
  IdHttp1.DisposeOf;
end;

procedure TMoedaHoje.SetMoeda;
begin
  case Moeda of
    Dolar : Begin
            FMoeda := 'https://dolarhoje.com/';
            FPart := 'nacional"[ ]+value="([0-9,]+)';
            end;
    Euro  : Begin
            FMoeda := 'https://dolarhoje.com/euro-hoje/';
            FPart := 'nacional"[ ]+value="([0-9,]+)';
            End;
    BTC   : Begin
            FMoeda := 'https://dolarhoje.com/bitcoin-hoje/';
            FPart := 'nacional"[ ]+value="([0-9,]+)';
            End;
    Ouro  : Begin
            FMoeda := 'https://dolarhoje.com/ouro-hoje/';
            FPart := 'nacional"[ ]+value="([0-9,]+)';
            End;
    Libra : Begin
            FMoeda := 'https://dolarhoje.com/libra-hoje/';
            FPart := 'nacional"[ ]+value="([0-9,]+)';
            End;
    Iene  : Begin
            FMoeda := 'https://dolarhoje.com/iene/';
            FPart := 'nacional"[ ]+value="([0-9,]+)';
            End;
  end;
end;

end.
