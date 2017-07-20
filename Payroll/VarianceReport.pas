unit VarianceReport;

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
  dxSkinXmas2008Blue, cxControls, cxContainer, cxEdit, Vcl.StdCtrls,
  JvExStdCtrls, JvGroupBox, Vcl.ExtCtrls, QuickRpt, QRPrntr, cxTextEdit,
  cxMaskEdit, cxSpinEdit, cxButtons, Vcl.ComCtrls, JvExComCtrls, JvComCtrls,
  QRCtrls, cxCurrencyEdit;

type
  TfVarianceReport = class(TfBasePrintForm)
    TitleBand1: TQRBand;
    ReportTitle: TQRLabel;
    QRLabel4: TQRLabel;
    QRExpr3: TQRExpr;
    ColumnHeaderBand: TQRBand;
    QRShape1: TQRShape;
    QRLabel2: TQRLabel;
    QRGroup1: TQRGroup;
    QRDBText3: TQRDBText;
    DetailBand: TQRBand;
    QRDBText1: TQRDBText;
    QRExpr2: TQRExpr;
    QRDBText2: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
    QRLabel3: TQRLabel;
    SummaryBand1: TQRBand;
    QRShape3: TQRShape;
    QRExpr4: TQRExpr;
    Label2: TLabel;
    ceVarianceAmount: TcxCurrencyEdit;
    QRExpr1: TQRExpr;
    procedure FormCreate(Sender: TObject);
    procedure QRDBText2Print(sender: TObject; var Value: string);
    procedure QRDBText5Print(sender: TObject; var Value: string);
    procedure ceVarianceAmountPropertiesEditValueChanged(Sender: TObject);
    procedure QRLabel3Print(sender: TObject; var Value: string);
  private
    { Private declarations }
    procedure SetParameters;
  public
    { Public declarations }
  end;

var
  fVarianceReport: TfVarianceReport;

implementation

{$R *.dfm}

uses
  PayrollDataMod;

procedure TfVarianceReport.ceVarianceAmountPropertiesEditValueChanged(
  Sender: TObject);
begin
  inherited;
  SetParameters;
  inherited Generate;
end;

procedure TfVarianceReport.FormCreate(Sender: TObject);
begin
  // for whatever reason.. the dataset property is emptied during runtime
  qrMain.DataSet := dmPayroll.dstVariance;
  SetParameters;
  inherited;
end;

procedure TfVarianceReport.QRDBText2Print(sender: TObject; var Value: string);
begin
  if Length(Value) > 0 then
  begin
    if (Value = '0') or (Value = '0.00') then
      Value := ' - '
    else
      Value := FormatFloat('###,##0.00',StrToFloat(Value));
    end
  else
    Value := ' - ';
end;

procedure TfVarianceReport.QRDBText5Print(sender: TObject; var Value: string);
begin
  (Sender as TQRDBText).Font.Color := clBlack;
  if Length(Value) > 0 then
  begin
    if (Value = '0') or (Value = '0.00') then
      Value := ' - '
    else
      begin
        (Sender as TQRDBText).Font.Color := clRed;
        Value := FormatFloat('###,##0.00',StrToFloat(Value));
      end;
    end
  else
    Value := ' - ';

end;

procedure TfVarianceReport.QRLabel3Print(sender: TObject; var Value: string);
begin
  inherited;
  Value := Value + ' (Amount: ' + FormatFloat('###,##0.00',ceVarianceAmount.Value) + ')';
end;

procedure TfVarianceReport.SetParameters;
begin
  dmPayroll.dstVariance.Parameters.ParamByName('@variance_amount').Value :=
    FormatFloat('###,##0.00',ceVarianceAmount.Value);
end;

end.
