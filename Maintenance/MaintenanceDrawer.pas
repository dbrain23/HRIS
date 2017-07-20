unit MaintenanceDrawer;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, BaseMainForm, Vcl.ImgList, Vcl.ExtCtrls,
  JvExExtCtrls, JvExtComponent, JvPanel, Vcl.ComCtrls, JvExComCtrls, JvComCtrls,
  cxGraphics;

type
  TfMaintenanceDrawer = class(TfBaseMain)
    pDock: TPanel;
    pLeft: TPanel;
    tvMain: TJvTreeView;
    procedure FormCreate(Sender: TObject);
    procedure tvMainChange(Sender: TObject; Node: TTreeNode);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fMaintenanceDrawer: TfMaintenanceDrawer;

implementation

{$R *.dfm}

uses MaintenanceDataMod, Occupation, Location, Religion, Relation, Province, Town,
  Level, Position, PositionStatus, EmployeeStatus, AllowanceType, ActivityType,
  ActivityStatus, SalaryFrequency, FormUtil, LeaveType, LeaveApplicationStatus,
  Department, DtrOverrideReason, LeaveReason, OvertimeReason, UndertimeReason,
  DeductionType, HolidayType, AdjustmentType, Area, AccountType;

procedure TfMaintenanceDrawer.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  UnloadDockedForms(pDock);
  inherited;
end;

procedure TfMaintenanceDrawer.FormCreate(Sender: TObject);
begin
  dmMaintenance := TdmMaintenance.Create(self);
  // tvMain.Items[0].Expand(true);
end;

procedure TfMaintenanceDrawer.tvMainChange(Sender: TObject; Node: TTreeNode);
const
  OCCUPATION      = 1;
  LOCATION        = 2;
  RELATION        = 3;
  RELIGION        = 4;
  POSITION        = 5;
  LEVEL           = 6;
  PROVINCE        = 7;
  CITYTOWN        = 8;
  POSITIONSTATUS  = 9;
  EMPLOYEESTATUS  = 10;
  ALLOWANCETYPE   = 11;
  ACTIVITYTYPE    = 12;
  ACTIVITYSTATUS  = 13;
  SALARYFREQUENCY = 14;
  LEAVETYPE       = 15;
  LEAVEAPPSATUS   = 16;
  DEPARTMENT      = 17;
  OVERRIDEREASON  = 18;
  LEAVEREASON     = 19;
  TIMESTATUS      = 20;
  OVERTIMEREASON  = 21;
  UNDERTIMEREASON = 22;
  DEDUCTIONTYPE   = 23;
  HOLIDAYTYPE     = 24;
  ADJUSTMENTTYPE  = 25;
  AREA            = 26;
  ACCOUNTTYPE     = 27;
var
  form: TForm;
begin
  // do not allow if node has subnodes
  if Node.HasChildren then
    exit;

  case Node.SelectedIndex of

    OCCUPATION:       form := TfOccupation.Create(self);
    LOCATION:         form := TfLocation.Create(self);
    RELATION:         form := TfRelation.Create(self);
    RELIGION:         form := TfReligion.Create(self);
    POSITION:         form := TfPosition.Create(self);
    LEVEL:            form := TfLevel.Create(self);
    PROVINCE:         form := TfProvince.Create(self);
    CITYTOWN:         form := TfTown.Create(self);
    POSITIONSTATUS:   form := TfPositionStatus.Create(self);
    EMPLOYEESTATUS:   form := TfEmpStatus.Create(self);
    ALLOWANCETYPE:    form := TfAllowanceType.Create(self);
    ACTIVITYTYPE:     form := TfActivityType.Create(self);
    ACTIVITYSTATUS:   form := TfActivityStatus.Create(self);
    SALARYFREQUENCY:  form := TfSalaryFrequency.Create(self);
    LEAVETYPE:        form := TfLeaveType.Create(self);
    LEAVEAPPSATUS:    form := TfLeaveApplicationStatus.Create(self);
    DEPARTMENT:       form := TfDepartment.Create(self);
    OVERRIDEREASON:   form := TfDtrOverrideReason.Create(self);
    LEAVEREASON:      form := TfLeaveReason.Create(self);
    OVERTIMEREASON:   form := TfOvertimeReason.Create(self);
    UNDERTIMEREASON:  form := TfUndertimeReason.Create(self);
    DEDUCTIONTYPE:    form := TfDeductionType.Create(self);
    HOLIDAYTYPE:      form := TfHolidayType.Create(self);
    ADJUSTMENTTYPE:   form := TfAdjustmentType.Create(self);
    AREA:             form := TfArea.Create(self);
    ACCOUNTTYPE:      form := TfAccountType.Create(self);

  else  form := TForm.Create(self);
  end;

  DockForm(pDock, form, true);
end;

end.
