inherited fDuplicateTimeLogs: TfDuplicateTimeLogs
  Align = alNone
  Caption = 'fDuplicateTimeLogs'
  ClientHeight = 263
  ClientWidth = 504
  Position = poMainFormCenter
  OnCreate = FormCreate
  ExplicitWidth = 506
  ExplicitHeight = 265
  PixelsPerInch = 96
  TextHeight = 14
  inherited pnlCaption: TJvPanel
    Width = 504
    ExplicitWidth = 504
    DesignSize = (
      504
      20)
    inherited lblCaption: TLabel
      Width = 113
      Caption = 'Duplicate timelogs'
      ExplicitWidth = 113
    end
    inherited imgClose: TImage
      Left = 484
      ExplicitLeft = 484
    end
  end
  inherited pnlMain: TJvPanel
    Width = 504
    Height = 244
    ExplicitWidth = 504
    ExplicitHeight = 244
    object grDuplicate: TDBGrid
      Left = 7
      Top = 6
      Width = 266
      Height = 196
      DataSource = dmTimeAttendance.dscDuplicateLogs
      Options = [dgTitles, dgIndicator, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
      TabOrder = 0
      TitleFont.Charset = ANSI_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -12
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      Columns = <
        item
          Expanded = False
          FieldName = 'dtr_date_f'
          Title.Caption = 'Date'
          Width = 75
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'employee_name'
          Title.Caption = 'Employee'
          Width = 155
          Visible = True
        end>
    end
    object grLogs: TDBGrid
      Left = 279
      Top = 6
      Width = 217
      Height = 196
      Anchors = [akLeft, akTop, akRight, akBottom]
      DataSource = dmTimeAttendance.dscDtrByDate
      Options = [dgTitles, dgIndicator, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
      TabOrder = 1
      TitleFont.Charset = ANSI_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -12
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      Columns = <
        item
          Expanded = False
          FieldName = 'time_in'
          Title.Caption = 'Time In'
          Width = 60
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'time_out'
          Title.Caption = 'Time Out'
          Width = 60
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'location_code'
          Title.Caption = 'Location'
          Width = 60
          Visible = True
        end>
    end
    object btnClose: TcxButton
      Left = 415
      Top = 208
      Width = 81
      Height = 27
      Anchors = [akRight, akBottom]
      Caption = 'Close'
      ModalResult = 8
      OptionsImage.ImageIndex = 4
      TabOrder = 2
    end
    object btnCancel: TcxButton
      Left = 7
      Top = 208
      Width = 266
      Height = 27
      Caption = 'Cancel selected log'
      OptionsImage.ImageIndex = 4
      TabOrder = 3
      OnClick = btnCancelClick
    end
  end
end
