inherited fToolsDrawer: TfToolsDrawer
  Caption = 'fToolsDrawer'
  OnCreate = FormCreate
  ExplicitWidth = 320
  ExplicitHeight = 240
  PixelsPerInch = 96
  TextHeight = 14
  inherited pMaster: TJvPanel
    BorderWidth = 0
    object pDock: TPanel
      Left = 199
      Top = 0
      Width = 560
      Height = 489
      Align = alClient
      BevelOuter = bvNone
      BorderWidth = 1
      TabOrder = 0
    end
    object pLeft: TPanel
      Left = 0
      Top = 0
      Width = 199
      Height = 489
      Align = alLeft
      BevelOuter = bvNone
      BorderWidth = 1
      TabOrder = 1
      object tvMain: TJvTreeView
        Left = 1
        Top = 1
        Width = 197
        Height = 487
        Align = alLeft
        Indent = 19
        ReadOnly = True
        RowSelect = True
        SortType = stText
        TabOrder = 0
        OnChange = tvMainChange
        Items.NodeData = {
          03020000003C00000000000000C8000000FFFFFFFFFFFFFFFF00000000000000
          0004000000010F530079006E006300680072006F006E00690073006100740069
          006F006E003000000000000000C9000000FFFFFFFFFFFFFFFF00000000000000
          0000000000010945006D0070006C006F00790065006500730032000000000000
          00CA000000FFFFFFFFFFFFFFFF000000000000000000000000010A5000720069
          00760069006C0065006700650073002800000000000000CB000000FFFFFFFFFF
          FFFFFF000000000000000000000000010552006F006C00650073002800000000
          000000CC000000FFFFFFFFFFFFFFFF0000000000000000000000000105550073
          00650072007300300000000000000064000000FFFFFFFFFFFFFFFF0000000000
          000000010000000109540069006D00650020004C006F00670073002A00000000
          00000065000000FFFFFFFFFFFFFFFF000000000000000000000000010649006D
          0070006F0072007400}
        LineColor = 13158600
      end
    end
  end
  inherited ilBaseMain: TcxImageList
    FormatVersion = 1
  end
end
