object dmTools: TdmTools
  OldCreateOrder = True
  Height = 366
  Width = 437
  object dscSysConfig: TDataSource
    DataSet = dstSysConfig
    Left = 112
    Top = 16
  end
  object dstSysConfig: TADODataSet
    Connection = dmSecurity.acSecurity
    CursorType = ctStatic
    BeforePost = dstSysConfigBeforePost
    CommandText = 'sys_get_sysconfig;1'
    CommandType = cmdStoredProc
    Parameters = <>
    Left = 192
    Top = 16
  end
  object dstEmployees: TADODataSet
    Connection = dmSecurity.acSecurity
    Filtered = True
    CommandText = 'hris_get_employees;1'
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
        Name = '@lastname'
        Attributes = [paNullable]
        DataType = ftString
        Size = 50
        Value = ''
      end
      item
        Name = '@firstname'
        Attributes = [paNullable]
        DataType = ftString
        Size = 50
        Value = ''
      end
      item
        Name = '@option'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = 1
      end>
    Left = 104
    Top = 80
  end
end
