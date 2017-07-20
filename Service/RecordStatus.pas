unit RecordStatus;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls;

type
  TfRecordStatus = class(TForm)
    lblStatus: TLabel;
    tmMain: TTimer;
    Shape1: TShape;
    procedure tmMainTimer(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormDeactivate(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fRecordStatus: TfRecordStatus;

implementation

{$R *.dfm}

procedure TfRecordStatus.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TfRecordStatus.FormDeactivate(Sender: TObject);
begin
  self.Close;
end;

procedure TfRecordStatus.FormShow(Sender: TObject);
begin
  tmMain.Enabled := true;
end;

procedure TfRecordStatus.tmMainTimer(Sender: TObject);
begin
  self.AlphaBlendValue := self.AlphaBlendValue - 5;

  if self.AlphaBlendValue < 5 then
  begin
    tmMain.Enabled := false;
    self.OnDeactivate(nil);
  end;
end;

end.
