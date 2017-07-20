program HRIS;

uses
  Vcl.Forms,
  HRISMain in 'HRISMain.pas' {fHRISMain},
  Vcl.Themes,
  Vcl.Styles,
  ApplicationUtil,
  LoginHRIS;

{$R *.res}

begin
  if not RestoreIfRunning(Application.Handle) then
  begin
    if TfLoginHRIS.LoggedIn then
    begin
      Application.Initialize;
      Application.MainFormOnTaskbar := True;
      Application.CreateForm(TfHRISMain, fHRISMain);
      Application.Run;
    end;
  end;
end.
