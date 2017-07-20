inherited fPafList: TfPafList
  BorderWidth = 1
  Caption = 'fPafList'
  ClientHeight = 540
  ClientWidth = 899
  OnCreate = FormCreate
  ExplicitWidth = 917
  ExplicitHeight = 581
  PixelsPerInch = 96
  TextHeight = 14
  object pcMaster: TJvPageControl
    Left = 0
    Top = 0
    Width = 899
    Height = 540
    ActivePage = tsPafList
    Align = alClient
    TabOrder = 0
    object tsPafList: TTabSheet
      Caption = 'PAF List'
      DoubleBuffered = False
      ParentDoubleBuffered = False
      object pParams: TJvPanel
        Left = 0
        Top = 0
        Width = 303
        Height = 511
        HotTrackFont.Charset = DEFAULT_CHARSET
        HotTrackFont.Color = clWindowText
        HotTrackFont.Height = -11
        HotTrackFont.Name = 'Tahoma'
        HotTrackFont.Style = []
        Align = alLeft
        BevelEdges = [beTop]
        BevelOuter = bvNone
        BorderWidth = 2
        TabOrder = 0
        object gbParams: TJvGroupBox
          Left = 2
          Top = 2
          Width = 299
          Height = 507
          Align = alClient
          Caption = ''
          ParentBackground = False
          TabOrder = 0
          PropagateEnable = True
          object JvLabel1: TJvLabel
            Left = 30
            Top = 37
            Width = 54
            Height = 14
            Caption = 'Lastname'
            Transparent = True
            HotTrackFont.Charset = DEFAULT_CHARSET
            HotTrackFont.Color = clWindowText
            HotTrackFont.Height = -11
            HotTrackFont.Name = 'Tahoma'
            HotTrackFont.Style = []
          end
          object JvLabel2: TJvLabel
            Left = 30
            Top = 62
            Width = 54
            Height = 14
            Caption = 'Firstname'
            Transparent = True
            HotTrackFont.Charset = DEFAULT_CHARSET
            HotTrackFont.Color = clWindowText
            HotTrackFont.Height = -11
            HotTrackFont.Name = 'Tahoma'
            HotTrackFont.Style = []
          end
          object JvGroupHeader3: TJvGroupHeader
            Left = 17
            Top = 14
            Width = 260
            Height = 18
            Caption = 'Name Search'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clHighlight
            Font.Height = -12
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
          end
          object bClientSearch: TJvSpeedButton
            Left = 252
            Top = 26
            Width = 27
            Height = 27
            Glyph.Data = {
              36030000424D3603000000000000360000002800000010000000100000000100
              18000000000000030000120B0000120B00000000000000000000FF00FF4A667C
              BE9596FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
              FFFF00FFFF00FFFF00FF6B9CC31E89E84B7AA3C89693FF00FFFF00FFFF00FFFF
              00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF4BB4FE51B5FF
              2089E94B7AA2C69592FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
              FFFF00FFFF00FFFF00FFFF00FF51B7FE51B3FF1D87E64E7AA0CA9792FF00FFFF
              00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
              51B7FE4EB2FF1F89E64E7BA2B99497FF00FFFF00FFFF00FFFF00FFFF00FFFF00
              FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF52B8FE4BB1FF2787D95F6A76FF
              00FFB0857FC09F94C09F96BC988EFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
              FF00FFFF00FF55BDFFB5D6EDBF9D92BB9B8CE7DAC2FFFFE3FFFFE5FDFADAD8C3
              B3B58D85FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFCEA795FD
              EEBEFFFFD8FFFFDAFFFFDBFFFFE6FFFFFBEADDDCAE837FFF00FFFF00FFFF00FF
              FF00FFFF00FFFF00FFFF00FFC1A091FBDCA8FEF7D0FFFFDBFFFFE3FFFFF8FFFF
              FDFFFFFDC6A99CFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFC1A091FEE3ACF1
              C491FCF2CAFFFFDDFFFFE4FFFFF7FFFFF7FFFFE9EEE5CBB9948CFF00FFFF00FF
              FF00FFFF00FFFF00FFC2A191FFE6AEEEB581F7DCAEFEFDD8FFFFDFFFFFE3FFFF
              E4FFFFE0F3ECD2BB968EFF00FFFF00FFFF00FFFF00FFFF00FFBC978CFBE7B7F4
              C791F2C994F8E5B9FEFCD8FFFFDDFFFFDCFFFFE0E2D2BAB68E86FF00FFFF00FF
              FF00FFFF00FFFF00FFFF00FFD9C3A9FFFEE5F7DCB8F2C994F5D4A5FAE8BDFDF4
              C9FDFBD6B69089FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFB58D85E8
              DEDDFFFEF2F9D8A3F4C48CF9D49FFDEAB8D0B49FB89086FF00FFFF00FFFF00FF
              FF00FFFF00FFFF00FFFF00FFFF00FFAD827FC9AA9EEFE0B7EFDFB2E7CEACB890
              86B89086FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
              00FFFF00FFBA968ABB988CB79188FF00FFFF00FFFF00FFFF00FF}
            GrayedInactive = False
            HotTrackFont.Charset = DEFAULT_CHARSET
            HotTrackFont.Color = clWindowText
            HotTrackFont.Height = -11
            HotTrackFont.Name = 'Tahoma'
            HotTrackFont.Style = []
            OnClick = bClientSearchClick
          end
          object JvLabel3: TJvLabel
            Left = 30
            Top = 88
            Width = 36
            Height = 14
            Caption = 'Middle'
            Transparent = True
            HotTrackFont.Charset = DEFAULT_CHARSET
            HotTrackFont.Color = clWindowText
            HotTrackFont.Height = -11
            HotTrackFont.Name = 'Tahoma'
            HotTrackFont.Style = []
          end
          object JvGroupHeader1: TJvGroupHeader
            Left = 17
            Top = 119
            Width = 260
            Height = 18
            Caption = 'Display Options'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clHighlight
            Font.Height = -12
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
          end
          object edLastname: TcxTextEdit
            Left = 102
            Top = 30
            Enabled = False
            TabOrder = 0
            Width = 148
          end
          object edFirstname: TcxTextEdit
            Left = 102
            Top = 56
            Enabled = False
            TabOrder = 1
            Width = 148
          end
          object bSelect: TcxButton
            Left = 144
            Top = 429
            Width = 133
            Height = 27
            Caption = 'Select'
            LookAndFeel.SkinName = ''
            OptionsImage.ImageIndex = 2
            OptionsImage.Images = ilBaseMain
            TabOrder = 2
            OnClick = vListDblClick
          end
          object bClear: TcxButton
            Left = 30
            Top = 429
            Width = 113
            Height = 27
            Caption = 'Clear'
            LookAndFeel.SkinName = ''
            OptionsImage.ImageIndex = 0
            OptionsImage.Images = ilBaseMain
            TabOrder = 3
            OnClick = bClearClick
          end
          object rbPending: TcxRadioButton
            Left = 30
            Top = 138
            Width = 247
            Height = 17
            Action = acFilterList
            Caption = 'Pending PAF'
            Checked = True
            TabOrder = 4
            TabStop = True
          end
          object rbApproved: TcxRadioButton
            Left = 30
            Top = 156
            Width = 247
            Height = 17
            Action = acFilterList
            Caption = 'Approved PAF'
            TabOrder = 5
          end
          object cbxCancelled: TcxCheckBox
            Left = 30
            Top = 192
            Action = acFilterList
            Caption = 'Include cancelled PAF'
            TabOrder = 6
            Width = 247
          end
        end
      end
      object pResult: TJvPanel
        Left = 303
        Top = 0
        Width = 588
        Height = 511
        HotTrackFont.Charset = DEFAULT_CHARSET
        HotTrackFont.Color = clWindowText
        HotTrackFont.Height = -11
        HotTrackFont.Name = 'Tahoma'
        HotTrackFont.Style = []
        Transparent = True
        Align = alClient
        BevelEdges = [beTop]
        BevelOuter = bvNone
        BorderWidth = 2
        ParentBackground = False
        TabOrder = 1
        object gList: TcxGrid
          Left = 2
          Top = 2
          Width = 584
          Height = 507
          Align = alClient
          TabOrder = 0
          LookAndFeel.Kind = lfFlat
          LookAndFeel.NativeStyle = False
          LookAndFeel.SkinName = 'DevExpressStyle'
          object vList: TcxGridDBTableView
            OnDblClick = vListDblClick
            Navigator.Buttons.CustomButtons = <>
            DataController.DataSource = dmPaf.dscPafList
            DataController.DetailKeyFieldNames = 'paf_id'
            DataController.KeyFieldNames = 'paf_id'
            DataController.Summary.DefaultGroupSummaryItems = <>
            DataController.Summary.FooterSummaryItems = <>
            DataController.Summary.SummaryGroups = <>
            OptionsCustomize.ColumnFiltering = False
            OptionsCustomize.ColumnGrouping = False
            OptionsCustomize.ColumnHidingOnGrouping = False
            OptionsCustomize.ColumnHorzSizing = False
            OptionsCustomize.ColumnMoving = False
            OptionsData.CancelOnExit = False
            OptionsData.Deleting = False
            OptionsData.DeletingConfirmation = False
            OptionsData.Editing = False
            OptionsData.Inserting = False
            OptionsSelection.CellSelect = False
            OptionsSelection.HideFocusRectOnExit = False
            OptionsSelection.InvertSelect = False
            OptionsSelection.UnselectFocusedRecordOnExit = False
            OptionsView.FocusRect = False
            OptionsView.ScrollBars = ssVertical
            OptionsView.GroupByBox = False
            OptionsView.Indicator = True
            object vListrank_movement: TcxGridDBColumn
              DataBinding.FieldName = 'rank_movement'
              PropertiesClassName = 'TcxImageComboBoxProperties'
              Properties.Images = ilList
              Properties.Items = <
                item
                  Description = 'Demotion'
                  ImageIndex = 0
                  Value = -1
                end
                item
                  Description = 'No change'
                  ImageIndex = 1
                  Value = 0
                end
                item
                  Description = 'Promotion'
                  ImageIndex = 2
                  Value = 1
                end
                item
                  Description = 'Cancelled'
                  ImageIndex = 3
                  Value = -2
                end>
              MinWidth = 23
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
              Options.ShowCaption = False
              Width = 23
              IsCaptionAssigned = True
            end
            object vListemployee_name: TcxGridDBColumn
              Caption = 'Employee'
              DataBinding.FieldName = 'employee_name'
              MinWidth = 165
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
              Width = 165
            end
            object vListposition_name: TcxGridDBColumn
              Caption = 'Position'
              DataBinding.FieldName = 'position_name'
              MinWidth = 200
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
              Width = 200
            end
            object vListposstatus_name: TcxGridDBColumn
              Caption = 'Position status'
              DataBinding.FieldName = 'posstatus_name'
              MinWidth = 100
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
              Width = 100
            end
            object vListeffective_date: TcxGridDBColumn
              Caption = 'Effective date'
              DataBinding.FieldName = 'effective_date'
              PropertiesClassName = 'TcxDateEditProperties'
              Properties.DisplayFormat = 'mm/dd/yyyy'
              MinWidth = 90
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
              Width = 90
            end
            object vListsalary: TcxGridDBColumn
              Caption = 'Salary'
              DataBinding.FieldName = 'salary'
              PropertiesClassName = 'TcxCurrencyEditProperties'
              Properties.DisplayFormat = ',0.00;-,0.00'
              MinWidth = 70
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
              Width = 70
            end
          end
          object vListDetail: TcxGridDBCardView
            Navigator.Buttons.CustomButtons = <>
            DataController.DataSource = dmPaf.dscPaf
            DataController.DetailKeyFieldNames = 'paf_id'
            DataController.KeyFieldNames = 'paf_id'
            DataController.Summary.DefaultGroupSummaryItems = <>
            DataController.Summary.FooterSummaryItems = <>
            DataController.Summary.SummaryGroups = <>
            OptionsView.CardIndent = 7
            object vListDetailpaf_id: TcxGridDBCardViewRow
              DataBinding.FieldName = 'paf_id'
              Position.BeginsLayer = True
            end
            object vListDetailemployee_name: TcxGridDBCardViewRow
              DataBinding.FieldName = 'employee_name'
              Position.BeginsLayer = True
            end
            object vListDetailposition_name: TcxGridDBCardViewRow
              DataBinding.FieldName = 'position_name'
              Position.BeginsLayer = True
            end
            object vListDetailposstatus_name: TcxGridDBCardViewRow
              DataBinding.FieldName = 'posstatus_name'
              Position.BeginsLayer = True
            end
            object vListDetailempstatus_name: TcxGridDBCardViewRow
              DataBinding.FieldName = 'empstatus_name'
              Position.BeginsLayer = True
            end
            object vListDetailbranch_name: TcxGridDBCardViewRow
              DataBinding.FieldName = 'branch_name'
              Position.BeginsLayer = True
            end
            object vListDetailsalary: TcxGridDBCardViewRow
              DataBinding.FieldName = 'salary'
              Position.BeginsLayer = True
            end
            object vListDetaileffective_date: TcxGridDBCardViewRow
              DataBinding.FieldName = 'effective_date'
              Position.BeginsLayer = True
            end
          end
          object gListCardView1: TcxGridCardView
            Navigator.Buttons.CustomButtons = <>
            DataController.Summary.DefaultGroupSummaryItems = <>
            DataController.Summary.FooterSummaryItems = <>
            DataController.Summary.SummaryGroups = <>
            OptionsView.CardIndent = 7
          end
          object gListDBTableView1: TcxGridDBTableView
            Navigator.Buttons.CustomButtons = <>
            DataController.DataSource = dmPaf.dscPafAllowances
            DataController.DetailKeyFieldNames = 'paf_id'
            DataController.KeyFieldNames = 'pafallowance_id'
            DataController.Summary.DefaultGroupSummaryItems = <>
            DataController.Summary.FooterSummaryItems = <>
            DataController.Summary.SummaryGroups = <>
            object gListDBTableView1pafallowance_id: TcxGridDBColumn
              DataBinding.FieldName = 'pafallowance_id'
            end
            object gListDBTableView1paf_id: TcxGridDBColumn
              DataBinding.FieldName = 'paf_id'
            end
            object gListDBTableView1allowance_amount: TcxGridDBColumn
              DataBinding.FieldName = 'allowance_amount'
            end
            object gListDBTableView1allowancetype_code: TcxGridDBColumn
              DataBinding.FieldName = 'allowancetype_code'
            end
          end
          object gListTableView1: TcxGridTableView
            Navigator.Buttons.CustomButtons = <>
            DataController.Summary.DefaultGroupSummaryItems = <>
            DataController.Summary.FooterSummaryItems = <>
            DataController.Summary.SummaryGroups = <>
          end
          object gListDBBandedTableView1: TcxGridDBBandedTableView
            Navigator.Buttons.CustomButtons = <>
            DataController.DataSource = dmPaf.dscPafAllowances
            DataController.DetailKeyFieldNames = 'paf_id'
            DataController.KeyFieldNames = 'pafallowance_id'
            DataController.MasterKeyFieldNames = 'paf_id'
            DataController.Summary.DefaultGroupSummaryItems = <>
            DataController.Summary.FooterSummaryItems = <>
            DataController.Summary.SummaryGroups = <>
            Bands = <
              item
              end>
          end
          object gListDBCardView1: TcxGridDBCardView
            Navigator.Buttons.CustomButtons = <>
            DataController.DataSource = dmPaf.dscPaf
            DataController.DetailKeyFieldNames = 'paf_id'
            DataController.KeyFieldNames = 'paf_id'
            DataController.MasterKeyFieldNames = 'paf_id'
            DataController.Summary.DefaultGroupSummaryItems = <>
            DataController.Summary.FooterSummaryItems = <>
            DataController.Summary.SummaryGroups = <>
            OptionsView.CardIndent = 7
            object gListDBCardView1paf_id: TcxGridDBCardViewRow
              DataBinding.FieldName = 'paf_id'
              Position.BeginsLayer = True
            end
            object gListDBCardView1effective_date: TcxGridDBCardViewRow
              DataBinding.FieldName = 'effective_date'
              Position.BeginsLayer = True
            end
            object gListDBCardView1effective_until: TcxGridDBCardViewRow
              DataBinding.FieldName = 'effective_until'
              Position.BeginsLayer = True
            end
            object gListDBCardView1employee_id: TcxGridDBCardViewRow
              DataBinding.FieldName = 'employee_id'
              Position.BeginsLayer = True
            end
            object gListDBCardView1salary: TcxGridDBCardViewRow
              DataBinding.FieldName = 'salary'
              Position.BeginsLayer = True
            end
            object gListDBCardView1position_code: TcxGridDBCardViewRow
              DataBinding.FieldName = 'position_code'
              Position.BeginsLayer = True
            end
            object gListDBCardView1empstatus_code: TcxGridDBCardViewRow
              DataBinding.FieldName = 'empstatus_code'
              Position.BeginsLayer = True
            end
            object gListDBCardView1posstatus_code: TcxGridDBCardViewRow
              DataBinding.FieldName = 'posstatus_code'
              Position.BeginsLayer = True
            end
            object gListDBCardView1branch_code: TcxGridDBCardViewRow
              DataBinding.FieldName = 'branch_code'
              Position.BeginsLayer = True
            end
            object gListDBCardView1paf_remarks: TcxGridDBCardViewRow
              DataBinding.FieldName = 'paf_remarks'
              Position.BeginsLayer = True
            end
            object gListDBCardView1rank_movement: TcxGridDBCardViewRow
              DataBinding.FieldName = 'rank_movement'
              Position.BeginsLayer = True
            end
          end
          object lvlList: TcxGridLevel
            GridView = vList
          end
        end
      end
    end
  end
  object edMiddlename: TcxTextEdit
    Left = 109
    Top = 110
    Enabled = False
    TabOrder = 1
    Width = 147
  end
  object ilBaseMain: TImageList
    Left = 328
    Top = 118
    Bitmap = {
      494C010103000800400110001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000001000000001002000000000000010
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000A23F080000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000004A667C00BE9596000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000004490600055B0900066C0C00066C0C00055E0A00044C06000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000A13E0800B04D0600A13E0800000000000000000000000000000000000000
      0000000000000000000000000000000000006B9CC3001E89E8004B7AA300C896
      9300000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000560
      0900056009000891130009B0180009B31A0009B3190009B11900079614000568
      0C0005680C000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000A13E
      0800BD580400BF5B0300A13E0800000000000000000000000000000000000000
      0000000000000000000000000000000000004BB4FE0051B5FF002089E9004B7A
      A200C69592000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000A6A15000A7F
      15000BB61C0009B91A0008B4180007B2160009B3190009B4190009B81A0009B9
      1A0007831000044D060000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000A13D0800B34F
      0500C8640100A13E0800A13E0800000000000000000000000000000000000000
      0000000000000000000000000000000000000000000051B7FE0051B3FF001D87
      E6004E7AA000CA97920000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000B6A15000F85220016BD
      340011B727000BB21C0007B1160008B1170009B2190009B2190009B2190009B4
      190009BA1A000784100006670C00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000A13D0800AE4C0900C965
      0200A4410800A13E080000000000A13E0800A13E0800A03D0800A03D0800A03D
      0800A03D0800A03D0800A13E0800A13E0800000000000000000051B7FE004EB2
      FF001F89E6004E7BA200B9949700000000000000000000000000000000000000
      000000000000000000000000000000000000000000000B6A150020BE49001BBD
      400014B730000AB21F0028BC3600DFF5E100EEFAEF0063CE6D0009B2190009B2
      190009B3190009BA1A0006670C00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000A4420900D97E1C00AA48
      0900A13E080000000000A13E0800B04D0600C6610200C6600200C5600200C560
      0300C45F0300C45F0300C5600300A03E080000000000000000000000000052B8
      FE004BB1FF002787D9005F6A760000000000B0857F00C09F9400C09F9600BC98
      8E0000000000000000000000000000000000087210001B9A3A002AC65B001DBB
      45000EB425000BB31B0011B421009ADFA000FFFFFF00F7FDF8005ACB650009B2
      190009B2190009B81A0008941300045D09000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000A03C0600CE762600C96F1F00A03C
      0700000000000000000000000000A13E0800A13E0800A13E0800A13E0800AD4B
      0600CC680000C9640200D06B0000A03D08000000000000000000000000000000
      000055BDFF00B5D6ED00BF9D9200BB9B8C00E7DAC200FFFFE300FFFFE500FDFA
      DA00D8C3B300B58D85000000000000000000087210002AB65B002CC5650022BD
      4D000FB422000AB21A000CB31C000AB219008DDB9500FDFEFD00F6FCF70058CB
      630009B2190009B51A0008AB1700045D09000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000009F3B0600ED9D4000A13E08000000
      00000000000000000000000000000000000000000000000000009F3C0800BD59
      0400C6620200AA460600D06B0000A03D08000000000000000000000000000000
      00000000000000000000CEA79500FDEEBE00FFFFD800FFFFDA00FFFFDB00FFFF
      E600FFFFFB00EADDDC00AE837F00000000000F821C0037C26C0033C76C00CDF1
      DA00C9EFD300C7EED000C8EFD200C5EED000C7EECF00F8FDF900FFFFFF00F2FB
      F3006FD2790008B4190009B3190005650B000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000009E3A0500FFBF55009D3905000000
      00000000000000000000000000000000000000000000A03D0800B24E0500CD69
      0000A23F0900A13E0800D06B0000A03D08000000000000000000000000000000
      00000000000000000000C1A09100FBDCA800FEF7D000FFFFDB00FFFFE300FFFF
      F800FFFFFD00FFFFFD00C6A99C0000000000138D230058CC830042C97700FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FDFEFD00FFFFFF00FFFF
      FF00BCEAC1000AB41A0009B31900066D0D000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000009E3B0500FAAE4B00B15114009F3C
      060000000000000000000000000000000000A03D0800BC570300CE690000A946
      0700A03D0800A13E0800D16C0000A03D08000000000000000000000000000000
      000000000000C1A09100FEE3AC00F1C49100FCF2CA00FFFFDD00FFFFE400FFFF
      F700FFFFF700FFFFE900EEE5CB00B9948C000F911D006FD293005FD38D006DD4
      950072D6990071D6980072D6990064D28C0092DFA800FBFEFB00FFFFFF00ACE5
      B8002EBF4C0011B82B0008B1190005610A000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000009F3C0600D27C2D00E6953C009D39
      0500A13E0800000000009F3C0600A3410900CC6D1300CB680600A6420700A13E
      080000000000A13E0800D16C0000A03D08000000000000000000000000000000
      000000000000C2A19100FFE6AE00EEB58100F7DCAE00FEFDD800FFFFDF00FFFF
      E300FFFFE400FFFFE000F3ECD200BB968E000F911D0067CC83009BE5BA0038C6
      700030C3690038C56F0038C56F0070D69700E8F8EE00FFFFFF009FE2B10020BD
      48001AB93E0010BA290008A3170005610A000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000A5430A00EE9E4100E795
      3C00B85A1800B95A1900C56A2100ED9A3700CA6E1B00A4410900A13E08000000
      000000000000A13E0800D16C0000A03D08000000000000000000000000000000
      000000000000BC978C00FBE7B700F4C79100F2C99400F8E5B900FEFCD800FFFF
      DD00FFFFDC00FFFFE000E2D2BA00B68E86000000000025AE3900BCEDD20082DB
      A40028C063002FC2670053CD8200F7FDF900FFFFFF009CE2B20022BC4B001DBA
      410018B7360014C030000A851700000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000A03D07009F3B0600BF63
      1E00E08E3800EE9E4100DA853200B1521300A03C0700A13E0800000000000000
      000000000000A13E0800C9640100A13E08000000000000000000000000000000
      00000000000000000000D9C3A900FFFEE500F7DCB800F2C99400F5D4A500FAE8
      BD00FDF4C900FDFBD600B6908900000000000000000025AE390071D28C00D2F4
      E10080DAA30036C46D0039C56F00BCECCE00ABE6C2002DC2630024BE560023BC
      4D001FC1460016AE34000A851700000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000A03C
      06009F3C06009F3B06009F3C0600A03D07000000000000000000000000000000
      00000000000000000000A13E0800000000000000000000000000000000000000
      00000000000000000000B58D8500E8DEDD00FFFEF200F9D8A300F4C48C00F9D4
      9F00FDEAB800D0B49F00B890860000000000000000000000000025AE390084D8
      9F00DBF7EA00AFE8C6006BD4930052CC810044C9780049CA7B0048CB780039CB
      6A0021B649000F7C1F0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000AD827F00C9AA9E00EFE0B700EFDFB200E7CE
      AC00B8908600B8908600000000000000000000000000000000000000000025AE
      390025AE3900ADE8C500CCF2DE00BAEDD100A6E7C20091E2B30064D492002FB1
      57002FB157000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000BA968A00BB988C00B791
      8800000000000000000000000000000000000000000000000000000000000000
      00000000000032B74E0025AE390025AE390025AE390025AE390024A342000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000100000000100010000000000800000000000000000000000
      000000000000000000000000FFFFFF00FBFF9FFFF81F0000F1FF0FFFE0070000
      E1FF07FFC0030000C1FF83FF800100008200C1FF800100008400E10F00000000
      0E00F003000000001FC0FC01000000001F80FC01000000000F00F80000000000
      0408F800000000008018F800800100008038FC0180010000E0FDFC01C0030000
      FFFFFE03E0070000FFFFFF8FF81F000000000000000000000000000000000000
      000000000000}
  end
  object ilList: TImageList
    Left = 328
    Top = 74
    Bitmap = {
      494C010104000800C40010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000002000000001002000000000000020
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000EAECFD00808CE7003D54DD001C35D6001B34D2003B4DD4008188DA00EBEB
      FA00000000000000000000000000000000000000000000000000000000000000
      0000F8EEE800D09B7B00B3622E00A7470A00A5450A00AE5C2E00CA957C00F7ED
      E900000000000000000000000000000000000000000000000000000000000000
      0000EBF6EB0083C18300379A3700188E1D00198A1B003A953A0088BC8800EFF7
      EF000000000000000000000000000000000000000000000000009B7C6B009D7E
      6D009C7E6D00C4B2A700424BC2000716BE000711B700070EB100070EAC000707
      A30007079F0007089E004444B60000000000000000000000000000000000AEBA
      FF002950F3003464FD003060FE002757FB00204DF4001D43E700183CE1001B34
      D300AFB2F000000000000000000000000000000000000000000000000000EAC7
      AC00B3570F00B6580000B85C0000B6580000B2530000AD4D0000A7450000A344
      1000E5C0AE00000000000000000000000000000000000000000000000000AEE2
      AE00179E1D001CB03A0020B8440018B23A0012A92F0013A028000C921B001987
      1A00B7DDB70000000000000000000000000000000000000000009B7766000000
      0000FAF4E900FDFAF5003047DC00001DE8004266F100274BEC00000ED4002A4B
      E200617BEC000002B60007079F00000000000000000000000000ADBBFF003161
      FE004273FF003C6CFF002E62FF0075A1FF0084B0FF00245BFF002752F7001A3C
      DF001331DC00AFB2F00000000000000000000000000000000000EDCBAE00B85B
      0300C1690000C1660000C0650000BD630000BC600000B95C0000B2540000AA49
      0000A03C0300E5C0B00000000000000000000000000000000000ACE5AC0015AB
      25002EC85D002AC4540022C2460068DD7A0072E78A0022C4460018AB3200119B
      23000B840F00B7DDB70000000000000000000000000000000000A27F6F000000
      0000DDC2B500EFE2DC00334FE5003156F200F4EFDE00EBECEB003A5EF300F8FC
      FC0000000000627EEF0007079F000000000000000000E9EDFF003A64FF004C7A
      FF004674FF00386AFF006B96FF00000000000000000088B3FF00265BFF002A5A
      FE001A3CDF001B33D400EAEBFA000000000000000000FAF2EB00C06B1800C870
      0100C66F0000C66D0000C46B0000C3690000C0660000BD630000BB5E0000B557
      0000A9480000A5471200F8EFEC000000000000000000E7F7E80024B22D0035CF
      6A0030C961002EC7610018C13E00000000000000000021CB490021BB46001CB4
      3B00129B250017891900EEF6EE00000000000000000000000000A38070000000
      0000DBC3BB00EEE3DE003F5CEC001A49F800E7E5E100F1F0EA00FFFDF300FFFF
      FE00000000003B5AE9000707A50000000000000000007D96FE006993FE004F7E
      FF004176FF006790FF00000000000000000000000000000000008BB7FF00275C
      FF002652F6001A3CE0008087DD000000000000000000DBAD8100CD7F1A00CC75
      0000CC750000CC760000CA730000C8700000C56C0000C2680000BE630000BB5F
      0000B1540000A6460000CF9E840000000000000000007CCC810048D0740035D1
      6D0037D06B0037D06D0017C23E00F3FBF100000000001ECA460026BF4E0022BE
      480019AB34000D941C0087BE8700000000000000000000000000A98778000000
      0000DBC7C200EEE4E2004D6BEF00003FFF002952F300F7F5EB00F4F4F4000000
      00004064F500000DD300070FAD000000000000000000567CFF0076A0FF00477D
      FF006489FF000000000000000000000000000000000000000000000000008BB8
      FF00275EFF001E41E3003A4DD7000000000000000000CC863A00D9912500D27C
      0000D27D0000D27C0000D07A0000CD770000CA730000C76E0000C3690000BE63
      0000BA5E0000AC4C0000B3643800000000000000000043BF57005EE1910027CB
      530022C64B0034D3680019C64000F5FBF300000000001BC7440025C355001FC2
      48001DBD4300129E290039983A00000000000000000000000000AB897A000000
      0000DBC7C300EEE4E2005779F2001149EE00D4D4DF00F2F0EA00FFFCF300FFFF
      FD00FBFEFF001D43EB00070FB30000000000000000004F7AFF0073A0FF006A8C
      FF000000000000000000638EFF00000000000000000081AAFF00000000000000
      000090BBFF00234EF0001935D5000000000000000000CB7D2000DF992C00D883
      0000D9830000D8840000D6820000D37F0000CF790000CB740000C66E0000C268
      0000BE620000B3540000AA4E1300000000000000000037C252004CD06C006FC4
      6A00C5E9C40058C65E0000B51B00F3FCF400000000000CC2340055DA6F00B9F3
      C40097F3AB001DB33A00168C1900000000000000000000000000AF8E7F000000
      0000DCC5C000EEE3E1005E83F6004662D300F8F2DE00E8E6E600395EF200FDFB
      F700000000006181FC000711BD0000000000000000005782FF0076A1FF00849A
      FF00B6C4FF00668BFF002666FF0000000000000000002667FF008BAFFF00ECF3
      FF00DFEFFF003164F7001B36D8000000000000000000CE822100E6A53E00DF86
      0000E0880000DF870000DC850000D8840000D3800000CF790000CA720000C56C
      0000BF660000B7590000AE53140000000000000000003BC55B0074EA9E0013A8
      1B0000000000000000004DC75A00E5F7E800F6FDF6003CCA4F00000000000000
      000060DC75001DB43F0016901900000000000000000000000000AF8F80000000
      0000FEFEFE00000000007192FA000F70FF004F69D4001F4FEA00003EFF001F4B
      F9005373F8000019E6000719C30000000000000000006A90FF00B1D5FF006EAB
      FF0069A4FF007BB5FF003D7AFF000000000000000000356FFF004A7CFF00396D
      FF003569FF00325FF9003E55E0000000000000000000D5903A00EFB55800E78D
      0100E98C0000E68B0000E2890000DF860000D8840000D27E0000CD760000C76F
      0000C3690000B95D0000BC6F3A0000000000000000004FCC6C0096F7BA0044E8
      7A000CA71500FFFCFE0000000000FDFEFC00FDFEFE00000000000000000042CB
      56001FC34C0024B8480039A13900000000000000000000000000AF8F80000000
      0000DFCECC00ECE1DF006683F3006A8FFA00577DF7004E73F600486AF1003A5B
      EF00314EE9002C46DE005463DB0000000000000000008FA9FF00B1D7FF009ACC
      FF0086C1FF0089C2FF003D7CFF000000000000000000326DFF005989FF004B7A
      FF004473FF003864F8008392ED000000000000000000E3B88500EAA54200F2A7
      3200EF8F0000EE8F0000E98C0000E28A0000DB860000D5810000CF790000C973
      0000C56B0000B75B0000D7A88700000000000000000087DB9D0084EEA60079F7
      A5004CF083000EA91600FBFBF90000000000000000000000000032C1420028CA
      5A002DC860001EAF3D0086C78600000000000000000000000000B19080000000
      000000000000000000000000000000000000FFFEFD00FEFDFC00FEFCFA00FCFA
      F700F8F4F000D0C1B900000000000000000000000000EEF2FF0073A1FF00C7EA
      FF0099D2FF008ECCFF003E7DFF000000000000000000316AFF005C8DFF004E7D
      FF004B7AFF002E55F600EDEFFF000000000000000000FCF5ED00D78A2300FCBE
      5F00F89F1900F4910000EC8E0000E58A0000DE860000D7830000D17B0000CC73
      0000C66D0000B8601500FAF3EE000000000000000000EAFBEE004BD57500A6FF
      C4006DFB9E0050F486000EA91600FEFBFC000000000024B62F002FCF620035CF
      6B0033CD68001AA61F00EEF9EE00000000000000000000000000B79787000000
      0000000000000000000000000000FEFEFE00FEFDFB00FDFBF900A7827000A782
      7000A7827000A782700000000000000000000000000000000000BFD0FF0092BF
      FF00CEF4FF00A4D8FF0064A2FF006A89FF00809BFF00457BFF005C8DFF005584
      FF003565FF00B5C1FF0000000000000000000000000000000000F6D9B300DF90
      2300FFC15E00F8A62B00EE8E0000E68A0000DF870000D7830000D17C0000CC76
      0000BD610500F0D1B60000000000000000000000000000000000B9F8CC005BE2
      8500AAFFCA007BFDA7004BEF810014AB1C001EAD260036D86A003CD773003AD3
      72001AB32C00B5E9B50000000000000000000000000000000000B89888000000
      00000000000000000000FEFEFE00FEFEFD00FEFCFA00FDFBF900A7827000F5E2
      D900B18E7E00E1D4CE000000000000000000000000000000000000000000C1D2
      FF007BA6FF00BAE3FF00B5DDFF0095C7FF0080B3FF0075A6FF006997FF003D6A
      FF00B6C4FF00000000000000000000000000000000000000000000000000F6D9
      B300DA8C2500F0AB4600F5B34E00EBA22F00E2951B00DC8E1400D0801000C470
      1700F1D2B500000000000000000000000000000000000000000000000000BBF8
      CE0052D97C0088F3AB0095FBBA0076F5A60062EC960058E38B0044D26F002CB7
      4000B6ECB9000000000000000000000000000000000000000000B89888000000
      0000000000000000000000000000000000000000000000000000A7827000B18E
      7E00E1D4CE000000000000000000000000000000000000000000000000000000
      0000F0F5FF0099B0FF00779BFF006590FF00608AFF00698CFF008EA6FF00EFF2
      FF00000000000000000000000000000000000000000000000000000000000000
      0000FDF5ED00E3B88300D8954000D5892600D1862500D38D3F00DFB38400FBF3
      ED00000000000000000000000000000000000000000000000000000000000000
      0000EDFCF10091DFA7005DD27D004BCC6D0048CA670056C86C008DD69700EFFB
      F000000000000000000000000000000000000000000000000000B8988800B898
      8800B4938300B4938300B08E7D00B08E7D00AC887700AC887700A7827000E1D4
      CE00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000200000000100010000000000000100000000000000000000
      000000000000000000000000FFFFFF0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000FFFFFFFFFFFFFFFFF00FF00FF00FC001
      E007E007E007D001C003C003C003D009818180018181D00983C180018081D011
      87E180018081D0018DB180018081D009818180018C31D401818180018261D001
      8181800181C1DF03818180018081DE03C003C003C003DC03E007E007E007DFC7
      F00FF00FF00FC00FFFFFFFFFFFFFFFFF00000000000000000000000000000000
      000000000000}
  end
  object alPaf: TActionList
    Left = 38
    Top = 395
    object acFilterList: TAction
      Caption = 'acFilterList'
      OnExecute = acFilterListExecute
    end
  end
end
