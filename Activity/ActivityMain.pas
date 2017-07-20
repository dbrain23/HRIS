unit ActivityMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, BaseMainForm, Vcl.ImgList, Vcl.ExtCtrls,
  JvExExtCtrls, JvExtComponent, JvPanel, cxGraphics, cxLookAndFeels,
  cxLookAndFeelPainters, Vcl.Menus, dxSkinsCore, dxSkinBlack, dxSkinBlue,
  dxSkinBlueprint, dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide,
  dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle, dxSkinFoggy,
  dxSkinGlassOceans, dxSkinHighContrast, dxSkiniMaginary, dxSkinLilian,
  dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMoneyTwins,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green,
  dxSkinOffice2007Pink, dxSkinOffice2007Silver, dxSkinOffice2010Black,
  dxSkinOffice2010Blue, dxSkinOffice2010Silver, dxSkinPumpkin, dxSkinSeven,
  dxSkinSevenClassic, dxSkinSharp, dxSkinSharpPlus, dxSkinSilver,
  dxSkinSpringTime, dxSkinStardust, dxSkinSummer2008, dxSkinTheAsphaltWorld,
  dxSkinsDefaultPainters, dxSkinValentine, dxSkinVS2010, dxSkinWhiteprint,
  dxSkinXmas2008Blue, cxControls, cxContainer, cxEdit, cxStyles,
  dxSkinscxPCPainter, cxCustomData, cxFilter, cxData, cxDataStorage,
  cxNavigator, Data.DB, cxDBData, cxDBLookupComboBox, cxCurrencyEdit,
  cxImageComboBox, cxDBEdit, cxCheckBox, cxGridLevel, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxClasses, cxGridCustomView, cxGrid,
  cxDropDownEdit, cxCalendar, cxMaskEdit, cxLookupEdit, cxDBLookupEdit,
  cxCheckListBox, cxTextEdit, Vcl.StdCtrls, cxButtons, JvSpeedButton,
  JvGroupHeader, JvExControls, JvLabel, Vcl.ComCtrls, JvExComCtrls, JvComCtrls,
  cxGridBandedTableView, cxGridDBBandedTableView, cxGridCardView,
  cxGridDBCardView, cxGridCustomLayoutView, JvExStdCtrls, JvGroupBox, cxMemo,
  PlannerMonthView, DBPlannerMonthView, dxSkinscxSchedulerPainter, cxScheduler,
  cxSchedulerStorage, cxSchedulerCustomControls, cxSchedulerCustomResourceView,
  cxSchedulerDayView, cxSchedulerDateNavigator, cxSchedulerHolidays,
  cxSchedulerTimeGridView, cxSchedulerUtils, cxSchedulerWeekView,
  cxSchedulerYearView, cxSchedulerGanttView, IdBaseComponent, IdScheduler,
  IdSchedulerOfThread, IdSchedulerOfThreadDefault, cxSchedulerDBStorage,
  cxGroupBox;

type
  TfActivityMain = class(TfBaseMain)
    pmMain: TPopupMenu;
    NewActivity1: TMenuItem;
    N1: TMenuItem;
    MonthView1: TMenuItem;
    WeeView1: TMenuItem;
    schMain: TcxScheduler;
    pnlControls: TPanel;
    Memo1: TMemo;
    cxGroupBox1: TcxGroupBox;
    procedure FormCreate(Sender: TObject);
    procedure NewActivity1Click(Sender: TObject);
  private
    { Private declarations }
    procedure RefreshScheduler;
  public
    { Public declarations }
  end;

var
  fActivityMain: TfActivityMain;

implementation

{$R *.dfm}

uses ActivityDataMod, ActivityDetail;

procedure TfActivityMain.RefreshScheduler;
begin

end;

procedure TfActivityMain.FormCreate(Sender: TObject);
begin
  inherited;
  schMain.SelectDays([Date - 1, Date, Date + 1], True);
  schMain.GoToDate(schMain.SelectedDays[0], vmMonth);
end;

procedure TfActivityMain.NewActivity1Click(Sender: TObject);
var
  form: TfActivityDetail;
begin
  dmActivity.dstActivitiesMonth.Open;
  dmActivity.dstActivitiesMonth.Append;

  form := TfActivityDetail.Create(nil);
  form.ShowModal;

  if form.ModalResult = mrOk then
    RefreshScheduler;
end;

end.
