unit LateReport;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, BasePrintForm, cxGraphics,
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
  dxSkinXmas2008Blue, cxControls, cxContainer, cxEdit, Data.DB, Data.Win.ADODB,
  cxTextEdit, cxMaskEdit, cxSpinEdit, Vcl.StdCtrls, JvExStdCtrls, JvGroupBox,
  Vcl.ExtCtrls, QuickRpt, QRPrntr, cxButtons, Vcl.ComCtrls, JvExComCtrls,
  JvComCtrls, QRCtrls, dxCore, cxDateUtils, cxDropDownEdit, cxCalendar,
  JvExControls, JvLabel;

type
  TfLateReport = class(TfBasePrintForm)
    dstLate: TADODataSet;
    lblPeriod: TLabel;
    cmbPayrollPeriod: TcxComboBox;
    JvLabel7: TJvLabel;
    dtpFrom: TcxDateEdit;
    dtpUntil: TcxDateEdit;
    ColumnHeaderBand: TQRBand;
    QRShape1: TQRShape;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRShape7: TQRShape;
    QRShape10: TQRShape;
    TitleBand1: TQRBand;
    ReportTitle: TQRLabel;
    CompanyLabel: TQRLabel;
    QRExpr3: TQRExpr;
    QRLabel4: TQRLabel;
    QRShape2: TQRShape;
    DetailBand1: TQRBand;
    PageFooterBand1: TQRBand;
    QRExpr2: TQRExpr;
    QRShape16: TQRShape;
    QRExpr1: TQRExpr;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    procedure FormCreate(Sender: TObject);
    procedure cmbPayrollPeriodClick(Sender: TObject);
    procedure dtpFromClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  protected
    procedure SetParams; override;
  end;

implementation

uses
  ReportsAuxData, FormUtil, ComboBoxObj, User, DBUtil;

{$R *.dfm}

procedure TfLateReport.cmbPayrollPeriodClick(Sender: TObject);
begin
  inherited;
  dtpFrom.Clear;
  dtpUntil.Clear;
end;

procedure TfLateReport.dtpFromClick(Sender: TObject);
begin
  inherited;
  cmbPayrollPeriod.ItemIndex := 0;
end;

procedure TfLateReport.FormCreate(Sender: TObject);
begin
  CompanyLabel.Caption := GetCompanyName;

  // for whatever reason.. the dataset property is emptied during runtime
  qrMain.DataSet := dstLate;

  with dmReportsAux do
  begin
    PopulateComboBox(dstPayrollPeriod,cmbPayrollPeriod,
      'payroll_code','payroll_period');
  end;

  dtpFrom.Date := Now;
  dtpUntil.Date := Now;

  inherited;
end;

procedure TfLateReport.SetParams;
begin
  if cmbPayrollPeriod.ItemIndex > 0 then
  begin
    with dstLate.Parameters do
    begin
      ParamByName('@payroll_code').Value :=
            TComboBoxObj(cmbPayrollPeriod.ItemObject).Code;
    end;
  end
  else
  begin
    dstLate.Parameters.ParamByName('@payroll_code').Value := null;
    dstLate.Parameters.ParamByName('@date_from').Value := Trunc(dtpFrom.Date);
    dstLate.Parameters.ParamByName('@date_until').Value := Trunc(dtpUntil.Date);
  end;
end;

end.
