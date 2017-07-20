unit BasePopup;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, BaseForm, Vcl.StdCtrls, Vcl.ExtCtrls,
  JvExExtCtrls, JvExtComponent, JvPanel, Vcl.Imaging.pngimage;

type
  TfBasePopup = class(TfBase)
    pnlCaption: TJvPanel;
    lblCaption: TLabel;
    pnlMain: TJvPanel;
    imgClose: TImage;
    procedure imgCloseClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fBasePopup: TfBasePopup;

implementation

{$R *.dfm}

procedure TfBasePopup.imgCloseClick(Sender: TObject);
begin
  inherited;
  ModalResult := mrClose;
end;

end.
