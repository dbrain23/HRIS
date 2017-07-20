inherited fLocation: TfLocation
  Caption = 'fLocation'
  PixelsPerInch = 96
  TextHeight = 14
  inherited pcMaster: TJvPageControl
    inherited tsMaster: TTabSheet
      Caption = 'Location List'
      ExplicitLeft = 4
      ExplicitTop = 25
      ExplicitWidth = 860
      ExplicitHeight = 514
      inherited pDetails: TJvPanel
        inherited gList: TcxGrid
          TabOrder = 1
          inherited vList: TcxGridDBTableView
            OnCellDblClick = vListCellDblClick
            OnFocusedRecordChanged = vListFocusedRecordChanged
            DataController.DataSource = dmMaintenance.dscLocation
            object vListlocation_code: TcxGridDBColumn
              Caption = 'Code'
              DataBinding.FieldName = 'location_code'
              PropertiesClassName = 'TcxTextEditProperties'
              Properties.CharCase = ecUpperCase
              Properties.MaxLength = 3
              MinWidth = 50
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
              Width = 50
            end
            object vListlocation_name: TcxGridDBColumn
              Caption = 'Name'
              DataBinding.FieldName = 'location_name'
              MinWidth = 350
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
              Width = 350
            end
            object vListlocationtype_code: TcxGridDBColumn
              Caption = 'Type'
              DataBinding.FieldName = 'locationtype_code'
              PropertiesClassName = 'TcxLookupComboBoxProperties'
              Properties.KeyFieldNames = 'locationtype_code'
              Properties.ListColumns = <
                item
                  FieldName = 'locationtype_name'
                end>
              Properties.ListOptions.GridLines = glNone
              Properties.ListOptions.ShowHeader = False
              Properties.ListSource = dmMaintenance.dscLocationType
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
            object vListarea_code: TcxGridDBColumn
              Caption = 'Area'
              DataBinding.FieldName = 'area_code'
              PropertiesClassName = 'TcxLookupComboBoxProperties'
              Properties.KeyFieldNames = 'area_code'
              Properties.ListColumns = <
                item
                  FieldName = 'area_name'
                end>
              Properties.ListOptions.GridLines = glNone
              Properties.ListOptions.ShowHeader = False
              Properties.ListSource = dmMaintenance.dscAreas
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
          end
        end
        inherited bSave: TcxButton
          Left = 46
          LookAndFeel.SkinName = ''
          TabOrder = 2
          ExplicitLeft = 46
        end
        inherited bCancel: TcxButton
          Left = 46
          TabOrder = 0
          ExplicitLeft = 46
        end
        inherited bDelete: TcxButton
          Left = 46
          ExplicitLeft = 46
        end
      end
    end
    object tsDepartments: TTabSheet
      Caption = 'Departments and Allowance Availability'
      ImageIndex = 1
      object pDetail: TPanel
        Left = 0
        Top = 0
        Width = 860
        Height = 514
        Align = alClient
        ParentBackground = False
        TabOrder = 0
        object JvGroupHeader1: TJvGroupHeader
          Left = 27
          Top = 17
          Width = 246
          Height = 19
          Caption = 'Location Details'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clHighlight
          Font.Height = -12
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object JvGroupHeader4: TJvGroupHeader
          Left = 16
          Top = 416
          Width = 725
          Height = 19
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clHighlight
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object JvLabel4: TJvLabel
          Left = 43
          Top = 39
          Width = 30
          Height = 14
          Caption = 'Code'
          Transparent = True
          HotTrackFont.Charset = DEFAULT_CHARSET
          HotTrackFont.Color = clWindowText
          HotTrackFont.Height = -11
          HotTrackFont.Name = 'Tahoma'
          HotTrackFont.Style = []
        end
        object JvLabel5: TJvLabel
          Left = 43
          Top = 65
          Width = 33
          Height = 14
          Caption = 'Name'
          Transparent = True
          HotTrackFont.Charset = DEFAULT_CHARSET
          HotTrackFont.Color = clWindowText
          HotTrackFont.Height = -11
          HotTrackFont.Name = 'Tahoma'
          HotTrackFont.Style = []
        end
        object JvLabel1: TJvLabel
          Left = 43
          Top = 91
          Width = 30
          Height = 14
          Caption = 'Type'
          Transparent = True
          HotTrackFont.Charset = DEFAULT_CHARSET
          HotTrackFont.Color = clWindowText
          HotTrackFont.Height = -11
          HotTrackFont.Name = 'Tahoma'
          HotTrackFont.Style = []
        end
        object JvLabel2: TJvLabel
          Left = 43
          Top = 117
          Width = 27
          Height = 14
          Caption = 'Area'
          Transparent = True
          HotTrackFont.Charset = DEFAULT_CHARSET
          HotTrackFont.Color = clWindowText
          HotTrackFont.Height = -11
          HotTrackFont.Name = 'Tahoma'
          HotTrackFont.Style = []
        end
        object cxButton1: TcxButton
          Left = 43
          Top = 424
          Width = 88
          Height = 29
          Caption = 'New'
          OptionsImage.ImageIndex = 0
          OptionsImage.Images = ilBaseTab
          TabOrder = 5
          OnClick = miNewClick
        end
        object cxButton2: TcxButton
          Left = 132
          Top = 424
          Width = 87
          Height = 29
          Caption = 'Save'
          LookAndFeel.SkinName = ''
          OptionsImage.ImageIndex = 1
          OptionsImage.Images = ilBaseTab
          TabOrder = 6
          OnClick = bSaveClick
        end
        object cxButton3: TcxButton
          Left = 220
          Top = 424
          Width = 87
          Height = 29
          Caption = 'Cancel'
          OptionsImage.ImageIndex = 2
          OptionsImage.Images = ilBaseTab
          TabOrder = 7
          OnClick = bCancelClick
        end
        object cxButton4: TcxButton
          Left = 308
          Top = 424
          Width = 86
          Height = 29
          Caption = 'Delete'
          OptionsImage.ImageIndex = 3
          OptionsImage.Images = ilBaseTab
          TabOrder = 8
          Visible = False
          OnClick = miDeleteClick
        end
        object edLocationCode: TcxDBTextEdit
          Left = 104
          Top = 33
          DataBinding.DataField = 'location_code'
          DataBinding.DataSource = dmMaintenance.dscLocation
          Properties.CharCase = ecUpperCase
          Properties.OnChange = edLocationCodePropertiesChange
          TabOrder = 0
          Width = 169
        end
        object edLocationName: TcxDBTextEdit
          Left = 104
          Top = 59
          DataBinding.DataField = 'location_name'
          DataBinding.DataSource = dmMaintenance.dscLocation
          TabOrder = 1
          Width = 169
        end
        object pcDepartments: TcxPageControl
          Left = 328
          Top = 22
          Width = 413
          Height = 368
          TabOrder = 4
          Properties.ActivePage = tsPrivileges
          Properties.CustomButtons.Buttons = <>
          ClientRectBottom = 364
          ClientRectLeft = 4
          ClientRectRight = 409
          ClientRectTop = 25
          object tsPrivileges: TcxTabSheet
            Caption = 'Departments'
            ImageIndex = 0
            object pDepartments: TPanel
              Left = 0
              Top = 0
              Width = 405
              Height = 339
              Align = alClient
              BevelOuter = bvNone
              BorderWidth = 10
              ParentBackground = False
              TabOrder = 0
              object clbDepartments: TcxCheckListBox
                Left = 10
                Top = 10
                Width = 385
                Height = 319
                TabStop = False
                Align = alClient
                Items = <>
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
                TabOrder = 0
              end
            end
          end
          object tsAllowanceAvailability: TcxTabSheet
            Caption = 'Allowance Availability'
            ImageIndex = 1
            object pAllowances: TPanel
              Left = 0
              Top = 0
              Width = 405
              Height = 339
              Align = alClient
              BevelOuter = bvNone
              BorderWidth = 10
              ParentBackground = False
              TabOrder = 0
              object gAllowanceTypes: TcxGrid
                Left = 10
                Top = 10
                Width = 385
                Height = 215
                Align = alTop
                TabOrder = 0
                LookAndFeel.Kind = lfFlat
                LookAndFeel.NativeStyle = False
                LookAndFeel.SkinName = 'DevExpressStyle'
                object vAllowanceTypes: TcxGridDBTableView
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
                  OnCellDblClick = vListCellDblClick
                  OnFocusedRecordChanged = vListFocusedRecordChanged
                  DataController.DataSource = dmMaintenance.dscLocAllowanceType
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
                  object vAllowanceTypesallowancetype_code: TcxGridDBColumn
                    Caption = 'Allowance Type'
                    DataBinding.FieldName = 'allowancetype_code'
                    PropertiesClassName = 'TcxLookupComboBoxProperties'
                    Properties.KeyFieldNames = 'allowancetype_code'
                    Properties.ListColumns = <
                      item
                        FieldName = 'allowancetype_name'
                      end>
                    Properties.ListOptions.ShowHeader = False
                    Properties.ListSource = dmMaintenance.dscAllowanceTypes
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
                    Width = 200
                  end
                  object vAllowanceTypesallowance_amount: TcxGridDBColumn
                    Caption = 'Amount'
                    DataBinding.FieldName = 'allowance_amount'
                    PropertiesClassName = 'TcxCurrencyEditProperties'
                    Properties.DisplayFormat = ',0.00;-,0.00'
                    Properties.UseDisplayFormatWhenEditing = True
                    MinWidth = 70
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
                    Width = 70
                  end
                end
                object lvlAllowanceTypes: TcxGridLevel
                  GridView = vAllowanceTypes
                end
              end
              object bAddAllowanceType: TcxButton
                Left = 10
                Top = 231
                Width = 52
                Height = 21
                Caption = 'Add'
                TabOrder = 1
                OnClick = bAddAllowanceTypeClick
              end
              object bRemoveAllowanceType: TcxButton
                Left = 63
                Top = 231
                Width = 66
                Height = 21
                Caption = 'Remove'
                TabOrder = 2
                OnClick = bRemoveAllowanceTypeClick
              end
            end
          end
        end
        object dbluLocationType: TcxDBLookupComboBox
          Left = 104
          Top = 85
          DataBinding.DataField = 'locationtype_code'
          DataBinding.DataSource = dmMaintenance.dscLocation
          Properties.KeyFieldNames = 'locationtype_code'
          Properties.ListColumns = <
            item
              FieldName = 'locationtype_name'
            end>
          Properties.ListOptions.GridLines = glNone
          Properties.ListOptions.ShowHeader = False
          Properties.ListSource = dmMaintenance.dscLocationType
          Properties.OnEditValueChanged = dbluLocationTypePropertiesEditValueChanged
          TabOrder = 2
          Width = 169
        end
        object dbluArea: TcxDBLookupComboBox
          Left = 104
          Top = 111
          DataBinding.DataField = 'area_code'
          DataBinding.DataSource = dmMaintenance.dscLocation
          Properties.KeyFieldNames = 'area_code'
          Properties.ListColumns = <
            item
              FieldName = 'area_name'
            end>
          Properties.ListOptions.ColumnSorting = False
          Properties.ListOptions.GridLines = glNone
          Properties.ListOptions.ShowHeader = False
          Properties.ListSource = dmMaintenance.dscAreas
          TabOrder = 3
          Width = 169
        end
      end
    end
  end
  inherited ppList: TPopupMenu
    Left = 528
    Top = 448
    inherited miDelete: TMenuItem
      OnClick = nil
    end
  end
  inherited ilBaseTab: TcxImageList
    FormatVersion = 1
    DesignInfo = 29360712
  end
end
