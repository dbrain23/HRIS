unit SysRole;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, BaseMaintenanceForm, cxGraphics,
  cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxStyles, dxSkinsCore,
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
  dxSkinWhiteprint, dxSkinXmas2008Blue, dxSkinscxPCPainter, cxCustomData,
  cxFilter, cxData, cxDataStorage, cxEdit, cxNavigator, Data.DB, cxDBData,
  Vcl.Menus, Vcl.ImgList, Vcl.StdCtrls, cxButtons, cxGridLevel, cxClasses,
  cxGridCustomView, cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  cxGrid, JvExControls, JvGroupHeader, Vcl.ExtCtrls, JvExExtCtrls,
  JvExtComponent, JvPanel, Vcl.ComCtrls, JvExComCtrls, JvComCtrls, cxContainer,
  cxCheckListBox, cxTextEdit, cxPCdxBarPopupMenu, cxPC, cxDBEdit, JvLabel,
  cxMemo;

type
  TfSysRole = class(TfBaseMaintenanceForm)
    JvGroupHeader2: TJvGroupHeader;
    vListrole_code: TcxGridDBColumn;
    vListrole_name: TcxGridDBColumn;
    vListrole_description: TcxGridDBColumn;
    tsDetail: TTabSheet;
    pDetail: TPanel;
    JvGroupHeader1: TJvGroupHeader;
    JvGroupHeader4: TJvGroupHeader;
    cxButton1: TcxButton;
    cxButton2: TcxButton;
    cxButton3: TcxButton;
    cxButton4: TcxButton;
    JvLabel4: TJvLabel;
    JvLabel5: TJvLabel;
    edRoleCode: TcxDBTextEdit;
    JvLabel1: TJvLabel;
    mmDescription: TcxDBMemo;
    edRoleName: TcxDBTextEdit;
    pcPrivLevel: TcxPageControl;
    tsPrivileges: TcxTabSheet;
    tsLevels: TcxTabSheet;
    pPrivileges: TPanel;
    clbPrivileges: TcxCheckListBox;
    Panel1: TPanel;
    clbLevels: TcxCheckListBox;
    procedure bSaveClick(Sender: TObject);
    procedure vListFocusedRecordChanged(Sender: TcxCustomGridTableView;
      APrevFocusedRecord, AFocusedRecord: TcxCustomGridRecord;
      ANewItemRecordFocusingChanged: Boolean);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure bCancelClick(Sender: TObject);
    procedure miNewClick(Sender: TObject);
    procedure vListCellDblClick(Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
    procedure clbPrivilegesClickCheck(Sender: TObject; AIndex: Integer;
      APrevState, ANewState: TcxCheckBoxState);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    function GetPafViewPrivilegeCode: string;
    procedure TickPrivileges;
    procedure TickLevels;
    procedure SavePrivileges;
    procedure SaveLevels;
    procedure UnTickLevels;
  public
    { Public declarations }
  end;

var
  fSysRole: TfSysRole;

implementation

uses SecurityDataMod, DBUtil, AppConstant, FormUtil, ListBoxObj;

{$R *.dfm}

function TfSysRole.GetPafViewPrivilegeCode: string;
var
  sl: TStringList;
begin
  sl := TStringList.Create;
  sl.Delimiter := TAppConstant.TGeneral.DELIMITER;
  sl.DelimitedText := TAppConstant.TPrivilege.PAF_VIEW;

  Result := sl[0];
end;

procedure TfSysRole.UnTickLevels;
var
  i, levelCnt: integer;
begin
  // uncheck all items
  levelCnt := clbLevels.Items.Count;

  for i := 0 to levelCnt - 1 do
    clbLevels.Items.Items[i].Checked := false;
end;

procedure TfSysRole.SavePrivileges;
var
  i, privilegeCnt: integer;
  sysPrivilege: TListBoxObj;
  item: TcxCheckListBoxItem;
  roleCode: string;
begin
  roleCode :=
    vList.DataController.DataSource.DataSet.FieldByName('role_code').AsString;
  privilegeCnt := clbPrivileges.Items.Count;

  dmSecurity.dstRolePrivileges.Open;

  ExecuteSQL('exec dbo.sec_delete_privileges ' + roleCode);

  sysPrivilege := TListBoxObj.Create;

  for i := 0 to privilegeCnt - 1 do
  begin
    item := clbPrivileges.Items.Items[i];
    if item.Checked then
    begin
      sysPrivilege := (item.ItemObject as TListBoxObj);

      dmSecurity.dstRolePrivileges.Append;
      dmSecurity.dstRolePrivileges.FieldByName('role_code').AsString :=
        roleCode;
      dmSecurity.dstRolePrivileges.FieldByName('privilege_code').AsString :=
        sysPrivilege.Code;
      dmSecurity.dstRolePrivileges.Post;
    end;
  end;

  dmSecurity.dstRolePrivileges.Close;
end;

procedure TfSysRole.TickPrivileges;
var
  sysPriv: TListBoxObj;
  item: TcxCheckListBoxItem;
  i, privilegeCnt: integer;
  code: string;
begin
  // retrieve privileges of selected role
  dmSecurity.dstRolePrivileges.Parameters.ParamByName('@role_code').Value :=
    vList.DataController.DataSource.DataSet.FieldByName('role_code').AsString;
  dmSecurity.dstRolePrivileges.Open;

  privilegeCnt := clbPrivileges.Items.Count;

  // uncheck all items
  for i := 0 to privilegeCnt - 1 do
    clbPrivileges.Items.Items[i].Checked := false;

  // disable levels listbox initially
  clbLevels.Enabled := false;

  // loop thru the roles list
  // and tick the matched role
  while not dmSecurity.dstRolePrivileges.Eof do
  begin
    code := dmSecurity.dstRolePrivileges.FieldByName('privilege_code').AsString;
    for i := 0 to privilegeCnt - 1 do
    begin
      item := clbPrivileges.Items.Items[i];
      sysPriv := (item.ItemObject as TListBoxObj);
      if sysPriv.Code = code then
      begin
        clbPrivileges.Items.Items[i].Checked := true;
        break;
      end;
    end;

    if code = GetPafViewPrivilegeCode then
        clbLevels.Enabled := true;

    dmSecurity.dstRolePrivileges.Next;
  end;

  dmSecurity.dstRolePrivileges.Close;
end;

procedure TfSysRole.SaveLevels;
var
  i, levelCnt: integer;
  level: TListBoxObj;
  item: TcxCheckListBoxItem;
  roleCode: string;
begin
  roleCode :=
      vList.DataController.DataSource.DataSet.FieldByName('role_code').AsString;

  ExecuteSQL('exec dbo.sec_delete_levels ' + roleCode);

  // check if listbox is enabled
  // don't save levels if disabled
  // disabled means PAF_VIEW privilege is not selected
  // refer to the "clbPrivilegesClickCheck" event
  // for disabling the listbox
  if clbLevels.Enabled then
  begin
    levelCnt := clbLevels.Items.Count;

    dmSecurity.dstRoleLevels.Open;

    level := TListBoxObj.Create;

    for i := 0 to levelCnt - 1 do
    begin
      item := clbLevels.Items.Items[i];
      if item.Checked then
      begin
        level := (item.ItemObject as TListBoxObj);

        dmSecurity.dstRoleLevels.Append;
        dmSecurity.dstRoleLevels.FieldByName('role_code').AsString :=
          roleCode;
        dmSecurity.dstRoleLevels.FieldByName('level_code').AsString :=
          level.Code;
        dmSecurity.dstRoleLevels.Post;
      end;
    end;

    dmSecurity.dstRoleLevels.Close;
  end
  else
    UnTickLevels;
end;

procedure TfSysRole.TickLevels;
var
  level: TListBoxObj;
  item: TcxCheckListBoxItem;
  i, levelCnt: integer;
  code: string;
begin
  // retrieve levels of selected role
  dmSecurity.dstRoleLevels.Parameters.ParamByName('@role_code').Value :=
    vList.DataController.DataSource.DataSet.FieldByName('role_code').AsString;
  dmSecurity.dstRoleLevels.Open;

  UnTickLevels;

  levelCnt := clbLevels.Items.Count;

  // loop thru the levels list
  // and tick the matched level
  while not dmSecurity.dstRoleLevels.Eof do
  begin
    code := dmSecurity.dstRoleLevels.FieldByName('level_code').AsString;
    for i := 0 to levelCnt - 1 do
    begin
      item := clbLevels.Items.Items[i];
      level := (item.ItemObject as TListBoxObj);
      if level.Code = code then
      begin
        clbLevels.Items.Items[i].Checked := true;
        break;
      end;
    end;

    dmSecurity.dstRoleLevels.Next;
  end;

  dmSecurity.dstRoleLevels.Close;
end;

procedure TfSysRole.vListCellDblClick(Sender: TcxCustomGridTableView;
  ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
  AShift: TShiftState; var AHandled: Boolean);
begin
  inherited;
  pcMaster.ActivePage := tsDetail;
end;

procedure TfSysRole.vListFocusedRecordChanged(Sender: TcxCustomGridTableView;
  APrevFocusedRecord, AFocusedRecord: TcxCustomGridRecord;
  ANewItemRecordFocusingChanged: Boolean);
begin
  inherited;
  TickPrivileges;
  TickLevels;
  edRoleCode.Enabled :=
    vList.DataController.DataSource.DataSet.State = dsInsert;

  if edRoleCode.Enabled then
    edRoleCode.SetFocus;
end;

procedure TfSysRole.bCancelClick(Sender: TObject);
begin
  inherited;
  TickPrivileges;
  TickLevels;
end;

procedure TfSysRole.bSaveClick(Sender: TObject);
begin
  // disable focus record changed event
  // as this unticks all privileges prior to saving changes
  vList.OnFocusedRecordChanged := nil;

  inherited;
  SavePrivileges;
  SaveLevels;

  vList.OnFocusedRecordChanged := vListFocusedRecordChanged;
end;

procedure TfSysRole.clbPrivilegesClickCheck(Sender: TObject; AIndex: Integer;
  APrevState, ANewState: TcxCheckBoxState);
var
  sysPriv: TListBoxObj;
begin
  sysPriv := TListBoxObj.Create;
  sysPriv := clbPrivileges.Items[AIndex].ItemObject as TListBoxObj;

  if sysPriv.Code = GetPafViewPrivilegeCode then
    clbLevels.Enabled := ANewState = cbsChecked;
end;

procedure TfSysRole.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  vList.OnFocusedRecordChanged := nil;
  vList.DataController.DataSource.DataSet.Close;
  inherited;
end;

procedure TfSysRole.FormShow(Sender: TObject);
begin
  inherited;
  PopulateCheckListBox(dmSecurity.dstPrivileges, clbPrivileges,
    'privilege_code', 'privilege_name');
  PopulateCheckListBox(dmSecurity.dstLevel, clbLevels,
    'level_code', 'level_name');

  TickPrivileges;
  TickLevels;

  clbPrivileges.Enabled :=
    dmSecurity.User.HasPrivileges([TAppConstant.TPrivilege.ROLE_MODIFY],false);

  pcPrivLevel.ActivePage := tsPrivileges;
end;

procedure TfSysRole.miNewClick(Sender: TObject);
begin
  if not dmSecurity.User.HasPrivileges([TAppConstant.TPrivilege.ROLE_NEW]) then
    exit;

  pcMaster.ActivePage := tsDetail;
  pcPrivLevel.ActivePage := tsPrivileges;
  inherited;
end;

end.
