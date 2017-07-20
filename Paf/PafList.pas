unit PafList;

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
  dxSkinXmas2008Blue, cxControls, cxContainer, cxEdit, cxStyles,
  dxSkinscxPCPainter, cxCustomData, cxFilter, cxData, cxDataStorage,
  cxNavigator, Data.DB, cxDBData, cxGridLevel, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxClasses, cxGridCustomView, cxGrid,
  cxTextEdit, Vcl.StdCtrls, cxButtons, Vcl.ExtCtrls, JvExExtCtrls, JvRadioGroup,
  JvGroupHeader, JvExControls, JvLabel, JvExStdCtrls, JvGroupBox,
  JvExtComponent, JvPanel, Vcl.ComCtrls, JvExComCtrls, JvComCtrls, Vcl.ImgList,
  cxGridCustomLayoutView, cxGridCardView, cxGridDBCardView, cxImage,
  cxImageComboBox, cxCurrencyEdit, cxGridBandedTableView,
  cxGridDBBandedTableView, JvSpeedButton, Employee, cxCheckBox, cxDBEdit,
  cxCalendar, System.Actions, Vcl.ActnList, cxRadioGroup;

type
  TfPafList = class(TfBase)
    ilBaseMain: TImageList;
    pcMaster: TJvPageControl;
    tsPafList: TTabSheet;
    pParams: TJvPanel;
    gbParams: TJvGroupBox;
    JvLabel1: TJvLabel;
    JvLabel2: TJvLabel;
    JvGroupHeader3: TJvGroupHeader;
    edLastname: TcxTextEdit;
    edFirstname: TcxTextEdit;
    pResult: TJvPanel;
    gList: TcxGrid;
    vList: TcxGridDBTableView;
    lvlList: TcxGridLevel;
    vListemployee_name: TcxGridDBColumn;
    vListposition_name: TcxGridDBColumn;
    vListposstatus_name: TcxGridDBColumn;
    vListeffective_date: TcxGridDBColumn;
    vListDetail: TcxGridDBCardView;
    vListDetailpaf_id: TcxGridDBCardViewRow;
    vListDetailemployee_name: TcxGridDBCardViewRow;
    vListDetailposition_name: TcxGridDBCardViewRow;
    vListDetailposstatus_name: TcxGridDBCardViewRow;
    vListDetailempstatus_name: TcxGridDBCardViewRow;
    vListDetailbranch_name: TcxGridDBCardViewRow;
    vListDetailsalary: TcxGridDBCardViewRow;
    vListDetaileffective_date: TcxGridDBCardViewRow;
    gListCardView1: TcxGridCardView;
    vListrank_movement: TcxGridDBColumn;
    ilList: TImageList;
    vListsalary: TcxGridDBColumn;
    gListDBTableView1: TcxGridDBTableView;
    gListDBTableView1pafallowance_id: TcxGridDBColumn;
    gListDBTableView1paf_id: TcxGridDBColumn;
    gListDBTableView1allowance_amount: TcxGridDBColumn;
    gListDBTableView1allowancetype_code: TcxGridDBColumn;
    gListTableView1: TcxGridTableView;
    gListDBBandedTableView1: TcxGridDBBandedTableView;
    gListDBCardView1: TcxGridDBCardView;
    gListDBCardView1paf_id: TcxGridDBCardViewRow;
    gListDBCardView1effective_date: TcxGridDBCardViewRow;
    gListDBCardView1effective_until: TcxGridDBCardViewRow;
    gListDBCardView1employee_id: TcxGridDBCardViewRow;
    gListDBCardView1salary: TcxGridDBCardViewRow;
    gListDBCardView1position_code: TcxGridDBCardViewRow;
    gListDBCardView1empstatus_code: TcxGridDBCardViewRow;
    gListDBCardView1posstatus_code: TcxGridDBCardViewRow;
    gListDBCardView1branch_code: TcxGridDBCardViewRow;
    gListDBCardView1paf_remarks: TcxGridDBCardViewRow;
    gListDBCardView1rank_movement: TcxGridDBCardViewRow;
    bSelect: TcxButton;
    bClientSearch: TJvSpeedButton;
    JvLabel3: TJvLabel;
    edMiddlename: TcxTextEdit;
    bClear: TcxButton;
    JvGroupHeader1: TJvGroupHeader;
    alPaf: TActionList;
    acFilterList: TAction;
    rbPending: TcxRadioButton;
    rbApproved: TcxRadioButton;
    cbxCancelled: TcxCheckBox;
    procedure vListDblClick(Sender: TObject);
    procedure bClientSearchClick(Sender: TObject);
    procedure bClearClick(Sender: TObject);
    procedure cbxShowCancelledClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure acFilterListExecute(Sender: TObject);
  private
    fEmployee: TEmployee;
    { Private declarations }
    procedure FilterList;
  public
    { Public declarations }
    property Employee: TEmployee write fEmployee;
    procedure SetEmployeeName;
    procedure SearchPaf;
  end;

