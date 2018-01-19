unit LeaveDataMod;

interface

uses
  System.SysUtils, System.Classes, BaseDataMod, Data.DB, Data.Win.ADODB,
  cxStyles, cxClasses, LeaveObj,Dialogs, Vcl.ImgList, Vcl.Controls, cxGraphics,
  StrUtils, DBUtil, DateUtils, System.Variants, uCalendarParams;

type
  TdmLeave = class(TdmBase)
    csrLeaveDates: TcxStyleRepository;
    csBackground: TcxStyle;
    csContent: TcxStyle;
    csNewRow: TcxStyle;
    dscLeave: TDataSource;
    dstLeave: TADODataSet;
    dscLeaveDetail: TDataSource;
    dstLeaveDetail: TADODataSet;
    dscLeaveAppStatus: TDataSource;
    dstLeaveAppStatus: TADODataSet;
    dscLeaveTypes: TDataSource;
    dstLeaveTypes: TADODataSet;
    dscAMPM: TDataSource;
    dstAMPM: TADODataSet;
    dscReasonsList: TDataSource;
    dstReasonsList: TADODataSet;
    dscEmployees: TDataSource;
    dstEmployees: TADODataSet;
    dscLeaveStatus: TDataSource;
    dstLeaveStatus: TADODataSet;
    ilLeaveStatus: TcxImageList;
    spChangeDetailStatus: TADOStoredProc;
    dstLeaves: TADODataSet;
    dstLeavesEmployee: TADODataSet;
    procedure DataModuleCreate(Sender: TObject);
    procedure dstLeaveDetailBeforeOpen(DataSet: TDataSet);
    procedure dstLeaveNewRecord(DataSet: TDataSet);
    procedure dstLeaveAfterPost(DataSet: TDataSet);
    procedure dstEmployeesBeforeOpen(DataSet: TDataSet);
    procedure dstLeaveDetailNewRecord(DataSet: TDataSet);
    procedure dstLeaveBeforePost(DataSet: TDataSet);
    procedure dstLeaveDetailBeforePost(DataSet: TDataSet);
    procedure DataModuleDestroy(Sender: TObject);
    procedure dstLeaveBeforeOpen(DataSet: TDataSet);
    procedure dstLeavesEmployeeBeforeOpen(DataSet: TDataSet);
    procedure dstLeaveAfterOpen(DataSet: TDataSet);
  private
    { Private declarations }
    fLeaveObj: TLeaveObj;
    fLocationCode: string;
    FCalendarParams: TCalendarParams;
  public
    { Public declarations }
    procedure SetLeaveObj(const leaveId: integer; const locationCode: string);
    function RecordIsValid: boolean;
    property LeaveObj: TLeaveObj read fLeaveObj write fLeaveObj;
    property CalendarParams: TCalendarParams read FCalendarParams write FCalendarParams;
  end;

var
  dmLeave: TdmLeave;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

uses SecurityDataMod, AppConstant, User;

procedure TdmLeave.SetLeaveObj(const leaveId: integer; const locationCode: string);
begin
  // set the leave obj when the param is not nil
  // else.. instantiate the leave obj
  // this would in effect append a new leave record
  if leaveId > 0 then
    fLeaveObj.LeaveID := leaveId
  else
    fLeaveObj := TLeaveObj.Create;

  fLeaveObj.LocationCode := locationCode;
end;

procedure TdmLeave.DataModuleCreate(Sender: TObject);
begin
  inherited;
  fLeaveObj := TLeaveObj.Create;
  fLocationCode := GetBranchCode;
end;

procedure TdmLeave.DataModuleDestroy(Sender: TObject);
begin
  inherited;
  dstLeaves.Close;
  dstLeaveDetail.Close;
end;

procedure TdmLeave.dstEmployeesBeforeOpen(DataSet: TDataSet);
begin
  inherited;
  dstEmployees.Parameters.ParamByName('@dtr_date_from').Value :=  IncMonth(Date,-1);
  dstEmployees.Parameters.ParamByName('@dtr_date_until').Value := Date;
end;

