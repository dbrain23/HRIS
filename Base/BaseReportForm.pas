unit BaseReportForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, BaseForm, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxContainer, cxEdit, dxSkinsCore, dxSkinBlack,
  dxSkinBlue, dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide,
  dxSkinFoggy, dxSkinGlassOceans, dxSkiniMaginary, dxSkinLilian,
  dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMoneyTwins,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green,
  dxSkinOffice2007Pink, dxSkinOffice2007Silver, dxSkinOffice2010Black,
  dxSkinOffice2010Blue, dxSkinOffice2010Silver, dxSkinPumpkin, dxSkinSeven,
  dxSkinSharp, dxSkinSilver, dxSkinSpringTime, dxSkinStardust, dxSkinSummer2008,
  dxSkinsDefaultPainters, dxSkinValentine, dxSkinXmas2008Blue, Menus,
  cxDropDownEdit, cxTextEdit, cxMaskEdit, cxCalendar, StdCtrls, QRCtrls,
  QuickRpt, QRPrntr, ExtCtrls, cxButtons, DB, ADODB, dxPrnDev, dxPrnDlg,
  dxSkinBlueprint, dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle,
  dxSkinHighContrast, dxSkinSevenClassic, dxSkinSharpPlus,
  dxSkinTheAsphaltWorld, dxSkinVS2010, dxSkinWhiteprint, Vcl.ComCtrls, dxCore,
  cxDateUtils, JvExControls, JvLabel, cxLookupEdit, cxDBLookupEdit,
  cxDBLookupComboBox, System.UITypes;

type
  TfBaseReport = class(TfBase)
    p_Report: TPanel;
    ReportViewer: TQRPreview;
    QuickReport: TQuickRep;
    ColumnHeaderBand1: TQRBand;
    QRShape1: TQRShape;
    TitleBand1: TQRBand;
    ReportTitle: TQRLabel;
    DateRange: TQRLabel;
    QRLabel4: TQRLabel;
    ProjectLabel: TQRLabel;
    MasterDetailBand: TQRBand;
    ParametersPanel: TPanel;
    bGenerate: TcxButton;
    bPrint: TcxButton;
    dstReport: TADODataSet;
    dscReport: TDataSource;
    QRLabel1: TQRLabel;
    QRDBText1: TQRDBText;
    p_ReportFooter: TPanel;
    lblPageNumber: TLabel;
    bNext: TcxButton;
    bLast: TcxButton;
    p_Action: TPanel;
    bFirst: TcxButton;
    bPrevious: TcxButton;
    pStatus: TPanel;
    shpStatus: TShape;
    lblStatus: TLabel;
    JvLabel7: TJvLabel;
    dtpFrom: TcxDateEdit;
    dtpUntil: TcxDateEdit;
    JvLabel5: TJvLabel;
    cmbLocation: TcxComboBox;
    PageFooterBand1: TQRBand;
    QRShape3: TQRShape;
    QRExpr1: TQRExpr;
    procedure FormShow(Sender: TObject);
   procedure QuickReportPreview(Sender: TObject);
    procedure bGenerateClick(Sender: TObject);
    procedure bPrintClick(Sender: TObject);
    procedure bPreviousClick(Sender: TObject);
    procedure bNextClick(Sender: TObject);
    procedure bFirstClick(Sender: TObject);
    procedure bLastClick(Sender: TObject);
    procedure GenerateReport; virtual;
    procedure UpdatePageNumber;
    procedure SetPrintSettings; virtual;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    INITIAL_LOAD: boolean;
    procedure SetLocationLabel;
    procedure SetReportDate;
    procedure PopulateLocations;
  public
    { Public declarations }
  end;

  type TComboObject = class(TObject)
    public
      Value: string;
      Display: string;
  end;

var
  fBaseReport: TfBaseReport;

implementation

{$R *.dfm}

uses AppConstant, ReportsAuxData, SecurityDataMod;

procedure TfBaseReport.SetPrintSettings;
begin
  //QuickReport.QRPrinter.aPrinterSettings.Title := ReportTitle.Caption;
  //QuickReport.QRPrinter.aPrinterSettings.Orientation := TPrinterOrientation.poPortrait;
  //QuickReport.QRPrinter.aPrinterSettings.PaperSize := Letter;
  //QuickReport.QRPrinter.aPrinterSettings.ApplySettings;
end;

procedure TfBaseReport.SetReportDate;
begin
  DateRange.Caption := DateToStr(dtpFrom.Date) + ' - ' + DateToStr(dtpUntil.Date);
end;

