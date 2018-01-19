unit GeneratePayroll;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, BasePopup, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit, dxSkinsCore,
  dxSkinBlack, dxSkinBlue, dxSkinBlueprint, dxSkinCaramel, dxSkinCoffee,
  dxSkinDarkRoom, dxSkinDarkSide, dxSkinDevExpressDarkStyle,
  dxSkinDevExpressStyle, dxSkinFoggy, dxSkinGlassOceans, dxSkinHighContrast,
  dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky, dxSkinLondonLiquidSky,
  dxSkinMcSkin, dxSkinMoneyTwins, dxSkinOffice2007Black, dxSkinOffice2007Blue,
  dxSkinOffice2007Green, dxSkinOffice2007Pink, dxSkinOffice2007Silver,
  dxSkinOffice2010Black, dxSkinOffice2010Blue, dxSkinOffice2010Silver,
  dxSkinPumpkin, dxSkinSeven, dxSkinSevenClassic, dxSkinSharp, dxSkinSharpPlus,
  dxSkinSilver, dxSkinSpringTime, dxSkinStardust, dxSkinSummer2008,
  dxSkinTheAsphaltWorld, dxSkinsDefaultPainters, dxSkinValentine, dxSkinVS2010,
  dxSkinWhiteprint, dxSkinXmas2008Blue, Vcl.StdCtrls, cxRadioGroup,
  JvExControls, JvGroupHeader, cxCheckBox, Vcl.Imaging.pngimage, Vcl.ExtCtrls,
  JvExExtCtrls, JvExtComponent, JvPanel, Vcl.Menus, cxButtons, PayrollGenerateParameters;

type
  TfrmGeneratePayroll = class(TfBasePopup)
    cbxCopyAdjustments: TcxCheckBox;
    JvGroupHeader1: TJvGroupHeader;
    JvGroupHeader2: TJvGroupHeader;
    cbxComputeDeductions: TcxRadioButton;
    cbxCopyDeductions: TcxRadioButton;
    lblEmployee: TLabel;
    btnGenerate: TcxButton;
    btnCancel: TcxButton;
    procedure btnCancelClick(Sender: TObject);
    procedure btnGenerateClick(Sender: TObject);
  private
    { Private declarations }
    LParameters: TPayrollGenerateParameters;
  public
    { Public declarations }
    // constructor Create(AOwner: TComponent); overload; override;
    constructor Create(AOwner: TComponent; AParameters: TPayrollGenerateParameters); reintroduce;

  end;

implementation

{$R *.dfm}

procedure TfrmGeneratePayroll.btnCancelClick(Sender: TObject);
begin
  inherited;
  ModalResult := mrCancel;
end;

procedure TfrmGeneratePayroll.btnGenerateClick(Sender: TObject);
begin
  // set the parameters
  LParameters.CopyDeductions := cbxCopyDeductions.Checked;
  LParameters.ComputeDeductions := cbxComputeDeductions.Checked;
  LParameters.CopyAdjustments := cbxCopyAdjustments.Checked;

  ModalResult := mrOk;
end;

//constructor TfrmGeneratePayroll.Create(AOwner: TComponent);
//begin
//  inherited Create(AOwner);
//end;

constructor TfrmGeneratePayroll.Create(AOwner: TComponent; AParameters: TPayrollGenerateParameters);
begin
  inherited Create(AOwner);
  LParameters := AParameters;

  if Assigned(AParameters.Employee) then
    lblEmployee.Caption := 'Employee: ' + AParameters.Employee.Name;
end;

end.
