inherited fPositionStatus: TfPositionStatus
  Caption = 'fPositionStatus'
  PixelsPerInch = 96
  TextHeight = 14
  inherited pcMaster: TJvPageControl
    inherited tsMaster: TTabSheet
      Caption = 'Position Status List'
      ExplicitLeft = 4
      ExplicitTop = 25
      ExplicitWidth = 860
      ExplicitHeight = 514
      inherited pDetails: TJvPanel
        inherited gList: TcxGrid
          inherited vList: TcxGridDBTableView
            DataController.DataSource = dmMaintenance.dscPositionStatus
            object vListposstatus_code: TcxGridDBColumn
              Caption = 'Code'
              DataBinding.FieldName = 'posstatus_code'
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
            object vListposstatus_name: TcxGridDBColumn
              Caption = 'Name'
              DataBinding.FieldName = 'posstatus_name'
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
            object vListposstatus_description: TcxGridDBColumn
              Caption = 'Description'
              DataBinding.FieldName = 'posstatus_description'
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
