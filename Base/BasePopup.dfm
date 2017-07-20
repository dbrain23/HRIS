inherited fBasePopup: TfBasePopup
  BorderStyle = bsNone
  BorderWidth = 1
  Caption = 'fBasePopup'
  ClientHeight = 299
  ClientWidth = 598
  ExplicitWidth = 600
  ExplicitHeight = 301
  PixelsPerInch = 96
  TextHeight = 14
  object pnlCaption: TJvPanel
    Left = 0
    Top = 0
    Width = 598
    Height = 20
    HotTrackFont.Charset = DEFAULT_CHARSET
    HotTrackFont.Color = clWindowText
    HotTrackFont.Height = -11
    HotTrackFont.Name = 'Tahoma'
    HotTrackFont.Style = []
    FlatBorder = True
    FlatBorderColor = clBlack
    Align = alTop
    BevelOuter = bvNone
    BorderWidth = 1
    Color = 11971188
    ParentBackground = False
    TabOrder = 0
    DesignSize = (
      598
      20)
    object lblCaption: TLabel
      Left = 5
      Top = 3
      Width = 127
      Height = 14
      Caption = 'Change caption here'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object imgClose: TImage
      Left = 578
      Top = 2
      Width = 16
      Height = 16
      Anchors = [akTop, akRight]
      DragCursor = crHandPoint
      Picture.Data = {
        0954506E67496D61676589504E470D0A1A0A0000000D49484452000000100000
        001008060000001FF3FF610000001974455874536F6674776172650041646F62
        6520496D616765526561647971C9653C000001C34944415478DAA5923D484251
        14C7CF4D7D5A3E230C5B32228508D7E762542E61E110CE4ED112B436B7B534B8
        34083534044A3889D15048145406D5180E81499A3E233FFAF0EB3DD1CE7BF7D5
        12E58B0EFC2FE7DE77CFEF9C77F9934EA703FF09B2272D002C6A19D33994B94B
        4D0975886DB750EF32006375D4E1589970B9AC4C5F1FF353A534AD50AB09C944
        229B49268378142021FAED686E71D15D17450654841640380E854E31F5905D7A
        763DBFB4C4158B4555FF6D341AE1241CBEC1D4497614C0ACDFCFF13CAF0AC0B2
        2C5CC66214B0AD00667C3E2E9FCF7F5D1245116AD5AA2C4110A0D56AD1F1B55A
        B0582CF0787B4B01410530E5F572854201A6CFCF2197CB41A552018D46238F2B
        756418FA3CFB763B1871FF94C950C0E627C0E3E1F2E9340C472272379D4EF7AD
        588A380218BD1E1E789E02020A60D2E9E48AA914BC7731168BEAC1C992CFCF14
        B0A100DC361B572B97553D22100257A51205AC2B00AFD5CA09F8606A235E2E53
        C01ADD1F2D0C0DB9199546AAB7DBC2C1CB0B35D208AE3EB4F2B8C1B0E23218AC
        26427E85BC61F145A391BD6B368351C9CA7866EE07189B42CE20800BF7035D06
        A8A05F136700D157807B09D08B32816CF13F85E4ACB70FF592AC54D3E6BCFB00
        00000049454E44AE426082}
      OnClick = imgCloseClick
    end
  end
  object pnlMain: TJvPanel
    Left = 0
    Top = 19
    Width = 598
    Height = 280
    HotTrackFont.Charset = DEFAULT_CHARSET
    HotTrackFont.Color = clWindowText
    HotTrackFont.Height = -11
    HotTrackFont.Name = 'Tahoma'
    HotTrackFont.Style = []
    FlatBorder = True
    FlatBorderColor = clBlack
    Anchors = [akLeft, akTop, akRight, akBottom]
    BevelEdges = [beLeft, beRight, beBottom]
    BevelOuter = bvNone
    BorderWidth = 1
    TabOrder = 1
  end
end
