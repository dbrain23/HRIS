unit TimeAttendanceDrawer;

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
  dxSkinXmas2008Blue, cxContainer, cxEdit, cxTreeView, Vcl.ExtCtrls;

type
  TfTimeAttendanceDrawer = class(TfBase)
    pDock: TPanel;
    pLeft: TPanel;
    tvMain: TcxTreeView;
    procedure FormCreate(Sender: TObject);
    procedure tvMainChange(Sender: TObject; Node: TTreeNode);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fTimeAttendanceDrawer: TfTimeAttendanceDrawer;

implementation

{$R *.dfm}

uses DtrOverride, FormUtil, DtrOvertime, LeaveMain;

procedure TfTimeAttendanceDrawer.FormCreate(Sender: TObject);
begin
  inherited;
  tvMain.Items[0].Expand(true);
end;

procedure TfTimeAttendanceDrawer.tvMainChange(Sender: TObject; Node: TTreeNode);
const
  TIMELOG_OVERRIDE = 1;
  OVERTIME         = 2;
  UNDERTIME        = 3;
  LEAVES           = 4;
var
  form: TForm;
begin
  case Node.SelectedIndex of

    TIMELOG_OVERRIDE: form := TfTimeLogOverride.Create(self);
    OVERTIME: form := TfDtrOvertime.Create(self);
    // UNDERTIME:  form := TfEmployeeFamily.Create(self);
    LEAVES : form := TfLeaveMain.Create(self);

    else  form := TForm.Create(self);
  end;

  DockForm(pDock, form);
end;

end.
