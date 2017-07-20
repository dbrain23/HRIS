inherited fSecurityDrawer: TfSecurityDrawer
  Caption = 'fSecurityDrawer'
  ClientHeight = 396
  OnCreate = FormCreate
  ExplicitWidth = 600
  ExplicitHeight = 435
  PixelsPerInch = 96
  TextHeight = 14
  object pMaster: TJvPanel
    Left = 0
    Top = 0
    Width = 584
    Height = 396
    HotTrackFont.Charset = DEFAULT_CHARSET
    HotTrackFont.Color = clWindowText
    HotTrackFont.Height = -11
    HotTrackFont.Name = 'Tahoma'
    HotTrackFont.Style = []
    Align = alClient
    BevelEdges = [beTop]
    BevelOuter = bvNone
    TabOrder = 0
    object pDock: TPanel
      Left = 199
      Top = 0
      Width = 385
      Height = 396
      Align = alClient
      BevelOuter = bvNone
      BorderWidth = 1
      TabOrder = 0
    end
    object pLeft: TPanel
      Left = 0
      Top = 0
      Width = 199
      Height = 396
      Align = alLeft
      BevelOuter = bvNone
      BorderWidth = 1
      TabOrder = 1
      object tvMain: TJvTreeView
        Left = 1
        Top = 1
        Width = 197
        Height = 394
        Align = alClient
        Indent = 19
        ReadOnly = True
        RowSelect = True
        SortType = stText
        TabOrder = 0
        OnChange = tvMainChange
        Items.NodeData = {
          03010000002E000000000000000000000000000000FFFFFFFF01000000000000
          0003000000010853006500630075007200690074007900320000000000000003
          000000FFFFFFFFFFFFFFFF000000000000000000000000010A50007200690076
          0069006C006500670065007300280000000000000002000000FFFFFFFFFFFFFF
          FF000000000000000000000000010552006F006C006500730028000000000000
          0001000000FFFFFFFFFFFFFFFF00000000000000000000000001055500730065
          0072007300}
        LineColor = clScrollBar
      end
    end
  end
end
