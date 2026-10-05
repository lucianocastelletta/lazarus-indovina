unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls;

type

  { TForm1 }

  TForm1 = class(TForm)
    ButtonNuova: TButton;
    ButtonProva: TButton;
    EditNumero: TEdit;
    Label2: TLabel;
    LabelRisposta: TLabel;
    procedure ButtonNuovaClick(Sender: TObject);
    procedure ButtonProvaClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Label2Click(Sender: TObject);
    procedure LabelRispostaClick(Sender: TObject);

  private

  public

  end;

var
  Form1: TForm1;
  segreto: Integer;     // il numero pensato dal computer
  tentativi: Integer;   // quante prove hai fatto
implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.FormCreate(Sender: TObject);
begin
     Randomize;                     // mescola i numeri a caso
  segreto := Random(100) + 1;    // un numero da 1 a 100
  tentativi := 0;
end;

procedure TForm1.Label2Click(Sender: TObject);
begin

end;

procedure TForm1.LabelRispostaClick(Sender: TObject);
begin

end;

  procedure TForm1.ButtonProvaClick(Sender: TObject);
  var
    numero: Integer;
  begin
    numero := StrToInt(EditNumero.Text);
    tentativi := tentativi + 1;
    if numero = segreto then
      begin
        LabelRisposta.Caption := 'Indovinato! Tentativi: ' + IntToStr(tentativi);
      end
    else
      begin
        if numero < segreto then
          begin
            LabelRisposta.Caption := 'il numero è troppo basso';
          end
        else
          begin
            LabelRisposta.Caption := 'il numero è troppo alto';
          end;
      end;
    EditNumero.Clear;
  end;


  procedure TForm1.ButtonNuovaClick(Sender: TObject);
  begin
    segreto := Random(100) + 1;
    tentativi := 0;
    LabelRisposta.Caption := 'Ho pensato un nuovo numero da 1 a 100';
  end;



end.

