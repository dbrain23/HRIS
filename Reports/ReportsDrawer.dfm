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
              0004000000010A480052002D00520065006C0061007400650064004800000000
              00000065000000FFFFFFFFFFFFFFFF0000000000000000000000000115440054
              0052002000500072006F00630065007300730069006E00670020005200650070
              006F0072007400420000000000000066000000FFFFFFFFFFFFFFFF0000000000
              00000000000000011250006500720073006F006E006E0065006C0020004D006F
              00760065006D0065006E0074003E0000000000000067000000FFFFFFFFFFFFFF
              FF000000000000000000000000011055006E00640065007200740069006D0065
              0020005200650070006F0072007400360000000000000068000000FFFFFFFFFF
              FFFFFF000000000000000000000000010C4C0065006100760065002000520065
              0070006F00720074002C0000000000000000000000FFFFFFFFFFFFFFFF000000
              000000000003000000010750006100790072006F006C006C0042000000000000
              00C9000000FFFFFFFFFFFFFFFF00000000000000000000000001125300630068
              00650064002E0020006F0066002000530061006C00610072006900650073003E
              00000000000000CA000000FFFFFFFFFFFFFFFF00000000000000000000000001
              1050006100790072006F006C006C002000520065006700690073007400650072
              003200000000000000CB000000FFFFFFFFFFFFFFFF0000000000000000000000
              00010A42004300460020005200650070006F0072007400}
            ReadOnly = True
            OnChange = tvReportsChange
          end
        end
      end
    end
  end
end