var
  fPafList: TfPafList;

implementation

{$R *.dfm}

uses PafDataMod, PafMain, PafObj, EmployeeSearch, SecurityDataMod, AppConstant;

procedure TfPafList.SetEmployeeName;
begin
  edLastname.Text := fEmployee.EmployeeLastname;
  edFirstname.Text := fEmployee.EmployeeFirstname;
  edMiddlename.Text := fEmployee.EmployeeMiddlename;
end;

procedure TfPafList.SearchPaf;
begin
  //set parameters then search
  dmPaf.dstPafList.Close;
  if Assigned(fEmployee) then
    dmPaf.dstPafList.Parameters.ParamByName('@id_num').Value :=
      fEmployee.EmployeeIdNo
  else
    dmPaf.dstPafList.Parameters.ParamByName('@id_num').Value := null;

  dmPaf.dstPafList.Parameters.ParamByName('@user_id_num').Value :=
    dmSecurity.User.UserIdNum;

  dmPaf.dstPafList.Open;
end;

procedure TfPafList.acFilterListExecute(Sender: TObject);
begin
  inherited;
  FilterList;
end;

procedure TfPafList.bClearClick(Sender: TObject);
begin
  edLastname.Clear;
  edFirstname.Clear;
  edMiddlename.Clear;

  //reset employee object
  fEmployee := nil;

  //search paf to refresh grid
  SearchPaf;
end;

procedure TfPafList.bClientSearchClick(Sender: TObject);
var
  form: TfEmployeeSearch;
begin
  //search Employee
  try
    form := TfEmployeeSearch.Create(self);
    form.ManualDock(self);
    form.Show;
  finally
  end;
end;

procedure TfPafList.cbxShowCancelledClick(Sender: TObject);
begin
  vList.DataController.DataSource.DataSet.Filtered :=
    not (Sender as TcxCheckBox).Checked;
end;

procedure TfPafList.FilterList;
var
  filter: string;
  i: integer;
begin
  if rbPending.Checked then
    filter := '((pafstatus_code = ' + QuotedStr(TAppConstant.TPafStatus.PENDING) + ')'
  else if rbApproved.Checked then
    filter := '((pafstatus_code = ' + QuotedStr(TAppConstant.TPafStatus.APPROVED) + ')';

  // add cancelled filter
  filter := filter + ' AND (is_cancelled = ' + IntToStr(Ord(cbxCancelled.Checked))+ '))';

  vList.DataController.DataSet.Filter := filter;
  vList.DataController.DataSet.Filtered := filter <> '';
end;

procedure TfPafList.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  dmPaf.dstPafList.Close;
end;

procedure TfPafList.FormCreate(Sender: TObject);
begin
  SearchPaf;
  FilterList;
end;

procedure TfPafList.vListDblClick(Sender: TObject);
var
  rtnEmployee: TEmployee;
  rtnPaf: TPaf;
  form: TfPafMain;
begin
  //just exit if grid is empty
  if vList.DataController.DataSource.DataSet.IsEmpty then
    exit;

  //set Employee object for Paf object
  rtnEmployee := TEmployee.Create;

  rtnEmployee.EmployeeIdNo :=
    vList.DataController.DataSource.DataSet.FieldByName('id_num').AsString;
  rtnEmployee.EmployeeFirstname :=
    vList.DataController.DataSource.DataSet.FieldByName('employee_firstname').AsString;
  rtnEmployee.EmployeeLastname :=
    vList.DataController.DataSource.DataSet.FieldByName('employee_lastname').AsString;
  rtnEmployee.EmployeeMiddlename :=
    vList.DataController.DataSource.DataSet.FieldByName('employee_middlename').AsString;
  rtnEmployee.IsExternal :=
    vList.DataController.DataSource.DataSet.FieldByName('is_external').AsInteger = 1;

  //set Paf object
  rtnPaf := TPaf.Create;

  rtnPaf.PafId :=
    vList.DataController.DataSource.DataSet.FieldByName('paf_id').AsInteger;
  rtnPaf.Employee := rtnEmployee;

  dmPaf.PafObj := rtnPaf;

  //open Paf window
  form := TfPafMain.Create(self);
  form.SetEmployeeName;

  form.ManualDock(self);
  form.Show;
end;

end.
