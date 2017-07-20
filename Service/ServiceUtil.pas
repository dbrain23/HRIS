unit ServiceUtil;

interface

uses WinSvc, SysUtils, Windows;

function GetComputerNetName: string;
function GetServiceStatus(const machine, service: PChar): integer;
function ServiceStart(const machine, service: PChar): boolean;
function ServiceStop(const machine, service: PChar): boolean;

implementation

function GetComputerNetName: string;
var
  buffer: array[0..255] of char;
  size: DWord;
begin
  size := 256;
  if GetComputerName(buffer, size) then
    Result := buffer
  else
    Result := ''
end;

function GetServiceStatus(const machine,
  service: PChar): integer;
var
  managerHandle, serviceHandle: SC_Handle;
  serviceStatus: TServiceStatus;
  hStat : integer;
begin
  hStat := 1;

  managerHandle := OpenSCManager(machine ,Nil, SC_MANAGER_CONNECT);

  if managerHandle > 0 then
  begin
    serviceHandle := OpenService(managerHandle, service, SERVICE_QUERY_STATUS);

    if serviceHandle > 0 then
    begin
      if QueryServiceStatus(serviceHandle, serviceStatus) then
        hStat := serviceStatus.dwCurrentState;

      CloseServiceHandle(serviceHandle);
    end;
    CloseServiceHandle(managerHandle);
  end;

  Result := hStat;
end;

function ServiceStart(const machine, service: PChar): boolean;
var
  managerHandle, serviceHandle: SC_Handle;
  serviceStatus: TServiceStatus;
  temp: PChar;
  dwCheckPoint: integer;
begin
  serviceStatus.dwCurrentState := 0;

  managerHandle := OpenSCManager(machine, nil, SC_MANAGER_CONNECT);

  if managerHandle > 0 then
  begin
    serviceHandle := OpenService(managerHandle, service,
       SERVICE_RUNNING or SERVICE_QUERY_STATUS);

    if serviceHandle > 0 then
    begin
      temp := nil;

      if StartService(serviceHandle, 0, temp) then
      begin
        if QueryServiceStatus(serviceHandle,serviceStatus) then
        begin
          while serviceStatus.dwCurrentState = SERVICE_RUNNING do
          begin
            dwCheckPoint := serviceStatus.dwCheckPoint;

            Sleep(serviceStatus.dwWaitHint);

            if (not QueryServiceStatus(serviceHandle,serviceStatus)) then
              break;

            if serviceStatus.dwCheckPoint < dwCheckPoint then
              break;

          end;
        end
      end
      else
        RaiseLastOSError;

    CloseServiceHandle(serviceHandle);
    end;
    CloseServiceHandle(managerHandle);
  end;

  Result := SERVICE_RUNNING = serviceStatus.dwCurrentState;
end;

function ServiceStop(const machine, service: PChar): boolean;
var
  managerHandle, serviceHandle: SC_Handle;
  serviceStatus: TServiceStatus;
  dwCheckPoint : integer;
begin
  managerHandle := OpenSCManager(machine, nil, SC_MANAGER_CONNECT);

  if managerHandle >  0 then
  begin
    serviceHandle := OpenService(managerHandle,service,
                         SERVICE_STOP or SERVICE_QUERY_STATUS);

    if serviceHandle > 0 then
    begin
      if  ControlService(serviceHandle,SERVICE_CONTROL_STOP,serviceStatus)then
      begin
        if(QueryServiceStatus(serviceHandle,serviceStatus))then
        begin
          while serviceStatus.dwCurrentState = SERVICE_STOPPED do
          begin
            dwCheckPoint := serviceStatus.dwCheckPoint;
            Sleep(serviceStatus.dwWaitHint);

            if not QueryServiceStatus(serviceHandle,serviceStatus) then
              break;

            if serviceStatus.dwCheckPoint = 0 then
              break;

          end;
        end;
      end;
      CloseServiceHandle(serviceHandle);
    end;
    CloseServiceHandle(managerHandle);
  end;

  Result := SERVICE_STOPPED = serviceStatus.dwCurrentState;
end;


end.
