unit TimeAttendanceDataMod;

interface

uses
  System.SysUtils, System.Classes, BaseDataMod, Data.DB, Data.Win.ADODB, Dialogs,
  DateUtils, Variants, cxStyles, cxClasses, LeaveObj, Vcl.ImgList, Vcl.Controls,
  cxGraphics, Forms, DtrObj, HolidayObj, ADOInt, uCalendarParams;

type
  TdmTimeAttendance = class(TdmBase)
    dscDtr: TDataSource;
    dstDtr: TADODataSet;
    dscEmployee: TDataSource;
    dstEmployee: TADODataSet;
    spDTRLogTime: TADOStoredProc;
    dstExport: TADODataSet;
    dscDtrOverrideAM: TDataSource;
    dstDtrOverrideAM: TADODataSet;
    dscDtrOverridePM: TDataSource;
    dstDtrOverridePM: TADODataSet;
    dscOverrideReason: TDataSource;
    dstOverrideReason: TADODataSet;
    dscEmployees: TDataSource;
    dstEmployees: TADODataSet;
    dscDtrOvertime: TDataSource;
    dstDtrOvertime: TADODataSet;
    dscOvertimeReason: TDataSource;
    dstOvertimeReason: TADODataSet;
    csrLeaveDates: TcxStyleRepository;
    csBackground: TcxStyle;
    csContent: TcxStyle;
    csNewRow: TcxStyle;
    dscTimeStatus: TDataSource;
    dstTimeStatus: TADODataSet;
    dstRoster: TADODataSet;
    dstRosterDetail: TADODataSet;
    spChangeRosterStatus: TADOStoredProc;
    dscRoster: TDataSource;
    dscRosterDetail: TDataSource;
    dscDtrUndertimeAM: TDataSource;
    dstDtrUndertimeAM: TADODataSet;
    dscUndertimeReason: TDataSource;
    dstUndertimeReason: TADODataSet;
    ilTimeStatus: TcxImageList;
    dstResourceTypes: TADODataSet;
    dscDtrEmployee: TDataSource;
    dstDtrEmployee: TADODataSet;
    dstHolidays: TADODataSet;
    dstHoliday: TADODataSet;
    dscHoliday: TDataSource;
    dstLocations: TADODataSet;
    dscLocations: TDataSource;
    dstMonths: TADODataSet;
    dscMonths: TDataSource;
    dstHolidayLocations: TADODataSet;
    dstHolidayTypes: TADODataSet;
    dscHolidayTypes: TDataSource;
    dscDtrUndertimePM: TDataSource;
    dstDtrUndertimePM: TADODataSet;
    dstDuplicateLogs: TADODataSet;
    dscDuplicateLogs: TDataSource;
    dstDtrByDate: TADODataSet;
    dscDtrByDate: TDataSource;
    procedure DataModuleDestroy(Sender: TObject);
    procedure dstDtrOverrideAMNewRecord(DataSet: TDataSet);
    procedure DataModuleCreate(Sender: TObject);
    procedure dstDtrOverrideAMBeforePost(DataSet: TDataSet);
    procedure dstDtrOvertimeNewRecord(DataSet: TDataSet);
    procedure dstDtrOvertimeBeforePost(DataSet: TDataSet);
    procedure dstDtrOverrideAMAfterPost(DataSet: TDataSet);
    procedure dstRosterDetailNewRecord(DataSet: TDataSet);
    procedure dstRosterDetailAfterOpen(DataSet: TDataSet);
    procedure dstRosterBeforePost(DataSet: TDataSet);
    procedure dstRosterDetailBeforePost(DataSet: TDataSet);
    procedure dstDtrUndertimeAMBeforePost(DataSet: TDataSet);
    procedure dstDtrUndertimeAMNewRecord(DataSet: TDataSet);
    procedure dstDtrUndertimeAMAfterOpen(DataSet: TDataSet);
    procedure dstDtrUndertimeAMAfterPost(DataSet: TDataSet);
    procedure dstHolidayBeforePost(DataSet: TDataSet);
    procedure dstResourceTypesBeforeOpen(DataSet: TDataSet);
    procedure dstHolidayAfterPost(DataSet: TDataSet);
    procedure dstHolidayAfterOpen(DataSet: TDataSet);
    procedure dstDuplicateLogsBeforeOpen(DataSet: TDataSet);
    procedure dstDuplicateLogsAfterScroll(DataSet: TDataSet);
    procedure dstDtrByDateAfterPost(DataSet: TDataSet);
  private
    { Private declarations }
    FCalendarParams: TCalendarParams;
    fLocationCode: string;
    fDtr: TDtrObj;
    fHoliday: THoliday;
    procedure GetConnectionObject;
  public
    { Public declarations }
    property LocationCode: string read fLocationCode;
    property Holiday: THoliday read fHoliday write fHoliday;
    property CalendarParams: TCalendarParams read FCalendarParams write FCalendarParams;
  end;

