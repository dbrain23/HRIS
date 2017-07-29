unit LeaveReport;

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
  cxDropDownEdit, cxTextEdit, cxMaskEdit, cxSpinEdit, Vcl.StdCtrls,
  JvExStdCtrls, JvGroupBox, Vcl.ExtCtrls, QuickRpt, QRPrntr, cxButtons,
  Vcl.ComCtrls, JvExComCtrls, JvComCtrls, QRCtrls, cxCheckBox;

type
  TfLeaveReport = class(TfBasePrintForm)
    lblPeriod: TLabel;
    cmbPayrollPeriod: TcxComboBox;
    dstLeave: TADODataSet;
    TitleBand1: TQRBand;
    ReportTitle: TQRLabel;
    QRLabel4: TQRLabel;
    QRExpr3: TQRExpr;
    ColumnHeaderBand: TQRBand;
    QRShape1: TQRShape;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRShape5: TQRShape;
    QRLabel3: TQRLabel;
    QRLabel5: TQRLabel;
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
    SummaryBand: TQRBand;
    QRShape17: TQRShape;
    QRLabel19: TQRLabel;
    QRExpr5: TQRExpr;
    QRLabel20: TQRLabel;
    QRLabel21: TQRLabel;
    QRLabel22: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel15: TQRLabel;
    QRShape2: TQRShape;
    QRShape4: TQRShape;
    cbxRegular: TcxCheckBox;
    cbxProbationary: TcxCheckBox;
    PageFooterBand1: TQRBand;
    QRExpr2: TQRExpr;
    QRShape16: TQRShape;
    QRExpr1: TQRExpr;
    QRExpr4: TQRExpr;
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
  fLeaveReport: TfLeaveReport;

implementation

{$R *.dfm}

uses
  ReportsAuxData, FormUtil, ComboBoxObj;

procedure TfLeaveReport.FormCreate(Sender: TObject);
begin
  // for whatever reason.. the dataset property is emptied during runtime
  qrMain.DataSet := dstLeave;

  with dmReportsAux do
  begin
    PopulateComboBox(dstPayrollPeriod,cmbPayrollPeriod,
      'payroll_code','payroll_period');
  end;

  inherited;
end;

procedure TfLeaveReport.SetParams;
begin
  with dstLeave.Parameters do
  begin
    ParamByName('@payroll_code').Value :=
          TComboBoxObj(cmbPayrollPeriod.ItemObject).Code;
  end;
end;

procedure TfLeaveReport.bGenerateClick(Sender: TObject);
begin
  if (cbxRegular.Checked) or (cbxProbationary.Checked) then
  begin
    FilterReport;
    inherited;
  end
  else
    MessageDlg('No option selected.',mtError,[mbOk],0);
end;

procedure TfLeaveReport.FilterReport;
var
  filterStr: string;
begin
  if (cbxRegular.Checked) and (cbxProbationary.Checked) then filterStr := ''
  else if cbxRegular.Checked then filterStr := 'empstatus_code <> ''PRO''' +
    ' and empstatus_code <> ''PRE'''
  else if cbxProbationary.Checked then filterStr := 'empstatus_code = ''PRO''' +
    ' or empstatus_code = ''PRE''';

  dstLeave.Filter := filterStr;
end;


end.
