unit BaseDataMod;

interface

uses
  System.SysUtils, System.Classes, Data.DB, Data.Win.ADODB;

type
  TdmBase = class(TDataModule)
    acBase: TADOConnection;
    procedure acBaseBeforeConnect(Sender: TObject);
  private
    { Private declarations }
    procedure CreateConnection;
  public
    { Public declarations }
  end;

var
  dmBase: TdmBase;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

uses SysConn;

procedure TdmBase.CreateConnection;
var
  sysConn: TSysConn;
begin
  sysConn := TSysConn.Create;
  acBase.ConnectionString := sysConn.ConnString;
end;

procedure TdmBase.acBaseBeforeConnect(Sender: TObject);
begin
  CreateConnection;
end;

end.
