unit DeductionSummaryReport;

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
  QRCtrls, StrUtils;

type
  TfDeductionSummaryReport = class(TfBasePrintForm)
    TitleBand1: TQRBand;
    ReportTitle: TQRLabel;
    QRLabel4: TQRLabel;
    ColumnHeaderBand: TQRBand;
    DetailBand: TQRBand;
    QRShape1: TQRShape;
    QRLabel1: TQRLabel;
    QRDBText1: TQRDBText;
    QRLabel2: TQRLabel;
    QRGroup1: TQRGroup;
    QRDBText3: TQRDBText;
    PageFooterBand1: TQRBand;
    QRExpr1: TQRExpr;
    QRShape2: TQRShape;
    QRExpr2: TQRExpr;
    QRExpr3: TQRExpr;
    SummaryBand: TQRBand;
    QRShape3: TQRShape;
    QRExpr4: TQRExpr;
    QRLabel3: TQRLabel;
    QRExpr5: TQRExpr;
    procedure FormCreate(Sender: TObject);
    procedure ValuePrint(sender: TObject; var Value: string);
    procedure qrMainBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
  private
    { Private declarations }
    procedure CreateFields;
  public
    { Public declarations }
  end;

var
  fDeductionSummaryReport: TfDeductionSummaryReport;

implementation

{$R *.dfm}

uses
  PayrollDataMod;

procedure TfDeductionSummaryReport.CreateFields;
const
  ANCHOR = 140;
  SPACE  = 33; // 37
  SUBSTR = 'AaA';
  FIXEDWIDTH = 25;  // 27
  FIXEDWIDTHDATA = 30; //37
var
  columnHeader: TQRLabel;
  dataField: TQRDBText;
  totalField: TQRExpr;
  i, colCnt: integer;
begin

  colCnt := 0;

  with dmPayroll, dstDeductionSummary do
  begin
    for i := 0 to FieldCount - 1 do
    begin
      // create the header
      if AnsiStartsStr(SUBSTR,Fields[i].FieldName) then
      begin
        columnHeader := TQRLabel(ColumnHeaderBand.AddPrintable(TQRLabel));
        columnHeader.Top := 3;
        columnHeader.Left := ANCHOR + (colCnt * SPACE);
        columnHeader.AutoSize := false;
        columnHeader.AutoStretch := false;
        columnHeader.WordWrap := true;
        columnHeader.Height := 25;
        columnHeader.Width := FIXEDWIDTH;
        columnHeader.Alignment := taRightJustify;

        // font properties
        columnHeader.Font.Size := 7;
        columnHeader.Font.Style := [fsBold];

        // replace the unwanted character/string
        columnHeader.Caption :=
          StringReplace(StringReplace(Fields[i].FieldName,SUBSTR,'',[]),'_',' ',[]);

        // create the data field
        dataField := TQRDBText(DetailBand.AddPrintable(TQRDBText));
        dataField.Top := 1;
        dataField.Left :=  ANCHOR + (colCnt * SPACE) - (FIXEDWIDTHDATA - FIXEDWIDTH);
        dataField.AutoSize := false;
        dataField.AutoStretch := false;
        dataField.Height := 10;
        dataField.Width := FIXEDWIDTHDATA;
        dataField.Alignment := taRightJustify;
        dataField.DataSet := dstDeductionSummary;
        dataField.DataField := Fields[i].FieldName;
        dataField.OnPrint := ValuePrint;

        // font properties
        dataField.Font.Size := 6;

        // total field
        totalField := TQRExpr(SummaryBand.AddPrintable(TQRExpr));
        totalField.Top := 7;
        totalField.Left := ANCHOR + (colCnt * SPACE);
        totalField.AutoSize := false;
        totalField.AutoStretch := false;
        totalField.WordWrap := true;
        totalField.Height := 12;
        totalField.Width := FIXEDWIDTH + 7;
        totalField.Alignment := taRightJustify;

        // expression
        totalField.Expression := 'FORMATNUMERIC(''###,##0.00'',SUM(' +
          Fields[i].FieldName + '))';

        // font properties
        totalField.Font.Size := 6;

        Application.ProcessMessages;

        Inc(colCnt);

      end;
    end;
  end;

  inherited;
end;

procedure TfDeductionSummaryReport.FormCreate(Sender: TObject);
begin
  // for whatever reason.. the dataset property is emptied during runtime
  qrMain.DataSet := dmPayroll.dstDeductionSummary;

  inherited;
end;

procedure TfDeductionSummaryReport.ValuePrint(sender: TObject;
  var Value: string);
begin
  inherited;
  if Length(Value) > 0 then
  begin
    if Value = '0' then
      Value := '-'
    else
      Value := FormatFloat('###,##0.00',StrToFloat(Value));
    end
  else
    Value := '-';
end;

procedure TfDeductionSummaryReport.qrMainBeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
  CreateFields;
end;

end.
