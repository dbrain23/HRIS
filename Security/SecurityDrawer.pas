unit SecurityDrawer;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, BaseForm, Vcl.ComCtrls, JvExComCtrls,
  JvComCtrls, Vcl.ExtCtrls, JvExExtCtrls, JvExtComponent, JvPanel;

type
  TfSecurityDrawer = class(TfBase)
    pMaster: TJvPanel;
    pDock: TPanel;
    pLeft: TPanel;
    tvMain: TJvTreeView;
    procedure FormCreate(Sender: TObject);
    procedure tvMainChange(Sender: TObject; Node: TTreeNode);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fSecurityDrawer: TfSecurityDrawer;

implementation

{$R *.dfm}

uses SecurityDataMod, SysUser, SysRole, AppConstant, FormUtil, SysPrivilege;

procedure TfSecurityDrawer.FormCreate(Sender: TObject);
begin
  inherited;
  tvMain.Items[0].Expand(true);
end;

procedure TfSecurityDrawer.tvMainChange(Sender: TObject; Node: TTreeNode);
const
  USERS         = 1;
  ROLES         = 2;
  PRIVILEGES    = 3;
var
  form: TForm;
begin
  // do not allow if node has subnodes
  if Node.HasChildren then
    exit;

  case Node.SelectedIndex of

    USERS:
      begin
        if not dmSecurity.User.HasPrivileges([TAppConstant.TPrivilege.USER_VIEW]) then
          exit;

        form := TfSysUser.Create(nil);
      end;
    ROLES:
      begin
        if not dmSecurity.User.HasPrivileges([TAppConstant.TPrivilege.ROLE_VIEW]) then
          exit;

        form := TfSysRole.Create(nil);
      end;

    PRIVILEGES:
      begin
        if not dmSecurity.User.HasPrivileges([TAppConstant.TPrivilege.ROLE_VIEW]) then
          exit;

        form := TfSysPrivilege.Create(nil);
      end

  else  form := TForm.Create(self);
  end;

  DockForm(pDock, form);
end;

end.
