inherited fTimeLog: TfTimeLog
  BorderStyle = bsNone
  Caption = 'fTimeLog'
  ClientHeight = 459
  ClientWidth = 612
  OnCreate = FormCreate
  ExplicitWidth = 612
  ExplicitHeight = 459
  PixelsPerInch = 96
  TextHeight = 14
  object shMain: TShape
    Left = 0
    Top = 0
    Width = 612
    Height = 459
    Align = alClient
    Pen.Color = clSilver
  end
  object pMain: TPanel
    Left = 0
    Top = 0
    Width = 612
    Height = 459
    Align = alClient
    BevelOuter = bvNone
    BorderWidth = 2
    Caption = 'pMain'
    TabOrder = 0
    object pTop: TPanel
      Left = 2
      Top = 2
      Width = 608
      Height = 31
      Align = alTop
      BevelOuter = bvNone
      BorderWidth = 2
      ParentBackground = False
      TabOrder = 0
      object Label1: TLabel
        Left = 8
        Top = 10
        Width = 26
        Height = 14
        Caption = 'Date'
      end
      object deDateFrom: TcxDateEdit
        Left = 40
        Top = 4
        Properties.AssignedValues.DisplayFormat = True
        Properties.AssignedValues.EditFormat = True
        Properties.ShowTime = False
        Properties.OnChange = deDateFromPropertiesChange
        TabOrder = 0
        Width = 121
      end
    end
    object grTimeLog: TcxGrid
      Left = 2
      Top = 33
      Width = 608
      Height = 424
      Align = alClient
      TabOrder = 1
      LookAndFeel.Kind = lfFlat
      LookAndFeel.NativeStyle = False
      LookAndFeel.SkinName = 'DevExpressStyle'
      object vwTimeLog: TcxGridDBTableView
        Navigator.Buttons.CustomButtons = <>
        Navigator.Buttons.First.Visible = False
        Navigator.Buttons.PriorPage.Visible = False
        Navigator.Buttons.Prior.Visible = False
        Navigator.Buttons.Next.Visible = False
        Navigator.Buttons.NextPage.Visible = False
        Navigator.Buttons.Last.Visible = False
        Navigator.Buttons.Insert.Visible = False
        Navigator.Buttons.Append.ImageIndex = 1
        Navigator.Buttons.Delete.Visible = False
        Navigator.Buttons.Edit.Visible = False
        Navigator.Buttons.Refresh.Visible = False
        Navigator.Buttons.SaveBookmark.Visible = False
        Navigator.Buttons.GotoBookmark.Visible = False
        Navigator.Buttons.Filter.Visible = False
        DataController.DataSource = dmTimeAttendance.dscDtr
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <>
        DataController.Summary.SummaryGroups = <>
        OptionsBehavior.PostponedSynchronization = False
        OptionsBehavior.FocusCellOnTab = True
        OptionsBehavior.FocusFirstCellOnNewRecord = True
        OptionsBehavior.GoToNextCellOnEnter = True
        OptionsCustomize.ColumnFiltering = False
        OptionsCustomize.ColumnGrouping = False
        OptionsCustomize.ColumnHidingOnGrouping = False
        OptionsCustomize.ColumnHorzSizing = False
        OptionsCustomize.ColumnMoving = False
        OptionsData.Deleting = False
        OptionsData.DeletingConfirmation = False
        OptionsData.Editing = False
        OptionsData.Inserting = False
        OptionsSelection.HideFocusRectOnExit = False
        OptionsSelection.InvertSelect = False
        OptionsSelection.UnselectFocusedRecordOnExit = False
        OptionsView.FocusRect = False
        OptionsView.NoDataToDisplayInfoText = 'No record found.'
        OptionsView.ScrollBars = ssVertical
        OptionsView.GroupByBox = False
        OptionsView.Indicator = True
        object vwTimeLogemployee_name: TcxGridDBColumn
          Caption = 'Employee'
          DataBinding.FieldName = 'employee_name'
          Width = 170
        end
        object vwTimeLogtime_in_am: TcxGridDBColumn
          Caption = 'In-AM'
          DataBinding.FieldName = 'time_in_am'
          Width = 70
        end
        object vwTimeLogtime_out_am: TcxGridDBColumn
          Caption = 'Out-AM'
          DataBinding.FieldName = 'time_out_am'
          Width = 70
        end
        object vwTimeLogtime_in_pm: TcxGridDBColumn
          Caption = 'In-PM'
          DataBinding.FieldName = 'time_in_pm'
          Width = 70
        end
        object vwTimeLogtime_out_pm: TcxGridDBColumn
          Caption = 'Out-PM'
          DataBinding.FieldName = 'time_out_pm'
          Width = 70
        end
        object vwTimeLogtotal_hours: TcxGridDBColumn
          Caption = 'Hours'
          DataBinding.FieldName = 'total_hours'
          PropertiesClassName = 'TcxCurrencyEditProperties'
          Properties.DisplayFormat = '0.00'
          HeaderAlignmentHorz = taRightJustify
        end
      end
      object lvTimeLog: TcxGridLevel
        GridView = vwTimeLog
      end
    end
  end
end
