inherited fPayrollRecord: TfPayrollRecord
  BorderWidth = 2
  Caption = 'fPayrollRecord'
  ClientHeight = 519
  ClientWidth = 995
  OnCreate = FormCreate
  ExplicitWidth = 1015
  ExplicitHeight = 562
  PixelsPerInch = 96
  TextHeight = 14
  inherited pMaster: TJvPanel
    Width = 995
    Height = 519
    BorderWidth = 0
    ExplicitWidth = 995
    ExplicitHeight = 519
    object pcMaster: TJvPageControl
      Left = 0
      Top = 0
      Width = 995
      Height = 519
      ActivePage = TabSheet1
      Align = alClient
      TabOrder = 0
      object TabSheet1: TTabSheet
        Caption = 'Payroll Details'
        object pDetails: TJvPanel
          Left = 0
          Top = 0
          Width = 987
          Height = 490
          HotTrackFont.Charset = DEFAULT_CHARSET
          HotTrackFont.Color = clWindowText
          HotTrackFont.Height = -11
          HotTrackFont.Name = 'Tahoma'
          HotTrackFont.Style = []
          Align = alClient
          BevelOuter = bvNone
          ParentBackground = False
          TabOrder = 0
          object ghAction: TJvGroupHeader
            Left = 16
            Top = 416
            Width = 877
            Height = 18
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clHighlight
            Font.Height = -12
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
          end
          object Status: TJvLabel
            Left = 43
            Top = 72
            Width = 27
            Height = 14
            Caption = 'Days'
            Transparent = True
            HotTrackFont.Charset = DEFAULT_CHARSET
            HotTrackFont.Color = clWindowText
            HotTrackFont.Height = -11
            HotTrackFont.Name = 'Tahoma'
            HotTrackFont.Style = []
          end
          object JvLabel6: TJvLabel
            Left = 43
            Top = 227
            Width = 35
            Height = 14
            Caption = 'Gross'
            Color = clMenu
            Font.Charset = ANSI_CHARSET
            Font.Color = clGray
            Font.Height = -12
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentColor = False
            ParentFont = False
            Transparent = True
            HotTrackFont.Charset = ANSI_CHARSET
            HotTrackFont.Color = clWindowText
            HotTrackFont.Height = -12
            HotTrackFont.Name = 'Tahoma'
            HotTrackFont.Style = []
          end
          object JvLabel1: TJvLabel
            Left = 43
            Top = 21
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
          object JvLabel2: TJvLabel
            Left = 43
            Top = 47
            Width = 36
            Height = 14
            Caption = 'Period'
            Transparent = True
            HotTrackFont.Charset = DEFAULT_CHARSET
            HotTrackFont.Color = clWindowText
            HotTrackFont.Height = -11
            HotTrackFont.Name = 'Tahoma'
            HotTrackFont.Style = []
          end
          object JvLabel3: TJvLabel
            Left = 43
            Top = 253
            Width = 64
            Height = 14
            Caption = 'Allowance'
            Color = clMenu
            Font.Charset = ANSI_CHARSET
            Font.Color = clGray
            Font.Height = -12
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentColor = False
            ParentFont = False
            Transparent = True
            HotTrackFont.Charset = ANSI_CHARSET
            HotTrackFont.Color = clWindowText
            HotTrackFont.Height = -12
            HotTrackFont.Name = 'Tahoma'
            HotTrackFont.Style = []
          end
          object JvLabel7: TJvLabel
            Left = 43
            Top = 279
            Width = 65
            Height = 14
            Caption = 'Deduction'
            Color = clMenu
            Font.Charset = ANSI_CHARSET
            Font.Color = clGray
            Font.Height = -12
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentColor = False
            ParentFont = False
            Transparent = True
            HotTrackFont.Charset = ANSI_CHARSET
            HotTrackFont.Color = clWindowText
            HotTrackFont.Height = -12
            HotTrackFont.Name = 'Tahoma'
            HotTrackFont.Style = []
          end
          object JvGroupHeader4: TJvGroupHeader
            Left = 27
            Top = 207
            Width = 319
            Height = 18
            Caption = 'Totals'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clHighlight
            Font.Height = -12
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
          end
          object JvLabel8: TJvLabel
            Left = 43
            Top = 359
            Width = 75
            Height = 14
            Caption = 'Adjustment'
            Color = clMenu
            Font.Charset = ANSI_CHARSET
            Font.Color = clGray
            Font.Height = -12
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentColor = False
            ParentFont = False
            Transparent = True
            HotTrackFont.Charset = ANSI_CHARSET
            HotTrackFont.Color = clWindowText
            HotTrackFont.Height = -12
            HotTrackFont.Name = 'Tahoma'
            HotTrackFont.Style = []
          end
          object JvLabel4: TJvLabel
            Left = 43
            Top = 98
            Width = 90
            Height = 14
            Caption = 'Leaves with pay'
            Transparent = True
            HotTrackFont.Charset = DEFAULT_CHARSET
            HotTrackFont.Color = clWindowText
            HotTrackFont.Height = -11
            HotTrackFont.Name = 'Tahoma'
            HotTrackFont.Style = []
          end
          object JvLabel5: TJvLabel
            Left = 222
            Top = 72
            Width = 59
            Height = 14
            Caption = 'Undertime'
            Transparent = True
            HotTrackFont.Charset = DEFAULT_CHARSET
            HotTrackFont.Color = clWindowText
            HotTrackFont.Height = -11
            HotTrackFont.Name = 'Tahoma'
            HotTrackFont.Style = []
          end
          object JvLabel9: TJvLabel
            Left = 43
            Top = 385
            Width = 23
            Height = 14
            Caption = 'Net'
            Color = clMenu
            Font.Charset = ANSI_CHARSET
            Font.Color = clGray
            Font.Height = -12
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentColor = False
            ParentFont = False
            Transparent = True
            HotTrackFont.Charset = ANSI_CHARSET
            HotTrackFont.Color = clWindowText
            HotTrackFont.Height = -12
            HotTrackFont.Name = 'Tahoma'
            HotTrackFont.Style = []
          end
          object JvLabel10: TJvLabel
            Left = 222
            Top = 98
            Width = 52
            Height = 14
            Caption = 'Overtime'
            Transparent = True
            Visible = False
            HotTrackFont.Charset = DEFAULT_CHARSET
            HotTrackFont.Color = clWindowText
            HotTrackFont.Height = -11
            HotTrackFont.Name = 'Tahoma'
            HotTrackFont.Style = []
          end
          object JvLabel11: TJvLabel
            Left = 43
            Top = 124
            Width = 100
            Height = 14
            Caption = 'Leaves w/out pay'
            Transparent = True
            HotTrackFont.Charset = DEFAULT_CHARSET
            HotTrackFont.Color = clWindowText
            HotTrackFont.Height = -11
            HotTrackFont.Name = 'Tahoma'
            HotTrackFont.Style = []
          end
          object JvLabel12: TJvLabel
            Left = 222
            Top = 124
            Width = 44
            Height = 14
            Caption = 'Skeletal'
            Transparent = True
            Visible = False
            HotTrackFont.Charset = DEFAULT_CHARSET
            HotTrackFont.Color = clWindowText
            HotTrackFont.Height = -11
            HotTrackFont.Name = 'Tahoma'
            HotTrackFont.Style = []
          end
          object JvLabel13: TJvLabel
            Left = 43
            Top = 150
            Width = 69
            Height = 14
            Caption = 'Dependents'
            Transparent = True
            HotTrackFont.Charset = DEFAULT_CHARSET
            HotTrackFont.Color = clWindowText
            HotTrackFont.Height = -11
            HotTrackFont.Name = 'Tahoma'
            HotTrackFont.Style = []
          end
          object JvGroupHeader2: TJvGroupHeader
            Left = 518
            Top = 31
            Width = 200
            Height = 17
            Caption = 'JvGroupHeader2'
          end
          object JvLabel14: TJvLabel
            Left = 43
            Top = 305
            Width = 116
            Height = 14
            Caption = 'Undertime / LWOP'
            Color = clMenu
            Font.Charset = ANSI_CHARSET
            Font.Color = clGray
            Font.Height = -12
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentColor = False
            ParentFont = False
            Transparent = True
            HotTrackFont.Charset = ANSI_CHARSET
            HotTrackFont.Color = clWindowText
            HotTrackFont.Height = -12
            HotTrackFont.Name = 'Tahoma'
            HotTrackFont.Style = []
          end
          object JvLabel15: TJvLabel
            Left = 43
            Top = 333
            Width = 142
            Height = 14
            Caption = 'Late / Incomplete logs'
            Color = clMenu
            Font.Charset = ANSI_CHARSET
            Font.Color = clGray
            Font.Height = -12
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentColor = False
            ParentFont = False
            Transparent = True
            HotTrackFont.Charset = ANSI_CHARSET
            HotTrackFont.Color = clWindowText
            HotTrackFont.Height = -12
            HotTrackFont.Name = 'Tahoma'
            HotTrackFont.Style = []
          end
          object JvLabel16: TJvLabel
            Left = 43
            Top = 176
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
          object bSave: TcxButton
            Left = 43
            Top = 424
            Width = 81
            Height = 27
            Caption = 'Save'
            LookAndFeel.SkinName = ''
            OptionsImage.ImageIndex = 1
            OptionsImage.Images = ilBaseMain
            TabOrder = 1
            OnClick = bSaveClick
          end
          object bCancel: TcxButton
            Left = 125
            Top = 424
            Width = 81
            Height = 27
            Caption = 'Cancel'
            OptionsImage.ImageIndex = 3
            OptionsImage.Images = ilBaseMain
            TabOrder = 2
            OnClick = bCancelClick
          end
          object cxDBImageComboBox1: TcxDBImageComboBox
            Left = 373
            Top = 383
            DataBinding.DataField = 'rank_movement'
            Properties.Items = <
              item
                ImageIndex = 0
                Value = -1
              end
              item
                ImageIndex = 1
                Value = 0
              end
              item
                ImageIndex = 2
                Value = 1
              end
              item
                ImageIndex = 3
                Value = -2
              end>
            Properties.ReadOnly = False
            Style.BorderColor = clMenu
            Style.BorderStyle = ebsNone
            Style.Color = clMenu
            Style.Edges = [bLeft, bTop, bRight, bBottom]
            Style.TransparentBorder = True
            Style.ButtonStyle = btsDefault
            Style.ButtonTransparency = ebtHideInactive
            TabOrder = 0
            Width = 27
          end
          object bBack: TcxButton
            Left = 812
            Top = 424
            Width = 81
            Height = 27
            Caption = 'Back'
            OptionsImage.ImageIndex = 5
            OptionsImage.Images = ilBaseMain
            TabOrder = 3
            OnClick = bBackClick
          end
          object cxDBTextEdit1: TcxDBTextEdit
            Left = 155
            Top = 14
            TabStop = False
            DataBinding.DataField = 'employee_name'
            DataBinding.DataSource = dmPayroll.dscPayroll
            Enabled = False
            Properties.MaxLength = 0
            Style.LookAndFeel.NativeStyle = True
            Style.Shadow = False
            StyleDisabled.LookAndFeel.NativeStyle = True
            StyleFocused.LookAndFeel.NativeStyle = True
            StyleHot.LookAndFeel.NativeStyle = True
            TabOrder = 4
            Width = 191
          end
          object cxDBTextEdit2: TcxDBTextEdit
            Left = 155
            Top = 40
            TabStop = False
            DataBinding.DataField = 'period'
            DataBinding.DataSource = dmPayroll.dscPayroll
            Enabled = False
            Properties.MaxLength = 0
            Style.LookAndFeel.NativeStyle = True
            Style.Shadow = False
            StyleDisabled.LookAndFeel.NativeStyle = True
            StyleFocused.LookAndFeel.NativeStyle = True
            StyleHot.LookAndFeel.NativeStyle = True
            TabOrder = 5
            Width = 191
          end
          object cxDBCurrencyEdit1: TcxDBCurrencyEdit
            Left = 212
            Top = 223
            TabStop = False
            DataBinding.DataField = 'gross'
            DataBinding.DataSource = dmPayroll.dscPayroll
            Enabled = False
            ParentFont = False
            Properties.DisplayFormat = ',0.00;-,0.00'
            Style.Color = clMenu
            Style.Font.Charset = ANSI_CHARSET
            Style.Font.Color = clGreen
            Style.Font.Height = -12
            Style.Font.Name = 'Tahoma'
            Style.Font.Style = [fsBold]
            Style.TextStyle = []
            Style.IsFontAssigned = True
            StyleDisabled.BorderStyle = ebsNone
            StyleDisabled.Color = clWhite
            StyleDisabled.TextColor = clGray
            TabOrder = 6
            Width = 134
          end
          object cxDBCurrencyEdit3: TcxDBCurrencyEdit
            Left = 155
            Top = 66
            TabStop = False
            DataBinding.DataField = 'number_of_days'
            DataBinding.DataSource = dmPayroll.dscPayroll
            Enabled = False
            Properties.DisplayFormat = ',0.00;-,0.00'
            TabOrder = 7
            Width = 53
          end
          object cxDBCurrencyEdit4: TcxDBCurrencyEdit
            Left = 212
            Top = 249
            TabStop = False
            DataBinding.DataField = 'allowance'
            DataBinding.DataSource = dmPayroll.dscPayroll
            Enabled = False
            ParentFont = False
            Properties.DisplayFormat = ',0.00;-,0.00'
            Style.Color = clMenu
            Style.Font.Charset = ANSI_CHARSET
            Style.Font.Color = clGreen
            Style.Font.Height = -12
            Style.Font.Name = 'Tahoma'
            Style.Font.Style = [fsBold]
            Style.TextStyle = []
            Style.IsFontAssigned = True
            StyleDisabled.BorderStyle = ebsNone
            StyleDisabled.Color = clWhite
            StyleDisabled.TextColor = clGreen
            TabOrder = 8
            Width = 134
          end
          object cxDBCurrencyEdit5: TcxDBCurrencyEdit
            Left = 212
            Top = 275
            TabStop = False
            DataBinding.DataField = 'deduction'
            DataBinding.DataSource = dmPayroll.dscPayroll
            Enabled = False
            ParentFont = False
            Properties.DisplayFormat = ',0.00;(,0.00)'
            Style.Color = clMenu
            Style.Font.Charset = ANSI_CHARSET
            Style.Font.Color = clGreen
            Style.Font.Height = -12
            Style.Font.Name = 'Tahoma'
            Style.Font.Style = [fsBold]
            Style.TextStyle = []
            Style.IsFontAssigned = True
            StyleDisabled.BorderStyle = ebsNone
            StyleDisabled.Color = clWhite
            StyleDisabled.TextColor = clRed
            TabOrder = 9
            Width = 134
          end
          object ceNet: TcxDBCurrencyEdit
            Left = 212
            Top = 379
            TabStop = False
            DataBinding.DataField = 'net'
            DataBinding.DataSource = dmPayroll.dscPayroll
            Enabled = False
            ParentFont = False
            Properties.DisplayFormat = ',0.00;-,0.00'
            Style.Color = clMenu
            Style.Font.Charset = ANSI_CHARSET
            Style.Font.Color = clGreen
            Style.Font.Height = -12
            Style.Font.Name = 'Tahoma'
            Style.Font.Style = [fsBold]
            Style.TextStyle = []
            Style.IsFontAssigned = True
            StyleDisabled.BorderStyle = ebsNone
            StyleDisabled.Color = clWhite
            StyleDisabled.TextColor = clGray
            StyleDisabled.TextStyle = [fsBold]
            TabOrder = 10
            Width = 134
          end
          object lblStatus: TcxDBLabel
            Left = 406
            Top = 383
            DataBinding.DataField = 'payrollstatus_name'
            DataBinding.DataSource = dmPayroll.dscPayroll
            ParentFont = False
            ParentShowHint = False
            Properties.Alignment.Horz = taLeftJustify
            ShowHint = False
            Style.Font.Charset = ANSI_CHARSET
            Style.Font.Color = clGray
            Style.Font.Height = -15
            Style.Font.Name = 'Tahoma'
            Style.Font.Style = [fsBold]
            Style.Shadow = False
            Style.TextColor = clGray
            Style.TextStyle = [fsBold]
            Style.IsFontAssigned = True
            Visible = False
            Height = 32
            Width = 173
          end
          object btnGenerate: TcxButton
            Left = 681
            Top = 424
            Width = 130
            Height = 27
            Caption = 'Regenerate'
            OptionsImage.Images = ilBaseMain
            TabOrder = 12
            OnClick = btnGenerateClick
          end
          object cxDBCurrencyEdit6: TcxDBCurrencyEdit
            Left = 293
            Top = 66
            TabStop = False
            DataBinding.DataField = 'undertime'
            DataBinding.DataSource = dmPayroll.dscPayroll
            Enabled = False
            Properties.DisplayFormat = ',0.00;-,0.00'
            TabOrder = 13
            Width = 53
          end
          object cxDBCurrencyEdit7: TcxDBCurrencyEdit
            Left = 212
            Top = 353
            TabStop = False
            DataBinding.DataField = 'adjustment'
            DataBinding.DataSource = dmPayroll.dscPayroll
            Enabled = False
            ParentFont = False
            Properties.DisplayFormat = ',0.00;(,0.00)'
            Style.Color = clMenu
            Style.Font.Charset = ANSI_CHARSET
            Style.Font.Color = clGreen
            Style.Font.Height = -12
            Style.Font.Name = 'Tahoma'
            Style.Font.Style = []
            Style.TextStyle = []
            Style.IsFontAssigned = True
            StyleDisabled.BorderStyle = ebsNone
            StyleDisabled.Color = clWhite
            StyleDisabled.TextColor = clPurple
            StyleDisabled.TextStyle = []
            TabOrder = 14
            Width = 134
          end
          object cxDBCurrencyEdit8: TcxDBCurrencyEdit
            Left = 293
            Top = 92
            TabStop = False
            DataBinding.DataField = 'undertime'
            DataBinding.DataSource = dmPayroll.dscPayroll
            Enabled = False
            Properties.DisplayFormat = ',0.00;-,0.00'
            TabOrder = 15
            Visible = False
            Width = 53
          end
          object pcDetails: TcxPageControl
            Left = 406
            Top = 15
            Width = 491
            Height = 386
            Color = clBtnFace
            ParentBackground = False
            ParentColor = False
            TabOrder = 16
            Properties.ActivePage = tsDeduction
            Properties.CustomButtons.Buttons = <>
            Properties.Style = 1
            LookAndFeel.Kind = lfUltraFlat
            LookAndFeel.NativeStyle = True
            LookAndFeel.SkinName = ''
            ClientRectBottom = 382
            ClientRectLeft = 4
            ClientRectRight = 487
            ClientRectTop = 25
            object tsDeduction: TcxTabSheet
              Caption = 'Deductions'
              Color = clBtnFace
              Font.Charset = ANSI_CHARSET
              Font.Color = clHighlight
              Font.Height = -12
              Font.Name = 'Tahoma'
              Font.Style = []
              ImageIndex = 0
              ParentColor = False
              ParentFont = False
              object pnlDeduction: TPanel
                Left = 0
                Top = 0
                Width = 483
                Height = 357
                Align = alClient
                BevelOuter = bvNone
                ParentBackground = False
                TabOrder = 0
                object JvGroupBox1: TJvGroupBox
                  Left = 0
                  Top = 0
                  Width = 483
                  Height = 357
                  Align = alClient
                  Caption = ''
                  TabOrder = 0
                  object grDeduction: TcxGrid
                    Left = 10
                    Top = 56
                    Width = 463
                    Height = 265
                    BevelInner = bvNone
                    BevelOuter = bvNone
                    BorderStyle = cxcbsNone
                    TabOrder = 0
                    LookAndFeel.NativeStyle = False
                    object vwDeduction: TcxGridDBTableView
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
                      OnEditing = vwDeductionEditing
                      DataController.DataSource = dmPayroll.dscPayrollDeductions
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
                      OptionsView.GridLineColor = 8421440
                      OptionsView.GridLines = glNone
                      OptionsView.GroupByBox = False
                      OptionsView.Header = False
                      OptionsView.RowSeparatorColor = 12303291
                      OptionsView.RowSeparatorWidth = 1
                      Styles.Background = csBackground
                      Styles.Content = csContent
                      object vwDeductiondeductiontype_code: TcxGridDBColumn
                        DataBinding.FieldName = 'deductiontype_code'
                        PropertiesClassName = 'TcxLookupComboBoxProperties'
                        Properties.KeyFieldNames = 'deductiontype_code'
                        Properties.ListColumns = <
                          item
                            FieldName = 'deductiontype_name'
                          end>
                        Properties.ListSource = dmPayroll.dscDeductionTypes
                        MinWidth = 120
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
                        Width = 120
                      end
                      object vwDeductiondeduction_amount: TcxGridDBColumn
                        DataBinding.FieldName = 'deduction_amount'
                        PropertiesClassName = 'TcxCurrencyEditProperties'
                        Properties.DisplayFormat = '###,##0.00'
                        Properties.EditFormat = '###,##0.00'
                        Properties.Nullable = False
                        Properties.UseLeftAlignmentOnEditing = False
                        MinWidth = 62
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
                        Width = 62
                      end
                      object vwDeductionbcf_amount: TcxGridDBColumn
                        Caption = 'BCF'
                        DataBinding.FieldName = 'bcf_amount'
                        PropertiesClassName = 'TcxCurrencyEditProperties'
                        Properties.DisplayFormat = '###,##0.00'
                        Properties.EditFormat = '###,##0.00'
                        Properties.UseLeftAlignmentOnEditing = False
                        MinWidth = 62
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
                        Width = 62
                      end
                      object vwDeductionbcf_sub_location_code: TcxGridDBColumn
                        DataBinding.FieldName = 'bcf_sub_location_code'
                        PropertiesClassName = 'TcxLookupComboBoxProperties'
                        Properties.DropDownListStyle = lsFixedList
                        Properties.KeyFieldNames = 'location_code'
                        Properties.ListColumns = <
                          item
                            FieldName = 'location_name'
                          end>
                        Properties.ListOptions.GridLines = glNone
                        Properties.ListOptions.ShowHeader = False
                        Properties.ListSource = dmPayroll.dscLocations
                        Width = 219
                      end
                    end
                    object lvlDeduction: TcxGridLevel
                      GridView = vwDeduction
                    end
                  end
                  object Panel3: TPanel
                    Left = 10
                    Top = 33
                    Width = 120
                    Height = 17
                    Caption = 'Deduction Type'
                    Font.Charset = ANSI_CHARSET
                    Font.Color = clGray
                    Font.Height = -12
                    Font.Name = 'Tahoma'
                    Font.Style = []
                    ParentFont = False
                    TabOrder = 1
                  end
                  object Panel4: TPanel
                    Left = 130
                    Top = 33
                    Width = 62
                    Height = 17
                    Caption = 'Amount'
                    Font.Charset = ANSI_CHARSET
                    Font.Color = clGray
                    Font.Height = -12
                    Font.Name = 'Tahoma'
                    Font.Style = []
                    ParentFont = False
                    TabOrder = 2
                  end
                  object Panel7: TPanel
                    Left = 192
                    Top = 33
                    Width = 62
                    Height = 17
                    Caption = 'BCF'
                    Font.Charset = ANSI_CHARSET
                    Font.Color = clGray
                    Font.Height = -12
                    Font.Name = 'Tahoma'
                    Font.Style = []
                    ParentFont = False
                    TabOrder = 3
                  end
                  object Panel8: TPanel
                    Left = 254
                    Top = 33
                    Width = 219
                    Height = 17
                    Caption = 'Subsidiary'
                    Font.Charset = ANSI_CHARSET
                    Font.Color = clGray
                    Font.Height = -12
                    Font.Name = 'Tahoma'
                    Font.Style = []
                    ParentFont = False
                    TabOrder = 4
                  end
                  object cbxStatutory: TcxCheckBox
                    Left = 10
                    Top = 8
                    Caption = 'Statutory'
                    State = cbsChecked
                    Style.TextColor = clInfoText
                    TabOrder = 5
                    OnClick = cbxStatutoryClick
                    Width = 92
                  end
                  object cbxVoluntary: TcxCheckBox
                    Left = 113
                    Top = 8
                    Caption = 'Voluntary'
                    State = cbsChecked
                    Style.TextColor = clInfoText
                    TabOrder = 6
                    OnClick = cbxStatutoryClick
                    Width = 135
                  end
                end
              end
            end
            object tsAllowances: TcxTabSheet
              Caption = 'Allowances'
              ImageIndex = 1
              object pnlAllowances: TPanel
                Left = 0
                Top = 0
                Width = 483
                Height = 357
                Align = alClient
                BevelOuter = bvNone
                ParentBackground = False
                TabOrder = 0
                object JvGroupBox2: TJvGroupBox
                  Left = 0
                  Top = 0
                  Width = 483
                  Height = 357
                  Align = alClient
                  Caption = ''
                  TabOrder = 0
                  object grAllowance: TcxGrid
                    Left = 10
                    Top = 31
                    Width = 350
                    Height = 290
                    BevelInner = bvNone
                    BevelOuter = bvNone
                    BorderStyle = cxcbsNone
                    Enabled = False
                    TabOrder = 0
                    LookAndFeel.NativeStyle = False
                    object vwAllowance: TcxGridDBTableView
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
                      DataController.DataSource = dmPayroll.dscPayrollAllowances
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
                      OptionsView.GridLineColor = 8421440
                      OptionsView.GridLines = glNone
                      OptionsView.GroupByBox = False
                      OptionsView.Header = False
                      OptionsView.RowSeparatorColor = 12303291
                      OptionsView.RowSeparatorWidth = 1
                      Styles.Background = csBackground
                      Styles.Content = csContent
                      object vwAllowanceallowancetype_code: TcxGridDBColumn
                        DataBinding.FieldName = 'allowancetype_code'
                        PropertiesClassName = 'TcxLookupComboBoxProperties'
                        Properties.KeyFieldNames = 'allowancetype_code'
                        Properties.ListColumns = <
                          item
                            FieldName = 'allowancetype_name'
                          end>
                        Properties.ListSource = dmPayroll.dscAllowanceTypes
                        MinWidth = 265
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
                        Options.ShowCaption = False
                        Width = 265
                      end
                      object vwAllowanceallowance_amount: TcxGridDBColumn
                        DataBinding.FieldName = 'allowance_amount'
                        PropertiesClassName = 'TcxCurrencyEditProperties'
                        Properties.DisplayFormat = '###,##0.00'
                        Properties.EditFormat = '###,##0.00'
                        Properties.UseLeftAlignmentOnEditing = False
                        MinWidth = 85
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
                        Width = 85
                      end
                    end
                    object lvlAllowance: TcxGridLevel
                      GridView = vwAllowance
                    end
                  end
                  object Panel1: TPanel
                    Left = 10
                    Top = 8
                    Width = 265
                    Height = 17
                    Caption = 'Allowance Type'
                    Font.Charset = ANSI_CHARSET
                    Font.Color = clGray
                    Font.Height = -12
                    Font.Name = 'Tahoma'
                    Font.Style = []
                    ParentFont = False
                    TabOrder = 1
                  end
                  object Panel2: TPanel
                    Left = 275
                    Top = 8
                    Width = 85
                    Height = 17
                    Caption = 'Amount'
                    Font.Charset = ANSI_CHARSET
                    Font.Color = clGray
                    Font.Height = -12
                    Font.Name = 'Tahoma'
                    Font.Style = []
                    ParentFont = False
                    TabOrder = 2
                  end
                end
              end
            end
            object tsAdjustments: TcxTabSheet
              Caption = 'Adjustments'
              Font.Charset = ANSI_CHARSET
              Font.Color = clHighlight
              Font.Height = -12
              Font.Name = 'Tahoma'
              Font.Style = []
              ImageIndex = 2
              ParentFont = False
              object pnlAdjustments: TPanel
                Left = 0
                Top = 0
                Width = 483
                Height = 357
                Align = alClient
                BevelOuter = bvNone
                ParentBackground = False
                TabOrder = 0
                object JvGroupBox3: TJvGroupBox
                  Left = 0
                  Top = 0
                  Width = 483
                  Height = 357
                  Align = alClient
                  Caption = ''
                  TabOrder = 0
                  object grAdjustment: TcxGrid
                    Left = 10
                    Top = 31
                    Width = 350
                    Height = 290
                    BevelInner = bvNone
                    BevelOuter = bvNone
                    BorderStyle = cxcbsNone
                    PopupMenu = ppAdjustments
                    TabOrder = 0
                    LookAndFeel.NativeStyle = False
                    object vwAdjustment: TcxGridDBTableView
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
                      DataController.DataSource = dmPayroll.dscAdjustments
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
                      OptionsView.GridLineColor = 8421440
                      OptionsView.GridLines = glNone
                      OptionsView.GroupByBox = False
                      OptionsView.Header = False
                      OptionsView.RowSeparatorColor = 12303291
                      OptionsView.RowSeparatorWidth = 1
                      Styles.Background = csBackground
                      Styles.Content = csContent
                      object vwAdjustmentadjustmenttype_code: TcxGridDBColumn
                        DataBinding.FieldName = 'adjustmenttype_code'
                        PropertiesClassName = 'TcxLookupComboBoxProperties'
                        Properties.DropDownListStyle = lsFixedList
                        Properties.ImmediatePost = True
                        Properties.KeyFieldNames = 'adjustmenttype_code'
                        Properties.ListColumns = <
                          item
                            FieldName = 'adjustmenttype_name'
                          end>
                        Properties.ListOptions.ColumnSorting = False
                        Properties.ListOptions.GridLines = glNone
                        Properties.ListOptions.ShowHeader = False
                        Properties.ListSource = dmPayroll.dscAdjustmentTypes
                        MinWidth = 265
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
                        Width = 265
                      end
                      object vwAdjustmentadjustment_amount: TcxGridDBColumn
                        DataBinding.FieldName = 'adjustment_amount'
                        PropertiesClassName = 'TcxCurrencyEditProperties'
                        Properties.DisplayFormat = '###,##0.00'
                        Properties.EditFormat = '###,##0.00'
                        Properties.UseLeftAlignmentOnEditing = False
                        MinWidth = 85
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
                        Width = 85
                      end
                    end
                    object lvlAdjustment: TcxGridLevel
                      GridView = vwAdjustment
                    end
                  end
                  object Panel5: TPanel
                    Left = 10
                    Top = 8
                    Width = 265
                    Height = 17
                    Caption = 'Type'
                    Font.Charset = ANSI_CHARSET
                    Font.Color = clGray
                    Font.Height = -12
                    Font.Name = 'Tahoma'
                    Font.Style = []
                    ParentFont = False
                    TabOrder = 1
                  end
                  object Panel6: TPanel
                    Left = 275
                    Top = 8
                    Width = 85
                    Height = 17
                    Caption = 'Amount'
                    Font.Charset = ANSI_CHARSET
                    Font.Color = clGray
                    Font.Height = -12
                    Font.Name = 'Tahoma'
                    Font.Style = []
                    ParentFont = False
                    TabOrder = 2
                  end
                end
              end
            end
          end
          object cxDBCurrencyEdit10: TcxDBCurrencyEdit
            Left = 293
            Top = 118
            TabStop = False
            DataBinding.DataField = 'undertime'
            DataBinding.DataSource = dmPayroll.dscPayroll
            Enabled = False
            Properties.DisplayFormat = ',0.00;-,0.00'
            TabOrder = 17
            Visible = False
            Width = 53
          end
          object cbxClaimDependents: TcxCheckBox
            Left = 219
            Top = 148
            Caption = 'Claim dependents'
            TabOrder = 18
            Width = 121
          end
          object cxDBCurrencyEdit11: TcxDBCurrencyEdit
            Left = 155
            Top = 144
            TabStop = False
            DataBinding.DataField = 'dependents'
            DataBinding.DataSource = dmPayroll.dscPayroll
            Enabled = False
            Properties.DisplayFormat = ',0.00;-,0.00'
            TabOrder = 20
            Width = 53
          end
          object cxDBCurrencyEdit12: TcxDBCurrencyEdit
            Left = 212
            Top = 301
            TabStop = False
            DataBinding.DataField = 'ut'
            DataBinding.DataSource = dmPayroll.dscPayroll
            Enabled = False
            ParentFont = False
            Properties.DisplayFormat = ',0.00;(,0.00)'
            Style.Color = clMenu
            Style.Font.Charset = ANSI_CHARSET
            Style.Font.Color = clGreen
            Style.Font.Height = -12
            Style.Font.Name = 'Tahoma'
            Style.Font.Style = [fsBold]
            Style.TextStyle = []
            Style.IsFontAssigned = True
            StyleDisabled.BorderStyle = ebsNone
            StyleDisabled.Color = clWhite
            StyleDisabled.TextColor = clRed
            TabOrder = 21
            Width = 65
          end
          object cxDBCurrencyEdit13: TcxDBCurrencyEdit
            Left = 281
            Top = 301
            TabStop = False
            DataBinding.DataField = 'lwop'
            DataBinding.DataSource = dmPayroll.dscPayroll
            Enabled = False
            ParentFont = False
            Properties.DisplayFormat = ',0.00;(,0.00)'
            Style.Color = clMenu
            Style.Font.Charset = ANSI_CHARSET
            Style.Font.Color = clGreen
            Style.Font.Height = -12
            Style.Font.Name = 'Tahoma'
            Style.Font.Style = [fsBold]
            Style.TextStyle = []
            Style.IsFontAssigned = True
            StyleDisabled.BorderStyle = ebsNone
            StyleDisabled.Color = clWhite
            StyleDisabled.TextColor = clRed
            TabOrder = 22
            Width = 65
          end
          object btnPrevEmployee: TcxButton
            Left = 349
            Top = 14
            Width = 20
            Height = 21
            Hint = 'Previous employee'
            LookAndFeel.SkinName = ''
            OptionsImage.ImageIndex = 5
            OptionsImage.Images = ilBaseMain
            ParentShowHint = False
            ShowHint = True
            SpeedButtonOptions.CanBeFocused = False
            SpeedButtonOptions.Flat = True
            TabOrder = 23
            OnClick = btnPrevEmployeeClick
          end
          object btnNextEmployee: TcxButton
            Left = 369
            Top = 14
            Width = 20
            Height = 21
            Hint = 'Next employee'
            LookAndFeel.SkinName = ''
            OptionsImage.ImageIndex = 6
            OptionsImage.Images = ilBaseMain
            ParentShowHint = False
            ShowHint = True
            SpeedButtonOptions.CanBeFocused = False
            SpeedButtonOptions.Flat = True
            TabOrder = 24
            OnClick = btnNextEmployeeClick
          end
          object pStatus: TPanel
            Left = 10
            Top = 554
            Width = 273
            Height = 83
            BevelOuter = bvNone
            TabOrder = 25
            Visible = False
            object shpStatus: TShape
              Left = 0
              Top = 0
              Width = 273
              Height = 83
              Align = alClient
              Brush.Color = 12058551
              Pen.Color = 43520
              Pen.Style = psInsideFrame
              Pen.Width = 2
              ExplicitLeft = 80
              ExplicitTop = 24
              ExplicitWidth = 65
              ExplicitHeight = 65
            end
            object Label1: TLabel
              Left = 46
              Top = 35
              Width = 184
              Height = 13
              Caption = 'Generating payroll. Please wait...'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clGreen
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentFont = False
              Transparent = True
            end
          end
          object cxDBCurrencyEdit14: TcxDBCurrencyEdit
            Left = 212
            Top = 327
            TabStop = False
            DataBinding.DataField = 'lt'
            DataBinding.DataSource = dmPayroll.dscPayroll
            Enabled = False
            ParentFont = False
            Properties.DisplayFormat = ',0.00;(,0.00)'
            Style.Color = clMenu
            Style.Font.Charset = ANSI_CHARSET
            Style.Font.Color = clGreen
            Style.Font.Height = -12
            Style.Font.Name = 'Tahoma'
            Style.Font.Style = [fsBold]
            Style.TextStyle = []
            Style.IsFontAssigned = True
            StyleDisabled.BorderStyle = ebsNone
            StyleDisabled.Color = clWhite
            StyleDisabled.TextColor = clRed
            TabOrder = 26
            Width = 65
          end
          object cxDBCurrencyEdit15: TcxDBCurrencyEdit
            Left = 281
            Top = 327
            TabStop = False
            DataBinding.DataField = 'incomplete'
            DataBinding.DataSource = dmPayroll.dscPayroll
            Enabled = False
            ParentFont = False
            Properties.DisplayFormat = ',0.00;(,0.00)'
            Style.Color = clMenu
            Style.Font.Charset = ANSI_CHARSET
            Style.Font.Color = clGreen
            Style.Font.Height = -12
            Style.Font.Name = 'Tahoma'
            Style.Font.Style = [fsBold]
            Style.TextStyle = []
            Style.IsFontAssigned = True
            StyleDisabled.BorderStyle = ebsNone
            StyleDisabled.Color = clWhite
            StyleDisabled.TextColor = clRed
            TabOrder = 27
            Width = 65
          end
          object cbxCopyDeductions: TcxCheckBox
            Left = 281
            Top = 427
            Hint = 'Copy previous adjustments'
            Caption = 'Copy previous deductions'
            ParentShowHint = False
            ShowHint = True
            State = cbsChecked
            Style.Shadow = False
            TabOrder = 28
            Width = 176
          end
          object cbxCopyAdjustments: TcxCheckBox
            Left = 463
            Top = 427
            Hint = 'Copy previous adjustments'
            Caption = 'Copy previous adjustments'
            ParentShowHint = False
            ShowHint = True
            State = cbsChecked
            Style.Shadow = False
            TabOrder = 29
            Width = 176
          end
          object dbluLocation: TcxDBLookupComboBox
            Left = 155
            Top = 170
            DataBinding.DataField = 'credit_location'
            DataBinding.DataSource = dmPayroll.dscPayroll
            Properties.KeyFieldNames = 'location_code'
            Properties.ListColumns = <
              item
                FieldName = 'location_name'
              end>
            Properties.ListOptions.GridLines = glNone
            Properties.ListOptions.ShowHeader = False
            Properties.ListSource = dmPayroll.dscLocations
            TabOrder = 19
            Width = 191
          end
        end
      end
    end
  end
  object cxDBCurrencyEdit2: TcxDBCurrencyEdit [1]
    Left = 159
    Top = 117
    TabStop = False
    DataBinding.DataField = 'leaves_with_pay'
    DataBinding.DataSource = dmPayroll.dscPayroll
    Enabled = False
    Properties.DisplayFormat = ',0.0000;-,0.0000'
    TabOrder = 1
    Width = 53
  end
  object cxDBCurrencyEdit9: TcxDBCurrencyEdit [2]
    Left = 159
    Top = 143
    TabStop = False
    DataBinding.DataField = 'leaves_without_pay'
    DataBinding.DataSource = dmPayroll.dscPayroll
    Enabled = False
    Properties.DisplayFormat = ',0.0000;-,0.0000'
    TabOrder = 2
    Width = 53
  end
  inherited ilBaseMain: TcxImageList
    FormatVersion = 1
    DesignInfo = 31458160
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
          2000000000000004000000000000000000000000000000000000000000090000
          00160000001A0000001A0000001A0000001A0000001A0000001A0000001A0000
          001A0000001A0000001A0000001A0000001A0000001600000009000000120400
          00332E020082520400BA5B0400CB5B0400CB5B0400CB5B0400CB5B0400CB5B04
          00CB5B0400CB5B0400CB520400BA2E0200820300003300000012000000003806
          0070932C16DBE6663AF8FA7442FFFA7442FFFA7442FFFA7442FFFA7442FFFA74
          42FFFA7442FFFA7442FFE66639F8932B15DB3806007000000000000000006510
          01B3E1663AF8F16F3EFFF16F3EFFF16F3EFFF16F3EFFCF5A31FFCF5A31FFF16F
          3EFFF16F3EFFF16F3EFFF16F3EFFE06236F8651001B300000000000000007315
          02C4E86E42FFE5673AFFE5673AFFE5673AFFC9572FFFE8E8E8FFECECECFFD75F
          34FFE5673AFFE5673AFFE5673AFFE5673AFF731502C400000000000000007717
          02C3DE6C42FFD86035FFD86035FFC3532CFFE0E0E0FFE4E4E4FFE3C6BBFFD25C
          32FFD86035FFD86035FFD86035FFD86035FF771702C300000000000000007918
          02C2D86F4BFFCB5930FFBC4F29FFD7D7D7FFDCDCDCFFD3B9B1FFBC4F29FFBC4F
          29FFBC4F29FFBC4F29FFCB582FFFCC5B32FF791802C200000000000000007B1A
          02C1DA7957FFC85F3BFFD4D4D4FFD3D3D3FFD7D7D7FFDCDCDCFFE0E0E0FFE4E4
          E4FFE8E8E8FFECECECFFBE502AFFC35631FF7B1A02C100000000000000007E1C
          02C1DD7D5BFFCC6644FFF8F8F8FFE1E1E1FFD5D5D5FFD7D7D7FFDCDCDCFFE0E0
          E0FFE4E4E4FFE8E8E8FFB44A26FFBD5532FF7E1C02C10000000000000000811D
          02C0E28260FFCF6947FFCF6947FFFFFFFFFFF8F8F8FFE0C7BEFFB04A27FFB04A
          27FFAD4624FFAD4624FFB04A27FFC25F3CFF811D02C00000000000000000831F
          02BFE88A68FFD6704EFFD6704EFFD6704EFFFFFFFFFFFFFFFFFFEAD1C8FFD16B
          49FFD6704EFFD6704EFFD6704EFFE07E5CFF831F02BF00000000000000008521
          02BFEF906EFFDF7957FFDF7957FFDF7957FFDF7957FFFFFFFFFFFFFFFFFFD26C
          4AFFDF7957FFDF7957FFDF7957FFE88765FF852102BF00000000000000007B1F
          02ADE88B69F7E7815FFFE7815FFFE7815FFFE7815FFFE07A58FFD87250FFE781
          5FFFE7815FFFE7815FFFE7815FFFE48462F77B1F02AD00000000000000004D14
          016BAE4B2AD3E98C6BF7F69876FFF69876FFF69876FFF69876FFF59876FFF597
          75FFF59775FFF59674FFE88A68F7AD4A29D34D14016B00000000000000000802
          000B4D14016A7D2002AC8A2402BD8A2402BD8A2402BD8A2402BD8A2402BD8A24
          02BD8A2402BD8A2402BD7D2002AC4D14016A0802000B00000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000}
      end
      item
        Image.Data = {
          36040000424D3604000000000000360000002800000010000000100000000100
          2000000000000004000000000000000000000000000000000000000000090000
          00160000001A0000001A0000001A0000001A0000001A0000001A0000001A0000
          001A0000001A0000001A0000001A0000001A0000001600000009000000120400
          00332E020082520400BA5B0400CB5B0400CB5B0400CB5B0400CB5B0400CB5B04
          00CB5B0400CB5B0400CB520400BA2E0200820400003300000012000000003806
          0070932C16DBE6663AF8FA7442FFFA7442FFFA7442FFFA7442FFFA7442FFFA74
          42FFFA7442FFFA7442FFE66639F8932B15DB3806007000000000000000006510
          01B3E1663AF8F16F3EFFF16F3EFFF16F3EFFF16F3EFFCF5A31FFCF5A31FFF16F
          3EFFF16F3EFFF16F3EFFF16F3EFFE06236F8651001B300000000000000007315
          02C4E86E42FFE5673AFFE5673AFFE5673AFFD75F34FFE8E8E8FFECECECFFC957
          2FFFE5673AFFE5673AFFE5673AFFE5673AFF731502C400000000000000007717
          02C3DE6C42FFD86035FFD86035FFD86035FFD25C32FFE1C3B9FFE8E8E8FFECEC
          ECFFC3532CFFD86035FFD86035FFD86035FF771702C300000000000000007918
          02C2D86F4BFFCB5930FFBC4F29FFBC4F29FFBC4F29FFBC4F29FFD6BDB4FFE8E8
          E8FFECECECFFBC4F29FFCB582FFFCC5B32FF791802C200000000000000007B1A
          02C1DA7957FFC85F3BFFD4D4D4FFD3D3D3FFD7D7D7FFDCDCDCFFE0E0E0FFE4E4
          E4FFE8E8E8FFECECECFFBE502AFFC35631FF7B1A02C100000000000000007E1C
          02C1DD7D5BFFCC6644FFF8F8F8FFE1E1E1FFD5D5D5FFD7D7D7FFDCDCDCFFE0E0
          E0FFE4E4E4FFE8E8E8FFB44A26FFBD5532FF7E1C02C10000000000000000811D
          02C0E28260FFCF6947FFCF6947FFCF6947FFCA6442FFB8512FFFE1C7BFFFE7E7
          E7FFE1E1E1FFAD4624FFB04A27FFC25F3CFF811D02C00000000000000000831F
          02BFE88A68FFD6704EFFD6704EFFD6704EFFD16B49FFEAD1C8FFFFFFFFFFFFFF
          FFFFD6704EFFD6704EFFD6704EFFE07E5CFF831F02BF00000000000000008521
          02BFEF906EFFDF7957FFDF7957FFDF7957FFD26C4AFFFFFFFFFFFFFFFFFFDF79
          57FFDF7957FFDF7957FFDF7957FFE88765FF852102BF00000000000000007B1F
          02ADE88B69F7E7815FFFE7815FFFE7815FFFE7815FFFD87250FFE07A58FFE781
          5FFFE7815FFFE7815FFFE7815FFFE48462F77B1F02AD00000000000000004D14
          016BAE4B2AD3E98C6BF7F69876FFF69876FFF69876FFF69876FFF59876FFF597
          75FFF59775FFF59674FFE88A68F7AD4A29D34D14016B00000000000000000802
          000B4D14016A7D2002AC8A2402BD8A2402BD8A2402BD8A2402BD8A2402BD8A24
          02BD8A2402BD8A2402BD7D2002AC4D14016A0802000B00000000000000000000
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
  object csrAllowance: TcxStyleRepository
    Left = 928
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
  end
  object ppAdjustments: TPopupMenu
    OnPopup = ppAdjustmentsPopup
    Left = 829
    Top = 480
    object miAdd: TMenuItem
      Caption = 'Add'
      OnClick = miAddClick
    end
    object miRemove: TMenuItem
      Caption = 'Remove'
      OnClick = miRemoveClick
    end
  end
end
