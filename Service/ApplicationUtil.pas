unit ApplicationUtil;

interface

uses Winapi.Windows, System.SysUtils, System.Classes, Math;

function GetAppVersionStr(const exeName : string): string;
function RestoreIfRunning(const appHandle : THandle;
  maxInstances : integer = 1): boolean;

implementation

  type
  PInstanceInfo = ^TInstanceInfo;
  TInstanceInfo = packed record
    PreviousHandle : THandle;
    RunCounter : integer;
  end;

var
  MappingHandle: THandle;
  InstanceInfo: PInstanceInfo;
  MappingName : string;

  RemoveMe : boolean = True;

function GetAppVersionStr(const exeName: string): string;
var
  Size, Handle: DWORD;
  Buffer: TBytes;
  FixedPtr: PVSFixedFileInfo;
begin
  Size := GetFileVersionInfoSize(PChar(exeName), Handle);
  if Size = 0 then
    RaiseLastOSError;
  SetLength(Buffer, Size);
  if not GetFileVersionInfo(PChar(exeName), Handle, Size, Buffer) then
    RaiseLastOSError;
  if not VerQueryValue(Buffer, '\', Pointer(FixedPtr), Size) then
    RaiseLastOSError;
  Result := Format('%d.%d.%d.%d',
    [LongRec(FixedPtr.dwFileVersionMS).Hi,  //major
     LongRec(FixedPtr.dwFileVersionMS).Lo,  //minor
     LongRec(FixedPtr.dwFileVersionLS).Hi,  //release
     LongRec(FixedPtr.dwFileVersionLS).Lo]) //build
end;

function RestoreIfRunning(const appHandle : THandle;
  maxInstances : integer = 1) : boolean;
begin
  Result := True;

  MappingName := StringReplace(
                   ParamStr(0),
                   '\',
                   '',
                   [rfReplaceAll, rfIgnoreCase]);

  MappingHandle := CreateFileMapping($FFFFFFFF,
                                     nil,
                                     PAGE_READWRITE,
                                     0,
                                     SizeOf(TInstanceInfo),
                                     PChar(MappingName));

  if MappingHandle = 0 then
    RaiseLastOSError
  else
  begin
    if GetLastError <> ERROR_ALREADY_EXISTS then
    begin
      InstanceInfo := MapViewOfFile(MappingHandle,
                                    FILE_MAP_ALL_ACCESS,
                                    0,
                                    0,
                                    SizeOf(TInstanceInfo));

      InstanceInfo^.PreviousHandle := AppHandle;
      InstanceInfo^.RunCounter := 1;

      Result := False;
    end
  else //already runing
    begin
      MappingHandle := OpenFileMapping(
                                FILE_MAP_ALL_ACCESS,
                                False,
                                PChar(MappingName));
      if MappingHandle <> 0 then
      begin
        InstanceInfo := MapViewOfFile(MappingHandle,
                                      FILE_MAP_ALL_ACCESS,
                                      0,
                                      0,
                                      SizeOf(TInstanceInfo));

        if InstanceInfo^.RunCounter >= MaxInstances then
        begin
          RemoveMe := False;

          if IsIconic(InstanceInfo^.PreviousHandle) then
            ShowWindow(InstanceInfo^.PreviousHandle, SW_RESTORE);
          SetForegroundWindow(InstanceInfo^.PreviousHandle);
        end
        else
        begin
          InstanceInfo^.PreviousHandle := AppHandle;
          InstanceInfo^.RunCounter := 1 + InstanceInfo^.RunCounter;

          Result := False;
        end
      end;
    end;
  end;
end; (*RestoreIfRunning*)

initialization
//nothing special here
//we need this section because we have the
//finalization section

finalization
  //remove this instance
  if RemoveMe then
  begin
    MappingHandle := OpenFileMapping(
                        FILE_MAP_ALL_ACCESS,
                        False,
                        PChar(MappingName));
    if MappingHandle <> 0 then
    begin
      InstanceInfo := MapViewOfFile(MappingHandle,
                                  FILE_MAP_ALL_ACCESS,
                                  0,
                                  0,
                                  SizeOf(TInstanceInfo));

      InstanceInfo^.RunCounter := -1 + InstanceInfo^.RunCounter;
    end
    else
      RaiseLastOSError;
  end;

  if Assigned(InstanceInfo) then UnmapViewOfFile(InstanceInfo);
  if MappingHandle <> 0 then CloseHandle(MappingHandle);

end. (*unit CheckPrevious*)

