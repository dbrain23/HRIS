inherited fEmployeeFamily: TfEmployeeFamily
  Caption = 'fEmployeeFamily'
  PixelsPerInch = 96
  TextHeight = 14
  inherited pcMaster: TJvPageControl
    inherited tsMaster: TTabSheet
      Caption = 'Family and Relatives'
      ExplicitLeft = 4
      ExplicitTop = 25
      ExplicitWidth = 773
      ExplicitHeight = 472
      inherited pDetails: TJvPanel
        inherited bSave: TcxButton
          LookAndFeel.SkinName = ''
        end
        inherited gList: TcxGrid
          inherited vList: TcxGridDBTableView
            OnEditing = vListEditing
            DataController.DataSource = dmEmployee.dscEmpFamily
            object vListef_lastname: TcxGridDBColumn
              Caption = 'Lastname'
              DataBinding.FieldName = 'ef_lastname'
              MinWidth = 80
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
              Width = 80
            end
            object vListef_firstname: TcxGridDBColumn
              Caption = 'Firstname'
              DataBinding.FieldName = 'ef_firstname'
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
              Width = 90
            end
            object vListef_middlename: TcxGridDBColumn
              Caption = 'Middlename'
              DataBinding.FieldName = 'ef_middlename'
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
              Width = 90
            end
            object vListrelation_id: TcxGridDBColumn
              Caption = 'Relation'
              DataBinding.FieldName = 'relation_id'
              PropertiesClassName = 'TcxLookupComboBoxProperties'
              Properties.KeyFieldNames = 'relation_id'
              Properties.ListColumns = <
                item
                  FieldName = 'relation_name'
                end>
              Properties.ListOptions.GridLines = glNone
              Properties.ListOptions.ShowHeader = False
              Properties.ListSource = dmEmployee.dscRelations
              MinWidth = 65
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
              Width = 65
            end
            object vListef_birth_date: TcxGridDBColumn
              Caption = 'Birthdate'
              DataBinding.FieldName = 'ef_birth_date'
              PropertiesClassName = 'TcxDateEditProperties'
              Properties.DisplayFormat = 'mm/dd/yyyy'
              Properties.EditFormat = 'mm/dd/yyyy'
              MinWidth = 80
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
              Width = 80
            end
            object vListoccupation_id: TcxGridDBColumn
              Caption = 'Occupation'
              DataBinding.FieldName = 'occupation_id'
              PropertiesClassName = 'TcxLookupComboBoxProperties'
              Properties.KeyFieldNames = 'occupation_id'
              Properties.ListColumns = <
                item
                  FieldName = 'occupation_name'
                end>
              Properties.ListOptions.GridLines = glNone
              Properties.ListOptions.ShowHeader = False
              Properties.ListSource = dmEmployee.dscOccupations
              MinWidth = 120
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
            object vListis_dependent: TcxGridDBColumn
              Caption = 'Dependent'
              DataBinding.FieldName = 'is_dependent'
              PropertiesClassName = 'TcxCheckBoxProperties'
              Properties.NullStyle = nssUnchecked
              Properties.ValueChecked = '1'
              Properties.ValueGrayed = '0'
              Properties.ValueUnchecked = 0
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
            object vListis_deceased: TcxGridDBColumn
              Caption = 'Deceased'
              DataBinding.FieldName = 'is_deceased'
              PropertiesClassName = 'TcxCheckBoxProperties'
              Properties.NullStyle = nssUnchecked
              Properties.ValueChecked = '1'
              Properties.ValueGrayed = '0'
              Properties.ValueUnchecked = 0
              MinWidth = 60
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
              Width = 60
            end
          end
        end
      end
    end
  end
  inherited ilBaseTab: TcxImageList
    FormatVersion = 1
  end
end
