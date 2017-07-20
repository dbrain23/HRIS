object dmEmployee: TdmEmployee
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 523
  Width = 820
  object dscEmployees: TDataSource
    DataSet = dstEmployees
    Left = 40
    Top = 24
  end
  object dstEmployees: TADODataSet
    Connection = dmSecurity.acSecurity
    Filtered = True
    AfterClose = dstEmployeesAfterClose
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
    Left = 136
    Top = 24
  end
  object dscEmployee: TDataSource
    DataSet = dstEmployee
    Left = 37
    Top = 96
  end
  object dstEmployee: TADODataSet
    Connection = dmSecurity.acSecurity
    CursorType = ctStatic
    BeforeOpen = dstEmployeeBeforeOpen
    AfterOpen = dstEmployeeAfterOpen
    BeforePost = dstEmployeeBeforePost
    AfterPost = dstEmployeeAfterPost
    CommandText = 'hris_get_employee;1'
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
        Size = 1
        Value = Null
      end>
    Left = 141
    Top = 96
  end
  object dscGender: TDataSource
    DataSet = dstGender
    Left = 445
    Top = 24
  end
  object dstGender: TADODataSet
    Connection = dmSecurity.acSecurity
    CursorType = ctStatic
    LockType = ltReadOnly
    CommandText = 'hris_dd_get_gender;1'
    CommandType = cmdStoredProc
    Parameters = <>
    Left = 541
    Top = 24
  end
  object dscReligions: TDataSource
    DataSet = dstReligions
    Left = 445
    Top = 96
  end
  object dstReligions: TADODataSet
    Connection = dmSecurity.acSecurity
    LockType = ltReadOnly
    CommandText = 'hris_dd_get_religions;1'
    CommandType = cmdStoredProc
    Parameters = <>
    Left = 541
    Top = 96
  end
  object dscCivilStatus: TDataSource
    DataSet = dstCivilStatus
    Left = 445
    Top = 168
  end
  object dstCivilStatus: TADODataSet
    Connection = dmSecurity.acSecurity
    CursorType = ctStatic
    LockType = ltReadOnly
    CommandText = 'hris_dd_get_civil_status;1'
    CommandType = cmdStoredProc
    Parameters = <>
    Left = 541
    Top = 168
  end
  object dscBloodTypes: TDataSource
    DataSet = dstBloodTypes
    Left = 445
    Top = 240
  end
  object dstBloodTypes: TADODataSet
    Connection = dmSecurity.acSecurity
    CursorType = ctStatic
    LockType = ltReadOnly
    CommandText = 'hris_dd_get_blood_types;1'
    CommandType = cmdStoredProc
    Parameters = <>
    Left = 541
    Top = 240
  end
  object dscEmpAddressH: TDataSource
    DataSet = dstEmpAddressH
    Left = 248
    Top = 24
  end
  object dstEmpAddressH: TADODataSet
    Connection = dmSecurity.acSecurity
    CursorType = ctStatic
    BeforeOpen = dstEmpAddressHBeforeOpen
    AfterOpen = dstEmpAddressHAfterOpen
    BeforePost = dstEmpAddressHBeforePost
    AfterPost = dstEmpAddressHAfterPost
    OnNewRecord = dstEmpAddressHNewRecord
    CommandText = 'hris_get_empaddress_h;1'
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
      end>
    Left = 344
    Top = 24
  end
  object dscEmpAddressP: TDataSource
    DataSet = dstEmpAddressP
    Left = 248
    Top = 96
  end
  object dstEmpAddressP: TADODataSet
    Connection = dmSecurity.acSecurity
    CursorType = ctStatic
    BeforeOpen = dstEmpAddressPBeforeOpen
    AfterOpen = dstEmpAddressHAfterOpen
    BeforePost = dstEmpAddressPBeforePost
    AfterPost = dstEmpAddressHAfterPost
    OnNewRecord = dstEmpAddressHNewRecord
    CommandText = 'hris_get_empaddress_p;1'
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
      end>
    Left = 344
    Top = 96
  end
  object dscEmpContactH: TDataSource
    DataSet = dstEmpContactH
    Left = 248
    Top = 168
  end
  object dstEmpContactH: TADODataSet
    Connection = dmSecurity.acSecurity
    CursorType = ctStatic
    BeforeOpen = dstEmpContactHBeforeOpen
    AfterOpen = dstEmpAddressHAfterOpen
    BeforePost = dstEmpContactHBeforePost
    AfterPost = dstEmpAddressHAfterPost
    OnNewRecord = dstEmpAddressHNewRecord
    CommandText = 'hris_get_empcontact_h;1'
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
      end>
    Left = 344
    Top = 168
  end
  object dscEmpContactP: TDataSource
    DataSet = dstEmpContactP
    Left = 248
    Top = 240
  end
  object dstEmpContactP: TADODataSet
    Connection = dmSecurity.acSecurity
    CursorType = ctStatic
    BeforeOpen = dstEmpContactPBeforeOpen
    AfterOpen = dstEmpAddressHAfterOpen
    BeforePost = dstEmpContactPBeforePost
    AfterPost = dstEmpAddressHAfterPost
    OnNewRecord = dstEmpAddressHNewRecord
    CommandText = 'hris_get_empcontact_p;1'
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
      end>
    Left = 344
    Top = 240
  end
  object dscEmpEmergency: TDataSource
    DataSet = dstEmpEmergency
    Left = 248
    Top = 312
  end
  object dstEmpEmergency: TADODataSet
    Connection = dmSecurity.acSecurity
    CursorType = ctStatic
    BeforeOpen = dstEmpEmergencyBeforeOpen
    AfterOpen = dstEmpAddressHAfterOpen
    AfterPost = dstEmpAddressHAfterPost
    OnNewRecord = dstEmpAddressHNewRecord
    CommandText = 'hris_get_empemergency;1'
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
      end>
    Left = 344
    Top = 312
  end
  object dscEmpFamily: TDataSource
    DataSet = dstEmpFamily
    Left = 248
    Top = 384
  end
  object dstEmpFamily: TADODataSet
    Connection = dmSecurity.acSecurity
    CursorType = ctStatic
    LockType = ltBatchOptimistic
    BeforeOpen = dstEmpFamilyBeforeOpen
    BeforePost = dstEmpFamilyBeforePost
    AfterPost = dstEmpAddressHAfterPost
    OnNewRecord = dstEmpAddressHNewRecord
    CommandText = 'hris_get_empfamily;1'
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
      end>
    Left = 344
    Top = 384
  end
  object dscTowns: TDataSource
    DataSet = dstTowns
    Left = 445
    Top = 312
  end
  object dstTowns: TADODataSet
    Connection = dmSecurity.acSecurity
    CursorType = ctStatic
    LockType = ltReadOnly
    CommandText = 'hris_dd_get_town_with_prov;1'
    CommandType = cmdStoredProc
    Parameters = <>
    Left = 541
    Top = 312
  end
  object dscRelations: TDataSource
    DataSet = dstRelations
    Left = 445
    Top = 384
  end
  object dstRelations: TADODataSet
    Connection = dmSecurity.acSecurity
    CursorType = ctStatic
    LockType = ltReadOnly
    CommandText = 'hris_dd_get_relations;1'
    CommandType = cmdStoredProc
    Parameters = <>
    Left = 541
    Top = 384
  end
  object dscOccupations: TDataSource
    DataSet = dstOccupations
    Left = 445
    Top = 456
  end
  object dstOccupations: TADODataSet
    Connection = dmSecurity.acSecurity
    CursorType = ctStatic
    LockType = ltReadOnly
    CommandText = 'hris_dd_get_occupations;1'
    CommandType = cmdStoredProc
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = Null
      end>
    Left = 541
    Top = 456
  end
  object spSyncEmployee: TADOStoredProc
    Connection = dmSecurity.acSecurity
    LockType = ltReadOnly
    ProcedureName = 'sync_employee;1'
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
      end
      item
        Name = '@sync_employee_record'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = '@sync_user_account'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = '@destination_location'
        Attributes = [paNullable]
        DataType = ftString
        Size = 3
        Value = Null
      end>
    Left = 144
    Top = 168
  end
  object dscLocations: TDataSource
    DataSet = dstLocations
    Left = 653
    Top = 24
  end
  object dstLocations: TADODataSet
    Connection = dmSecurity.acSecurity
    LockType = ltReadOnly
    CommandText = 'hris_dd_get_locations;1'
    CommandType = cmdStoredProc
    Parameters = <>
    Left = 749
    Top = 24
  end
end
