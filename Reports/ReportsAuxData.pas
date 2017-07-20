unit ReportsAuxData;

interface

uses
  System.SysUtils, System.Classes, Data.DB, Data.Win.ADODB,
  dxPrnDev, dxPrnDlg, BaseDataMod;

type
  TdmReportsAux = class(TDataModule)
    dscLocations: TDataSource;
    dstLocations: TADODataSet;
    prdReport: TdxPrintDialog;
    dstPayrollPeriod: TADODataSet;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmReportsAux: TdmReportsAux;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

uses SecurityDataMod;

{$R *.dfm}

end.
