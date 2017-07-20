program ConfigManager;

uses
  Vcl.Forms,
  ConfigManagerMain in 'ConfigManagerMain.pas' {fConfigManagerMain};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfConfigManagerMain, fConfigManagerMain);
  Application.Run;
end.
