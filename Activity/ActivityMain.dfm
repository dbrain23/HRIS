inherited fActivityMain: TfActivityMain
  Caption = 'fActivityMain'
  ClientHeight = 635
  ClientWidth = 870
  OnCreate = FormCreate
  ExplicitWidth = 886
  ExplicitHeight = 674
  PixelsPerInch = 96
  TextHeight = 14
  inherited pMaster: TJvPanel
    Width = 870
    Height = 635
    ExplicitWidth = 870
    ExplicitHeight = 635
    object schMain: TcxScheduler
      Left = 2
      Top = 2
      Width = 866
      Height = 631
      DateNavigator.RowCount = 3
      DateNavigator.Visible = False
      ViewDay.TimeRulerMinutes = True
      ViewWeeks.Active = True
      Align = alClient
      ContentPopupMenu.PopupMenu = pmMain
      ContentPopupMenu.UseBuiltInPopupMenu = False
      ControlBox.Control = pnlControls
      ControlBox.Visible = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      LookAndFeel.NativeStyle = False
      OptionsBehavior.SelectOnRightClick = True
      OptionsView.ShowNavigationButtons = False
      OptionsView.WorkDays = [dMonday, dTuesday, dWednesday, dThursday, dFriday, dSaturday]
      TabOrder = 0
      Selection = 14
      Splitters = {
        D202000078010000610300007D010000CD02000001000000D202000076020000}
      StoredClientBounds = {01000000010000006103000076020000}
      object pnlControls: TPanel
        Left = 0
        Top = 0
        Width = 143
        Height = 243
        Align = alClient
        BevelOuter = bvNone
        Color = clWindow
        TabOrder = 0
        object Memo1: TMemo
          Left = 0
          Top = 0
          Width = 143
          Height = 243
          Align = alClient
          BorderStyle = bsNone
          Lines.Strings = (
            'Your controls can be placed '
            'here')
          TabOrder = 1
          Visible = False
        end
        object cxGroupBox1: TcxGroupBox
          Left = 0
          Top = 0
          Align = alClient
          PanelStyle.Active = True
          ParentBackground = False
          ParentColor = False
          Style.BorderStyle = ebsNone
          TabOrder = 0
          Height = 243
          Width = 143
        end
      end
    end
  end
  inherited ilBaseMain: TcxImageList
    FormatVersion = 1
    DesignInfo = 37749424
  end
  object pmMain: TPopupMenu
    Left = 656
    Top = 576
    object NewActivity1: TMenuItem
      Caption = 'New Activity'
      OnClick = NewActivity1Click
    end
    object N1: TMenuItem
      Caption = '-'
    end
    object MonthView1: TMenuItem
      Caption = 'Month View'
      Checked = True
    end
    object WeeView1: TMenuItem
      Caption = 'Week View'
    end
  end
end
