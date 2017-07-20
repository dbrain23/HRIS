object dmPayroll: TdmPayroll
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Height = 388
  Width = 855
  object dstPayroll: TADODataSet
    Connection = dmSecurity.acSecurity
    CursorType = ctStatic
    LockType = ltReadOnly
    BeforeOpen = dstPayrollBeforeOpen
    CommandText = 'pr_get_payroll;1'
    CommandType = cmdStoredProc
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = 0
      end
      item
        Name = '@payroll_code'
        Attributes = [paNullable]
        DataType = ftString
        Size = 15
        Value = Null
      end
      item
        Name = '@id_num'
        DataType = ftString
        Size = -1
        Value = ''
      end>
    Left = 32
    Top = 16
  end
  object dscPayroll: TDataSource
    DataSet = dstPayroll
    Left = 128
    Top = 16
  end
  object dstPayrollDeductions: TADODataSet
    Connection = dmSecurity.acSecurity
    CursorType = ctStatic
    Filtered = True
    LockType = ltBatchOptimistic
    BeforeOpen = dstPayrollDeductionsBeforeOpen
    BeforePost = dstPayrollDeductionsBeforePost
    CommandText = 'pr_get_payroll_deductions;1'
    CommandType = cmdStoredProc
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = 0
      end
      item
        Name = '@payroll_code'
        Attributes = [paNullable]
        DataType = ftString
        Size = 15
        Value = ''
      end
      item
        Name = '@id_num'
        Attributes = [paNullable]
        DataType = ftString
        Size = 12
        Value = ''
      end>
    Left = 232
    Top = 16
  end
  object dscPayrollDeductions: TDataSource
    DataSet = dstPayrollDeductions
    Left = 344
    Top = 16
  end
  object dstPayrollAllowances: TADODataSet
    Connection = dmSecurity.acSecurity
    CursorType = ctStatic
    LockType = ltReadOnly
    BeforeOpen = dstPayrollAllowancesBeforeOpen
    CommandText = 'pr_get_payroll_allowances;1'
    CommandType = cmdStoredProc
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = 0
      end
      item
        Name = '@payroll_code'
        Attributes = [paNullable]
        DataType = ftString
        Size = 15
        Value = ''
      end
      item
        Name = '@id_num'
        Attributes = [paNullable]
        DataType = ftString
        Size = 12
        Value = ''
      end>
    Left = 232
    Top = 96
  end
  object dscPayrollAllowances: TDataSource
    DataSet = dstPayrollAllowances
    Left = 344
    Top = 96
  end
  object dstPayrollAdjustments: TADODataSet
    Connection = dmSecurity.acSecurity
    CursorType = ctStatic
    LockType = ltBatchOptimistic
    BeforeOpen = dstPayrollAdjustmentsBeforeOpen
    AfterOpen = dstPayrollAdjustmentsAfterOpen
    BeforePost = dstPayrollAdjustmentsBeforePost
    CommandText = 'pr_get_payroll_adjustments;1'
    CommandType = cmdStoredProc
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = 0
      end
      item
        Name = '@payroll_code'
        Attributes = [paNullable]
        DataType = ftString
        Size = 15
        Value = ''
      end
      item
        Name = '@id_num'
        Attributes = [paNullable]
        DataType = ftString
        Size = 12
        Value = ''
      end>
    Left = 232
    Top = 176
  end
  object dscAdjustments: TDataSource
    DataSet = dstPayrollAdjustments
    Left = 344
    Top = 176
  end
  object dstPayrollPeriod: TADODataSet
    Connection = dmSecurity.acSecurity
    CursorType = ctStatic
    CommandText = 'pr_dd_payroll_period;1'
    CommandType = cmdStoredProc
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = Null
      end>
    Left = 32
    Top = 184
  end
  object csrPayroll: TcxStyleRepository
    Left = 36
    Top = 252
    PixelsPerInch = 96
    object csGross: TcxStyle
      AssignedValues = [svFont, svTextColor]
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGreen
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = []
      TextColor = clBlue
    end
    object csAllowance: TcxStyle
      AssignedValues = [svTextColor]
      TextColor = clGreen
    end
    object csDeduction: TcxStyle
      AssignedValues = [svTextColor]
      TextColor = clRed
    end
    object csNet: TcxStyle
      AssignedValues = [svFont, svTextColor]
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGray
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      TextColor = clGray
    end
    object csAdjustment: TcxStyle
      AssignedValues = [svTextColor]
      TextColor = clPurple
    end
  end
  object dstDeductionTypes: TADODataSet
    Connection = dmSecurity.acSecurity
    CursorType = ctStatic
    LockType = ltReadOnly
    CommandText = 'pr_dd_get_deduction_types;1'
    CommandType = cmdStoredProc
    Parameters = <>
    Left = 480
    Top = 16
  end
  object dscDeductionTypes: TDataSource
    DataSet = dstDeductionTypes
    Left = 592
    Top = 16
  end
  object dstAllowanceTypes: TADODataSet
    Connection = dmSecurity.acSecurity
    CursorType = ctStatic
    Filtered = True
    LockType = ltReadOnly
    CommandText = 'hris_dd_get_allowance_types;1'
    CommandType = cmdStoredProc
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = 0
      end>
    Left = 480
    Top = 176
  end
  object dscAllowanceTypes: TDataSource
    DataSet = dstAllowanceTypes
    Left = 592
    Top = 176
  end
  object dstPayrollList: TADODataSet
    Connection = dmSecurity.acSecurity
    CursorType = ctStatic
    Filtered = True
    LockType = ltReadOnly
    CommandText = 'pr_get_payroll;1'
    CommandType = cmdStoredProc
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = 0
      end
      item
        Name = '@payroll_code'
        Attributes = [paNullable]
        DataType = ftString
        Size = 15
        Value = ''
      end
      item
        Name = '@id_num'
        DataType = ftString
        Size = 12
        Value = ''
      end>
    Left = 32
    Top = 96
  end
  object dscPayrollList: TDataSource
    DataSet = dstPayrollList
    Left = 128
    Top = 96
  end
  object dstResourceTypes: TADODataSet
    AutoCalcFields = False
    Connection = dmSecurity.acSecurity
    CursorType = ctStatic
    LockType = ltReadOnly
    CommandText = 'hris_dd_get_resource_types;1'
    CommandType = cmdStoredProc
    Parameters = <>
    Left = 237
    Top = 256
  end
  object dstDependents: TADODataSet
    Connection = dmSecurity.acSecurity
    CursorType = ctStatic
    Filtered = True
    LockType = ltBatchOptimistic
    CommandText = 'pr_get_dependents;1'
    CommandType = cmdStoredProc
    Parameters = <>
    Left = 480
    Top = 256
  end
  object dscDependents: TDataSource
    DataSet = dstDependents
    Left = 592
    Top = 256
  end
  object dstAdjustmentTypes: TADODataSet
    Connection = dmSecurity.acSecurity
    CursorType = ctStatic
    LockType = ltReadOnly
    CommandText = 'pr_dd_get_adjustment_types;1'
    CommandType = cmdStoredProc
    Parameters = <>
    Left = 480
    Top = 96
  end
  object dscAdjustmentTypes: TDataSource
    DataSet = dstAdjustmentTypes
    Left = 592
    Top = 96
  end
  object dstPayslips: TADODataSet
    Connection = dmSecurity.acSecurity
    CursorType = ctStatic
    Filtered = True
    LockType = ltReadOnly
    CommandText = 'rpt_payslip;1'
    CommandType = cmdStoredProc
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = 0
      end
      item
        Name = '@payroll_code'
        Attributes = [paNullable]
        DataType = ftString
        Size = 17
        Value = ''
      end>
    Left = 712
    Top = 16
    object dstPayslipsemployee_name: TStringField
      FieldName = 'employee_name'
      ReadOnly = True
      Size = 250
    end
    object dstPayslipspayroll_period: TStringField
      FieldName = 'payroll_period'
      ReadOnly = True
      Size = 23
    end
    object dstPayslipsworking_days: TBCDField
      FieldName = 'working_days'
      ReadOnly = True
      DisplayFormat = '0.00'
      Precision = 8
      Size = 2
    end
    object dstPayslipsdays_attended: TBCDField
      FieldName = 'days_attended'
      DisplayFormat = '0.00'
      Precision = 8
      Size = 2
    end
    object dstPayslipsholidays: TIntegerField
      FieldName = 'holidays'
      ReadOnly = True
      DisplayFormat = '0.00'
    end
    object dstPayslipsleave_with_pay: TBCDField
      FieldName = 'leave_with_pay'
      DisplayFormat = '0.00'
      Precision = 8
      Size = 2
    end
    object dstPayslipsleave_without_pay: TBCDField
      FieldName = 'leave_without_pay'
      DisplayFormat = '0.00'
      Precision = 8
      Size = 2
    end
    object dstPayslipsawol: TIntegerField
      FieldName = 'awol'
      ReadOnly = True
      DisplayFormat = '0.00'
    end
    object dstPayslipssemi_monthly_rate: TBCDField
      FieldName = 'semi_monthly_rate'
      DisplayFormat = '###,##0.00'
      Precision = 8
      Size = 2
    end
    object dstPayslipsallowance: TFMTBCDField
      FieldName = 'allowance'
      ReadOnly = True
      DisplayFormat = '###,##0.00;(###,##0.00);-'
      Precision = 38
      Size = 2
    end
    object dstPayslipsadjustment: TFMTBCDField
      FieldName = 'adjustment'
      ReadOnly = True
      DisplayFormat = '###,##0.00;(###,##0.00);-'
      Precision = 38
      Size = 2
    end
    object dstPayslipsundertime: TBCDField
      FieldName = 'undertime'
      DisplayFormat = '###,##0.00'
      Precision = 8
      Size = 2
    end
    object dstPayslipsundertime_lwop: TFMTBCDField
      FieldName = 'undertime_lwop'
      ReadOnly = True
      DisplayFormat = '###,##0.00;(###,##0.00);-'
      Precision = 26
    end
    object dstPayslipsdeduction: TFMTBCDField
      FieldName = 'deduction'
      DisplayFormat = '###,##0.00;(###,##0.00);-'
      Precision = 38
      Size = 2
    end
    object dstPayslipsgross_pay: TFMTBCDField
      FieldName = 'gross_pay'
      ReadOnly = True
      DisplayFormat = '###,##0.00;(###,##0.00);-'
      Precision = 38
      Size = 2
    end
    object dstPayslipsnet: TFMTBCDField
      FieldName = 'net'
      ReadOnly = True
      DisplayFormat = '###,##0.00'
      Precision = 38
      Size = 2
    end
    object dstPayslipsdeduction_types: TStringField
      FieldName = 'deduction_types'
      ReadOnly = True
      Size = 250
    end
    object dstPayslipsdeduction_amount: TStringField
      FieldName = 'deduction_amount'
      ReadOnly = True
      Size = 250
    end
    object dstPayslipsincomplete: TFMTBCDField
      FieldName = 'incomplete'
      ReadOnly = True
      DisplayFormat = '###,##0.00;(###,##0.00);-'
      Precision = 24
      Size = 6
    end
    object dstPayslipslate: TBCDField
      FieldName = 'late'
      DisplayFormat = '###,##0.00;(###,##0.00);-'
      Precision = 8
      Size = 2
    end
    object dstPayslipsbusiness_trip: TBCDField
      FieldName = 'business_trip'
      ReadOnly = True
      DisplayFormat = '0.00'
      Precision = 15
      Size = 2
    end
  end
  object dstDeductionSummary: TADODataSet
    Connection = dmSecurity.acSecurity
    CursorType = ctStatic
    Filtered = True
    LockType = ltReadOnly
    CommandText = 'rpt_pr_deduction_summary;1'
    CommandType = cmdStoredProc
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = 0
      end
      item
        Name = '@payroll_code'
        Attributes = [paNullable]
        DataType = ftString
        Size = 15
        Value = ''
      end>
    Left = 712
    Top = 96
  end
  object dstVariance: TADODataSet
    Connection = dmSecurity.acSecurity
    CursorType = ctStatic
    Filtered = True
    LockType = ltReadOnly
    CommandText = 'rpt_pr_variance;1'
    CommandType = cmdStoredProc
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = 0
      end
      item
        Name = '@payroll_code'
        Attributes = [paNullable]
        DataType = ftString
        Size = 15
        Value = ''
      end
      item
        Name = '@variance_amount'
        Attributes = [paNullable]
        DataType = ftBCD
        NumericScale = 2
        Precision = 8
        Value = 0c
      end>
    Left = 712
    Top = 176
  end
  object dstLocations: TADODataSet
    Connection = dmSecurity.acSecurity
    CursorType = ctStatic
    LockType = ltReadOnly
    CommandText = 'hris_dd_get_locations;1'
    CommandType = cmdStoredProc
    Parameters = <>
    Left = 480
    Top = 328
  end
  object dscLocations: TDataSource
    DataSet = dstLocations
    Left = 592
    Top = 328
  end
  object dstDeductionsAll: TADODataSet
    Connection = dmSecurity.acSecurity
    CursorType = ctStatic
    Filtered = True
    LockType = ltBatchOptimistic
    BeforePost = dstDeductionsAllBeforePost
    CommandText = 'pr_get_payroll_deductions_by_type;1'
    CommandType = cmdStoredProc
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = 0
      end
      item
        Name = '@payroll_code'
        Attributes = [paNullable]
        DataType = ftString
        Size = 15
        Value = ''
      end
      item
        Name = '@type_code'
        Attributes = [paNullable]
        DataType = ftString
        Size = 3
        Value = ''
      end>
    Left = 232
    Top = 320
  end
  object dscDeductionsAll: TDataSource
    DataSet = dstDeductionsAll
    Left = 344
    Top = 320
  end
  object dstEmployees: TADODataSet
    Connection = dmSecurity.acSecurity
    CursorType = ctStatic
    LockType = ltReadOnly
    CommandText = 'hris_dd_get_employees;1'
    CommandType = cmdStoredProc
    Parameters = <>
    Left = 720
    Top = 256
  end
end
