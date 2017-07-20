object dmPaf: TdmPaf
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 453
  Width = 813
  object dscPaf: TDataSource
    DataSet = dstPaf
    Left = 128
    Top = 24
  end
  object dstPaf: TADODataSet
    Connection = dmSecurity.acSecurity
    CursorType = ctStatic
    BeforeOpen = dstPafBeforeOpen
    AfterOpen = dstPafAfterOpen
    BeforePost = dstPafBeforePost
    AfterPost = dstPafAfterPost
    OnNewRecord = dstPafNewRecord
    CommandText = 'hris_get_paf;1'
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
        Name = '@paf_id'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = 0
      end>
    Left = 256
    Top = 24
  end
  object dscPafComp: TDataSource
    DataSet = dstPafComp
    Left = 128
    Top = 88
  end
  object dstPafComp: TADODataSet
    Connection = dmSecurity.acSecurity
    LockType = ltBatchOptimistic
    BeforeOpen = dstPafCompBeforeOpen
    CommandText = 'hris_get_paf_comp;1'
    CommandType = cmdStoredProc
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = Null
      end
      item
        Name = '@paf_id'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = 0
      end>
    Left = 256
    Top = 88
  end
  object dscPafAllowances: TDataSource
    DataSet = dstPafAllowances
    Left = 128
    Top = 152
  end
  object dstPafAllowances: TADODataSet
    Connection = dmSecurity.acSecurity
    CursorType = ctStatic
    LockType = ltBatchOptimistic
    BeforeOpen = dstPafAllowancesBeforeOpen
    CommandText = 'hris_get_paf_allowances;1'
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
        Name = '@paf_id'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = 0
      end>
    Left = 256
    Top = 152
  end
  object dscAllowanceTypes: TDataSource
    DataSet = dstAllowanceTypes
    Left = 384
    Top = 24
  end
  object dstAllowanceTypes: TADODataSet
    Connection = dmSecurity.acSecurity
    CursorType = ctStatic
    Filtered = True
    CommandText = 'hris_dd_get_allowance_types;1'
    CommandType = cmdStoredProc
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = Null
      end>
    Left = 504
    Top = 24
  end
  object dscLatestPaf: TDataSource
    DataSet = dstLatestPaf
    Left = 128
    Top = 216
  end
  object dstLatestPaf: TADODataSet
    Connection = dmSecurity.acSecurity
    CursorType = ctStatic
    BeforeOpen = dstLatestPafBeforeOpen
    CommandText = 'hris_get_latest_paf;1'
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
        Name = '@id_num'
        Attributes = [paNullable]
        DataType = ftString
        Precision = 10
        Size = 16
        Value = Null
      end>
    Left = 256
    Top = 216
  end
  object dscPosition: TDataSource
    DataSet = dstPosition
    Left = 384
    Top = 88
  end
  object dstPosition: TADODataSet
    Connection = dmSecurity.acSecurity
    CursorType = ctStatic
    CommandText = 'hris_dd_get_position;1'
    CommandType = cmdStoredProc
    Parameters = <>
    Left = 504
    Top = 88
  end
  object dscPositionStatus: TDataSource
    DataSet = dstPositionStatus
    Left = 384
    Top = 152
  end
  object dstPositionStatus: TADODataSet
    Connection = dmSecurity.acSecurity
    CursorType = ctStatic
    CommandText = 'hris_dd_get_position_status;1'
    CommandType = cmdStoredProc
    Parameters = <>
    Left = 504
    Top = 152
  end
  object dscEmpStatus: TDataSource
    DataSet = dstEmpStatus
    Left = 384
    Top = 216
  end
  object dstEmpStatus: TADODataSet
    Connection = dmSecurity.acSecurity
    CursorType = ctStatic
    CommandText = 'hris_dd_get_emp_status;1'
    CommandType = cmdStoredProc
    Parameters = <>
    Left = 504
    Top = 216
  end
  object dscLocations: TDataSource
    DataSet = dstLocations
    Left = 384
    Top = 280
  end
  object dstLocations: TADODataSet
    Connection = dmSecurity.acSecurity
    CursorType = ctStatic
    CommandText = 'hris_dd_get_locations;1'
    CommandType = cmdStoredProc
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = Null
      end>
    Left = 504
    Top = 280
  end
  object dscLatestPafAllowances: TDataSource
    DataSet = dstLatestPafAllowances
    Left = 128
    Top = 280
  end
  object dstLatestPafAllowances: TADODataSet
    Connection = dmSecurity.acSecurity
    CursorType = ctStatic
    BeforeOpen = dstLatestPafAllowancesBeforeOpen
    CommandText = 'hris_get_latest_paf_allowances;1'
    CommandType = cmdStoredProc
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = Null
      end
      item
        Name = '@paf_id'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = 0
      end>
    Left = 256
    Top = 280
  end
  object dscPafList: TDataSource
    DataSet = dstPafList
    Left = 128
    Top = 344
  end
  object dstPafList: TADODataSet
    Connection = dmSecurity.acSecurity
    CursorType = ctStatic
    Filtered = True
    LockType = ltReadOnly
    CommandText = 'hris_get_paf_list;1'
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
        Name = '@id_num'
        Attributes = [paNullable]
        DataType = ftString
        Precision = 10
        Size = -1
        Value = Null
      end
      item
        Name = '@user_id_num'
        DataType = ftString
        Size = -1
        Value = Null
      end>
    Left = 256
    Top = 344
  end
  object dscSalaryFrequency: TDataSource
    DataSet = dstSalaryFrequency
    Left = 608
    Top = 24
  end
  object dstSalaryFrequency: TADODataSet
    Connection = dmSecurity.acSecurity
    CursorType = ctStatic
    CommandText = 'hris_dd_get_salary_frequencies;1'
    CommandType = cmdStoredProc
    Parameters = <>
    Left = 728
    Top = 24
  end
  object dscDepartments: TDataSource
    DataSet = dstDepartments
    Left = 384
    Top = 344
  end
  object dstDepartments: TADODataSet
    Connection = dmSecurity.acSecurity
    CursorType = ctStatic
    Filtered = True
    CommandText = 'hris_dd_get_departments;1'
    CommandType = cmdStoredProc
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = 0
      end>
    Left = 504
    Top = 344
  end
  object dscPafStatus: TDataSource
    DataSet = dstPafStatus
    Left = 608
    Top = 88
  end
  object dstPafStatus: TADODataSet
    Connection = dmSecurity.acSecurity
    CursorType = ctStatic
    CommandText = 'hris_dd_get_paf_status;1'
    CommandType = cmdStoredProc
    Parameters = <>
    Left = 728
    Top = 88
  end
  object dscPafPrint: TDataSource
    DataSet = dstPafPrint
    Left = 608
    Top = 152
  end
  object dstPafPrint: TADODataSet
    Connection = dmSecurity.acSecurity
    CursorType = ctStatic
    LockType = ltReadOnly
    BeforeOpen = dstPafPrintBeforeOpen
    AfterOpen = dstPafPrintAfterOpen
    AfterClose = dstPafPrintAfterClose
    CommandText = 'rpt_paf;1'
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
        Name = '@paf_id'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = 1508
      end>
    Left = 728
    Top = 152
  end
  object dscPafSignatories: TDataSource
    DataSet = dstPafSignatories
    Left = 608
    Top = 216
  end
  object dstPafSignatories: TADODataSet
    Connection = dmSecurity.acSecurity
    CursorType = ctStatic
    LockType = ltReadOnly
    BeforeOpen = dstPafPrintBeforeOpen
    CommandText = 'rpt_paf_signatories;1'
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
        Name = '@paf_id'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = 0
      end>
    Left = 728
    Top = 216
  end
  object spPafEffectiveUntil: TADOStoredProc
    Connection = dmSecurity.acSecurity
    ProcedureName = 'hris_paf_effective_until;1'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = Null
      end
      item
        Name = '@id_num'
        Attributes = [paNullable]
        DataType = ftString
        Size = 12
        Value = Null
      end>
    Left = 608
    Top = 344
  end
  object dstPafBranchManagers: TADODataSet
    Connection = dmSecurity.acSecurity
    CursorType = ctStatic
    LockType = ltReadOnly
    BeforeOpen = dstPafBranchManagersBeforeOpen
    CommandText = 'rpt_paf_get_bm;1'
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
        Name = '@paf_id'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = 0
      end>
    Left = 728
    Top = 280
  end
  object spUpdateEmployee: TADOStoredProc
    Connection = dmSecurity.acSecurity
    ProcedureName = 'hris_paf_update_employee;1'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
      end
      item
        Name = '@id_num'
        Attributes = [paNullable]
        DataType = ftString
        Size = 12
        Value = ''
      end>
    Left = 728
    Top = 344
  end
end
