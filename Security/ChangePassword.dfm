inherited fChangePassword: TfChangePassword
  Caption = 'fChangePassword'
  ExplicitWidth = 320
  ExplicitHeight = 240
  PixelsPerInch = 96
  TextHeight = 14
  inherited pcMaster: TJvPageControl
    inherited tsMaster: TTabSheet
      Caption = 'Change Password'
      ExplicitLeft = 4
      ExplicitTop = 25
      ExplicitWidth = 860
      ExplicitHeight = 514
      inherited pDetails: TJvPanel
        inherited ghAction: TJvGroupHeader
          Left = 16
          ExplicitLeft = 16
        end
        object JvGroupHeader1: TJvGroupHeader [1]
          Left = 27
          Top = 17
          Width = 319
          Height = 19
          Caption = 'User details'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clHighlight
          Font.Height = -12
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object JvLabel4: TJvLabel [2]
          Left = 43
          Top = 39
          Width = 56
          Height = 14
          Caption = 'Username'
          Transparent = True
          HotTrackFont.Charset = DEFAULT_CHARSET
          HotTrackFont.Color = clWindowText
          HotTrackFont.Height = -11
          HotTrackFont.Name = 'Tahoma'
          HotTrackFont.Style = []
        end
        object JvLabel5: TJvLabel [3]
          Left = 43
          Top = 65
          Width = 75
          Height = 14
          Caption = 'Old Password'
          Transparent = True
          HotTrackFont.Charset = DEFAULT_CHARSET
          HotTrackFont.Color = clWindowText
          HotTrackFont.Height = -11
          HotTrackFont.Name = 'Tahoma'
          HotTrackFont.Style = []
        end
        object JvLabel1: TJvLabel [4]
          Left = 43
          Top = 91
          Width = 82
          Height = 14
          Caption = 'New Password'
          Transparent = True
          HotTrackFont.Charset = DEFAULT_CHARSET
          HotTrackFont.Color = clWindowText
          HotTrackFont.Height = -11
          HotTrackFont.Name = 'Tahoma'
          HotTrackFont.Style = []
        end
        object JvLabel2: TJvLabel [5]
          Left = 43
          Top = 117
          Width = 43
          Height = 14
          Caption = 'Confirm'
          Transparent = True
          HotTrackFont.Charset = DEFAULT_CHARSET
          HotTrackFont.Color = clWindowText
          HotTrackFont.Height = -11
          HotTrackFont.Name = 'Tahoma'
          HotTrackFont.Style = []
        end
        inherited bNew: TcxButton [6]
          Left = 43
          TabOrder = 6
          Visible = False
          ExplicitLeft = 43
        end
        inherited bDelete: TcxButton [7]
          Left = 133
          TabOrder = 5
          Visible = False
          ExplicitLeft = 133
        end
        inherited gList: TcxGrid [8]
          Top = -11
          Height = 8
          TabOrder = 8
          TabStop = False
          ExplicitTop = -11
          ExplicitHeight = 8
        end
        inherited bSave: TcxButton [9]
          Left = 43
          LookAndFeel.SkinName = ''
          TabOrder = 3
          ExplicitLeft = 43
        end
        inherited bCancel: TcxButton [10]
          Left = 131
          TabOrder = 4
          ExplicitLeft = 131
        end
        object edUsername: TcxDBTextEdit
          Left = 138
          Top = 33
          TabStop = False
          DataBinding.DataField = 'username'
          DataBinding.DataSource = dmSecurity.dscUser
          Enabled = False
          Properties.CharCase = ecLowerCase
          TabOrder = 7
          Width = 208
        end
        object edNewPassword: TcxTextEdit
          Left = 138
          Top = 85
          Properties.EchoMode = eemPassword
          Properties.MaxLength = 15
          TabOrder = 1
          Width = 208
        end
        object edConfirmPassword: TcxTextEdit
          Left = 138
          Top = 111
          Properties.EchoMode = eemPassword
          Properties.MaxLength = 15
          TabOrder = 2
          Width = 208
        end
        object edOldPassword: TcxTextEdit
          Left = 138
          Top = 59
          TabStop = False
          Properties.EchoMode = eemPassword
          Properties.MaxLength = 15
          TabOrder = 0
          Width = 208
        end
      end
    end
  end
  inherited ppList: TPopupMenu
    Left = 824
    Top = 56
  end
  inherited ilBaseTab: TcxImageList
    FormatVersion = 1
    DesignInfo = 1573688
  end
end