procedure TdmLeave.dstLeaveAfterOpen(DataSet: TDataSet);
begin
  // filter leave reasons
  if not DataSet.IsEmpty then
    dstReasonsList.Filter := 'leavetype_code = ' +
        QuotedStr(DataSet.FieldByName('leavetype_code').AsString);
end;

procedure TdmLeave.dstLeaveAfterPost(DataSet: TDataSet);
var
  leaveId: integer;
  locationCode: string;

  procedure SetDetailLeaveId;
  begin
    with dstLeaveDetail do
    begin
      First;
      while not Eof do
      begin
        if FieldByName('leave_id').AsInteger = 0 then
        begin
          Edit;
          FieldByName('leave_id').AsInteger := fLeaveObj.LeaveId;
          Post;
        end;

        Next;
      end;
    end;
  end;
begin
  inherited;

  with DataSet do
  begin
    leaveId := FieldByName('leave_id').AsInteger;
    locationCode := FieldByName('location_code').AsString;
  end;

  SetLeaveObj(leaveId,locationCode);
  SetDetailLeaveId;
end;

procedure TdmLeave.dstLeaveBeforeOpen(DataSet: TDataSet);
begin
  inherited;
  inherited;
  (DataSet as TADODataSet).Parameters.ParamByName('@leave_id').Value :=
      fLeaveObj.LeaveId;
  (DataSet as TADODataSet).Parameters.ParamByName('@location_code').Value :=
      fLeaveObj.LocationCode;
end;

procedure TdmLeave.dstLeaveBeforePost(DataSet: TDataSet);

  procedure ChangeDetailStatus;
  var
    leaveStatus: string;
  begin
    leaveStatus := DataSet.FieldByName('leaveappstatus_code').AsString;
    with spChangeDetailStatus, spChangeDetailStatus.Parameters, fLeaveObj do
    begin
      ParamByName('@leave_id').Value := LeaveId;
      ParamByName('@location_code').Value := LocationCode;
      ParamByName('@leavestatus_code').Value := leaveStatus;
      ExecProc;
    end;
  end;

begin
  if DataSet.State = dsEdit then
  begin
    // check if the status has changed
    // if true.. set the status changed fields
    if DataSet.FieldByName('leaveappstatus_code').OldValue <>
      DataSet.FieldByName('leaveappstatus_code').NewValue then
    begin
      DataSet.FieldByName('status_changed_date').AsDateTime := System.SysUtils.Now;
      DataSet.FieldByName('status_changed_by').AsString := dmSecurity.User.UserIdNum;

      ChangeDetailStatus;
    end
    else
    begin
      DataSet.FieldByName('modified_date').AsDateTime := System.SysUtils.Now;
      DataSet.FieldByName('modified_by').AsString := dmSecurity.User.UserIdNum;
    end
  end
  else
  begin
    DataSet.FieldByName('created_date').AsDateTime := System.SysUtils.Now;
  end;
end;

procedure TdmLeave.dstLeaveDetailBeforeOpen(DataSet: TDataSet);
begin
  inherited;
  (DataSet as TADODataSet).Parameters.ParamByName('@leave_id').Value :=
      fLeaveObj.LeaveId;
  (DataSet as TADODataSet).Parameters.ParamByName('@location_code').Value :=
      fLeaveObj.LocationCode;
end;

procedure TdmLeave.dstLeaveDetailBeforePost(DataSet: TDataSet);
begin
  // clear the am_pm field when the date falls on a Saturday
  // half-day leave is not allowed
  with DataSet do
  begin
    if DayOfTheWeek(FieldByName('leave_date').AsDateTime) = DaySaturday then
      FieldByName('am_pm').Clear;
  end;

  if DataSet.State = dsEdit then
  begin
    // this is triggered when posting the leave id field
    // do not allow to set the modified and status fields
    if DataSet.FieldByName('leavestatus_code').AsString <> '' then
    begin
      // check if the status has changed
      // if true.. set the status changed fields
      if (DataSet.FieldByName('leavestatus_code').AsString <>
        TAppConstant.TLeaveStatus.APPROVED) and
        (DataSet.FieldByName('leavestatus_code').AsString <>
        TAppConstant.TLeaveStatus.PENDING) then
      begin
        DataSet.FieldByName('status_changed_date').AsDateTime := System.SysUtils.Now;
        DataSet.FieldByName('status_changed_by').AsString := dmSecurity.User.UserIdNum;
      end
      else
      begin
        DataSet.FieldByName('modified_date').AsDateTime := System.SysUtils.Now;
        DataSet.FieldByName('modified_by').AsString := dmSecurity.User.UserIdNum;
      end;
    end;
  end
