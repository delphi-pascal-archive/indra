unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls;

type
  Tmain = class(TForm)
    Fond: TPaintBox;
    Panel1: TPanel;
    Edit1: TEdit;
    Button1: TButton;
    Button2: TButton;
    Button4: TButton;
    Button3: TButton;
    Label1: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure FondMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Button4Click(Sender: TObject);
    procedure FondMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure FondMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure Button2Click(Sender: TObject);
    procedure FormPaint(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    procedure eau;
    procedure Init;
  public
    { Public declarations }
  end;

type
 Tgto = record  // Type pour goutte
  x: integer;
  Y: integer;
  Col: integer;
 end;

var
  main: Tmain;
  gto: array of Tgto;      // Tableau de gouttes
  gtoOLD: array of Tgto;   // Tableau de gouttes
  marche: boolean;
  Bouton: byte;
  nmbr: integer;

implementation

uses propo12;

{$R *.DFM}

//------------Initialisation des tableux--------------
procedure Tmain.Init;
begin
 nmbr:=strtoint(edit1.text);
 setlength(gto,nmbr);
 setlength(gtoold,nmbr);
end;

//---------------------Moteur-------------------
procedure Tmain.eau;
var
 u: integer;
 a: integer;
begin
 repeat // boucle a l'infini
 for a:=0 to pred(nmbr) do // Pour chaque goutte
  begin
   if fond.Canvas.Pixels[Gto[a].x, Gto[a].y + 1]= clwhite
   then // Si y'a un pixel blanc dessous la goute
     Gto[a].y := Gto[a].y + 1 //Ca la fait descendre pi c tou
   else // Sinon
    begin
     u := round(Random(2)); // On choisi de kel koté elle va partir
     case u of
      0:u := -1;
      1:u := 1;
     end;
     if fond.Canvas.Pixels[Gto[a].x + u, Gto[a].y] = clwhite
     then // si le cote ou elle va y'a rien ben c bon
       Gto[a].x := Gto[a].x + u // Ca la décale du coté choisi
     else // Sinon, si y'a rien de l'autre coté , ca la decale de lautre coté
       if fond.Canvas.pixels[Gto[a].x + (-u), Gto[a].y] = clwhite
       then Gto[a].x := Gto[a].x + (-u); // Sinon ben elle bouge po
     end;
     fond.canvas.pixels[GtoOLD[a].x, GtoOLD[a].y]:= clwhite;//efface l'ancinne goute
     fond.canvas.pixels[Gto[a].x, Gto[a].y]:= gto[a].Col; // Trace la nouvelle
     GtoOLD[a]:=gto[a]; // enregistre les positions
    end;
  Application.ProcessMessages;    // Pour pouvoir récupérer les événements du system
 until marche=false; // Fai une boucle a l'infini jusqu'a que marche=false
 // Showmessage('Fini');
end;


procedure Tmain.FormCreate(Sender: TObject);
begin
 fond.Canvas.Brush.Style:=bssolid;
end;

procedure Tmain.Button1Click(Sender: TObject);
var
 a:integer;
begin
 init; // initialize
 for a:=0 to pred(nmbr) do // place les gouttes
  begin
   Gto[a].x:=fond.width div 2;
   Gto[a].y:=1;
   gto[a].col:=clnavy;
  end;
 marche:=true; // lance la machine
 eau;
end;

procedure Tmain.FondMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
 // TRACE UN CERCLE BLANC OU ROUGE SUIVANT LE BOUTON PRESSE DE LA SOURIS
 if button=mbleft
 then
  begin
   fond.Canvas.Brush.Color:=clmaroon;
   fond.Canvas.Pen.Color:=clmaroon;
   bouton:=1;
  end;
 if button=mbright
 then
  begin
   fond.Canvas.Brush.Color:=clwhite;
   fond.Canvas.Pen.Color:=clwhite;
   bouton:=2;
  end;
 //
 fond.Canvas.Ellipse(x-5,y-5,x+5,y+5);
end;

procedure Tmain.Button4Click(Sender: TObject);
begin
 marche:=false;
 Application.Terminate;
end;

procedure Tmain.FondMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
 bouton:=0;
end;

procedure Tmain.FondMouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
 // Trace les cercles
 if bouton=0
 then Exit;
 if bouton=1
 then
  begin
   fond.Canvas.Brush.Color:=clmaroon;
   fond.Canvas.Pen.Color:=clmaroon;
  end;
 if bouton=2
 then
  begin
   fond.Canvas.Brush.Color:=clwhite;
   fond.Canvas.Pen.Color:=clwhite;
  end;
 //
 Fond.Canvas.Ellipse(x-5,y-5,x+5,y+5);
end;

procedure Tmain.Button2Click(Sender: TObject);
begin
 // Efface
 fond.Canvas.Brush.Color:=clwhite;
 fond.Canvas.Pen.Color:=clwhite;
 fond.Canvas.Rectangle(0,0,fond.Width,fond.Height);
end;

procedure Tmain.FormPaint(Sender: TObject);
begin
 Button2Click(Sender);
end;

procedure Tmain.Button3Click(Sender: TObject);
begin
 propo.Show;
end;

procedure Tmain.FormClose(Sender: TObject; var Action: TCloseAction);
begin
 marche:=false;
 Application.Terminate;
end;

end.
