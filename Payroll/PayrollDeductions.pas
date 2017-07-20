unit PayrollDeductions;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, BaseMainForm, Vcl.ImgList, cxGraphics,
  Vcl.ExtCtrls, JvExExtCtrls, JvExtComponent, JvPanel, Vcl.Grids, AdvObj,
  BaseGrid, AdvGrid, Vcl.ComCtrls, JvExComCtrls, JvComCtrls, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxStyles, dxSkinsCore, dxSkinBlack,
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
  dxSkinXmas2008Blue, dxSkinscxPCPainter, cxCustomData, cxFilter, cxData,
  cxDataStorage, cxEdit, cxNavigator, Data.DB, cxDBData, cxDBLookupComboBox,
  cxCurrencyEdit, cxGridLevel, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxClasses, cxGridCustomView, cxGrid, cxContainer,
  cxTextEdit, Vcl.StdCtrls, cxMaskEdit, cxDropDownEdit, Vcl.Menus, cxButtons;

type
  TfPayrollDeductions = class(TfBaseMain)
    pcMain: TJvPageControl;
    tsPayroll: TTabSheet;
    pResult: TJvPanel;
    pGrid: TPanel;
    grDeduction: TcxGrid;
    vwDeduction: TcxGridDBTableView;
    vwDeductionemployee: TcxGridDBColumn;
    vwDeductiondeduction_amount: TcxGridDBColumn;
    vwDeductionbcf_amount: TcxGridDBColumn;
    vwDeductionbcf_sub_location_code: TcxGridDBColumn;
    lvlDeduction: TcxGridLevel;
    pnlSearch: TPanel;
    Label1: TLabel;
    cmbDeductionTypes: TcxComboBox;
    bSave: TcxButton;
    procedure FormCreate(Sender: TObject);
    procedure cmbDeductionTypesClick(Sender: TObject);
    procedure bSaveClick(Sender: TObject);
    procedure vwDeductionEditing(Sender: TcxCustomGridTableView;
      AItem: TcxCustomGridTableItem; var AAllow: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fPayrollDeductions: TfPayrollDeductions;

implementation

{$R *.dfm}

uses
  PayrollDataMod, FormUtil, ComboBoxObj;

procedure TfPayrollDeductions.bSaveClick(Sender: TObject);
begin
  inherited;
  with dmPayroll.dstDeductionsAll do
  begin
    if State in [dsInsert,dsEdit] then
      Post;

    UpdateBatch;
  end;
end;

procedure TfPayrollDeductions.cmbDeductionTypesClick(Sender: TObject);
begin
  inherited;
  with dmPayroll.dstDeductionsAll do
  begin
    Close;
    Parameters.ParamByName('@type_code').Value :=
      (cmbDeductionTypes.ItemObject as TComboBoxObj).Code;
    Open;
  end;
end;

procedure TfPayrollDeductions.FormCreate(Sender: TObject);
begin
  inherited;
  OpenGridDataSources([grDeduction]);

  PopulateComboBox(dmPayroll.dstDeductionTypes,cmbDeductionTypes,
    'deductiontype_code','deductiontype_name');
end;

procedure TfPayrollDeductions.vwDeductionEditing(Sender: TcxCustomGridTableView;
  AItem: TcxCustomGridTableItem; var AAllow: Boolean);
begin
  if ((AItem as TcxGridDBColumn).DataBinding.FieldName = 'bcf_amount')
    or ((AItem as TcxGridDBColumn).DataBinding.FieldName = 'bcf_sub_location_code') then
    AAllow := vwDeduction.DataController.DataSet.FieldByName('has_bcf').AsInteger = 1;
end;

end.
