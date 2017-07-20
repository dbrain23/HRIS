inherited fTimeAttendanceDrawer: TfTimeAttendanceDrawer
  Caption = 'fTimeAttendanceDrawer'
  ClientHeight = 386
  ClientWidth = 644
  OnCreate = FormCreate
  ExplicitWidth = 660
  ExplicitHeight = 425
  PixelsPerInch = 96
  TextHeight = 14
  object pDock: TPanel
    Left = 201
    Top = 0
    Width = 443
    Height = 386
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 0
  end
  object pLeft: TPanel
    Left = 0
    Top = 0
    Width = 201
    Height = 386
    Align = alLeft
    BevelOuter = bvNone
    BorderWidth = 1
    TabOrder = 1
    object tvMain: TcxTreeView
      Left = 1
      Top = 1
      Width = 199
      Height = 384
      Align = alClient
      ParentFont = False
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -12
      Style.Font.Name = 'Tahoma'
      Style.Font.Style = []
      Style.IsFontAssigned = True
      StyleDisabled.Color = clMenu
      TabOrder = 0
      Items.NodeData = {
        030100000044000000FFFFFFFF64000000FFFFFFFFFFFFFFFF00000000000000
        00040000000113540069006D006500200061006E006400200041007400740065
        006E00640061006E0063006500440000000000000001000000FFFFFFFFFFFFFF
        FF0000000000000000000000000113540069006D00650020006C006F00670020
        002F0020004F0076006500720072006900640065002E00000000000000020000
        00FFFFFFFFFFFFFFFF00000000000000000000000001084F0076006500720074
        0069006D006500300000000000000003000000FFFFFFFFFFFFFFFF0000000000
        00000000000000010955006E00640065007200740069006D0065002A00000000
        00000004000000FFFFFFFFFFFFFFFF00000000000000000000000001064C0065
        006100760065007300}
      ReadOnly = True
      OnChange = tvMainChange
    end
  end
end
