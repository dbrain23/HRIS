inherited fSysRole: TfSysRole
  Caption = 'fSysRole'
  PixelsPerInch = 96
  TextHeight = 14
  inherited pcMaster: TJvPageControl
    ActivePage = tsDetail
    inherited tsMaster: TTabSheet
      Caption = 'System Roles'
      ExplicitLeft = 4
      ExplicitTop = 25
      ExplicitWidth = 860
      ExplicitHeight = 514
      inherited pDetails: TJvPanel
        inherited ghAction: TJvGroupHeader
          Left = 16
          ExplicitLeft = 16
        end
        object JvGroupHeader2: TJvGroupHeader [1]
          Left = 443
          Top = 17
          Width = 296
          Height = 21
          Caption = 'Privileges and Leves'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clHighlight
          Font.Height = -12
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        inherited gList: TcxGrid
          TabOrder = 4
          inherited vList: TcxGridDBTableView
            OnCellDblClick = vListCellDblClick
            OnFocusedRecordChanged = vListFocusedRecordChanged
            DataController.DataSource = dmSecurity.dscRoles
            object vListrole_code: TcxGridDBColumn
              Caption = 'Code'
              DataBinding.FieldName = 'role_code'
              MinWidth = 150
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
              Width = 150
            end
            object vListrole_name: TcxGridDBColumn
              Caption = 'Name'
              DataBinding.FieldName = 'role_name'
              MinWidth = 250
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
              Width = 250
            end
            object vListrole_description: TcxGridDBColumn
              Caption = 'Description'
              DataBinding.FieldName = 'role_description'
              MinWidth = 250
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
              Width = 250
            end
          end
        end
        inherited bSave: TcxButton
          Left = 43
          LookAndFeel.SkinName = ''
          TabOrder = 0
          ExplicitLeft = 43
        end
        inherited bCancel: TcxButton
          Left = 43
          TabOrder = 1
          ExplicitLeft = 43
        end
        inherited bDelete: TcxButton
          Left = 43
          TabOrder = 2
          Visible = False
          ExplicitLeft = 43
        end
        inherited bNew: TcxButton
          Left = 43
          TabOrder = 3
          ExplicitLeft = 43
        end
      end
    end
    object tsDetail: TTabSheet
      Caption = 'Role Details'
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
          Caption = 'Role Details'
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
          Width = 62
          Height = 14
          Caption = 'Description'
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
          TabOrder = 4
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
          TabOrder = 5
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
          TabOrder = 6
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
          TabOrder = 7
          Visible = False
          OnClick = miDeleteClick
        end
        object edRoleCode: TcxDBTextEdit
          Left = 104
          Top = 33
          DataBinding.DataField = 'role_code'
          DataBinding.DataSource = dmSecurity.dscRoles
          Properties.CharCase = ecUpperCase
          TabOrder = 0
          Width = 169
        end
        object mmDescription: TcxDBMemo
          Left = 43
          Top = 110
          DataBinding.DataField = 'role_description'
          DataBinding.DataSource = dmSecurity.dscRoles
          TabOrder = 2
          Height = 74
          Width = 230
        end
        object edRoleName: TcxDBTextEdit
          Left = 104
          Top = 59
          DataBinding.DataField = 'role_name'
          DataBinding.DataSource = dmSecurity.dscRoles
          TabOrder = 1
          Width = 169
        end
        object pcPrivLevel: TcxPageControl
          Left = 328
          Top = 22
          Width = 413
          Height = 368
          TabOrder = 3
          Properties.ActivePage = tsPrivileges
          Properties.CustomButtons.Buttons = <>
          ClientRectBottom = 364
          ClientRectLeft = 4
          ClientRectRight = 409
          ClientRectTop = 25
          object tsPrivileges: TcxTabSheet
            Caption = 'Privileges'
            ImageIndex = 0
            object pPrivileges: TPanel
              Left = 0
              Top = 0
              Width = 405
              Height = 339
              Align = alClient
              BevelOuter = bvNone
              BorderWidth = 10
              ParentBackground = False
              TabOrder = 0
              object clbPrivileges: TcxCheckListBox
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
                OnClickCheck = clbPrivilegesClickCheck
              end
            end
          end
          object tsLevels: TcxTabSheet
            Caption = 'Allowed Levels'
            ImageIndex = 1
            ExplicitLeft = 0
            ExplicitTop = 0
            ExplicitWidth = 0
            ExplicitHeight = 0
            object Panel1: TPanel
              Left = 0
              Top = 0
              Width = 405
              Height = 339
              Align = alClient
              BevelOuter = bvNone
              BorderWidth = 10
              ParentBackground = False
              TabOrder = 0
              object clbLevels: TcxCheckListBox
                Left = 10
                Top = 10
                Width = 385
                Height = 319
                TabStop = False
                Align = alClient
                Enabled = False
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
        end
      end
    end
  end
  inherited ppList: TPopupMenu
    Left = 832
    Top = 64
  end
  inherited ilBaseTab: TcxImageList
    FormatVersion = 1
    DesignInfo = 2097984
  end
end
