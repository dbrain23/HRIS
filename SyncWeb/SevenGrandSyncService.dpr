library SevenGrandSyncService;

uses
  Winapi.ActiveX,
  System.Win.ComObj,
  Web.WebBroker,
  Web.Win.ISAPIApp,
  Web.Win.ISAPIThreadPool,
  SyncDataMod in 'SyncDataMod.pas' {dmSync: TSoapDataModule},
  SyncWebImpl in 'SyncWebImpl.pas',
  SyncWebIntf in 'SyncWebIntf.pas',
  SyncWebMod in 'SyncWebMod.pas' {wmSync: TWebModule},
  ISyncWebWSDL in 'ISyncWebWSDL.pas';

{$R *.res}

exports
  GetExtensionVersion,
  HttpExtensionProc,
  TerminateExtension;

begin
  CoInitFlags := COINIT_MULTITHREADED;
  Application.Initialize;
  Application.WebModuleClass := WebModuleClass;
  Application.Run;
end.
