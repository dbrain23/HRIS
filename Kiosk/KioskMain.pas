unit KioskMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus, Vcl.ExtCtrls, BaseForm,
  cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters,
  dxSkinsCore, dxSkinBlack, dxSkinBlue, dxSkinBlueprint, dxSkinCaramel,
  dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide, dxSkinDevExpressDarkStyle,
  dxSkinDevExpressStyle, dxSkinFoggy, dxSkinGlassOceans, dxSkinHighContrast,
  dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky, dxSkinLondonLiquidSky,
  dxSkinMcSkin, dxSkinMoneyTwins, dxSkinOffice2007Black, dxSkinOffice2007Blue,
  dxSkinOffice2007Green, dxSkinOffice2007Pink, dxSkinOffice2007Silver,
  dxSkinOffice2010Black, dxSkinOffice2010Blue, dxSkinOffice2010Silver,
  dxSkinPumpkin, dxSkinSeven, dxSkinSevenClassic, dxSkinSharp, dxSkinSharpPlus,
  dxSkinSilver, dxSkinSpringTime, dxSkinStardust, dxSkinSummer2008,
  dxSkinTheAsphaltWorld, dxSkinsDefaultPainters, dxSkinValentine, dxSkinVS2010,
  dxSkinWhiteprint, dxSkinXmas2008Blue, dxSkinsdxNavBarPainter, dxNavBarCollns,
  cxClasses, dxNavBarBase, dxNavBar, Vcl.StdCtrls, JvExExtCtrls, JvExtComponent,
  JvPanel, Vcl.ImgList, Vcl.Buttons, Vcl.ComCtrls, Vcl.ToolWin, JvExComCtrls,
  JvStatusBar;

type
  TfKioskMain = class(TForm)
    mmMain: TMainMenu;
    File1: TMenuItem;
    Logoff1: TMenuItem;
    pDock: TJvPanel;
    About1: TMenuItem;
    ilMain: TcxImageList;
    tbMain: TToolBar;
    tbEmployee: TToolButton;
    ToolButton2: TToolButton;
    tbTimelog: TToolButton;
    tbLeaves: TToolButton;
    tbRoster: TToolButton;
    ToolButton1: TToolButton;
    tbLogOff: TToolButton;
    tbBack: TToolButton;
    sbMain: TJvStatusBar;
    procedure tbEmployeeClick(Sender: TObject);
    procedure tbBackClick(Sender: TObject);
    procedure tbLogOffClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Logoff1Click(Sender: TObject);
  private
    { Private declarations }
    procedure DockForm(Sender: TObject);
    procedure DisableButton(Sender: TObject);
    procedure SetStatusBarDisplays;
  public
    { Public declarations }
  end;

var
  fKioskMain: TfKioskMain;

implementation

{$R *.dfm}

uses EmployeeMain, LeaveMain, FormUtil, LoginKiosk, RosterMain,
  EmployeeDataMod, TimeAttendanceDataMod, LeaveDataMod,
  TimeLogMain, User, ApplicationUtil, AppConstant, SecurityDataMod;

procedure TfKioskMain.tbBackClick(Sender: TObject);
begin
  // undock previous window
  (pDock.Controls[pDock.ControlCount - 1] as TForm).Close;
  tbBack.Enabled := (pDock.ControlCount - 1) > 0;
end;

procedure TfKioskMain.tbEmployeeClick(Sender: TObject);
begin
  DockForm(Sender);
  DisableButton(Sender);
end;

procedure TfKioskMain.tbLogOffClick(Sender: TObject);
var
  form: TfLoginKiosk;
begin
  form := TfLoginKiosk.Create(nil);
  form.ShowModal;
end;

procedure TfKioskMain.DisableButton(Sender: TObject);
begin
end;

procedure TfKioskMain.DockForm(Sender: TObject);
var
  form: TForm;
  forceCreate: boolean;
begin
  if Sender is TToolButton then
  begin
    if (Sender as TToolButton).Name = 'tbEmployee' then
      form := TfEmployeeMain.Create(nil)
    else if (Sender as TToolButton).Name = 'tbTimelog' then
      form := TfTimeLogMain.Create(nil)
    else if (Sender as TToolButton).Name = 'tbLeaves' then
      form := TfLeaveMain.Create(nil)
    else if (Sender as TToolButton).Name = 'tbRoster' then
    begin
      if not SystemUser.HasPrivileges([TAppConstant.TPrivilege.ROSTER_VIEW,
        TAppConstant.TPrivilege.ROSTER_VIEW_ALL]) then
        Exit;

      form := TfRosterMain.Create(nil)
    end
    else
      form := TForm.Create(nil);
  end;

  forceCreate := (form is TfLeaveMain);

  FormUtil.DockForm(pDock, form, forceCreate);

  tbBack.Enabled := pDock.ControlCount > 0;
end;

procedure TfKioskMain.FormCreate(Sender: TObject);
begin
  { TODO : create datamodule on an "as-needed" basis }
  // instantiate data module
  dmEmployee := TdmEmployee.Create(Application);
  dmTimeAttendance := TdmTimeAttendance.Create(Application);
  dmLeave := TdmLeave.Create(Application);
end;

procedure TfKioskMain.FormShow(Sender: TObject);
begin
  SetStatusBarDisplays;
end;

procedure TfKioskMain.Logoff1Click(Sender: TObject);
begin
  Close;
end;

procedure TfKioskMain.SetStatusBarDisplays;
begin
  sbMain.Panels[0].Text := 'Database: ' + dmSecurity.acSecurity.DefaultDatabase;
  sbMain.Panels[1].Text := 'User: ' + SystemUser.Username;
  sbMain.Panels[2].Text := FormatDateTime('mmm dd, yyyy dddd',Date);
  sbMain.Panels[3].Text := 'Version ' + GetAppVersionStr(Application.ExeName);
end;

end.
