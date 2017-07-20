unit EmployeeDrawer;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.ComCtrls,
  JvExComCtrls, JvComCtrls, Vcl.ImgList, Vcl.Menus, BaseForm, JvExControls,
  JvGradient, Vcl.StdCtrls, JvExExtCtrls, JvExtComponent, JvPanel, DB,
  cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters, dxSkinsCore,
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
  dxSkinWhiteprint, dxSkinXmas2008Blue, cxContainer, cxEdit, cxTreeView;

type
  TfEmployeeDrawer = class(TfBase)
    pLeft: TPanel;
    pDock: TPanel;
    tvEmployee: TcxTreeView;
    procedure FormCreate(Sender: TObject);
    procedure tvEmployeeChange(Sender: TObject; Node: TTreeNode);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    function OpenPaf(const selectedIndex: integer): TForm;
    procedure PopulatePafNode;
  public
    { Public declarations }
    procedure SetHeaderCaption;
    procedure SetNodesAccess;
  end;

const
  PERSONAL_NODE = 2;
  PAF_NODE      = 15;

var
  fEmployeeDrawer: TfEmployeeDrawer;

implementation

{$R *.dfm}

uses EmployeeMain, EmployeeAddress, EmployeeFamily, EmployeeDataMod, PafDataMod,
  PafMain, Employee, PafObj, AppConstant, SecurityDataMod, FormUtil;

function TfEmployeeDrawer.OpenPaf(const selectedIndex: integer): TForm;
var
  rtnPaf: TPaf;
  form: TfPafMain;
begin
  //set Paf object
  rtnPaf := TPaf.Create;

  rtnPaf.PafId := selectedIndex;
  rtnPaf.Employee := dmEmployee.Employee;

  dmPaf.PafObj := rtnPaf;

  // check if another paf is
  // docked.. destroy the form
  // before creating a new one
  // this forces all events in
  // the constructor to fire
  if pDock.ControlCount > 0 then
    if pDock.Controls[0] is TfPafMain then
       (pDock.Controls[0] as TfPafMain).Free;

  form := TfPafMain.Create(self);
  form.SetEmployeeName;

  Result := form;
end;

procedure TfEmployeeDrawer.SetNodesAccess;
var
  cnt: integer;
  i: integer;
begin
  exit;
  cnt := tvEmployee.Items[0].Count;

  for i := 1 to cnt do
    tvEmployee.Items[0].Item[i-1].Enabled := dmEmployee.dstEmployee.State <> dsInsert;
end;

procedure TfEmployeeDrawer.SetHeaderCaption;
begin
  tvEmployee.Items[0].Text := dmEmployee.Employee.EmployeeIdNo + ' - ' +
                              dmEmployee.Employee.EmployeeLastName + ', ' +
                              dmEmployee.Employee.EmployeeFirstName;
end;

procedure TfEmployeeDrawer.FormCreate(Sender: TObject);
begin
  inherited;
  dmPaf.PafObj.Employee := dmEmployee.Employee;
end;

procedure TfEmployeeDrawer.FormShow(Sender: TObject);
begin
  inherited;
  // set personal node as selected node
  // ALWAYS!!!
  tvEmployee.Selected := tvEmployee.Items[PERSONAL_NODE];
  // populate paf node
  PopulatePafNode;
end;

procedure TfEmployeeDrawer.PopulatePafNode;
var
  selectIndex: integer;
  display: string;
begin
  // remove all paf nodes in the tree
  tvEmployee.Items[PAF_NODE].DeleteChildren;

  // check user right
  if not dmSecurity.User.HasPrivileges([TAppConstant.TPrivilege.PAF_VIEW], false) then
      exit;

  // do not retrieve if adding a new employee
  // no paf exist for a new employee
  if dmEmployee.dstEmployee.State = dsInsert then
    exit;

  // turn off filter
  dmPaf.dstPafList.Filtered := false;

  // this is necessary to
  // force the list to refresh
  dmPaf.dstPafList.Close;
  dmPaf.dstPafList.Parameters.ParamByName('@id_num').Value :=
    dmEmployee.Employee.EmployeeIdNo;
  dmPaf.dstPafList.Open;

  while not dmPaf.dstPafList.Eof do
  begin
    selectIndex := dmPaf.dstPafList.FieldByName('paf_id').AsInteger;
    display := dmPaf.dstPafList.FieldByName('effective_date').AsString;

    tvEmployee.Items.AddChild(tvEmployee.Items[PAF_NODE],display);
    tvEmployee.Items[tvEmployee.Items.Count - 1].SelectedIndex := selectIndex;
    tvEmployee.Items[tvEmployee.Items.Count - 1].ImageIndex := 1;

    dmPaf.dstPafList.Next;
  end;
  dmPaf.dstPafList.Close;

  dmPaf.dstPafList.Filtered := true;

  tvEmployee.Items[PAF_NODE].Expand(false);
end;

procedure TfEmployeeDrawer.tvEmployeeChange(Sender: TObject; Node: TTreeNode);
const
  EMLOYEEMAIN     = 2;
  EMPLOYEEADDRESS = 3;
  EMPLOYEEFAMILY  = 4;
  EMPLOYEESKILLS  = 5;
var
  form: TForm;
begin
  // do not allow change if node has subnodes
  if Node.HasChildren then
    exit;

  // check parent of node
  // if parent is PAF node
  // use this routine to open
  // PAF window in dock panel
  if Node.Parent = tvEmployee.Items[PAF_NODE] then
  begin
    form := OpenPaf(Node.SelectedIndex);
  end
  else
  begin
    case Node.AbsoluteIndex of

      EMLOYEEMAIN:     form := TfEmployeeMain.Create(self);
      EMPLOYEEADDRESS: form := TfEmployeeAddress.Create(self);
      EMPLOYEEFAMILY:  form := TfEmployeeFamily.Create(self);

    else  form := TForm.Create(self);
    end;
  end;

  DockForm(pDock, form);
end;

end.
