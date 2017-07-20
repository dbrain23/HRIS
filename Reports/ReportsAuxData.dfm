object dmReportsAux: TdmReportsAux
  OldCreateOrder = True
  Height = 176
  Width = 392
  object dscLocations: TDataSource
    DataSet = dstLocations
    Left = 128
    Top = 16
  end
  object dstLocations: TADODataSet
    Connection = dmSecurity.acSecurity
    CursorType = ctStatic
    CommandText = 'hris_dd_get_locations;1'
    CommandType = cmdStoredProc
    Parameters = <>
    Left = 212
    Top = 16
  end
  object prdReport: TdxPrintDialog
    Left = 32
    Top = 16
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
    Left = 208
    Top = 86
  end
end
