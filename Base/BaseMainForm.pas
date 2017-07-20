unit BaseMainForm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, BaseForm, Vcl.StdCtrls, JvExStdCtrls,
  JvButton, JvCtrls, Vcl.ExtCtrls, JvExExtCtrls, JvExtComponent, JvPanel,
  Vcl.ImgList, Vcl.ComCtrls, JvExComCtrls, JvComCtrls, cxGraphics;

type
  TfBaseMain = class(TfBase)
    pMaster: TJvPanel;
    ilBaseMain: TcxImageList;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fBaseMain: TfBaseMain;

implementation

{$R *.dfm}

end.
