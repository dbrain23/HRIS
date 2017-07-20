unit PayrollRecordMain2;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, BasePayrollMainForm, cxGraphics, cxLookAndFeels, cxLookAndFeelPainters,
  Menus, cxControls, dxSkinsCore, dxSkinBlack, dxSkinBlue, dxSkinCaramel,
  dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide, dxSkinFoggy, dxSkinGlassOceans,
  dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky, dxSkinLondonLiquidSky,
  dxSkinMcSkin, dxSkinMoneyTwins, dxSkinOffice2007Black, dxSkinOffice2007Blue,
  dxSkinOffice2007Green, dxSkinOffice2007Pink, dxSkinOffice2007Silver,
  dxSkinOffice2010Black, dxSkinOffice2010Blue, dxSkinOffice2010Silver,
  dxSkinPumpkin, dxSkinSeven, dxSkinSharp, dxSkinSilver, dxSkinSpringTime,
  dxSkinStardust, dxSkinSummer2008, dxSkinsDefaultPainters, dxSkinValentine,
  dxSkinXmas2008Blue, dxSkinscxPCPainter, cxContainer, cxEdit, cxStyles,
  cxCustomData, cxFilter, cxData, cxDataStorage, DB, cxDBData, ADODB,
  cxGridLevel, cxClasses, cxGridCustomView, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGrid, cxTextEdit, cxDBEdit, StdCtrls,
  cxGroupBox, cxPC, cxButtons, ExtCtrls, cxMaskEdit, cxDropDownEdit,
  cxCurrencyEdit, cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox, cxCheckBox,
  dxSkinBlueprint, dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle,
  dxSkinHighContrast, dxSkinSevenClassic, dxSkinSharpPlus,
  dxSkinTheAsphaltWorld, dxSkinVS2010, dxSkinWhiteprint, cxPCdxBarPopupMenu,
  cxNavigator;

type
  TfPayrollRecordMain2 = class(TfPayrollBaseMain)
    Label30: TLabel;
    cbxPayrolldate: TcxComboBox;
    Label2: TLabel;
    cbxLocation: TcxComboBox;
    p_FilterTop: TPanel;
    p_FilterAction: TPanel;
    b_GenerateCode: TcxButton;
    t_Days: TcxDBCurrencyEdit;
    t_Additional: TcxDBCurrencyEdit;
    t_Net: TcxDBCurrencyEdit;
    t_Rate: TcxDBCurrencyEdit;
    t_Regular: TcxDBCurrencyEdit;
    t_OTAM: TcxDBCurrencyEdit;
    t_OTAMHours: TcxDBCurrencyEdit;
    t_OTPM: TcxDBCurrencyEdit;
    t_OTPMHours: TcxDBCurrencyEdit;
    t_Gross: TcxDBCurrencyEdit;
    t_Deduction: TcxDBCurrencyEdit;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    pc_Detail: TcxPageControl;
    ts_Deduction: TcxTabSheet;
    ts_Additional: TcxTabSheet;
    grAdditional: TcxGrid;
    vwAdditional: TcxGridDBTableView;
    vwAdditionaladditional_id: TcxGridDBColumn;
    vwAdditionaladditional_amount: TcxGridDBColumn;
    vwAdditionalpa_remarks: TcxGridDBColumn;
    glAdditional: TcxGridLevel;
    cxDBTextEdit2: TcxDBTextEdit;
    cbxEmployee: TcxDBLookupComboBox;
    btDetailDelete: TcxButton;
    btDetailEdit: TcxButton;
    btDetailAdd: TcxButton;
    v_Masteremployee_id: TcxGridDBColumn;
    v_Masternumber_of_days: TcxGridDBColumn;
    v_Masterrate: TcxGridDBColumn;
    v_Masterot_am: TcxGridDBColumn;
    v_Masterot_pm: TcxGridDBColumn;
    btSearch: TcxButton;
    cxButton1: TcxButton;
    v_Mastergross_without_ot: TcxGridDBColumn;
    v_Masterot_pay_am: TcxGridDBColumn;
    v_Masterot_pay_pm: TcxGridDBColumn;
    v_Mastergross: TcxGridDBColumn;
    v_Masterdeduction: TcxGridDBColumn;
    v_Masteradditional: TcxGridDBColumn;
    v_Masternet: TcxGridDBColumn;
    grDeduction: TcxGrid;
    vwDeduction: TcxGridDBTableView;
    vwDeductiondt_id: TcxGridDBColumn;
    vwDeductionpd_amount: TcxGridDBColumn;
    vwDeductionremarks: TcxGridDBColumn;
    glDeduction: TcxGridLevel;
    cxs_Gross: TcxStyle;
    cxs_Deduction: TcxStyle;
    cxs_Additional: TcxStyle;
    cxs_Net: TcxStyle;
    cxGroupBox1: TcxGroupBox;
    cb_Status: TcxCheckBox;
    ts_Adjustment: TcxTabSheet;
    Label3: TLabel;
    t_Adjustment: TcxDBCurrencyEdit;
    grAdjustment: TcxGrid;
    vwAdjustment: TcxGridDBTableView;
    glAdjustment: TcxGridLevel;
    vwAdjustmentpadj_amount: TcxGridDBColumn;
    vwAdjustmentadjustmenttype_id: TcxGridDBColumn;
    vwAdjustmentpadj_remarks: TcxGridDBColumn;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

  type TString = class(TObject)
    public
      StringVal: string;
      PayrollStatus: string;
  end;

var
  fPayrollRecordMain2: TfPayrollRecordMain2;

implementation

{$R *.dfm}

uses AppConstant, PayrollDataMod;

begin

end.
