object LogBoxDataMain: TLogBoxDataMain
  OldCreateOrder = False
  Height = 340
  Width = 513
  object acMain: TADOConnection
    LoginPrompt = False
    Provider = 'SQLNCLI10.1'
    Left = 48
    Top = 24
  end
  object dstEmployee: TADODataSet
    Connection = acMain
    CursorType = ctStatic
    CommandText = 'dtr_get_employee;1'
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
        Size = 12
        Value = Null
      end
      item
        Name = '@pin'
        Attributes = [paNullable]
        DataType = ftString
        Precision = 4
        Size = -1
        Value = Null
      end>
    Left = 109
    Top = 24
  end
  object spDTRLogTime: TADOStoredProc
    Connection = acMain
    ProcedureName = 'dtr_log_time;1'
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
        Precision = 10
        Size = -1
        Value = Null
      end
      item
        Name = '@dtr_snapshot'
        Attributes = [paNullable]
        DataType = ftString
        Size = 250
        Value = Null
      end>
    Left = 176
    Top = 24
  end
end