var
  dmTimeAttendance: TdmTimeAttendance;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

uses
  SecurityDataMod, AppConstant, SysConn, DBUtil, User, TimeAttendanceUtils;

procedure TdmTimeAttendance.DataModuleCreate(Sender: TObject);
begin
  inherited;
  fLocationCode := GetBranchCode;

  GetConnectionObject;
end;

procedure TdmTimeAttendance.DataModuleDestroy(Sender: TObject);
begin
  inherited;
  dstDTR.Close;
  dstOverrideReason.Close;
  dstOvertimeReason.Close;
  dstTimeStatus.Close;
  acBase.Close;
end;

procedure TdmTimeAttendance.dstDtrByDateAfterPost(DataSet: TDataSet);
begin
  inherited;
  // refresh the duplicate dataset
  dstDuplicateLogs.DisableControls;
  dstDuplicateLogs.Requery;
  dstDuplicateLogs.EnableControls;
end;

procedure TdmTimeAttendance.dstDtrOverrideAMAfterPost(DataSet: TDataSet);
begin
  inherited;
  if DataSet.FieldByName('modified_date').IsNull then
    DataSet.Edit;

  RefreshMainForm;
end;

procedure TdmTimeAttendance.dstDtrOverrideAMBeforePost(DataSet: TDataSet);
var
  minTime, maxTime: TDateTime;
  validityStr: string;
  // dt: TDateTime;
begin
  inherited;
  if DataSet.FieldByName('time_in').IsNull and
     DataSet.FieldByName('time_out').IsNull then
  begin
    MessageDlg('Please enter time in and/or time out.',mtError,[mbOk],0);
    Abort;
  end
  else if (not DataSet.FieldByName('time_in').IsNull) or
     (not DataSet.FieldByName('time_out').IsNull) then
  begin
    if DataSet.Name = 'dstDtrOverrideAM' then
    begin
      // dt := DataSet.FieldByName('dtr_date').AsDateTime;

      if DayOfTheWeek(dstDtrEmployee.Parameters.ParamByName('@dtr_date').Value) = 6 then
      begin
        minTime := EncodeTime(8,0,0,0);
        maxTime := EncodeTime(12,0,0,0);
        validityStr := 'Valid value is from 8:00 AM to 12:00 PM.'
      end
      else
      begin
        minTime := EncodeTime(8,30,0,0);
        maxTime := EncodeTime(12,0,0,0);
        validityStr := 'Valid value is from 8:30 AM to 12:00 PM.'
      end;
    end
    else if DataSet.Name = 'dstDtrOverridePM' then
    begin
      minTime := EncodeTime(13,0,0,0);
      maxTime := EncodeTime(17,30,0,0);
      validityStr := 'Valid value is from 1:00 PM to 5:30 PM.'
    end;

    // check if time in and/or time out is valid..
    if (not DataSet.FieldByName('time_in').IsNull) and
      ((CompareTime(DataSet.FieldByName('time_in').AsDateTime, minTime) = -1) or
      (CompareTime(DataSet.FieldByName('time_in').AsDateTime, maxTime) = 1)) then
    begin
      MessageDlg('Invalid value for time in. ' + validityStr,
        mtError,[mbOk],0);
      Abort;
    end;

    if (not DataSet.FieldByName('time_out').IsNull) and
      ((CompareTime(DataSet.FieldByName('time_out').AsDateTime, minTime) = -1) or
      (CompareTime(DataSet.FieldByName('time_out').AsDateTime, maxTime) = 1)) then
    begin
      MessageDlg('Invalid value for time out. ' + validityStr,
        mtError,[mbOk],0);
      Abort;
    end;

    // compare the logged time
    // time in should always be before time out
    if (not DataSet.FieldByName('time_in').IsNull) and
      (not DataSet.FieldByName('time_out').IsNull) then
    begin
      if CompareTime(DataSet.FieldByName('time_in').AsDateTime,
          DataSet.FieldByName('time_out').AsDateTime) > -1 then
      begin
        MessageDlg('Time in occurs after ime out. ', mtError,[mbOk],0);
        Abort;
      end;
    end;
  end;

  if DataSet.FieldByName('override_reason_code').IsNull then
  begin
    MessageDlg('Please select an override reason.',mtError,[mbOk],0);
    Abort;
  end;

  // set the modified date and modified by columns
  if ((DataSet as TADODataSet).State = dsEdit) and
     (DataSet.Modified) and
     (DataSet.FieldByName('is_cancelled').AsInteger = 0)then
  begin
    DataSet.FieldByName('modified_date').AsDateTime := Now;
    DataSet.FieldByName('modified_by').AsString := dmSecurity.User.UserIdNum;
  end;
