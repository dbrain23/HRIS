program LogBox;

uses
  Vcl.Forms,
  LogBoxMain in 'LogBoxMain.pas' {fLogBoxMain},
  BaseForm in '..\Base\BaseForm.pas' {fBase};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfLogBoxMain, fLogBoxMain);
  Application.Run;
end.




