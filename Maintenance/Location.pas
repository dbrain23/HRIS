unit Location;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, BaseMaintenanceForm, Vcl.ImgList,
  Vcl.Grids, Vcl.DBGrids, JvExDBGrids, JvDBGrid, JvDBUltimGrid, JvExControls,
  JvXPCore, JvXPButtons, JvGroupHeader, Vcl.ExtCtrls, JvExExtCtrls,
  JvExtComponent, JvPanel, Vcl.ComCtrls, JvExComCtrls, JvComCtrls, Vcl.StdCtrls,
  JvExStdCtrls, JvEdit, JvLabel, DB, ADODB, cxGraphics, cxControls,
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
  cxDataStorage, cxEdit, cxNavigator, cxDBData, Vcl.Menus, cxButtons,
  cxGridLevel, cxClasses, cxGridCustomView, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGrid, cxDBLookupComboBox, cxTextEdit,
  cxContainer, cxPCdxBarPopupMenu, cxCheckListBox, cxPC, cxMemo, cxDBEdit,
  cxMaskEdit, cxDropDownEdit, cxLookupEdit, cxDBLookupEdit, cxCurrencyEdit;

type
  TfLocation = class(TfBaseMaintenanceForm)
    vListlocation_code: TcxGridDBColumn;
    vListlocation_name: TcxGridDBColumn;
    vListlocationtype_code: TcxGridDBColumn;
    tsDepartments: TTabSheet;
    pDetail: TPanel;
    JvGroupHeader1: TJvGroupHeader;
    JvGroupHeader4: TJvGroupHeader;
    JvLabel4: TJvLabel;
    JvLabel5: TJvLabel;
    JvLabel1: TJvLabel;
    cxButton1: TcxButton;
    cxButton2: TcxButton;
    cxButton3: TcxButton;
    cxButton4: TcxButton;
    edLocationCode: TcxDBTextEdit;
    edLocationName: TcxDBTextEdit;
    pcDepartments: TcxPageControl;
    tsPrivileges: TcxTabSheet;
    pDepartments: TPanel;
    clbDepartments: TcxCheckListBox;
    dbluLocationType: TcxDBLookupComboBox;
    tsAllowanceAvailability: TcxTabSheet;
    pAllowances: TPanel;
    gAllowanceTypes: TcxGrid;
    vAllowanceTypes: TcxGridDBTableView;
    lvlAllowanceTypes: TcxGridLevel;
    vAllowanceTypesallowancetype_code: TcxGridDBColumn;
    vAllowanceTypesallowance_amount: TcxGridDBColumn;
    bAddAllowanceType: TcxButton;
    bRemoveAllowanceType: TcxButton;
    vListarea_code: TcxGridDBColumn;
    dbluArea: TcxDBLookupComboBox;
    JvLabel2: TJvLabel;
    procedure miNewClick(Sender: TObject);
    procedure bSaveClick(Sender: TObject);
    procedure vListFocusedRecordChanged(Sender: TcxCustomGridTableView;
      APrevFocusedRecord, AFocusedRecord: TcxCustomGridRecord;
      ANewItemRecordFocusingChanged: Boolean);
    procedure vListCellDblClick(Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
    procedure bCancelClick(Sender: TObject);
    procedure dbluLocationTypePropertiesEditValueChanged(Sender: TObject);
    procedure bAddAllowanceTypeClick(Sender: TObject);
    procedure bRemoveAllowanceTypeClick(Sender: TObject);
    procedure edLocationCodePropertiesChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    procedure TickDepartments;
    procedure SaveDepartments;
    procedure GetAllowanceTypes;
    procedure SaveAllowanceTypes;
  public
    { Public declarations }
  end;

var
  fLocation: TfLocation;

implementation

{$R *.dfm}

uses MaintenanceDataMod, FormUtil, ListBoxObj, DBUtil;

procedure TfLocation.bAddAllowanceTypeClick(Sender: TObject);
begin
  inherited;
  vAllowanceTypes.DataController.DataSource.DataSet.Append;
end;

procedure TfLocation.bCancelClick(Sender: TObject);
begin
  inherited;
  TickDepartments;
end;

procedure TfLocation.bRemoveAllowanceTypeClick(Sender: TObject);
begin
  inherited;
  vAllowanceTypes.DataController.DataSource.DataSet.Delete;
end;

procedure TfLocation.bSaveClick(Sender: TObject);
begin
  vList.OnFocusedRecordChanged := nil;

  inherited;
  SaveDepartments;
  SaveAllowanceTypes;

  vList.OnFocusedRecordChanged := vListFocusedRecordChanged;
end;

procedure TfLocation.dbluLocationTypePropertiesEditValueChanged(
  Sender: TObject);
begin
  inherited;
  // clbDepartments.Enabled :=
  //  dbluLocationType.Properties.ListSource.DataSet.FieldByName('has_department').AsInteger = 1;
end;

procedure TfLocation.edLocationCodePropertiesChange(Sender: TObject);
begin
  inherited;
  GetAllowanceTypes;
end;

procedure TfLocation.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  OpenDropdownDataSources(pAllowances,false);
end;

procedure TfLocation.FormShow(Sender: TObject);
begin
  inherited;
  PopulateCheckListBox(dmMaintenance.dstDepartment, clbDepartments,
    'department_code', 'department_name');

  TickDepartments;

  OpenDropdownDataSources(pAllowances);
end;

procedure TfLocation.GetAllowanceTypes;
var
  locationCode: string;
begin
  locationCode :=
    vList.DataController.DataSource.DataSet.FieldByName('location_code').AsString;

  vAllowanceTypes.DataController.DataSource.DataSet.Close;
  TADODataSet(vAllowanceTypes.DataController.DataSource.DataSet).Parameters.ParamByName('@location_code').Value :=
      locationCode;
  vAllowanceTypes.DataController.DataSource.DataSet.Open;
end;

procedure TfLocation.miNewClick(Sender: TObject);
begin
  pcMaster.ActivePage := tsDepartments;
  inherited;
end;

procedure TfLocation.SaveAllowanceTypes;
begin
  (vAllowanceTypes.DataController.DataSource.DataSet as TADODataSet).UpdateBatch;
end;

procedure TfLocation.SaveDepartments;
var
  i, departmentCnt: integer;
  department: TListBoxObj;
  item: TcxCheckListBoxItem;
  locationCode: string;
begin
  locationCode :=
    vList.DataController.DataSource.DataSet.FieldByName('location_code').AsString;
  departmentCnt := clbDepartments.Items.Count;

  dmMaintenance.dstLocDepartment.Open;

  ExecuteSQL('exec dbo.hris_delete_departments ' + locationCode);

  department := TListBoxObj.Create;

  for i := 0 to departmentCnt - 1 do
  begin
    item := clbDepartments.Items.Items[i];
    if item.Checked then
    begin
      department := (item.ItemObject as TListBoxObj);

      dmMaintenance.dstLocDepartment.Append;
      dmMaintenance.dstLocDepartment.FieldByName('location_code').AsString :=
        locationCode;
      dmMaintenance.dstLocDepartment.FieldByName('department_code').AsString :=
        department.Code;
      dmMaintenance.dstLocDepartment.Post;
    end;
  end;

  dmMaintenance.dstLocDepartment.Close;
end;

procedure TfLocation.TickDepartments;
var
  department: TListBoxObj;
  item: TcxCheckListBoxItem;
  i, departmentCnt: integer;
  code: string;
begin
  // retrieve departments of selected location
  dmMaintenance.dstLocDepartment.Parameters.ParamByName('@location_code').Value :=
    vList.DataController.DataSource.DataSet.FieldByName('location_code').AsString;
  dmMaintenance.dstLocDepartment.Open;

  departmentCnt := clbDepartments.Items.Count;

  // uncheck all items
  for i := 0 to departmentCnt - 1 do
    clbDepartments.Items.Items[i].Checked := false;

  // loop thru the department list
  // and tick the matched department
  while not dmMaintenance.dstLocDepartment.Eof do
  begin
    code := dmMaintenance.dstLocDepartment.FieldByName('department_code').AsString;
    for i := 0 to departmentCnt - 1 do
    begin
      item := clbDepartments.Items.Items[i];
      department := (item.ItemObject as TListBoxObj);
      if department.Code = code then
      begin
        clbDepartments.Items.Items[i].Checked := true;
        break;
      end;
    end;

    dmMaintenance.dstLocDepartment.Next;
  end;

  dmMaintenance.dstLocDepartment.Close;
end;

procedure TfLocation.vListCellDblClick(Sender: TcxCustomGridTableView;
  ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
  AShift: TShiftState; var AHandled: Boolean);
begin
  inherited;
  pcMaster.ActivePage := tsDepartments;
end;

procedure TfLocation.vListFocusedRecordChanged(Sender: TcxCustomGridTableView;
  APrevFocusedRecord, AFocusedRecord: TcxCustomGridRecord;
  ANewItemRecordFocusingChanged: Boolean);
begin
  inherited;
  edLocationCode.Enabled :=
    vList.DataController.DataSource.DataSet.State = dsInsert;

  TickDepartments;
end;

end.
