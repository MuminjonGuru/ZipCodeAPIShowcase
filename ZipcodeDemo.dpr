program ZipcodeDemo;

uses
  System.StartUpCopy,
  FMX.Forms,
  ZipcodeDemo.MainUnit in 'ZipcodeDemo.MainUnit.pas' {FormMain};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TFormMain, FormMain);
  Application.Run;
end.
