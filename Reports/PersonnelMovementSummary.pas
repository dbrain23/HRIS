unit PersonnelMovementSummary;

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
  QRPrntr, cxButtons, Vcl.ComCtrls, JvExComCtrls, JvComCtrls, QRCtrls,
  cxDropDownEdit, Data.DB, Data.Win.ADODB, cxCheckBox;

type
  TfPersonnelMovementSummary = class(TfBasePrintForm)
    TitleBand1: TQRBand;
    ReportTitle: TQRLabel;
    QRLabel4: TQRLabel;
    QRExpr3: TQRExpr;
    lblPeriod: TLabel;
    cmbPayrollPeriod: TcxComboBox;
    DetailBand: TQRBand;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
    QRDBText8: TQRDBText;
    QRDBText9: TQRDBText;
    dstPersonnelMovement: TADODataSet;
    QRShape4: TQRShape;
    QRShape9: TQRShape;
    QRLabel6: TQRLabel;
    QRShape6: TQRShape;
    QRShape15: TQRShape;
    QRLabel7: TQRLabel;
    QRLabel19: TQRLabel;
    QRShape17: TQRShape;
    QRShape18: TQRShape;
    QRShape7: TQRShape;
    QRLabel8: TQRLabel;
    QRDBText3: TQRDBText;
    QRShape8: TQRShape;
    QRDBText4: TQRDBText;
    QRLabel9: TQRLabel;
    QRShape10: TQRShape;
    QRLabel11: TQRLabel;
    QRLabel13: TQRLabel;
    QRLabel14: TQRLabel;
    QRLabel15: TQRLabel;
    QRLabel16: TQRLabel;
    QRDBText10: TQRDBText;
    QRDBText11: TQRDBText;
    QRDBText12: TQRDBText;
    QRDBText13: TQRDBText;
    QRDBText15: TQRDBText;
    QRDBText16: TQRDBText;
    QRShape3: TQRShape;
    QRShape5: TQRShape;
    QRShape12: TQRShape;
    QRDBText14: TQRDBText;
    QRShape21: TQRShape;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRShape1: TQRShape;
    QRShape2: TQRShape;
    QRShape11: TQRShape;
    QRLabel3: TQRLabel;
    QRShape13: TQRShape;
    QRShape14: TQRShape;
    QRShape16: TQRShape;
    QRShape19: TQRShape;
    QRLabel5: TQRLabel;
    QRLabel10: TQRLabel;
    QRShape20: TQRShape;
    SummaryBand: TQRBand;
    QRShape22: TQRShape;
    QRLabel12: TQRLabel;
    QRLabel20: TQRLabel;
    QRLabel21: TQRLabel;
    QRLabel22: TQRLabel;
    QRLabel17: TQRLabel;
    QRLabel18: TQRLabel;
    cbxRegular: TcxCheckBox;
    cbxProbationary: TcxCheckBox;
    PageFooterBand1: TQRBand;
    QRExpr2: TQRExpr;
    QRShape23: TQRShape;
    QRExpr1: TQRExpr;
    QRExpr4: TQRExpr;
    QRExpr5: TQRExpr;
    procedure FormCreate(Sender: TObject);
    procedure bGenerateClick(Sender: TObject);
    procedure QRLabel17Print(sender: TObject; var Value: string);
  private
    { Private declarations }
    procedure FilterReport;
  public
    { Public declarations }
  protected
    procedure SetParams; override;
  end;

var
  fPersonnelMovementSummary: TfPersonnelMovementSummary;

implementation

{$R *.dfm}

uses
  ReportsAuxData, FormUtil, ComboBoxObj, User;

procedure TfPersonnelMovementSummary.bGenerateClick(Sender: TObject);
begin
  FilterReport;
  inherited;
end;

procedure TfPersonnelMovementSummary.FilterReport;
var
  filterStr: string;
begin
  if (cbxRegular.Checked) and (cbxProbationary.Checked) then filterStr := ''
  else if cbxRegular.Checked then filterStr := 'empstatus_code <> ''PRO''' +
    ' and empstatus_code <> ''PRE'''
  else if cbxProbationary.Checked then filterStr := 'empstatus_code = ''PRO''' +
    ' or empstatus_code = ''PRE''';

  dstPersonnelMovement.Filter := filterStr;
end;

procedure TfPersonnelMovementSummary.FormCreate(Sender: TObject);
begin
  // for whatever reason.. the dataset property is emptied during runtime
  qrMain.DataSet := dstPersonnelMovement;

  with dmReportsAux do
  begin
    PopulateComboBox(dstPayrollPeriod,cmbPayrollPeriod,
      'payroll_code','payroll_period');
  end;

  inherited;
end;

procedure TfPersonnelMovementSummary.QRLabel17Print(sender: TObject;
  var Value: string);
begin
  inherited;
  Value := 'Prepared by: ' + SystemUser.FullName;
end;

procedure TfPersonnelMovementSummary.SetParams;
begin
  with dstPersonnelMovement.Parameters do
  begin
    ParamByName('@payroll_code').Value :=
          TComboBoxObj(cmbPayrollPeriod.ItemObject).Code;
  end;
end;

end.
