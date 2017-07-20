unit ReportsDrawer;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, BaseForm, Vcl.ComCtrls, cxGraphics,
  cxControls, cxLookAndFeels, cxLookAndFeelPainters, dxSkinsCore, dxSkinBlack,
  dxSkinBlue, dxSkinBlueprint, dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom,
  dxSkinDarkSide, dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle, dxSkinFoggy,
  dxSkinGlassOceans, dxSkinHighContrast, dxSkiniMaginary, dxSkinLilian,
  dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMoneyTwins,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green,
  dxSkinOffice2007Pink, dxSkinOffice2007Silver, dxSkinOffice2010Black,
  dxSkinOffice2010Blue, dxSkinOffice2010Silver, dxSkinPumpkin, dxSkinSeven,
  dxSkinSevenClassic, dxSkinSharp, dxSkinSharpPlus, dxSkinSilver,
  dxSkinSpringTime, dxSkinStardust, dxSkinSummer2008, dxSkinTheAsphaltWorld,
  dxSkinsDefaultPainters, dxSkinValentine, dxSkinVS2010, dxSkinWhiteprint,
  dxSkinXmas2008Blue, cxContainer, cxEdit, cxTreeView, Vcl.ExtCtrls,
  JvExExtCtrls, JvExtComponent, JvPanel, JvExComCtrls, JvComCtrls;

type
  TfReportsDrawer = class(TfBase)
    pDock: TPanel;
    pLeft: TPanel;
    tvReports: TcxTreeView;
    pcMaster: TJvPageControl;
    tsMaster: TTabSheet;
    pDetails: TJvPanel;
    procedure tvReportsChange(Sender: TObject; Node: TTreeNode);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fReportsDrawer: TfReportsDrawer;

const
  DTR_PROCESSING  = 101;
  PERSONNEL_MOVEMENT = 102;
  UNDERTIME = 103;
  LEAVE = 104;

  SCHED_OF_SALARIES = 201;
  PAYROLL_REGISTER = 202;
  BCF = 203;

implementation

{$R *.dfm}

uses
  FormUtil, ReportsAuxData, DtrProcessingReport, PersonnelMovementSummary,
  UndertimeReport, LeaveReport, ScheduleOfSalariesAndWages, PayrollRegister,
  BcfReport;

procedure TfReportsDrawer.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  dmReportsAux.Free;
  inherited;
end;

procedure TfReportsDrawer.FormCreate(Sender: TObject);
begin
  dmReportsAux := TdmReportsAux.Create(self);

  tvReports.FullExpand;

  inherited;
end;

procedure TfReportsDrawer.tvReportsChange(Sender: TObject; Node: TTreeNode);
var
  form: TForm;
begin
  case Node.SelectedIndex of

   DTR_PROCESSING: form := TfDtrProcessingReport.Create(self);
   PERSONNEL_MOVEMENT: form := TfPersonnelMovementSummary.Create(self);
   UNDERTIME: form := TfUndertimeReport.Create(self);
   LEAVE: form := TfLeaveReport.Create(self);
   SCHED_OF_SALARIES: form := TfSchedOfSalariesAndWages.Create(self);
   PAYROLL_REGISTER: form := TfPayrollRegister.Create(self);
   BCF: form := TfBcfReport.Create(self);

  else  form := TForm.Create(self);
  end;

  DockForm(pDock, form);
end;

end.
