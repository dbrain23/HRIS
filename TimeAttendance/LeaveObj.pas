unit LeaveObj;

interface

uses ADODB, Employee, DB, System.SysUtils, Dialogs, Variants, Forms,
  CalendarInterface;

type
    TLeaveObj = class(TObject)
      private
        fEmployee: TEmployee;
        fLeaveId: integer;
        fLocationCode: string;
        procedure RefreshMainForm;
      public
        property Employee: TEmployee read fEmployee write fEmployee;
        property LeaveId: integer read fLeaveId write fLeaveId;
        property LocationCode: string read fLocationCode write fLocationCode;
        procedure New;
        procedure Save;
        procedure Cancel;
        procedure GetLeave;
        constructor Create;
      end;

implementation

uses LeaveDataMod, AppConstant;

constructor TLeaveObj.Create;
begin
  fLeaveID := 0;
  fLocationCode := '';
end;

procedure TLeaveObj.New;
begin
  with dmLeave do
  begin
    LeaveObj := TLeaveObj.Create;

    dstLeaveDetail.Close;
    dstLeaveDetail.Open;

    dstLeave.Open;
    dstLeave.Append;
  end;
end;

procedure TLeaveObj.RefreshMainForm;
var
  iCalendar: ICalendarInterface;
  i: integer;
begin
  for i := 0 to Screen.FormCount - 1 do
    if Supports(Screen.Forms[i], ICalendarInterface, iCalendar) then
      iCalendar.UpdateRow;end;

procedure TLeaveObj.Save;
begin
  with dmLeave, dmLeave.dstLeave.Connection do
  begin
    try
      if RecordIsValid then
      begin
        BeginTrans;

        if (dstLeave.State in [dsInsert, dsEdit]) and (dstLeave.Modified) then
          dstLeave.Post;

        dstLeaveDetail.UpdateBatch;
        CommitTrans;

        // resync
        dstLeaveDetail.Close;
        dstLeaveDetail.Open;
      end;
    except
      on e: Exception do
      begin
        RollBackTrans;
        // MessageDlg(e.Message, mtError, [mbOk], 0);  { for debug purposes }
      end;
    end;
  end;

  // RefreshMainForm;
end;

procedure TLeaveObj.Cancel;
begin
  with dmLeave do
  begin
    if dstLeaves.State in [dsInsert, dsEdit] then
      dstLeave.Cancel;

    if dstLeaveDetail.State in [dsInsert, dsEdit] then
    begin
      dstLeaveDetail.CancelBatch;
      dstLeaveDetail.Requery;
    end;
  end;
end;

procedure TLeaveObj.GetLeave;
begin
  with dmLeave.dstLeave do
  begin
    Close;
    Open;
  end;

  with dmLeave.dstLeaveDetail do
  begin
    Close;
    Open;
  end;
end;

end.
