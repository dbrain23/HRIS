inherited fDtrOverrideReason: TfDtrOverrideReason
  Caption = 'fDtrOverrideReason'
  PixelsPerInch = 96
  TextHeight = 14
  inherited pcMaster: TJvPageControl
    inherited tsMaster: TTabSheet
      Caption = 'DTR Override Reason List'
      ExplicitLeft = 4
      ExplicitTop = 25
      ExplicitWidth = 860
      ExplicitHeight = 514
      inherited pDetails: TJvPanel
        inherited gList: TcxGrid
          inherited vList: TcxGridDBTableView
            DataController.DataSource = dmMaintenance.dscOverrideReason
            object vListoverride_reason_code: TcxGridDBColumn
              Caption = 'Code'
              DataBinding.FieldName = 'override_reason_code'
              PropertiesClassName = 'TcxTextEditProperties'
              Properties.CharCase = ecUpperCase
              Properties.MaxLength = 3
              MinWidth = 50
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
            object vListoverride_reason_name: TcxGridDBColumn
              Caption = 'Name'
              DataBinding.FieldName = 'override_reason_name'
              MinWidth = 150
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
              Width = 150
            end
            object vListoverride_reason_description: TcxGridDBColumn
              Caption = 'Description'
              DataBinding.FieldName = 'override_reason_description'
              MinWidth = 400
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
              Width = 400
            end
            object vListoverride_reason_is_active: TcxGridDBColumn
              Caption = 'Active'
              DataBinding.FieldName = 'is_active'
              PropertiesClassName = 'TcxCheckBoxProperties'
              Properties.DisplayChecked = '1'
              Properties.DisplayUnchecked = '0'
              Properties.DisplayGrayed = '0'
              Properties.ImmediatePost = True
              Properties.NullStyle = nssUnchecked
              Properties.ValueChecked = '1'
              Properties.ValueGrayed = '0'
              MinWidth = 40
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
              Width = 40
            end
          end
        end
        inherited bSave: TcxButton
          LookAndFeel.SkinName = ''
        end
      end
    end
  end
  inherited ilBaseTab: TcxImageList
    FormatVersion = 1
  end
end
