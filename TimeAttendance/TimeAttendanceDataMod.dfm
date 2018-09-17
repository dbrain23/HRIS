inherited dmTimeAttendance: TdmTimeAttendance
  OldCreateOrder = True
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Height = 469
  Width = 1079
  inherited acBase: TADOConnection
    Provider = 'SQLNCLI10.1'
  end
  object dscDtr: TDataSource
    DataSet = dstDtr
    Left = 112
    Top = 16
  end
  object dstDtr: TADODataSet
    Connection = dmSecurity.acSecurity
    CursorType = ctStatic
    Filtered = True
    LockType = ltReadOnly
    CommandText = 'dtr_get_by_date;1'
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
        Name = '@dtr_date_from'
        Attributes = [paNullable]
        DataType = ftDateTime
        Value = Null
      end
      item
        Name = '@dtr_date_until'
        Attributes = [paNullable]
        DataType = ftDateTime
        Value = Null
      end
      item
        Name = '@id_num'
        Attributes = [paNullable]
        DataType = ftString
        Size = 12
        Value = Null
      end
      item
        Name = '@location_code'
        Attributes = [paNullable]
        DataType = ftString
        Size = 3
        Value = Null
      end
      item
        Name = '@department_code'
        Attributes = [paNullable]
        DataType = ftString
        Size = 3
        Value = Null
      end
      item
        Name = '@positiontype_code'
        DataType = ftString
        Size = 3
        Value = Null
      end
      item
        Name = '@pending_undertime_only'
        DataType = ftInteger
        Value = 0
      end>
    Left = 192
    Top = 16
  end
  object dscEmployee: TDataSource
    DataSet = dstEmployee
    Left = 109
    Top = 88
  end
  object dstEmployee: TADODataSet
    Connection = dmSecurity.acSecurity
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
    Left = 197
    Top = 88
  end
  object spDTRLogTime: TADOStoredProc
    Connection = acBase
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
    Left = 368
    Top = 16
  end
  object dstExport: TADODataSet
    Connection = acBase
    CursorType = ctStatic
    CommandText = 'dtr_get_by_date_no_joins;1'
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
        Name = '@dtr_date_from'
        Attributes = [paNullable]
        DataType = ftDateTime
        Value = Null
      end
      item
        Name = '@dtr_date_until'
        Attributes = [paNullable]
        DataType = ftDateTime
        Value = Null
      end>
    Left = 288
    Top = 16
  end
  object dscDtrOverrideAM: TDataSource
    DataSet = dstDtrOverrideAM
    Left = 104
    Top = 152
  end
  object dstDtrOverrideAM: TADODataSet
    AutoCalcFields = False
    Connection = dmSecurity.acSecurity
    CursorType = ctStatic
    BeforePost = dstDtrOverrideAMBeforePost
    AfterPost = dstDtrOverrideAMAfterPost
    OnNewRecord = dstDtrOverrideAMNewRecord
    CommandText = 'dtr_get_override_by_date_am;1'
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
        Name = '@dtr_date_from'
        Attributes = [paNullable]
        DataType = ftDateTime
        Value = 0d
      end
      item
        Name = '@dtr_date_until'
        Attributes = [paNullable]
        DataType = ftDateTime
        Value = 0d
      end
      item
        Name = '@id_num'
        Attributes = [paNullable]
        DataType = ftString
        Size = 12
        Value = Null
      end>
    Left = 200
    Top = 152
  end
  object dscDtrOverridePM: TDataSource
    DataSet = dstDtrOverridePM
    Left = 104
    Top = 216
  end
  object dstDtrOverridePM: TADODataSet
    AutoCalcFields = False
    Connection = dmSecurity.acSecurity
    CursorType = ctStatic
    BeforePost = dstDtrOverrideAMBeforePost
    AfterPost = dstDtrOverrideAMAfterPost
    OnNewRecord = dstDtrOverrideAMNewRecord
    CommandText = 'dtr_get_override_by_date_pm;1'
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
        Name = '@dtr_date_from'
        Attributes = [paNullable]
        DataType = ftDateTime
        Value = 0d
      end
      item
        Name = '@dtr_date_until'
        Attributes = [paNullable]
        DataType = ftDateTime
        Value = 0d
      end
      item
        Name = '@id_num'
        Attributes = [paNullable]
        DataType = ftString
        Size = 12
        Value = Null
      end>
    Left = 200
    Top = 216
  end
  object dscOverrideReason: TDataSource
    DataSet = dstOverrideReason
    Left = 480
    Top = 16
  end
  object dstOverrideReason: TADODataSet
    AutoCalcFields = False
    Connection = dmSecurity.acSecurity
    CursorType = ctStatic
    LockType = ltReadOnly
    CommandText = 'hris_dd_get_override_reasons;1'
    CommandType = cmdStoredProc
    Parameters = <>
    Left = 576
    Top = 16
  end
  object dscEmployees: TDataSource
    DataSet = dstEmployees
    Left = 480
    Top = 88
  end
  object dstEmployees: TADODataSet
    AutoCalcFields = False
    Connection = dmSecurity.acSecurity
    CursorType = ctStatic
    LockType = ltReadOnly
    CommandText = 'dtr_get_employees;1'
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
        Name = '@dtr_date_from'
        Attributes = [paNullable]
        DataType = ftDateTime
        Value = Null
      end
      item
        Name = '@dtr_date_until'
        Attributes = [paNullable]
        DataType = ftDateTime
        Value = Null
      end>
    Left = 576
    Top = 88
  end
  object dscDtrOvertime: TDataSource
    DataSet = dstDtrOvertime
    Left = 104
    Top = 280
  end
  object dstDtrOvertime: TADODataSet
    AutoCalcFields = False
    Connection = dmSecurity.acSecurity
    CursorType = ctStatic
    BeforePost = dstDtrOvertimeBeforePost
    OnNewRecord = dstDtrOvertimeNewRecord
    CommandText = 'dtr_get_overtime;1'
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
        Name = '@dtr_date_from'
        Attributes = [paNullable]
        DataType = ftDateTime
        Value = 0d
      end
      item
        Name = '@dtr_date_until'
        Attributes = [paNullable]
        DataType = ftDateTime
        Value = 0d
      end
      item
        Name = '@id_num'
        Attributes = [paNullable]
        DataType = ftString
        Size = 12
        Value = ''
      end>
    Left = 200
    Top = 280
  end
  object dscOvertimeReason: TDataSource
    DataSet = dstOvertimeReason
    Left = 480
    Top = 168
  end
  object dstOvertimeReason: TADODataSet
    AutoCalcFields = False
    Connection = dmSecurity.acSecurity
    CursorType = ctStatic
    LockType = ltReadOnly
    CommandText = 'hris_dd_get_overtime_reasons;1'
    CommandType = cmdStoredProc
    Parameters = <>
    Left = 576
    Top = 168
  end
  object csrLeaveDates: TcxStyleRepository
    Left = 32
    Top = 82
    PixelsPerInch = 96
    object csBackground: TcxStyle
      AssignedValues = [svColor]
      Color = clMenu
    end
    object csContent: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = clMenu
      TextColor = clDefault
    end
    object csNewRow: TcxStyle
      AssignedValues = [svColor]
      Color = clMoneyGreen
    end
  end
  object dscTimeStatus: TDataSource
    DataSet = dstTimeStatus
    Left = 480
    Top = 240
  end
  object dstTimeStatus: TADODataSet
    AutoCalcFields = False
    Connection = dmSecurity.acSecurity
    CursorType = ctStatic
    LockType = ltReadOnly
    CommandText = 'hris_dd_get_time_status;1'
    CommandType = cmdStoredProc
    Parameters = <>
    Left = 576
    Top = 240
  end
  object dstRoster: TADODataSet
    AutoCalcFields = False
    Connection = dmSecurity.acSecurity
    CursorType = ctStatic
    BeforePost = dstRosterBeforePost
    CommandText = 'dtr_get_roster;1'
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
        Name = '@first_day'
        Attributes = [paNullable]
        DataType = ftDateTime
        Value = Null
      end
      item
        Name = '@loc_dep_code'
        Attributes = [paNullable]
        DataType = ftString
        Size = 3
        Value = Null
      end
      item
        Name = '@resource_type_code'
        Attributes = [paNullable]
        DataType = ftString
        Size = 3
        Value = Null
      end>
    Left = 576
    Top = 312
  end
  object dstRosterDetail: TADODataSet
    AutoCalcFields = False
    Connection = dmSecurity.acSecurity
    CursorType = ctStatic
    LockType = ltBatchOptimistic
    AfterOpen = dstRosterDetailAfterOpen
    BeforePost = dstRosterDetailBeforePost
    OnNewRecord = dstRosterDetailNewRecord
    CommandText = 'dtr_get_rosterdetail;1'
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
        Name = '@dtr_date_from'
        Attributes = [paNullable]
        DataType = ftDateTime
        Value = Null
      end
      item
        Name = '@dtr_date_until'
        Attributes = [paNullable]
        DataType = ftDateTime
        Value = Null
      end
      item
        Name = '@loc_dep_code'
        Attributes = [paNullable]
        DataType = ftString
        Size = 3
        Value = ''
      end
      item
        Name = '@resource_type_code'
        Attributes = [paNullable]
        DataType = ftString
        Size = 3
        Value = ''
      end>
    Left = 576
    Top = 368
  end
  object spChangeRosterStatus: TADOStoredProc
    Connection = dmSecurity.acSecurity
    ProcedureName = 'dtr_change_roster_status;1'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = Null
      end
      item
        Name = '@roster_date_from'
        Attributes = [paNullable]
        DataType = ftDateTime
        Value = Null
      end
      item
        Name = '@roster_date_until'
        Attributes = [paNullable]
        DataType = ftDateTime
        Value = Null
      end
      item
        Name = '@loc_dep_code'
        Attributes = [paNullable]
        DataType = ftString
        Size = 3
        Value = Null
      end
      item
        Name = '@resource_type_code'
        Attributes = [paNullable]
        DataType = ftString
        Size = 3
        Value = Null
      end
      item
        Name = '@roster_status_code'
        Attributes = [paNullable]
        DataType = ftString
        Size = 3
        Value = Null
      end
      item
        Name = '@id_num'
        Attributes = [paNullable]
        DataType = ftString
        Size = 12
        Value = Null
      end>
    Left = 360
    Top = 368
  end
  object dscRoster: TDataSource
    DataSet = dstRoster
    Left = 480
    Top = 312
  end
  object dscRosterDetail: TDataSource
    DataSet = dstRosterDetail
    Left = 480
    Top = 368
  end
  object dscDtrUndertimeAM: TDataSource
    DataSet = dstDtrUndertimeAM
    Left = 712
    Top = 16
  end
  object dstDtrUndertimeAM: TADODataSet
    AutoCalcFields = False
    Connection = dmSecurity.acSecurity
    CursorType = ctStatic
    AfterOpen = dstDtrUndertimeAMAfterOpen
    BeforePost = dstDtrUndertimeAMBeforePost
    AfterPost = dstDtrUndertimeAMAfterPost
    OnNewRecord = dstDtrUndertimeAMNewRecord
    CommandText = 'dtr_get_undertime_am;1'
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
        Name = '@dtr_date_from'
        Attributes = [paNullable]
        DataType = ftDateTime
        Value = Null
      end
      item
        Name = '@dtr_date_until'
        Attributes = [paNullable]
        DataType = ftDateTime
        Value = Null
      end
      item
        Name = '@id_num'
        Attributes = [paNullable]
        DataType = ftString
        Size = 12
        Value = Null
      end>
    Left = 808
    Top = 16
  end
  object dscUndertimeReason: TDataSource
    DataSet = dstUndertimeReason
    Left = 912
    Top = 168
  end
  object dstUndertimeReason: TADODataSet
    AutoCalcFields = False
    Connection = dmSecurity.acSecurity
    CursorType = ctStatic
    LockType = ltReadOnly
    CommandText = 'hris_dd_get_undertime_reasons;1'
    CommandType = cmdStoredProc
    Parameters = <>
    Left = 1008
    Top = 168
  end
  object ilTimeStatus: TcxImageList
    FormatVersion = 1
    DesignInfo = 9502746
    ImageInfo = <
      item
        Image.Data = {
          36040000424D3604000000000000360000002800000010000000100000000100
          2000000000000004000000000000000000000000000000000000000000090000
          00160000001A0000001A0000001A0000001A0000001A0000001A0000001A0000
          001A0000001A0000001A0000001A0000001A0000001600000009000000120803
          02367733219FD45A3BE9E96341FFE96341FFE96341FFE96341FFE96341FFE963
          41FFE96341FFE96341FFD45A3BE97733219F0803023600000012000000007E35
          2290E98D76FFF9DAD6FFFCECECFFFCECECFFFCECECFFFCECECFFFCECECFFFCEC
          ECFFFCECECFFFCECECFFF9DAD6FFE98C75FF7E3522900000000000000000BF4E
          2FE8F3D7D3FFF7E8E8FFF7E8E8FFF7E8E8FFF7E8E8FFF7E8E8FFF7E8E8FFF7E8
          E8FFF7E8E8FFF7E8E8FFF7E8E8FFF2D5D1FFBF4E2FE80000000000000000C54F
          2DFFF1E7E7FFEFE4E4FFEFE4E4FFEFE4E4FFEFE4E4FFEFE4E4FFEFE4E4FFEFE4
          E4FFEFE4E4FFEFE4E4FFEFE4E4FFEFE4E4FFC54F2DFF0000000000000000B849
          27FFEBE4E4FFE7DFDFFFE7DFDFFFE7DFDFFFE7DFDFFFE7DFDFFFE7DFDFFFE7DF
          DFFFE7DFDFFFE7DFDFFFE7DFDFFFE7DFDFFFB84927FF0000000000000000AF45
          23FFEDEAEAFFE1DADAFFF1EDEDFFF1EDEDFFF1EDEDFFF1EDEDFFF1EDEDFFF1ED
          EDFFF1EDEDFFF1EDEDFFE0D9D9FFE1DBDBFFAF4523FF0000000000000000AB44
          22FFF3F3F3FFE7E5E5FFEE6644FFEE6644FFEE6644FFEE6644FFEE6644FFEE66
          44FFEE6644FFEE6644FFD8D4D4FFDBD8D8FFAB4422FF0000000000000000AC48
          26FFF4F4F4FFEEEEEEFFAC4826FFAC4826FFAC4826FFAC4826FFAC4826FFAC48
          26FFAC4826FFAC4826FFD2D0D0FFD7D6D6FFAC4826FF0000000000000000B450
          2EFFF6F6F6FFF0F0F0FFF0F0F0FFF0F0F0FFEBEBEBFFE0E0E0FFD7D6D6FFD2D1
          D1FFCECECEFFCECECEFFD2D1D1FFDEDDDDFFB4502EFF0000000000000000BE5B
          39FFF9F9F9FFF3F3F3FFF3F3F3FFF3F3F3FFF3F3F3FFF3F3F3FFF3F3F3FFF3F3
          F3FFF3F3F3FFF3F3F3FFF3F3F3FFF6F6F6FFBE5B39FF0000000000000000CC67
          45FFFBFBFBFFF7F7F7FFF7F7F7FFF7F7F7FFF7F7F7FFF7F7F7FFF7F7F7FFF7F7
          F7FFF7F7F7FFF7F7F7FFF7F7F7FFFAFAFAFFCC6745FF0000000000000000C56A
          4BE8F9ECE8FFFBFBFBFFFBFBFBFFFBFBFBFFFBFBFBFFFBFBFBFFFBFBFBFFFBFB
          FBFFFBFBFBFFFBFBFBFFFBFBFBFFF8EBE7FFC56A4BE800000000000000008148
          3590EEA992FFFCEFEAFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFCEFEAFFEEA992FF8148359000000000000000000E08
          060F864C3990D87B5CE8ED8765FFED8765FFED8765FFED8765FFED8765FFED87
          65FFED8765FFED8765FFD87B5CE8864C39900E08060F00000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000}
      end
      item
        Image.Data = {
          36040000424D3604000000000000360000002800000010000000100000000100
          2000000000000004000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00010000000800000010000000170000001A0000001900000017000000150000
          00110000000D0000000A00000006000000030000000100000000000000000000
          00020000000F0000001F0000002D01140066024C00CC000E0055000000290000
          00220000001A000000130000000C000000060000000100000000000000000000
          0000000000000000000002190048065B00CC149709E8065B01C4010E00290000
          0000000000000000000000000000000000000000000000000000000000000000
          00000000000003250048096800CC28B81AF424CD13FF1BAB0DEF096001BB010E
          001B000000000000000000000000000000000000000000000000000000000000
          0000042600480A6C00CC41C331F629C318FF39CC28FF28C217FF1C9C0EEA095C
          00AE010900100000000000000000000000000000000000000000000000000428
          00480B7100CC5DD44DF933BC22FF4ECA3EF80B7100CC28AA19F32CB81BFF1B91
          0DE40957009E0004000800000000000000000000000000000000000000000C75
          00CC6BE15AFA59D048FF68DE57FC0C7500CC063E006D0F7703CB33AF22F832B2
          21FF1B8B0DDF0850008C0001000200000000000000000000000000000000052A
          00480E7900CC72E861FD0E7900CC052A004800000000052D004C148207D33CB3
          2BFB37AE26FE1B890CDA0849007B000000000000000000000000000000000000
          0000052C00480E7C00CC052C0048000000000000000000000000074000691E90
          10D857CE46FE54CB43FD1C8C0DD6073D00630000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000100010A53
          00852CA01CDE61D850FF5AD14AFA198A0AD20630004C00000000000000000000
          0000000000000000000000000000000000000000000000000000000000000004
          00060C65009E3CB22CE56BE25AFF6EE55EFB108200CC00000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000010A00100E7300B077EE66FF108600CC062F004800000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000315001F118800CC063000480000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000}
      end
      item
        Image.Data = {
          36040000424D3604000000000000360000002800000010000000100000000100
          2000000000000004000000000000000000000000000000000000000000000000
          00020000000C000000160000001A0000001A0000001A0000001A0000001A0000
          001A0000001A0000001A000000170000000C0000000200000000000000000000
          0004000000170000002B000007430000228000003CAB000047C4000047C40000
          3CAB00002280000007430000002D000000180000000400000000000000000000
          0000000000000000194D010157BF07078CE30D0DBCF51111D2FD1111D2FD0D0D
          BCF507078CE3010157BF0000194D000000000000000000000000000000000000
          00000000264D03036DCD1111BDF61212B6FF1111D1FF1111D1FF1111D1FF1111
          D1FF1111B6FF0E0EBBF602026DCD0000264D0000000000000000000000000000
          0E1A020267BF1717BAF61212B2FFDCDCDCFF1111B2FF1111C8FF1111C8FF1111
          B2FFEEEEEEFF1111B2FF0E0EB5F6010167BF00000E1A00000000000000000000
          3A6C131397E21616C1FFD1D1D1FFD6D6D6FFDCDCDCFF1111ADFF1111ADFFEAEA
          EAFFEEEEEEFFEEEEEEFF1111BEFF08088FE300003A6C00000000000000000000
          5CA72C2CB8F51212B4FF1111B4FFD1D1D1FFD6D6D6FFDCDCDCFFE2E2E2FFE6E6
          E6FFEAEAEAFF1111B4FF1111B4FF1111A8F500005CA700000000000000000000
          70C44343CBFD2626B5FF1414ABFF1111AAFFD1D1D1FFD6D6D6FFDCDCDCFFE2E2
          E2FF1111AAFF1111AAFF1111AAFF1818AEFD000070C400000000000000000000
          73C44848CFFD3333BBFF2E2EB8FF13139FFFCECECEFFD1D1D1FFD6D6D6FFDCDC
          DCFF11119EFF1111A1FF1111A1FF1D1DABFD000073C400000000000000000000
          65A74444CBF53737BFFF2323ABFFFFFFFFFFF7F7F7FFE8E8E8FFDEDEDEFFDBDB
          DBFFDDDDDDFF11119BFF1616A0FF2525ADF5000065A700000000000000000000
          436C2D2DB0E34949D1FFFFFFFFFFFFFFFFFFFFFFFFFF4242CAFF4242CAFFFFFF
          FFFFFFFFFFFFFFFFFFFF4747CFFF2525A8E30000436C00000000000000000000
          101A06067EBF5353DAF65151D9FFFFFFFFFF4F4FD7FF4F4FD7FF4F4FD7FF4F4F
          D7FFFFFFFFFF5050D8FF4C4CD4F605057DBF0000101A00000000000000000000
          00000000324D0D0D8ECD5858E0F65F5FE7FF5B5BE3FF5B5BE3FF5B5BE3FF5B5B
          E3FF5F5FE7FF5555DCF60C0C8DCD0000324D0000000000000000000000000000
          0000000000000000334D070782BF3131B9E35858E1F56969F1FD6868F0FD5757
          E0F53030B8E3070782BF0000334D000000000000000000000000000000000000
          000000000000000000000000111A0000486C00006FA6000083C4000083C40000
          6FA60000486C0000111A00000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000}
      end
      item
        Image.Data = {
          36040000424D3604000000000000360000002800000010000000100000000100
          2000000000000004000000000000000000000000000000000000000000000000
          0000000000020000000E000000180000001A0000001A0000001A0000001A0000
          001A0000001A0000001900000010000000030000000000000000000000000000
          0000000000040000001B140906466B2E1F99C25338D4E56241F5E56241F5C253
          38D46B2E1F99140906470000001F000000060000000000000000000000000000
          000000000000431D1360DC6649EBF5A28FFFFAD1CAFFFCE7E5FFFCE6E5FFF9D1
          C9FFF4A18EFFDC6548EB431D1360000000000000000000000000000000000000
          00005A261A60E97357F9F7D4CEFFFAEFEFFFF7E8E8FFF7E8E8FFF7E8E8FFF7E8
          E8FFF9EFEFFFF6D1CAFFE97356F95A261A600000000000000000000000001C0C
          0820D46244EBF3D3CDFFF4ECECFFE5613FFFF4EBEBFFEFE4E4FFEFE4E4FFF4EB
          EBFFE5613FFFF4ECECFFEFCDC7FFD46244EB1C0C08200000000000000000712F
          1D87E59D8AFFEAE2E2FFD65937FFD65937FFD65937FFEEE7E7FFEEE7E7FFD659
          37FFD65937FFD65937FFE8E0E0FFE19784FF712F1D870000000000000000A141
          26D0EAD0C8FFE1DADAFFE0D9D9FFC5502EFFC5502EFFC5502EFFC5502EFFC550
          2EFFC5502EFFE0D9D9FFE0D9D9FFE1C4BDFFA14126D00000000000000000B045
          25F5F4EEEDFFE7E5E5FFDAD6D6FFD8D4D4FFB74826FFB74826FFB74826FFB748
          26FFD8D4D4FFD8D4D4FFD8D4D4FFE1D8D6FFB04525F50000000000000000A641
          21F5F4EFEDFFEEEEEEFFEAEAEAFFE5E3E3FFAD4422FFAD4422FFAD4422FFAD44
          22FFDEDCDCFFD2D0D0FFD2D0D0FFDFD8D7FFA64121F500000000000000008B39
          1DD0EAD5CDFFF0F0F0FFF4F4F4FFAB4624FFAB4624FFAB4624FFAB4624FFAB46
          24FFAB4624FFDBDADAFFD2D1D1FFDCC7C0FF8B391DD000000000000000005F2A
          1887D49D8AFFF5F5F5FFB34F2DFFB34F2DFFB34F2DFFF3F3F3FFF3F3F3FFB34F
          2DFFB34F2DFFB34F2DFFF5F5F5FFD49C89FF5F2A18870000000000000000180C
          0720B65F41EBF2DFD9FFF8F8F8FFC15D3BFFF7F7F7FFF7F7F7FFF7F7F7FFF7F7
          F7FFC15D3BFFF8F8F8FFF2DFD9FFB65F41EB180C072000000000000000000000
          00004E281B60D27C5FF9F6E3DCFFFCFCFCFFFBFBFBFFFBFBFBFFFBFBFBFFFBFB
          FBFFFCFCFCFFF6E3DCFFD27C5FF94E281B600000000000000000000000000000
          000000000000542E2160D17A5CEBEFB7A4FFFAE4DDFFFEF9F7FFFEF9F7FFFAE4
          DDFFEFB7A4FFD17A5CEB542E2160000000000000000000000000000000000000
          000000000000000000001D110C207D473587C16D52D0E38160F5E38160F5C16D
          52D07D4735871D110C2000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000}
      end>
  end
  object dstResourceTypes: TADODataSet
    AutoCalcFields = False
    Connection = dmSecurity.acSecurity
    CursorType = ctStatic
    LockType = ltReadOnly
    BeforeOpen = dstResourceTypesBeforeOpen
    CommandText = 'hris_dd_get_resource_types;1'
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
        Name = '@filter_position'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = 0
      end>
    Left = 808
    Top = 168
  end
  object dscDtrEmployee: TDataSource
    DataSet = dstDtrEmployee
    Left = 104
    Top = 368
  end
  object dstDtrEmployee: TADODataSet
    AutoCalcFields = False
    Connection = dmSecurity.acSecurity
    CursorType = ctStatic
    BeforePost = dstDtrOvertimeBeforePost
    OnNewRecord = dstDtrOvertimeNewRecord
    CommandText = 'dtr_get_by_employee;1'
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
        Value = ''
      end
      item
        Name = '@dtr_date'
        Attributes = [paNullable]
        DataType = ftDateTime
        Value = 0d
      end>
    Left = 200
    Top = 368
  end
  object dstHolidays: TADODataSet
    AutoCalcFields = False
    Connection = dmSecurity.acSecurity
    CursorType = ctStatic
    CommandText = 'dtr_get_holidays;1'
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
        Name = '@dtr_date_from'
        Attributes = [paNullable]
        DataType = ftDateTime
        Value = 0d
      end
      item
        Name = '@dtr_date_until'
        Attributes = [paNullable]
        DataType = ftDateTime
        Value = 0d
      end>
    Left = 808
    Top = 240
  end
  object dstHoliday: TADODataSet
    AutoCalcFields = False
    Connection = dmSecurity.acSecurity
    CursorType = ctStatic
    AfterOpen = dstHolidayAfterOpen
    BeforePost = dstHolidayBeforePost
    AfterPost = dstHolidayAfterPost
    CommandText = 'dtr_get_holiday;1'
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
        Name = '@holiday_id'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = 0
      end>
    Left = 808
    Top = 312
  end
  object dscHoliday: TDataSource
    DataSet = dstHoliday
    Left = 712
    Top = 312
  end
  object dstLocations: TADODataSet
    Connection = dmSecurity.acSecurity
    CursorType = ctStatic
    CommandText = 'hris_dd_get_locations;1'
    CommandType = cmdStoredProc
    Parameters = <>
    Left = 804
    Top = 368
  end
  object dscLocations: TDataSource
    DataSet = dstLocations
    Left = 712
    Top = 368
  end
  object dstMonths: TADODataSet
    Connection = dmSecurity.acSecurity
    CursorType = ctStatic
    LockType = ltReadOnly
    CommandText = 'hris_dd_get_months;1'
    CommandType = cmdStoredProc
    Parameters = <>
    Left = 1004
    Top = 16
  end
  object dscMonths: TDataSource
    DataSet = dstMonths
    Left = 912
    Top = 16
  end
  object dstHolidayLocations: TADODataSet
    AutoCalcFields = False
    Connection = dmSecurity.acSecurity
    CursorType = ctStatic
    CommandText = 'dtr_get_holiday_locations;1'
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
        Name = '@holiday_id'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = 0
      end>
    Left = 712
    Top = 240
  end
  object dstHolidayTypes: TADODataSet
    Connection = dmSecurity.acSecurity
    CursorType = ctStatic
    LockType = ltReadOnly
    CommandText = 'hris_dd_get_holiday_types;1'
    CommandType = cmdStoredProc
    Parameters = <>
    Left = 1004
    Top = 88
  end
  object dscHolidayTypes: TDataSource
    DataSet = dstHolidayTypes
    Left = 912
    Top = 88
  end
  object dscDtrUndertimePM: TDataSource
    DataSet = dstDtrUndertimePM
    Left = 712
    Top = 88
  end
  object dstDtrUndertimePM: TADODataSet
    AutoCalcFields = False
    Connection = dmSecurity.acSecurity
    CursorType = ctStatic
    AfterOpen = dstDtrUndertimeAMAfterOpen
    BeforePost = dstDtrUndertimeAMBeforePost
    AfterPost = dstDtrUndertimeAMAfterPost
    OnNewRecord = dstDtrUndertimeAMNewRecord
    CommandText = 'dtr_get_undertime_pm;1'
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
        Name = '@dtr_date_from'
        Attributes = [paNullable]
        DataType = ftDateTime
        Value = Null
      end
      item
        Name = '@dtr_date_until'
        Attributes = [paNullable]
        DataType = ftDateTime
        Value = Null
      end
      item
        Name = '@id_num'
        Attributes = [paNullable]
        DataType = ftString
        Size = 12
        Value = Null
      end>
    Left = 808
    Top = 88
  end
  object dstDuplicateLogs: TADODataSet
    Connection = dmSecurity.acSecurity
    CursorType = ctStatic
    BeforeOpen = dstDuplicateLogsBeforeOpen
    AfterScroll = dstDuplicateLogsAfterScroll
    CommandText = 'dtr_get_duplicate_dtr;1'
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
        Name = '@dtr_date_from'
        Attributes = [paNullable]
        DataType = ftDateTime
        Value = 0d
      end
      item
        Name = '@dtr_date_until'
        Attributes = [paNullable]
        DataType = ftDateTime
        Value = 0d
      end>
    Left = 380
    Top = 88
  end
  object dscDuplicateLogs: TDataSource
    DataSet = dstDuplicateLogs
    Left = 288
    Top = 88
  end
  object dstDtrByDate: TADODataSet
    Connection = dmSecurity.acSecurity
    CursorType = ctStatic
    AfterPost = dstDtrByDateAfterPost
    CommandText = 'dtr_get_dtr_by_date;1'
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
        Value = ''
      end
      item
        Name = '@dtr_date'
        Attributes = [paNullable]
        DataType = ftDateTime
        Value = 0d
      end>
    Left = 380
    Top = 152
  end
  object dscDtrByDate: TDataSource
    DataSet = dstDtrByDate
    Left = 288
    Top = 152
  end
  object dscUndertimePrint: TDataSource
    DataSet = dstUndertimePrint
    Left = 912
    Top = 240
  end
  object dstUndertimePrint: TADODataSet
    AutoCalcFields = False
    Connection = dmSecurity.acSecurity
    CursorType = ctStatic
    CommandText = 'dtr_get_undertime_am;1'
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
        Name = '@dtr_date_from'
        Attributes = [paNullable]
        DataType = ftDateTime
        Value = 0d
      end
      item
        Name = '@dtr_date_until'
        Attributes = [paNullable]
        DataType = ftDateTime
        Value = 0d
      end
      item
        Name = '@id_num'
        Attributes = [paNullable]
        DataType = ftString
        Size = 12
        Value = ''
      end>
    Left = 1008
    Top = 240
    object dstUndertimePrintdtr_date: TWideStringField
      FieldName = 'dtr_date'
      Size = 10
    end
    object dstUndertimePrintid_num: TStringField
      FieldName = 'id_num'
      Size = 12
    end
    object dstUndertimePrinttime_from: TWideStringField
      FieldName = 'time_from'
      Size = 16
    end
    object dstUndertimePrinttime_until: TWideStringField
      FieldName = 'time_until'
      Size = 16
    end
    object dstUndertimePrintundertime_reason_code: TStringField
      FieldName = 'undertime_reason_code'
      FixedChar = True
      Size = 3
    end
    object dstUndertimePrintcreated_by: TStringField
      FieldName = 'created_by'
      Size = 12
    end
    object dstUndertimePrintcreated_date: TDateTimeField
      FieldName = 'created_date'
      DisplayFormat = 'mm-dd-yyyy'
    end
    object dstUndertimePrintmodified_by: TStringField
      FieldName = 'modified_by'
      Size = 12
    end
    object dstUndertimePrintmodified_date: TDateTimeField
      FieldName = 'modified_date'
      DisplayFormat = 'mm-dd-yyyy'
    end
    object dstUndertimePrintsyncstatus_code: TStringField
      FieldName = 'syncstatus_code'
      FixedChar = True
      Size = 3
    end
    object dstUndertimePrinttimestatus_code: TStringField
      FieldName = 'timestatus_code'
      FixedChar = True
      Size = 3
    end
    object dstUndertimePrintstatus_changed_by: TStringField
      FieldName = 'status_changed_by'
      Size = 12
    end
    object dstUndertimePrintstatus_changed_date: TDateTimeField
      FieldName = 'status_changed_date'
    end
    object dstUndertimePrintam_pm: TStringField
      FieldName = 'am_pm'
      FixedChar = True
      Size = 1
    end
    object dstUndertimePrintis_paid: TSmallintField
      FieldName = 'is_paid'
    end
    object dstUndertimePrintemployee_lastname: TStringField
      FieldName = 'employee_lastname'
      Size = 50
    end
    object dstUndertimePrintemployee_firstname: TStringField
      FieldName = 'employee_firstname'
      Size = 50
    end
    object dstUndertimePrintemployee_name: TStringField
      FieldName = 'employee_name'
      ReadOnly = True
      Size = 101
    end
    object dstUndertimePrintpositiontype_name: TStringField
      FieldName = 'positiontype_name'
      Size = 25
    end
    object dstUndertimePrintundertime_reason_name: TStringField
      FieldName = 'undertime_reason_name'
      Size = 25
    end
    object dstUndertimePrintlocation_name: TStringField
      FieldName = 'location_name'
      Size = 50
    end
    object dstUndertimePrintdtr_date_f: TDateTimeField
      FieldName = 'dtr_date_f'
      ReadOnly = True
      DisplayFormat = 'mm-dd-yyyy'
    end
    object dstUndertimePrinttime_from_f: TDateTimeField
      FieldName = 'time_from_f'
      ReadOnly = True
      DisplayFormat = 'hh:mm am/pm'
    end
    object dstUndertimePrinttime_until_f: TDateTimeField
      FieldName = 'time_until_f'
      ReadOnly = True
      DisplayFormat = 'hh:mm am/pm'
    end
    object dstUndertimePrintapproved_by: TStringField
      FieldName = 'approved_by'
      ReadOnly = True
      Size = 101
    end
  end
end
