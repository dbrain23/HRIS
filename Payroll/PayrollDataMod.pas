unit PayrollDataMod;

interface

uses
  System.SysUtils, System.Classes, Data.DB, Data.Win.ADODB, cxStyles, cxClasses,
  Dialogs, PayrollObj;

type
  TdmPayroll = class(TDataModule)
    dstPayroll: TADODataSet;
    dscPayroll: TDataSource;
    dstPayrollDeductions: TADODataSet;
    dscPayrollDeductions: TDataSource;
    dstPayrollAllowances: TADODataSet;
    dscPayrollAllowances: TDataSource;
    dstPayrollAdjustments: TADODataSet;
    dscAdjustments: TDataSource;
    dstPayrollPeriod: TADODataSet;
    csrPayroll: TcxStyleRepository;
    csGross: TcxStyle;
    dstDeductionTypes: TADODataSet;
    dscDeductionTypes: TDataSource;
    dstAllowanceTypes: TADODataSet;
    dscAllowanceTypes: TDataSource;
    dstPayrollList: TADODataSet;
    dscPayrollList: TDataSource;
    csAllowance: TcxStyle;
    csDeduction: TcxStyle;
    csNet: TcxStyle;
    dstResourceTypes: TADODataSet;
    dstDependents: TADODataSet;
    dscDependents: TDataSource;
    dstAdjustmentTypes: TADODataSet;
    dscAdjustmentTypes: TDataSource;
    csAdjustment: TcxStyle;
    dstPayslips: TADODataSet;
    dstPayslipsemployee_name: TStringField;
    dstPayslipspayroll_period: TStringField;
    dstPayslipsworking_days: TBCDField;
    dstPayslipsdays_attended: TBCDField;
    dstPayslipsholidays: TIntegerField;
    dstPayslipsleave_with_pay: TBCDField;
    dstPayslipsleave_without_pay: TBCDField;
    dstPayslipsawol: TIntegerField;
    dstPayslipssemi_monthly_rate: TBCDField;
    dstPayslipsallowance: TFMTBCDField;
    dstPayslipsadjustment: TFMTBCDField;
    dstPayslipsundertime: TBCDField;
    dstPayslipsdeduction: TFMTBCDField;
    dstPayslipsnet: TFMTBCDField;
    dstPayslipsundertime_lwop: TFMTBCDField;
    dstPayslipsgross_pay: TFMTBCDField;
    dstPayslipsdeduction_types: TStringField;
    dstPayslipsdeduction_amount: TStringField;
    dstDeductionSummary: TADODataSet;
    dstVariance: TADODataSet;
    dstLocations: TADODataSet;
    dscLocations: TDataSource;
    dstDeductionsAll: TADODataSet;
    dscDeductionsAll: TDataSource;
    dstEmployees: TADODataSet;
    dstPayslipsincomplete: TFMTBCDField;
    dstPayslipslate: TBCDField;
    dstPayslipsbusiness_trip: TBCDField;
    procedure DataModuleCreate(Sender: TObject);
    procedure dstPayrollDeductionsBeforeOpen(DataSet: TDataSet);
    procedure dstPayrollDeductionsBeforePost(DataSet: TDataSet);
    procedure dstPayrollAllowancesBeforeOpen(DataSet: TDataSet);
    procedure dstPayrollBeforeOpen(DataSet: TDataSet);
    procedure dstPayrollAdjustmentsBeforeOpen(DataSet: TDataSet);
    procedure dstPayrollAdjustmentsBeforePost(DataSet: TDataSet);
    procedure dstPayrollAdjustmentsAfterOpen(DataSet: TDataSet);
    procedure DataModuleDestroy(Sender: TObject);
    procedure dstDeductionsAllBeforePost(DataSet: TDataSet);
  private
    { Private declarations }
    fPayroll: TPayroll;
  public
    { Public declarations }
    property Payroll: TPayroll read fPayroll write fPayroll;
  end;

var
  dmPayroll: TdmPayroll;

implementation

uses SecurityDataMod, AppConstant, User, DBUtil;

{%CLASSGROUP 'System.Classes.TPersistent'}

{$R *.dfm}

procedure TdmPayroll.DataModuleCreate(Sender: TObject);
begin
  fPayroll := TPayroll.Create;
end;

procedure TdmPayroll.DataModuleDestroy(Sender: TObject);
begin
  CloseDataSets(self);
end;

procedure TdmPayroll.dstDeductionsAllBeforePost(DataSet: TDataSet);
begin
  if DataSet.FieldByName('deduction_amount').AsFloat < 0 then
  begin
    MessageDlg('Invalid value for deduction amount.',mtError,[mbOk],0);
    DataSet.Cancel;
    Abort;
  end;

  if (DataSet.FieldByName('bcf_amount').AsFloat >
     DataSet.FieldByName('deduction_amount').AsFloat) or
     (DataSet.FieldByName('bcf_amount').AsFloat < 0.00) then
  begin
    MessageDlg('Invalid value for branch cash fund.',mtError,[mbOk],0);
    DataSet.Cancel;
    Abort;
  end;
