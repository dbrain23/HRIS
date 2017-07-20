object dmMaintenance: TdmMaintenance
  OldCreateOrder = False
  Height = 683
  Width = 902
  object dscOccupation: TDataSource
    DataSet = dstOccupation
    Left = 40
    Top = 24
  end
  object dstOccupation: TADODataSet
    Connection = dmSecurity.acSecurity
    CursorType = ctStatic
    BeforePost = dstOccupationBeforePost
    CommandText = 'hris_get_occupations;1'
    CommandType = cmdStoredProc
    Parameters = <>
    Left = 136
    Top = 24
  end
  object dscReligion: TDataSource
    DataSet = dstReligion
    Left = 40
    Top = 88
  end
  object dstReligion: TADODataSet
    Connection = dmSecurity.acSecurity
    CursorType = ctStatic
    BeforePost = dstReligionBeforePost
    CommandText = 'hris_get_religions;1'
    CommandType = cmdStoredProc
    Parameters = <>
    Left = 136
    Top = 88
  end
  object dscLocation: TDataSource
    DataSet = dstLocation
    Left = 40
    Top = 152
  end
  object dstLocation: TADODataSet
    Connection = dmSecurity.acSecurity
    CursorType = ctStatic
    BeforePost = dstLocationBeforePost
    CommandText = 'hris_get_locations;1'
    CommandType = cmdStoredProc
    Parameters = <>
    Left = 136
    Top = 152
  end
  object dscRelation: TDataSource
    DataSet = dstRelation
    Left = 40
    Top = 216
  end
  object dstRelation: TADODataSet
    Connection = dmSecurity.acSecurity
    CursorType = ctStatic
    BeforePost = dstRelationBeforePost
    CommandText = 'hris_get_relations;1'
    CommandType = cmdStoredProc
    Parameters = <>
    Left = 136
    Top = 216
  end
  object dscProvince: TDataSource
    DataSet = dstProvince
    Left = 40
    Top = 280
  end
  object dstProvince: TADODataSet
    Connection = dmSecurity.acSecurity
    CursorType = ctStatic
    BeforePost = dstProvinceBeforePost
    CommandText = 'hris_get_provinces;1'
    CommandType = cmdStoredProc
    Parameters = <>
    Left = 136
    Top = 280
  end
  object dscTown: TDataSource
    DataSet = dstTown
    Left = 40
    Top = 344
  end
  object dstTown: TADODataSet
    Connection = dmSecurity.acSecurity
    CursorType = ctStatic
    BeforePost = dstTownBeforePost
    CommandText = 'hris_get_towns;1'
    CommandType = cmdStoredProc
    Parameters = <>
    Left = 136
    Top = 344
  end
  object dscLevel: TDataSource
    DataSet = dstLevel
    Left = 40
    Top = 416
  end
  object dstLevel: TADODataSet
    Connection = dmSecurity.acSecurity
    CursorType = ctStatic
    BeforePost = dstLevelBeforePost
    CommandText = 'hris_get_levels;1'
    CommandType = cmdStoredProc
    Parameters = <>
    Left = 136
    Top = 416
  end
  object dscPosition: TDataSource
    DataSet = dstPosition
    Left = 232
    Top = 24
  end
  object dstPosition: TADODataSet
    Connection = dmSecurity.acSecurity
    CursorType = ctStatic
    BeforePost = dstPositionBeforePost
    CommandText = 'hris_get_positions;1'
    CommandType = cmdStoredProc
    Parameters = <>
    Left = 328
    Top = 24
  end
  object dscEmpStatus: TDataSource
    DataSet = dstEmpStatus
    Left = 232
    Top = 88
  end
  object dstEmpStatus: TADODataSet
    Connection = dmSecurity.acSecurity
    CursorType = ctStatic
    BeforePost = dstEmpStatusBeforePost
    CommandText = 'hris_get_emp_status;1'
    CommandType = cmdStoredProc
    Parameters = <>
    Left = 328
    Top = 88
  end
  object dscPositionStatus: TDataSource
    DataSet = dstPositionStatus
    Left = 232
    Top = 152
  end
  object dstPositionStatus: TADODataSet
    Connection = dmSecurity.acSecurity
    CursorType = ctStatic
    BeforePost = dstPositionStatusBeforePost
    CommandText = 'hris_get_position_status;1'
    CommandType = cmdStoredProc
    Parameters = <>
    Left = 328
    Top = 152
  end
  object dscAllowanceTypes: TDataSource
    DataSet = dstAllowanceTypes
    Left = 232
    Top = 216
  end
  object dstAllowanceTypes: TADODataSet
    Connection = dmSecurity.acSecurity
    CursorType = ctStatic
    BeforePost = dstAllowanceTypesBeforePost
    CommandText = 'hris_get_allowance_types;1'
    CommandType = cmdStoredProc
    Parameters = <>
    Left = 328
    Top = 216
  end
  object dscActivityType: TDataSource
    DataSet = dstActivityType
    Left = 232
    Top = 280
  end
  object dstActivityType: TADODataSet
    Connection = dmSecurity.acSecurity
    CursorType = ctStatic
    BeforePost = dstActivityTypeBeforePost
    CommandText = 'hris_get_activity_types;1'
    CommandType = cmdStoredProc
    Parameters = <>
    Left = 328
    Top = 280
  end
  object dscActivityStatus: TDataSource
    DataSet = dstActivityStatus
    Left = 232
    Top = 352
  end
  object dstActivityStatus: TADODataSet
    Connection = dmSecurity.acSecurity
    CursorType = ctStatic
    BeforePost = dstActivityStatusBeforePost
    CommandText = 'hris_get_activity_status;1'
    CommandType = cmdStoredProc
    Parameters = <>
    Left = 336
    Top = 352
  end
  object dscSalaryFrequency: TDataSource
    DataSet = dstSalaryFrequency
    Left = 232
    Top = 416
  end
  object dstSalaryFrequency: TADODataSet
    Connection = dmSecurity.acSecurity
    CursorType = ctStatic
    BeforePost = dstSalaryFrequencyBeforePost
    CommandText = 'hris_get_salaryfrequencies;1'
    CommandType = cmdStoredProc
    Parameters = <>
    Left = 336
    Top = 416
  end
  object dscLeaveTypes: TDataSource
    DataSet = dstLeaveTypes
    Left = 432
    Top = 24
  end
  object dstLeaveTypes: TADODataSet
    Connection = dmSecurity.acSecurity
    CursorType = ctStatic
    BeforePost = dstLeaveTypesBeforePost
    CommandText = 'hris_get_leave_types;1'
    CommandType = cmdStoredProc
    Parameters = <>
    Left = 536
    Top = 24
  end
  object dscLeaveAppStatus: TDataSource
    DataSet = dstLeaveAppStatus
    Left = 432
    Top = 88
  end
  object dstLeaveAppStatus: TADODataSet
    Connection = dmSecurity.acSecurity
    CursorType = ctStatic
    BeforePost = dstLeaveAppStatusBeforePost
    CommandText = 'hris_get_leaveapplication_status;1'
    CommandType = cmdStoredProc
    Parameters = <>
    Left = 536
    Top = 88
  end
  object dscLocationType: TDataSource
    DataSet = dstLocationType
    Left = 432
    Top = 152
  end
  object dstLocationType: TADODataSet
    Connection = dmSecurity.acSecurity
    CursorType = ctStatic
    CommandText = 'hris_dd_get_location_types;1'
    CommandType = cmdStoredProc
    Parameters = <>
    Left = 536
    Top = 152
  end
  object dscDepartment: TDataSource
    DataSet = dstDepartment
    Left = 432
    Top = 216
  end
  object dstDepartment: TADODataSet
    Connection = dmSecurity.acSecurity
    CursorType = ctStatic
    BeforePost = dstDepartmentBeforePost
    CommandText = 'hris_get_departments;1'
    CommandType = cmdStoredProc
    Parameters = <>
    Left = 536
    Top = 216
  end
  object dscLocDepartment: TDataSource
    DataSet = dstLocDepartment
    Left = 432
    Top = 280
  end
  object dstLocDepartment: TADODataSet
    Connection = dmSecurity.acSecurity
    CursorType = ctStatic
    CommandText = 'hris_get_departments_by_location;1'
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
        Name = '@location_code'
        Attributes = [paNullable]
        DataType = ftString
        Size = 3
        Value = Null
      end>
    Left = 536
    Top = 280
  end
  object dscLocAllowanceType: TDataSource
    DataSet = dstLocAllowanceType
    Left = 432
    Top = 352
  end
  object dstLocAllowanceType: TADODataSet
    Connection = dmSecurity.acSecurity
    CursorType = ctStatic
    LockType = ltBatchOptimistic
    BeforePost = dstLocAllowanceTypeBeforePost
    OnNewRecord = dstLocAllowanceTypeNewRecord
    CommandText = 'hris_get_allowance_types_by_location;1'
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
        Name = '@location_code'
        Attributes = [paNullable]
        DataType = ftString
        Size = 3
        Value = Null
      end>
    Left = 536
    Top = 352
  end
  object dscOverrideReason: TDataSource
    DataSet = dstOverrideReason
    Left = 432
    Top = 416
  end
  object dstOverrideReason: TADODataSet
    Connection = dmSecurity.acSecurity
    CursorType = ctStatic
    BeforePost = dstOverrideReasonBeforePost
    CommandText = 'hris_get_overridereasons;1'
    CommandType = cmdStoredProc
    Parameters = <>
    Left = 536
    Top = 416
  end
  object dscLeaveReasons: TDataSource
    DataSet = dstLeaveReasons
    Left = 648
    Top = 24
  end
  object dstLeaveReasons: TADODataSet
    Connection = dmSecurity.acSecurity
    CursorType = ctStatic
    BeforePost = dstLeaveReasonsBeforePost
    CommandText = 'hris_get_leave_reasons;1'
    CommandType = cmdStoredProc
    Parameters = <>
    Left = 752
    Top = 24
  end
  object dscOvertimeReasons: TDataSource
    DataSet = dstOvertimeReasons
    Left = 648
    Top = 88
  end
  object dstOvertimeReasons: TADODataSet
    Connection = dmSecurity.acSecurity
    CursorType = ctStatic
    BeforePost = dstOvertimeReasonsBeforePost
    CommandText = 'hris_get_overtime_reasons;1'
    CommandType = cmdStoredProc
    Parameters = <>
    Left = 752
    Top = 88
  end
  object dscUndertimeReasons: TDataSource
    DataSet = dstUndertimeReasons
    Left = 648
    Top = 152
  end
  object dstUndertimeReasons: TADODataSet
    Connection = dmSecurity.acSecurity
    CursorType = ctStatic
    BeforePost = dstUndertimeReasonsBeforePost
    CommandText = 'hris_get_undertime_reasons;1'
    CommandType = cmdStoredProc
    Parameters = <>
    Left = 752
    Top = 152
  end
  object dscDeductionTypes: TDataSource
    DataSet = dstDeductionTypes
    Left = 648
    Top = 216
  end
  object dstDeductionTypes: TADODataSet
    Connection = dmSecurity.acSecurity
    CursorType = ctStatic
    BeforePost = dstDeductionTypesBeforePost
    CommandText = 'pr_get_deduction_types;1'
    CommandType = cmdStoredProc
    Parameters = <>
    Left = 752
    Top = 216
  end
  object dscHolidayTypes: TDataSource
    DataSet = dstHolidayTypes
    Left = 648
    Top = 280
  end
  object dstHolidayTypes: TADODataSet
    Connection = dmSecurity.acSecurity
    CursorType = ctStatic
    BeforePost = dstHolidayTypesBeforePost
    CommandText = 'hris_get_holiday_types;1'
    CommandType = cmdStoredProc
    Parameters = <>
    Left = 752
    Top = 280
  end
  object dscAdjustmentTypes: TDataSource
    DataSet = dstAdjustmentTypes
    Left = 648
    Top = 352
  end
  object dstAdjustmentTypes: TADODataSet
    Connection = dmSecurity.acSecurity
    CursorType = ctStatic
    BeforePost = dstAdjustmentTypesBeforePost
    CommandText = 'hris_get_adjustment_types;1'
    CommandType = cmdStoredProc
    Parameters = <>
    Left = 752
    Top = 352
  end
  object dscAreas: TDataSource
    DataSet = dstAreas
    Left = 648
    Top = 416
  end
  object dstAreas: TADODataSet
    Connection = dmSecurity.acSecurity
    CursorType = ctStatic
    BeforePost = dstAreasBeforePost
    CommandText = 'hris_get_areas;1'
    CommandType = cmdStoredProc
    Parameters = <>
    Left = 752
    Top = 416
  end
  object dscAccountType: TDataSource
    DataSet = dstAccountType
    Left = 32
    Top = 488
  end
  object dstAccountType: TADODataSet
    Connection = dmSecurity.acSecurity
    CursorType = ctStatic
    BeforePost = dstAccountTypeBeforePost
    CommandText = 'hris_get_account_types;1'
    CommandType = cmdStoredProc
    Parameters = <>
    Left = 136
    Top = 488
  end
  object dscPositionTypes: TDataSource
    DataSet = dstPositionTypes
    Left = 32
    Top = 568
  end
  object dstPositionTypes: TADODataSet
    Connection = dmSecurity.acSecurity
    CursorType = ctStatic
    BeforePost = dstAccountTypeBeforePost
    CommandText = 'hris_dd_get_position_types;1'
    CommandType = cmdStoredProc
    Parameters = <>
    Left = 136
    Top = 568
  end
end
