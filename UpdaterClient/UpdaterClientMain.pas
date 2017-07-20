unit UpdaterClientMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.SvcMgr, Vcl.Dialogs,
  IniFiles, DBUtil, ActiveX, Data.DB, Data.Win.ADODB, Registry;

type
  TASCCUpdaterClient = class(TService)
    procedure ServiceStart(Sender: TService; var Started: Boolean);
    procedure ServiceExecute(Sender: TService);
    procedure ServiceAfterInstall(Sender: TService);
    procedure ServiceShutdown(Sender: TService);
  private
    { Private declarations }
    FLocationCode: string;
    FUpdaterUserName: string;
    FUpdaterPassword: string;
    FUpdaterConnString: string;
    function GetApplicationPath: string;
    procedure ExecuteUpdate;
  public
    function GetServiceController: TServiceController; override;
    { Public declarations }
  end;

var
  ASCCUpdaterClient: TASCCUpdaterClient;

implementation

{$R *.DFM}

uses SysConn, Log, SyncWebIntf;

procedure ServiceController(CtrlCode: DWord); stdcall;
begin
  ASCCUpdaterClient.Controller(CtrlCode);
end;

function TASCCUpdaterClient.GetApplicationPath: String;
var
   szFileName: array[0..MAX_PATH] of Char;
begin
   GetModuleFileName(hInstance, szFileName, MAX_PATH);
   Result := ExtractFilePath(szFileName);
end;

function TASCCUpdaterClient.GetServiceController: TServiceController;
begin
  Result := ServiceController;
end;

procedure TASCCUpdaterClient.ServiceAfterInstall(Sender: TService);
var
  Reg: TRegistry;
begin
  Reg := TRegistry.Create(KEY_READ or KEY_WRITE);
  try
    Reg.RootKey := HKEY_LOCAL_MACHINE;
    if Reg.OpenKey('\SYSTEM\CurrentControlSet\Services\' + Name, false) then
    begin
      Reg.WriteString('Description', 'ASCC update service.');
      Reg.CloseKey;
    end;
  finally
    Reg.Free;
  end;
end;

procedure TASCCUpdaterClient.ServiceExecute(Sender: TService);
const
  SecBetweenRuns = 30;
  TASKS = 1;
var
  Count, Task: Integer;
begin
  Count := 0;
  Task := 0;

  while not Terminated do
  begin
    Inc(Count);
    if Count >= SecBetweenRuns then
    begin
      Count := 0;
      Inc(Task);

      { place your service code here }
      { this is where the action happens }

      case Task of

        1: ExecuteUpdate;

      end;

      if Task = TASKS then
        Task := 0;

    end;

    Sleep(1000);
    ServiceThread.ProcessRequests(False);
  end;
end;

procedure TASCCUpdaterClient.ServiceShutdown(Sender: TService);
var
  path: string;
begin
  path := GetApplicationPath;
  LogUpdate('Service has been stopped.', path, true);
end;

procedure TASCCUpdaterClient.ServiceStart(Sender: TService;
  var Started: Boolean);
var
  sql, path: string;
  dstBranch: TADODataSet;
begin
  CoInitialize(nil);

  try
    try
      LogSync('Getting location code.', path);

      sql := 'select dbo.fn_get_sysconfig_value(''LOCATION_CODE''), ' +
         'isnull(dbo.fn_get_sysconfig_value(''UPDATER_CONN_USERNAME''), ''sa''),' +
         'isnull(dbo.fn_get_sysconfig_value(''UPDATER_CONN_PASSWORD''),''sa1'')';

      path := GetApplicationPath;

      dstBranch := TADODataSet.Create(nil);
      dstBranch.ConnectionString := TSysConn.Create(path).ConnString;
      dstBranch.CommandText := sql;
      dstBranch.Open;

      FLocationCode := dstBranch.FieldByName(dstBranch.Fields[0].FieldName).AsString;
      FUpdaterUserName := dstBranch.FieldByName(dstBranch.Fields[1].FieldName).AsString;
      FUpdaterPassword := dstBranch.FieldByName(dstBranch.Fields[2].FieldName).AsString;
      FUpdaterConnString := TSysConn.Create(path, FUpdaterUserName, FUpdaterPassword).ConnString;

      LogUpdate('Alano and Sons update listener service.', path);
      LogUpdate('Service has started successfully.', path);
      LogUpdate('Location code is ' + FLocationCode + '.', path);

      // LogUpdate('Updater username is ' + FUpdaterUserName + '.', path, true);
      // LogUpdate('Updater connection is ' + FUpdaterConnString + '.', path, true);

    except
      on e: Exception do
      begin
        LogUpdate(e.Message, path, true);
      end;
    end;
  finally
    dstBranch.Free;
    CoUninitialize;
  end;
end;

procedure TASCCUpdaterClient.ExecuteUpdate;
var
  sql, path: string;
  queryObj: TADOQuery;
begin
  CoInitialize(nil);
  try
    try
      // runs the update/fix

      sql := 'exec dbo.upd_execute_update';
      path := GetApplicationPath;

      queryObj := TADOQuery.Create(nil);
      queryObj.ConnectionString := FUpdaterConnString;
      queryObj.SQL.Text := sql;

      LogUpdate('Waiting for updates...', path);

      queryObj.ExecSQL;
    except
      on e : exception do
      begin
        LogUpdate(e.Message, path);
        LogUpdate('Update failed. Attempting to restart the service.', path, true);
        ExitProcess(0);
      end;
    end;

  finally
    queryObj.Free;
    CoUninitialize;
  end;
end;

end.
