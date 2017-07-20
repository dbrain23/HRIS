program Kiosk;

uses
  Vcl.Forms,
  LoginKiosk,
  ApplicationUtil,
  KioskMain in 'KioskMain.pas' {fKioskMain};

{$R *.res}

begin
  if not RestoreIfRunning(Application.Handle) then
  begin
    if TfLoginKiosk.LoggedIn then
    begin
      Application.Initialize;
      Application.MainFormOnTaskbar := True;
      Application.CreateForm(TfKioskMain, fKioskMain);
      Application.Run;
    end;
  end;
end.
