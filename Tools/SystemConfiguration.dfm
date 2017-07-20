inherited fSystemConfiguration: TfSystemConfiguration
  Caption = 'fSystemConfiguration'
  PixelsPerInch = 96
  TextHeight = 14
  inherited pcMaster: TJvPageControl
    inherited tsMaster: TTabSheet
      Caption = 'System Configuration'
      ExplicitLeft = 4
      ExplicitTop = 25
      ExplicitWidth = 860
      ExplicitHeight = 514
      inherited pDetails: TJvPanel
        inherited gList: TcxGrid
          inherited vList: TcxGridDBTableView
            OnFocusedRecordChanged = vListFocusedRecordChanged
            DataController.DataSource = dmTools.dscSysConfig
            object vListsysconfig_code: TcxGridDBColumn
              Caption = 'Code'
              DataBinding.FieldName = 'sysconfig_code'
              PropertiesClassName = 'TcxTextEditProperties'
              Properties.CharCase = ecUpperCase
              Properties.MaxLength = 30
              Options.Filtering = False
              Options.FilteringFilteredItemsList = False
              Options.FilteringMRUItemsList = False
              Options.FilteringPopup = False
              Options.FilteringPopupMultiSelect = False
              Options.IgnoreTimeForFiltering = False
              Options.IncSearch = False
              Options.Grouping = False
              Options.Moving = False
              Width = 300
            end
            object vListsysconfig_value: TcxGridDBColumn
              Caption = 'Value'
              DataBinding.FieldName = 'sysconfig_value'
              Options.Filtering = False
              Options.FilteringFilteredItemsList = False
              Options.FilteringMRUItemsList = False
              Options.FilteringPopup = False
              Options.FilteringPopupMultiSelect = False
              Options.IgnoreTimeForFiltering = False
              Options.IncSearch = False
              Options.Grouping = False
              Options.Moving = False
              Width = 300
            end
            object vListsysconfig_name: TcxGridDBColumn
              Caption = 'Name'
              DataBinding.FieldName = 'sysconfig_name'
              Options.Filtering = False
              Options.FilteringFilteredItemsList = False
              Options.FilteringMRUItemsList = False
              Options.FilteringPopup = False
              Options.FilteringPopupMultiSelect = False
              Options.IgnoreTimeForFiltering = False
              Options.IncSearch = False
              Options.Grouping = False
              Options.Moving = False
              Width = 300
            end
            object vListsysconfig_description: TcxGridDBColumn
              Caption = 'Description'
              DataBinding.FieldName = 'sysconfig_description'
              Options.Filtering = False
              Options.FilteringFilteredItemsList = False
              Options.FilteringMRUItemsList = False
              Options.FilteringPopup = False
              Options.FilteringPopupMultiSelect = False
              Options.IgnoreTimeForFiltering = False
              Options.IncSearch = False
              Options.Grouping = False
              Options.Moving = False
              Width = 230
            end
          end
        end
        inherited bSave: TcxButton
          LookAndFeel.SkinName = ''
        end
        inherited bDelete: TcxButton
          Visible = False
        end
      end
    end
  end
  inherited ilBaseTab: TcxImageList
    FormatVersion = 1
  end
end
