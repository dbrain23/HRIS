program ServiceMonitor;

uses
  Vcl.Forms,
  ServiceMonitorMain in 'ServiceMonitorMain.pas' {fServiceMonitorMain};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := False;
  Application.Title := 'ASCC Service Monitor';
  Application.CreateForm(TfServiceMonitorMain, fServiceMonitorMain);
  Application.Run;
end.
