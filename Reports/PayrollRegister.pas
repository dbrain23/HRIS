unit PayrollRegister;

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
  QRPrntr, cxButtons, Vcl.ComCtrls, JvExComCtrls, JvComCtrls, cxDropDownEdit,
  Data.DB, Data.Win.ADODB, QRCtrls, cxCheckBox;

type
  TfPayrollRegister = class(TfBasePrintForm)
    TitleBand1: TQRBand;
    ReportTitle: TQRLabel;
    QRLabel4: TQRLabel;
    QRExpr3: TQRExpr;
    ColumnHeaderBand: TQRBand;
    QRShape1: TQRShape;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel6: TQRLabel;
    QRShape7: TQRShape;
    QRLabel7: TQRLabel;
    QRShape8: TQRShape;
    QRLabel8: TQRLabel;
    QRShape9: TQRShape;
    QRLabel9: TQRLabel;
    QRShape10: TQRShape;
    QRShape11: TQRShape;
    QRLabel11: TQRLabel;
    QRShape3: TQRShape;
    QRLabel12: TQRLabel;
    QRLabel13: TQRLabel;
    QRShape13: TQRShape;
    QRLabel14: TQRLabel;
    QRShape2: TQRShape;
    QRShape4: TQRShape;
    QRGroup1: TQRGroup;
    QRDBText3: TQRDBText;
    DetailBand: TQRBand;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
    QRDBText8: TQRDBText;
    QRDBText9: TQRDBText;
    QRDBText10: TQRDBText;
    QRDBText14: TQRDBText;
    dstRegister: TADODataSet;
    lblPeriod: TLabel;
    cmbPayrollPeriod: TcxComboBox;
    dstRegisteremployee_name: TStringField;
    dstRegisterpayroll_period: TStringField;
    dstRegisterworking_days: TBCDField;
    dstRegisterdays_attended: TBCDField;
    dstRegisterdays_payroll: TFMTBCDField;
    dstRegisterholidays: TIntegerField;
    dstRegisterleave_with_pay: TBCDField;
    dstRegisterleave_without_pay: TBCDField;
    dstRegisterundertime_lwop: TFMTBCDField;
    dstRegisterincomplete: TFMTBCDField;
    dstRegisterawol: TIntegerField;
    dstRegisterbusiness_trip: TFMTBCDField;
    dstRegistermonthly: TBCDField;
    dstRegistersemi_monthly: TBCDField;
    dstRegisterdaily_rate: TBCDField;
    dstRegisterallowance: TFMTBCDField;
    dstRegisteradjustment: TFMTBCDField;
    dstRegisterundertime: TBCDField;
    dstRegisterlate: TFMTBCDField;
    dstRegisterdeduction: TFMTBCDField;
    dstRegistergross_pay: TFMTBCDField;
    dstRegisternet: TFMTBCDField;
    dstRegisterlocation_code: TStringField;
    dstRegisterdepartment_code: TStringField;
    dstRegisterid_num: TStringField;
    dstRegistersalary: TBCDField;
    dstRegisterlocation_name: TStringField;
    dstRegisterlwop: TFMTBCDField;
    dstRegisterut: TFMTBCDField;
    QRLabel3: TQRLabel;
    QRDBText11: TQRDBText;
    QRShape5: TQRShape;
    QRLabel5: TQRLabel;
    QRDBText12: TQRDBText;
    QRLabel16: TQRLabel;
    QRShape6: TQRShape;
    QRShape12: TQRShape;
    dstRegistergross_allowance: TFMTBCDField;
    dstRegisteradjustment_allow: TIntegerField;
    QRDBText13: TQRDBText;
    dstRegistergross_salary: TFMTBCDField;
    PageFooterBand1: TQRBand;
    QRExpr1: TQRExpr;
    QRShape14: TQRShape;
    QRExpr2: TQRExpr;
    QRExpr4: TQRExpr;
    QRExpr5: TQRExpr;
    QRExpr6: TQRExpr;
    QRExpr7: TQRExpr;
    QRExpr8: TQRExpr;
    QRExpr9: TQRExpr;
    QRExpr10: TQRExpr;
    QRExpr11: TQRExpr;
    SummaryBand: TQRBand;
    QRShape17: TQRShape;
    QRLabel19: TQRLabel;
    QRLabel20: TQRLabel;
    QRLabel21: TQRLabel;
    QRLabel22: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel15: TQRLabel;
    QRLabel17: TQRLabel;
    QRLabel18: TQRLabel;
    cbxRegular: TcxCheckBox;
    cbxProbationary: TcxCheckBox;
    dstRegisterempstatus_code: TStringField;
    QRBand1: TQRBand;
    QRExpr13: TQRExpr;
    QRShape16: TQRShape;
    QRExpr14: TQRExpr;
    QRExpr12: TQRExpr;
    QRExpr15: TQRExpr;
    procedure FormCreate(Sender: TObject);
    procedure bGenerateClick(Sender: TObject);
  private
    { Private declarations }
    procedure FilterReport;
  public
    { Public declarations }
  protected
    procedure SetParams; override;
  end;

var
  fPayrollRegister: TfPayrollRegister;

implementation

{$R *.dfm}

uses
  ReportsAuxData, FormUtil, ComboBoxObj;

procedure TfPayrollRegister.bGenerateClick(Sender: TObject);
begin
  FilterReport;
  inherited;
end;

procedure TfPayrollRegister.FilterReport;
var
  filterStr: string;
begin
  if (cbxRegular.Checked) and (cbxProbationary.Checked) then filterStr := ''
  else if cbxRegular.Checked then filterStr := 'empstatus_code <> ''PRO''' +
    ' and empstatus_code <> ''PRE'''
  else if cbxProbationary.Checked then filterStr := 'empstatus_code = ''PRO''' +
    ' or empstatus_code = ''PRE''';

  dstRegister.Filter := filterStr;
end;

procedure TfPayrollRegister.FormCreate(Sender: TObject);
begin
  // for whatever reason.. the dataset property is emptied during runtime
  qrMain.DataSet := dstRegister;

  with dmReportsAux do
  begin
    PopulateComboBox(dstPayrollPeriod,cmbPayrollPeriod,
      'payroll_code','payroll_period');
  end;

  inherited;
end;

procedure TfPayrollRegister.SetParams;
begin
  with dstRegister.Parameters do
  begin
    ParamByName('@payroll_code').Value :=
          TComboBoxObj(cmbPayrollPeriod.ItemObject).Code;
  end;
end;

end.
