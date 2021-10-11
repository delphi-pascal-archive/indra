program Project1;

uses
  Forms,
  Unit1 in 'Unit1.pas' {main},
  propo12 in 'propo12.pas' {propo};

{$R *.RES}

begin
  Application.Initialize;
  Application.Title := 'Indra';
  Application.CreateForm(Tmain, main);
  Application.CreateForm(Tpropo, propo);
  Application.Run;
end.