end;

procedure TdmTimeAttendance.dstDtrOverrideAMNewRecord(DataSet: TDataSet);
begin
  inherited;

  if DataSet.Name = 'dstDtrOverrideAM' then
    DataSet.FieldByName('am_pm').AsString := 'A'  // morning override
  else
    DataSet.FieldByName('am_pm').AsString := 'P'; // afternoon override

  // for whatever reason.. the date is read and saved with the day and month interchanged
  // this is a temporary solution to make sure the correct date is saved
  DataSet.FieldByName('dtr_date').AsString :=
    FormatDateTime('yyyy-mm-dd',dstDtrEmployee.Parameters.ParamByName('@dtr_date').Value);

  DataSet.FieldByName('id_num').AsString :=
    dstDtrEmployee.Parameters.ParamByName('@id_num').Value;
  DataSet.FieldByName('overriden_by').AsString := dmSecurity.User.UserIdNum;
end;

procedure TdmTimeAttendance.dstDtrOvertimeBeforePost(DataSet: TDataSet);

  function OvertimeExists: boolean;
  var
    idNum, dtrDate: string;
    adoTemp: TADODataSet;
  begin
    idNum := DataSet.FieldByName('id_num').AsString;
    dtrDate := DataSet.FieldByName('dtr_date').AsString;

    adoTemp := TADODataSet.Create(nil);

    try

     adoTemp.Clone(DataSet as TADODataSet);

     Result := adoTemp.Locate('dtr_date;id_num',VarArrayOf([dtrDate,idNum]),[]);

    finally
      adoTemp.Free;
    end;
  end;

begin
  // employee
  if DataSet.FieldByName('id_num').IsNull then
  begin
    MessageDlg('Please select an employee.',mtError,[mbOk],0);
    Abort;
  end;

  if (DataSet.FieldByName('time_from').IsNull) or
    (DataSet.FieldByName('time_until').IsNull) then
  begin
    MessageDlg('Please set all time fields.',mtError,[mbOk],0);
    Abort;
  end;

  if CompareTime(DataSet.FieldByName('time_from').AsDateTime,
    EncodeTime(17,0,0,0)) = -1 then
  begin
    MessageDlg('Invalid value for start time. Minimum value is 5:00 PM.',
        mtError,[mbOk],0);
    Abort;
  end;

  if CompareTime(DataSet.FieldByName('time_from').AsDateTime,
          DataSet.FieldByName('time_until').AsDateTime) > -1 then
  begin
    MessageDlg('End time should be greater than start time.', mtError,[mbOk],0);
    Abort;
  end;

  // overtime reason
  if DataSet.FieldByName('overtime_reason_code').IsNull then
  begin
    MessageDlg('Please select an overtime reason.',mtError,[mbOk],0);
    Abort;
  end;

  // check for duplicate entry
  // check only during insert
  if DataSet.State = dsInsert then
  begin
    if OvertimeExists then
    begin
      MessageDlg('Overtime record already exists.',mtError,[mbOk],0);
      Abort;
    end;
  end;

  // set modified date and modified by fields
  if ((DataSet as TADODataSet).State = dsEdit) and
     (DataSet.Modified) and
     (DataSet.FieldByName('timestatus_code').AsString =
      TAppConstant.TTimeStatus.PENDING)then
  begin
    DataSet.FieldByName('modified_date').AsDateTime := Now;
    DataSet.FieldByName('modified_by').AsString := dmSecurity.User.UserIdNum;
  end;

  // set the status changed fields
  if DataSet.FieldByName('timestatus_code').AsString <>
    TAppConstant.TTimeStatus.PENDING then
  begin
    DataSet.FieldByName('status_changed_date').AsDateTime := Now;
    DataSet.FieldByName('status_changed_by').AsString := dmSecurity.User.UserIdNum;
  end;
