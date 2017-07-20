unit HRISMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus, Vcl.ComCtrls, Vcl.ToolWin,
  JvExComCtrls, JvToolBar, Vcl.ExtCtrls, JvExExtCtrls, JvExtComponent, JvPanel,
  Vcl.ImgList, JvImageList, JvStatusBar, UITypes, cxGraphics;

type
  TfHRISMain = class(TForm)
    mmMain: TMainMenu;
    File1: TMenuItem;
    Exit1: TMenuItem;
    pDock: TJvPanel;
    tbMain: TToolBar;
    tbEmployee: TToolButton;
    Report1: TMenuItem;
    sbMain: TJvStatusBar;
    tbPaf: TToolButton;
    tbMaintenance: TToolButton;
    tbEmployeeSearch: TToolButton;
    tbPafSearch: TToolButton;
    tbPayroll: TToolButton;
    ilMain: TcxImageList;
    tbReports: TToolButton;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    tbSecurity: TToolButton;
    ToolButton3: TToolButton;
    ppMain: TPopupMenu;
    Employee1: TMenuItem;
    PAF1: TMenuItem;
    tbTimeLog: TToolButton;
    tbLeave: TToolButton;
    tbHolidays: TToolButton;
    ToolButton4: TToolButton;
    tbBack: TToolButton;
    Settings1: TMenuItem;
    About1: TMenuItem;
    Updates1: TMenuItem;
    tbRoster: TToolButton;
    procedure tbEmployeeClick(Sender: TObject);
    procedure Exit1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure tbBackClick(Sender: TObject);
  private
    { Private declarations }
    procedure DockForm(Sender: TObject);
    procedure SetStatusBarDisplays;
  public
    { Public declarations }
  end;

var
  fHRISMain: TfHRISMain;

implementation

{$R *.dfm}

uses EmployeeSearch, Employee, EmployeeDataMod, PafMain, PafList,
  PafDataMod, PafObj, EmployeeDrawer, MaintenanceDrawer,
  LoginHRIS, SecurityDataMod, AppConstant, FormUtil,
  SecurityDrawer, ReportsDrawer, PayrollDrawer, ApplicationUtil,
  TimeLogMain, TimeAttendanceDataMod, LeaveMain, LeaveDataMod, HolidayMain,
  RosterMain;

procedure TfHRISMain.FormCreate(Sender: TObject);
begin
  // instantiate data module
  dmEmployee := TdmEmployee.Create(Application);
  dmPaf := TdmPaf.Create(Application);
  dmTimeAttendance := TdmTimeAttendance.Create(Application);
  dmLeave := TdmLeave.Create(Application);

  SetStatusBarDisplays;
end;

procedure TfHRISMain.SetStatusBarDisplays;
begin
  sbMain.Panels[0].Text := 'Database: ' + dmSecurity.acSecurity.DefaultDatabase;
  sbMain.Panels[1].Text := 'User: ' + dmSecurity.User.Username;
  sbMain.Panels[2].Text := FormatDateTime('mmm dd, yyyy dddd',Date);
  sbMain.Panels[3].Text := 'Version ' + GetAppVersionStr(Application.ExeName);
end;

procedure TfHRISMain.tbBackClick(Sender: TObject);
begin
  // undock previous window
  (pDock.Controls[pDock.ControlCount - 1] as TForm).Close;
  tbBack.Enabled := (pDock.ControlCount - 1) > 0;
end;

procedure TfHRISMain.tbEmployeeClick(Sender: TObject);
begin
  DockForm(Sender);
end;

procedure TfHRISMain.DockForm(Sender: TObject);
var
  form: TForm;
  forceCreate: boolean;
begin
  forceCreate := false;

  if (Sender as TToolButton).Name = 'tbEmployee' then
  begin
    if not dmSecurity.User.HasPrivileges([TAppConstant.TPrivilege.EMP_ADD_NEW]) then
      exit;

    dmEmployee.Employee := TEmployee.Create;
    form := TfEmployeeDrawer.Create(nil);
    forceCreate := true;
  end
  else if (Sender as TToolButton).Name = 'tbPaf' then
  begin
    if not dmSecurity.User.HasPrivileges([TAppConstant.TPrivilege.PAF_ADD_NEW]) then
      exit;

    dmPaf.PafObj := TPaf.Create;
    form := TfPafMain.Create(nil);
    forceCreate := true;
  end
  else if (Sender as TToolButton).Name = 'tbPafSearch' then
  begin
    if not dmSecurity.User.HasPrivileges([TAppConstant.TPrivilege.PAF_VIEW]) then
      exit;

    dmPaf.PafObj := TPaf.Create;
    form := TfPafList.Create(nil);
    forceCreate := true;
  end
  else if (Sender as TToolButton).Name = 'tbTimeLog' then
  begin
    form := TfTimeLogMain.Create(nil);
  end
  else if (Sender as TToolButton).Name = 'tbRoster' then
  begin
    if not dmSecurity.User.HasPrivileges([TAppConstant.TPrivilege.ROSTER_VIEW,
      TAppConstant.TPrivilege.ROSTER_VIEW_ALL]) then
      Exit;

    form := TfRosterMain.Create(nil)
  end
  else if (Sender as TToolButton).Name = 'tbLeave' then
  begin
    form := TfLeaveMain.Create(nil);
  end
  else if (Sender as TToolButton).Name = 'tbHolidays' then
  begin
    if not dmSecurity.User.HasPrivileges([TAppConstant.TPrivilege.HOLIDAY_VIEW]) then
      exit;

    form := TfHolidayMain.Create(nil);
  end
  else if (Sender as TToolButton).Name = 'tbMaintenance' then
  begin
    form := TfMaintenanceDrawer.Create(nil);
  end
  else if (Sender as TToolButton).Name = 'tbPayroll' then
  begin
    if not dmSecurity.User.HasPrivileges([TAppConstant.TPrivilege.PAYROLL_VIEW]) then
      exit;

    form := TfPayrollDrawer.Create(nil);
    forceCreate := true;
  end
  else if (Sender as TToolButton).Name = 'tbSecurity' then
  begin
    if not dmSecurity.User.HasPrivileges([TAppConstant.TPrivilege.USER_VIEW]) then
      exit;

    form := TfSecurityDrawer.Create(nil);
  end
  else if (Sender as TToolButton).Name = 'tbReports' then
  begin
    form := TfReportsDrawer.Create(nil);
  end
  else
  begin
    form := TfEmployeeSearch.Create(nil);
  end;

  FormUtil.DockForm(pDock, form, forceCreate);

  tbBack.Enabled := pDock.ControlCount > 0;
end;

procedure TfHRISMain.Exit1Click(Sender: TObject);
begin
  Application.Terminate;
end;

end.
