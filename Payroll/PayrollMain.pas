unit PayrollMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, BaseMainForm, cxGraphics, cxControls,
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
  cxDataStorage, cxEdit, cxNavigator, Data.DB, cxDBData, cxCalendar,
  cxImageComboBox, Vcl.StdCtrls, JvExStdCtrls, JvGroupBox, cxGridLevel,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxClasses,
  cxGridCustomView, cxGrid, Vcl.ExtCtrls, Vcl.ComCtrls, JvExComCtrls,
  JvComCtrls, Vcl.ImgList, JvExExtCtrls, JvExtComponent, JvPanel, cxContainer,
  cxTextEdit, cxMaskEdit, cxDropDownEdit, cxCurrencyEdit, cxDBLookupComboBox,
  Vcl.Menus, cxDBEdit, cxLookupEdit, cxDBLookupEdit, cxButtons, JvGroupHeader,
  JvExControls, JvLabel, cxCheckBox;

type
  TfPayrollMain = class(TfBaseMain)
    pcMain: TJvPageControl;
    tsPayroll: TTabSheet;
    pResult: TJvPanel;
    pGrid: TPanel;
    gList: TcxGrid;
    vList: TcxGridDBTableView;
    lvlList: TcxGridLevel;
    vListemployee_name: TcxGridDBColumn;
    vListgross: TcxGridDBColumn;
    vListdeduction: TcxGridDBColumn;
    vListallowance: TcxGridDBColumn;
    vListadjustment: TcxGridDBColumn;
    vListnet: TcxGridDBColumn;
    vListnumber_of_days: TcxGridDBColumn;
    vListundertime: TcxGridDBColumn;
    vListsalary: TcxGridDBColumn;
    vListleaves_with_pay: TcxGridDBColumn;
    vListleaves_without_pay: TcxGridDBColumn;
    pnlSearch: TPanel;
    Label1: TLabel;
    edEmployeeSearch: TcxTextEdit;
    csrPayroll: TcxStyleRepository;
    csSelectedRow: TcxStyle;
    procedure FormCreate(Sender: TObject);
    procedure vListDblClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure vListCustomDrawCell(Sender: TcxCustomGridTableView;
      ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo;
      var ADone: Boolean);
    procedure edEmployeeSearchPropertiesChange(Sender: TObject);
  private
    { Private declarations }
    procedure SearchEmployee;
  public
    { Public declarations }
  end;

var
  fPayrollMain: TfPayrollMain;

implementation

{$R *.dfm}

uses
  FormUtil, PayrollDataMod, ComboBoxObj, PayrollRecord, DBUtil, AppConstant,
  PayrollDependents;

procedure TfPayrollMain.edEmployeeSearchPropertiesChange(Sender: TObject);
begin
  inherited;
  SearchEmployee;
end;

procedure TfPayrollMain.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  vList.DataController.DataSet.Filter := '';
  vList.DataController.DataSet.Close;
end;

procedure TfPayrollMain.FormCreate(Sender: TObject);
begin
  inherited;
  vList.DataController.DataSet.Open;
end;

procedure TfPayrollMain.SearchEmployee;
begin
  vList.DataController.DataSet.Locate('employee_name',edEmployeeSearch.Text,
    [loPartialKey,loCaseInsensitive]);
end;

procedure TfPayrollMain.vListCustomDrawCell(Sender: TcxCustomGridTableView;
  ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo;
  var ADone: Boolean);
const
  NETCOL = 10;
begin
  if Sender.DataController.GetValue(AViewInfo.GridRecord.RecordIndex, NETCOL) < 0 then
    ACanvas.Brush.Color := $00CACAFF;
end;

procedure TfPayrollMain.vListDblClick(Sender: TObject);
var
  form: TfPayrollRecord;
begin
  if vList.DataController.DataSet.RecordCount > 0 then
  begin
    form := TfPayrollRecord.Create(self);
    DockForm(self.Parent.Parent.Parent.Parent, form);
  end;
end;

end.
