unit LogBoxData;

interface

uses
  System.SysUtils, System.Classes, Data.Win.ADODB, Data.DB;

type
  TLogBoxDataMain = class(TDataModule)
    acMain: TADOConnection;
    dstEmployee: TADODataSet;
    spDTRLogTime: TADOStoredProc;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  LogBoxDataMain: TLogBoxDataMain;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

end.
