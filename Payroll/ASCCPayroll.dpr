program ASCCPayroll;

uses
  Vcl.Forms,
  PayrollMain in 'PayrollMain.pas' {frmASCCPayrollMain};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmASCCPayrollMain, frmASCCPayrollMain);
  Application.Run;
end.