end;

procedure TdmTimeAttendance.dstDtrOvertimeNewRecord(DataSet: TDataSet);
begin
  DataSet.FieldByName('dtr_date').AsString :=
    FormatDateTime('yyyy-mm-dd',System.SysUtils.Date);
  DataSet.FieldByName('timestatus_code').AsString := TAppConstant.TTimeStatus.PENDING;
  DataSet.FieldByName('created_by').AsString := dmSecurity.User.UserIdNum;
end;

procedure TdmTimeAttendance.dstDtrUndertimeAMAfterOpen(DataSet: TDataSet);
begin
  if DataSet.RecordCount = 0 then
    DataSet.Append;
end;

procedure TdmTimeAttendance.dstDtrUndertimeAMAfterPost(DataSet: TDataSet);
begin
  if DataSet.FieldByName('modified_date').IsNull then
    DataSet.Edit;

  RefreshMainForm;
end;

procedure TdmTimeAttendance.dstDtrUndertimeAMBeforePost(DataSet: TDataSet);
var
  dtrDate: string;
begin
  // for whatever reason.. the date is read and saved with the day and month interchanged
  // this is a temporary solution to make sure the correct date is saved
  dtrDate := FormatDateTime('yyyy-mm-dd',dstDtrEmployee.Parameters.ParamByName('@dtr_date').Value);

  DataSet.FieldByName('dtr_date').AsString := dtrDate;

  if (DataSet.FieldByName('time_from').IsNull) or
    (DataSet.FieldByName('time_until').IsNull) then
  begin
    MessageDlg('Please set all time fields.',mtError,[mbOk],0);
    Abort;
  end;

  // For Saturdays.. time is between 8:00am and 12:00pm
  if DayOfTheWeek(dstDtrEmployee.Parameters.ParamByName('@dtr_date').Value) = 6 then
  begin
    if ((CompareTime(DataSet.FieldByName('time_from').AsDateTime,
          EncodeTime(8,0,0,0)) = -1) or
          (CompareTime(DataSet.FieldByName('time_from').AsDateTime,
          EncodeTime(12,0,0,0)) = 1)) then
    begin
      MessageDlg('Invalid value for start time. Value should be between 8:00 AM to 12:00 PM.',
          mtError,[mbOk],0);
      Abort;
    end;
  end
  // For weekdays AM.. regular time is 8:30 to 12pm
  else if DataSet.Name = 'dstDtrUndertimeAM' then
  begin
    if ((CompareTime(DataSet.FieldByName('time_from').AsDateTime,
          EncodeTime(8,30,0,0)) = -1) or
          (CompareTime(DataSet.FieldByName('time_from').AsDateTime,
          EncodeTime(12,0,0,0)) = 1)) then
    begin
      MessageDlg('Invalid value for start time. Value should be between 8:30 AM to 12:00 PM.',
          mtError,[mbOk],0);
      Abort;
    end;
  end
  else if (CompareTime(DataSet.FieldByName('time_from').AsDateTime,
    EncodeTime(13,00,0,0)) = -1) or
    (CompareTime(DataSet.FieldByName('time_from').AsDateTime,
    EncodeTime(17,30,0,0)) = 1) then
  begin
    MessageDlg('Invalid value for start time. Value should be between 1:00 PM to 5:30 PM.',
        mtError,[mbOk],0);
    Abort;
  end;

  if CompareTime(DataSet.FieldByName('time_from').AsDateTime,
          DataSet.FieldByName('time_until').AsDateTime) > -1 then
  begin
    MessageDlg('End time should be greater than start time.', mtError,[mbOk],0);
    Abort;
  end;

  // check MAX TIME
  if MinutesBetween(DataSet.FieldByName('time_until').AsDateTime,
          DataSet.FieldByName('time_from').AsDateTime) >
          (TAppConstant.TGeneral.MAX_UNDERTIME * 60) then
  begin
    MessageDlg('Undertime is more than the time allowed.', mtError,[mbOk],0);
    Abort;
  end;

  // undertime reason
  if DataSet.FieldByName('undertime_reason_code').IsNull then
  begin
    MessageDlg('Please select an undertime reason.',mtError,[mbOk],0);
    Abort;
  end;

  // set modified date and modified by fields
  if ((DataSet as TADODataSet).State = dsEdit) and
     (DataSet.Modified) and
     (DataSet.FieldByName('timestatus_code').AsString =
      TAppConstant.TTimeStatus.PENDING)then
  begin
    DataSet.FieldByName('modified_date').AsDateTime := Now;
    DataSet.FieldByName('modified_by').AsString := dmSecurity.User.UserIdNum;
  end;

  // set the status changed fields
  if DataSet.FieldByName('timestatus_code').AsString <>
    TAppConstant.TTimeStatus.PENDING then
  begin
    DataSet.FieldByName('status_changed_date').AsDateTime := Now;
    DataSet.FieldByName('status_changed_by').AsString := dmSecurity.User.UserIdNum;
  end;
