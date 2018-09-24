inherited frmGeneratePayroll: TfrmGeneratePayroll
  Align = alNone
  Caption = 'frmGeneratePayroll'
  ClientHeight = 319
  ClientWidth = 511
  Position = poMainFormCenter
  ExplicitWidth = 513
  ExplicitHeight = 321
  PixelsPerInch = 96
  TextHeight = 14
  inherited pnlCaption: TJvPanel
    Width = 511
    ExplicitWidth = 343
    inherited lblCaption: TLabel
      Width = 151
      Caption = 'Generate payroll options'
      ExplicitWidth = 151
    end
    inherited imgClose: TImage
      Left = 491
      ExplicitLeft = 323
    end
  end
  inherited pnlMain: TJvPanel
    Width = 511
    Height = 300
    ExplicitWidth = 343
    ExplicitHeight = 254
    object JvGroupHeader1: TJvGroupHeader
      Left = 25
      Top = 103
      Width = 369
      Height = 18
      Caption = 'Deductions'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object JvGroupHeader2: TJvGroupHeader
      Left = 25
      Top = 169
      Width = 369
      Height = 18
      Caption = 'Adjustments'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object lblEmployee: TLabel
      Left = 25
      Top = 16
      Width = 89
      Height = 14
      Caption = 'Employee: ALL'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object JvGroupHeader3: TJvGroupHeader
      Left = 25
      Top = 47
      Width = 369
      Height = 18
      Caption = 'Time and attendance'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object cbxCopyAdjustments: TcxCheckBox
      Left = 32
      Top = 187
      Hint = 'Copy from previous payroll'
      Caption = 'Copy from previous payroll'
      ParentShowHint = False
      ShowHint = True
      State = cbsChecked
      Style.Shadow = False
      TabOrder = 5
      Width = 176
    end
    object cbxComputeDeductions: TcxRadioButton
      Left = 136
      Top = 127
      Width = 98
      Height = 17
      Hint = 'Compute'
      Caption = 'Compute'
      TabOrder = 3
      GroupIndex = 2
    end
    object cbxCopyDeductions: TcxRadioButton
      Left = 232
      Top = 127
      Width = 162
      Height = 17
      Hint = 'Copy from previous payroll'
      Caption = 'Copy from previous payroll'
      TabOrder = 4
      GroupIndex = 2
    end
    object btnGenerate: TcxButton
      Left = 22
      Top = 253
      Width = 92
      Height = 25
      Anchors = [akLeft, akBottom]
      Caption = 'Generate'
      TabOrder = 6
      OnClick = btnGenerateClick
      ExplicitTop = 207
    end
    object btnCancel: TcxButton
      Left = 120
      Top = 253
      Width = 92
      Height = 25
      Anchors = [akLeft, akBottom]
      Caption = 'Cancel'
      TabOrder = 7
      OnClick = btnCancelClick
      ExplicitTop = 207
    end
    object cxRadioButton1: TcxRadioButton
      Left = 32
      Top = 127
      Width = 89
      Height = 17
      Hint = 'Copy from previous payroll'
      Caption = 'No change'
      Checked = True
      TabOrder = 2
      TabStop = True
      GroupIndex = 2
    end
    object cxRadioButton2: TcxRadioButton
      Left = 32
      Top = 71
      Width = 89
      Height = 17
      Hint = 'Copy from previous payroll'
      Caption = 'No change'
      Checked = True
      TabOrder = 0
      TabStop = True
      GroupIndex = 1
    end
    object cbxUpdateAttendance: TcxRadioButton
      Left = 136
      Top = 71
      Width = 98
      Height = 17
      Hint = 'Compute'
      Caption = 'Update'
      TabOrder = 1
      GroupIndex = 1
    end
  end
end
