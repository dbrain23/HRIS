unit EmployeeAddress;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, BaseForm, Vcl.ImgList, Vcl.StdCtrls,
  JvExStdCtrls, JvButton, JvCtrls, JvExControls, JvGroupHeader, JvXPCore,
  JvXPButtons, Vcl.ComCtrls, JvExComCtrls, JvComCtrls, Vcl.ExtCtrls,
  JvExExtCtrls, JvExtComponent, JvPanel, JvLabel, JvEdit, JvDBLookup, JvCheckBox,
  cxGraphics, cxLookAndFeels, cxLookAndFeelPainters, Vcl.Menus, dxSkinsCore,
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
  dxSkinWhiteprint, dxSkinXmas2008Blue, cxButtons, cxControls, cxContainer,
  cxEdit, cxDBEdit, cxTextEdit, cxMemo, cxMaskEdit, cxDropDownEdit,
  cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox, cxCheckBox;

type
  TfEmployeeAddress = class(TfBase)
    pcMaster: TJvPageControl;
    tsMaster: TTabSheet;
    ghAction: TJvGroupHeader;
    pDetails: TJvPanel;
    JvGroupHeader2: TJvGroupHeader;
    JvGroupHeader4: TJvGroupHeader;
    JvGroupHeader5: TJvGroupHeader;
    pPresentAddress: TJvPanel;
    JvLabel1: TJvLabel;
    JvGroupHeader1: TJvGroupHeader;
    JvLabel8: TJvLabel;
    JvLabel12: TJvLabel;
    JvGroupHeader3: TJvGroupHeader;
    JvLabel2: TJvLabel;
    JvLabel3: TJvLabel;
    JvLabel4: TJvLabel;
    JvLabel5: TJvLabel;
    JvLabel6: TJvLabel;
    JvLabel7: TJvLabel;
    JvLabel9: TJvLabel;
    JvLabel10: TJvLabel;
    JvLabel11: TJvLabel;
    JvLabel13: TJvLabel;
    JvLabel14: TJvLabel;
    JvLabel15: TJvLabel;
    JvLabel16: TJvLabel;
    JvLabel17: TJvLabel;
    bSave: TcxButton;
    bCancel: TcxButton;
    cxDBMemo1: TcxDBMemo;
    cxDBTextEdit1: TcxDBTextEdit;
    cxDBLookupComboBox1: TcxDBLookupComboBox;
    cxDBTextEdit2: TcxDBTextEdit;
    cxDBTextEdit3: TcxDBTextEdit;
    cxDBTextEdit4: TcxDBTextEdit;
    cxDBMemo2: TcxDBMemo;
    cxDBTextEdit5: TcxDBTextEdit;
    cxDBLookupComboBox2: TcxDBLookupComboBox;
    cxDBTextEdit6: TcxDBTextEdit;
    cxDBTextEdit7: TcxDBTextEdit;
    cxDBTextEdit8: TcxDBTextEdit;
    cbxIsHome: TcxDBCheckBox;
    cxDBTextEdit9: TcxDBTextEdit;
    cxDBMemo3: TcxDBMemo;
    cxDBTextEdit10: TcxDBTextEdit;
    cxDBTextEdit11: TcxDBTextEdit;
    cxDBTextEdit12: TcxDBTextEdit;
    ilBaseTab: TcxImageList;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure cbxIsHomeClick(Sender: TObject);
    procedure bSaveClick(Sender: TObject);
    procedure bCancelClick(Sender: TObject);
  private
    { Private declarations }
    procedure OpenDataSets;
    procedure CloseDataSets;
  public
    { Public declarations }
  end;

var
  fEmployeeAddress: TfEmployeeAddress;

implementation

{$R *.dfm}

uses EmployeeDataMod;

procedure TfEmployeeAddress.bCancelClick(Sender: TObject);
begin
  //cancel
  dmEmployee.dstEmpAddressH.Cancel;
  dmEmployee.dstEmpAddressP.Cancel;
  dmEmployee.dstEmpContactH.Cancel;
  dmEmployee.dstEmpContactP.Cancel;
  dmEmployee.dstEmpEmergency.Cancel;
end;

procedure TfEmployeeAddress.bSaveClick(Sender: TObject);
begin
  //save
  dmEmployee.dstEmpAddressH.Post;
  dmEmployee.dstEmpAddressP.Post;
  dmEmployee.dstEmpContactH.Post;
  dmEmployee.dstEmpContactP.Post;
  dmEmployee.dstEmpEmergency.Post;
end;

procedure TfEmployeeAddress.cbxIsHomeClick(Sender: TObject);
begin
  pPresentAddress.Enabled := not cbxIsHome.Checked;
end;

procedure TfEmployeeAddress.CloseDataSets;
begin
  dmEmployee.dstEmpAddressH.Close;
  dmEmployee.dstEmpAddressP.Close;
  dmEmployee.dstEmpContactH.Close;
  dmEmployee.dstEmpContactP.Close;
  dmEmployee.dstEmpEmergency.Close;
  dmEmployee.dstTowns.Close;
end;

procedure TfEmployeeAddress.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  CloseDataSets;
  inherited;
end;

procedure TfEmployeeAddress.FormShow(Sender: TObject);
begin
  OpenDataSets;
end;

procedure TfEmployeeAddress.OpenDataSets;
begin
  dmEmployee.dstEmpAddressH.Open;
  dmEmployee.dstEmpAddressP.Open;
  dmEmployee.dstEmpContactH.Open;
  dmEmployee.dstEmpContactP.Open;
  dmEmployee.dstEmpEmergency.Open;
  dmEmployee.dstTowns.Open;
end;

end.
