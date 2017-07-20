unit ConfigManagerMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, JvExExtCtrls,
  JvExtComponent, JvPanel, Vcl.Menus, Vcl.ImgList, cxGraphics, Vcl.ComCtrls,
  Vcl.ToolWin;

type
  TfConfigManagerMain = class(TForm)
    tbMain: TToolBar;
    tbSecurity: TToolButton;
    tbSystemConfiguration: TToolButton;
    ilMain: TcxImageList;
    mmMain: TMainMenu;
    File1: TMenuItem;
    Exit1: TMenuItem;
    About1: TMenuItem;
    pDock: TJvPanel;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure tbSecurityClick(Sender: TObject);
  private
    { Private declarations }
    procedure DockForm(Sender: TObject);
  public
    { Public declarations }
  end;

var
  fConfigManagerMain: TfConfigManagerMain;

implementation

{$R *.dfm}

uses SecurityDataMod, LoginConfigManager, SecurityDrawer, SystemConfiguration,
  FormUtil, ToolsDataMod;

procedure TfConfigManagerMain.FormCreate(Sender: TObject);
begin
  // instantiate data module
  dmSecurity := TdmSecurity.Create(Application);
  dmTools := TdmTools.Create(Application);
end;

procedure TfConfigManagerMain.FormShow(Sender: TObject);
var
  form: TfLoginConfigManager;
begin
  form := TfLoginConfigManager.Create(nil);
  form.ShowModal;
end;

procedure TfConfigManagerMain.tbSecurityClick(Sender: TObject);
begin
  DockForm(Sender);
end;

procedure TfConfigManagerMain.DockForm(Sender: TObject);
var
  form: TForm;
  forceCreate: boolean;
begin
  if (Sender as TToolButton).Name = 'tbSecurity' then
    form := TfSecurityDrawer.Create(nil)
  else if (Sender as TToolButton).Name = 'tbSystemConfiguration' then
    form := TfSystemConfiguration.Create(nil);

  FormUtil.DockForm(pDock, form, forceCreate);
end;

end.
