object dmBase: TdmBase
  OldCreateOrder = False
  Height = 150
  Width = 215
  object acBase: TADOConnection
    LoginPrompt = False
    BeforeConnect = acBaseBeforeConnect
    Left = 32
    Top = 16
  end
end
