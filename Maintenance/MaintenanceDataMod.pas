unit MaintenanceDataMod;

interface

uses
  System.SysUtils, System.Classes, Data.DB, Data.Win.ADODB, SysConn, Dialogs;

type
  TdmMaintenance = class(TDataModule)
    dscOccupation: TDataSource;
    dstOccupation: TADODataSet;
    dscReligion: TDataSource;
    dstReligion: TADODataSet;
    dscLocation: TDataSource;
    dstLocation: TADODataSet;
    dscRelation: TDataSource;
    dstRelation: TADODataSet;
    dscProvince: TDataSource;
    dstProvince: TADODataSet;
    dscTown: TDataSource;
    dstTown: TADODataSet;
    dscLevel: TDataSource;
    dstLevel: TADODataSet;
    dscPosition: TDataSource;
    dstPosition: TADODataSet;
    dscEmpStatus: TDataSource;
    dstEmpStatus: TADODataSet;
    dscPositionStatus: TDataSource;
    dstPositionStatus: TADODataSet;
    dscAllowanceTypes: TDataSource;
    dstAllowanceTypes: TADODataSet;
    dscActivityType: TDataSource;
    dstActivityType: TADODataSet;
    dscActivityStatus: TDataSource;
    dstActivityStatus: TADODataSet;
    dscSalaryFrequency: TDataSource;
    dstSalaryFrequency: TADODataSet;
    dscLeaveTypes: TDataSource;
    dstLeaveTypes: TADODataSet;
    dscLeaveAppStatus: TDataSource;
    dstLeaveAppStatus: TADODataSet;
    dscLocationType: TDataSource;
    dstLocationType: TADODataSet;
    dscDepartment: TDataSource;
    dstDepartment: TADODataSet;
    dscLocDepartment: TDataSource;
    dstLocDepartment: TADODataSet;
    dscLocAllowanceType: TDataSource;
    dstLocAllowanceType: TADODataSet;
    dscOverrideReason: TDataSource;
    dstOverrideReason: TADODataSet;
    dscLeaveReasons: TDataSource;
    dstLeaveReasons: TADODataSet;
    dscOvertimeReasons: TDataSource;
    dstOvertimeReasons: TADODataSet;
    dscUndertimeReasons: TDataSource;
    dstUndertimeReasons: TADODataSet;
    dscDeductionTypes: TDataSource;
    dstDeductionTypes: TADODataSet;
    dscHolidayTypes: TDataSource;
    dstHolidayTypes: TADODataSet;
    dscAdjustmentTypes: TDataSource;
    dstAdjustmentTypes: TADODataSet;
    dscAreas: TDataSource;
    dstAreas: TADODataSet;
    dscAccountType: TDataSource;
    dstAccountType: TADODataSet;
    dscPositionTypes: TDataSource;
    dstPositionTypes: TADODataSet;
    procedure dstOccupationBeforePost(DataSet: TDataSet);
    procedure dstLocationBeforePost(DataSet: TDataSet);
    procedure dstLevelBeforePost(DataSet: TDataSet);
    procedure dstPositionBeforePost(DataSet: TDataSet);
    procedure dstProvinceBeforePost(DataSet: TDataSet);
    procedure dstRelationBeforePost(DataSet: TDataSet);
    procedure dstReligionBeforePost(DataSet: TDataSet);
    procedure dstTownBeforePost(DataSet: TDataSet);
    procedure dstEmpStatusBeforePost(DataSet: TDataSet);
    procedure dstPositionStatusBeforePost(DataSet: TDataSet);
    procedure dstAllowanceTypesBeforePost(DataSet: TDataSet);
    procedure dstActivityTypeBeforePost(DataSet: TDataSet);
    procedure dstActivityStatusBeforePost(DataSet: TDataSet);
    procedure dstSalaryFrequencyBeforePost(DataSet: TDataSet);
    procedure dstLeaveTypesBeforePost(DataSet: TDataSet);
    procedure dstLeaveAppStatusBeforePost(DataSet: TDataSet);
    procedure dstDepartmentBeforePost(DataSet: TDataSet);
    procedure dstLocAllowanceTypeNewRecord(DataSet: TDataSet);
    procedure dstLocAllowanceTypeBeforePost(DataSet: TDataSet);
    procedure dstOverrideReasonBeforePost(DataSet: TDataSet);
    procedure dstLeaveReasonsBeforePost(DataSet: TDataSet);
    procedure dstOvertimeReasonsBeforePost(DataSet: TDataSet);
    procedure dstUndertimeReasonsBeforePost(DataSet: TDataSet);
    procedure dstDeductionTypesBeforePost(DataSet: TDataSet);
    procedure dstHolidayTypesBeforePost(DataSet: TDataSet);
    procedure dstAdjustmentTypesBeforePost(DataSet: TDataSet);
    procedure dstAreasBeforePost(DataSet: TDataSet);
    procedure dstAccountTypeBeforePost(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmMaintenance: TdmMaintenance;

implementation

{%CLASSGROUP 'System.Classes.TPersistent'}

{$R *.dfm}

uses SecurityDataMod;

procedure TdmMaintenance.dstAccountTypeBeforePost(DataSet: TDataSet);
begin
  if Trim(DataSet.FieldByName('accounttype_code').AsString) = '' then
  begin
    MessageDlg('Please enter code.',mtError,[mbOK],0);
    Abort;
  end
  else if Trim(DataSet.FieldByName('accounttype_name').AsString) = '' then
  begin
    MessageDlg('Please enter name.',mtError,[mbOK],0);
    Abort;
  end;
end;

procedure TdmMaintenance.dstActivityStatusBeforePost(DataSet: TDataSet);
begin
  if Trim(DataSet.FieldByName('activitystatus_code').AsString) = '' then
  begin
    MessageDlg('Please enter code.',mtError,[mbOK],0);
    Abort;
  end
  else if Trim(DataSet.FieldByName('activitystatus_name').AsString) = '' then
  begin
    MessageDlg('Please enter name.',mtError,[mbOK],0);
    Abort;
  end;
end;

procedure TdmMaintenance.dstActivityTypeBeforePost(DataSet: TDataSet);
begin
  if Trim(DataSet.FieldByName('activitytype_code').AsString) = '' then
  begin
    MessageDlg('Please enter code.',mtError,[mbOK],0);
    Abort;
  end
  else if Trim(DataSet.FieldByName('activitytype_name').AsString) = '' then
  begin
    MessageDlg('Please enter name.',mtError,[mbOK],0);
    Abort;
  end;
end;

procedure TdmMaintenance.dstAdjustmentTypesBeforePost(DataSet: TDataSet);
begin
  if Trim(DataSet.FieldByName('adjustmenttype_code').AsString) = '' then
  begin
    MessageDlg('Please enter code.',mtError,[mbOK],0);
    Abort;
  end
  else if Trim(DataSet.FieldByName('adjustmenttype_name').AsString) = '' then
  begin
    MessageDlg('Please enter name.',mtError,[mbOK],0);
    Abort;
  end
end;

procedure TdmMaintenance.dstAllowanceTypesBeforePost(DataSet: TDataSet);
begin
  if Trim(DataSet.FieldByName('allowancetype_code').AsString) = '' then
  begin
    MessageDlg('Please enter code.',mtError,[mbOK],0);
    Abort;
  end
  else if Trim(DataSet.FieldByName('allowancetype_name').AsString) = '' then
  begin
    MessageDlg('Please enter name.',mtError,[mbOK],0);
    Abort;
  end;
end;

procedure TdmMaintenance.dstAreasBeforePost(DataSet: TDataSet);
begin
  if Trim(DataSet.FieldByName('area_code').AsString) = '' then
  begin
    MessageDlg('Please enter code.',mtError,[mbOK],0);
    Abort;
  end
  else if Trim(DataSet.FieldByName('area_name').AsString) = '' then
  begin
    MessageDlg('Please enter name.',mtError,[mbOK],0);
    Abort;
  end
end;

procedure TdmMaintenance.dstDeductionTypesBeforePost(DataSet: TDataSet);
begin
  if Trim(DataSet.FieldByName('deductiontype_code').AsString) = '' then
  begin
    MessageDlg('Please enter code.',mtError,[mbOK],0);
    Abort;
  end
  else if Trim(DataSet.FieldByName('deductiontype_name').AsString) = '' then
  begin
    MessageDlg('Please enter name.',mtError,[mbOK],0);
    Abort;
  end;
end;

procedure TdmMaintenance.dstDepartmentBeforePost(DataSet: TDataSet);
begin
if Trim(DataSet.FieldByName('department_code').AsString) = '' then
  begin
    MessageDlg('Please enter code.',mtError,[mbOK],0);
    Abort;
  end
  else if Trim(DataSet.FieldByName('department_name').AsString) = '' then
  begin
    MessageDlg('Please enter name.',mtError,[mbOK],0);
    Abort;
  end;
end;

procedure TdmMaintenance.dstLocAllowanceTypeBeforePost(DataSet: TDataSet);
begin
  if Trim(DataSet.FieldByName('allowancetype_code').AsString) = '' then
  begin
    MessageDlg('Please enter allowance type code.',mtError,[mbOK],0);
    Abort;
  end
end;

procedure TdmMaintenance.dstLocAllowanceTypeNewRecord(DataSet: TDataSet);
begin
  DataSet.FieldByName('location_code').AsString :=
    (DataSet as TADODataSet).Parameters.ParamByName('@location_code').Value;
end;

procedure TdmMaintenance.dstLocationBeforePost(DataSet: TDataSet);
begin
  if Trim(DataSet.FieldByName('location_code').AsString) = '' then
  begin
    MessageDlg('Please enter code.',mtError,[mbOK],0);
    Abort;
  end
  else if Trim(DataSet.FieldByName('location_name').AsString) = '' then
  begin
    MessageDlg('Please enter name.',mtError,[mbOK],0);
    Abort;
  end
  else if Trim(DataSet.FieldByName('locationtype_code').AsString) = '' then
  begin
    MessageDlg('Please select type.',mtError,[mbOK],0);
    Abort;
  end;
end;

procedure TdmMaintenance.dstEmpStatusBeforePost(DataSet: TDataSet);
begin
  if Trim(DataSet.FieldByName('empstatus_code').AsString) = '' then
  begin
    MessageDlg('Please enter code.',mtError,[mbOK],0);
    Abort;
  end
  else if Trim(DataSet.FieldByName('empstatus_name').AsString) = '' then
  begin
    MessageDlg('Please enter name.',mtError,[mbOK],0);
    Abort;
  end;
end;

procedure TdmMaintenance.dstHolidayTypesBeforePost(DataSet: TDataSet);
begin
  if Trim(DataSet.FieldByName('holidaytype_code').AsString) = '' then
  begin
    MessageDlg('Please enter code.',mtError,[mbOK],0);
    Abort;
  end
  else if Trim(DataSet.FieldByName('holidaytype_name').AsString) = '' then
  begin
    MessageDlg('Please enter name.',mtError,[mbOK],0);
    Abort;
  end
  else if (DataSet.FieldByName('holiday_rate').AsFloat <= 0.00) or
    (DataSet.FieldByName('holiday_rate').AsFloat > 100.00)then
  begin
    MessageDlg('Please enter a valid holiday rate.',mtError,[mbOK],0);
    Abort;
  end;
end;

procedure TdmMaintenance.dstLeaveAppStatusBeforePost(DataSet: TDataSet);
begin
  if Trim(DataSet.FieldByName('leaveappstatus_code').AsString) = '' then
  begin
    MessageDlg('Please enter code.',mtError,[mbOK],0);
    Abort;
  end
  else if Trim(DataSet.FieldByName('leaveappstatus_name').AsString) = '' then
  begin
    MessageDlg('Please enter name.',mtError,[mbOK],0);
    Abort;
  end;
end;

procedure TdmMaintenance.dstLeaveReasonsBeforePost(DataSet: TDataSet);
begin
  if Trim(DataSet.FieldByName('leavereason_code').AsString) = '' then
  begin
    MessageDlg('Please enter code.',mtError,[mbOK],0);
    Abort;
  end
  else if Trim(DataSet.FieldByName('leavereason_name').AsString) = '' then
  begin
    MessageDlg('Please enter name.',mtError,[mbOK],0);
    Abort;
  end;

  if Trim(DataSet.FieldByName('leavetype_code').AsString) = '' then
  begin
    MessageDlg('Please select type.',mtError,[mbOK],0);
    Abort;
  end;

end;

procedure TdmMaintenance.dstLeaveTypesBeforePost(DataSet: TDataSet);
begin
  if Trim(DataSet.FieldByName('leavetype_code').AsString) = '' then
  begin
    MessageDlg('Please enter code.',mtError,[mbOK],0);
    Abort;
  end
  else if Trim(DataSet.FieldByName('leavetype_name').AsString) = '' then
  begin
    MessageDlg('Please enter name.',mtError,[mbOK],0);
    Abort;
  end
  else if DataSet.FieldByName('max_days').IsNull then
  begin
    MessageDlg('Please enter maximum days.',mtError,[mbOK],0);
    Abort;
  end
  else if DataSet.FieldByName('max_days').AsInteger < 0 then
  begin
    MessageDlg('Invalid value for maximum days.',mtError,[mbOK],0);
    Abort;
  end;
end;

procedure TdmMaintenance.dstLevelBeforePost(DataSet: TDataSet);
begin
  if Trim(DataSet.FieldByName('level_code').AsString) = '' then
  begin
    MessageDlg('Please enter code.',mtError,[mbOK],0);
    Abort;
  end
  else if Trim(DataSet.FieldByName('level_name').AsString) = '' then
  begin
    MessageDlg('Please enter name.',mtError,[mbOK],0);
    Abort;
  end
  else if DataSet.FieldByName('rank').AsInteger = 0 then
  begin
    MessageDlg('Please enter rank.',mtError,[mbOK],0);
    Abort;
  end;
end;

procedure TdmMaintenance.dstOccupationBeforePost(DataSet: TDataSet);
begin
  if Trim(DataSet.FieldByName('occupation_name').AsString) = '' then
  begin
    MessageDlg('Please enter occupation name.',mtError,[mbOK],0);
    Abort;
  end;
end;

procedure TdmMaintenance.dstOverrideReasonBeforePost(DataSet: TDataSet);
begin
  if Trim(DataSet.FieldByName('override_reason_code').AsString) = '' then
  begin
    MessageDlg('Please enter code.',mtError,[mbOK],0);
    Abort;
  end
  else if Trim(DataSet.FieldByName('override_reason_name').AsString) = '' then
  begin
    MessageDlg('Please enter name.',mtError,[mbOK],0);
    Abort;
  end
end;

procedure TdmMaintenance.dstOvertimeReasonsBeforePost(DataSet: TDataSet);
begin
  if Trim(DataSet.FieldByName('overtime_reason_code').AsString) = '' then
  begin
    MessageDlg('Please enter code.',mtError,[mbOK],0);
    Abort;
  end
  else if Trim(DataSet.FieldByName('overtime_reason_name').AsString) = '' then
  begin
    MessageDlg('Please enter name.',mtError,[mbOK],0);
    Abort;
  end;
end;

procedure TdmMaintenance.dstPositionBeforePost(DataSet: TDataSet);
begin
  if Trim(DataSet.FieldByName('position_code').AsString) = '' then
  begin
    MessageDlg('Please enter code.',mtError,[mbOK],0);
    Abort;
  end
  else if Trim(DataSet.FieldByName('position_name').AsString) = '' then
  begin
    MessageDlg('Please enter name.',mtError,[mbOK],0);
    Abort;
  end
  else if Trim(DataSet.FieldByName('positiontype_code').AsString) = '' then
  begin
    MessageDlg('Please select a type.',mtError,[mbOK],0);
    Abort;
  end;
end;

procedure TdmMaintenance.dstPositionStatusBeforePost(DataSet: TDataSet);
begin
  if Trim(DataSet.FieldByName('posstatus_code').AsString) = '' then
  begin
    MessageDlg('Please enter code.',mtError,[mbOK],0);
    Abort;
  end
  else if Trim(DataSet.FieldByName('posstatus_name').AsString) = '' then
  begin
    MessageDlg('Please enter name.',mtError,[mbOK],0);
    Abort;
  end;
end;

procedure TdmMaintenance.dstProvinceBeforePost(DataSet: TDataSet);
begin
  if Trim(DataSet.FieldByName('abbreviation').AsString) = '' then
  begin
    MessageDlg('Please enter abbreviation.',mtError,[mbOK],0);
    Abort;
  end
  else if Trim(DataSet.FieldByName('province_name').AsString) = '' then
  begin
    MessageDlg('Please enter name.',mtError,[mbOK],0);
    Abort;
  end;
end;

procedure TdmMaintenance.dstRelationBeforePost(DataSet: TDataSet);
begin
  if Trim(DataSet.FieldByName('relation_name').AsString) = '' then
  begin
    MessageDlg('Please enter name.',mtError,[mbOK],0);
    Abort;
  end;
end;

procedure TdmMaintenance.dstReligionBeforePost(DataSet: TDataSet);
begin
  if Trim(DataSet.FieldByName('religion_name').AsString) = '' then
  begin
    MessageDlg('Please enter name.',mtError,[mbOK],0);
    Abort;
  end;
end;

procedure TdmMaintenance.dstSalaryFrequencyBeforePost(DataSet: TDataSet);
begin
  if Trim(DataSet.FieldByName('frequency_code').AsString) = '' then
  begin
    MessageDlg('Please enter code.',mtError,[mbOK],0);
    Abort;
  end
  else if Trim(DataSet.FieldByName('frequency_name').AsString) = '' then
  begin
    MessageDlg('Please enter name.',mtError,[mbOK],0);
    Abort;
  end;
end;

procedure TdmMaintenance.dstTownBeforePost(DataSet: TDataSet);
begin
  if Trim(DataSet.FieldByName('town_name').AsString) = '' then
  begin
    MessageDlg('Please enter name.',mtError,[mbOK],0);
    Abort;
  end
  else if DataSet.FieldByName('province_id').AsInteger = 0 then
  begin
    MessageDlg('Please select province.',mtError,[mbOK],0);
    Abort;
  end;
end;

procedure TdmMaintenance.dstUndertimeReasonsBeforePost(DataSet: TDataSet);
begin
  if Trim(DataSet.FieldByName('undertime_reason_code').AsString) = '' then
  begin
    MessageDlg('Please enter code.',mtError,[mbOK],0);
    Abort;
  end
  else if Trim(DataSet.FieldByName('undertime_reason_name').AsString) = '' then
  begin
    MessageDlg('Please enter name.',mtError,[mbOK],0);
    Abort;
  end;
end;

end.

