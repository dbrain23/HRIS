inherited fHolidayDetail: TfHolidayDetail
  Caption = 'fHolidayDetail'
  ClientHeight = 519
  ClientWidth = 934
  OnCreate = FormCreate
  ExplicitWidth = 950
  ExplicitHeight = 558
  PixelsPerInch = 96
  TextHeight = 14
  inherited pMaster: TJvPanel
    Width = 934
    Height = 519
    BorderWidth = 1
    ExplicitWidth = 934
    ExplicitHeight = 519
    object pcMaster: TJvPageControl
      Left = 1
      Top = 1
      Width = 932
      Height = 517
      ActivePage = tsMaster
      Align = alClient
      TabOrder = 0
      object tsMaster: TTabSheet
        Caption = 'Holiday Detail'
        object pDetails: TJvPanel
          Left = 0
          Top = 0
          Width = 924
          Height = 488
          HotTrackFont.Charset = DEFAULT_CHARSET
          HotTrackFont.Color = clWindowText
          HotTrackFont.Height = -11
          HotTrackFont.Name = 'Tahoma'
          HotTrackFont.Style = []
          Align = alClient
          BevelOuter = bvNone
          ParentBackground = False
          TabOrder = 0
          object ghAction: TJvGroupHeader
            Left = 16
            Top = 416
            Width = 897
            Height = 18
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clHighlight
            Font.Height = -12
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
          end
          object JvGroupHeader1: TJvGroupHeader
            Left = 43
            Top = 15
            Width = 319
            Height = 18
            Caption = 'Details'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clHighlight
            Font.Height = -12
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
          end
          object JvGroupHeader3: TJvGroupHeader
            Left = 406
            Top = 15
            Width = 507
            Height = 18
            Caption = 'Location'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clHighlight
            Font.Height = -12
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
          end
          object JvLabel1: TJvLabel
            Left = 59
            Top = 116
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
          object JvLabel2: TJvLabel
            Left = 59
            Top = 142
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
          object JvLabel3: TJvLabel
            Left = 59
            Top = 194
            Width = 47
            Height = 14
            Caption = 'Remarks'
            Transparent = True
            HotTrackFont.Charset = DEFAULT_CHARSET
            HotTrackFont.Color = clWindowText
            HotTrackFont.Height = -11
            HotTrackFont.Name = 'Tahoma'
            HotTrackFont.Style = []
          end
          object JvLabel4: TJvLabel
            Left = 59
            Top = 39
            Width = 27
            Height = 14
            Caption = 'Year'
            Transparent = True
            HotTrackFont.Charset = DEFAULT_CHARSET
            HotTrackFont.Color = clWindowText
            HotTrackFont.Height = -11
            HotTrackFont.Name = 'Tahoma'
            HotTrackFont.Style = []
          end
          object JvLabel5: TJvLabel
            Left = 59
            Top = 64
            Width = 37
            Height = 14
            Caption = 'Month'
            Transparent = True
            HotTrackFont.Charset = DEFAULT_CHARSET
            HotTrackFont.Color = clWindowText
            HotTrackFont.Height = -11
            HotTrackFont.Name = 'Tahoma'
            HotTrackFont.Style = []
          end
          object JvLabel7: TJvLabel
            Left = 272
            Top = 64
            Width = 22
            Height = 14
            Caption = 'Day'
            Transparent = True
            HotTrackFont.Charset = DEFAULT_CHARSET
            HotTrackFont.Color = clWindowText
            HotTrackFont.Height = -11
            HotTrackFont.Name = 'Tahoma'
            HotTrackFont.Style = []
          end
          object JvLabel6: TJvLabel
            Left = 59
            Top = 90
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
          object bSave: TcxButton
            Left = 43
            Top = 424
            Width = 81
            Height = 27
            Caption = 'Save'
            LookAndFeel.SkinName = ''
            OptionsImage.ImageIndex = 1
            OptionsImage.Images = ilBaseMain
            TabOrder = 10
            OnClick = bSaveClick
          end
          object bCancel: TcxButton
            Left = 125
            Top = 424
            Width = 81
            Height = 27
            Caption = 'Cancel'
            OptionsImage.ImageIndex = 4
            OptionsImage.Images = ilBaseMain
            TabOrder = 11
            OnClick = bCancelClick
          end
          object chbRecurring: TcxDBCheckBox
            Left = 272
            Top = 32
            Caption = 'Yearly'
            DataBinding.DataField = 'is_recurring'
            DataBinding.DataSource = dmTimeAttendance.dscHoliday
            Properties.NullStyle = nssUnchecked
            Properties.ValueChecked = '1'
            Properties.ValueGrayed = '0'
            Properties.ValueUnchecked = 0
            TabOrder = 1
            OnClick = chbRecurringClick
            Width = 66
          end
          object edDescription: TcxDBMemo
            Left = 136
            Top = 136
            DataBinding.DataField = 'holiday_description'
            DataBinding.DataSource = dmTimeAttendance.dscHoliday
            TabOrder = 6
            Height = 48
            Width = 226
          end
          object edRemarks: TcxDBMemo
            Left = 136
            Top = 188
            DataBinding.DataField = 'holiday_remarks'
            DataBinding.DataSource = dmTimeAttendance.dscHoliday
            TabOrder = 7
            Height = 48
            Width = 226
          end
          object chbNational: TcxDBCheckBox
            AlignWithMargins = True
            Left = 136
            Top = 242
            Caption = 'National holiday'
            DataBinding.DataField = 'is_national'
            DataBinding.DataSource = dmTimeAttendance.dscHoliday
            Properties.Alignment = taLeftJustify
            Properties.NullStyle = nssUnchecked
            Properties.ValueChecked = '1'
            Properties.ValueGrayed = '0'
            Properties.ValueUnchecked = 0
            Style.LookAndFeel.NativeStyle = True
            Style.Shadow = False
            StyleDisabled.LookAndFeel.NativeStyle = True
            StyleFocused.LookAndFeel.NativeStyle = True
            StyleHot.LookAndFeel.NativeStyle = True
            TabOrder = 8
            OnClick = chbNationalClick
            Width = 113
          end
          object edYear: TcxDBTextEdit
            Left = 136
            Top = 32
            DataBinding.DataField = 'holiday_year'
            DataBinding.DataSource = dmTimeAttendance.dscHoliday
            Properties.MaxLength = 4
            TabOrder = 0
            Width = 121
          end
          object edName: TcxDBTextEdit
            Left = 136
            Top = 110
            DataBinding.DataField = 'holiday_name'
            DataBinding.DataSource = dmTimeAttendance.dscHoliday
            TabOrder = 5
            Width = 226
          end
          object edDay: TcxDBTextEdit
            Left = 313
            Top = 58
            DataBinding.DataField = 'holiday_day'
            DataBinding.DataSource = dmTimeAttendance.dscHoliday
            TabOrder = 3
            Width = 49
          end
          object dbluMonth: TcxDBLookupComboBox
            Left = 136
            Top = 58
            DataBinding.DataField = 'holiday_month'
            DataBinding.DataSource = dmTimeAttendance.dscHoliday
            Properties.KeyFieldNames = 'month_num'
            Properties.ListColumns = <
              item
                FieldName = 'month_name'
              end>
            Properties.ListOptions.ColumnSorting = False
            Properties.ListOptions.GridLines = glNone
            Properties.ListOptions.RowSelect = False
            Properties.ListOptions.ShowHeader = False
            Properties.ListSource = dmTimeAttendance.dscMonths
            TabOrder = 2
            Width = 121
          end
          object clbLocations: TcxCheckListBox
            Left = 422
            Top = 30
            Width = 491
            Height = 369
            TabStop = False
            Columns = 2
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
            TabOrder = 9
          end
          object dbluHolidayType: TcxDBLookupComboBox
            Left = 136
            Top = 84
            DataBinding.DataField = 'holidaytype_code'
            DataBinding.DataSource = dmTimeAttendance.dscHoliday
            Properties.KeyFieldNames = 'holidaytype_code'
            Properties.ListColumns = <
              item
                FieldName = 'holidaytype_name'
              end>
            Properties.ListOptions.ColumnSorting = False
            Properties.ListOptions.GridLines = glNone
            Properties.ListOptions.RowSelect = False
            Properties.ListOptions.ShowHeader = False
            Properties.ListSource = dmTimeAttendance.dscHolidayTypes
            TabOrder = 4
            Width = 226
          end
        end
      end
    end
  end
  inherited ilBaseMain: TcxImageList
    FormatVersion = 1
    DesignInfo = 30933784
  end
end
