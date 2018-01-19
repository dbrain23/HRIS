inherited frmGeneratePayroll: TfrmGeneratePayroll
  Align = alNone
  Caption = 'frmGeneratePayroll'
  ClientHeight = 273
  ClientWidth = 343
  Position = poMainFormCenter
  ExplicitWidth = 345
  ExplicitHeight = 275
  PixelsPerInch = 96
  TextHeight = 14
  inherited pnlCaption: TJvPanel
    Width = 343
    inherited lblCaption: TLabel
      Width = 151
      Caption = 'Generate payroll options'
      ExplicitWidth = 151
    end
    inherited imgClose: TImage
      Left = 323
    end
  end
  inherited pnlMain: TJvPanel
    Width = 343
    Height = 254
    object JvGroupHeader1: TJvGroupHeader
      Left = 25
      Top = 47
      Width = 272
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
      Top = 113
      Width = 272
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
    object cbxCopyAdjustments: TcxCheckBox
      Left = 32
      Top = 131
      Hint = 'Copy from previous payroll'
      Caption = 'Copy from previous payroll'
      ParentShowHint = False
      ShowHint = True
      State = cbsChecked
      Style.Shadow = False
      TabOrder = 2
      Width = 176
    end
    object cbxComputeDeductions: TcxRadioButton
      Left = 32
      Top = 71
      Width = 98
      Height = 17
      Hint = 'Compute'
      Caption = 'Compute'
      Checked = True
      TabOrder = 0
      TabStop = True
    end
    object cbxCopyDeductions: TcxRadioButton
      Left = 136
      Top = 71
      Width = 169
      Height = 17
      Hint = 'Copy from previous payroll'
      Caption = 'Copy from previous payroll'
      TabOrder = 1
    end
    object btnGenerate: TcxButton
      Left = 22
      Top = 207
      Width = 92
      Height = 25
      Anchors = [akLeft, akBottom]
      Caption = 'Generate'
      TabOrder = 3
      OnClick = btnGenerateClick
    end
    object btnCancel: TcxButton
      Left = 120
      Top = 207
      Width = 92
      Height = 25
      Anchors = [akLeft, akBottom]
      Caption = 'Cancel'
      TabOrder = 4
      OnClick = btnCancelClick
    end
  end
end
