inherited fChangePIN: TfChangePIN
  Caption = 'fChangePIN'
  ExplicitWidth = 320
  ExplicitHeight = 240
  PixelsPerInch = 96
  TextHeight = 14
  inherited pcMaster: TJvPageControl
    inherited tsMaster: TTabSheet
      Caption = 'Change PIN'
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
          Caption = 'PIN'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clHighlight
          Font.Height = -12
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object JvLabel5: TJvLabel [2]
          Left = 43
          Top = 39
          Width = 43
          Height = 14
          Caption = 'Old PIN'
          Transparent = True
          HotTrackFont.Charset = DEFAULT_CHARSET
          HotTrackFont.Color = clWindowText
          HotTrackFont.Height = -11
          HotTrackFont.Name = 'Tahoma'
          HotTrackFont.Style = []
        end
        object JvLabel1: TJvLabel [3]
          Left = 43
          Top = 65
          Width = 50
          Height = 14
          Caption = 'New PIN'
          Transparent = True
          HotTrackFont.Charset = DEFAULT_CHARSET
          HotTrackFont.Color = clWindowText
          HotTrackFont.Height = -11
          HotTrackFont.Name = 'Tahoma'
          HotTrackFont.Style = []
        end
        object JvLabel2: TJvLabel [4]
          Left = 43
          Top = 91
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
        inherited bDelete: TcxButton [5]
          Left = 132
          ExplicitLeft = 132
        end
        inherited bNew: TcxButton [6]
          Left = 42
          ExplicitLeft = 42
        end
        inherited gList: TcxGrid [7]
          Top = -11
          Height = 8
          ExplicitTop = -11
          ExplicitHeight = 8
        end
        inherited bSave: TcxButton [8]
          Left = 43
          LookAndFeel.SkinName = ''
          ExplicitLeft = 43
        end
        inherited bCancel: TcxButton [9]
          Left = 131
          ExplicitLeft = 131
        end
        object edConfirmPIN: TcxTextEdit
          Left = 138
          Top = 85
          Properties.EchoMode = eemPassword
          Properties.MaxLength = 2
          TabOrder = 5
          Width = 208
        end
        object edNewPIN: TcxTextEdit
          Left = 138
          Top = 59
          Properties.EchoMode = eemPassword
          Properties.MaxLength = 2
          TabOrder = 6
          Width = 208
        end
        object edOldPIN: TcxTextEdit
          Left = 138
          Top = 33
          TabStop = False
          Properties.EchoMode = eemPassword
          Properties.MaxLength = 2
          TabOrder = 7
          Width = 208
        end
      end
    end
  end
  inherited ilBaseTab: TcxImageList
    FormatVersion = 1
  end
end
