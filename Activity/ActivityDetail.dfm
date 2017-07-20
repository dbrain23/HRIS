inherited fActivityDetail: TfActivityDetail
  BorderStyle = bsSingle
  Caption = 'fActivityDetail'
  ClientHeight = 496
  ClientWidth = 775
  Position = poOwnerFormCenter
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnPaint = FormPaint
  ExplicitWidth = 781
  ExplicitHeight = 525
  PixelsPerInch = 96
  TextHeight = 14
  inherited pMaster: TJvPanel
    Width = 775
    Height = 496
    ExplicitWidth = 775
    ExplicitHeight = 496
    object pDetails: TJvPanel
      Left = 2
      Top = 2
      Width = 771
      Height = 492
      HotTrackFont.Charset = DEFAULT_CHARSET
      HotTrackFont.Color = clWindowText
      HotTrackFont.Height = -11
      HotTrackFont.Name = 'Tahoma'
      HotTrackFont.Style = []
      Align = alClient
      BevelOuter = bvNone
      ParentBackground = False
      TabOrder = 0
      object JvGroupHeader3: TJvGroupHeader
        Left = 368
        Top = 17
        Width = 348
        Height = 18
        Caption = 'Participants'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clHighlight
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object JvGroupHeader1: TJvGroupHeader
        Left = 43
        Top = 17
        Width = 294
        Height = 18
        Caption = 'Activity '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clHighlight
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object JvLabel1: TJvLabel
        Left = 59
        Top = 40
        Width = 42
        Height = 14
        Caption = 'Subject'
        Transparent = True
        HotTrackFont.Charset = DEFAULT_CHARSET
        HotTrackFont.Color = clWindowText
        HotTrackFont.Height = -11
        HotTrackFont.Name = 'Tahoma'
        HotTrackFont.Style = []
      end
      object JvLabel3: TJvLabel
        Left = 59
        Top = 89
        Width = 54
        Height = 14
        Caption = 'Start date'
        Transparent = True
        HotTrackFont.Charset = DEFAULT_CHARSET
        HotTrackFont.Color = clWindowText
        HotTrackFont.Height = -11
        HotTrackFont.Name = 'Tahoma'
        HotTrackFont.Style = []
      end
      object ghAction: TJvGroupHeader
        Left = 16
        Top = 418
        Width = 709
        Height = 18
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clHighlight
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object JvLabel5: TJvLabel
        Left = 59
        Top = 114
        Width = 50
        Height = 14
        Caption = 'End date'
        Transparent = True
        HotTrackFont.Charset = DEFAULT_CHARSET
        HotTrackFont.Color = clWindowText
        HotTrackFont.Height = -11
        HotTrackFont.Name = 'Tahoma'
        HotTrackFont.Style = []
      end
      object JvLabel6: TJvLabel
        Left = 59
        Top = 189
        Width = 28
        Height = 14
        Caption = 'Type'
        Transparent = True
        HotTrackFont.Charset = DEFAULT_CHARSET
        HotTrackFont.Color = clWindowText
        HotTrackFont.Height = -11
        HotTrackFont.Name = 'Tahoma'
        HotTrackFont.Style = []
      end
      object JvLabel7: TJvLabel
        Left = 59
        Top = 214
        Width = 35
        Height = 14
        Caption = 'Status'
        Transparent = True
        HotTrackFont.Charset = DEFAULT_CHARSET
        HotTrackFont.Color = clWindowText
        HotTrackFont.Height = -11
        HotTrackFont.Name = 'Tahoma'
        HotTrackFont.Style = []
      end
      object JvLabel2: TJvLabel
        Left = 59
        Top = 238
        Width = 62
        Height = 14
        Caption = 'Description'
        Transparent = True
        HotTrackFont.Charset = DEFAULT_CHARSET
        HotTrackFont.Color = clWindowText
        HotTrackFont.Height = -11
        HotTrackFont.Name = 'Tahoma'
        HotTrackFont.Style = []
      end
      object JvLabel4: TJvLabel
        Left = 59
        Top = 139
        Width = 48
        Height = 14
        Caption = 'Location'
        Transparent = True
        HotTrackFont.Charset = DEFAULT_CHARSET
        HotTrackFont.Color = clWindowText
        HotTrackFont.Height = -11
        HotTrackFont.Name = 'Tahoma'
        HotTrackFont.Style = []
      end
      object JvLabel8: TJvLabel
        Left = 59
        Top = 164
        Width = 50
        Height = 14
        Caption = 'Resource'
        Transparent = True
        HotTrackFont.Charset = DEFAULT_CHARSET
        HotTrackFont.Color = clWindowText
        HotTrackFont.Height = -11
        HotTrackFont.Name = 'Tahoma'
        HotTrackFont.Style = []
      end
      object bSave: TcxButton
        Left = 43
        Top = 426
        Width = 81
        Height = 27
        Caption = 'Save'
        LookAndFeel.SkinName = ''
        OptionsImage.ImageIndex = 1
        OptionsImage.Images = ilBaseMain
        TabOrder = 8
        OnClick = bSaveClick
      end
      object bCancel: TcxButton
        Left = 125
        Top = 426
        Width = 81
        Height = 27
        Caption = 'Cancel'
        OptionsImage.ImageIndex = 4
        OptionsImage.Images = ilBaseMain
        TabOrder = 9
        OnClick = bCancelClick
      end
      object cxDBMemo1: TcxDBMemo
        Left = 136
        Top = 33
        DataBinding.DataField = 'activity_subject'
        DataBinding.DataSource = dmActivity.dscActivitiesMonth
        TabOrder = 0
        Height = 47
        Width = 201
      end
      object cxDBMemo2: TcxDBMemo
        Left = 59
        Top = 258
        DataBinding.DataField = 'activity_description'
        DataBinding.DataSource = dmActivity.dscActivitiesMonth
        TabOrder = 7
        Height = 115
        Width = 278
      end
      object cxDBDateEdit1: TcxDBDateEdit
        Left = 136
        Top = 83
        DataBinding.DataField = 'activity_startdate'
        DataBinding.DataSource = dmActivity.dscActivitiesMonth
        Properties.SaveTime = False
        Properties.ShowTime = False
        TabOrder = 1
        Width = 97
      end
      object cxDBLookupComboBox1: TcxDBLookupComboBox
        Left = 136
        Top = 183
        DataBinding.DataField = 'activitytype_code'
        DataBinding.DataSource = dmActivity.dscActivitiesMonth
        Properties.KeyFieldNames = 'activitytype_code'
        Properties.ListColumns = <
          item
            FieldName = 'activitytype_name'
          end>
        Properties.ListOptions.GridLines = glNone
        Properties.ListOptions.ShowHeader = False
        Properties.ListSource = dmActivity.dscActivityType
        TabOrder = 5
        Width = 201
      end
      object cxDBLookupComboBox2: TcxDBLookupComboBox
        Left = 136
        Top = 208
        DataBinding.DataField = 'activitystatus_code'
        DataBinding.DataSource = dmActivity.dscActivitiesMonth
        Properties.KeyFieldNames = 'activitystatus_code'
        Properties.ListColumns = <
          item
            FieldName = 'activitystatus_name'
          end>
        Properties.ListOptions.GridLines = glNone
        Properties.ListOptions.ShowHeader = False
        Properties.ListSource = dmActivity.dscActivityStatus
        TabOrder = 6
        Width = 201
      end
      object cxDBDateEdit2: TcxDBDateEdit
        Left = 136
        Top = 108
        DataBinding.DataField = 'activity_enddate'
        DataBinding.DataSource = dmActivity.dscActivitiesMonth
        Properties.SaveTime = False
        Properties.ShowTime = False
        TabOrder = 2
        Width = 97
      end
      object cxDBTextEdit1: TcxDBTextEdit
        Left = 136
        Top = 133
        DataBinding.DataField = 'activity_location'
        DataBinding.DataSource = dmActivity.dscActivitiesMonth
        TabOrder = 3
        Width = 201
      end
      object cxDBTextEdit2: TcxDBTextEdit
        Left = 136
        Top = 158
        DataBinding.DataField = 'activity_resource'
        DataBinding.DataSource = dmActivity.dscActivitiesMonth
        TabOrder = 4
        Width = 201
      end
      object cmbEmployees: TcxComboBox
        Left = 384
        Top = 33
        Enabled = False
        Properties.ButtonGlyph.Data = {
          36030000424D3603000000000000360000002800000010000000100000000100
          18000000000000030000C40E0000C40E00000000000000000000FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFEFEFFA6A699B1B0ACDADADAFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFF6D97FF4392
          F6EEE9DFB0ADABFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFDFDFF6C95FF439AFF6ADAFF5DADF5A8A091FFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF6F7F66089FD469FFF6FDAFF50AC
          FF5485FFF5F7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE2E3E4C7C8CAD3D3D4FA
          FAFABFBBB77091B261D3FF4EAAFF5B88FFF8F9FFFFFFFFFFFFFFFFFFFFFFFFFF
          EBEBEC979A9BB3A081D2B689C3AB84908E88737478FFF7F097B3D1D6E0FFF9FA
          FFFFFFFFFFFFFFFFFFFFFFFFFFF3F3F398958EF5CB84F5CB84F1C885F5CE8EFC
          D08CAE9E8577787BDFDCD73CA63CFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFAFB1B4
          ECCB8EF3D192EECE92EDCC8EF6E4C3F8EAD2FEEED5E4E3E1FFFFFF05900659B3
          5AFFFFFFFFFFFFFFFFFFFFFFFFA4A199FEDFA1F2DAA5F2DBA7F1D79FF9EDD80C
          930B0F960F0E950F1299152DC649119C1A53B154FFFFFFFFFFFFFFFFFFABA596
          FFEBB9F8ECC6F7EBC0F5E3B2FAF1DD0B950C4EE7814EE7814EE7814EE7814CE5
          7E14A01E3EA83FFFFFFFFFFFFFACA9A6FFF7CBFDFAE6FDF9E7F8EDC5FBF4E20C
          960D56EF8956EF8956EF8956EF8954ED8715A1203AA73BFFFFFFFFFFFFD6D6D8
          D5CCB1FFFFF2FFFFF2FBF3D2FBF3E01C9919169E1B159C1B159C1A36CF5415A3
          203EA83FFFFFFFFFFFFFFFFFFFFEFEFEBBBBBCD6CFB6FFFFDCFFF6CAFFF5D8F7
          EDD5E3E3E1F8F8F9FFFFFF04900554B155FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFCFCFD1A4A5A0A8A3979D9A93AAACB0F2F2F2FFFFFFFFFFFF48AC49FFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
        Properties.ReadOnly = False
        TabOrder = 10
        OnKeyPress = cmbEmployeesKeyPress
        Width = 332
      end
      object gList: TcxGrid
        Left = 384
        Top = 60
        Width = 332
        Height = 313
        TabOrder = 11
        LookAndFeel.Kind = lfFlat
        LookAndFeel.NativeStyle = False
        LookAndFeel.SkinName = 'DevExpressStyle'
        object vList: TcxGridDBTableView
          PopupMenu = pmMain
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
          DataController.DataSource = dmActivity.dscParticipants
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
          OptionsData.Inserting = False
          OptionsSelection.HideFocusRectOnExit = False
          OptionsSelection.InvertSelect = False
          OptionsSelection.UnselectFocusedRecordOnExit = False
          OptionsView.FocusRect = False
          OptionsView.NoDataToDisplayInfoText = 'No record found.'
          OptionsView.ScrollBars = ssVertical
          OptionsView.GroupByBox = False
          OptionsView.Indicator = True
          object vListemployee_id: TcxGridDBColumn
            Caption = 'Employee Name'
            DataBinding.FieldName = 'employee_id'
            PropertiesClassName = 'TcxLookupComboBoxProperties'
            Properties.KeyFieldNames = 'employee_id'
            Properties.ListColumns = <
              item
                FieldName = 'employee_name'
              end>
            Properties.ListSource = dmActivity.dscEmployees
            MinWidth = 500
            Options.Editing = False
            Options.Filtering = False
            Options.FilteringFilteredItemsList = False
            Options.FilteringMRUItemsList = False
            Options.FilteringPopup = False
            Options.FilteringPopupMultiSelect = False
            Options.IgnoreTimeForFiltering = False
            Options.IncSearch = False
            Options.GroupFooters = False
            Options.Grouping = False
            Options.HorzSizing = False
            Options.Moving = False
            Width = 500
          end
        end
        object lvlList: TcxGridLevel
          GridView = vList
        end
      end
    end
  end
  inherited ilBaseMain: TcxImageList
    FormatVersion = 1
    DesignInfo = 29360840
  end
  object pmMain: TPopupMenu
    Left = 680
    Top = 451
    object RemoveEmployee1: TMenuItem
      Caption = 'Remove Employee'
      OnClick = RemoveEmployee1Click
    end
  end
end