end;

procedure TdmTimeAttendance.dstDtrUndertimeAMNewRecord(DataSet: TDataSet);
begin
  if DataSet.Name = 'dstDtrUndertimeAM' then
    DataSet.FieldByName('am_pm').AsString := 'A'  // morning undertime
  else
    DataSet.FieldByName('am_pm').AsString := 'P'; // afternoon undertime

  DataSet.FieldByName('id_num').AsString :=
    dstDtrEmployee.Parameters.ParamByName('@id_num').Value;
  DataSet.FieldByName('timestatus_code').AsString := TAppConstant.TTimeStatus.PENDING;
  DataSet.FieldByName('created_by').AsString := dmSecurity.User.UserIdNum;
  DataSet.FieldByName('is_paid').AsInteger := 0;
end;

procedure TdmTimeAttendance.dstDuplicateLogsAfterScroll(DataSet: TDataSet);
begin
  inherited;
  with dstDtrByDate do
  begin
    Close;
    Parameters.ParamByName('@id_num').Value := DataSet.FieldByName('id_num').AsString;
    Parameters.ParamByName('@dtr_date').Value := DataSet.FieldByName('dtr_date').AsDateTime;
    Open;
  end;
end;

procedure TdmTimeAttendance.dstDuplicateLogsBeforeOpen(DataSet: TDataSet);
begin
  (DataSet as TADODataSet).Parameters.ParamByName('@dtr_date_from').Value :=
    dstDtr.Parameters.ParamByName('@dtr_date_from').Value;
  (DataSet as TADODataSet).Parameters.ParamByName('@dtr_date_until').Value :=
    dstDtr.Parameters.ParamByName('@dtr_date_until').Value;
end;

procedure TdmTimeAttendance.dstHolidayAfterOpen(DataSet: TDataSet);
begin
  inherited;
  DataSet.Edit;
end;

procedure TdmTimeAttendance.dstHolidayAfterPost(DataSet: TDataSet);
begin
  inherited;
  DataSet.Edit;
end;

procedure TdmTimeAttendance.dstHolidayBeforePost(DataSet: TDataSet);
var
  yy,mm,dd: word;