end;

procedure TdmLeave.dstLeaveDetailNewRecord(DataSet: TDataSet);
begin
  with DataSet do
  begin
    FieldByName('leave_id').AsInteger := fLeaveObj.LeaveId;
    FieldByName('location_code').AsString := fLocationCode;
    FieldByName('is_paid').AsInteger := TAppConstant.TBooleanValue.TRUEVALUE;
    FieldByName('created_by').AsString := SystemUser.UserIdNum;
  end;
end;

procedure TdmLeave.dstLeaveNewRecord(DataSet: TDataSet);
begin
  inherited;
  with DataSet do
  begin
    FieldByName('leave_application_date').AsDateTime := System.SysUtils.Date;
    FieldByName('leaveappstatus_code').AsString := TAppConstant.TLeaveStatus.PENDING;
    FieldByName('location_code').AsString := fLocationCode;
    FieldByName('created_by').AsString := SystemUser.UserIdNum;

    if not SystemUser.HasPrivileges([TAppConstant.TPrivilege.LEAVE_VIEW_ALL],false) then
      FieldByName('id_num').AsString := SystemUser.UserIdNum;
  end;
end;

procedure TdmLeave.dstLeavesEmployeeBeforeOpen(DataSet: TDataSet);
begin
  inherited;
  dstLeavesEmployee.Parameters.ParamByName('@id_num').Value :=
    dstLeave.FieldByName('id_num').AsString;
end;

