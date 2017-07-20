unit ToolsDataMod;

interface

uses
  System.SysUtils, System.Classes, BaseDataMod, Data.DB, Data.Win.ADODB,
  Dialogs;

type
  TdmTools = class(TDataModule)
    dscSysConfig: TDataSource;
    dstSysConfig: TADODataSet;
    dstEmployees: TADODataSet;
    procedure dstSysConfigBeforePost(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmTools: TdmTools;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

uses SecurityDataMod;

procedure TdmTools.dstSysConfigBeforePost(DataSet: TDataSet);
begin
  inherited;
  if Trim(DataSet.FieldByName('sysconfig_code').AsString) = '' then
  begin
    MessageDlg('Please enter code.',mtError,[mbOK],0);
    Abort;
  end
  else if Trim(DataSet.FieldByName('sysconfig_value').AsString) = '' then
  begin
    MessageDlg('Please enter value.',mtError,[mbOK],0);
    Abort;
  end;
end;

end.
