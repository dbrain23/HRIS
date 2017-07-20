unit SysPrivilege;

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
  cxCheckListBox;

type
  TfSysPrivilege = class(TfBaseMaintenanceForm)
    JvGroupHeader1: TJvGroupHeader;
    clbPrivileges: TcxCheckListBox;
    procedure bSaveClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    procedure TickPrivilege;
    procedure SavePrivileges;
  public
    { Public declarations }
  end;

var
  fSysPrivilege: TfSysPrivilege;

implementation

uses AppConstant, FormUtil, SecurityDataMod, ListBoxObj;

{$R *.dfm}

procedure TfSysPrivilege.TickPrivilege;
var
  i, cnt: integer;
  code: string;
begin
  dmSecurity.dstPrivileges.Open;

  cnt := clbPrivileges.Items.Count - 1;

  for i := 0 to cnt do
  begin
    code := (clbPrivileges.Items[i].ItemObject as TListBoxObj).Code;

    clbPrivileges.Items[i].Checked :=
      dmSecurity.dstPrivileges.Locate('privilege_code',code,[]);
  end;

  dmSecurity.dstPrivileges.Close;
end;

procedure TfSysPrivilege.FormShow(Sender: TObject);
begin
  inherited;
  PopulateCheckListBox(TAppConstant.TPrivilege.PRIVILEGES,clbPrivileges);
  TickPrivilege;
end;

procedure TfSysPrivilege.SavePrivileges;
var
  i, cnt: integer;
  code, name, description: string;
begin
  dmSecurity.dstPrivileges.Open;

  cnt := clbPrivileges.Items.Count - 1;

  for i := 0 to cnt do
  begin
    code := (clbPrivileges.Items[i].ItemObject as TListBoxObj).Code;
    name := (clbPrivileges.Items[i].ItemObject as TListBoxObj).Name;
    description := (clbPrivileges.Items[i].ItemObject as TListBoxObj).Name;

    // check if privilege exists
    // if ticked .. don't do anything
    // if unticked .. delete the privilege


    // if privilege doesn't exist
    // if ticked .. add privilege
    // if unticked .. don't do anything
    if dmSecurity.dstPrivileges.Locate('privilege_code',code,[]) then
    begin
      if not clbPrivileges.Items[i].Checked then
        dmSecurity.dstPrivileges.Delete;
    end
    else
    begin
      if clbPrivileges.Items[i].Checked then
      begin
        dmSecurity.dstPrivileges.Append;
        dmSecurity.dstPrivileges.FieldByName('privilege_code').AsString := code;
        dmSecurity.dstPrivileges.FieldByName('privilege_name').AsString := name;
        dmSecurity.dstPrivileges.FieldByName('privilege_description').AsString :=
          description;
        dmSecurity.dstPrivileges.Post;
      end;
    end;
  end;

  dmSecurity.dstPrivileges.Close;
end;

procedure TfSysPrivilege.bSaveClick(Sender: TObject);
begin
  SavePrivileges;
end;

end.
