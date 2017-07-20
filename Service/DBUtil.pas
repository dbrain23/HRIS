unit DBUtil;

interface

uses ADODB, SysConn, ActiveX, System.Classes;

procedure ExecuteSQL(const sql: string);
procedure CloseDataSets(dm: TDataModule);
function ExecuteSQLRtn(const sql: string): string;
function ExecuteSQLRtnCount(const sql: string): integer;
function GetBranchCode: string;

implementation

procedure ExecuteSQL(const sql: string);
var
  queryObj: TADOQuery;
begin
  queryObj := TADOQuery.Create(nil);
  queryObj.ConnectionString := TSysConn.Create.ConnString;
  queryObj.SQL.Add(sql);
  queryObj.ExecSQL;
  queryObj.Free;
end;

procedure CloseDataSets(dm: TDataModule);
var
  i, cnt: integer;
begin
  i := 0;

  cnt := dm.ComponentCount - 1;

  while i < cnt do
  begin
    if dm.Components[i] is TADODataSet then
      (dm.Components[i] as TADODataSet).Close
    else if dm.Components[i] is TADOStoredProc then
      (dm.Components[i] as TADOStoredProc).Close;

    Inc(i);
  end;
end;

function ExecuteSQLRtn(const sql: string): string;
var
  adoObj: TADODataSet;
begin
  adoObj := TADODataSet.Create(nil);
  adoObj.ConnectionString := TSysConn.Create.ConnString;
  adoObj.CommandText := sql;
  adoObj.Open;

  Result := adoObj.FieldByName(adoObj.Fields[0].FieldName).AsString;

  adoObj.Free;
end;

function ExecuteSQLRtnCount(const sql: string): integer;
var
  adoObj: TADODataSet;
begin
  adoObj := TADODataSet.Create(nil);
  adoObj.ConnectionString := TSysConn.Create.ConnString;
  adoObj.CommandText := sql;
  adoObj.Open;

  Result := adoObj.RecordCount;

  adoObj.Free;
end;

function GetBranchCode: string;
var
  sql: string;
begin
  sql := 'select dbo.fn_get_sysconfig_value(''LOCATION_CODE'')';
  Result := ExecuteSQLRtn(sql);
end;

end.
