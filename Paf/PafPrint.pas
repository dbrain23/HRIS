unit PafPrint;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, BasePrintForm, Vcl.StdCtrls,
  Vcl.ExtCtrls, QRCtrls, QuickRpt, QRPrntr, cxGraphics, cxLookAndFeels,
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
  dxSkinXmas2008Blue, cxButtons, cxControls, cxContainer, cxEdit, cxTextEdit,
  cxMaskEdit, cxSpinEdit, Vcl.ComCtrls, JvExComCtrls, JvComCtrls, JvExStdCtrls,
  JvGroupBox, cxDropDownEdit;

type
  TfPafPrint = class(TfBasePrintForm)
    SummaryBand1: TQRBand;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRShape1: TQRShape;
    QRShape2: TQRShape;
    QRShape4: TQRShape;
    QRShape5: TQRShape;
    QRShape6: TQRShape;
    QRShape7: TQRShape;
    QRShape8: TQRShape;
    QRShape9: TQRShape;
    QRShape10: TQRShape;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRShape11: TQRShape;
    QRShape12: TQRShape;
    QRShape13: TQRShape;
    QRShape14: TQRShape;
    QRLabel11: TQRLabel;
    QRShape15: TQRShape;
    QRLabel12: TQRLabel;
    QRLabel13: TQRLabel;
    QRLabel14: TQRLabel;
    QRLabel15: TQRLabel;
    QRLabel16: TQRLabel;
    QRLabel19: TQRLabel;
    QRLabel20: TQRLabel;
    QRShape17: TQRShape;
    QRShape18: TQRShape;
    QRShape19: TQRShape;
    QRShape20: TQRShape;
    QRShape21: TQRShape;
    QRShape22: TQRShape;
    QRShape23: TQRShape;
    QRLabel24: TQRLabel;
    QRShape25: TQRShape;
    QRLabel25: TQRLabel;
    QRShape26: TQRShape;
    QRLabel26: TQRLabel;
    QRLabel27: TQRLabel;
    QRLabel28: TQRLabel;
    QRLabel29: TQRLabel;
    QRShape27: TQRShape;
    QRShape28: TQRShape;
    QRShape29: TQRShape;
    QRShape30: TQRShape;
    QRLabel35: TQRLabel;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRShape32: TQRShape;
    QRDBText6: TQRDBText;
    QRShape33: TQRShape;
    QRDBText7: TQRDBText;
    QRDBText8: TQRDBText;
    QRDBText9: TQRDBText;
    QRDBText10: TQRDBText;
    QRLabel36: TQRLabel;
    QRLabel37: TQRLabel;
    QRDBText11: TQRDBText;
    QRDBText12: TQRDBText;
    QRDBText13: TQRDBText;
    QRDBText14: TQRDBText;
    QRDBText15: TQRDBText;
    QRDBText16: TQRDBText;
    QRDBText17: TQRDBText;
    QRDBText18: TQRDBText;
    QRDBText19: TQRDBText;
    QRDBText20: TQRDBText;
    QRDBText23: TQRDBText;
    TitleBand1: TQRBand;
    ReportTitle: TQRLabel;
    QRLabel4: TQRLabel;
    bBack: TcxButton;
    QRDBText24: TQRDBText;
    QRDBText25: TQRDBText;
    btnSignatories: TcxButton;
    pnlSignatories: TPanel;
    Shape1: TShape;
    btnBranchManager: TcxButton;
    Label3: TLabel;
    cmbBranchManager: TcxComboBox;
    lblBranchManager: TQRLabel;
    btnCancel: TcxButton;
    QRDBText21: TQRDBText;
    Label2: TLabel;
    cmbAreaManager: TcxComboBox;
    lblAreaManager: TQRLabel;
    procedure bBackClick(Sender: TObject);
    procedure btnSignatoriesClick(Sender: TObject);
    procedure btnBranchManagerClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fPafPrint: TfPafPrint;

implementation

{$R *.dfm}

uses
  PafDataMod, FormUtil;

procedure TfPafPrint.bBackClick(Sender: TObject);
begin
  inherited;
  self.Close;
end;

procedure TfPafPrint.btnSignatoriesClick(Sender: TObject);
begin
  inherited;
  // show the signatories panel
  // set position relative to report viewer
  pnlSignatories.Top := Round((rvMain.Height/2) - (pStatus.Height/2));
  pnlSignatories.Left := Round((rvMain.Width/2) - (pStatus.Width/2));
  pnlSignatories.Visible := true;
end;

procedure TfPafPrint.FormCreate(Sender: TObject);
begin
  inherited;

  // set Branch Manager signatory
  with dmPaf do
  begin
    FormUtil.PopulateComboBox(dstPafBranchManagers,cmbBranchManager,'id_num',
      'employee_name_full');

    FormUtil.PopulateComboBox(dstPafBranchManagers,cmbAreaManager,'id_num',
      'employee_name_full');

    lblBranchManager.Caption :=
      dstPafSignatories.FieldByName('branch_manager').AsString;

    lblAreaManager.Caption :=
      dstPafSignatories.FieldByName('branch_manager').AsString;
  end;
end;

procedure TfPafPrint.btnBranchManagerClick(Sender: TObject);
begin
  inherited;
  if cmbBranchManager.ItemIndex > 0 then
    lblBranchManager.Caption := UpperCase(cmbBranchManager.Text)
  else
    lblBranchManager.Caption := '';

  if cmbAreaManager.ItemIndex > 0 then
    lblAreaManager.Caption := UpperCase(cmbAreaManager.Text)
  else
    lblAreaManager.Caption := '';

  pnlSignatories.Visible := false;

  qrMain.Prepare;
  rvMain.QRPrinter := qrMain.QRPrinter;
  rvMain.Update;
  qrMain.Preview;
end;

procedure TfPafPrint.btnCancelClick(Sender: TObject);
begin
  inherited;
  pnlSignatories.Visible := false;
end;

end.
