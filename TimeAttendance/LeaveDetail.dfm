inherited fLeaveDetail: TfLeaveDetail
  BorderWidth = 1
  Caption = 'fLeaveDetail'
  ClientHeight = 514
  ClientWidth = 1048
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  OnShow = FormShow
  ExplicitWidth = 1066
  ExplicitHeight = 555
  PixelsPerInch = 96
  TextHeight = 14
  inherited pMaster: TJvPanel
    Width = 1048
    Height = 514
    BorderWidth = 0
    ExplicitWidth = 1048
    ExplicitHeight = 514
    object pcMain: TJvPageControl
      Left = 0
      Top = 0
      Width = 1048
      Height = 514
      ActivePage = tsLeaveDetails
      Align = alClient
      MultiLine = True
      TabOrder = 0
      ReduceMemoryUse = True
      object tsLeaveDetails: TTabSheet
        Caption = 'Leave Details'
        object pDetails: TJvPanel
          Left = 0
          Top = 0
          Width = 1040
          Height = 485
          HotTrackFont.Charset = DEFAULT_CHARSET
          HotTrackFont.Color = clWindowText
          HotTrackFont.Height = -11
          HotTrackFont.Name = 'Tahoma'
          HotTrackFont.Style = []
          Align = alClient
          BevelOuter = bvNone
          ParentBackground = False
          TabOrder = 0
          object JvGroupHeader1: TJvGroupHeader
            Left = 27
            Top = 10
            Width = 698
            Height = 18
            Caption = 'Leave Details'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clHighlight
            Font.Height = -12
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
          end
          object JvLabel1: TJvLabel
            Left = 43
            Top = 32
            Width = 55
            Height = 14
            Caption = 'Employee'
            Transparent = True
            HotTrackFont.Charset = DEFAULT_CHARSET
            HotTrackFont.Color = clWindowText
            HotTrackFont.Height = -11
            HotTrackFont.Name = 'Tahoma'
            HotTrackFont.Style = []
          end
          object ghAction: TJvGroupHeader
            Left = 16
            Top = 416
            Width = 709
            Height = 18
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clHighlight
            Font.Height = -12
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
          end
          object JvLabel4: TJvLabel
            Left = 43
            Top = 58
            Width = 42
            Height = 14
            Caption = 'Applied'
            Transparent = True
            HotTrackFont.Charset = DEFAULT_CHARSET
            HotTrackFont.Color = clWindowText
            HotTrackFont.Height = -11
            HotTrackFont.Name = 'Tahoma'
            HotTrackFont.Style = []
          end
          object lblJustification: TJvLabel
            Left = 393
            Top = 32
            Width = 80
            Height = 29
            AutoSize = False
            Caption = 'Justification for late filing'
            Transparent = True
            WordWrap = True
            HotTrackFont.Charset = DEFAULT_CHARSET
            HotTrackFont.Color = clWindowText
            HotTrackFont.Height = -11
            HotTrackFont.Name = 'Tahoma'
            HotTrackFont.Style = []
          end
          object JvGroupHeader2: TJvGroupHeader
            Left = 27
            Top = 110
            Width = 650
            Height = 18
            Caption = 'Leave Dates'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clHighlight
            Font.Height = -12
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
          end
          object JvLabel2: TJvLabel
            Left = 43
            Top = 84
            Width = 37
            Height = 14
            Caption = 'Status'
            Transparent = True
            HotTrackFont.Charset = DEFAULT_CHARSET
            HotTrackFont.Color = clWindowText
            HotTrackFont.Height = -11
            HotTrackFont.Name = 'Tahoma'
            HotTrackFont.Style = []
          end
          object JvGroupHeader3: TJvGroupHeader
            Left = 771
            Top = 110
            Width = 182
            Height = 18
            Caption = 'Date range'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clHighlight
            Font.Height = -12
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
          end
          object JvLabel3: TJvLabel
            Left = 787
            Top = 132
            Width = 29
            Height = 14
            Caption = 'From'
            Transparent = True
            HotTrackFont.Charset = DEFAULT_CHARSET
            HotTrackFont.Color = clWindowText
            HotTrackFont.Height = -11
            HotTrackFont.Name = 'Tahoma'
            HotTrackFont.Style = []
          end
          object JvLabel5: TJvLabel
            Left = 787
            Top = 158
            Width = 26
            Height = 14
            Caption = 'Until'
            Transparent = True
            HotTrackFont.Charset = DEFAULT_CHARSET
            HotTrackFont.Color = clWindowText
            HotTrackFont.Height = -11
            HotTrackFont.Name = 'Tahoma'
            HotTrackFont.Style = []
          end
          object JvLabel6: TJvLabel
            Left = 393
            Top = 71
            Width = 72
            Height = 14
            AutoSize = False
            Caption = 'BM'#39's remarks'
            Transparent = True
            WordWrap = True
            HotTrackFont.Charset = DEFAULT_CHARSET
            HotTrackFont.Color = clWindowText
            HotTrackFont.Height = -11
            HotTrackFont.Name = 'Tahoma'
            HotTrackFont.Style = []
          end
          object lblAvailed: TLabel
            Left = 43
            Top = 396
            Width = 4
            Height = 14
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object bSave: TcxButton
            Left = 43
            Top = 424
            Width = 81
            Height = 27
            Caption = 'Save'
            LookAndFeel.SkinName = ''
            OptionsImage.ImageIndex = 1
            OptionsImage.Images = ilBaseMain
            TabOrder = 9
            OnClick = bSaveClick
          end
          object bCancel: TcxButton
            Left = 125
            Top = 424
            Width = 81
            Height = 27
            Caption = 'Cancel'
            OptionsImage.ImageIndex = 4
            OptionsImage.Images = ilBaseMain
            TabOrder = 10
            OnClick = bCancelClick
          end
          object dtpApplicationDate: TcxDBDateEdit
            Left = 138
            Top = 52
            DataBinding.DataField = 'leave_application_date'
            DataBinding.DataSource = dmLeave.dscLeave
            Enabled = False
            Properties.DisplayFormat = 'mm/dd/yyyy'
            Properties.ImmediatePost = True
            Properties.ReadOnly = False
            Properties.SaveTime = False
            Properties.ShowTime = False
            StyleDisabled.Color = 15925247
            StyleDisabled.TextColor = clBlack
            TabOrder = 1
            Width = 95
          end
          object dbluLeaveType: TcxDBLookupComboBox
            Left = 237
            Top = 52
            DataBinding.DataField = 'leavetype_code'
            DataBinding.DataSource = dmLeave.dscLeave
            Properties.ImmediatePost = True
            Properties.KeyFieldNames = 'leavetype_code'
            Properties.ListColumns = <
              item
                FieldName = 'leavetype_name'
              end>
            Properties.ListOptions.GridLines = glNone
            Properties.ListOptions.ShowHeader = False
            Properties.ListSource = dmLeave.dscLeaveTypes
            Properties.OnEditValueChanged = dbluLeaveTypePropertiesEditValueChanged
            StyleDisabled.Color = 15925247
            StyleDisabled.TextColor = clBlack
            TabOrder = 2
            Width = 109
          end
          object grList: TcxGrid
            Left = 43
            Top = 151
            Width = 682
            Height = 226
            BevelInner = bvNone
            BevelOuter = bvNone
            BorderStyle = cxcbsNone
            TabOrder = 6
            LookAndFeel.NativeStyle = False
            object vwList: TcxGridDBTableView
              PopupMenu = ppList
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
              OnEditing = vwListEditing
              DataController.DataSource = dmLeave.dscLeaveDetail
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
              OptionsData.CancelOnExit = False
              OptionsData.Deleting = False
              OptionsData.DeletingConfirmation = False
              OptionsData.Inserting = False
              OptionsSelection.HideFocusRectOnExit = False
              OptionsSelection.InvertSelect = False
              OptionsSelection.UnselectFocusedRecordOnExit = False
              OptionsView.FocusRect = False
              OptionsView.NoDataToDisplayInfoText = 'No record found.'
              OptionsView.ScrollBars = ssNone
              OptionsView.CellAutoHeight = True
              OptionsView.GridLineColor = 8421440
              OptionsView.GridLines = glNone
              OptionsView.GroupByBox = False
              OptionsView.Header = False
              OptionsView.RowSeparatorColor = 12303291
              OptionsView.RowSeparatorWidth = 1
              Styles.Background = dmLeave.csBackground
              Styles.Content = dmLeave.csContent
              Styles.NewItemRowInfoText = dmLeave.csNewRow
              object vwListleave_date: TcxGridDBColumn
                DataBinding.FieldName = 'leave_date'
                PropertiesClassName = 'TcxDateEditProperties'
                Properties.DisplayFormat = 'mm/dd/yyyy'
                Properties.EditFormat = 'mm/dd/yyyy '
                Properties.ImmediatePost = True
                Properties.SaveTime = False
                Properties.ShowTime = False
                MinWidth = 90
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
                Options.ShowCaption = False
                Width = 90
              end
              object vwListis_paid: TcxGridDBColumn
                DataBinding.FieldName = 'is_paid'
                PropertiesClassName = 'TcxCheckBoxProperties'
                Properties.DisplayChecked = '1'
                Properties.DisplayUnchecked = '0'
                Properties.DisplayGrayed = '0'
                Properties.ImmediatePost = True
                Properties.NullStyle = nssUnchecked
                Properties.ValueChecked = '1'
                Properties.ValueGrayed = '0'
                Properties.ValueUnchecked = 0
                MinWidth = 30
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
                Options.ShowCaption = False
                Width = 30
              end
              object vwListam_pm: TcxGridDBColumn
                DataBinding.FieldName = 'am_pm'
                PropertiesClassName = 'TcxLookupComboBoxProperties'
                Properties.ClearKey = 46
                Properties.ImmediatePost = True
                Properties.KeyFieldNames = 'value'
                Properties.ListColumns = <
                  item
                    FieldName = 'display'
                  end>
                Properties.ListOptions.GridLines = glNone
                Properties.ListOptions.ShowHeader = False
                Properties.ListSource = dmLeave.dscAMPM
                MinWidth = 45
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
                Options.ShowCaption = False
                Width = 45
              end
              object vwListleavereason_code: TcxGridDBColumn
                DataBinding.FieldName = 'leavereason_code'
                PropertiesClassName = 'TcxLookupComboBoxProperties'
                Properties.ImmediatePost = True
                Properties.KeyFieldNames = 'leavereason_code'
                Properties.ListColumns = <
                  item
                    FieldName = 'leavereason_name'
                  end>
                Properties.ListOptions.GridLines = glNone
                Properties.ListOptions.ShowHeader = False
                Properties.ListSource = dmLeave.dscReasonsList
                MinWidth = 229
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
                Options.ShowCaption = False
                Width = 229
              end
              object vwListleave_remarks: TcxGridDBColumn
                DataBinding.FieldName = 'leave_remarks'
                PropertiesClassName = 'TcxTextEditProperties'
                MinWidth = 207
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
                Options.ShowCaption = False
                Width = 207
              end
              object vwListleavestatus_code: TcxGridDBColumn
                DataBinding.FieldName = 'leavestatus_code'
                PropertiesClassName = 'TcxImageComboBoxProperties'
                Properties.DefaultDescription = 'Pending'
                Properties.DefaultImageIndex = 0
                Properties.Images = dmLeave.ilLeaveStatus
                Properties.ImmediatePost = True
                Properties.Items = <
                  item
                    Description = 'Pending'
                    ImageIndex = 0
                    Value = 'PND'
                  end
                  item
                    Description = 'Approved'
                    ImageIndex = 1
                    Value = 'APP'
                  end
                  item
                    Description = 'Denied'
                    ImageIndex = 2
                    Value = 'DND'
                  end
                  item
                    Description = 'Cancelled'
                    ImageIndex = 3
                    Value = 'CNL'
                  end>
                MinWidth = 81
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
                Options.ShowCaption = False
                Width = 81
              end
            end
            object lvlList: TcxGridLevel
              GridView = vwList
            end
          end
          object Panel1: TPanel
            Left = 43
            Top = 128
            Width = 90
            Height = 17
            Caption = 'Date'
            Font.Charset = ANSI_CHARSET
            Font.Color = clGray
            Font.Height = -12
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            TabOrder = 7
          end
          object Panel3: TPanel
            Left = 163
            Top = 128
            Width = 45
            Height = 17
            Caption = 'AM/PM'
            Font.Charset = ANSI_CHARSET
            Font.Color = clGray
            Font.Height = -12
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            TabOrder = 8
          end
          object mmJustification: TcxDBMemo
            Left = 488
            Top = 26
            DataBinding.DataField = 'justification'
            DataBinding.DataSource = dmLeave.dscLeave
            StyleDisabled.Color = 15925247
            StyleDisabled.TextColor = clBlack
            TabOrder = 4
            Height = 35
            Width = 237
          end
          object Panel4: TPanel
            Left = 133
            Top = 128
            Width = 30
            Height = 17
            Caption = 'Paid'
            Font.Charset = ANSI_CHARSET
            Font.Color = clGray
            Font.Height = -12
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            TabOrder = 11
          end
          object dbluEmployees: TcxDBLookupComboBox
            Left = 138
            Top = 26
            DataBinding.DataField = 'id_num'
            DataBinding.DataSource = dmLeave.dscLeave
            Properties.ImmediatePost = True
            Properties.KeyFieldNames = 'id_num'
            Properties.ListColumns = <
              item
                FieldName = 'employee_name'
              end>
            Properties.ListOptions.GridLines = glNone
            Properties.ListOptions.ShowHeader = False
            Properties.ListSource = dmLeave.dscEmployees
            StyleDisabled.Color = 15925247
            StyleDisabled.TextColor = clBlack
            TabOrder = 0
            Width = 208
          end
          object Panel5: TPanel
            Left = 644
            Top = 128
            Width = 81
            Height = 17
            Caption = 'Status'
            Font.Charset = ANSI_CHARSET
            Font.Color = clGray
            Font.Height = -12
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            TabOrder = 12
          end
          object icmbStatus: TcxDBImageComboBox
            Left = 138
            Top = 78
            DataBinding.DataField = 'leaveappstatus_code'
            DataBinding.DataSource = dmLeave.dscLeave
            ParentShowHint = False
            Properties.DefaultDescription = 'Pending'
            Properties.DefaultImageIndex = 0
            Properties.DropDownRows = 4
            Properties.Images = dmLeave.ilLeaveStatus
            Properties.ImmediatePost = True
            Properties.Items = <
              item
                Description = 'Pending'
                ImageIndex = 0
                Value = 'PND'
              end
              item
                Description = 'Approved'
                ImageIndex = 1
                Value = 'APP'
              end
              item
                Description = 'Denied'
                ImageIndex = 2
                Value = 'DND'
              end
              item
                Description = 'Cancelled'
                ImageIndex = 3
                Value = 'CNL'
              end>
            Properties.PostPopupValueOnTab = True
            ShowHint = True
            Style.BorderColor = clMenu
            Style.BorderStyle = ebsFlat
            Style.Color = clWindow
            Style.Edges = [bLeft, bTop, bRight, bBottom]
            Style.HotTrack = True
            Style.LookAndFeel.NativeStyle = True
            Style.Shadow = False
            Style.TransparentBorder = True
            StyleDisabled.BorderStyle = ebsFlat
            StyleDisabled.Color = 15925247
            StyleDisabled.LookAndFeel.NativeStyle = True
            StyleDisabled.TextColor = clBlack
            StyleDisabled.ButtonStyle = btsFlat
            StyleFocused.LookAndFeel.NativeStyle = True
            StyleHot.LookAndFeel.NativeStyle = True
            TabOrder = 3
            Width = 208
          end
          object Panel6: TPanel
            Left = 208
            Top = 128
            Width = 229
            Height = 17
            Caption = 'Reason'
            Font.Charset = ANSI_CHARSET
            Font.Color = clGray
            Font.Height = -12
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            TabOrder = 13
          end
          object Panel7: TPanel
            Left = 437
            Top = 128
            Width = 207
            Height = 17
            Caption = 'Remarks'
            Font.Charset = ANSI_CHARSET
            Font.Color = clGray
            Font.Height = -12
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            TabOrder = 14
          end
          object btnAddDate: TcxButton
            Left = 679
            Top = 107
            Width = 24
            Height = 21
            Hint = 'Add date'
            LookAndFeel.SkinName = ''
            OptionsImage.ImageIndex = 7
            OptionsImage.Images = ilBaseMain
            ParentShowHint = False
            ShowHint = True
            SpeedButtonOptions.CanBeFocused = False
            SpeedButtonOptions.Flat = True
            TabOrder = 15
            OnClick = btnAddDateClick
          end
          object btnRemoveDate: TcxButton
            Left = 703
            Top = 107
            Width = 22
            Height = 21
            Hint = 'Remove date'
            LookAndFeel.SkinName = ''
            OptionsImage.ImageIndex = 8
            OptionsImage.Images = ilBaseMain
            ParentShowHint = False
            ShowHint = True
            SpeedButtonOptions.CanBeFocused = False
            SpeedButtonOptions.Flat = True
            TabOrder = 16
            OnClick = btnRemoveDateClick
          end
          object dtpLeaveFrom: TcxDateEdit
            Left = 832
            Top = 126
            Properties.DisplayFormat = 'mm/dd/yyyy'
            Properties.EditFormat = 'mm/dd/yyyy'
            TabOrder = 17
            Width = 121
          end
          object dtpLeaveUntil: TcxDateEdit
            Left = 832
            Top = 152
            Properties.DisplayFormat = 'mm/dd/yyyy'
            Properties.EditFormat = 'mm/dd/yyyy'
            TabOrder = 18
            Width = 121
          end
          object btnApplyDateRange: TcxButton
            Left = 832
            Top = 185
            Width = 121
            Height = 21
            Caption = 'Apply'
            LookAndFeel.SkinName = ''
            OptionsImage.Images = ilBaseMain
            TabOrder = 19
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
            OnClick = btnApplyDateRangeClick
          end
          object mmRemarks: TcxDBMemo
            Left = 488
            Top = 65
            DataBinding.DataField = 'leave_remarks'
            DataBinding.DataSource = dmLeave.dscLeave
            StyleDisabled.Color = 15925247
            StyleDisabled.TextColor = clBlack
            TabOrder = 5
            Height = 35
            Width = 237
          end
        end
      end
    end
  end
  inherited ilBaseMain: TcxImageList
    FormatVersion = 1
    DesignInfo = 30409544
    ImageInfo = <
      item
        Image.Data = {
          36040000424D3604000000000000360000002800000010000000100000000100
          2000000000000004000000000000000000000000000000000000000000000000
          0007000000180000001A0000001A0000001A0000001A0000001A0000001A0000
          001A0000001A0228009E034400D10228009E0000000700000000000000000505
          01690C0C03870C0C03870C0C03870C0C03870C0C03870C0C03870C0C03870C0C
          03870C0C03870C6301E72ADF19FF0C6301E70505016900000000000000000E0E
          0681F9F9E9FFF3F3E2FFF3F3E2FFF3F3E2FFF3F3E2FFF3F3E2FFF3F3E2FF6BB8
          5CFF3AA12DFF3AA12DFF3CE22BFF3CA22EFF0F6A02E604320099000000001111
          097AF4F4E4FFAAAA99FFE8E8D8FFE8E8D8FFE8E8D8FFE8E8D8FFE8E8D8FF3AA6
          2AFF51E740FF51E740FF51E740FF51E740FF51E740FF0A5E00CC000000001212
          0A77F5F5E6FFEAEADBFFEAEADBFFEAEADBFFEAEADBFFEAEADBFFEAEADBFF67BC
          57FF3CAD2BFF3CAD2BFF65EB54FF3EAF2DFF137703E406380099000000001212
          0A75F6F6E9FFE6A887FFE7AB89FFE7AB89FFE7AC8CFFE3A990FFD8987CFFD289
          6EFFE1A181FF3DA51BFF74EE63FF40B42EFF12120A7500000000000000001212
          0B73F7F7EBFFDA8E74FFDD977AFFE1A383FFE3AC91FFE3BCB5FFE2BDB6FFD6A0
          85FFC87D64FF5F9D2BFF3DA91AFF70CA5FFF12120B7300000000000000001313
          0C72F8F8EEFFD58E74FFD28A70FFCF866CFFD49C84FFDBB9B2FFDBBCB9FFD4A6
          91FFC17B60FFBD745AFFC78467FFF8F8EEFF13130C7200000000000000001313
          0C70F9F9F1FFD19179FFD49A83FFD19377FFCE9275FFD1A48FFFD0A793FFC58C
          6FFFB9735AFFB66F56FFB46D54FFF9F9F1FF13130C7000000000000000001313
          0C6EFBFBF4FFD19F81FFD7AB90FFD6A98DFFD3A487FFD09E81FFCD997AFFCC95
          73FFC48968FFAD6950FFAA674EFFFBFBF4FF13130C6E00000000000000001414
          0C6DFCFCF7FFC89677FFD1A68DFFD1A68CFFD0A48BFFCFA388FFCDA084FFCC9D
          81FFCA9A7CFFC69375FFB3785CFFFCFCF7FF14140C6D00000000000000001414
          0C6BFDFDF9FFBA8160FFC18C6EFFC28D6FFFC28D6FFFC28D6FFFC18D6DFFC18B
          6CFFC08A6AFFBE8867FFB87D5CFFFDFDF9FF14140C6B00000000000000001414
          0D6AFEFEFCFFFCFCFAFFFCFCFAFFFCFCFAFFFCFCFAFFFCFCFAFFFCFCFAFFFCFC
          FAFFFCFCFAFFFCFCFAFFFCFCFAFFFEFEFCFF14140D6A00000000000000001414
          0D68FFFFFEFFBFBFA9FFFEFEFDFFFEFEFDFFFEFEFDFFFEFEFDFFFEFEFDFFFEFE
          FDFFFEFEFDFFFEFEFDFFBFBFA9FFFFFFFEFF14140D6800000000000000001414
          0D67FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF14140D6700000000000000000B0B
          074D14140D6614140D6614140D6614140D6614140D6614140D6614140D661414
          0D6614140D6614140D6614140D6614140D660B0B074D00000000}
        Mask.Data = {
          7E000000424D7E000000000000003E0000002800000010000000100000000100
          010000000000400000000000000000000000020000000000000000000000FFFF
          FF00000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000}
      end
      item
        Image.Data = {
          36040000424D3604000000000000360000002800000010000000100000000100
          20000000000000040000000000000000000000000000000000003A20108F5D35
          1AB5A05B2DEEB76734FFB56734FFB46633FFB26533FFB06432FFAE6332FFAC62
          31FFAA6131FFA96031FFA85F30FFA55F30FE94552BF163391DC48D4F27DEEBC6
          ADFFEAC5ADFFFEFBF8FFFEFBF8FFFEFBF8FFFEFBF8FFFEFBF8FFFEFBF8FFFEFB
          F8FFFEFBF8FFFEFBF8FFFEFBF8FFC89A7BFFC79878FF90522AEDB86A36FEEDCA
          B3FFE0A279FFFEFAF7FF61C088FF61C088FF61C088FF61C088FF61C088FF61C0
          88FF61C088FF61C088FFFDF9F6FFCA8D64FFC99B7BFFA55F30FEBB6B37FFEECC
          B6FFE1A279FFFEFAF7FFBFDCC2FFBFDCC2FFBFDCC2FFBFDCC2FFBFDCC2FFBFDC
          C2FFBFDCC2FFBFDCC2FFFDF9F6FFCD9067FFCC9E81FFA86031FFBB6A37FFEFCE
          B8FFE1A278FFFEFAF7FF61C088FF61C088FF61C088FF61C088FF61C088FF61C0
          88FF61C088FF61C088FFFDF9F6FFCF9369FFCEA384FFAA6031FFBA6935FFEFD0
          BBFFE2A279FFFEFBF8FFFEFBF8FFFEFBF8FFFEFBF8FFFEFBF8FFFEFBF8FFFEFB
          F8FFFEFBF8FFFEFBF8FFFEFBF8FFD3966CFFD2A78AFFAB6131FFBB6935FFF0D2
          BEFFE2A379FFE2A379FFE1A379FFE2A37AFFE1A37AFFE0A177FFDE9F76FFDD9F
          75FFDC9D73FFD99B71FFD89970FFD6996FFFD5AB8EFFAD6232FFBB6935FFF2D5
          C2FFE3A379FFE3A379FFE2A37AFFE2A37AFFE2A47AFFE1A278FFE0A177FFDEA0
          76FFDE9E74FFDC9D73FFDA9B72FFD99B72FFDAB095FFAF6332FFBB6935FFF2D8
          C5FFE3A47AFFE3A379FFE3A479FFE2A47AFFE2A37AFFE1A37AFFE1A278FFDFA0
          76FFDE9F75FFDD9E73FFDB9C71FFDC9D73FFDDB59AFFB16433FFBB6A35FFF4D9
          C7FFE6A67CFFC88C63FFC98D64FFC98E66FFCB926BFFCB926CFFCA9068FFC88C
          64FFC88C63FFC88C63FFC88C63FFDA9C73FFE1BA9FFFB36533FFB96A35FEF4DC
          C9FFE7A77CFFF9ECE1FFF9ECE1FFF9EDE3FFFCF4EEFFFDFAF7FFFDF7F3FFFAED
          E5FFF7E7DBFFF7E5D9FFF6E5D8FFDEA076FFE4BEA4FFB46633FFB46633FAF5DD
          CCFFE7A87DFFFAF0E8FFFAF0E8FFC98D65FFFAF0E9FFFDF8F3FFFEFAF8FFFCF4
          EFFFF9E9DFFFF7E7DBFFF7E5D9FFE0A277FFE7C2A9FFB66734FFA65E2FF0F6DF
          D0FFE8A87DFFFCF6F1FFFCF6F1FFC88C63FFFAF1E9FFFBF4EEFFFDFAF7FFFDF9
          F6FFFAF0E8FFF8E8DDFFF7E6DBFFE1A379FFEFD5C3FFB56834FE874C26D8F6DF
          D1FFE9AA80FFFEFAF6FFFDFAF6FFC88C63FFFBF3EEFFFBF1EAFFFCF6F2FFFEFB
          F8FFFCF6F1FFF9ECE2FFF8E7DBFFEED0BAFFECD0BDFFB1693AF84527139BF6E0
          D1FFF7E0D1FFFEFBF8FFFEFBF7FFFDF9F6FFFCF5F0FFFAF0EAFFFBF2EDFFFDF9
          F6FFFDFAF7FFFBF1EBFFF6E7DDFEE4C9B7FBAC7550EC1B0F086324140A713B21
          1090784422CCA35C2EEEB46633FAB96A35FEBB6A35FFBB6935FFBB6935FFBC6B
          38FFBD6D3AFFBB6C39FFA45D30EF764626CB130B055400000000}
        Mask.Data = {
          7E000000424D7E000000000000003E0000002800000010000000100000000100
          010000000000400000000000000000000000020000000000000000000000FFFF
          FF00000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000}
      end
      item
        Image.Data = {
          36040000424D3604000000000000360000002800000010000000100000000100
          2000000000000004000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000B07
          07469A6C6CF37A5A59D33B27259C181010650503032F00000003000000000000
          000000000000000000000000000000000000000000000000000000000000140D
          0D5ED0A9A7FEFFFFFFFF98A9FFFFF0D8D4FFD3B1B3FFAA8889F3644545C02F1E
          1E890906063A0000000000000000000000000000000000000000000000001B12
          126DD7B1ADFEFFF7E0FF99A3E8FFFFF1D8FFF9E1CEFFFFECDDFFFFF5F1FFFAE6
          E7FF422B2BA20000000000000000000000000000000000000000000000002418
          187BDEBAB2FEFFF6DDFF9DA5E8FFF8E3D0FFD6C9C6FFFFF7F3FFFFEBDDFFFFE0
          CDFF3121218B0000000000000000000000000000000000000000000000002D1D
          1D89E6C6C4FEFFFEF4FFA0B1FDFFF0E7E2FF414A52FF777069FFB6B28DFFFED9
          CAFF241718740000000000000000000000000000000000000000000000003825
          2597EFD2D0FEFFFAE9FFA3ACEBFFFFF4DDFF659EA8FF23A941FF129A2AFF357C
          31FF180F105D000000000000000000000000000000000000000000000000432D
          2DA5F5D8CFFEFFF6E0FFA4AEEAFFFFF4E0FF4DBB71FF61FF96FF51E17AFF1D9C
          32FF003001A20000000100000000000000000000000000000000000000005338
          38B3F9E3DDFEFFFDEFFFA8B7F5FFFFFBF5FF99D9A4FF3ADC6BFF63FE96FF4CDA
          73FF1D962EFF0125028B00000000000000000000000000000000000000006647
          47C2FBEAE7FEFFFFF4FFAABAF5FFFFF8E9FFFFF4EEFF63CF86FF49E778FF62FB
          95FF48D36BFF158E24FE001B0076000000000000000000000000000000007A56
          57D0FDEADDFEFFFAE2FFB0BBEEFFFFF8DFFFFFF2E0FFFFEFDFFF4ACD70FF54F3
          86FF5CFE90FF5AA168FF6D6D66FE1616146F0000000000000000000000009368
          68DEE0D9DBFDE2E4E3FFA8B3D6FFB3B4B3FFA1A2A3FFA6A2A4FFACAEADFF24C0
          55FF8ABF99FFDFD4D2FF6976C1FF1523B1FC00000C450000000000000000AB7C
          7CECC0B6B5FD817D81FF68646BFF6C6160FF908080FF887777FE766262EF374B
          3BE4CDC4BFFA7892F3FF3761F2FF1E35C7FF000077E100000000000000003E30
          30A74D3C3CB8332F2FC23E3C3CDF424141E1343232C8353535CB393939CD0F0F
          0E6D1A1C276C2A4FE4FE426BF4FF1524B8FF00004CB500000000000000000303
          03282C2D2DB21F1F1F94121212710A0A0A540505053B010101240000000D0000
          000000000000050831820B1299F200004AB30000001400000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000}
        Mask.Data = {
          7E000000424D7E000000000000003E0000002800000010000000100000000100
          010000000000400000000000000000000000020000000000000000000000FFFF
          FF00000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000}
      end
      item
        Image.Data = {
          36040000424D3604000000000000360000002800000010000000100000000100
          2000000000000004000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000E00000014000000190000001900000016000000100000000B000000080000
          0007000000080000000B0000000E000000110000001300000000000000000000
          001C0000065E000038CC00002FBC0000014200000020000000160000000F0000
          000D00000010000000150000001B000001380000034C00000000000000000000
          000000003CCC1010D9FE0A0A96EC00001C8B0000000000000000000000000000
          0000000000000000000000000000000013730000023200000000000000000000
          000000001E8C080880E51111DDFF010151D30000043300000000000000000000
          0000000000000000000000001B8400001D890000000400000000000000000000
          00000000011F000046CC1414CAFB0F0FB3F4000036B400000011000000000000
          00000000000000001C82000038B8000007410000000000000000000000000000
          0000000000000000126709096FDC1616CCFF0B0B82E500001975000000000000
          00000000259102025FD500002086000000000000000000000000000000000000
          0000000000000000000000002891101086E51C1CBBFD04045FD4000012630000
          3AAE07076EDC00003FB600000000000000000000000000000000000000000000
          000000000000000000000000001500003FB015158AE72020ACF904045FD20F0F
          7BE103035FD20000000000000000000000000000000000000000000000000000
          00000000000000000000000000000000053300005ACC2C2CAAF33030B4FA0505
          68D4000000000000000000000000000000000000000000000000000000000000
          0000000000000000053300002B8A00005FCC3838B2EE4F4FD5FD1F1F91E32525
          96E3000047B10000011800000000000000000000000000000000000000000000
          000000001966000064CC2B2BA2E56161EAFF5353DAFA0F0F7BD6000006330505
          419F1E1E8FDD00004EB40000021F000000000000000000000000000000000000
          0000000069CC7373FCFF6A6AF2FE2A2AA5E5000069CC00000000000000000000
          000000002F8904046ECF00005ABD00000D4A0000000100000000000000000000
          000000000D4800006CCC00006CCC000037930000000000000000000000000000
          0000000000000000042B0000297E000050B000001B6600000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000}
        Mask.Data = {
          7E000000424D7E000000000000003E0000002800000010000000100000000100
          010000000000400000000000000000000000020000000000000000000000FFFF
          FF00000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000}
      end
      item
        Image.Data = {
          36040000424D3604000000000000360000002800000010000000100000000100
          2000000000000004000000000000000000000000000000000000000000090000
          00160000001A0000001A0000001A0000001A0000001A0000001A0000001A0000
          001A0000001A0000001A0000001A0000001A0000001600000009000000120000
          003300001383000032BC00003ACC00003ACC00003ACC00003ACC00003ACC0000
          3ACC00003ACC00003ACC000032BC000013830000003300000012000000000000
          167306066DDD0F0FC2F91010D9FF1010D9FF1010D9FF1010D9FF1010D9FF1010
          D9FF1010D9FF1010D9FF0E0EC2F905056DDD0000167300000000000000000000
          42BA1414C1F91212D2FF1616D4FF0D0DA4EF03036DD9010158CF010158CF0303
          6DD90A0AA4EF1010D1FF1010D1FF0E0EBEF9000042BA00000000000000000000
          54CC1D1DCFFF1F1FD0FF0B0B86E4000038AA0000073F0000000F0000000F0000
          1E7C000051CC1010C8FF1010C8FF1010C8FF000054CC00000000000000000000
          57CC2F2FD1FF1C1CA2EF000038AA00000013000000000000000000000A480000
          51CC1717C2FF000051CC0C0C98EF1111BEFF000057CC00000000000000000000
          5ACC4B4BDBFF0B0B6DD90000073F000000000000000000000A48000051CC2222
          C1FF000051CC00001E7C050568D91818BAFF00005ACC00000000000000000000
          5DCC5F5FE8FF040458CF0000000F0000000000000A48000051CC3030C4FF0000
          51CC00000A480000000F010156CF2424BBFF00005DCC00000000000000000000
          5FCC6666EFFF040458CF0000000F00000A48000051CC3F3FCDFF000051CC0000
          0A48000000000000000F010157CF3131BFFF00005FCC00000000000000000000
          62CC6A6AF3FF151572D900001E7C000051CC5B5BE5FF000051CC00000A480000
          0000000000000000073F0B0B69D94040CAFF000062CC00000000000000000000
          64CC6A6AF3FF4545BAEF141472D96A6AF3FF000051CC00000A48000000000000
          000000000013000038AA3939AFEF5858E1FF000064CC00000000000000000000
          68CC6161EAFF6C6CF5FF7272FBFF141472D900001E7C0000000F0000000F0000
          073F000038AA292993E46262EBFF5B5BE4FF000068CC00000000000000000000
          57BA5B5BE0F95A5AE3FF7070F9FF4949BFEF161676D9040459CF040459CF1616
          75D94646BDEF6C6CF5FF5D5DE6FF5656DCF9000057BA00000000000000000000
          22731F1F95DD5E5EE3F96C6CF5FF7474FDFF7676FFFF7676FFFF7676FFFF7575
          FEFF7272FBFF6C6CF5FF5D5DE2F91F1F94DD0000227300000000000000000000
          000C0000227300005ABA00006DCC00006DCC00006DCC00006DCC00006DCC0000
          6DCC00006DCC00006DCC00005ABA000022730000000C00000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000}
        Mask.Data = {
          7E000000424D7E000000000000003E0000002800000010000000100000000100
          010000000000400000000000000000000000020000000000000000000000FFFF
          FF00000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000}
      end
      item
        Image.Data = {
          36040000424D3604000000000000360000002800000010000000100000000100
          2000000000000004000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00009B7C6BFF9D7E6DFF9C7E6DFF9C7E6DFF9F8271FFC7BAB0FF709F64FF2B81
          1EFF1E7108FF31781DFF6C9661FFC6BBAFFF0000000000000000000000000000
          00009B7766FFFFFFFFFFFAF4E9FFFAF4E9FFF6F5EEFF41A43EFF009A00FF00A2
          07FF009700FF0E8900FF2E7100FF3C7C2DFF0003000700000000000000000000
          0000A27F6FFFFFFFFFFFDDC2B5FFE6D2C8FF82B779FF0DA71AFF2CB53FFFFDFB
          FFFF6FD488FF009800FF009500FF307000FF0031007C00000000000000000000
          0000A38070FFFFFFFFFFDBC3BBFFECDFDAFF43AA47FF2EB33CFFF5ECF4FFFFF6
          FFFFFFFFFFFF6FD588FF009A00FF128800FF105C00D900000000000000000000
          0000A98778FFFFFFFFFFDBC7C2FFEEE4E2FF3AAE44FF5DB964FFC0D6BCFF03AD
          21FF9DDBA7FFFFFFFFFF6DD487FF009500FF156C00F500000000000000000000
          0000AB897AFFFFFFFFFFDBC7C3FFECE1DEFF4EB557FF43CD6DFF19BB42FF25C0
          4FFF0BB22EFF9DD9A5FFFFFFFFFF67CF7CFF086000D700000000000000000000
          0000AF8E7FFFFFFFFFFFDCC5C0FFE5D4CFFF85C07EFF72DD96FF35CE6AFF2EC7
          5EFF25BE4BFF09AF27FF8BD094FF4EBB59FF0037007900000000000000000000
          0000AF8F80FFFFFFFFFFFEFEFEFFFEFEFEFFF9FBF9FF5AC060FF71DD96FF4AD3
          7AFF29C252FF1CB73BFF0DAA22FF369530FF0003000600000000000000000000
          0000AF8F80FFFFFFFFFFDFCECCFFDFCDCBFFDFCBC7FFE9DFDAFF86C07EFF52B8
          5BFF3CB148FF44AC48FF89C486FFC7BAAFFF0000000000000000000000000000
          0000B19080FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFEFFFEFEFCFFFEFD
          FBFFFEFCFAFFFCF9F6FFF4EEE8FF9F8072FE0000000000000000000000000000
          0000B79787FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFEFFFEFDFBFFFDFB
          F9FFA78270FFA78270FFA78270FFA78270FF0000000000000000000000000000
          0000B89888FFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFEFFFEFEFDFFFEFCFAFFFDFB
          F9FFA78270FFF5E2D9FFB18E7EFF3A2D27580000000000000000000000000000
          0000B89888FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFA78270FFB18E7EFF3A2D2758000000000000000000000000000000000000
          0000B89888FFB89888FFB49383FFB49383FFB08E7DFFB08E7DFFAC8877FFAC88
          77FFA78270FF3A2D275800000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000}
      end
      item
        Image.Data = {
          36040000424D3604000000000000360000002800000010000000100000000100
          2000000000000004000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00009B7C6BFF9D7E6DFF9C7E6DFF9C7E6DFF9C7E6DFF9C7D6DFF9C7D6CFF9B7C
          6BFF9B7C6BFF9A7C6AFF997B68FF9B7C6BFF0000000000000000000000000000
          00009B7766FFFFFFFFFFFAF4E9FFFAF4E9FFFAF4E9FFFAF3E8FFFAF3E7FFFAF2
          E6FFFAF1E4FFF9EFE0FFF8EDDAFF977967FF0000000000000000000000000000
          0000A27F6FFFFFFFFFFFFCF6EDFFCDCBE6FF2242E2FF1338E5FF1135E4FF1E3B
          DDFFCDC8DEFFFAF2E6FFFAF1E2FF987968FF0000000000000000000000000000
          0000A38070FFFFFFFFFFCDCEEBFF274FF1FF1D50FFFF194DFFFF1748FFFF1347
          FFFF1C41EDFFCDC8E0FFFAF3E6FF997A6AFF0000000000000000000000000000
          0000A98778FFFFFFFFFF294EEEFF2456FFFF1D4EFFFF184BFFFF1347FFFF0E42
          FFFF1044FFFF1D3CE1FFFBF4E8FF997B6BFF0000000000000000000000000000
          0000AB897AFFFFFFFFFF1A45F2FFABBFFFFF9EB4FFFF95ACFFFFF5F8FFFFC7D4
          FFFF3662FFFF0C32E7FFFBF5EAFF9A7C6BFF0000000000000000000000000000
          0000AF8E7FFFFFFFFFFF1E49F5FFD5DFFFFF8EA8FFFFB5C6FFFFF9F9FFFFC9D5
          FFFFC4D0FFFF0931EBFFFBF5ECFF9B7C6BFF0000000000000000000000000000
          0000AF8F80FFFFFFFFFF335DF8FF4370FFFF4773FFFF4670FFFF2E5EFFFF2354
          FFFF2153FFFF2144EAFFFCF6EDFF9B7C6CFF0000000000000000000000000000
          0000AF8F80FFFFFFFFFFCED7FEFF3D68FDFF4270FFFF3A68FFFF2B5BFFFF2557
          FFFF2751F7FFCDCFEDFFFCF6EEFF9C7C6DFF0000000000000000000000000000
          0000B19080FFFFFFFFFFFFFFFFFFCED7FEFF3460FBFF2653F9FF214EF7FF2952
          F5FFCDD1F2FFF9F4EEFFF0E8E0FF9E7F70FE0000000000000000000000000000
          0000B79787FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFEFFFEFDFBFFFDFB
          F9FFA78270FFA78270FFA78270FFA78270FF0000000000000000000000000000
          0000B89888FFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFEFFFEFEFDFFFEFCFAFFFDFB
          F9FFA78270FFF5E2D9FFB18E7EFF3A2D27580000000000000000000000000000
          0000B89888FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFA78270FFB18E7EFF3A2D2758000000000000000000000000000000000000
          0000B89888FFB89888FFB49383FFB49383FFB08E7DFFB08E7DFFAC8877FFAC88
          77FFA78270FF3A2D275800000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000}
      end
      item
        Image.Data = {
          36040000424D3604000000000000360000002800000010000000100000000100
          2000000000000004000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000060000
          00160000001A0000001A0000001A0000001A0000001A0000001A0000001A0000
          001A0000001A0000001A0000001A0000001A00000016000000060F0F04681818
          078618180786101002780909035C101002781818078618180786181807861818
          0786101002780909035C1010027818180786181807860F0F046821210F7EF9F9
          E9FFF3F3E3FFFFFFEFFF21210F7EFFFFEFFFF3F3E3FFF3F3E3FFF3F3E3FFF3F3
          E3FFFFFFEFFF21210F7EFFFFEFFFF3F3E3FFF9F9E9FF21210F7E28281678F4F4
          E6FFE9E9DAFF747462BC10100278747462BCE9E9DAFFE9E9DAFFE9E9DAFFE9E9
          DAFF747462BC10100278747462BCE9E9DAFFF4F4E6FF2828167829291875F6F6
          E8FFEBEBDEFFF6F6E8FFF6F6E8FFF6F6E8FFEBEBDEFFEBEBDEFFEBEBDEFFEBEB
          DEFFF6F6E8FFF6F6E8FFF6F6E8FFEBEBDEFFF6F6E8FF292918752B2B1A73F7F7
          ECFFEEEEE3FFEEEEE3FFEEEEE3FFEEEEE3FFEEEEE3FFEEEEE3FFEEEEE3FFEEEE
          E3FFEEEEE3FFEEEEE3FFEEEEE3FFEEEEE3FFF7F7ECFF2B2B1A732D2D1B71F9F9
          EFFFF1F1E8FFF1F1E8FFF1F1E8FFF1F1E8FFF1F1E8FFF1F1E8FFF1F1E8FFF1F1
          E8FFF1F1E8FFF1F1E8FFF1F1E8FFF1F1E8FFF9F9EFFF2D2D1B712E2E1D6FFAFA
          F3FFF5F5EEFFF5F5EEFFF5F5EEFFF5F5EEFFF5F5EEFFF5F5EEFFF5F5EEFFF5F5
          EEFFF5F5EEFFF5F5EEFFF5F5EEFFF5F5EEFFFAFAF3FF2E2E1D6F2F2F1E6DFCFC
          F7FFF8F8F3FFF8F8F3FFF8F8F3FFF8F8F3FFF8F8F3FFF8F8F3FFF8F8F3FFF8F8
          F3FFF8F8F3FF67A461FF368531FF67A461FFFCFCF7FF2F2F1E6D31311F6BFDFD
          FAFFFBFBF7FFFBFBF7FFFBFBF7FFFBFBF7FFFBFBF7FFFBFBF7FFFBFBF7FFFBFB
          F7FFFBFBF7FF3C9B32FF2BDF1AFF3C9B32FFFDFDFAFF31311F6B31312169FEFE
          FDFFFDFDFBFFFDFDFBFFFDFDFBFFFDFDFBFFFDFDFBFFFDFDFBFFFDFDFBFF6EBA
          64FF3EA332FF3EA332FF3DE22CFF3EA332FF3EA333FF256614C333332168FFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF40AA
          33FF52E741FF52E741FF52E741FF52E741FF52E741FF178207E126261A4D3333
          2267333322673333226733332267333322673333226733332267333322672870
          15C2198807E1198807E166EB55FF198807E1198807E1136505A9000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000108300CC75EE64FF108300CC0000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000D650099118700CC0D6500990000000000000000}
      end
      item
        Image.Data = {
          36040000424D3604000000000000360000002800000010000000100000000100
          2000000000000004000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000060000
          00160000001A0000001A0000001A0000001A0000001A0000001A0000001A0000
          001A0000001A0000001A0000001A0000001A00000016000000060F0F04681818
          078618180786101002780909035C101002781818078618180786181807861818
          0786101002780909035C1010027818180786181807860F0F046821210F7EF9F9
          E9FFF3F3E3FFFFFFEFFF21210F7EFFFFEFFFF3F3E3FFF3F3E3FFF3F3E3FFF3F3
          E3FFFFFFEFFF21210F7EFFFFEFFFF3F3E3FFF9F9E9FF21210F7E28281678F4F4
          E6FFE9E9DAFF747462BC10100278747462BCE9E9DAFFE9E9DAFFE9E9DAFFE9E9
          DAFF747462BC10100278747462BCE9E9DAFFF4F4E6FF2828167829291875F6F6
          E8FFEBEBDEFFF6F6E8FFF6F6E8FFF6F6E8FFEBEBDEFFEBEBDEFFEBEBDEFFEBEB
          DEFFF6F6E8FFF6F6E8FFF6F6E8FFEBEBDEFFF6F6E8FF292918752B2B1A73F7F7
          ECFFEEEEE3FFEEEEE3FFEEEEE3FFEEEEE3FFEEEEE3FFEEEEE3FFEEEEE3FFEEEE
          E3FFEEEEE3FFEEEEE3FFEEEEE3FFEEEEE3FFF7F7ECFF2B2B1A732D2D1B71F9F9
          EFFFF1F1E8FFF1F1E8FFF1F1E8FFF1F1E8FFF1F1E8FFF1F1E8FFF1F1E8FFF1F1
          E8FFF1F1E8FFF1F1E8FFF1F1E8FFF1F1E8FFF9F9EFFF2D2D1B712E2E1D6FFAFA
          F3FFF5F5EEFFF5F5EEFFF5F5EEFFF5F5EEFFF5F5EEFFF5F5EEFFF5F5EEFFF5F5
          EEFFF5F5EEFFF5F5EEFFF5F5EEFFF5F5EEFFFAFAF3FF2E2E1D6F2F2F1E6DFCFC
          F7FFF8F8F3FFF8F8F3FFF8F8F3FFF8F8F3FFF8F8F3FFF8F8F3FFF8F8F3FFF8F8
          F3FFF8F8F3FFF8F8F3FFF8F8F3FFF8F8F3FFFCFCF7FF2F2F1E6D31311F6BFDFD
          FAFFFBFBF7FFFBFBF7FFFBFBF7FFFBFBF7FFFBFBF7FFFBFBF7FFFBFBF7FFFBFB
          F7FFFBFBF7FFFBFBF7FFFBFBF7FFFBFBF7FFFDFDFAFF31311F6B31312169FEFE
          FDFFFDFDFBFFFDFDFBFFFDFDFBFFFDFDFBFFFDFDFBFFFDFDFBFFFDFDFBFF6565
          B3FF333398FF333398FF333398FF333398FF333399FF1D1D57C333332168FFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF3333
          ACFF5E5EF7FF5E5EF7FF5E5EF7FF5E5EF7FF5E5EF7FF0B0B80E126261A4D3333
          2267333322673333226733332267333322673333226733332267333322671F1F
          6BC20B0B8CE10B0B8CE10B0B8CE10B0B8CE10B0B8CE1080869A9000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000}
      end>
  end
  object ppList: TPopupMenu
    OnPopup = ppListPopup
    Left = 780
    Top = 465
    object miCopy: TMenuItem
      Caption = 'Copy'
      object miReasonToAll: TMenuItem
        Caption = 'Reason to all'
        OnClick = miReasonToAllClick
      end
      object miRemarksToAll: TMenuItem
        Caption = 'Remarks to all'
        OnClick = miReasonToAllClick
      end
    end
    object miChangeStatus: TMenuItem
      Caption = 'Change status'
      object miDenied: TMenuItem
        Caption = 'Denied'
        OnClick = miDeniedClick
      end
      object miCancelled: TMenuItem
        Caption = 'Cancelled'
        OnClick = miDeniedClick
      end
    end
  end
end
