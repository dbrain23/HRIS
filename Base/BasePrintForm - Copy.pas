unit BasePrintForm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, BaseForm, cxGraphics, cxLookAndFeels,
  cxLookAndFeelPainters, Vcl.Menus, dxSkinsCore, dxSkinBlack, dxSkinBlue,
  dxSkinBlueprint, dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide,
  dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle, dxSkinFoggy,
  dxSkinGlassOceans, dxSkinHighContrast, dxSkiniMaginary, dxSkinLilian,
  dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMoneyTwins,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green,
  dxSkinOffice2007Pink, dxSkinOffice2007Silver, dxSkinOffice2010Black,
  dxSkinOffice2010Blue, dxSkinOffice2010Silver, dxSkinPumpkin, dxSkinSeven,
  dxSkinSevenClassic, dxSkinSharp, dxSkinSharpPlus, dxSkinSilver,
  dxSkinSpringTime, dxSkinStardust, dxSkinSummer2008, dxSkinTheAsphaltWorld,
  dxSkinsDefaultPainters, dxSkinValentine, dxSkinVS2010, dxSkinWhiteprint,
  dxSkinXmas2008Blue, cxControls, cxContainer, cxEdit, Vcl.ComCtrls, dxCore,
  cxDateUtils, Vcl.ExtCtrls, cxDropDownEdit, cxTextEdit, cxMaskEdit, cxCalendar,
  JvExControls, JvLabel, Vcl.StdCtrls, cxButtons, QRCtrls, QuickRpt, QRPrntr,
  PrintInterface, cxSpinEdit, JvExComCtrls, JvComCtrls;

type
  TfBasePrintForm = class(TfBase, IPrint)
    pnlReport: TPanel;
    rvMain: TQRPreview;
    qrMain: TQuickRep;
    TitleBand1: TQRBand;
    ReportTitle: TQRLabel;
    QRLabel4: TQRLabel;
    PageFooterBand1: TQRBand;
    QRShape3: TQRShape;
    QRExpr1: TQRExpr;
    pStatus: TPanel;
    shpStatus: TShape;
    lblStatus: TLabel;
    pnlLeft: TPanel;
    btnPrint: TcxButton;
    speZoom: TcxSpinEdit;
    Label1: TLabel;
    pcMain: TJvPageControl;
    tsMain: TTabSheet;
    pnlMain: TPanel;
    procedure qrMainPreview(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnPrintClick(Sender: TObject);
    procedure speZoomPropertiesEditValueChanged(Sender: TObject);
  private
    { Private declarations }
    procedure Print;
    procedure Generate;

  public
    { Public declarations }
  end;

var
  fBasePrintForm: TfBasePrintForm;

implementation

{$R *.dfm}

{ TfBasePrintForm }

procedure TfBasePrintForm.btnPrintClick(Sender: TObject);
begin
  inherited;
  Print;
end;

procedure TfBasePrintForm.FormCreate(Sender: TObject);
begin
  inherited;
  qrMain.SendToBack;
  Generate;
end;

procedure TfBasePrintForm.Generate;
begin
 Screen.Cursor := crHourglass;

  //show status panel
  //set position relative to report viewer
  pStatus.Top := Round((rvMain.Height/2) - (pStatus.Height/2));
  pStatus.Left := Round((rvMain.Width/2) - (pStatus.Width/2));
  pStatus.Visible := true;

  if Assigned(qrMain.DataSet) then
  begin
    qrMain.DataSet.Close;
    qrMain.DataSet.Open;
  end;

  qrMain.Prepare;
  rvMain.QRPrinter := qrMain.QRPrinter;

  Application.ProcessMessages;

  qrMain.Zoom := 110;
  qrMain.Update;

  qrMain.Preview;

  //hide status panel
  pStatus.Visible := false;

  Screen.Cursor := crDefault;
end;

procedure TfBasePrintForm.Print;
begin
  qrMain.Print;
end;

procedure TfBasePrintForm.qrMainPreview(Sender: TObject);
begin
  // DO NOT REMOVE
  // This method needs to be overwritten for docking to work
end;

procedure TfBasePrintForm.speZoomPropertiesEditValueChanged(Sender: TObject);
begin
  rvMain.Zoom := speZoom.EditingValue;
  rvMain.Update;
end;

end.
