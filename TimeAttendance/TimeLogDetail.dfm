inherited fTimeLogDetail: TfTimeLogDetail
  Caption = 'fTimeLogDetail'
  ClientHeight = 527
  ClientWidth = 891
  OnCreate = FormCreate
  ExplicitWidth = 907
  ExplicitHeight = 566
  PixelsPerInch = 96
  TextHeight = 14
  inherited pMaster: TJvPanel
    Width = 891
    Height = 527
    BorderWidth = 1
    ExplicitWidth = 891
    ExplicitHeight = 527
    object pcMaster: TJvPageControl
      Left = 1
      Top = 1
      Width = 889
      Height = 525
      ActivePage = tsMaster
      Align = alClient
      TabOrder = 0
      object tsMaster: TTabSheet
        Caption = 'Timelog Detail'
        object pDetails: TJvPanel
          Left = 0
          Top = 0
          Width = 881
          Height = 496
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
            Width = 709
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
            Top = 83
            Width = 273
            Height = 18
            Caption = 'Undertime'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clHighlight
            Font.Height = -12
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
          end
          object JvGroupHeader3: TJvGroupHeader
            Left = 26
            Top = 10
            Width = 699
            Height = 18
            Caption = 'Timelog'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clHighlight
            Font.Height = -12
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
          end
          object JvLabel1: TJvLabel
            Left = 43
            Top = 32
            Width = 19
            Height = 14
            Caption = 'AM'
            Transparent = True
            HotTrackFont.Charset = DEFAULT_CHARSET
            HotTrackFont.Color = clWindowText
            HotTrackFont.Height = -11
            HotTrackFont.Name = 'Tahoma'
            HotTrackFont.Style = []
          end
          object JvLabel2: TJvLabel
            Left = 43
            Top = 58
            Width = 18
            Height = 14
            Caption = 'PM'
            Transparent = True
            HotTrackFont.Charset = DEFAULT_CHARSET
            HotTrackFont.Color = clWindowText
            HotTrackFont.Height = -11
            HotTrackFont.Name = 'Tahoma'
            HotTrackFont.Style = []
          end
          object JvGroupHeader2: TJvGroupHeader
            Left = 450
            Top = 83
            Width = 275
            Height = 18
            Caption = 'Override'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clHighlight
            Font.Height = -12
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
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
            TabOrder = 0
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
            TabOrder = 1
            OnClick = bCancelClick
          end
          object chbOverride: TcxCheckBox
            Left = 430
            Top = 80
            TabOrder = 2
            OnClick = chbOverrideClick
            Width = 17
          end
          object chbUndertime: TcxCheckBox
            Tag = 1
            Left = 21
            Top = 80
            TabOrder = 3
            OnClick = chbUndertimeClick
            Width = 22
          end
          object lblEmployeeName: TcxDBLabel
            Left = 401
            Top = 27
            DataBinding.DataField = 'employee_name'
            DataBinding.DataSource = dmTimeAttendance.dscDtrEmployee
            ParentFont = False
            Properties.WordWrap = True
            Style.Font.Charset = DEFAULT_CHARSET
            Style.Font.Color = clGray
            Style.Font.Height = -12
            Style.Font.Name = 'Tahoma'
            Style.Font.Style = [fsBold]
            Style.TextStyle = [fsBold]
            Style.IsFontAssigned = True
            Height = 25
            Width = 324
          end
          object cxDBTimeEdit3: TcxDBTimeEdit
            Left = 94
            Top = 52
            DataBinding.DataField = 'time_in_pm'
            DataBinding.DataSource = dmTimeAttendance.dscDtrEmployee
            Enabled = False
            ParentFont = False
            Properties.ClearKey = 46
            Properties.ImmediatePost = True
            Properties.SpinButtons.Position = sbpHorzLeftRight
            Properties.SpinButtons.Visible = False
            Properties.TimeFormat = tfHourMin
            Properties.Use24HourFormat = False
            Style.Font.Charset = DEFAULT_CHARSET
            Style.Font.Color = clRed
            Style.Font.Height = -12
            Style.Font.Name = 'Tahoma'
            Style.Font.Style = []
            Style.TextColor = clGray
            Style.IsFontAssigned = True
            StyleDisabled.Color = clWhite
            StyleDisabled.TextColor = clGray
            TabOrder = 5
            Width = 84
          end
          object cxDBTimeEdit1: TcxDBTimeEdit
            Left = 94
            Top = 26
            DataBinding.DataField = 'time_in_am'
            DataBinding.DataSource = dmTimeAttendance.dscDtrEmployee
            Enabled = False
            ParentFont = False
            Properties.ClearKey = 46
            Properties.ImmediatePost = True
            Properties.SpinButtons.Position = sbpHorzLeftRight
            Properties.SpinButtons.Visible = False
            Properties.TimeFormat = tfHourMin
            Properties.Use24HourFormat = False
            Style.Font.Charset = DEFAULT_CHARSET
            Style.Font.Color = clRed
            Style.Font.Height = -12
            Style.Font.Name = 'Tahoma'
            Style.Font.Style = []
            Style.TextColor = clGray
            Style.IsFontAssigned = True
            StyleDisabled.Color = clWhite
            StyleDisabled.TextColor = clGray
            TabOrder = 6
            Width = 84
          end
          object cxDBTimeEdit4: TcxDBTimeEdit
            Left = 182
            Top = 52
            DataBinding.DataField = 'time_out_pm'
            DataBinding.DataSource = dmTimeAttendance.dscDtrEmployee
            Enabled = False
            ParentFont = False
            Properties.ClearKey = 46
            Properties.ImmediatePost = True
            Properties.SpinButtons.Position = sbpHorzLeftRight
            Properties.SpinButtons.Visible = False
            Properties.TimeFormat = tfHourMin
            Properties.Use24HourFormat = False
            Style.Font.Charset = DEFAULT_CHARSET
            Style.Font.Color = clRed
            Style.Font.Height = -12
            Style.Font.Name = 'Tahoma'
            Style.Font.Style = []
            Style.TextColor = clGray
            Style.IsFontAssigned = True
            StyleDisabled.Color = clWhite
            StyleDisabled.TextColor = clGray
            TabOrder = 7
            Width = 84
          end
          object lblDtrDate: TcxDBLabel
            Left = 401
            Top = 53
            DataBinding.DataField = 'formatted_dtr_date'
            DataBinding.DataSource = dmTimeAttendance.dscDtrEmployee
            ParentFont = False
            Style.Font.Charset = DEFAULT_CHARSET
            Style.Font.Color = clGray
            Style.Font.Height = -12
            Style.Font.Name = 'Tahoma'
            Style.Font.Style = [fsBold]
            Style.IsFontAssigned = True
            Height = 18
            Width = 104
          end
          object cxDBTimeEdit2: TcxDBTimeEdit
            Left = 182
            Top = 26
            DataBinding.DataField = 'time_out_am'
            DataBinding.DataSource = dmTimeAttendance.dscDtrEmployee
            Enabled = False
            ParentFont = False
            Properties.ClearKey = 46
            Properties.ImmediatePost = True
            Properties.SpinButtons.Position = sbpHorzLeftRight
            Properties.SpinButtons.Visible = False
            Properties.TimeFormat = tfHourMin
            Properties.Use24HourFormat = False
            Style.Font.Charset = DEFAULT_CHARSET
            Style.Font.Color = clRed
            Style.Font.Height = -12
            Style.Font.Name = 'Tahoma'
            Style.Font.Style = []
            Style.TextColor = clGray
            Style.IsFontAssigned = True
            StyleDisabled.Color = clWhite
            StyleDisabled.TextColor = clGray
            TabOrder = 9
            Width = 84
          end
          object pnlOverride: TPanel
            Left = 430
            Top = 97
            Width = 307
            Height = 288
            BevelOuter = bvNone
            ParentBackground = False
            TabOrder = 10
            object imgOverrideModifiedAM: TImage
              Left = 23
              Top = 6
              Width = 17
              Height = 17
              Hint = 'Modified'
              ParentShowHint = False
              Picture.Data = {
                0B546478504E47496D61676589504E470D0A1A0A0000000D4948445200000010
                0000001008060000001FF3FF610000000467414D410000B18F0BFC6105000000
                1974455874536F6674776172650041646F626520496D616765526561647971C9
                653C000001AE49444154384FA5924D2883711CC77F4F4949AE8A8B83DD56941C
                ECE2F52084F0EC2272B10C6909F5C832077390DBAEE6EA20A44C944432871D59
                5E7391D99AB6D6360F9BF9F97F279A0D4D9EFAF4EBFBFFFE3FCF3BE92D96ACE9
                9F1D21BD5E4F76AD56772349EB4E49AAFD76E34FE004B22C6B4C5555669E99E1
                0D493A40D12A18C80665BE6BA1ADB7775955556EAFA8D8B5E87453D469361B39
                8B23E03DE0E3AD16563D936CB3D9D8ED76335C6A5794C1C4EB2BC713891FF17B
                F6D9E97897D797EAF8FA7C8FE1C0A596F1F1E198D8A4C6E3DFE2BDDBE3234773
                525E13F2D5F94E721D0E5C6A349946D497170E3F3D6570EF39E5C3CDA6A4BC6A
                AFE533F7D66707072E350C0D99C2B11807A2D10CF637CCCC910B5E59ACE1D313
                C7970E0E5CAA36184683CFCFEC0D85322022B6593BD8E5DACEE8E0C0255D5FDF
                D883F82CB781C09F8003972ABBBB27BC8F8F7CE3F733E607C8A9A4779870A95C
                96154F24C2973E1F5BEDF6DD9CD25205133995F40E0E5C2AA9AF9FF689E7B90D
                8739287E18644CE454D23B38C894AFD1180BCACAE600AE905754D483F9B1F65B
                0757BC68CA15140A8AFF089C5C1277F40F98DE009F4297BA3F7D7A0500000000
                49454E44AE426082}
              ShowHint = True
              Visible = False
            end
            object imgOverrideModifiedPM: TImage
              Left = 23
              Top = 111
              Width = 17
              Height = 17
              Hint = 'Modified'
              ParentShowHint = False
              Picture.Data = {
                0B546478504E47496D61676589504E470D0A1A0A0000000D4948445200000010
                0000001008060000001FF3FF610000000467414D410000B18F0BFC6105000000
                1974455874536F6674776172650041646F626520496D616765526561647971C9
                653C000001AE49444154384FA5924D2883711CC77F4F4949AE8A8B83DD56941C
                ECE2F52084F0EC2272B10C6909F5C832077390DBAEE6EA20A44C944432871D59
                5E7391D99AB6D6360F9BF9F97F279A0D4D9EFAF4EBFBFFFE3FCF3BE92D96ACE9
                9F1D21BD5E4F76AD56772349EB4E49AAFD76E34FE004B22C6B4C5555669E99E1
                0D493A40D12A18C80665BE6BA1ADB7775955556EAFA8D8B5E87453D469361B39
                8B23E03DE0E3AD16563D936CB3D9D8ED76335C6A5794C1C4EB2BC713891FF17B
                F6D9E97897D797EAF8FA7C8FE1C0A596F1F1E198D8A4C6E3DFE2BDDBE3234773
                525E13F2D5F94E721D0E5C6A349946D497170E3F3D6570EF39E5C3CDA6A4BC6A
                AFE533F7D66707072E350C0D99C2B11807A2D10CF637CCCC910B5E59ACE1D313
                C7970E0E5CAA36184683CFCFEC0D85322022B6593BD8E5DACEE8E0C0255D5FDF
                D883F82CB781C09F8003972ABBBB27BC8F8F7CE3F733E607C8A9A4779870A95C
                96154F24C2973E1F5BEDF6DD9CD25205133995F40E0E5C2AA9AF9FF689E7B90D
                8739287E18644CE454D23B38C894AFD1180BCACAE600AE905754D483F9B1F65B
                0757BC68CA15140A8AFF089C5C1277F40F98DE009F4297BA3F7D7A0500000000
                49454E44AE426082}
              ShowHint = True
              Visible = False
            end
            object imgOverrideCancelledAM: TImage
              Left = 23
              Top = 6
              Width = 17
              Height = 17
              Hint = 'Override cancelled'
              ParentShowHint = False
              Picture.Data = {
                0B546478504E47496D61676589504E470D0A1A0A0000000D4948445200000010
                0000001008060000001FF3FF610000000467414D410000B18F0BFC6105000000
                1974455874536F6674776172650041646F626520496D616765526561647971C9
                653C0000022D49444154384FA5924168135114453F49A00948D30C6D0C85E0AE
                858859B4906C4B0D842E4A5A84529C4AD72D5DBA5710A115DCB870215A1AC1B6
                3662555211D48E95204112EAA0A096AC3A82D14516CACC6E78DE3B498608EAC6
                0F27BC79EFDEFBFF4CBE1291FFC2FBB9AB94BA07B6C17DA58677945A019BA0D2
                81F50A67D4504BCF9F02A61F4622C6BB6CD6FABEB060FF5C5E767F2C2DB9DF74
                DD3ECC642CCEA8F95BC0F4E381817A53D79DAF8B8B62E9BA9853531EACD9FB32
                3FEF3C8A46EBD4FE1650E4D1C261E3786ECEF93C3B2B1F0B05A94E4C60D45EAC
                D9FB3433238D42C1D9EAEB33E8C1A81DB08EF77B33366671B7B793931EFB998C
                67E662DDED1FE6F3F23295B2E8C1A81D704BA9ADF7F9BC6D64B3D2E5492A25CD
                66538E8E8E647D68486E6B9AC7463C2EE5D1519B1E3FE026BE3476779F8F8FCB
                B3745A4AC9A41421AED56A629AA66CC46252ECE14132E9D2E307DCC0433D9773
                F74646A43438283B106D029A1B8D8657B3D765379170E9F103AEE338AFD269BB
                8C5DCB1074D9EED0DB23BB9A66D3E307ACF1E2C4E3C70778BF7D08C81EE03768
                B55A5EDDED93622462D1E3075CC55F722D18340E1209A78A5354217A016826AC
                D9F3FAD1A8B3160818F4F8015770292EE172AC8642F58AA63926424C889F7660
                4D5EC3BC1A0CD6A9A5C70FE03A05CE617011E977C261ABD2DF6F7F88C55CC29A
                3DCEA8A196AB3720044E82D3C34A9DCD2975F9BC52A50BF8D284357B9C417306
                24E8E90D088013200EA0FB27DC88DA8088A85F434BD87A3F1421B50000000049
                454E44AE426082}
              ShowHint = True
              Visible = False
            end
            object imgOverrideCancelledPM: TImage
              Left = 23
              Top = 111
              Width = 17
              Height = 17
              Hint = 'Override cancelled'
              ParentShowHint = False
              Picture.Data = {
                0B546478504E47496D61676589504E470D0A1A0A0000000D4948445200000010
                0000001008060000001FF3FF610000000467414D410000B18F0BFC6105000000
                1974455874536F6674776172650041646F626520496D616765526561647971C9
                653C0000022D49444154384FA5924168135114453F49A00948D30C6D0C85E0AE
                858859B4906C4B0D842E4A5A84529C4AD72D5DBA5710A115DCB870215A1AC1B6
                3662555211D48E95204112EAA0A096AC3A82D14516CACC6E78DE3B498608EAC6
                0F27BC79EFDEFBFF4CBE1291FFC2FBB9AB94BA07B6C17DA58677945A019BA0D2
                81F50A67D4504BCF9F02A61F4622C6BB6CD6FABEB060FF5C5E767F2C2DB9DF74
                DD3ECC642CCEA8F95BC0F4E381817A53D79DAF8B8B62E9BA9853531EACD9FB32
                3FEF3C8A46EBD4FE1650E4D1C261E3786ECEF93C3B2B1F0B05A94E4C60D45EAC
                D9FB3433238D42C1D9EAEB33E8C1A81DB08EF77B33366671B7B793931EFB998C
                67E662DDED1FE6F3F23295B2E8C1A81D704BA9ADF7F9BC6D64B3D2E5492A25CD
                66538E8E8E647D68486E6B9AC7463C2EE5D1519B1E3FE026BE3476779F8F8FCB
                B3745A4AC9A41421AED56A629AA66CC46252ECE14132E9D2E307DCC0433D9773
                F74646A43438283B106D029A1B8D8657B3D765379170E9F103AEE338AFD269BB
                8C5DCB1074D9EED0DB23BB9A66D3E307ACF1E2C4E3C70778BF7D08C81EE03768
                B55A5EDDED93622462D1E3075CC55F722D18340E1209A78A5354217A016826AC
                D9F3FAD1A8B3160818F4F8015770292EE172AC8642F58AA63926424C889F7660
                4D5EC3BC1A0CD6A9A5C70FE03A05CE617011E977C261ABD2DF6F7F88C55CC29A
                3DCEA8A196AB3720044E82D3C34A9DCD2975F9BC52A50BF8D284357B9C417306
                24E8E90D088013200EA0FB27DC88DA8088A85F434BD87A3F1421B50000000049
                454E44AE426082}
              ShowHint = True
              Visible = False
            end
            object chbOverrideAM: TcxCheckBox
              Left = 39
              Top = 3
              Caption = 'AM'
              Enabled = False
              TabOrder = 0
              Visible = False
              OnClick = chbOverrideAMClick
              Width = 40
            end
            object dteOverrideTimeInAM: TcxDBTimeEdit
              Left = 81
              Top = 3
              DataBinding.DataField = 'time_in'
              DataBinding.DataSource = dmTimeAttendance.dscDtrOverrideAM
              Enabled = False
              ParentFont = False
              Properties.ClearKey = 46
              Properties.ImmediatePost = True
              Properties.SpinButtons.Position = sbpHorzLeftRight
              Properties.TimeFormat = tfHourMin
              Properties.Use24HourFormat = False
              Style.Font.Charset = DEFAULT_CHARSET
              Style.Font.Color = clRed
              Style.Font.Height = -12
              Style.Font.Name = 'Tahoma'
              Style.Font.Style = []
              Style.TextColor = clBlack
              Style.IsFontAssigned = True
              StyleDisabled.Color = clWhite
              StyleDisabled.TextColor = clGray
              TabOrder = 1
              Visible = False
              Width = 91
            end
            object dteOverrideTimeOutAM: TcxDBTimeEdit
              Left = 177
              Top = 3
              DataBinding.DataField = 'time_out'
              DataBinding.DataSource = dmTimeAttendance.dscDtrOverrideAM
              Enabled = False
              ParentFont = False
              Properties.ClearKey = 46
              Properties.ImmediatePost = True
              Properties.SpinButtons.Position = sbpHorzLeftRight
              Properties.TimeFormat = tfHourMin
              Properties.Use24HourFormat = False
              Style.Font.Charset = DEFAULT_CHARSET
              Style.Font.Color = clRed
              Style.Font.Height = -12
              Style.Font.Name = 'Tahoma'
              Style.Font.Style = []
              Style.TextColor = clBlack
              Style.IsFontAssigned = True
              StyleDisabled.Color = clWhite
              StyleDisabled.TextColor = clGray
              TabOrder = 2
              Visible = False
              Width = 91
            end
            object btnOverrideAMDefault: TcxButton
              Left = 271
              Top = 3
              Width = 24
              Height = 22
              Hint = 'Use default values'
              Enabled = False
              OptionsImage.ImageIndex = 5
              OptionsImage.Images = ilBaseMain
              ParentShowHint = False
              ShowHint = True
              SpeedButtonOptions.CanBeFocused = False
              TabOrder = 3
              TabStop = False
              Visible = False
              OnClick = btnOverrideAMDefaultClick
            end
            object lblOverrideReasonAM: TcxLabel
              Left = 38
              Top = 28
              Caption = 'Override reason'
              Enabled = False
              Visible = False
            end
            object dbluOverrideAM: TcxDBLookupComboBox
              Left = 38
              Top = 48
              DataBinding.DataField = 'override_reason_code'
              DataBinding.DataSource = dmTimeAttendance.dscDtrOverrideAM
              Enabled = False
              Properties.KeyFieldNames = 'override_reason_code'
              Properties.ListColumns = <
                item
                  FieldName = 'override_reason_name'
                end>
              Properties.ListOptions.ColumnSorting = False
              Properties.ListOptions.GridLines = glNone
              Properties.ListOptions.ShowHeader = False
              Properties.ListSource = dmTimeAttendance.dscOverrideReason
              Style.LookAndFeel.NativeStyle = True
              StyleDisabled.Color = clWhite
              StyleDisabled.LookAndFeel.NativeStyle = True
              StyleDisabled.TextColor = clGray
              StyleFocused.LookAndFeel.NativeStyle = True
              StyleHot.LookAndFeel.NativeStyle = True
              TabOrder = 5
              Visible = False
              Width = 257
            end
            object chbOverridePM: TcxCheckBox
              Left = 38
              Top = 109
              Caption = 'PM'
              Enabled = False
              TabOrder = 6
              Visible = False
              OnClick = chbOverridePMClick
              Width = 41
            end
            object dteOverrideTimeInPM: TcxDBTimeEdit
              Left = 81
              Top = 109
              DataBinding.DataField = 'time_in'
              DataBinding.DataSource = dmTimeAttendance.dscDtrOverridePM
              Enabled = False
              ParentFont = False
              Properties.ClearKey = 46
              Properties.ImmediatePost = True
              Properties.SpinButtons.Position = sbpHorzLeftRight
              Properties.TimeFormat = tfHourMin
              Properties.Use24HourFormat = False
              Style.Font.Charset = DEFAULT_CHARSET
              Style.Font.Color = clRed
              Style.Font.Height = -12
              Style.Font.Name = 'Tahoma'
              Style.Font.Style = []
              Style.TextColor = clBlack
              Style.IsFontAssigned = True
              StyleDisabled.Color = clWhite
              StyleDisabled.TextColor = clGray
              TabOrder = 7
              Visible = False
              Width = 91
            end
            object dteOverrideTimeOutPM: TcxDBTimeEdit
              Left = 177
              Top = 109
              DataBinding.DataField = 'time_out'
              DataBinding.DataSource = dmTimeAttendance.dscDtrOverridePM
              Enabled = False
              ParentFont = False
              Properties.ClearKey = 46
              Properties.ImmediatePost = True
              Properties.SpinButtons.Position = sbpHorzLeftRight
              Properties.TimeFormat = tfHourMin
              Properties.Use24HourFormat = False
              Style.Font.Charset = DEFAULT_CHARSET
              Style.Font.Color = clRed
              Style.Font.Height = -12
              Style.Font.Name = 'Tahoma'
              Style.Font.Style = []
              Style.TextColor = clBlack
              Style.IsFontAssigned = True
              StyleDisabled.Color = clWhite
              StyleDisabled.TextColor = clGray
              TabOrder = 8
              Visible = False
              Width = 91
            end
            object chbCancelledAM: TcxDBCheckBox
              Left = 39
              Top = 73
              Caption = 'Cancelled'
              DataBinding.DataField = 'is_cancelled'
              DataBinding.DataSource = dmTimeAttendance.dscDtrOverrideAM
              Enabled = False
              Properties.Alignment = taLeftJustify
              Properties.DisplayChecked = '1'
              Properties.DisplayUnchecked = '0'
              Properties.DisplayGrayed = '0'
              Properties.ImmediatePost = True
              Properties.NullStyle = nssUnchecked
              Properties.ValueChecked = '1'
              Properties.ValueGrayed = '0'
              StyleDisabled.Color = clBtnFace
              TabOrder = 9
              Visible = False
              Width = 87
            end
            object btnOverridePMDefault: TcxButton
              Left = 271
              Top = 109
              Width = 24
              Height = 22
              Hint = 'Use default values'
              Enabled = False
              OptionsImage.ImageIndex = 5
              OptionsImage.Images = ilBaseMain
              ParentShowHint = False
              ShowHint = True
              SpeedButtonOptions.CanBeFocused = False
              TabOrder = 10
              TabStop = False
              Visible = False
              OnClick = btnOverrideAMDefaultClick
            end
            object dbluOverridePM: TcxDBLookupComboBox
              Left = 38
              Top = 154
              DataBinding.DataField = 'override_reason_code'
              DataBinding.DataSource = dmTimeAttendance.dscDtrOverridePM
              Enabled = False
              Properties.KeyFieldNames = 'override_reason_code'
              Properties.ListColumns = <
                item
                  FieldName = 'override_reason_name'
                end>
              Properties.ListOptions.ColumnSorting = False
              Properties.ListOptions.GridLines = glNone
              Properties.ListOptions.ShowHeader = False
              Properties.ListSource = dmTimeAttendance.dscOverrideReason
              StyleDisabled.Color = clWhite
              StyleDisabled.TextColor = clGray
              TabOrder = 11
              Visible = False
              Width = 257
            end
            object lblOverrideReasonPM: TcxLabel
              Left = 38
              Top = 134
              Caption = 'Override reason'
              Enabled = False
              Visible = False
            end
            object chbCancelledPM: TcxDBCheckBox
              Left = 39
              Top = 179
              Caption = 'Cancelled'
              DataBinding.DataField = 'is_cancelled'
              DataBinding.DataSource = dmTimeAttendance.dscDtrOverridePM
              Enabled = False
              Properties.Alignment = taLeftJustify
              Properties.DisplayChecked = '1'
              Properties.DisplayUnchecked = '0'
              Properties.DisplayGrayed = '0'
              Properties.ImmediatePost = True
              Properties.NullStyle = nssUnchecked
              Properties.ValueChecked = '1'
              Properties.ValueGrayed = '0'
              TabOrder = 13
              Visible = False
              Width = 87
            end
          end
          object pnlUndertime: TPanel
            Left = 30
            Top = 97
            Width = 298
            Height = 288
            BevelOuter = bvNone
            ParentBackground = False
            TabOrder = 11
            object imgModifiedAM: TImage
              Left = 15
              Top = 6
              Width = 17
              Height = 17
              Hint = 'Modified'
              ParentShowHint = False
              Picture.Data = {
                0B546478504E47496D61676589504E470D0A1A0A0000000D4948445200000010
                0000001008060000001FF3FF610000000467414D410000B18F0BFC6105000000
                1974455874536F6674776172650041646F626520496D616765526561647971C9
                653C000001AE49444154384FA5924D2883711CC77F4F4949AE8A8B83DD56941C
                ECE2F52084F0EC2272B10C6909F5C832077390DBAEE6EA20A44C944432871D59
                5E7391D99AB6D6360F9BF9F97F279A0D4D9EFAF4EBFBFFFE3FCF3BE92D96ACE9
                9F1D21BD5E4F76AD56772349EB4E49AAFD76E34FE004B22C6B4C5555669E99E1
                0D493A40D12A18C80665BE6BA1ADB7775955556EAFA8D8B5E87453D469361B39
                8B23E03DE0E3AD16563D936CB3D9D8ED76335C6A5794C1C4EB2BC713891FF17B
                F6D9E97897D797EAF8FA7C8FE1C0A596F1F1E198D8A4C6E3DFE2BDDBE3234773
                525E13F2D5F94E721D0E5C6A349946D497170E3F3D6570EF39E5C3CDA6A4BC6A
                AFE533F7D66707072E350C0D99C2B11807A2D10CF637CCCC910B5E59ACE1D313
                C7970E0E5CAA36184683CFCFEC0D85322022B6593BD8E5DACEE8E0C0255D5FDF
                D883F82CB781C09F8003972ABBBB27BC8F8F7CE3F733E607C8A9A4779870A95C
                96154F24C2973E1F5BEDF6DD9CD25205133995F40E0E5C2AA9AF9FF689E7B90D
                8739287E18644CE454D23B38C894AFD1180BCACAE600AE905754D483F9B1F65B
                0757BC68CA15140A8AFF089C5C1277F40F98DE009F4297BA3F7D7A0500000000
                49454E44AE426082}
              ShowHint = True
              Visible = False
            end
            object imgModifiedPM: TImage
              Left = 15
              Top = 157
              Width = 17
              Height = 17
              Hint = 'Modified'
              ParentShowHint = False
              Picture.Data = {
                0B546478504E47496D61676589504E470D0A1A0A0000000D4948445200000010
                0000001008060000001FF3FF610000000467414D410000B18F0BFC6105000000
                1974455874536F6674776172650041646F626520496D616765526561647971C9
                653C000001AE49444154384FA5924D2883711CC77F4F4949AE8A8B83DD56941C
                ECE2F52084F0EC2272B10C6909F5C832077390DBAEE6EA20A44C944432871D59
                5E7391D99AB6D6360F9BF9F97F279A0D4D9EFAF4EBFBFFFE3FCF3BE92D96ACE9
                9F1D21BD5E4F76AD56772349EB4E49AAFD76E34FE004B22C6B4C5555669E99E1
                0D493A40D12A18C80665BE6BA1ADB7775955556EAFA8D8B5E87453D469361B39
                8B23E03DE0E3AD16563D936CB3D9D8ED76335C6A5794C1C4EB2BC713891FF17B
                F6D9E97897D797EAF8FA7C8FE1C0A596F1F1E198D8A4C6E3DFE2BDDBE3234773
                525E13F2D5F94E721D0E5C6A349946D497170E3F3D6570EF39E5C3CDA6A4BC6A
                AFE533F7D66707072E350C0D99C2B11807A2D10CF637CCCC910B5E59ACE1D313
                C7970E0E5CAA36184683CFCFEC0D85322022B6593BD8E5DACEE8E0C0255D5FDF
                D883F82CB781C09F8003972ABBBB27BC8F8F7CE3F733E607C8A9A4779870A95C
                96154F24C2973E1F5BEDF6DD9CD25205133995F40E0E5C2AA9AF9FF689E7B90D
                8739287E18644CE454D23B38C894AFD1180BCACAE600AE905754D483F9B1F65B
                0757BC68CA15140A8AFF089C5C1277F40F98DE009F4297BA3F7D7A0500000000
                49454E44AE426082}
              ShowHint = True
              Visible = False
            end
            object dteUndertimeFromAM: TcxDBTimeEdit
              Left = 102
              Top = 3
              DataBinding.DataField = 'time_from'
              DataBinding.DataSource = dmTimeAttendance.dscDtrUndertimeAM
              Enabled = False
              ParentFont = False
              Properties.ClearKey = 46
              Properties.ImmediatePost = True
              Properties.SpinButtons.Position = sbpHorzLeftRight
              Properties.TimeFormat = tfHourMin
              Properties.Use24HourFormat = False
              Properties.OnEditValueChanged = dteUndertimeFromPropertiesEditValueChanged
              Style.Font.Charset = DEFAULT_CHARSET
              Style.Font.Color = clRed
              Style.Font.Height = -12
              Style.Font.Name = 'Tahoma'
              Style.Font.Style = []
              Style.TextColor = clBlack
              Style.IsFontAssigned = True
              StyleDisabled.Color = clWhite
              StyleDisabled.TextColor = clGray
              TabOrder = 0
              Visible = False
              OnEnter = dteUndertimeFromAMEnter
              Width = 89
            end
            object dteUndertimeUntilAM: TcxDBTimeEdit
              Left = 197
              Top = 3
              DataBinding.DataField = 'time_until'
              DataBinding.DataSource = dmTimeAttendance.dscDtrUndertimeAM
              Enabled = False
              ParentFont = False
              Properties.ClearKey = 46
              Properties.ImmediatePost = True
              Properties.SpinButtons.Position = sbpHorzLeftRight
              Properties.TimeFormat = tfHourMin
              Properties.Use24HourFormat = False
              Properties.OnEditValueChanged = dteUndertimeFromPropertiesEditValueChanged
              Style.Font.Charset = DEFAULT_CHARSET
              Style.Font.Color = clRed
              Style.Font.Height = -12
              Style.Font.Name = 'Tahoma'
              Style.Font.Style = []
              Style.TextColor = clBlack
              Style.IsFontAssigned = True
              StyleDisabled.Color = clWhite
              StyleDisabled.TextColor = clGray
              TabOrder = 1
              Visible = False
              OnEnter = dteUndertimeFromAMEnter
              Width = 89
            end
            object lblUndertimeReasonAM: TcxLabel
              Left = 31
              Top = 28
              Caption = 'Undertime reason'
              Enabled = False
              Visible = False
            end
            object dbluUndertimeReasonAM: TcxDBLookupComboBox
              Left = 31
              Top = 48
              DataBinding.DataField = 'undertime_reason_code'
              DataBinding.DataSource = dmTimeAttendance.dscDtrUndertimeAM
              Enabled = False
              Properties.KeyFieldNames = 'undertime_reason_code'
              Properties.ListColumns = <
                item
                  FieldName = 'undertime_reason_name'
                end>
              Properties.ListOptions.ColumnSorting = False
              Properties.ListOptions.GridLines = glNone
              Properties.ListOptions.ShowHeader = False
              Properties.ListSource = dmTimeAttendance.dscUndertimeReason
              Style.LookAndFeel.NativeStyle = True
              StyleDisabled.Color = clWhite
              StyleDisabled.LookAndFeel.NativeStyle = True
              StyleDisabled.TextColor = clGray
              StyleFocused.LookAndFeel.NativeStyle = True
              StyleHot.LookAndFeel.NativeStyle = True
              TabOrder = 3
              Visible = False
              Width = 255
            end
            object lblStatusAM: TcxLabel
              Left = 31
              Top = 73
              Caption = 'Status'
              Enabled = False
              Visible = False
            end
            object dbluStatusAM: TcxDBLookupComboBox
              Left = 32
              Top = 93
              DataBinding.DataField = 'timestatus_code'
              DataBinding.DataSource = dmTimeAttendance.dscDtrUndertimeAM
              Enabled = False
              Properties.KeyFieldNames = 'timestatus_code'
              Properties.ListColumns = <
                item
                  FieldName = 'timestatus_name'
                end>
              Properties.ListOptions.ColumnSorting = False
              Properties.ListOptions.GridLines = glNone
              Properties.ListOptions.ShowHeader = False
              Properties.ListSource = dmTimeAttendance.dscTimeStatus
              Style.Color = clWhite
              Style.LookAndFeel.NativeStyle = True
              StyleDisabled.Color = clWhite
              StyleDisabled.LookAndFeel.NativeStyle = True
              StyleDisabled.TextColor = clGray
              StyleFocused.LookAndFeel.NativeStyle = True
              StyleHot.LookAndFeel.NativeStyle = True
              TabOrder = 5
              Visible = False
              Width = 254
            end
            object chbPaidUndertimeAM: TcxDBCheckBox
              Left = 31
              Top = 117
              Caption = 'Paid undertime'
              DataBinding.DataField = 'is_paid'
              DataBinding.DataSource = dmTimeAttendance.dscDtrUndertimeAM
              Enabled = False
              Properties.Alignment = taLeftJustify
              Properties.DisplayChecked = '1'
              Properties.DisplayUnchecked = '0'
              Properties.DisplayGrayed = '0'
              Properties.ImmediatePost = True
              Properties.NullStyle = nssUnchecked
              Properties.ValueChecked = '1'
              Properties.ValueGrayed = '0'
              TabOrder = 6
              Visible = False
              Width = 249
            end
            object chbUndertimeAM: TcxCheckBox
              Left = 31
              Top = 3
              Caption = 'AM'
              Enabled = False
              TabOrder = 7
              Visible = False
              OnClick = chbUndertimeAMClick
              Width = 40
            end
            object chbUndertimePM: TcxCheckBox
              Left = 31
              Top = 154
              Caption = 'PM'
              Enabled = False
              TabOrder = 8
              Visible = False
              OnClick = chbUndertimePMClick
              Width = 40
            end
            object dteUndertimeFromPM: TcxDBTimeEdit
              Left = 102
              Top = 154
              DataBinding.DataField = 'time_from'
              DataBinding.DataSource = dmTimeAttendance.dscDtrUndertimePM
              Enabled = False
              ParentFont = False
              Properties.ClearKey = 46
              Properties.ImmediatePost = True
              Properties.SpinButtons.Position = sbpHorzLeftRight
              Properties.TimeFormat = tfHourMin
              Properties.Use24HourFormat = False
              Properties.OnEditValueChanged = dteUndertimeFromPropertiesEditValueChanged
              Style.Font.Charset = DEFAULT_CHARSET
              Style.Font.Color = clRed
              Style.Font.Height = -12
              Style.Font.Name = 'Tahoma'
              Style.Font.Style = []
              Style.TextColor = clBlack
              Style.IsFontAssigned = True
              StyleDisabled.Color = clWhite
              StyleDisabled.TextColor = clGray
              TabOrder = 9
              Visible = False
              OnEnter = dteUndertimeFromPMEnter
              Width = 89
            end
            object dteUndertimeUntilPM: TcxDBTimeEdit
              Left = 197
              Top = 154
              DataBinding.DataField = 'time_until'
              DataBinding.DataSource = dmTimeAttendance.dscDtrUndertimePM
              Enabled = False
              ParentFont = False
              Properties.ClearKey = 46
              Properties.ImmediatePost = True
              Properties.SpinButtons.Position = sbpHorzLeftRight
              Properties.TimeFormat = tfHourMin
              Properties.Use24HourFormat = False
              Properties.OnEditValueChanged = dteUndertimeFromPropertiesEditValueChanged
              Style.Font.Charset = DEFAULT_CHARSET
              Style.Font.Color = clRed
              Style.Font.Height = -12
              Style.Font.Name = 'Tahoma'
              Style.Font.Style = []
              Style.TextColor = clBlack
              Style.IsFontAssigned = True
              StyleDisabled.Color = clWhite
              StyleDisabled.TextColor = clGray
              TabOrder = 10
              Visible = False
              OnEnter = dteUndertimeFromPMEnter
              Width = 89
            end
            object lblUndertimeReasonPM: TcxLabel
              Left = 31
              Top = 179
              Caption = 'Undertime reason'
              Enabled = False
              Visible = False
            end
            object dbluUndertimeReasonPM: TcxDBLookupComboBox
              Left = 31
              Top = 199
              DataBinding.DataField = 'undertime_reason_code'
              DataBinding.DataSource = dmTimeAttendance.dscDtrUndertimePM
              Enabled = False
              Properties.KeyFieldNames = 'undertime_reason_code'
              Properties.ListColumns = <
                item
                  FieldName = 'undertime_reason_name'
                end>
              Properties.ListOptions.ColumnSorting = False
              Properties.ListOptions.GridLines = glNone
              Properties.ListOptions.ShowHeader = False
              Properties.ListSource = dmTimeAttendance.dscUndertimeReason
              Style.LookAndFeel.NativeStyle = True
              StyleDisabled.Color = clWhite
              StyleDisabled.LookAndFeel.NativeStyle = True
              StyleDisabled.TextColor = clGray
              StyleFocused.LookAndFeel.NativeStyle = True
              StyleHot.LookAndFeel.NativeStyle = True
              TabOrder = 12
              Visible = False
              Width = 255
            end
            object lblStatusPM: TcxLabel
              Left = 32
              Top = 224
              Caption = 'Status'
              Enabled = False
              Visible = False
            end
            object dbluStatusPM: TcxDBLookupComboBox
              Left = 32
              Top = 244
              DataBinding.DataField = 'timestatus_code'
              DataBinding.DataSource = dmTimeAttendance.dscDtrUndertimePM
              Enabled = False
              Properties.KeyFieldNames = 'timestatus_code'
              Properties.ListColumns = <
                item
                  FieldName = 'timestatus_name'
                end>
              Properties.ListOptions.ColumnSorting = False
              Properties.ListOptions.GridLines = glNone
              Properties.ListOptions.ShowHeader = False
              Properties.ListSource = dmTimeAttendance.dscTimeStatus
              Style.LookAndFeel.NativeStyle = True
              StyleDisabled.Color = clWhite
              StyleDisabled.LookAndFeel.NativeStyle = True
              StyleDisabled.TextColor = clGray
              StyleFocused.LookAndFeel.NativeStyle = True
              StyleHot.LookAndFeel.NativeStyle = True
              TabOrder = 14
              Visible = False
              Width = 254
            end
            object chbPaidUndertimePM: TcxDBCheckBox
              Left = 31
              Top = 268
              Caption = 'Paid undertime'
              DataBinding.DataField = 'is_paid'
              DataBinding.DataSource = dmTimeAttendance.dscDtrUndertimePM
              Enabled = False
              Properties.Alignment = taLeftJustify
              Properties.DisplayChecked = '1'
              Properties.DisplayUnchecked = '0'
              Properties.DisplayGrayed = '0'
              Properties.ImmediatePost = True
              Properties.NullStyle = nssUnchecked
              Properties.ValueChecked = '1'
              Properties.ValueGrayed = '0'
              TabOrder = 15
              Visible = False
              Width = 249
            end
          end
        end
      end
    end
  end
  inherited ilBaseMain: TcxImageList
    FormatVersion = 1
    DesignInfo = 30933744
    ImageInfo = <
      item
        Image.Data = {
          36040000424D3604000000000000360000002800000010000000100000000100
          2000000000000004000000000000000000000000000000000000000000000000
          0007000000180000001A0000001A0000001A0000001A0000001A0000001A0000
          001A0000001A0228009E034400D10228009E0000000700000000000000000505
          01690C0C03870C0C03870C0C03870C0C03870C0C03870C0C03870C0C03870C0C
          03870C0C03870C6301E72ADF19FF0C6301E70505016900000000000000000E0E
          0681F9F9E9FFF3F3E2FFF3F3E2FFF3F3E2FFF3F3E2FFF3F3E2FFF3F3E2FF6BB8
          5CFF3AA12DFF3AA12DFF3CE22BFF3CA22EFF0F6A02E604320099000000001111
          097AF4F4E4FFAAAA99FFE8E8D8FFE8E8D8FFE8E8D8FFE8E8D8FFE8E8D8FF3AA6
          2AFF51E740FF51E740FF51E740FF51E740FF51E740FF0A5E00CC000000001212
          0A77F5F5E6FFEAEADBFFEAEADBFFEAEADBFFEAEADBFFEAEADBFFEAEADBFF67BC
          57FF3CAD2BFF3CAD2BFF65EB54FF3EAF2DFF137703E406380099000000001212
          0A75F6F6E9FFE6A887FFE7AB89FFE7AB89FFE7AC8CFFE3A990FFD8987CFFD289
          6EFFE1A181FF3DA51BFF74EE63FF40B42EFF12120A7500000000000000001212
          0B73F7F7EBFFDA8E74FFDD977AFFE1A383FFE3AC91FFE3BCB5FFE2BDB6FFD6A0
          85FFC87D64FF5F9D2BFF3DA91AFF70CA5FFF12120B7300000000000000001313
          0C72F8F8EEFFD58E74FFD28A70FFCF866CFFD49C84FFDBB9B2FFDBBCB9FFD4A6
          91FFC17B60FFBD745AFFC78467FFF8F8EEFF13130C7200000000000000001313
          0C70F9F9F1FFD19179FFD49A83FFD19377FFCE9275FFD1A48FFFD0A793FFC58C
          6FFFB9735AFFB66F56FFB46D54FFF9F9F1FF13130C7000000000000000001313
          0C6EFBFBF4FFD19F81FFD7AB90FFD6A98DFFD3A487FFD09E81FFCD997AFFCC95
          73FFC48968FFAD6950FFAA674EFFFBFBF4FF13130C6E00000000000000001414
          0C6DFCFCF7FFC89677FFD1A68DFFD1A68CFFD0A48BFFCFA388FFCDA084FFCC9D
          81FFCA9A7CFFC69375FFB3785CFFFCFCF7FF14140C6D00000000000000001414
          0C6BFDFDF9FFBA8160FFC18C6EFFC28D6FFFC28D6FFFC28D6FFFC18D6DFFC18B
          6CFFC08A6AFFBE8867FFB87D5CFFFDFDF9FF14140C6B00000000000000001414
          0D6AFEFEFCFFFCFCFAFFFCFCFAFFFCFCFAFFFCFCFAFFFCFCFAFFFCFCFAFFFCFC
          FAFFFCFCFAFFFCFCFAFFFCFCFAFFFEFEFCFF14140D6A00000000000000001414
          0D68FFFFFEFFBFBFA9FFFEFEFDFFFEFEFDFFFEFEFDFFFEFEFDFFFEFEFDFFFEFE
          FDFFFEFEFDFFFEFEFDFFBFBFA9FFFFFFFEFF14140D6800000000000000001414
          0D67FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF14140D6700000000000000000B0B
          074D14140D6614140D6614140D6614140D6614140D6614140D6614140D661414
          0D6614140D6614140D6614140D6614140D660B0B074D00000000}
        Mask.Data = {
          7E000000424D7E000000000000003E0000002800000010000000100000000100
          010000000000400000000000000000000000020000000000000000000000FFFF
          FF00000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000}
      end
      item
        Image.Data = {
          36040000424D3604000000000000360000002800000010000000100000000100
          20000000000000040000000000000000000000000000000000003A20108F5D35
          1AB5A05B2DEEB76734FFB56734FFB46633FFB26533FFB06432FFAE6332FFAC62
          31FFAA6131FFA96031FFA85F30FFA55F30FE94552BF163391DC48D4F27DEEBC6
          ADFFEAC5ADFFFEFBF8FFFEFBF8FFFEFBF8FFFEFBF8FFFEFBF8FFFEFBF8FFFEFB
          F8FFFEFBF8FFFEFBF8FFFEFBF8FFC89A7BFFC79878FF90522AEDB86A36FEEDCA
          B3FFE0A279FFFEFAF7FF61C088FF61C088FF61C088FF61C088FF61C088FF61C0
          88FF61C088FF61C088FFFDF9F6FFCA8D64FFC99B7BFFA55F30FEBB6B37FFEECC
          B6FFE1A279FFFEFAF7FFBFDCC2FFBFDCC2FFBFDCC2FFBFDCC2FFBFDCC2FFBFDC
          C2FFBFDCC2FFBFDCC2FFFDF9F6FFCD9067FFCC9E81FFA86031FFBB6A37FFEFCE
          B8FFE1A278FFFEFAF7FF61C088FF61C088FF61C088FF61C088FF61C088FF61C0
          88FF61C088FF61C088FFFDF9F6FFCF9369FFCEA384FFAA6031FFBA6935FFEFD0
          BBFFE2A279FFFEFBF8FFFEFBF8FFFEFBF8FFFEFBF8FFFEFBF8FFFEFBF8FFFEFB
          F8FFFEFBF8FFFEFBF8FFFEFBF8FFD3966CFFD2A78AFFAB6131FFBB6935FFF0D2
          BEFFE2A379FFE2A379FFE1A379FFE2A37AFFE1A37AFFE0A177FFDE9F76FFDD9F
          75FFDC9D73FFD99B71FFD89970FFD6996FFFD5AB8EFFAD6232FFBB6935FFF2D5
          C2FFE3A379FFE3A379FFE2A37AFFE2A37AFFE2A47AFFE1A278FFE0A177FFDEA0
          76FFDE9E74FFDC9D73FFDA9B72FFD99B72FFDAB095FFAF6332FFBB6935FFF2D8
          C5FFE3A47AFFE3A379FFE3A479FFE2A47AFFE2A37AFFE1A37AFFE1A278FFDFA0
          76FFDE9F75FFDD9E73FFDB9C71FFDC9D73FFDDB59AFFB16433FFBB6A35FFF4D9
          C7FFE6A67CFFC88C63FFC98D64FFC98E66FFCB926BFFCB926CFFCA9068FFC88C
          64FFC88C63FFC88C63FFC88C63FFDA9C73FFE1BA9FFFB36533FFB96A35FEF4DC
          C9FFE7A77CFFF9ECE1FFF9ECE1FFF9EDE3FFFCF4EEFFFDFAF7FFFDF7F3FFFAED
          E5FFF7E7DBFFF7E5D9FFF6E5D8FFDEA076FFE4BEA4FFB46633FFB46633FAF5DD
          CCFFE7A87DFFFAF0E8FFFAF0E8FFC98D65FFFAF0E9FFFDF8F3FFFEFAF8FFFCF4
          EFFFF9E9DFFFF7E7DBFFF7E5D9FFE0A277FFE7C2A9FFB66734FFA65E2FF0F6DF
          D0FFE8A87DFFFCF6F1FFFCF6F1FFC88C63FFFAF1E9FFFBF4EEFFFDFAF7FFFDF9
          F6FFFAF0E8FFF8E8DDFFF7E6DBFFE1A379FFEFD5C3FFB56834FE874C26D8F6DF
          D1FFE9AA80FFFEFAF6FFFDFAF6FFC88C63FFFBF3EEFFFBF1EAFFFCF6F2FFFEFB
          F8FFFCF6F1FFF9ECE2FFF8E7DBFFEED0BAFFECD0BDFFB1693AF84527139BF6E0
          D1FFF7E0D1FFFEFBF8FFFEFBF7FFFDF9F6FFFCF5F0FFFAF0EAFFFBF2EDFFFDF9
          F6FFFDFAF7FFFBF1EBFFF6E7DDFEE4C9B7FBAC7550EC1B0F086324140A713B21
          1090784422CCA35C2EEEB46633FAB96A35FEBB6A35FFBB6935FFBB6935FFBC6B
          38FFBD6D3AFFBB6C39FFA45D30EF764626CB130B055400000000}
        Mask.Data = {
          7E000000424D7E000000000000003E0000002800000010000000100000000100
          010000000000400000000000000000000000020000000000000000000000FFFF
          FF00000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000}
      end
      item
        Image.Data = {
          36040000424D3604000000000000360000002800000010000000100000000100
          2000000000000004000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000B07
          07469A6C6CF37A5A59D33B27259C181010650503032F00000003000000000000
          000000000000000000000000000000000000000000000000000000000000140D
          0D5ED0A9A7FEFFFFFFFF98A9FFFFF0D8D4FFD3B1B3FFAA8889F3644545C02F1E
          1E890906063A0000000000000000000000000000000000000000000000001B12
          126DD7B1ADFEFFF7E0FF99A3E8FFFFF1D8FFF9E1CEFFFFECDDFFFFF5F1FFFAE6
          E7FF422B2BA20000000000000000000000000000000000000000000000002418
          187BDEBAB2FEFFF6DDFF9DA5E8FFF8E3D0FFD6C9C6FFFFF7F3FFFFEBDDFFFFE0
          CDFF3121218B0000000000000000000000000000000000000000000000002D1D
          1D89E6C6C4FEFFFEF4FFA0B1FDFFF0E7E2FF414A52FF777069FFB6B28DFFFED9
          CAFF241718740000000000000000000000000000000000000000000000003825
          2597EFD2D0FEFFFAE9FFA3ACEBFFFFF4DDFF659EA8FF23A941FF129A2AFF357C
          31FF180F105D000000000000000000000000000000000000000000000000432D
          2DA5F5D8CFFEFFF6E0FFA4AEEAFFFFF4E0FF4DBB71FF61FF96FF51E17AFF1D9C
          32FF003001A20000000100000000000000000000000000000000000000005338
          38B3F9E3DDFEFFFDEFFFA8B7F5FFFFFBF5FF99D9A4FF3ADC6BFF63FE96FF4CDA
          73FF1D962EFF0125028B00000000000000000000000000000000000000006647
          47C2FBEAE7FEFFFFF4FFAABAF5FFFFF8E9FFFFF4EEFF63CF86FF49E778FF62FB
          95FF48D36BFF158E24FE001B0076000000000000000000000000000000007A56
          57D0FDEADDFEFFFAE2FFB0BBEEFFFFF8DFFFFFF2E0FFFFEFDFFF4ACD70FF54F3
          86FF5CFE90FF5AA168FF6D6D66FE1616146F0000000000000000000000009368
          68DEE0D9DBFDE2E4E3FFA8B3D6FFB3B4B3FFA1A2A3FFA6A2A4FFACAEADFF24C0
          55FF8ABF99FFDFD4D2FF6976C1FF1523B1FC00000C450000000000000000AB7C
          7CECC0B6B5FD817D81FF68646BFF6C6160FF908080FF887777FE766262EF374B
          3BE4CDC4BFFA7892F3FF3761F2FF1E35C7FF000077E100000000000000003E30
          30A74D3C3CB8332F2FC23E3C3CDF424141E1343232C8353535CB393939CD0F0F
          0E6D1A1C276C2A4FE4FE426BF4FF1524B8FF00004CB500000000000000000303
          03282C2D2DB21F1F1F94121212710A0A0A540505053B010101240000000D0000
          000000000000050831820B1299F200004AB30000001400000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000}
        Mask.Data = {
          7E000000424D7E000000000000003E0000002800000010000000100000000100
          010000000000400000000000000000000000020000000000000000000000FFFF
          FF00000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000}
      end
      item
        Image.Data = {
          36040000424D3604000000000000360000002800000010000000100000000100
          2000000000000004000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000E00000014000000190000001900000016000000100000000B000000080000
          0007000000080000000B0000000E000000110000001300000000000000000000
          001C0000065E000038CC00002FBC0000014200000020000000160000000F0000
          000D00000010000000150000001B000001380000034C00000000000000000000
          000000003CCC1010D9FE0A0A96EC00001C8B0000000000000000000000000000
          0000000000000000000000000000000013730000023200000000000000000000
          000000001E8C080880E51111DDFF010151D30000043300000000000000000000
          0000000000000000000000001B8400001D890000000400000000000000000000
          00000000011F000046CC1414CAFB0F0FB3F4000036B400000011000000000000
          00000000000000001C82000038B8000007410000000000000000000000000000
          0000000000000000126709096FDC1616CCFF0B0B82E500001975000000000000
          00000000259102025FD500002086000000000000000000000000000000000000
          0000000000000000000000002891101086E51C1CBBFD04045FD4000012630000
          3AAE07076EDC00003FB600000000000000000000000000000000000000000000
          000000000000000000000000001500003FB015158AE72020ACF904045FD20F0F
          7BE103035FD20000000000000000000000000000000000000000000000000000
          00000000000000000000000000000000053300005ACC2C2CAAF33030B4FA0505
          68D4000000000000000000000000000000000000000000000000000000000000
          0000000000000000053300002B8A00005FCC3838B2EE4F4FD5FD1F1F91E32525
          96E3000047B10000011800000000000000000000000000000000000000000000
          000000001966000064CC2B2BA2E56161EAFF5353DAFA0F0F7BD6000006330505
          419F1E1E8FDD00004EB40000021F000000000000000000000000000000000000
          0000000069CC7373FCFF6A6AF2FE2A2AA5E5000069CC00000000000000000000
          000000002F8904046ECF00005ABD00000D4A0000000100000000000000000000
          000000000D4800006CCC00006CCC000037930000000000000000000000000000
          0000000000000000042B0000297E000050B000001B6600000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000}
        Mask.Data = {
          7E000000424D7E000000000000003E0000002800000010000000100000000100
          010000000000400000000000000000000000020000000000000000000000FFFF
          FF00000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000}
      end
      item
        Image.Data = {
          36040000424D3604000000000000360000002800000010000000100000000100
          2000000000000004000000000000000000000000000000000000000000090000
          00160000001A0000001A0000001A0000001A0000001A0000001A0000001A0000
          001A0000001A0000001A0000001A0000001A0000001600000009000000120000
          003300001383000032BC00003ACC00003ACC00003ACC00003ACC00003ACC0000
          3ACC00003ACC00003ACC000032BC000013830000003300000012000000000000
          167306066DDD0F0FC2F91010D9FF1010D9FF1010D9FF1010D9FF1010D9FF1010
          D9FF1010D9FF1010D9FF0E0EC2F905056DDD0000167300000000000000000000
          42BA1414C1F91212D2FF1616D4FF0D0DA4EF03036DD9010158CF010158CF0303
          6DD90A0AA4EF1010D1FF1010D1FF0E0EBEF9000042BA00000000000000000000
          54CC1D1DCFFF1F1FD0FF0B0B86E4000038AA0000073F0000000F0000000F0000
          1E7C000051CC1010C8FF1010C8FF1010C8FF000054CC00000000000000000000
          57CC2F2FD1FF1C1CA2EF000038AA00000013000000000000000000000A480000
          51CC1717C2FF000051CC0C0C98EF1111BEFF000057CC00000000000000000000
          5ACC4B4BDBFF0B0B6DD90000073F000000000000000000000A48000051CC2222
          C1FF000051CC00001E7C050568D91818BAFF00005ACC00000000000000000000
          5DCC5F5FE8FF040458CF0000000F0000000000000A48000051CC3030C4FF0000
          51CC00000A480000000F010156CF2424BBFF00005DCC00000000000000000000
          5FCC6666EFFF040458CF0000000F00000A48000051CC3F3FCDFF000051CC0000
          0A48000000000000000F010157CF3131BFFF00005FCC00000000000000000000
          62CC6A6AF3FF151572D900001E7C000051CC5B5BE5FF000051CC00000A480000
          0000000000000000073F0B0B69D94040CAFF000062CC00000000000000000000
          64CC6A6AF3FF4545BAEF141472D96A6AF3FF000051CC00000A48000000000000
          000000000013000038AA3939AFEF5858E1FF000064CC00000000000000000000
          68CC6161EAFF6C6CF5FF7272FBFF141472D900001E7C0000000F0000000F0000
          073F000038AA292993E46262EBFF5B5BE4FF000068CC00000000000000000000
          57BA5B5BE0F95A5AE3FF7070F9FF4949BFEF161676D9040459CF040459CF1616
          75D94646BDEF6C6CF5FF5D5DE6FF5656DCF9000057BA00000000000000000000
          22731F1F95DD5E5EE3F96C6CF5FF7474FDFF7676FFFF7676FFFF7676FFFF7575
          FEFF7272FBFF6C6CF5FF5D5DE2F91F1F94DD0000227300000000000000000000
          000C0000227300005ABA00006DCC00006DCC00006DCC00006DCC00006DCC0000
          6DCC00006DCC00006DCC00005ABA000022730000000C00000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000}
        Mask.Data = {
          7E000000424D7E000000000000003E0000002800000010000000100000000100
          010000000000400000000000000000000000020000000000000000000000FFFF
          FF00000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000}
      end
      item
        Image.Data = {
          36040000424D3604000000000000360000002800000010000000100000000100
          2000000000000004000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000090000
          00160000001A0000001A0000001A0000001A0000001A0000001A0000001A0000
          001A0000001A0000001A0000001A0000001A00000016000000093919105CCA56
          39E0E96341FFE96341FFE96341FFE96341FFE96341FFE96341FFE96341FFE963
          41FFE96341FFE96341FFE96341FFE96341FFCA5639E03919105CC05133DEF3C4
          BAFFFCECECFFFCECECFFFCECECFFFCECECFFFCECECFFFCECECFFFCECECFFFCEC
          ECFFFBE9E8FFF4C1B5FFEB9781FFF6C4B7FFF0A693FFC05133DECF5533FFF6EA
          EAFFF5E7E7FFF5E7E7FFF5E7E7FFFBF4F4FFF5E7E7FFF5E7E7FFF5E7E7FFF5E7
          E7FFF5E7E7FFF5E4E3FFE18B73FFF2C1B4FFF2C1B4FFCF5533FFC14D2BFFF0ED
          EDFFECE2E2FFECE2E2FFF7F1F1FFEE6644FFECE2E2FFECE2E2FFECE2E2FFECE2
          E2FFECE2E2FFECE2E2FFD7866EFFEDBEB0FFEDBEB0FFC14D2BFFB54725FFF2F2
          F2FFEAE6E6FFF2EEEEFFEE6644FFB54725FFF2EEEEFFF2EEEEFFF2EEEEFFF2EE
          EEFFF2EEEEFFE3DCDCFFCE8069FFE8BAADFFE8BAADFFB54725FFAD4422FFF3F3
          F3FFF7F7F7FFEE6644FFAD4422FFAD4422FFEE6644FFEE6644FFEE6644FFEE66
          44FFEE6644FFDBD6D6FFC87D66FFE3B7A9FFE3B8AAFFAD4422FFAB4523FFF5F5
          F5FFEE6644FFAB4523FFAB4523FFAB4523FFAB4523FFAB4523FFAB4523FFAB45
          23FFAB4523FFD3D1D1FFC47C64FFDEB4A6FFE0B6A9FFAB4523FFB04C2AFFF7F7
          F7FFE9DDD8FFB04C2AFFB04C2AFFB04C2AFFB04C2AFFB04C2AFFB04C2AFFB04C
          2AFFB04C2AFFCECECEFFC78068FFE1B7AAFFE8BFB2FFB04C2AFFBA5735FFF9F9
          F9FFF4F4F4FFEDE0DCFFBA5735FFBA5735FFF4F4F4FFF4F4F4FFF4F4F4FFF4F4
          F4FFF4F4F4FFF4F4F4FFD69078FFF2C9BCFFF3CBBDFFBA5735FFC86442FFFCFC
          FCFFF8F8F8FFF8F8F8FFF2E6E1FFC86442FFF8F8F8FFF8F8F8FFF8F8F8FFF8F8
          F8FFF8F8F8FFF8F8F8FFDE9880FFF4CCBEFFF6CDBFFFC86442FFD77250FFFEFE
          FEFFFCFCFCFFFCFCFCFFFCFCFCFFFCFCFCFFFCFCFCFFFCFCFCFFFCFCFCFFFCFC
          FCFFFCFCFCFFFCF9F8FFE69F88FFF7CEC0FFF8CFC1FFD77250FFC66E50DEF8DA
          D1FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFEFCFBFFF7D5CAFFEFAC95FFF8CFC2FFF3B8A5FFC66E50DE4D2C2153CE76
          58DEED8765FFED8765FFED8765FFED8765FFED8765FFED8765FFED8765FFED87
          65FFED8765FFED8765FFED8765FFED8765FFCE7658DE4D2C2153000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000}
      end>
  end
end
