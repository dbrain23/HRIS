inherited fPayrollDrawer: TfPayrollDrawer
  Caption = 'fPayrollDrawer'
  ClientHeight = 442
  ClientWidth = 913
  OnCreate = FormCreate
  OnShow = FormShow
  ExplicitWidth = 929
  ExplicitHeight = 481
  PixelsPerInch = 96
  TextHeight = 14
  object pDock: TPanel
    Left = 201
    Top = 0
    Width = 712
    Height = 442
    Align = alClient
    BevelOuter = bvNone
    BorderWidth = 1
    Color = clMenu
    ParentBackground = False
    TabOrder = 0
  end
  object pLeft: TPanel
    Left = 0
    Top = 0
    Width = 201
    Height = 442
    Align = alLeft
    BevelOuter = bvNone
    BorderWidth = 1
    TabOrder = 1
    object tvPayroll: TcxTreeView
      Left = 1
      Top = 1
      Width = 199
      Height = 136
      Align = alTop
      ParentFont = False
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -12
      Style.Font.Name = 'Tahoma'
      Style.Font.Style = []
      Style.IsFontAssigned = True
      StyleDisabled.Color = clMenu
      TabOrder = 0
      Items.NodeData = {
        030500000036000000FFFFFFFF65000000FFFFFFFFFFFFFFFF00000000000000
        0000000000010C50006100790072006F006C006C0020004D00610069006E0054
        0000000000000066000000FFFFFFFFFFFFFFFF00000000000000000000000001
        1B57002F00540061007800200044006500700065006E00640065006E00740073
        00200043006C00610069006D0020004C006900730074002E0000000000000067
        000000FFFFFFFFFFFFFFFF000000000000000000000000010850006100790073
        006C00690070007300320000000000000068000000FFFFFFFFFFFFFFFF000000
        000000000000000000010A44006500640075006300740069006F006E0073002C
        0000000000000000000000FFFFFFFFFFFFFFFF00000000000000000200000001
        075200650070006F007200740073004000000000000000C9000000FFFFFFFFFF
        FFFFFF000000000000000000000000011144006500640075006300740069006F
        006E002000530075006D006D006100720079002E00000000000000CA000000FF
        FFFFFFFFFFFFFF0000000000000000000000000108560061007200690061006E
        0063006500}
      ReadOnly = True
      OnChange = tvPayrollChange
    end
    object pFilter: TPanel
      Left = 1
      Top = 137
      Width = 199
      Height = 304
      Align = alClient
      BevelOuter = bvNone
      ParentBackground = False
      TabOrder = 1
      object gbFilter: TJvGroupBox
        Left = 0
        Top = 0
        Width = 199
        Height = 304
        Align = alClient
        Caption = ''
        TabOrder = 0
        DesignSize = (
          199
          304)
        object lblPeriod: TLabel
          Left = 8
          Top = 7
          Width = 34
          Height = 14
          Caption = 'Period'
        end
        object lblResourceTypes: TLabel
          Left = 8
          Top = 54
          Width = 116
          Height = 14
          Caption = 'Branch / Department'
        end
        object lblEmployee: TLabel
          Left = 8
          Top = 102
          Width = 53
          Height = 14
          Caption = 'Employee'
        end
        object cmbPayrollPeriod: TcxComboBox
          Left = 8
          Top = 27
          Properties.Items.Strings = (
            '')
          Properties.OnCloseUp = cmbPayrollPeriodPropertiesCloseUp
          StyleDisabled.Color = clMenu
          TabOrder = 0
          Width = 177
        end
        object cmbResourceTypes: TcxComboBox
          Left = 8
          Top = 74
          Anchors = [akLeft, akTop, akRight, akBottom]
          Properties.Items.Strings = (
            '')
          Properties.OnCloseUp = cmbResourceTypesPropertiesCloseUp
          StyleDisabled.Color = clMenu
          TabOrder = 1
          Width = 177
        end
        object btnGenerate: TcxButton
          Left = 8
          Top = 241
          Width = 177
          Height = 25
          Anchors = [akLeft, akBottom]
          Caption = 'Generate'
          TabOrder = 2
          OnClick = btnGenerateClick
        end
        object btnClose: TcxButton
          Left = 8
          Top = 269
          Width = 177
          Height = 25
          Anchors = [akLeft, akBottom]
          Caption = 'Close payroll'
          TabOrder = 3
          OnClick = btnCloseClick
        end
        object cmbEmployee: TcxComboBox
          Left = 8
          Top = 122
          Anchors = [akLeft, akTop, akRight, akBottom]
          Properties.Items.Strings = (
            '')
          Properties.OnCloseUp = cmbResourceTypesPropertiesCloseUp
          StyleDisabled.Color = clMenu
          TabOrder = 4
          Width = 177
        end
      end
    end
  end
  object pStatus: TPanel
    Left = 242
    Top = 380
    Width = 273
    Height = 83
    BevelOuter = bvNone
    TabOrder = 2
    Visible = False
    object shpStatus: TShape
      Left = 0
      Top = 0
      Width = 273
      Height = 83
      Align = alClient
      Brush.Color = 12058551
      Pen.Color = 43520
      Pen.Style = psInsideFrame
      Pen.Width = 2
      ExplicitLeft = 80
      ExplicitTop = 24
      ExplicitWidth = 65
      ExplicitHeight = 65
    end
    object lblStatus: TLabel
      Left = 46
      Top = 35
      Width = 184
      Height = 13
      Caption = 'Generating payroll. Please wait...'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGreen
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
    end
  end
end