end;

procedure TdmPayroll.dstPayrollAdjustmentsAfterOpen(DataSet: TDataSet);
begin
  dstPayrollAdjustments.Properties['Unique Table'].Value := 'payrolladjustment';
end;

procedure TdmPayroll.dstPayrollAdjustmentsBeforeOpen(DataSet: TDataSet);
begin
  (DataSet as TADODataSet).Parameters.ParamByName('@payroll_code').Value :=
    dstPayrollList.Parameters.ParamByName('@payroll_code').Value;
  (DataSet as TADODataSet).Parameters.ParamByName('@id_num').Value :=
    dstPayrollList.FieldByName('id_num').AsString;
end;

procedure TdmPayroll.dstPayrollAdjustmentsBeforePost(DataSet: TDataSet);

  function DuplicateTypesExists: boolean;
  var
    adoTemp: TADODataSet;
    adjustmentType: string;
  begin
    adoTemp := TADODataSet.Create(nil);
    try
      adoTemp.Clone(DataSet as TADODataSet);
      adoTemp.Filtered := true;

      while not adoTemp.Eof do
      begin
        adjustmentType := adoTemp.FieldByName('adjustmenttype_code').AsString;
        adoTemp.Filter := 'adjustmenttype_code = ''' + adjustmentType + '''';

        if adoTemp.RecordCount > 1 then
        begin
          Result := true;
          Exit;
        end;

        adoTemp.Filter := '';

        adoTemp.Next;
      end;
    finally
      adoTemp.Free;
    end;
  end;

begin
  if DataSet.FieldByName('adjustmenttype_code').AsString = '' then
  begin
    MessageDlg('Please select an adjustment type.',mtError,[mbOk],0);
    Abort;
  end;

  if DataSet.FieldByName('adjustment_amount').AsFloat <= 0 then
  begin
    MessageDlg('Invalid value for adjustment amount.',mtError,[mbOk],0);
    Abort;
  end;

  // check for duplicate adjustment types
//  if DuplicateTypesExists then
//  begin
//    MessageDlg('Duplicate adjustment type is not allowed.',mtError,[mbOk],0);
//    Abort;
//  end;

  // populate required fields
  if dstPayrollAdjustments.State = dsInsert then
  begin
    DataSet.FieldByName('payroll_code').AsString :=
       dstPayroll.Parameters.ParamByName('@payroll_code').Value;
    DataSet.FieldByName('id_num').AsString :=
       dstPayroll.Parameters.ParamByName('@id_num').Value;
    DataSet.FieldByName('created_by').AsString := SystemUser.UserIdNum;
    DataSet.FieldByName('created_date').AsDateTime := System.SysUtils.Now;
  end;
end;

procedure TdmPayroll.dstPayrollAllowancesBeforeOpen(DataSet: TDataSet);
begin
  (DataSet as TADODataSet).Parameters.ParamByName('@payroll_code').Value :=
    dstPayrollList.Parameters.ParamByName('@payroll_code').Value;
  (DataSet as TADODataSet).Parameters.ParamByName('@id_num').Value :=
    dstPayrollList.FieldByName('id_num').AsString;
end;

procedure TdmPayroll.dstPayrollBeforeOpen(DataSet: TDataSet);
begin
  (DataSet as TADODataSet).Parameters.ParamByName('@payroll_code').Value :=
      dstPayrollList.Parameters.ParamByName('@payroll_code').Value;
  (DataSet as TADODataSet).Parameters.ParamByName('@id_num').Value :=
      dstPayrollList.FieldByName('id_num').AsString;
end;

procedure TdmPayroll.dstPayrollDeductionsBeforeOpen(DataSet: TDataSet);
begin
  (DataSet as TADODataSet).Parameters.ParamByName('@payroll_code').Value :=
    dstPayrollList.Parameters.ParamByName('@payroll_code').Value;
  (DataSet as TADODataSet).Parameters.ParamByName('@id_num').Value :=
    dstPayrollList.FieldByName('id_num').AsString;

  (DataSet as TADODataSet).Filter := '';
end;

procedure TdmPayroll.dstPayrollDeductionsBeforePost(DataSet: TDataSet);
begin
  if DataSet.FieldByName('deduction_amount').AsFloat < 0 then
  begin
    MessageDlg('Invalid value for deduction amount.',mtError,[mbOk],0);
    DataSet.Cancel;
    Abort;
  end;

  if (DataSet.FieldByName('bcf_amount').AsFloat >
     DataSet.FieldByName('deduction_amount').AsFloat) or
     (DataSet.FieldByName('bcf_amount').AsFloat < 0.00) then
  begin
    MessageDlg('Invalid value for branch cash fund.',mtError,[mbOk],0);
    DataSet.Cancel;
    Abort;
  end;
end;

end.
