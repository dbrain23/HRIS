object dmActivity: TdmActivity
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 280
  Width = 583
  object acActivity: TADOConnection
    ConnectionString = 
      'Provider=SQLOLEDB.1;Password=gigabyte23;Persist Security Info=Tr' +
      'ue;User ID=sa;Initial Catalog=HRIS;Data Source=BRYAN-ULTRA\MYINS' +
      'TANCE'
    LoginPrompt = False
    Provider = 'SQLOLEDB.1'
    BeforeConnect = acActivityBeforeConnect
    Left = 40
    Top = 24
  end
  object dscActivitiesMonth: TDataSource
    DataSet = dstActivitiesMonth
    Left = 128
    Top = 24
  end
  object dstActivitiesMonth: TADODataSet
    Connection = acActivity
    CursorType = ctStatic
    BeforePost = dstActivitiesMonthBeforePost
    AfterScroll = dstActivitiesMonthAfterScroll
    CommandText = 'hris_get_activities;1'
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
        Name = '@start_date'
        Attributes = [paNullable]
        DataType = ftDateTime
        Size = 10
        Value = Null
      end
      item
        Name = '@end_date'
        Attributes = [paNullable]
        DataType = ftDateTime
        Size = 10
        Value = Null
      end>
    Left = 232
    Top = 24
  end
  object dscParticipants: TDataSource
    DataSet = dstParticipants
    Left = 128
    Top = 96
  end
  object dstParticipants: TADODataSet
    Connection = acActivity
    CursorType = ctStatic
    BeforeOpen = dstParticipantsBeforeOpen
    OnNewRecord = dstParticipantsNewRecord
    CommandText = 'hris_get_activity_employees;1'
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
        Name = '@activity_id'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = 0
      end>
    Left = 232
    Top = 96
  end
  object dscActivityType: TDataSource
    DataSet = dstActivityType
    Left = 328
    Top = 24
  end
  object dstActivityType: TADODataSet
    Connection = acActivity
    CursorType = ctStatic
    CommandText = 'hris_dd_get_activity_types;1'
    CommandType = cmdStoredProc
    Parameters = <>
    Left = 424
    Top = 24
  end
  object dscActivityStatus: TDataSource
    DataSet = dstActivityStatus
    Left = 328
    Top = 88
  end
  object dstActivityStatus: TADODataSet
    Connection = acActivity
    CursorType = ctStatic
    CommandText = 'hris_get_activity_status;1'
    CommandType = cmdStoredProc
    Parameters = <>
    Left = 424
    Top = 88
  end
  object dscEmployees: TDataSource
    DataSet = dstEmployees
    Left = 328
    Top = 160
  end
  object dstEmployees: TADODataSet
    Connection = acActivity
    CursorType = ctStatic
    CommandText = 'hris_dd_get_employees;1'
    CommandType = cmdStoredProc
    Parameters = <>
    Left = 424
    Top = 160
  end
end
