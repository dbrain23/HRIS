inherited fPayrollDeductions: TfPayrollDeductions
  Caption = 'fPayrollDeductions'
  ClientWidth = 852
  OnCreate = FormCreate
  ExplicitWidth = 868
  PixelsPerInch = 96
  TextHeight = 14
  inherited pMaster: TJvPanel
    Width = 852
    ExplicitWidth = 852
    object pcMain: TJvPageControl
      Left = 2
      Top = 2
      Width = 848
      Height = 485
      ActivePage = tsPayroll
      Align = alClient
      MultiLine = True
      TabOrder = 0
      ReduceMemoryUse = True
      object tsPayroll: TTabSheet
        Caption = 'Payroll Deductions'
        ImageIndex = 1
        object pResult: TJvPanel
          Left = 0
          Top = 0
          Width = 840
          Height = 456
          HotTrackFont.Charset = DEFAULT_CHARSET
          HotTrackFont.Color = clWindowText
          HotTrackFont.Height = -11
          HotTrackFont.Name = 'Tahoma'
          HotTrackFont.Style = []
          Align = alClient
          BevelOuter = bvNone
          ParentBackground = False
          TabOrder = 0
          object pGrid: TPanel
            Left = 0
            Top = 0
            Width = 840
            Height = 456
            Align = alClient
            BevelOuter = bvNone
            BorderWidth = 1
            TabOrder = 0
            object grDeduction: TcxGrid
              Left = 1
              Top = 36
              Width = 838
              Height = 419
              Align = alClient
              BevelInner = bvNone
              BevelOuter = bvNone
              BorderStyle = cxcbsNone
              TabOrder = 0
              LookAndFeel.Kind = lfFlat
              LookAndFeel.NativeStyle = False
              LookAndFeel.SkinName = 'DevExpressStyle'
              ExplicitLeft = 2
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
                DataController.DataSource = dmPayroll.dscDeductionsAll
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
                OptionsView.Indicator = True
                OptionsView.RowSeparatorColor = 12303291
                OptionsView.RowSeparatorWidth = 1
                object vwDeductionemployee: TcxGridDBColumn
                  Caption = 'Employee'
                  DataBinding.FieldName = 'employee'
                  MinWidth = 220
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
                  Width = 220
                end
                object vwDeductiondeduction_amount: TcxGridDBColumn
                  Caption = 'Amount'
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
                  Caption = 'Subsidiary'
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
            object pnlSearch: TPanel
              Left = 1
              Top = 1
              Width = 838
              Height = 35
              Align = alTop
              ParentBackground = False
              TabOrder = 1
              DesignSize = (
                838
                35)
              object Label1: TLabel
                Left = 16
                Top = 13
                Width = 85
                Height = 14
                Caption = 'Deduction type'
              end
              object cmbDeductionTypes: TcxComboBox
                Left = 123
                Top = 7
                Anchors = [akLeft, akTop, akRight]
                Properties.Items.Strings = (
                  '')
                StyleDisabled.Color = clMenu
                TabOrder = 0
                OnClick = cmbDeductionTypesClick
                Width = 620
              end
              object bSave: TcxButton
                Left = 749
                Top = 4
                Width = 81
                Height = 27
                Anchors = [akTop, akRight]
                Caption = 'Save'
                LookAndFeel.SkinName = ''
                OptionsImage.ImageIndex = 1
                OptionsImage.Images = ilBaseMain
                TabOrder = 1
                OnClick = bSaveClick
              end
            end
          end
        end
      end
    end
  end
  inherited ilBaseMain: TcxImageList
    FormatVersion = 1
    DesignInfo = 16253704
  end
end
