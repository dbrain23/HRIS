unit Log;

interface

uses SysUtils;

procedure LogSync(const syncMessage: string; const pathToLog: string;
  const response: boolean = false);


procedure LogSyncDB(const syncMessage: string; const pathToLog: string;
  const response: boolean = false);

procedure LogUpdate(const updateMessage: string; const pathToLog: string;
  const response: boolean = false);

implementation

procedure LogSync(const syncMessage: string; const pathToLog: string;
  const response: boolean = false);
var
  logFile: TextFile;
  fileName: string;
begin
  try
    if pathToLog <> '' then
    begin
      if not DirectoryExists(pathToLog + '\_logs') then
        CreateDir(pathToLog + '\_logs');

      fileName := pathToLog + '\_logs\SyncLog_' +
         FormatDateTime('mmddyyyy',Now) + '.txt';

      AssignFile(logFile, fileName);

      if FileExists(fileName) then
        Append(logFile)
      else
        Rewrite(logFile);

      if response then
        WriteLn(logFile, FormatDateTime('mm/dd/yyyy hh:mm:ss',Now) +
            ' Response: ' + syncMessage)
      else
        WriteLn(logFile, FormatDateTime('mm/dd/yyyy hh:mm:ss',Now) + ' *** ' +
            syncMessage);

      CloseFile(logFile);
    end;
  except

  end;
end;

procedure LogSyncDB(const syncMessage: string; const pathToLog: string;
  const response: boolean = false);
var
  logFile: TextFile;
  fileName: string;
begin
  try
    if pathToLog <> '' then
    begin
      if not DirectoryExists(pathToLog + '\_logs') then
        CreateDir(pathToLog + '\_logs');

      fileName := pathToLog + '\_logs\SyncLogDB_' +
         FormatDateTime('mmddyyyy',Now) + '.txt';

      AssignFile(logFile, fileName);

      if FileExists(fileName) then
        Append(logFile)
      else
        Rewrite(logFile);

      if response then
        WriteLn(logFile, FormatDateTime('mm/dd/yyyy hh:mm:ss',Now) +
            ' Response: ' + syncMessage)
      else
        WriteLn(logFile, FormatDateTime('mm/dd/yyyy hh:mm:ss',Now) + ' *** ' +
            syncMessage);

      CloseFile(logFile);
    end;
  except

  end;
end;

procedure LogUpdate(const updateMessage: string; const pathToLog: string;
  const response: boolean = false);
var
  logFile: TextFile;
  fileName: string;
begin
  try
    if pathToLog <> '' then
    begin
      if not DirectoryExists(pathToLog + '\_logs') then
        CreateDir(pathToLog + '\_logs');

      fileName := pathToLog + '\_logs\UpdateLog_' +
         FormatDateTime('mmddyyyy',Now) + '.txt';

      AssignFile(logFile, fileName);

      if FileExists(fileName) then
        Append(logFile)
      else
        Rewrite(logFile);

      if response then
        WriteLn(logFile, FormatDateTime('mm/dd/yyyy hh:mm:ss',Now) +
            ' Response: ' + updateMessage)
      else
        WriteLn(logFile, FormatDateTime('mm/dd/yyyy hh:mm:ss',Now) + ' *** ' +
            updateMessage);

      CloseFile(logFile);
    end;
  except

  end;
end;

end.
