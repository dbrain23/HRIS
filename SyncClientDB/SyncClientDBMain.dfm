object ASCCClientDBSyncService: TASCCClientDBSyncService
  OldCreateOrder = False
  DisplayName = 'ASCC Client DB Sync Service'
  AfterInstall = ServiceAfterInstall
  OnExecute = ServiceExecute
  OnStart = ServiceStart
  Height = 284
  Width = 346
end