begin
  if (DataSet.FieldByName('holiday_year').AsInteger = 0) and
   (DataSet.FieldByName('is_recurring').AsInteger = 0) then
  begin
    MessageDlg('Please enter holiday year.',mtError,[mbOk],0);
    Abort;
  end;

  if DataSet.FieldByName('holiday_month').AsInteger = 0 then
  begin
    MessageDlg('Please enter holiday month.',mtError,[mbOk],0);
    Abort;
  end;

  if DataSet.FieldByName('holiday_day').AsInteger = 0 then
  begin
    MessageDlg('Please enter holiday day.',mtError,[mbOk],0);
    Abort;
  end;

  if DataSet.FieldByName('holiday_name').AsString = '' then
  begin
    MessageDlg('Please enter holiday name.',mtError,[mbOk],0);
    Abort;
  end;

  if DataSet.FieldByName('holidaytype_code').AsString = '' then
  begin
    MessageDlg('Please select holiday type.',mtError,[mbOk],0);
    Abort;
  end;

  DecodeDate(Date,yy,mm,dd);
  if ((DataSet.FieldByName('holiday_year').AsInteger < yy) or
    (DataSet.FieldByName('holiday_year').AsInteger > yy)) and
   (DataSet.FieldByName('is_recurring').AsInteger = 0) then
  begin
    MessageDlg('Invalid value for holiday year.',mtError,[mbOk],0);
    Abort;
  end;

  // check for date validity
  try
    if DataSet.FieldByName('is_recurring').AsInteger = 1 then
      yy := CurrentYear
    else
      yy := DataSet.FieldByName('holiday_year').AsInteger;

    mm := DataSet.FieldByName('holiday_month').AsInteger;
    dd := DataSet.FieldByName('holiday_day').AsInteger;
    EncodeDate(yy,mm,dd);
  except
    on e: Exception do
    begin
      MessageDlg('Date is not valid.',mtError,[mbOk],0);
      Abort;
    end;
  end;

  // set year to null when recurring
  if DataSet.FieldByName('is_recurring').AsInteger = 1 then
    DataSet.FieldByName('holiday_year').Value := null;

  // set created by and created date fields
  if DataSet.State = dsInsert then
  begin
    DataSet.FieldByName('created_by').AsString := SystemUser.UserIdNum;
    DataSet.FieldByName('created_date').AsDateTime := Now;
  end
  else
  begin
    DataSet.FieldByName('modified_by').AsString := SystemUser.UserIdNum;
    DataSet.FieldByName('modified_date').AsDateTime := Now;
  end;
end;

procedure TdmTimeAttendance.dstResourceTypesBeforeOpen(DataSet: TDataSet);
begin
  inherited;
  if SystemUser.HasPrivileges([TAppConstant.TPrivilege.FILTER_BY_POS],false) then
    (DataSet as TADODataSet).Parameters.ParamByName('@filter_position').Value := 1
  else
    (DataSet as TADODataSet).Parameters.ParamByName('@filter_position').Value := 0;
end;

procedure TdmTimeAttendance.dstRosterBeforePost(DataSet: TDataSet);
begin
  inherited;
  with DataSet do
  begin
    FieldByName('created_by').AsString := SystemUser.UserIdNum;
    FieldByName('created_date').AsDateTime := Now;
  end;
end;

procedure TdmTimeAttendance.dstRosterDetailAfterOpen(DataSet: TDataSet);
begin
  inherited;
  (DataSet as TADODataSet).Properties['Unique Table'].Value := 'rosterdetail';
end;

procedure TdmTimeAttendance.dstRosterDetailBeforePost(DataSet: TDataSet);
begin
  inherited;
  with DataSet, dmSecurity.User do
  begin
    if FieldByName('rdstatus_code').AsString <>
      TAppConstant.TRosterDetailStatus.ACTIVE then
    begin
      if FieldByName('change_reason').AsString = ''  then
      begin
        MessageDlg('Please enter a reason.',mtConfirmation,[mbOk],0);
        Abort;
      end;

      FieldByName('status_changed_by').AsString := UserIdNum;
      FieldByName('status_changed_date').AsDateTime := Now;
    end;
  end;
end;

procedure TdmTimeAttendance.dstRosterDetailNewRecord(DataSet: TDataSet);
begin
  inherited;
  with DataSet, dmSecurity.User do
  begin
    FieldByName('rdstatus_code').AsString :=
      TAppConstant.TRosterDetailStatus.ACTIVE;
    FieldByName('created_by').AsString := UserIdNum;
    FieldByName('created_date').AsDateTime := Now;
  end;
end;

procedure TdmTimeAttendance.GetConnectionObject;
var
  i, cnt: integer;
begin
  if dmSecurity = nil then
  begin
    i := 0;

    cnt := self.ComponentCount - 1;

    while i < cnt do
    begin
      if self.Components[i] is TADODataSet then
        (self.Components[i] as TADODataSet).Connection := acBase
      else if self.Components[i] is TADOStoredProc then
        (self.Components[i] as TADOStoredProc).Connection := acBase;

      Inc(i);
    end;
  end;
end;

end.
