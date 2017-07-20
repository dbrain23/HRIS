object ASCCUpdaterClient: TASCCUpdaterClient
  OldCreateOrder = False
  DisplayName = 'ASCC Updater Client Service '
  AfterInstall = ServiceAfterInstall
  OnExecute = ServiceExecute
  OnShutdown = ServiceShutdown
  OnStart = ServiceStart
  Height = 150
  Width = 215
end
