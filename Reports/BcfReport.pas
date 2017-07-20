unit BcfReport;

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
  dxSkinXmas2008Blue, cxControls, cxContainer, cxEdit, QRCtrls, QuickRpt,
  cxTextEdit, cxMaskEdit, cxSpinEdit, Vcl.StdCtrls, JvExStdCtrls, JvGroupBox,
  Vcl.ExtCtrls, QRPrntr, cxButtons, Vcl.ComCtrls, JvExComCtrls, JvComCtrls,
  Data.DB, Data.Win.ADODB, cxDropDownEdit;

type
  TfBcfReport = class(TfBasePrintForm)
    TitleBand1: TQRBand;
    ReportTitle: TQRLabel;
    QRLabel4: TQRLabel;
    QRExpr3: TQRExpr;
    SummaryBand: TQRBand;
    QRShape17: TQRShape;
    QRExpr5: TQRExpr;
    DetailBand: TQRBand;
    dstBcf: TADODataSet;
    lblPeriod: TLabel;
    cmbPayrollPeriod: TcxComboBox;
    QRLabel1: TQRLabel;
    QRDBText5: TQRDBText;
    dstBcfpayroll_period: TStringField;
    dstBcfFB: TBCDField;
    dstBcfSH: TBCDField;
    dstBcfSSS: TBCDField;
    dstBcfPHIC: TBCDField;
    dstBcfHDMF: TBCDField;
    dstBcfSSS_LOANS: TBCDField;
    dstBcfHDMF_LOANS_MPL: TBCDField;
    dstBcfHDMF_CALAMITY: TBCDField;
    dstBcfWTAX: TBCDField;
    dstBcfEMERGENCY_LOAN: TBCDField;
    dstBcfHOUSING_LOAN: TBCDField;
    dstBcfEMPLOYEE_LOAN: TBCDField;
    dstBcfINSURANCE: TBCDField;
    dstBcfASCCEA: TBCDField;
    dstBcfESCARIO: TBCDField;
    dstBcfPG: TBCDField;
    dstBcfVITACURA: TBCDField;
    QRLabel2: TQRLabel;
    QRDBText1: TQRDBText;
    QRLabel3: TQRLabel;
    QRLabel5: TQRLabel;
    QRDBText2: TQRDBText;
    QRLabel6: TQRLabel;
    QRDBText3: TQRDBText;
    QRLabel7: TQRLabel;
    QRDBText4: TQRDBText;
    QRLabel8: TQRLabel;
    QRDBText6: TQRDBText;
    QRLabel9: TQRLabel;
    QRDBText7: TQRDBText;
    QRLabel10: TQRLabel;
    QRDBText8: TQRDBText;
    QRLabel11: TQRLabel;
    QRDBText9: TQRDBText;
    QRLabel12: TQRLabel;
    QRDBText10: TQRDBText;
    QRLabel13: TQRLabel;
    QRDBText11: TQRDBText;
    QRLabel14: TQRLabel;
    QRDBText12: TQRDBText;
    QRLabel15: TQRLabel;
    QRDBText13: TQRDBText;
    QRLabel16: TQRLabel;
    QRDBText14: TQRDBText;
    QRLabel17: TQRLabel;
    QRDBText15: TQRDBText;
    QRLabel18: TQRLabel;
    QRDBText16: TQRDBText;
    QRLabel19: TQRLabel;
    QRLabel20: TQRLabel;
    QRDBText17: TQRDBText;
    QRLabel21: TQRLabel;
    QRDBText18: TQRDBText;
    dstBcfAR_PAYMENTS: TBCDField;
    QRShape1: TQRShape;
    QRExpr1: TQRExpr;
    QRLabel22: TQRLabel;
    QRLabel23: TQRLabel;
    QRLabel24: TQRLabel;
    QRLabel25: TQRLabel;
    QRLabel26: TQRLabel;
    QRLabel27: TQRLabel;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  protected
    procedure SetParams; override;
  end;

var
  fBcfReport: TfBcfReport;

implementation

{$R *.dfm}

uses
  ReportsAuxData, FormUtil, ComboBoxObj;

procedure TfBcfReport.FormCreate(Sender: TObject);
begin
  // for whatever reason.. the dataset property is emptied during runtime
  qrMain.DataSet := dstBcf;

  with dmReportsAux do
  begin
    PopulateComboBox(dstPayrollPeriod,cmbPayrollPeriod,
      'payroll_code','payroll_period');
  end;

  inherited;
end;

procedure TfBcfReport.SetParams;
begin
  with dstBcf.Parameters do
  begin
    ParamByName('@payroll_code').Value :=
          TComboBoxObj(cmbPayrollPeriod.ItemObject).Code;
  end;
end;

end.
