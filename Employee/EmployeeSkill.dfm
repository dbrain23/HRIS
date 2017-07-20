inherited fEmployeeSkills: TfEmployeeSkills
  Caption = 'fEmployeeSkills'
  ExplicitWidth = 1024
  ExplicitHeight = 691
  PixelsPerInch = 120
  TextHeight = 18
  inherited pcMaster: TJvPageControl
    inherited tsMaster: TTabSheet
      Caption = 'Skills'
      ExplicitLeft = 4
      ExplicitTop = 29
      ExplicitWidth = 996
      ExplicitHeight = 611
      inherited pDetails: TJvPanel
        Width = 996
        Height = 611
        Caption = 'Skills'
        ExplicitWidth = 996
        ExplicitHeight = 611
        inherited bSave: TcxButton
          LookAndFeel.SkinName = ''
        end
        inherited gList: TcxGrid
          inherited vList: TcxGridDBTableView
            DataController.DataSource = dmEmployee.dscEmpSkill
            object vListskill_code: TcxGridDBColumn
              DataBinding.FieldName = 'skill_code'
              PropertiesClassName = 'TcxLookupComboBoxProperties'
              Properties.KeyFieldNames = 'Code'
              Properties.ListColumns = <
                item
                  FieldName = 'Skill'
                end>
              Properties.ListSource = dmEmployee.dscSkill
              Width = 70
            end
            object vListempskill_id: TcxGridDBColumn
              DataBinding.FieldName = 'empskill_id'
            end
            object vListemployee_id: TcxGridDBColumn
              DataBinding.FieldName = 'employee_id'
            end
            object vListskill_code1: TcxGridDBColumn
              DataBinding.FieldName = 'skill_code'
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
