unit ScheduleOfSalariesAndWages;

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
  dxSkinXmas2008Blue, cxControls, cxContainer, cxEdit, cxTextEdit, cxMaskEdit,
  cxSpinEdit, Vcl.StdCtrls, JvExStdCtrls, JvGroupBox, Vcl.ExtCtrls, QuickRpt,
  QRPrntr, cxButtons, Vcl.ComCtrls, JvExComCtrls, JvComCtrls, QRCtrls, Data.DB,
  Data.Win.ADODB, cxDropDownEdit, cxCheckBox;

type
  TfSchedOfSalariesAndWages = class(TfBasePrintForm)
    TitleBand1: TQRBand;
    ReportTitle: TQRLabel;
    QRLabel4: TQRLabel;
    QRExpr3: TQRExpr;
    dstSchedOfSalaries: TADODataSet;
    ColumnHeaderBand: TQRBand;
    QRShape1: TQRShape;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    DetailBand: TQRBand;
    QRDBText1: TQRDBText;
    QRExpr2: TQRExpr;
    QRDBText2: TQRDBText;
    QRLabel1: TQRLabel;
    QRLabel5: TQRLabel;
    lblPeriod: TLabel;
    cmbPayrollPeriod: TcxComboBox;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    SummaryBand: TQRBand;
    QRShape17: TQRShape;
    QRLabel19: TQRLabel;
    QRLabel21: TQRLabel;
    QRLabel22: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel15: TQRLabel;
    QRLabel13: TQRLabel;
    QRLabel14: TQRLabel;
    QRLabel16: TQRLabel;
    QRLabel17: TQRLabel;
    QRLabel18: TQRLabel;
    PageFooterBand1: TQRBand;
    QRExpr4: TQRExpr;
    QRShape16: TQRShape;
    QRExpr8: TQRExpr;
    cbxRegular: TcxCheckBox;
    cbxProbationary: TcxCheckBox;
    QRShape2: TQRShape;
    QRLabel6: TQRLabel;
    QRExpr10: TQRExpr;
    QRExpr11: TQRExpr;
    QRExpr12: TQRExpr;
    QRExpr13: TQRExpr;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel20: TQRLabel;
    QRExpr6: TQRExpr;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    dstSchedOfSalariesbranch: TStringField;
    dstSchedOfSalariessalaries_and_wages: TFMTBCDField;
    dstSchedOfSalariesadjustment: TFMTBCDField;
    dstSchedOfSalariesleaves_without_pay: TFMTBCDField;
    dstSchedOfSalariesundertime_without_pay: TFMTBCDField;
    dstSchedOfSalariestotal_staff_benefits: TFMTBCDField;
    dstSchedOfSalariesadjustment_staff_benefits: TIntegerField;
    dstSchedOfSalariestotal_salaries_and_wages: TFMTBCDField;
    dstSchedOfSalariestotal: TFMTBCDField;
    dstSchedOfSalariespayroll_period: TStringField;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  protected
    procedure SetParams; override;
  end;

var
  fSchedOfSalariesAndWages: TfSchedOfSalariesAndWages;

implementation

{$R *.dfm}

uses
  ReportsAuxData, FormUtil, ComboBoxObj;



procedure TfSchedOfSalariesAndWages.FormCreate(Sender: TObject);
begin
  // for whatever reason.. the dataset property is emptied during runtime
  qrMain.DataSet := dstSchedOfSalaries;

  with dmReportsAux do
  begin
    PopulateComboBox(dstPayrollPeriod,cmbPayrollPeriod,
      'payroll_code','payroll_period');
  end;

  inherited;
end;

procedure TfSchedOfSalariesAndWages.SetParams;
begin
  with dstSchedOfSalaries.Parameters do
  begin
    ParamByName('@payroll_code').Value :=
          TComboBoxObj(cmbPayrollPeriod.ItemObject).Code;
    ParamByName('@regular').Value := Ord(cbxRegular.Checked);
    ParamByName('@probationary').Value := Ord(cbxProbationary.Checked);
  end;
end;

end.
