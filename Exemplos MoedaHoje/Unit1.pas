unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Moeda.comp;

type
  TForm1 = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    MoedaHoje1: TMoedaHoje;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.FormCreate(Sender: TObject);
begin
MoedaHoje1.Moeda := Dolar;
Label1.Caption := 'Dolar: '+MoedaHoje1.GetCotacao;
MoedaHoje1.Moeda := Euro;
Label2.Caption := 'Euro: '+MoedaHoje1.GetCotacao;
MoedaHoje1.Moeda := BTC;
Label3.Caption := 'BitCoin: '+MoedaHoje1.GetCotacao;
MoedaHoje1.Moeda := Ouro;
Label4.Caption := 'Ouro: '+MoedaHoje1.GetCotacao;
MoedaHoje1.Moeda := Libra;
Label5.Caption := 'Libra: '+MoedaHoje1.GetCotacao;
MoedaHoje1.Moeda := Iene;
Label6.Caption := 'Iene: '+MoedaHoje1.GetCotacao;
end;

end.
