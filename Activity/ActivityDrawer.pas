unit ActivityDrawer;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, BaseForm, Vcl.ExtCtrls, JvExExtCtrls,
  JvExtComponent, JvPanel, Vcl.ComCtrls, JvExComCtrls, JvComCtrls;

type
  TfActivityDrawer = class(TfBase)
    pcMaster: TJvPageControl;
    tsMaster: TTabSheet;
    pSchedule: TJvPanel;
    tsList: TTabSheet;
    tsDetail: TTabSheet;
    procedure FormCreate(Sender: TObject);
    procedure pcMasterChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fActivityDrawer: TfActivityDrawer;

implementation

{$R *.dfm}

uses ActivityDataMod, ActivityMain, ActivityList, ActivityDetail;

procedure TfActivityDrawer.FormCreate(Sender: TObject);
var
  f: TfActivityMain;
begin
  inherited;
  dmActivity := TdmActivity.Create(self);

  pcMaster.ActivePageIndex := 1;

  // dock main form
  if tsMaster.Visible then
  begin
    f := TfActivityMain.Create(self);
    f.ManualDock(pSchedule);
    f.Show;
  end;

  pcMaster.OnChange(Sender);
end;

procedure TfActivityDrawer.pcMasterChange(Sender: TObject);
var
  f: TForm;
begin
  if pcMaster.ActivePage.ControlCount = 0 then
  begin
    if pcMaster.ActivePage = tsList then
      f := TfActivityList.Create(pcMaster.ActivePage)
    else if pcMaster.ActivePage = tsDetail then
      f := TfActivityDetail.Create(pcMaster.ActivePage);

    // dock form
    f.ManualDock(pcMaster.ActivePage);
    f.Show;
  end;
end;

end.
