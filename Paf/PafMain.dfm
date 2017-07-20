inherited fPafMain: TfPafMain
  Caption = 'fPafMain'
  ClientHeight = 497
  ClientWidth = 822
  Position = poDefault
  OnCreate = FormCreate
  OnShow = FormShow
  ExplicitWidth = 838
  ExplicitHeight = 536
  PixelsPerInch = 96
  TextHeight = 14
  object bNew: TcxButton [0]
    Left = 50
    Top = 451
    Width = 80
    Height = 27
    Caption = 'New'
    OptionsImage.ImageIndex = 0
    OptionsImage.Images = ilBaseMain
    TabOrder = 1
    Visible = False
    OnClick = bNewClick
  end
  inherited pMaster: TJvPanel
    Width = 822
    Height = 497
    BorderWidth = 1
    ExplicitWidth = 822
    ExplicitHeight = 497
    object pcMaster: TJvPageControl
      Left = 1
      Top = 1
      Width = 820
      Height = 495
      ActivePage = TabSheet1
      Align = alClient
      TabOrder = 0
      object TabSheet1: TTabSheet
        Caption = 'PAF Details'
        object pDetails: TJvPanel
          Left = 0
          Top = 0
          Width = 812
          Height = 466
          HotTrackFont.Charset = DEFAULT_CHARSET
          HotTrackFont.Color = clWindowText
          HotTrackFont.Height = -11
          HotTrackFont.Name = 'Tahoma'
          HotTrackFont.Style = []
          Align = alClient
          BevelOuter = bvNone
          ParentBackground = False
          TabOrder = 0
          object JvLabel8: TJvLabel
            Left = 414
            Top = 38
            Width = 44
            Height = 14
            Caption = 'Position'
            Transparent = True
            HotTrackFont.Charset = DEFAULT_CHARSET
            HotTrackFont.Color = clWindowText
            HotTrackFont.Height = -11
            HotTrackFont.Name = 'Tahoma'
            HotTrackFont.Style = []
          end
          object JvLabel7: TJvLabel
            Left = 59
            Top = 279
            Width = 79
            Height = 14
            Caption = 'Effective date'
            Transparent = True
            HotTrackFont.Charset = DEFAULT_CHARSET
            HotTrackFont.Color = clWindowText
            HotTrackFont.Height = -11
            HotTrackFont.Name = 'Tahoma'
            HotTrackFont.Style = []
          end
          object JvGroupHeader3: TJvGroupHeader
            Left = 397
            Top = 15
            Width = 319
            Height = 18
            Caption = 'Details'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clHighlight
            Font.Height = -12
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
          end
          object JvGroupHeader1: TJvGroupHeader
            Left = 43
            Top = 15
            Width = 319
            Height = 18
            Caption = 'Employee Name'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clHighlight
            Font.Height = -12
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
          end
          object JvLabel1: TJvLabel
            Left = 59
            Top = 38
            Width = 54
            Height = 14
            Caption = 'Lastname'
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
            Width = 36
            Height = 14
            Caption = 'Middle'
            Transparent = True
            HotTrackFont.Charset = DEFAULT_CHARSET
            HotTrackFont.Color = clWindowText
            HotTrackFont.Height = -11
            HotTrackFont.Name = 'Tahoma'
            HotTrackFont.Style = []
          end
          object JvLabel2: TJvLabel
            Left = 59
            Top = 64
            Width = 54
            Height = 14
            Caption = 'Firstname'
            Transparent = True
            HotTrackFont.Charset = DEFAULT_CHARSET
            HotTrackFont.Color = clWindowText
            HotTrackFont.Height = -11
            HotTrackFont.Name = 'Tahoma'
            HotTrackFont.Style = []
          end
          object JvGroupHeader5: TJvGroupHeader
            Left = 397
            Top = 193
            Width = 319
            Height = 18
            Caption = 'Allowance Summary'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clHighlight
            Font.Height = -12
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
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
          object JvGroupHeader2: TJvGroupHeader
            Left = 43
            Top = 121
            Width = 319
            Height = 19
            Caption = 'PAF Components'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clHighlight
            Font.Height = -12
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
          end
          object bSearch: TJvSpeedButton
            Left = 364
            Top = 27
            Width = 27
            Height = 27
            Glyph.Data = {
              36030000424D3603000000000000360000002800000010000000100000000100
              18000000000000030000120B0000120B00000000000000000000FF00FF4A667C
              BE9596FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
              FFFF00FFFF00FFFF00FF6B9CC31E89E84B7AA3C89693FF00FFFF00FFFF00FFFF
              00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF4BB4FE51B5FF
              2089E94B7AA2C69592FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
              FFFF00FFFF00FFFF00FFFF00FF51B7FE51B3FF1D87E64E7AA0CA9792FF00FFFF
              00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
              51B7FE4EB2FF1F89E64E7BA2B99497FF00FFFF00FFFF00FFFF00FFFF00FFFF00
              FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF52B8FE4BB1FF2787D95F6A76FF
              00FFB0857FC09F94C09F96BC988EFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
              FF00FFFF00FF55BDFFB5D6EDBF9D92BB9B8CE7DAC2FFFFE3FFFFE5FDFADAD8C3
              B3B58D85FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFCEA795FD
              EEBEFFFFD8FFFFDAFFFFDBFFFFE6FFFFFBEADDDCAE837FFF00FFFF00FFFF00FF
              FF00FFFF00FFFF00FFFF00FFC1A091FBDCA8FEF7D0FFFFDBFFFFE3FFFFF8FFFF
              FDFFFFFDC6A99CFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFC1A091FEE3ACF1
              C491FCF2CAFFFFDDFFFFE4FFFFF7FFFFF7FFFFE9EEE5CBB9948CFF00FFFF00FF
              FF00FFFF00FFFF00FFC2A191FFE6AEEEB581F7DCAEFEFDD8FFFFDFFFFFE3FFFF
              E4FFFFE0F3ECD2BB968EFF00FFFF00FFFF00FFFF00FFFF00FFBC978CFBE7B7F4
              C791F2C994F8E5B9FEFCD8FFFFDDFFFFDCFFFFE0E2D2BAB68E86FF00FFFF00FF
              FF00FFFF00FFFF00FFFF00FFD9C3A9FFFEE5F7DCB8F2C994F5D4A5FAE8BDFDF4
              C9FDFBD6B69089FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFB58D85E8
              DEDDFFFEF2F9D8A3F4C48CF9D49FFDEAB8D0B49FB89086FF00FFFF00FFFF00FF
              FF00FFFF00FFFF00FFFF00FFFF00FFAD827FC9AA9EEFE0B7EFDFB2E7CEACB890
              86B89086FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
              00FFFF00FFBA968ABB988CB79188FF00FFFF00FFFF00FFFF00FF}
            GrayedInactive = False
            HotTrackFont.Charset = DEFAULT_CHARSET
            HotTrackFont.Color = clWindowText
            HotTrackFont.Height = -11
            HotTrackFont.Name = 'Tahoma'
            HotTrackFont.Style = []
            OnClick = bSearchClick
          end
          object JvLabel4: TJvLabel
            Left = 414
            Top = 64
            Width = 81
            Height = 14
            Caption = 'Position status'
            Transparent = True
            HotTrackFont.Charset = DEFAULT_CHARSET
            HotTrackFont.Color = clWindowText
            HotTrackFont.Height = -11
            HotTrackFont.Name = 'Tahoma'
            HotTrackFont.Style = []
          end
          object Status: TJvLabel
            Left = 414
            Top = 89
            Width = 67
            Height = 14
            Caption = 'Emp. status'
            Transparent = True
            HotTrackFont.Charset = DEFAULT_CHARSET
            HotTrackFont.Color = clWindowText
            HotTrackFont.Height = -11
            HotTrackFont.Name = 'Tahoma'
            HotTrackFont.Style = []
          end
          object JvLabel5: TJvLabel
            Left = 414
            Top = 115
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
          object JvLabel6: TJvLabel
            Left = 414
            Top = 167
            Width = 33
            Height = 14
            Caption = 'Salary'
            Transparent = True
            HotTrackFont.Charset = DEFAULT_CHARSET
            HotTrackFont.Color = clWindowText
            HotTrackFont.Height = -11
            HotTrackFont.Name = 'Tahoma'
            HotTrackFont.Style = []
          end
          object JvLabel9: TJvLabel
            Left = 414
            Top = 141
            Width = 68
            Height = 14
            Caption = 'Department'
            Transparent = True
            HotTrackFont.Charset = DEFAULT_CHARSET
            HotTrackFont.Color = clWindowText
            HotTrackFont.Height = -11
            HotTrackFont.Name = 'Tahoma'
            HotTrackFont.Style = []
          end
          object JvGroupHeader4: TJvGroupHeader
            Left = 43
            Top = 256
            Width = 319
            Height = 19
            Caption = 'PAF Effectivity'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clHighlight
            Font.Height = -12
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
          end
          object JvLabel10: TJvLabel
            Left = 59
            Top = 305
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
          object JvLabel11: TJvLabel
            Left = 59
            Top = 331
            Width = 47
            Height = 14
            Caption = 'Remarks'
            Transparent = True
            HotTrackFont.Charset = DEFAULT_CHARSET
            HotTrackFont.Color = clWindowText
            HotTrackFont.Height = -11
            HotTrackFont.Name = 'Tahoma'
            HotTrackFont.Style = []
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
            TabOrder = 17
            OnClick = bSaveClick
          end
          object bCancel: TcxButton
            Left = 125
            Top = 424
            Width = 81
            Height = 27
            Caption = 'Cancel'
            OptionsImage.ImageIndex = 2
            OptionsImage.Images = ilBaseMain
            TabOrder = 18
            OnClick = bCancelClick
          end
          object edLastname: TcxTextEdit
            Left = 154
            Top = 31
            Enabled = False
            TabOrder = 0
            Width = 208
          end
          object edFirstname: TcxTextEdit
            Left = 154
            Top = 57
            Enabled = False
            TabOrder = 1
            Width = 208
          end
          object edMiddleName: TcxTextEdit
            Left = 154
            Top = 83
            Enabled = False
            TabOrder = 2
            Width = 208
          end
          object clbPafComp: TcxCheckListBox
            Left = 154
            Top = 137
            Width = 200
            Height = 121
            Enabled = False
            Items = <
              item
                Text = 'Add allowance'
              end
              item
                Text = 'Remove allowance'
              end
              item
                Text = 'Change employment status'
              end
              item
                Text = 'Change position'
              end
              item
                Text = 'Change position status'
              end
              item
                Text = 'Salary adjustment'
              end
              item
                Text = 'Transfer'
              end>
            Style.BorderColor = clBtnFace
            Style.BorderStyle = cbsNone
            Style.Color = clMenu
            Style.HotTrack = True
            Style.LookAndFeel.NativeStyle = True
            Style.Shadow = False
            Style.TransparentBorder = True
            StyleDisabled.Color = clMenu
            StyleDisabled.LookAndFeel.NativeStyle = True
            StyleFocused.LookAndFeel.NativeStyle = True
            StyleHot.LookAndFeel.NativeStyle = True
            TabOrder = 3
            OnClickCheck = clbPafCompClickCheck
          end
          object dbluPosition: TcxDBLookupComboBox
            Left = 500
            Top = 31
            DataBinding.DataField = 'position_code'
            DataBinding.DataSource = dmPaf.dscPaf
            Enabled = False
            Properties.KeyFieldNames = 'position_code'
            Properties.ListColumns = <
              item
                FieldName = 'position'
              end>
            Properties.ListOptions.GridLines = glNone
            Properties.ListOptions.ShowHeader = False
            Properties.ListSource = dmPaf.dscPosition
            TabOrder = 4
            Width = 216
          end
          object dbluPositionStatus: TcxDBLookupComboBox
            Left = 500
            Top = 57
            DataBinding.DataField = 'posstatus_code'
            DataBinding.DataSource = dmPaf.dscPaf
            Enabled = False
            Properties.KeyFieldNames = 'posstatus_code'
            Properties.ListColumns = <
              item
                FieldName = 'posstatus_name'
              end>
            Properties.ListOptions.GridLines = glNone
            Properties.ListOptions.ShowHeader = False
            Properties.ListSource = dmPaf.dscPositionStatus
            TabOrder = 5
            Width = 216
          end
          object dbluEmployeeStatus: TcxDBLookupComboBox
            Left = 500
            Top = 83
            DataBinding.DataField = 'empstatus_code'
            DataBinding.DataSource = dmPaf.dscPaf
            Enabled = False
            Properties.KeyFieldNames = 'empstatus_code'
            Properties.ListColumns = <
              item
                FieldName = 'empstatus_name'
              end>
            Properties.ListOptions.GridLines = glNone
            Properties.ListOptions.ShowHeader = False
            Properties.ListSource = dmPaf.dscEmpStatus
            Properties.OnEditValueChanged = dbluEmployeeStatusPropertiesEditValueChanged
            TabOrder = 6
            Width = 216
          end
          object dbluLocation: TcxDBLookupComboBox
            Left = 500
            Top = 109
            DataBinding.DataField = 'location_code'
            DataBinding.DataSource = dmPaf.dscPaf
            Enabled = False
            Properties.KeyFieldNames = 'location_code'
            Properties.ListColumns = <
              item
                FieldName = 'location_name'
              end>
            Properties.ListOptions.GridLines = glNone
            Properties.ListOptions.ShowHeader = False
            Properties.ListSource = dmPaf.dscLocations
            Properties.OnEditValueChanged = dbluLocationPropertiesEditValueChanged
            TabOrder = 7
            Width = 216
          end
          object ceSalary: TcxDBCurrencyEdit
            Left = 500
            Top = 161
            DataBinding.DataField = 'salary'
            DataBinding.DataSource = dmPaf.dscPaf
            Enabled = False
            Properties.DisplayFormat = ',0.00;-,0.00'
            TabOrder = 9
            Width = 108
          end
          object deEffectiveDateFrom: TcxDBDateEdit
            Left = 148
            Top = 273
            DataBinding.DataField = 'effective_date'
            DataBinding.DataSource = dmPaf.dscPaf
            Enabled = False
            Properties.DisplayFormat = 'mm/dd/yyyy'
            Properties.EditFormat = 'mm/dd/yyyy'
            TabOrder = 12
            Width = 105
          end
          object gAllowance: TcxGrid
            Left = 414
            Top = 232
            Width = 302
            Height = 132
            BevelInner = bvNone
            BevelOuter = bvNone
            BorderStyle = cxcbsNone
            Enabled = False
            PopupMenu = ppAllowance
            TabOrder = 11
            LookAndFeel.NativeStyle = False
            object vAllowance: TcxGridDBTableView
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
              DataController.DataSource = dmPaf.dscPafAllowances
              DataController.Summary.DefaultGroupSummaryItems = <>
              DataController.Summary.FooterSummaryItems = <
                item
                  Format = '###,##0.00'
                  Kind = skSum
                  FieldName = 'allowance_amount'
                  Column = vAllowanceallowance_amount
                end
                item
                  OnGetText = vAllowanceTcxGridDBDataControllerTcxDataSummaryFooterSummaryItems1GetText
                  Column = vAllowanceallowancetype_code
                  DisplayText = 'TOTAL'
                end>
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
              OptionsView.Footer = True
              OptionsView.FooterAutoHeight = True
              OptionsView.GridLineColor = 8421440
              OptionsView.GridLines = glNone
              OptionsView.GroupByBox = False
              OptionsView.Header = False
              OptionsView.RowSeparatorColor = 12303291
              OptionsView.RowSeparatorWidth = 1
              Styles.Background = csBackground
              Styles.Content = csContent
              Styles.Footer = csTotalAmount
              Styles.NewItemRowInfoText = csNewRow
              OnCustomDrawFooterCell = vAllowanceCustomDrawFooterCell
              object vAllowanceallowancetype_code: TcxGridDBColumn
                Caption = 'Type'
                DataBinding.FieldName = 'allowancetype_code'
                PropertiesClassName = 'TcxLookupComboBoxProperties'
                Properties.KeyFieldNames = 'allowancetype_code'
                Properties.ListColumns = <
                  item
                    FieldName = 'allowancetype_name'
                  end>
                Properties.ListOptions.GridLines = glNone
                Properties.ListOptions.ShowHeader = False
                Properties.ListSource = dmPaf.dscAllowanceTypes
                MinWidth = 200
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
                Width = 200
              end
              object vAllowanceallowance_amount: TcxGridDBColumn
                Caption = 'Amount'
                DataBinding.FieldName = 'allowance_amount'
                PropertiesClassName = 'TcxCurrencyEditProperties'
                Properties.DisplayFormat = ',0.00;-,0.00'
                MinWidth = 75
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
                Styles.Content = csAllowanceAmount
                Width = 75
              end
            end
            object lvlAllowance: TcxGridLevel
              GridView = vAllowance
            end
          end
          object cbCancelled: TcxDBCheckBox
            Left = 258
            Top = 301
            Caption = 'Cancelled'
            DataBinding.DataField = 'is_cancelled'
            DataBinding.DataSource = dmPaf.dscPaf
            ParentBackground = False
            ParentColor = False
            Properties.Alignment = taLeftJustify
            Properties.DisplayChecked = '1'
            Properties.DisplayUnchecked = '0'
            Properties.DisplayGrayed = '0'
            Properties.NullStyle = nssUnchecked
            Properties.ValueChecked = '1'
            Properties.ValueGrayed = '0'
            Properties.ValueUnchecked = 0
            Style.Color = clMenu
            Style.LookAndFeel.NativeStyle = True
            StyleDisabled.Color = clMenu
            StyleDisabled.LookAndFeel.NativeStyle = True
            StyleDisabled.TextColor = clBtnShadow
            StyleFocused.LookAndFeel.NativeStyle = True
            StyleHot.LookAndFeel.NativeStyle = True
            TabOrder = 15
            Width = 81
          end
          object dbluSalaryFrequency: TcxDBLookupComboBox
            Left = 612
            Top = 161
            DataBinding.DataField = 'frequency_code'
            DataBinding.DataSource = dmPaf.dscPaf
            Enabled = False
            Properties.KeyFieldNames = 'frequency_code'
            Properties.ListColumns = <
              item
                FieldName = 'frequency_name'
              end>
            Properties.ListOptions.GridLines = glNone
            Properties.ListOptions.ShowHeader = False
            Properties.ListSource = dmPaf.dscSalaryFrequency
            TabOrder = 10
            Width = 104
          end
          object Panel1: TPanel
            Left = 414
            Top = 209
            Width = 200
            Height = 17
            Caption = 'Allowance Type'
            Font.Charset = ANSI_CHARSET
            Font.Color = clGray
            Font.Height = -12
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            TabOrder = 19
          end
          object Panel2: TPanel
            Left = 614
            Top = 209
            Width = 102
            Height = 17
            Caption = 'Amount'
            Font.Charset = ANSI_CHARSET
            Font.Color = clGray
            Font.Height = -12
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            TabOrder = 20
          end
          object bBack: TcxButton
            Left = 644
            Top = 424
            Width = 81
            Height = 27
            Caption = 'Back'
            OptionsImage.ImageIndex = 4
            OptionsImage.Images = ilBaseMain
            TabOrder = 21
            OnClick = bBackClick
          end
          object dbluDepartment: TcxDBLookupComboBox
            Left = 500
            Top = 135
            DataBinding.DataField = 'department_code'
            DataBinding.DataSource = dmPaf.dscPaf
            Enabled = False
            Properties.KeyFieldNames = 'department_code'
            Properties.ListColumns = <
              item
                FieldName = 'department_name'
              end>
            Properties.ListOptions.GridLines = glNone
            Properties.ListOptions.ShowHeader = False
            Properties.ListSource = dmPaf.dscDepartments
            TabOrder = 8
            Width = 216
          end
          object dbluStatus: TcxDBLookupComboBox
            Left = 148
            Top = 299
            DataBinding.DataField = 'pafstatus_code'
            DataBinding.DataSource = dmPaf.dscPaf
            Enabled = False
            Properties.KeyFieldNames = 'pafstatus_code'
            Properties.ListColumns = <
              item
                FieldName = 'pafstatus_name'
              end>
            Properties.ListOptions.GridLines = glNone
            Properties.ListOptions.ShowHeader = False
            Properties.ListSource = dmPaf.dscPafStatus
            TabOrder = 14
            Width = 104
          end
          object btnPrintPreview: TcxButton
            Left = 532
            Top = 424
            Width = 111
            Height = 27
            Caption = 'Preview'
            LookAndFeel.SkinName = ''
            OptionsImage.Images = ilBaseMain
            TabOrder = 22
            OnClick = btnPrintPreviewClick
          end
          object deEffectiveDateUntil: TcxDBDateEdit
            Left = 257
            Top = 273
            DataBinding.DataField = 'effective_until'
            DataBinding.DataSource = dmPaf.dscPaf
            Enabled = False
            Properties.DisplayFormat = 'mm/dd/yyyy'
            Properties.EditFormat = 'mm/dd/yyyy'
            Properties.UseNullString = True
            TabOrder = 13
            Width = 105
          end
          object mmRemarks: TcxDBMemo
            Left = 148
            Top = 325
            DataBinding.DataField = 'paf_remarks'
            DataBinding.DataSource = dmPaf.dscPaf
            Enabled = False
            TabOrder = 16
            Height = 61
            Width = 214
          end
        end
      end
    end
  end
  object csrAllowance: TcxStyleRepository [2]
    Left = 184
    Top = 480
    PixelsPerInch = 96
    object csBackground: TcxStyle
      AssignedValues = [svColor]
      Color = clMenu
    end
    object csContent: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = clMenu
      TextColor = clDefault
    end
    object csNewRow: TcxStyle
      AssignedValues = [svColor]
      Color = clMoneyGreen
    end
    object csAllowanceAmount: TcxStyle
      AssignedValues = [svFont, svTextColor]
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGreen
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = []
      TextColor = clDefault
    end
    object csTotalAmount: TcxStyle
      AssignedValues = [svFont]
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGreen
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
    end
  end
  object ppAllowance: TPopupMenu [3]
    Left = 69
    Top = 480
    object miAdd: TMenuItem
      Caption = 'Add'
      Enabled = False
      OnClick = miAddClick
    end
    object miRemove: TMenuItem
      Caption = 'Remove'
      Enabled = False
      OnClick = miRemoveClick
    end
  end
  inherited ilBaseMain: TcxImageList
    FormatVersion = 1
    DesignInfo = 31457408
    ImageInfo = <
      item
        Image.Data = {
          36040000424D3604000000000000360000002800000010000000100000000100
          2000000000000004000000000000000000000000000000000000000000000000
          0007000000180000001A0000001A0000001A0000001A0000001A0000001A0000
          001A0000001A0441009E045400D10441009E0000000700000000000000000E0E
          0469171706871717068717170687171706871717068717170687171706871717
          0687171706870E6E02E72BDF1AFF0E6E02E70E0E046900000000000000001D1D
          0C81F9F9E9FFF3F3E2FFF3F3E2FFF3F3E2FFF3F3E2FFF3F3E2FFF3F3E2FF6CB8
          5DFF3BA12EFF3BA12EFF3DE22CFF3DA22FFF117603E608550099000000002525
          147AF4F4E4FFAAAA99FFE8E8D8FFE8E8D8FFE8E8D8FFE8E8D8FFE8E8D8FF3BA6
          2BFF52E741FF52E741FF52E741FF52E741FF52E741FF0D7700CC000000002828
          1677F5F5E6FFEAEADBFFEAEADBFFEAEADBFFEAEADBFFEAEADBFFEAEADBFF68BC
          58FF3DAD2CFF3DAD2CFF66EB55FF3FAF2EFF168504E40B5E0099000000002929
          1875F6F6E9FFE6A887FFE7AB89FFE7AB89FFE7AC8CFFE3A990FFD8987DFFD289
          6FFFE1A181FF3EA51CFF75EE64FF41B42FFF2929187500000000000000002A2A
          1973F7F7EBFFDA8E75FFDD977BFFE1A383FFE3AC91FFE3BCB5FFE2BDB6FFD6A0
          85FFC87E65FF609D2CFF3EA91BFF71CA60FF2A2A197300000000000000002C2C
          1B72F8F8EEFFD58E75FFD28A71FFCF866DFFD49C84FFDBB9B2FFDBBCB9FFD4A6
          91FFC17C61FFBD755BFFC78468FFF8F8EEFF2C2C1B7200000000000000002D2D
          1C70F9F9F1FFD1917AFFD49A83FFD19378FFCE9276FFD1A48FFFD0A793FFC58C
          70FFB9745BFFB67057FFB46E55FFF9F9F1FF2D2D1C7000000000000000002E2E
          1D6EFBFBF4FFD19F81FFD7AB90FFD6A98DFFD3A487FFD09E81FFCD997BFFCC95
          74FFC48969FFAD6A51FFAA684FFFFBFBF4FF2E2E1D6E00000000000000002F2F
          1E6DFCFCF7FFC89678FFD1A68DFFD1A68CFFD0A48BFFCFA388FFCDA084FFCC9D
          81FFCA9A7DFFC69376FFB3795DFFFCFCF7FF2F2F1E6D00000000000000003030
          1F6BFDFDF9FFBA8161FFC18C6FFFC28D70FFC28D70FFC28D70FFC18D6EFFC18B
          6DFFC08A6BFFBE8868FFB87E5DFFFDFDF9FF30301F6B00000000000000003131
          206AFEFEFCFFFCFCFAFFFCFCFAFFFCFCFAFFFCFCFAFFFCFCFAFFFCFCFAFFFCFC
          FAFFFCFCFAFFFCFCFAFFFCFCFAFFFEFEFCFF3131206A00000000000000003232
          2168FFFFFEFFBFBFA9FFFEFEFDFFFEFEFDFFFEFEFDFFFEFEFDFFFEFEFDFFFEFE
          FDFFFEFEFDFFFEFEFDFFBFBFA9FFFFFFFEFF3232216800000000000000003232
          2267FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF3232226700000000000000002626
          1A4D333322663333226633332266333322663333226633332266333322663333
          22663333226633332266333322663333226626261A4D00000000}
      end
      item
        Image.Data = {
          36040000424D3604000000000000360000002800000010000000100000000100
          2000000000000004000000000000000000000000000000000000683B1E8F834B
          26B5AC6231EEB76835FFB56835FFB46734FFB26634FFB06533FFAE6433FFAC63
          32FFAA6232FFA96132FFA86031FFA66031FE9D5B2EF1814B26C4A25C2EDEEBC6
          ADFFEAC5ADFFFEFBF8FFFEFBF8FFFEFBF8FFFEFBF8FFFEFBF8FFFEFBF8FFFEFB
          F8FFFEFBF8FFFEFBF8FFFEFBF8FFC89A7CFFC79879FF9B592EEDB96B37FEEDCA
          B3FFE0A27AFFFEFAF7FF62C088FF62C088FF62C088FF62C088FF62C088FF62C0
          88FF62C088FF62C088FFFDF9F6FFCA8D65FFC99B7CFFA66031FEBB6C38FFEECC
          B6FFE1A27AFFFEFAF7FFBFDCC2FFBFDCC2FFBFDCC2FFBFDCC2FFBFDCC2FFBFDC
          C2FFBFDCC2FFBFDCC2FFFDF9F6FFCD9068FFCC9E81FFA86132FFBB6B38FFEFCE
          B8FFE1A279FFFEFAF7FF62C088FF62C088FF62C088FF62C088FF62C088FF62C0
          88FF62C088FF62C088FFFDF9F6FFCF936AFFCEA384FFAA6132FFBA6A36FFEFD0
          BBFFE2A27AFFFEFBF8FFFEFBF8FFFEFBF8FFFEFBF8FFFEFBF8FFFEFBF8FFFEFB
          F8FFFEFBF8FFFEFBF8FFFEFBF8FFD3966DFFD2A78AFFAB6232FFBB6A36FFF0D2
          BEFFE2A37AFFE2A37AFFE1A37AFFE2A37BFFE1A37BFFE0A178FFDE9F77FFDD9F
          76FFDC9D74FFD99B72FFD89971FFD69970FFD5AB8EFFAD6333FFBB6A36FFF2D5
          C2FFE3A37AFFE3A37AFFE2A37BFFE2A37BFFE2A47BFFE1A279FFE0A178FFDEA0
          77FFDE9E75FFDC9D74FFDA9B73FFD99B73FFDAB095FFAF6433FFBB6A36FFF2D8
          C5FFE3A47BFFE3A37AFFE3A47AFFE2A47BFFE2A37BFFE1A37BFFE1A279FFDFA0
          77FFDE9F76FFDD9E74FFDB9C72FFDC9D74FFDDB59AFFB16534FFBB6B36FFF4D9
          C7FFE6A67DFFC88C64FFC98D65FFC98E67FFCB926CFFCB926DFFCA9069FFC88C
          65FFC88C64FFC88C64FFC88C64FFDA9C74FFE1BA9FFFB36634FFBA6B36FEF4DC
          C9FFE7A77DFFF9ECE1FFF9ECE1FFF9EDE3FFFCF4EEFFFDFAF7FFFDF7F3FFFAED
          E5FFF7E7DBFFF7E5D9FFF6E5D8FFDEA077FFE4BEA4FFB46734FFB86935FAF5DD
          CCFFE7A87EFFFAF0E8FFFAF0E8FFC98D66FFFAF0E9FFFDF8F3FFFEFAF8FFFCF4
          EFFFF9E9DFFFF7E7DBFFF7E5D9FFE0A278FFE7C2A9FFB66835FFB16533F0F6DF
          D0FFE8A87EFFFCF6F1FFFCF6F1FFC88C64FFFAF1E9FFFBF4EEFFFDFAF7FFFDF9
          F6FFFAF0E8FFF8E8DDFFF7E6DBFFE1A37AFFEFD5C3FFB66935FE9F5B2ED8F6DF
          D1FFE9AA80FFFEFAF6FFFDFAF6FFC88C64FFFBF3EEFFFBF1EAFFFCF6F2FFFEFB
          F8FFFCF6F1FFF9ECE2FFF8E7DBFFEED0BAFFECD0BDFFB66D3CF87241219BF6E0
          D1FFF7E0D1FFFEFBF8FFFEFBF7FFFDF9F6FFFCF5F0FFFAF0EAFFFBF2EDFFFDF9
          F6FFFDFAF7FFFBF1EBFFF7E8DEFEE8CDBAFBBA7F57EC46291563532F18716A3C
          1E9096562BCCAF6432EEB86935FABA6B36FEBB6B36FFBB6A36FFBB6A36FFBC6C
          39FFBD6E3BFFBB6D3AFFAF6434EF955931CB3C23115400000000}
      end
      item
        Image.Data = {
          36040000424D3604000000000000360000002800000010000000100000000100
          2000000000000004000000000000000000000000000000000000000000090000
          00160000001A0000001A0000001A0000001A0000001A0000001A0000001A0000
          001A0000001A0000001A0000001A0000001A0000001600000009000000120000
          033300002683000045BC00004ACC00004ACC00004ACC00004ACC00004ACC0000
          4ACC00004ACC00004ACC000045BC000026830000033300000012000000000000
          317307077FDD1010C7F91111D9FF1111D9FF1111D9FF1111D9FF1111D9FF1111
          D9FF1111D9FF1111D9FF0F0FC7F906067FDD0000317300000000000000000000
          5BBA1515C6F91313D2FF1717D4FF0E0EAFEF040480D902026DCF02026DCF0404
          80D90B0BAFEF1111D1FF1111D1FF0F0FC3F900005BBA00000000000000000000
          6ACC1E1ECFFF2020D0FF0D0D96E4000055AA0000203F0000080F0000080F0000
          3E7C000066CC1111C8FF1111C8FF1111C8FF00006ACC00000000000000000000
          6ECC3030D1FF1E1EADEF000055AA00000A130000000000000000000024480000
          66CC1818C2FF000066CC0D0DA2EF1212BEFF00006ECC00000000000000000000
          71CC4C4CDBFF0E0E80D90000203F000000000000000000002448000066CC2323
          C1FF000066CC00003E7C06067BD91919BAFF000071CC00000000000000000000
          75CC6060E8FF05056ECF0000080F0000000000002448000066CC3131C4FF0000
          66CC000024480000080F02026BCF2525BBFF000075CC00000000000000000000
          78CC6767EFFF06066ECF0000080F00002448000066CC4040CDFF000066CC0000
          2448000000000000080F02026CCF3232BFFF000078CC00000000000000000000
          7BCC6B6BF3FF191986D900003E7C000066CC5C5CE5FF000066CC000024480000
          0000000000000000203F0E0E7DD94141CAFF00007BCC00000000000000000000
          7ECC6B6BF3FF4A4AC7EF181886D96B6BF3FF000066CC00002448000000000000
          000000000A13000055AA3E3EBBEF5959E1FF00007ECC00000000000000000000
          82CC6262EAFF6D6DF5FF7373FBFF181886D900003E7C0000080F0000080F0000
          203F000055AA2F2FA5E46363EBFF5C5CE4FF000082CC00000000000000000000
          78BA5E5EE6F95B5BE3FF7171F9FF4F4FCCEF1B1B8BD906066FCF06066FCF1B1B
          8AD94C4CCAEF6D6DF5FF5E5EE6FF5959E2F9000078BA00000000000000000000
          4C732424ACDD6161E9F96D6DF5FF7575FDFF7777FFFF7777FFFF7777FFFF7676
          FEFF7373FBFF6D6DF5FF6060E8F92424ABDD00004C7300000000000000000000
          080C00004D7300007CBA000088CC000088CC000088CC000088CC000088CC0000
          88CC000088CC000088CC00007CBA00004D730000080C00000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000}
      end
      item
        Image.Data = {
          36040000424D3604000000000000360000002800000010000000100000000100
          2000000000000004000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000E00000014000000190000001900000016000000100000000B000000080000
          0007000000080000000B0000000E000000110000001300000000000000000000
          001C0000125E000047CC000040BC0000064200000020000000160000000F0000
          000D00000010000000150000001B0000063800000D4C00000000000000000000
          000000004CCC1111DAFE0B0BA2EC0000348B0000000000000000000000000000
          000000000000000000000000000000002B7300000E3200000000000000000000
          00000000388C09098FE51212DDFF020263D30000153300000000000000000000
          0000000000000000000000003584000037890000020400000000000000000000
          000000000D1F000058CC1515CEFB1010BBF400004EB400000711000000000000
          0000000000000000388200004FB800001C410000000000000000000000000000
          00000000000000002F670B0B81DC1717CCFF0D0D91E500003775000000000000
          000000004391030373D500003E86000000000000000000000000000000000000
          0000000000000000000000004891131395E51D1DBDFD060673D4000031630000
          56AE090980DC00005AB600000000000000000000000000000000000000000000
          0000000000000000000000000B1500005CB0181898E72121B0F9060675D21212
          8CE1040474D20000000000000000000000000000000000000000000000000000
          000000000000000000000000000000001C33000072CC2F2FB3F33232B8FA0707
          7ED4000000000000000000000000000000000000000000000000000000000000
          00000000000000001E330000518A000078CC3D3DBFEE5050D7FD2323A3E32A2A
          A9E3000068B100000E1800000000000000000000000000000000000000000000
          00000000406600007ECC3131B5E56262EAFF5656DFFA121293D600001F330909
          699F2323A5DD000070B40000131F000000000000000000000000000000000000
          0000000083CC7474FCFF6B6BF3FE3030B8E5000083CC00000000000000000000
          000000005889050588CF00007ABD0000304A0000010100000000000000000000
          000000003048000087CC000087CC000061930000000000000000000000000000
          00000000000000001C2B0000547E000075B00000446600000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000}
      end
      item
        Image.Data = {
          36040000424D3604000000000000360000002800000010000000100000000100
          2000000000000004000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000004010004000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000E060012984404C8000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00000000000000000000000000001B0A001EAE5B11E3BD6215EE000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000000000002711002DB8651AEDF0A553FFAB5811F00A04000E0903
          000C0802000A050200090702000A0802000C0000000000000000000000000000
          0000000000003818003DC67327F4EFAA62FFE69C4FFFAB621EFFAF5C16FFAD5C
          13FFAC580FFFAB540BFFAB5407FF9E4404F20000000000000000000000000000
          00004D230053D28138F9F4B676FFEBA660FFE89F53FFE69A4AFFE39340FFE08C
          34FFDC8429FFD87D1DFFD97811FFA24905F30000000000000000000000006031
          026ADD9755FDFCC68FFFF1B070FFEEA965FFE9A259FFE59A4EFFE39345FFDE8D
          3AFFDA842DFFD87E22FFD97B18FFA64C06F40000000000000000000000006634
          036FE19E60FEFFDEBAFFF4B676FFEFAE6CFFEBA661FFE79F54FFE49748FFE08E
          3DFFDD8832FFD98026FFD97D1EFFAC4F08F60000000000000000000000000000
          000053270057D88E4AFAFFDDBDFFF3B474FFEEAB66FFEDAC68FFEEB97FFFEBB1
          72FFE9A866FFE5A059FFE49642FFAF550BF60000000000000000000000000000
          0000000000003D1B0041CF823CF5FFDFBDFFF4BB81FFD2853EFFCC7F38FFCB7B
          34FFC9772FFFC77329FFC57126FFA94D07EE0000000000000000000000000000
          000000000000000000002C120030C2752CEEFFE6C7FFBE681EF0100500151006
          0015100600140E0500120E0400120D0400110000000000000000000000000000
          00000000000000000000000000001E0D0021B86922E5CB772AEE000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00000000000000000000000000000000000012080014A24E04CB000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000005010005000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000}
      end>
  end
  object ilList: TImageList
    Left = 16
    Top = 480
    Bitmap = {
      494C010104000800F00110001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000002000000001002000000000000020
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000EAECFD00808CE7003D54DD001C35D6001B34D2003B4DD4008188DA00EBEB
      FA00000000000000000000000000000000000000000000000000000000000000
      0000F8EEE800D09B7B00B3622E00A7470A00A5450A00AE5C2E00CA957C00F7ED
      E900000000000000000000000000000000000000000000000000000000000000
      0000EBF6EB0083C18300379A3700188E1D00198A1B003A953A0088BC8800EFF7
      EF000000000000000000000000000000000000000000000000009B7C6B009D7E
      6D009C7E6D00C4B2A700424BC2000716BE000711B700070EB100070EAC000707
      A30007079F0007089E004444B60000000000000000000000000000000000AEBA
      FF002950F3003464FD003060FE002757FB00204DF4001D43E700183CE1001B34
      D300AFB2F000000000000000000000000000000000000000000000000000EAC7
      AC00B3570F00B6580000B85C0000B6580000B2530000AD4D0000A7450000A344
      1000E5C0AE00000000000000000000000000000000000000000000000000AEE2
      AE00179E1D001CB03A0020B8440018B23A0012A92F0013A028000C921B001987
      1A00B7DDB70000000000000000000000000000000000000000009B7766000000
      0000FAF4E900FDFAF5003047DC00001DE8004266F100274BEC00000ED4002A4B
      E200617BEC000002B60007079F00000000000000000000000000ADBBFF003161
      FE004273FF003C6CFF002E62FF0075A1FF0084B0FF00245BFF002752F7001A3C
      DF001331DC00AFB2F00000000000000000000000000000000000EDCBAE00B85B
      0300C1690000C1660000C0650000BD630000BC600000B95C0000B2540000AA49
      0000A03C0300E5C0B00000000000000000000000000000000000ACE5AC0015AB
      25002EC85D002AC4540022C2460068DD7A0072E78A0022C4460018AB3200119B
      23000B840F00B7DDB70000000000000000000000000000000000A27F6F000000
      0000DDC2B500EFE2DC00334FE5003156F200F4EFDE00EBECEB003A5EF300F8FC
      FC0000000000627EEF0007079F000000000000000000E9EDFF003A64FF004C7A
      FF004674FF00386AFF006B96FF00000000000000000088B3FF00265BFF002A5A
      FE001A3CDF001B33D400EAEBFA000000000000000000FAF2EB00C06B1800C870
      0100C66F0000C66D0000C46B0000C3690000C0660000BD630000BB5E0000B557
      0000A9480000A5471200F8EFEC000000000000000000E7F7E80024B22D0035CF
      6A0030C961002EC7610018C13E00000000000000000021CB490021BB46001CB4
      3B00129B250017891900EEF6EE00000000000000000000000000A38070000000
      0000DBC3BB00EEE3DE003F5CEC001A49F800E7E5E100F1F0EA00FFFDF300FFFF
      FE00000000003B5AE9000707A50000000000000000007D96FE006993FE004F7E
      FF004176FF006790FF00000000000000000000000000000000008BB7FF00275C
      FF002652F6001A3CE0008087DD000000000000000000DBAD8100CD7F1A00CC75
      0000CC750000CC760000CA730000C8700000C56C0000C2680000BE630000BB5F
      0000B1540000A6460000CF9E840000000000000000007CCC810048D0740035D1
      6D0037D06B0037D06D0017C23E00F3FBF100000000001ECA460026BF4E0022BE
      480019AB34000D941C0087BE8700000000000000000000000000A98778000000
      0000DBC7C200EEE4E2004D6BEF00003FFF002952F300F7F5EB00F4F4F4000000
      00004064F500000DD300070FAD000000000000000000567CFF0076A0FF00477D
      FF006489FF000000000000000000000000000000000000000000000000008BB8
      FF00275EFF001E41E3003A4DD7000000000000000000CC863A00D9912500D27C
      0000D27D0000D27C0000D07A0000CD770000CA730000C76E0000C3690000BE63
      0000BA5E0000AC4C0000B3643800000000000000000043BF57005EE1910027CB
      530022C64B0034D3680019C64000F5FBF300000000001BC7440025C355001FC2
      48001DBD4300129E290039983A00000000000000000000000000AB897A000000
      0000DBC7C300EEE4E2005779F2001149EE00D4D4DF00F2F0EA00FFFCF300FFFF
      FD00FBFEFF001D43EB00070FB30000000000000000004F7AFF0073A0FF006A8C
      FF000000000000000000638EFF00000000000000000081AAFF00000000000000
      000090BBFF00234EF0001935D5000000000000000000CB7D2000DF992C00D883
      0000D9830000D8840000D6820000D37F0000CF790000CB740000C66E0000C268
      0000BE620000B3540000AA4E1300000000000000000037C252004CD06C006FC4
      6A00C5E9C40058C65E0000B51B00F3FCF400000000000CC2340055DA6F00B9F3
      C40097F3AB001DB33A00168C1900000000000000000000000000AF8E7F000000
      0000DCC5C000EEE3E1005E83F6004662D300F8F2DE00E8E6E600395EF200FDFB
      F700000000006181FC000711BD0000000000000000005782FF0076A1FF00849A
      FF00B6C4FF00668BFF002666FF0000000000000000002667FF008BAFFF00ECF3
      FF00DFEFFF003164F7001B36D8000000000000000000CE822100E6A53E00DF86
      0000E0880000DF870000DC850000D8840000D3800000CF790000CA720000C56C
      0000BF660000B7590000AE53140000000000000000003BC55B0074EA9E0013A8
      1B0000000000000000004DC75A00E5F7E800F6FDF6003CCA4F00000000000000
      000060DC75001DB43F0016901900000000000000000000000000AF8F80000000
      0000FEFEFE00000000007192FA000F70FF004F69D4001F4FEA00003EFF001F4B
      F9005373F8000019E6000719C30000000000000000006A90FF00B1D5FF006EAB
      FF0069A4FF007BB5FF003D7AFF000000000000000000356FFF004A7CFF00396D
      FF003569FF00325FF9003E55E0000000000000000000D5903A00EFB55800E78D
      0100E98C0000E68B0000E2890000DF860000D8840000D27E0000CD760000C76F
      0000C3690000B95D0000BC6F3A0000000000000000004FCC6C0096F7BA0044E8
      7A000CA71500FFFCFE0000000000FDFEFC00FDFEFE00000000000000000042CB
      56001FC34C0024B8480039A13900000000000000000000000000AF8F80000000
      0000DFCECC00ECE1DF006683F3006A8FFA00577DF7004E73F600486AF1003A5B
      EF00314EE9002C46DE005463DB0000000000000000008FA9FF00B1D7FF009ACC
      FF0086C1FF0089C2FF003D7CFF000000000000000000326DFF005989FF004B7A
      FF004473FF003864F8008392ED000000000000000000E3B88500EAA54200F2A7
      3200EF8F0000EE8F0000E98C0000E28A0000DB860000D5810000CF790000C973
      0000C56B0000B75B0000D7A88700000000000000000087DB9D0084EEA60079F7
      A5004CF083000EA91600FBFBF90000000000000000000000000032C1420028CA
      5A002DC860001EAF3D0086C78600000000000000000000000000B19080000000
      000000000000000000000000000000000000FFFEFD00FEFDFC00FEFCFA00FCFA
      F700F8F4F000D0C1B900000000000000000000000000EEF2FF0073A1FF00C7EA
      FF0099D2FF008ECCFF003E7DFF000000000000000000316AFF005C8DFF004E7D
      FF004B7AFF002E55F600EDEFFF000000000000000000FCF5ED00D78A2300FCBE
      5F00F89F1900F4910000EC8E0000E58A0000DE860000D7830000D17B0000CC73
      0000C66D0000B8601500FAF3EE000000000000000000EAFBEE004BD57500A6FF
      C4006DFB9E0050F486000EA91600FEFBFC000000000024B62F002FCF620035CF
      6B0033CD68001AA61F00EEF9EE00000000000000000000000000B79787000000
      0000000000000000000000000000FEFEFE00FEFDFB00FDFBF900A7827000A782
      7000A7827000A782700000000000000000000000000000000000BFD0FF0092BF
      FF00CEF4FF00A4D8FF0064A2FF006A89FF00809BFF00457BFF005C8DFF005584
      FF003565FF00B5C1FF0000000000000000000000000000000000F6D9B300DF90
      2300FFC15E00F8A62B00EE8E0000E68A0000DF870000D7830000D17C0000CC76
      0000BD610500F0D1B60000000000000000000000000000000000B9F8CC005BE2
      8500AAFFCA007BFDA7004BEF810014AB1C001EAD260036D86A003CD773003AD3
      72001AB32C00B5E9B50000000000000000000000000000000000B89888000000
      00000000000000000000FEFEFE00FEFEFD00FEFCFA00FDFBF900A7827000F5E2
      D900B18E7E00E1D4CE000000000000000000000000000000000000000000C1D2
      FF007BA6FF00BAE3FF00B5DDFF0095C7FF0080B3FF0075A6FF006997FF003D6A
      FF00B6C4FF00000000000000000000000000000000000000000000000000F6D9
      B300DA8C2500F0AB4600F5B34E00EBA22F00E2951B00DC8E1400D0801000C470
      1700F1D2B500000000000000000000000000000000000000000000000000BBF8
      CE0052D97C0088F3AB0095FBBA0076F5A60062EC960058E38B0044D26F002CB7
      4000B6ECB9000000000000000000000000000000000000000000B89888000000
      0000000000000000000000000000000000000000000000000000A7827000B18E
      7E00E1D4CE000000000000000000000000000000000000000000000000000000
      0000F0F5FF0099B0FF00779BFF006590FF00608AFF00698CFF008EA6FF00EFF2
      FF00000000000000000000000000000000000000000000000000000000000000
      0000FDF5ED00E3B88300D8954000D5892600D1862500D38D3F00DFB38400FBF3
      ED00000000000000000000000000000000000000000000000000000000000000
      0000EDFCF10091DFA7005DD27D004BCC6D0048CA670056C86C008DD69700EFFB
      F000000000000000000000000000000000000000000000000000B8988800B898
      8800B4938300B4938300B08E7D00B08E7D00AC887700AC887700A7827000E1D4
      CE00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000200000000100010000000000000100000000000000000000
      000000000000000000000000FFFFFF0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000FFFFFFFFFFFFFFFFF00FF00FF00FC001
      E007E007E007D001C003C003C003D009818180018181D00983C180018081D011
      87E180018081D0018DB180018081D009818180018C31D401818180018261D001
      8181800181C1DF03818180018081DE03C003C003C003DC03E007E007E007DFC7
      F00FF00FF00FC00FFFFFFFFFFFFFFFFF00000000000000000000000000000000
      000000000000}
  end
end