function TdmLeave.RecordIsValid: boolean;
var
  justificationNeeded, weekendsAllowed: boolean;
  existingLeaves: string;

  function DuplicateDate: boolean;
  var
    clone: TADODataSet;
    leaveDate: string;
    filter: string;
    duplicatesFound, morning, arvo: boolean;
  begin
    duplicatesFound := true;

    clone := TADODataSet.Create(nil);

    leaveDate := dstLeaveDetail.FieldByName('leave_date').AsString;

    try
      clone.Clone(dstLeaveDetail, ltReadOnly);
      clone.Filtered := true;

      // clone.Filter := 'leave_date = ' + QuotedStr(leaveDate);
      // include the am/pm and leave reason when checking
      // leave can be of the same date but for different reasons
      // i.e. morning leave can be reason 1 and arvo leave can be reason 2

      filter := '(leave_date = ' + QuotedStr(leaveDate) + ')';

      clone.Filter := filter;

      if clone.RecordCount > 1 then
      begin
        if clone.RecordCount > 2 then duplicatesFound := true
        else
        begin

          // check for morning
          clone.Filter := filter + ' AND (' + 'am_pm = ''A''' + ')';
          morning := clone.RecordCount = 1;

          // check for arvo
          clone.Filter := filter + ' AND (' + 'am_pm = ''P''' + ')';
          arvo := clone.RecordCount = 1;

          // ShowMessage(BoolToStr(morning));
          // ShowMessage(BoolToStr(arvo));

          duplicatesFound := (not morning) or (not arvo);
        end;
      end
      else duplicatesFound := false;

      Result := duplicatesFound;
    finally
      clone.Free;
    end;

  end;

  procedure CheckLeaveExists;
  var
    ldate: TDateTime;
    am_pm: string;
  begin
    // concatenate the existing..
    // the concatenated dates will be shown in a dialog to notify the user
    with dmLeave, dmLeave.dstLeavesEmployee do
    begin
      ldate := dstLeaveDetail.FieldByName('leave_date').AsDateTime;
      am_pm := dstLeaveDetail.FieldByName('am_pm').AsString;

      if dstLeaveDetail.FieldByName('am_pm').AsString = '' then
      begin
          if Locate('leave_date', dstLeaveDetail.FieldByName('leave_date').AsDateTime,[]) then
            existingLeaves := existingLeaves + #13#10 +
              FormatDateTime('mmmm dd, yyyy',dstLeaveDetail.FieldByName('leave_date').AsDateTime)
      end
      else
      begin
        if Locate('leave_date;am_pm', VarArrayOf([ldate,am_pm]),[]) then
          existingLeaves := existingLeaves + #13#10 +
            FormatDateTime('mmmm dd, yyyy',dstLeaveDetail.FieldByName('leave_date').AsDateTime) + ' ' + am_pm;
      end;
    end;
  end;

  function CheckWeekendAllowed: boolean;
  var
    leaveType: string;
  begin
    leaveType := dstLeave.FieldByName('leavetype_code').AsString;
    dstLeaveTypes.Locate('leavetype_code',leaveType,[]);
    weekendsAllowed := dstLeaveTypes.FieldByName('include_weekends').AsInteger = 1;
  end;

  function InvalidDetail: boolean;
  var
    newLeave: boolean;
  begin
    Result := true;

    CheckWeekendAllowed;

    // retrieve employee leaves
    dstLeavesEmployee.Open;

    try
      with dstLeaveDetail do
      begin
        First;

        while not Eof do
        begin
          if FieldByName('leave_date').AsString = '' then
          begin
            MessageDlg('Please select a leave date.',mtError,[mbOk],0);
            Exit;
          end;

          if FieldByName('leavereason_code').IsNull then
          begin
            MessageDlg('Please select a reason.',mtError,[mbOk],0);
            Exit;
          end;

          // leave is Sunday
          if (DayOfTheWeek(FieldByName('leave_date').AsDateTime) = DaySunday)
            and (not weekendsAllowed) then
          begin
            MessageDlg('Sunday is not allowed.',mtError,[mbOk],0);
            Exit;
          end;

          // duplicate date
          if DuplicateDate then
          begin
            MessageDlg('Duplicate leave dates found.',mtError,[mbOk],0);
            Exit;
          end;

          // justification needed
          if FieldByName('leave_date').AsDateTime <
            dstLeave.FieldByName('leave_application_date').AsDateTime then
            justificationNeeded := true;

          newLeave := FieldByName('created_date').AsString = '';

          if newLeave then
            CheckLeaveExists;

          Next;
        end;

        if existingLeaves <> '' then
        begin
          MessageDlg('The following leave dates already exists: ' +
            #13#10 + existingLeaves,mtError,[mbOk],0);
          Exit;
        end;

      end;
    finally
      dstLeavesEmployee.Close;
    end;

    Result := false;
  end;

begin
  inherited;
  Result := false;

  justificationNeeded := false;

  if dstLeave.FieldByName('id_num').IsNull then
  begin
    MessageDlg('Please select an employee.',mtError,[mbOk],0);
    Exit;
  end;

  if dstLeave.FieldByName('leave_application_date').IsNull then
  begin
    MessageDlg('Please select a leave application date.',mtError,[mbOk],0);
    Exit;
  end;

  if dstLeave.FieldByName('leavetype_code').IsNull then
  begin
    MessageDlg('Please select a leave type.',mtError,[mbOk],0);
    Exit;
  end;

  if dstLeave.FieldByName('leaveappstatus_code').AsString = TAppConstant.TLeaveStatus.PENDING then
  begin
    dstLeaveDetail.First;
    if dstLeaveDetail.IsEmpty then
    begin
      MessageDlg('Please add at least one leave date.',mtError,[mbOk],0);
      Exit;
    end;

    // check each detail record
    if InvalidDetail then
        Exit;
  end;

  //  justification
  if (justificationNeeded) and
    (dstLeave.FieldByName('justification').AsString = '') then
  begin
    MessageDlg('Please enter justification.',mtError,[mbOk],0);
    Exit;
  end
  else
  begin
    if dstLeave.State = dsBrowse then
      dstLeave.Edit;

//    if not justificationNeeded then
//      dstLeave.FieldByName('justification').Clear;
  end;

  Result := true;
end;

end.
