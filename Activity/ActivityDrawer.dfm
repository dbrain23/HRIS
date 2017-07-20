inherited fActivityDrawer: TfActivityDrawer
  Caption = 'fActivityDrawer'
  ClientHeight = 476
  ClientWidth = 770
  OnCreate = FormCreate
  ExplicitWidth = 786
  ExplicitHeight = 515
  PixelsPerInch = 96
  TextHeight = 14
  object pcMaster: TJvPageControl
    Left = 0
    Top = 0
    Width = 770
    Height = 476
    ActivePage = tsList
    Align = alClient
    TabOrder = 0
    OnChange = pcMasterChange
    object tsMaster: TTabSheet
      Caption = 'Activity Schedule'
      TabVisible = False
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object pSchedule: TJvPanel
        Left = 0
        Top = 0
        Width = 762
        Height = 447
        HotTrackFont.Charset = DEFAULT_CHARSET
        HotTrackFont.Color = clWindowText
        HotTrackFont.Height = -11
        HotTrackFont.Name = 'Tahoma'
        HotTrackFont.Style = []
        Align = alClient
        BevelOuter = bvNone
        ParentBackground = False
        TabOrder = 0
        Visible = False
      end
    end
    object tsList: TTabSheet
      Caption = 'Activity List'
      ImageIndex = 1
    end
    object tsDetail: TTabSheet
      Caption = 'Activity Detail'
      ImageIndex = 2
    end
  end
end
