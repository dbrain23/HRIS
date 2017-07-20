unit PayrollUtil;

interface

uses
  Vcl.Controls, Vcl.Forms;

procedure DockForm(const selectedNodeIndex: integer; dockCtrl: TWinControl);

// NODE values
const
  PAYROLLMAIN_NODE   = 101;
  CLAIMSLIST_NODE    = 102;
  PAYSLIPS_NODE      = 103;
  DEDUCTIONS         = 104;
  RPT_DEDUCTION_NODE = 201;
  RPT_VARIANCE_NODE  = 202;

implementation

uses
  FormUtil, PayrollDependents, PayrollMain, Payslips, DeductionSummaryReport,
  VarianceReport, PayrollDeductions, AppConstant, SecurityDataMod;

procedure DockForm(const selectedNodeIndex: integer; dockCtrl: TWinControl);
var
  form: TForm;
begin
  case selectedNodeIndex of

      PAYROLLMAIN_NODE:   form := TfPayrollMain.Create(dockCtrl);
      CLAIMSLIST_NODE:    form := TfPayrollDependents.Create(dockCtrl);
      PAYSLIPS_NODE:      form := TfPayslips.Create(dockCtrl);
      DEDUCTIONS:
        begin
          if not dmSecurity.User.HasPrivileges([TAppConstant.TPrivilege.PAYROLL_DEDUCTION]) then
            exit;

          form := TfPayrollDeductions.Create(dockCtrl);
        end;
      RPT_DEDUCTION_NODE: form := TfDeductionSummaryReport.Create(dockCtrl);
      RPT_VARIANCE_NODE:  form := TfVarianceReport.Create(dockCtrl);

  else  form := TForm.Create(dockCtrl);
  end;

  FormUtil.DockForm(dockCtrl,form);
end;

end.
