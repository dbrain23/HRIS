program SyncWeb;

{$APPTYPE CONSOLE}

uses
  Web.WebBroker,
  CGIApp,
  SyncWebMod in 'SyncWebMod.pas' {wmSync: TWebModule},
  SyncWebImpl in 'SyncWebImpl.pas',
  SyncWebIntf in 'SyncWebIntf.pas',
  ISyncWebWSDL in 'ISyncWebWSDL.pas',
  SyncDataMod in 'SyncDataMod.pas' {dmSync: TSoapDataModule};

{$R *.res}

begin
  Application.Initialize;
  Application.WebModuleClass := WebModuleClass;
  Application.Run;
end.
