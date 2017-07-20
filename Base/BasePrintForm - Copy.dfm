inherited fBasePrintForm: TfBasePrintForm
  Caption = 'fBasePrintForm'
  ClientHeight = 460
  ClientWidth = 609
  Scaled = False
  OnCreate = FormCreate
  ExplicitWidth = 625
  ExplicitHeight = 499
  PixelsPerInch = 96
  TextHeight = 14
  object pcMain: TJvPageControl
    Left = 0
    Top = 0
    Width = 609
    Height = 460
    ActivePage = tsMain
    Align = alClient
    TabOrder = 0
    object tsMain: TTabSheet
      Caption = 'Change caption here'
      object pnlMain: TPanel
        Left = 0
        Top = 0
        Width = 601
        Height = 431
        Align = alClient
        BevelOuter = bvNone
        BorderWidth = 5
        Color = clMenu
        ParentBackground = False
        TabOrder = 0
        object pnlLeft: TPanel
          Left = 5
          Top = 5
          Width = 591
          Height = 40
          Align = alTop
          BevelOuter = bvNone
          ParentColor = True
          TabOrder = 0
          DesignSize = (
            591
            40)
          object Label1: TLabel
            Left = 10
            Top = 12
            Width = 31
            Height = 14
            Caption = 'Zoom'
          end
          object btnPrint: TcxButton
            Left = 478
            Top = 4
            Width = 106
            Height = 27
            Anchors = [akRight, akBottom]
            Caption = 'Print'
            OptionsImage.Glyph.Data = {
              36040000424D3604000000000000360000002800000010000000100000000100
              2000000000000004000000000000000000000000000000000000000000000000
              0000000000001111056516160687161606871616068716160687161606871616
              06871616068716160687111105650000000000000000000000000000000D0000
              001A0000001A1D1D0C82FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFDFFFEFE
              FDFFFDFDFBFFFEFEFBFF1D1D0C820000001A0000001A0000000D070707700909
              09850909098502020288E5E5E5FFE58743FFE5B38EFFC0B495FF59733BFF7A5C
              2BFF97693CFFE3E3DFFF020202880909098509090985070707701414147AC5BD
              BDFFC5BABAFF595959FF595959FF595959FF595959FF595959FF595959FF5959
              59FF595959FF595959FF595959FFCCBBBBFFCCBBBBFF1414147A17171775C4C2
              C2FFB8B0B0FF6F6B6BFF968A8AFF958888FF968787FF968787FF968787FF9787
              87FF978787FF978787FF716969FFCCBBBBFFCCBBBBFF171717751919196DB8B8
              B8FFA5A5A5FF202020FF605454FF5A4D4DFF5A4D4DFF5A4D4DFF5A4D4DFF5A4D
              4DFF5A4D4DFF5A4D4DFF202020FF9D9D9DFFAFAFAFFF1919196D16161658ADAD
              ADDDBEBEBEFF313131FF5C5656FF4D4444FF4D4444FF4D4444FF4D4444FF4D44
              44FF4D4444FF4E4646FF313131FF66FF66FF9D9292DD16161658121212408282
              82BFC9C9C9FF444444FF676666FF494646FF403C3CFF3F3B3BFF3F3B3BFF3F3B
              3BFF3F3B3BFF484444FF444444FFBBB1B1FF706B6BBF121212400C0C0C295C5C
              5CA0DADADAFF585858FF767676FF666666FF5F5F5FFF525151FF444343FF3C3B
              3BFF373636FF4A4949FF585858FFBFB9B9FF535353A00C0C0C29060606143D3D
              3D7FE8E8E8FF686868FF838383FF7D7D7DFF7D7D7DFF7D7D7DFF7D7D7DFF7D7D
              7DFF7C7C7CFF808080FF686868FFE4E4E4FF3C3C3C7F06060614010101021919
              194D222222670202028D757575FF757575FF757575FF757575FF757575FF7575
              75FF757575FF757575FF0202028D222222671919194D01010102000000000000
              0000000000003131206BFAFAF4FFF5F5EDFFF2F2EAFFEEEEE2FFE8E8D9FFE6E6
              D5FFE5E5D4FFF2F2E1FF3131206B000000000000000000000000000000000000
              00000000000031312069FAFAF3FFF2F2EAFFEEEEE2FFE8E8D9FFE6E6D5FFA4A4
              93FFA4A493FFA4A493FF2323127C000000000000000000000000000000000000
              00000000000032322168F9F9F0FFEEEEE2FFE8E8D9FFE6E6D5FFE5E5D4FFB6B6
              A5FFFFFFFFFF323221680E0E0920000000000000000000000000000000000000
              00000000000032322267FBFBEFFFF4F4E5FFF3F3E2FFF2F2E1FFF2F2E1FFC2C2
              B1FF3232226712120C2500000000000000000000000000000000000000000000
              00000000000026261A4D33332266333322663333226633332266333322663333
              226612120C240000000000000000000000000000000000000000}
            TabOrder = 0
            OnClick = btnPrintClick
          end
          object speZoom: TcxSpinEdit
            Left = 51
            Top = 6
            Properties.MaxValue = 150.000000000000000000
            Properties.MinValue = 75.000000000000000000
            Properties.OnEditValueChanged = speZoomPropertiesEditValueChanged
            TabOrder = 1
            Value = 100
            OnClick = speZoomPropertiesEditValueChanged
            Width = 57
          end
        end
        object pnlReport: TPanel
          Left = 5
          Top = 45
          Width = 591
          Height = 381
          Align = alClient
          BevelOuter = bvNone
          Caption = 'pnlReport'
          TabOrder = 1
          object rvMain: TQRPreview
            Left = 0
            Top = 0
            Width = 591
            Height = 381
            HorzScrollBar.Tracking = True
            VertScrollBar.Tracking = True
            Align = alClient
            BevelInner = bvNone
            Ctl3D = True
            Padding.Top = 5
            Padding.Bottom = 5
            ParentCtl3D = False
            TabOrder = 0
            PageNumber = 1
            Zoom = 80
          end
          object qrMain: TQuickRep
            Left = 16
            Top = 6
            Width = 571
            Height = 739
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = 'Tahoma'
            Font.Style = []
            Functions.Strings = (
              'PAGENUMBER'
              'COLUMNNUMBER'
              'REPORTTITLE')
            Functions.DATA = (
              '0'
              '0'
              #39#39)
            OnPreview = qrMainPreview
            Options = [FirstPageHeader, LastPageFooter]
            Page.Columns = 1
            Page.Orientation = poPortrait
            Page.PaperSize = Letter
            Page.Continuous = False
            Page.Values = (
              88.900000000000000000
              2794.000000000000000000
              88.900000000000000000
              2159.000000000000000000
              88.900000000000000000
              88.900000000000000000
              0.000000000000000000)
            PrinterSettings.Copies = 1
            PrinterSettings.OutputBin = Auto
            PrinterSettings.Duplex = False
            PrinterSettings.FirstPage = 0
            PrinterSettings.LastPage = 0
            PrinterSettings.UseStandardprinter = False
            PrinterSettings.UseCustomBinCode = False
            PrinterSettings.CustomBinCode = 0
            PrinterSettings.ExtendedDuplex = 0
            PrinterSettings.UseCustomPaperCode = False
            PrinterSettings.CustomPaperCode = 0
            PrinterSettings.PrintMetaFile = False
            PrinterSettings.PrintQuality = 0
            PrinterSettings.Collate = 0
            PrinterSettings.ColorOption = 0
            PrintIfEmpty = True
            SnapToGrid = True
            Units = Pixels
            Zoom = 70
            PrevFormStyle = fsNormal
            PreviewInitialState = wsNormal
            PreviewWidth = 90
            PreviewHeight = 100
            PrevInitialZoom = qrZoomOther
            PreviewDefaultSaveType = stQRP
            PreviewLeft = 0
            PreviewTop = 0
            object ColumnHeaderBand1: TQRBand
              Left = 24
              Top = 69
              Width = 524
              Height = 16
              AlignToBottom = False
              TransparentBand = False
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              ForceNewColumn = False
              ForceNewPage = False
              ParentFont = False
              Size.Values = (
                60.476190476190480000
                1980.595238095238000000)
              PreCaluculateBandHeight = False
              KeepOnOnePage = False
              BandType = rbColumnHeader
            end
            object TitleBand1: TQRBand
              Left = 24
              Top = 24
              Width = 524
              Height = 45
              AlignToBottom = False
              TransparentBand = False
              ForceNewColumn = False
              ForceNewPage = False
              Size.Values = (
                170.089285714285700000
                1980.595238095238000000)
              PreCaluculateBandHeight = False
              KeepOnOnePage = False
              BandType = rbTitle
              object ReportTitle: TQRLabel
                Left = 0
                Top = 15
                Width = 521
                Height = 17
                Size.Values = (
                  64.255952380952380000
                  0.000000000000000000
                  56.696428571428570000
                  1969.255952380952000000)
                XLColumn = 0
                Alignment = taCenter
                AlignToBand = False
                AutoSize = False
                Caption = 'REPORT TITLE HERE'
                Color = clWhite
                Font.Charset = ANSI_CHARSET
                Font.Color = clBlack
                Font.Height = -19
                Font.Name = 'Tahoma'
                Font.Style = [fsBold]
                ParentFont = False
                Transparent = False
                ExportAs = exptText
                WrapStyle = BreakOnSpaces
                FontSize = 14
              end
              object QRLabel4: TQRLabel
                Left = 0
                Top = 2
                Width = 521
                Height = 16
                Size.Values = (
                  60.476190476190480000
                  0.000000000000000000
                  7.559523809523810000
                  1969.255952380952000000)
                XLColumn = 0
                Alignment = taCenter
                AlignToBand = False
                AutoSize = False
                Caption = 'Alano & Sons Credit Corporation'
                Color = clWhite
                Font.Charset = ANSI_CHARSET
                Font.Color = clBlack
                Font.Height = -16
                Font.Name = 'Tahoma'
                Font.Style = []
                ParentFont = False
                Transparent = True
                ExportAs = exptText
                WrapStyle = BreakOnSpaces
                FontSize = 12
              end
            end
            object MasterDetailBand: TQRBand
              Left = 24
              Top = 85
              Width = 524
              Height = 12
              AlignToBottom = False
              TransparentBand = False
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              ForceNewColumn = False
              ForceNewPage = False
              ParentFont = False
              Size.Values = (
                45.357142857142860000
                1980.595238095238000000)
              PreCaluculateBandHeight = False
              KeepOnOnePage = False
              BandType = rbDetail
            end
            object PageFooterBand1: TQRBand
              Left = 24
              Top = 97
              Width = 524
              Height = 28
              AlignToBottom = False
              TransparentBand = False
              ForceNewColumn = False
              ForceNewPage = False
              Size.Values = (
                105.833333333333300000
                1980.595238095238000000)
              PreCaluculateBandHeight = False
              KeepOnOnePage = False
              BandType = rbPageFooter
              object QRShape3: TQRShape
                Left = 0
                Top = 9
                Width = 521
                Height = 3
                Size.Values = (
                  10.176282051282050000
                  0.000000000000000000
                  32.564102564102560000
                  1970.128205128205000000)
                XLColumn = 0
                Shape = qrsTopAndBottom
                VertAdjust = 0
              end
              object QRExpr1: TQRExpr
                Left = 2
                Top = 12
                Width = 79
                Height = 12
                Size.Values = (
                  45.357142857142860000
                  7.559523809523810000
                  45.357142857142860000
                  298.601190476190500000)
                XLColumn = 0
                Alignment = taLeftJustify
                AlignToBand = False
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -13
                Font.Name = 'Tahoma'
                Font.Style = []
                Color = clWhite
                ParentFont = False
                ResetAfterPrint = False
                Transparent = False
                Expression = #39'Print date: '#39' + Date'
                ExportAs = exptText
                WrapStyle = BreakOnSpaces
                FontSize = 10
              end
            end
          end
        end
        object pStatus: TPanel
          Left = 10
          Top = 300
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
            Brush.Color = 15987699
            Pen.Color = clMedGray
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
            Width = 181
            Height = 13
            Caption = 'Generating report. Please wait...'
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
    end
  end
end
