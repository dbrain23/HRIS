inherited fPayrollDependents: TfPayrollDependents
  BorderWidth = 0
  Caption = 'fPayrollDependents'
  ClientHeight = 503
  ClientWidth = 783
  PixelsPerInch = 96
  TextHeight = 14
  inherited pcMaster: TJvPageControl
    Width = 783
    Height = 503
    ExplicitWidth = 783
    ExplicitHeight = 503
    inherited tsMaster: TTabSheet
      Caption = 'Dependents Claim List'
      ExplicitLeft = 4
      ExplicitTop = 25
      ExplicitWidth = 775
      ExplicitHeight = 474
      inherited pDetails: TJvPanel
        Width = 775
        Height = 474
        ExplicitWidth = 775
        ExplicitHeight = 474
        inherited bNew: TcxButton [1]
        end
        inherited bDelete: TcxButton [2]
          Left = 126
          ExplicitLeft = 126
        end
        inherited bSave: TcxButton [3]
          Left = 43
          LookAndFeel.SkinName = ''
          ExplicitLeft = 43
        end
        inherited bCancel: TcxButton [4]
          Left = 125
          ExplicitLeft = 125
        end
        inherited gList: TcxGrid [5]
          inherited vList: TcxGridDBTableView
            OnEditing = vListEditing
            DataController.DataSource = dmPayroll.dscDependents
            object vListemployee_name: TcxGridDBColumn
              Caption = 'Employee'
              DataBinding.FieldName = 'employee_name'
              MinWidth = 250
              Options.Editing = False
              Options.Filtering = False
              Options.FilteringFilteredItemsList = False
              Options.FilteringMRUItemsList = False
              Options.FilteringPopup = False
              Options.FilteringPopupMultiSelect = False
              Options.Focusing = False
              Options.IgnoreTimeForFiltering = False
              Options.IncSearch = False
              Options.GroupFooters = False
              Options.Grouping = False
              Options.HorzSizing = False
              Options.Moving = False
              Width = 250
            end
            object vListdependents: TcxGridDBColumn
              Caption = 'Dependents'
              DataBinding.FieldName = 'dependents'
              MinWidth = 80
              Options.Editing = False
              Options.Filtering = False
              Options.FilteringFilteredItemsList = False
              Options.FilteringMRUItemsList = False
              Options.FilteringPopup = False
              Options.FilteringPopupMultiSelect = False
              Options.Focusing = False
              Options.IgnoreTimeForFiltering = False
              Options.IncSearch = False
              Options.GroupFooters = False
              Options.Grouping = False
              Options.HorzSizing = False
              Options.Moving = False
              Width = 80
            end
            object vListdeclare_dependents: TcxGridDBColumn
              Caption = 'Declare'
              DataBinding.FieldName = 'declare_dependents'
              PropertiesClassName = 'TcxCheckBoxProperties'
              Properties.DisplayChecked = '0'
              Properties.DisplayUnchecked = '1'
              Properties.DisplayGrayed = '0'
              Properties.NullStyle = nssUnchecked
              Properties.ValueChecked = '1'
              Properties.ValueGrayed = 0
              Properties.ValueUnchecked = '0'
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
          end
        end
      end
    end
  end
  inherited ilBaseTab: TcxImageList
    FormatVersion = 1
  end
end
