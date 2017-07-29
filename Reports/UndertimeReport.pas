unit UndertimeReport;

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
  TfUndertimeReport = class(TfBasePrintForm)
    lblPeriod: TLabel;
    cmbPayrollPeriod: TcxComboBox;
    dstUndertime: TADODataSet;
    TitleBand1: TQRBand;
    ReportTitle: TQRLabel;
    QRLabel4: TQRLabel;
    QRExpr3: TQRExpr;
    QRGroup1: TQRGroup;
    QRDBText3: TQRDBText;
    ColumnHeaderBand: TQRBand;
    QRShape1: TQRShape;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel6: TQRLabel;
    QRShape7: TQRShape;
    QRLabel8: TQRLabel;
    QRShape9: TQRShape;
    QRShape10: TQRShape;
    QRShape11: TQRShape;
    DetailBand: TQRBand;
    QRDBText1: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText7: TQRDBText;
    QRDBText8: TQRDBText;
    QRDBText10: TQRDBText;
    SummaryBand: TQRBand;
    QRShape17: TQRShape;
    QRLabel19: TQRLabel;
    QRLabel20: TQRLabel;
    QRLabel21: TQRLabel;
    QRLabel22: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel9: TQRLabel;
    QRShape2: TQRShape;
    cbxRegular: TcxCheckBox;
    cbxProbationary: TcxCheckBox;
    PageFooterBand1: TQRBand;
    QRExpr2: TQRExpr;
    QRShape16: TQRShape;
    QRExpr1: TQRExpr;
    QRExpr4: TQRExpr;
    QRExpr5: TQRExpr;
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
  fUndertimeReport: TfUndertimeReport;

implementation

{$R *.dfm}

uses
  ReportsAuxData, FormUtil, ComboBoxObj;

procedure TfUndertimeReport.bGenerateClick(Sender: TObject);
begin
  if (cbxRegular.Checked) or (cbxProbationary.Checked) then
  begin
    FilterReport;
    inherited;
  end
  else
    MessageDlg('No option selected.',mtError,[mbOk],0);
end;

procedure TfUndertimeReport.FilterReport;
var
  filterStr: string;
begin
  if (cbxRegular.Checked) and (cbxProbationary.Checked) then filterStr := ''
  else if cbxRegular.Checked then filterStr := 'empstatus_code <> ''PRO''' +
    ' and empstatus_code <> ''PRE'''
  else if cbxProbationary.Checked then filterStr := 'empstatus_code = ''PRO''' +
    ' or empstatus_code = ''PRE''';

  dstUndertime.Filter := filterStr;
end;

procedure TfUndertimeReport.FormCreate(Sender: TObject);
begin
  // for whatever reason.. the dataset property is emptied during runtime
  qrMain.DataSet := dstUndertime;

  with dmReportsAux do
  begin
    PopulateComboBox(dstPayrollPeriod,cmbPayrollPeriod,
      'payroll_code','payroll_period');
  end;

  inherited;
end;

procedure TfUndertimeReport.SetParams;
begin
  with dstUndertime.Parameters do
  begin
    ParamByName('@payroll_code').Value :=
          TComboBoxObj(cmbPayrollPeriod.ItemObject).Code;
  end;
end;

end.
