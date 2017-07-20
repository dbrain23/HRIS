object fRecordStatus: TfRecordStatus
  Left = 0
  Top = 0
  AlphaBlend = True
  BorderIcons = []
  BorderStyle = bsNone
  Caption = 'fRecordStatus'
  ClientHeight = 78
  ClientWidth = 260
  Color = 14811135
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poOwnerFormCenter
  OnClose = FormClose
  OnDeactivate = FormDeactivate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 14
  object Shape1: TShape
    Left = 0
    Top = 0
    Width = 260
    Height = 78
    Align = alClient
    Brush.Color = 15794145
    Pen.Color = 4623360
    ExplicitLeft = 152
    ExplicitTop = 64
    ExplicitWidth = 65
    ExplicitHeight = 65
  end
  object lblStatus: TLabel
    Left = 24
    Top = 32
    Width = 212
    Height = 14
    Caption = 'Record has been queued for synching.'
  end
  object tmMain: TTimer
    Enabled = False
    Interval = 20
    OnTimer = tmMainTimer
    Left = 65520
    Top = 80
  end
end
