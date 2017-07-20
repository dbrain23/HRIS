unit TimeLog;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, BaseForm, Vcl.ExtCtrls, cxGraphics,
  cxLookAndFeels, cxLookAndFeelPainters, Vcl.Menus, dxSkinsCore, dxSkinBlack,
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
  dxSkinXmas2008Blue, Vcl.StdCtrls, cxButtons, cxControls, cxStyles,
  dxSkinscxPCPainter, cxCustomData, cxFilter, cxData, cxDataStorage, cxEdit,
  cxNavigator, Data.DB, cxDBData, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxClasses, cxGridCustomView, cxGrid, cxGridLevel,
  cxContainer, Vcl.ComCtrls, dxCore, cxDateUtils, cxTextEdit, cxMaskEdit,
  cxDropDownEdit, cxCalendar, cxTimeEdit, cxCurrencyEdit;

type
  TfTimeLog = class(TfBase)
    shMain: TShape;
    pTop: TPanel;
    grTimeLog: TcxGrid;
    vwTimeLog: TcxGridDBTableView;
    lvTimeLog: TcxGridLevel;
    pMain: TPanel;
    Label1: TLabel;
    deDateFrom: TcxDateEdit;
    vwTimeLogemployee_name: TcxGridDBColumn;
    vwTimeLogtime_in_am: TcxGridDBColumn;
    vwTimeLogtime_out_am: TcxGridDBColumn;
    vwTimeLogtime_in_pm: TcxGridDBColumn;
    vwTimeLogtime_out_pm: TcxGridDBColumn;
    vwTimeLogtotal_hours: TcxGridDBColumn;
    procedure FormCreate(Sender: TObject);
    procedure deDateFromPropertiesChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fTimeLog: TfTimeLog;

implementation

{$R *.dfm}

uses TimeAttendanceDataMod, SecurityDataMod;

procedure TfTimeLog.deDateFromPropertiesChange(Sender: TObject);
begin
  inherited;
  with dmTimeAttendance.dstDTR do
  begin
    DisableControls;
    Close;
    Parameters.ParamByName('@dtr_date_from').Value :=
      FormatDateTime('yyyy-mm-dd',deDateFrom.Date);
    Parameters.ParamByName('@dtr_date_until').Value :=
      FormatDateTime('yyyy-mm-dd',deDateFrom.Date);
    Open;
    EnableControls;
  end;
end;

procedure TfTimeLog.FormCreate(Sender: TObject);
begin
  inherited;
  deDateFrom.Date := System.SysUtils.Date;
end;

end.
