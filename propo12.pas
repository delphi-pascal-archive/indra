unit propo12;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, StdCtrls, ShellAPI;

type
  Tpropo = class(TForm)
    Timer1: TTimer;
    Label1: TLabel;
    Image1: TImage;
    Image2: TImage;
    Image3: TImage;
    Panel1: TPanel;
    Label2: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure degage(Speed:integer);
    procedure Label1Click(Sender: TObject);
    procedure Image1Click(Sender: TObject);
    // procedure RtlMoveMemory(var Destination,Source,Length;); external// 'kernel32.dll';
           
  private
    { Private declarations }
    procedure GetInfo(NameExe: string; var l1: string; var l4: string);
  public
    { Public declarations }
  end;

var
  propo: Tpropo;
  inc:integer;
  nt:integer;
  e:integer;
implementation

{$R *.DFM}

procedure Tpropo.FormCreate(Sender: TObject);
var
 Version:string;
 autre:string;
begin
 inc:=5;
 //Bonne taille et position
 propo.Height:=88;
 propo.width:=301;
 propo.top:=Screen.Height div 2-propo.height div 2;
 propo.left:=screen.width div 2-propo.width div 2;

 //Arrondi la form
 SetWindowRgn(propo.handle, CreateRoundRectRgn(0, 0, propo.Width, propo.Height, 20, 20), True);

 //trouve la version:
 getinfo(application.exename,version,autre);

 //Texte des labels
 //Changer la date---->------->-------------|
 Label1.Caption := version + #13+#10 + 'En Juillet 2001' +#13+#10 + 'Par Michel Fabien' +#13+#10+ 'E-mail : fabiin@softhome.net' + #13+#10 + 'Web: http://12waresoft.fr.st';
 Label2.Caption := Application.Title;
end;

procedure Tpropo.Timer1Timer(Sender: TObject);
begin
 e:=e+inc;
 If e >= 300 Then
        begin
        inc := -inc;
        image2.Picture:=image1.Picture;
        end;

 If e <= 0 Then
        begin
         inc := -inc;
         nT := nT + 1;
         image2.picture:=image3.picture;
         end;
 Label2.Left := Label2.Left - 3;
 If Label2.Left + Label2.Width < 0
 Then Label2.Left := Label1.Left;
 // Au bout de 3 fois , la form dégage
 If nT = 3 Then Degage(40);
end;

procedure Tpropo.degage(Speed:integer);
var
 dx:real;
 dy:real;
 u:real;
begin
 u:=0;
 Timer1.Interval:= 0;
 repeat  //Fai partir en spirale
  u:=u + 1;
  dx:= Cos(u) * u * Speed;
  dy:= Sin(u) * u * Speed;
  propo.Top:=propo.top +round(dy) ;
  propo.Left:=propo.Left +round(dx);
  Sleep(10);//Attend 1MS(pour meme vitesse sur toute machines)
 until propo.Left > screen.Width;

 // enlève le toujours visible:
 // SetWindowPos Me.hwnd, -1, 0, 0, 0, 0, &H2 Or &H1 Or &H40 Or &H10
 propo.Close;
end;

procedure Tpropo.Label1Click(Sender: TObject);
begin
 degage(10);
end;

procedure Tpropo.Image1Click(Sender: TObject);
begin
 ShellExecute(getDesktopWindow, 'open', 'http://12waresoft.fr.st', nil, nil, SW_hide);
end;

procedure Tpropo.GetInfo(NameExe: string; var l1: string; var l4: string);
var dwVerSize:longint; hMem:integer; LpData: Lpstr; dwVerHandle:LongWord; nStrLong:LongWord; cc:string; Lp:Pointer; cStartBuf:array [0..4] of char; CresBuf:array [0..255] of char;begin dwVerSize:=GetFileVersionInfoSize(PChar(NameExe),dwVerHandle); hMem:=GlobalAlloc(GMEM_ZEROINIT,dwVerSize+100); LpData:=Globallock(hMem); try  GetFileVersionInfo(PChar(NameExe),dwVerHandle,dwVerSize,LpData);  if not VerQueryValue(LpData,'\VarFileInfo\Translation',Lp,nStrLong) then exit;  StrPcopy(cStartBuf,PChar(Lp));  cc:=Format('\StringFileInfo\%.2x%.2x%.2x%.2x\', [byte(cStartBuf[1]),  byte(cStartBuf[0]),  byte(cStartBuf[3]),  byte(cStartBuf[2])]);  StrCopy(CresBuf,Pchar(cc+'FileVersion'));  if VerQueryValue(LpData,CresBuf,Lp,nStrLong) then begin  StrPcopy(CresBuf,PChar(Lp));  L1:= format('Version %s.%s.%s.%s',[CresBuf[0],CresBuf[2], CresBuf[4], CresBuf[6]]);  StrCopy(CresBuf,Pchar(cc + 'LegalCopyright'));  end;  if VerQueryValue(LpData,CresBuf,Lp,nStrLong) then begin  StrPcopy(CresBuf,PChar(Lp));  L4:=StrPas(CresBuf);  end; finally  GlobalUnLock(hMem); end;end;

end.
