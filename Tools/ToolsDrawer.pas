unit ToolsDrawer;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, BaseMainForm, Vcl.ImgList, cxGraphics,
  Vcl.ExtCtrls, JvExExtCtrls, JvExtComponent, JvPanel, Vcl.ComCtrls,
  JvExComCtrls, JvComCtrls;

type
  TfToolsDrawer = class(TfBaseMain)
    pDock: TPanel;
    pLeft: TPanel;
    tvMain: TJvTreeView;
    procedure tvMainChange(Sender: TObject; Node: TTreeNode);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fToolsDrawer: TfToolsDrawer;

implementation

{$R *.dfm}

uses FormUtil, DtrImport, ToolsDataMod;

procedure TfToolsDrawer.FormCreate(Sender: TObject);
begin
  inherited;
  dmTools := TdmTools.Create(self);
  tvMain.Items[0].Expand(true);
end;

procedure TfToolsDrawer.tvMainChange(Sender: TObject; Node: TTreeNode);
const
  DTRIMPORT = 101;
var
  form: TForm;
begin
  // do not allow if node has subnodes
  if Node.HasChildren then
    exit;

  case Node.SelectedIndex of

    DTRIMPORT:     form := TfDtrImport.Create(self);

  else  form := TForm.Create(self);
  end;

  DockForm(pDock, form);
end;

end.
