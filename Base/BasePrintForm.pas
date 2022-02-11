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
  PrintInterface, cxSpinEdit, JvExComCtrls, JvComCtrls, JvExStdCtrls, JvGroupBox;

type
  TfBasePrintForm = class(TfBase, IPrint)
    pnlReport: TPanel;
    rvMain: TQRPreview;
    qrMain: TQuickRep;
    pStatus: TPanel;
    shpStatus: TShape;
    lblStatus: TLabel;
    pnlLeft: TPanel;
    btnPrint: TcxButton;
    pcMain: TJvPageControl;
    tsMain: TTabSheet;
    pnlMain: TPanel;
    p_ReportFooter: TPanel;
    lblPageNumber: TLabel;
    bNext: TcxButton;
    bLast: TcxButton;
    bFirst: TcxButton;
    bPrevious: TcxButton;
    JvGroupBox1: TJvGroupBox;
    Label1: TLabel;
    speZoom: TcxSpinEdit;
    bGenerate: TcxButton;
    procedure qrMainPreview(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnPrintClick(Sender: TObject);
    procedure speZoomPropertiesEditValueChanged(Sender: TObject);
    procedure bFirstClick(Sender: TObject);
    procedure bPreviousClick(Sender: TObject);
    procedure bNextClick(Sender: TObject);
    procedure bLastClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure bGenerateClick(Sender: TObject);
  private
    { Private declarations }
    procedure Print;
    procedure UpdatePageNumber;
  protected
    procedure Generate;
    procedure SetParams; virtual; abstract;
  public
    { Public declarations }
  end;

var
  fBasePrintForm: TfBasePrintForm;

implementation

{$R *.dfm}

{ TfBasePrintForm }

procedure TfBasePrintForm.bFirstClick(Sender: TObject);
begin
  inherited;
  rvMain.PageNumber := 1;
  UpdatePageNumber;
end;

procedure TfBasePrintForm.bGenerateClick(Sender: TObject);
begin
  inherited;
  SetParams;
  Generate;
end;

procedure TfBasePrintForm.bLastClick(Sender: TObject);
begin
  inherited;
  rvMain.PageNumber := rvMain.QRPrinter.PageCount;
  UpdatePageNumber;
end;

procedure TfBasePrintForm.bNextClick(Sender: TObject);
begin
  inherited;
  rvMain.PageNumber := rvMain.PageNumber + 1;
  UpdatePageNumber;
end;

procedure TfBasePrintForm.bPreviousClick(Sender: TObject);
begin
  inherited;
  rvMain.PageNumber := rvMain.PageNumber - 1;
  UpdatePageNumber;
end;

procedure TfBasePrintForm.btnPrintClick(Sender: TObject);
begin
  inherited;
  Print;
end;

procedure TfBasePrintForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if Assigned(qrMain.DataSet) then
    qrMain.DataSet.Close;
  inherited;
end;

procedure TfBasePrintForm.FormCreate(Sender: TObject);
begin
  inherited;
  qrMain.SendToBack;
  Generate;
end;

procedure TfBasePrintForm.Generate;
begin
  try
    Screen.Cursor := crHourglass;

    // show status panel
    // set position relative to report viewer
    pStatus.Top := Round((rvMain.Height/2) - (pStatus.Height/2));
    pStatus.Left := Round((rvMain.Width/2) - (pStatus.Width/2));
    pStatus.Visible := true;

    Application.ProcessMessages;

    qrMain.DataSet.DisableControls;

    qrMain.DataSet.Close;
    qrMain.DataSet.Open;

    qrMain.Prepare;
    rvMain.QRPrinter := qrMain.QRPrinter;

    Application.ProcessMessages;

    rvMain.Zoom := speZoom.EditingValue;
    rvMain.Update;

    qrMain.Preview;

    // hide status panel
    pStatus.Visible := false;

    Application.ProcessMessages;

    UpdatePageNumber;

  finally
    Screen.Cursor := crDefault;
    qrMain.DataSet.EnableControls;
  end;
end;

procedure TfBasePrintForm.Print;
begin
  qrMain.PrinterSetup;

  if qrMain.Tag = 0 then
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

procedure TfBasePrintForm.UpdatePageNumber;
begin
  if qrMain.DataSet.IsEmpty then
    lblPageNumber.Caption := 'No records found.'
  else
    lblPageNumber.Caption := 'Page ' + IntToStr(rvMain.PageNumber) + ' of ' +
                      IntToStr(rvMain.QRPrinter.PageCount);
end;

end.
