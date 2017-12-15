inherited fTimeLogMain: TfTimeLogMain
  Caption = 'fTimeLogMain'
  PixelsPerInch = 96
  TextHeight = 14
  inherited pMaster: TJvPanel
    BorderWidth = 1
    inherited pcMain: TJvPageControl
      Left = 1
      Top = 1
      Width = 1022
      Height = 538
      ExplicitLeft = 1
      ExplicitTop = 1
      ExplicitWidth = 1022
      ExplicitHeight = 538
      inherited TabSheet1: TTabSheet
        Caption = 'Timelog Management'
        ExplicitWidth = 1014
        ExplicitHeight = 509
        inherited pDetails: TJvPanel
          Width = 1014
          Height = 509
          ExplicitWidth = 1014
          ExplicitHeight = 509
          inherited JvGroupHeader1: TJvGroupHeader
            Caption = 'Timelog Summary'
          end
          inherited ghAction: TJvGroupHeader
            Top = 415
            ExplicitTop = 415
          end
          object Label1: TLabel [3]
            Left = 61
            Top = 438
            Width = 52
            Height = 14
            Caption = 'Complete'
          end
          object Label2: TLabel [4]
            Left = 147
            Top = 438
            Width = 62
            Height = 14
            Caption = 'Incomplete'
          end
          object Label3: TLabel [5]
            Left = 646
            Top = 395
            Width = 20
            Height = 14
            Caption = 'AM'
            Font.Charset = ANSI_CHARSET
            Font.Color = clGray
            Font.Height = -12
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label5: TLabel [6]
            Left = 764
            Top = 395
            Width = 19
            Height = 14
            Caption = 'PM'
            Font.Charset = ANSI_CHARSET
            Font.Color = clGray
            Font.Height = -12
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object lblEmployeeName: TLabel [7]
            Left = 43
            Top = 395
            Width = 4
            Height = 14
            Font.Charset = ANSI_CHARSET
            Font.Color = clGray
            Font.Height = -12
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object lblDate: TLabel [8]
            Left = 488
            Top = 395
            Width = 4
            Height = 14
            Font.Charset = ANSI_CHARSET
            Font.Color = clBlack
            Font.Height = -12
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label4: TLabel [9]
            Left = 239
            Top = 439
            Width = 57
            Height = 14
            Caption = 'Undertime'
          end
          object Label7: TLabel [10]
            Left = 147
            Top = 458
            Width = 89
            Height = 14
            Caption = 'Approved Leave'
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
          end
          object Label6: TLabel [11]
            Left = 61
            Top = 458
            Width = 38
            Height = 14
            Caption = 'Holiday'
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
          end
          object Label8: TLabel [12]
            Left = 900
            Top = 53
            Width = 46
            Height = 14
            Caption = 'U/T AM'
            Color = clBtnFace
            Font.Charset = ANSI_CHARSET
            Font.Color = clGray
            Font.Height = -12
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentColor = False
            ParentFont = False
          end
          object Label9: TLabel [13]
            Left = 900
            Top = 121
            Width = 45
            Height = 14
            Caption = 'U/T PM'
            Font.Charset = ANSI_CHARSET
            Font.Color = clGray
            Font.Height = -12
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label10: TLabel [14]
            Left = 328
            Top = 438
            Width = 46
            Height = 14
            Caption = 'Override'
          end
          object lblUTimeStatusAM: TLabel [15]
            Left = 900
            Top = 97
            Width = 4
            Height = 14
            Caption = '-'
            Color = clBtnFace
            Font.Charset = ANSI_CHARSET
            Font.Color = clBlack
            Font.Height = -12
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentColor = False
            ParentFont = False
          end
          object lblUTimeStatusPM: TLabel [16]
            Left = 900
            Top = 165
            Width = 4
            Height = 14
            Caption = '-'
            Color = clBtnFace
            Font.Charset = ANSI_CHARSET
            Font.Color = clBlack
            Font.Height = -12
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentColor = False
            ParentFont = False
          end
          object lblDuplicateLogs: TLabel [17]
            Left = 900
            Top = 395
            Width = 75
            Height = 14
            Alignment = taRightJustify
            Caption = 'Duplicate logs'
            Font.Charset = ANSI_CHARSET
            Font.Color = clMenuHighlight
            Font.Height = -12
            Font.Name = 'Tahoma'
            Font.Style = [fsUnderline]
            ParentFont = False
            OnClick = lblDuplicateLogsClick
          end
          inherited grCalendar: TAdvStringGrid
            OnDblClickCell = grCalendarDblClickCell
            OnAnchorClick = grCalendarAnchorClick
            OnSelectionChanged = grCalendarSelectionChanged
            Balloon.BackgroundColor = clInfoBk
            URLColor = clBlack
            URLUnderlineOnHover = True
          end
          inherited cmbMonth: TcxComboBox
            Properties.OnChange = nil
          end
          inherited btnPrevMonth: TcxButton
            LookAndFeel.SkinName = ''
          end
          inherited btnNextMonth: TcxButton
            LookAndFeel.SkinName = ''
          end
          object Panel1: TPanel
            Left = 43
            Top = 439
            Width = 12
            Height = 12
            Color = clMoneyGreen
            ParentBackground = False
            TabOrder = 6
          end
          object Panel2: TPanel
            Left = 129
            Top = 439
            Width = 12
            Height = 12
            Color = 8421631
            ParentBackground = False
            TabOrder = 7
          end
          object teTimeInAM: TcxTextEdit
            Left = 673
            Top = 389
            Properties.ReadOnly = True
            Style.BorderColor = clSilver
            Style.Color = clMenu
            StyleDisabled.BorderColor = clSilver
            TabOrder = 8
            Width = 40
          end
          object teTimeOutAM: TcxTextEdit
            Left = 716
            Top = 389
            Properties.ReadOnly = True
            Style.BorderColor = clSilver
            Style.Color = clMenu
            StyleDisabled.BorderColor = clSilver
            TabOrder = 9
            Width = 40
          end
          object teTimeInPM: TcxTextEdit
            Left = 790
            Top = 389
            Properties.ReadOnly = True
            Style.BorderColor = clSilver
            Style.Color = clMenu
            StyleDisabled.BorderColor = clSilver
            TabOrder = 10
            Width = 40
          end
          object teTimeOutPM: TcxTextEdit
            Left = 833
            Top = 389
            Properties.ReadOnly = True
            Style.BorderColor = clSilver
            Style.Color = clMenu
            StyleDisabled.BorderColor = clSilver
            TabOrder = 11
            Width = 40
          end
          object Panel3: TPanel
            Left = 221
            Top = 440
            Width = 12
            Height = 12
            Color = 16744576
            ParentBackground = False
            TabOrder = 12
          end
          object Panel4: TPanel
            Left = 129
            Top = 460
            Width = 12
            Height = 12
            Color = 16756318
            ParentBackground = False
            TabOrder = 13
          end
          object Panel5: TPanel
            Left = 43
            Top = 460
            Width = 12
            Height = 12
            Color = 4079359
            ParentBackground = False
            TabOrder = 14
          end
          object cbxShowPendingOnly: TcxCheckBox
            Left = 684
            Top = 431
            Caption = 'Show pending undertime only'
            TabOrder = 15
            OnClick = cbxShowPendingOnlyClick
            Width = 189
          end
          object teUTimeFromAM: TcxTextEdit
            Left = 900
            Top = 73
            Properties.ReadOnly = True
            Style.BorderColor = clSilver
            Style.Color = clMenu
            StyleDisabled.BorderColor = clSilver
            TabOrder = 16
            Width = 40
          end
          object teUTimeUntilAM: TcxTextEdit
            Left = 943
            Top = 73
            Properties.ReadOnly = True
            Style.BorderColor = clSilver
            Style.Color = clMenu
            StyleDisabled.BorderColor = clSilver
            TabOrder = 17
            Width = 40
          end
          object teUTimeFromPM: TcxTextEdit
            Left = 900
            Top = 141
            Properties.ReadOnly = True
            Style.BorderColor = clSilver
            Style.Color = clMenu
            StyleDisabled.BorderColor = clSilver
            TabOrder = 18
            Width = 40
          end
          object teUTimeUntilPM: TcxTextEdit
            Left = 943
            Top = 141
            Properties.ReadOnly = True
            Style.BorderColor = clSilver
            Style.Color = clMenu
            StyleDisabled.BorderColor = clSilver
            TabOrder = 19
            Width = 40
          end
          object Panel6: TPanel
            Left = 310
            Top = 440
            Width = 12
            Height = 12
            Color = 7321599
            ParentBackground = False
            TabOrder = 20
          end
        end
      end
    end
  end
  inherited pStatus: TPanel
    Top = 10
    ExplicitTop = 10
  end
  inherited ilBaseMain: TcxImageList
    FormatVersion = 1
    DesignInfo = 32506848
  end
end
