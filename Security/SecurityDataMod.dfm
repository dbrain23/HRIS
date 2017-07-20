object dmSecurity: TdmSecurity
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Height = 369
  Width = 572
  object acSecurity: TADOConnection
    ConnectionString = 
      'Provider=SQLOLEDB.1;Integrated Security=SSPI;Persist Security In' +
      'fo=False;User ID=sa;Initial Catalog=HRIS;Data Source=BRYAN\DEVEL' +
      'OPMENT;Use Procedure for Prepare=1;Auto Translate=True;Packet Si' +
      'ze=4096;Workstation ID=BRYAN-ULTRA;Use Encryption for Data=False' +
      ';Tag with column collation when possible=False;'
    LoginPrompt = False
    Provider = 'SQLOLEDB.1'
    BeforeConnect = acSecurityBeforeConnect
    Left = 40
    Top = 24
  end
  object dscUser: TDataSource
    DataSet = dstUser
    Left = 120
    Top = 24
  end
  object dscUserRoles: TDataSource
    DataSet = dstUserRoles
    Left = 120
    Top = 96
  end
  object dstUser: TADODataSet
    Connection = acSecurity
    CursorType = ctStatic
    AfterOpen = dstUserAfterOpen
    BeforePost = dstUserBeforePost
    AfterPost = dstUserAfterPost
    CommandText = 'sec_get_user;1'
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
    Left = 208
    Top = 24
  end
  object dstUserRoles: TADODataSet
    Connection = acSecurity
    CursorType = ctStatic
    CommandText = 'sec_get_user_roles;1'
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
    Left = 208
    Top = 96
  end
  object dscRoles: TDataSource
    DataSet = dstRoles
    Left = 296
    Top = 24
  end
  object dstRoles: TADODataSet
    Connection = acSecurity
    CursorType = ctStatic
    BeforePost = dstRolesBeforePost
    CommandText = 'sec_get_roles;1'
    CommandType = cmdStoredProc
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = 0
      end>
    Left = 392
    Top = 24
  end
  object dscPrivileges: TDataSource
    DataSet = dstPrivileges
    Left = 296
    Top = 96
  end
  object dstPrivileges: TADODataSet
    Connection = acSecurity
    CursorType = ctStatic
    CommandText = 'sec_get_privileges;1'
    CommandType = cmdStoredProc
    Parameters = <>
    Left = 392
    Top = 96
  end
  object dscRolePrivileges: TDataSource
    DataSet = dstRolePrivileges
    Left = 296
    Top = 168
  end
  object dstRolePrivileges: TADODataSet
    Connection = acSecurity
    CursorType = ctStatic
    CommandText = 'sec_get_privileges_by_role;1'
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
        Name = '@role_code'
        Attributes = [paNullable]
        DataType = ftString
        Size = 25
        Value = Null
      end>
    Left = 392
    Top = 168
  end
  object dstLogin: TADODataSet
    Connection = acSecurity
    CursorType = ctStatic
    Parameters = <>
    Left = 472
    Top = 24
  end
  object dscUserRights: TDataSource
    DataSet = dstUserRights
    Left = 120
    Top = 168
  end
  object dstUserRights: TADODataSet
    Connection = acSecurity
    CursorType = ctStatic
    CommandText = 'sec_get_user_rights;1'
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
        Name = '@id_num'
        Attributes = [paNullable]
        DataType = ftString
        Precision = 10
        Size = -1
        Value = Null
      end>
    Left = 208
    Top = 168
  end
  object dscPIN: TDataSource
    DataSet = dstPIN
    Left = 120
    Top = 240
  end
  object dstPIN: TADODataSet
    Connection = acSecurity
    CursorType = ctStatic
    CommandText = 'sec_get_pin;1'
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
        Name = '@id_num'
        Attributes = [paNullable]
        DataType = ftString
        Precision = 10
        Size = -1
        Value = Null
      end>
    Left = 208
    Top = 240
  end
  object csrRoles: TcxStyleRepository
    Left = 32
    Top = 98
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
  object dstLevel: TADODataSet
    Connection = acSecurity
    CursorType = ctStatic
    CommandText = 'hris_get_levels;1'
    CommandType = cmdStoredProc
    Parameters = <>
    Left = 472
    Top = 96
  end
  object dstRoleLevels: TADODataSet
    Connection = acSecurity
    CursorType = ctStatic
    CommandText = 'sec_get_levels_by_role;1'
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
        Name = '@role_code'
        Attributes = [paNullable]
        DataType = ftString
        Size = 16
        Value = '0'
      end>
    Left = 392
    Top = 240
  end
  object dscUsers: TDataSource
    DataSet = dstUsers
    Left = 120
    Top = 304
  end
  object dstUsers: TADODataSet
    Connection = acSecurity
    CursorType = ctStatic
    Filtered = True
    LockType = ltReadOnly
    CommandText = 'sec_get_users;1'
    CommandType = cmdStoredProc
    Parameters = <>
    Left = 208
    Top = 304
  end
end
