inherited fReportsDrawer: TfReportsDrawer
  BorderWidth = 1
  Caption = 'fReportsDrawer'
  ClientHeight = 403
  ClientWidth = 667
  OnCreate = FormCreate
  ExplicitWidth = 685
  ExplicitHeight = 444
  PixelsPerInch = 96
  TextHeight = 14
  object pcMaster: TJvPageControl
    Left = 0
    Top = 0
    Width = 667
    Height = 403
    ActivePage = tsMaster
    Align = alClient
    TabOrder = 0
    object tsMaster: TTabSheet
      Caption = 'Reports'
      object pDetails: TJvPanel
        Left = 0
        Top = 0
        Width = 659
        Height = 374
        HotTrackFont.Charset = DEFAULT_CHARSET
        HotTrackFont.Color = clWindowText
        HotTrackFont.Height = -11
        HotTrackFont.Name = 'Tahoma'
        HotTrackFont.Style = []
        Align = alClient
        BevelOuter = bvNone
        ParentBackground = False
        TabOrder = 0
        object pDock: TPanel
          Left = 201
          Top = 0
          Width = 458
          Height = 374
          Align = alClient
          BevelOuter = bvNone
          TabOrder = 0
        end
        object pLeft: TPanel
          Left = 0
          Top = 0
          Width = 201
          Height = 374
          Align = alLeft
          BevelOuter = bvNone
          BorderWidth = 1
          TabOrder = 1
          object tvReports: TcxTreeView
            Left = 1
            Top = 1
            Width = 199
            Height = 372
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
              0302000000320000000000000000000000FFFFFFFFFFFFFFFF00000000000000
              0005000000010A480052002D00520065006C0061007400650064004800000000
              00000065000000FFFFFFFFFFFFFFFF0000000000000000000000000115440054
              0052002000500072006F00630065007300730069006E00670020005200650070
              006F0072007400420000000000000066000000FFFFFFFFFFFFFFFF0000000000
              00000000000000011250006500720073006F006E006E0065006C0020004D006F
              00760065006D0065006E0074003E0000000000000067000000FFFFFFFFFFFFFF
              FF000000000000000000000000011055006E00640065007200740069006D0065
              0020005200650070006F0072007400340000000000000069000000FFFFFFFFFF
              FFFFFF000000000000000000000000010B4C0061007400650020005200650070
              006F0072007400360000000000000068000000FFFFFFFFFFFFFFFF0000000000
              00000000000000010C4C00650061007600650020005200650070006F00720074
              002C0000000000000000000000FFFFFFFFFFFFFFFF0000000000000000040000
              00010750006100790072006F006C006C004200000000000000C9000000FFFFFF
              FFFFFFFFFF0000000000000000000000000112530063006800650064002E0020
              006F0066002000530061006C00610072006900650073003200000000000000CB
              000000FFFFFFFFFFFFFFFF000000000000000000000000010A42004300460020
              005200650070006F00720074003E00000000000000CA000000FFFFFFFFFFFFFF
              FF000000000000000000000000011050006100790072006F006C006C00200052
              0065006700690073007400650072005A00000000000000CC000000FFFFFFFFFF
              FFFFFF000000000000000000000000011E50006100790072006F006C006C0020
              0052006500670069007300740065007200200062007900200064006500700061
              00720074006D0065006E007400}
            ReadOnly = True
            OnChange = tvReportsChange
          end
        end
      end
    end
  end
end
