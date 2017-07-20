inherited fSysPrivilege: TfSysPrivilege
  Caption = 'fSysPrivilege'
  PixelsPerInch = 96
  TextHeight = 14
  inherited pcMaster: TJvPageControl
    inherited tsMaster: TTabSheet
      Caption = 'Privileges List'
      ExplicitLeft = 4
      ExplicitTop = 25
      ExplicitWidth = 860
      ExplicitHeight = 514
      inherited pDetails: TJvPanel
        inherited ghAction: TJvGroupHeader
          Width = 709
          ExplicitWidth = 709
        end
        object JvGroupHeader1: TJvGroupHeader [1]
          Left = 27
          Top = 17
          Width = 390
          Height = 19
          Caption = 'Active Privileges'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clHighlight
          Font.Height = -12
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        inherited bNew: TcxButton [2]
        end
        inherited bDelete: TcxButton [3]
          Left = 136
          ExplicitLeft = 136
        end
        inherited gList: TcxGrid [4]
          Top = -10
          Height = 1
          ExplicitTop = -10
          ExplicitHeight = 1
        end
        inherited bSave: TcxButton [5]
          Left = 46
          LookAndFeel.SkinName = ''
          ExplicitLeft = 46
        end
        inherited bCancel: TcxButton [6]
          Left = 135
          ExplicitLeft = 135
        end
        object clbPrivileges: TcxCheckListBox
          Left = 46
          Top = 42
          Width = 680
          Height = 314
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
          TabOrder = 5
        end
      end
    end
  end
  inherited ilBaseTab: TcxImageList
    FormatVersion = 1
  end
end