procedure TfBaseReport.UpdatePageNumber;
begin
  if dstReport.IsEmpty then
    lblPageNumber.Caption := 'No records found.'
  else
    lblPageNumber.Caption := 'Page ' + IntToStr(ReportViewer.PageNumber) + ' of ' +
                      IntToStr(ReportViewer.QRPrinter.PageCount);
end;

procedure TfBaseReport.SetLocationLabel;
begin
  if (cmbLocation.ItemIndex = 0)
    or (Trim(cmbLocation.Text) = '') then
    ProjectLabel.Caption := 'Location: All Locations'
  else
    ProjectLabel.Caption := 'Location: ' + cmbLocation.Text;
end;

procedure TfBaseReport.GenerateReport;
begin
  Screen.Cursor := crHourglass;

  //show status panel
  //set position relative to report viewer
  pStatus.Top := Round((ReportViewer.Height/2) - (pStatus.Height/2));
  pStatus.Left := Round((ReportViewer.Width/2) - (pStatus.Width/2));
  pStatus.Visible := true;

  dstReport.Close;
  dstReport.Open;

  SetLocationLabel;
  SetReportDate;

  QuickReport.Prepare;
  ReportViewer.QRPrinter := QuickReport.QRPrinter;

  Application.ProcessMessages;

  UpdatePageNumber;
  //ReportViewer.UpdateZoom;
  QuickReport.Preview;

  //hide status panel
  pStatus.Visible := false;

  Screen.Cursor := crDefault;

  INITIAL_LOAD := false;
end;

procedure TfBaseReport.QuickReportPreview(Sender: TObject);
begin
  //DO NOT REMOVE!!!!!!!!
  //QuickReport.Prepare;
  //ReportViewer.QRPrinter := QuickReport.QRPrinter;
end;

procedure TfBaseReport.PopulateLocations;
var
  comboObj: TComboObject;
begin
  //populate LOCATION combo
  cmbLocation.Properties.Items.Clear;

  comboObj := TComboObject.Create;

  comboObj.Value := '';
  comboObj.Display := '- All locations -';
  cmbLocation.Properties.Items.AddObject(comboObj.Display,TObject(comboObj));

  try
    with dmReportsAux do
    begin
      dstLocations.Open;

      while not dstLocations.Eof do
      begin
        comboObj := TComboObject.Create;

        comboObj.Value := dstLocations.FieldByName('location_code').AsString;

        comboObj.Display := dstLocations.FieldByName('location_name').AsString;

        cmbLocation.Properties.Items.AddObject(comboObj.Display,TObject(comboObj));

        dstLocations.Next;
      end;
    end;

  finally
    dmReportsAux.dstLocations.Close;
    cmbLocation.ItemIndex := 0;
  end;
end;

procedure TfBaseReport.bFirstClick(Sender: TObject);
begin
  inherited;
  ReportViewer.PageNumber := 1;
  UpdatePageNumber;
end;

procedure TfBaseReport.bGenerateClick(Sender: TObject);
begin
  inherited;
  GenerateReport;
end;

procedure TfBaseReport.bLastClick(Sender: TObject);
begin
  inherited;
  ReportViewer.PageNumber := ReportViewer.QRPrinter.PageCount;
  UpdatePageNumber;
end;

procedure TfBaseReport.bPrintClick(Sender: TObject);
begin
  inherited;
  if not dstReport.Active then
  begin
    MessageDlg('No data to print.',mtError,[mbok],0);
    exit;
  end;

  if dstReport.IsEmpty then
  begin
    MessageDlg('No data to print.',mtError,[mbok],0);
    exit;
  end;

  SetPrintSettings;
  QuickReport.QRPrinter.PrintSetup;

  // print button was clicked
  if QuickReport.Tag = 0 then
    QuickReport.QRPrinter.Print;
end;

procedure TfBaseReport.bNextClick(Sender: TObject);
begin
  inherited;
  ReportViewer.PageNumber := ReportViewer.PageNumber + 1;
  UpdatePageNumber;
end;

procedure TfBaseReport.bPreviousClick(Sender: TObject);
begin
  inherited;
  ReportViewer.PageNumber := ReportViewer.PageNumber - 1;
  UpdatePageNumber;
end;

procedure TfBaseReport.FormCreate(Sender: TObject);
begin
  inherited;
  dtpFrom.Date := SysUtils.Date;
  dtpUntil.Date := SysUtils.Date;

  PopulateLocations;
end;

procedure TfBaseReport.FormShow(Sender: TObject);
begin
  INITIAL_LOAD := true;

  QuickReport.SendToBack;
  ReportViewer.Zoom := TAppConstant.TConfig.ReportZoom;

  if not INITIAL_LOAD then
    GenerateReport;
end;

end.
