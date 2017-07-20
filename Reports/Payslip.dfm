inherited frm_RepPayslipForm: Tfrm_RepPayslipForm
  Caption = 'frm_RepPayslipForm'
  PixelsPerInch = 96
  TextHeight = 13
  inherited p_Report: TPanel
    inherited QuickReport: TQuickRep [0]
      Functions.DATA = (
        '0'
        '0'
        #39#39)
      Page.Values = (
        88.900000000000000000
        2794.000000000000000000
        88.900000000000000000
        2159.000000000000000000
        88.900000000000000000
        88.900000000000000000
        0.000000000000000000)
      inherited ColumnHeaderBand1: TQRBand
        Height = 31
        Size.Values = (
          63.092948717948720000
          1982.339743589744000000)
        ExplicitHeight = 31
        inherited QRShape1: TQRShape
          Size.Values = (
            48.846153846153850000
            0.000000000000000000
            6.105769230769231000
            1970.128205128205000000)
        end
        inherited QRLabel1: TQRLabel
          Top = 8
          Width = 61
          Height = 17
          Size.Values = (
            34.599358974358970000
            8.141025641025641000
            16.282051282051280000
            124.150641025641000000)
          Font.Height = -11
          FontSize = 8
          ExplicitTop = 8
          ExplicitWidth = 61
          ExplicitHeight = 17
        end
      end
      inherited TitleBand1: TQRBand
        Size.Values = (
          264.583333333333300000
          1982.339743589744000000)
        inherited ReportTitle: TQRLabel
          Size.Values = (
            52.916666666666670000
            0.000000000000000000
            56.987179487179490000
            1970.128205128205000000)
          FontSize = 11
        end
        inherited DateRange: TQRLabel
          Size.Values = (
            61.057692307692310000
            0.000000000000000000
            99.727564102564100000
            1970.128205128205000000)
          FontSize = 8
        end
        inherited QRLabel4: TQRLabel
          Size.Values = (
            61.057692307692310000
            0.000000000000000000
            0.000000000000000000
            1970.128205128205000000)
          FontSize = 14
        end
        inherited ProjectLabel: TQRLabel
          Width = 94
          Height = 17
          Size.Values = (
            34.599358974358970000
            8.141025641025641000
            223.878205128205100000
            191.314102564102600000)
          Font.Height = -11
          FontSize = 8
          ExplicitWidth = 94
          ExplicitHeight = 17
        end
      end
      inherited MasterDetailBand: TQRBand
        Top = 205
        Height = 19
        Size.Values = (
          38.669871794871790000
          1982.339743589744000000)
        ExplicitTop = 205
        ExplicitHeight = 19
        inherited QRDBText1: TQRDBText
          Width = 74
          Height = 17
          Size.Values = (
            34.599358974358970000
            6.105769230769231000
            2.035256410256410000
            150.608974358974400000)
          Font.Height = -11
          FontSize = 8
          ExplicitWidth = 74
          ExplicitHeight = 17
        end
      end
      inherited PageFooterBand1: TQRBand
        Top = 224
        Size.Values = (
          105.833333333333300000
          1982.339743589744000000)
        ExplicitTop = 224
        inherited QRShape2: TQRShape
          Size.Values = (
            10.176282051282050000
            0.000000000000000000
            32.564102564102560000
            1970.128205128205000000)
        end
      end
    end
    inherited ReportViewer: TQRPreview [1]
    end
    object QuickReportPayroll: TQuickRep
      Left = 4
      Top = 6
      Width = 816
      Height = 1056
      DataSet = ado_Master
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
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
      OnPreview = QuickReportPayrollPreview
      Options = [FirstPageHeader, LastPageFooter]
      Page.Columns = 1
      Page.Orientation = poPortrait
      Page.PaperSize = Letter
      Page.Continuous = False
      Page.Values = (
        63.500000000000000000
        2794.000000000000000000
        63.500000000000000000
        2159.000000000000000000
        127.000000000000000000
        127.000000000000000000
        0.000000000000000000)
      PrinterSettings.Copies = 1
      PrinterSettings.OutputBin = Auto
      PrinterSettings.Duplex = False
      PrinterSettings.FirstPage = 0
      PrinterSettings.LastPage = 0
      PrinterSettings.UseStandardprinter = True
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
      ReportTitle = 'Jet Construction Payslips'
      SnapToGrid = True
      Units = Inches
      Zoom = 100
      PrevFormStyle = fsNormal
      PreviewInitialState = wsNormal
      PrevInitialZoom = qrZoomToFit
      PreviewDefaultSaveType = stQRP
      PreviewLeft = 0
      PreviewTop = 0
      object DetailBand: TQRBand
        Left = 48
        Top = 24
        Width = 720
        Height = 200
        AlignToBottom = False
        BeforePrint = DetailBandBeforePrint
        Color = clWhite
        TransparentBand = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ForceNewColumn = False
        ForceNewPage = False
        ParentFont = False
        Size.Values = (
          529.166666666666700000
          1905.000000000000000000)
        PreCaluculateBandHeight = False
        KeepOnOnePage = True
        BandType = rbDetail
        object QRLabel16: TQRLabel
          Left = 9
          Top = 3
          Width = 39
          Height = 17
          Size.Values = (
            44.979166666666670000
            23.812500000000000000
            7.937500000000000000
            103.187500000000000000)
          XLColumn = 0
          Alignment = taLeftJustify
          AlignToBand = False
          Caption = 'Name:'
          Color = clWhite
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          Transparent = False
          ExportAs = exptText
          WrapStyle = BreakOnSpaces
          FontSize = 10
        end
        object QRLabel17: TQRLabel
          Left = 9
          Top = 21
          Width = 46
          Height = 17
          Size.Values = (
            44.979166666666670000
            23.812500000000000000
            55.562500000000000000
            121.708333333333300000)
          XLColumn = 0
          Alignment = taLeftJustify
          AlignToBand = False
          Caption = 'Project:'
          Color = clWhite
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          Transparent = False
          ExportAs = exptText
          WrapStyle = BreakOnSpaces
          FontSize = 10
        end
        object QRDBText16: TQRDBText
          Left = 51
          Top = 3
          Width = 95
          Height = 17
          Size.Values = (
            44.979166666666670000
            134.937500000000000000
            7.937500000000000000
            251.354166666666700000)
          XLColumn = 0
          Alignment = taLeftJustify
          AlignToBand = False
          Color = clWhite
          DataSet = ado_Master
          DataField = 'employee_name'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          Transparent = False
          ExportAs = exptText
          WrapStyle = BreakOnSpaces
          FullJustify = False
          MaxBreakChars = 0
          FontSize = 10
        end
        object QRDBText17: TQRDBText
          Left = 58
          Top = 21
          Width = 80
          Height = 17
          Size.Values = (
            44.979166666666670000
            153.458333333333300000
            55.562500000000000000
            211.666666666666700000)
          XLColumn = 0
          Alignment = taLeftJustify
          AlignToBand = False
          Color = clWhite
          DataSet = ado_Master
          DataField = 'project_name'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          Transparent = False
          ExportAs = exptText
          WrapStyle = BreakOnSpaces
          FullJustify = False
          MaxBreakChars = 0
          FontSize = 10
        end
        object QRShape3: TQRShape
          Left = 0
          Top = 190
          Width = 713
          Height = 2
          Size.Values = (
            5.291666666666667000
            0.000000000000000000
            502.708333333333300000
            1886.479166666667000000)
          XLColumn = 0
          Pen.Style = psDot
          Shape = qrsHorLine
          VertAdjust = 0
        end
        object QRLabel12: TQRLabel
          Left = 510
          Top = 21
          Width = 74
          Height = 17
          Size.Values = (
            44.979166666666670000
            1349.375000000000000000
            55.562500000000000000
            195.791666666666700000)
          XLColumn = 0
          Alignment = taLeftJustify
          AlignToBand = False
          Caption = 'Received by:'
          Color = clWhite
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          Transparent = False
          ExportAs = exptText
          WrapStyle = BreakOnSpaces
          FontSize = 10
        end
        object QRLabel13: TQRLabel
          Left = 510
          Top = 3
          Width = 42
          Height = 17
          Size.Values = (
            44.979166666666670000
            1349.375000000000000000
            7.937500000000000000
            111.125000000000000000)
          XLColumn = 0
          Alignment = taLeftJustify
          AlignToBand = False
          Caption = 'Period:'
          Color = clWhite
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          Transparent = False
          ExportAs = exptText
          WrapStyle = BreakOnSpaces
          FontSize = 10
        end
        object QRDBText8: TQRDBText
          Left = 554
          Top = 3
          Width = 71
          Height = 17
          Size.Values = (
            44.979166666666670000
            1465.791666666667000000
            7.937500000000000000
            187.854166666666700000)
          XLColumn = 0
          Alignment = taLeftJustify
          AlignToBand = False
          Color = clWhite
          DataSet = ado_Master
          DataField = 'payroll_date'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          Transparent = False
          ExportAs = exptText
          WrapStyle = BreakOnSpaces
          FullJustify = False
          MaxBreakChars = 0
          FontSize = 10
        end
        object QRPShape1: TQRPShape
          Left = 9
          Top = 57
          Width = 693
          Height = 23
          Size.Values = (
            60.854166666666670000
            23.812500000000000000
            150.812500000000000000
            1833.562500000000000000)
          XLColumn = 0
          Shape = qrpsRectangle
          VertAdjust = 0
          FixBottomPosition = False
          StretchHeightWithBand = False
        end
        object QRLabel2: TQRLabel
          Left = 16
          Top = 61
          Width = 65
          Height = 17
          Size.Values = (
            44.979166666666670000
            42.333333333333330000
            161.395833333333300000
            171.979166666666700000)
          XLColumn = 0
          Alignment = taLeftJustify
          AlignToBand = False
          Caption = 'EARNINGS:'
          Color = clWhite
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          Transparent = False
          ExportAs = exptText
          WrapStyle = BreakOnSpaces
          FontSize = 10
        end
        object QRLabel3: TQRLabel
          Left = 258
          Top = 61
          Width = 69
          Height = 17
          Size.Values = (
            44.979166666666670000
            682.625000000000000000
            161.395833333333300000
            182.562500000000000000)
          XLColumn = 0
          Alignment = taLeftJustify
          AlignToBand = False
          Caption = 'DEDUCTION'
          Color = clWhite
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          Transparent = False
          ExportAs = exptText
          WrapStyle = BreakOnSpaces
          FontSize = 10
        end
        object QRPShape5: TQRPShape
          Left = 249
          Top = 57
          Width = 1
          Height = 122
          Size.Values = (
            322.791666666666700000
            658.812500000000000000
            150.812500000000000000
            2.645833333333333000)
          XLColumn = 0
          Shape = qrpsVertLine
          VertAdjust = 0
          FixBottomPosition = False
          StretchHeightWithBand = False
        end
        object QRPShape6: TQRPShape
          Left = 536
          Top = 57
          Width = 1
          Height = 122
          Size.Values = (
            322.791666666666700000
            1418.166666666667000000
            150.812500000000000000
            2.645833333333333000)
          XLColumn = 0
          Shape = qrpsVertLine
          VertAdjust = 0
          FixBottomPosition = False
          StretchHeightWithBand = False
        end
        object l_Basic: TQRLabel
          Left = 16
          Top = 82
          Width = 30
          Height = 17
          Size.Values = (
            44.979166666666670000
            42.333333333333330000
            216.958333333333300000
            79.375000000000000000)
          XLColumn = 0
          Alignment = taLeftJustify
          AlignToBand = False
          Caption = 'Basic'
          Color = clWhite
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          Transparent = False
          ExportAs = exptText
          WrapStyle = BreakOnSpaces
          FontSize = 10
        end
        object QRLabel6: TQRLabel
          Left = 16
          Top = 100
          Width = 41
          Height = 17
          Size.Values = (
            44.979166666666670000
            42.333333333333330000
            264.583333333333300000
            108.479166666666700000)
          XLColumn = 0
          Alignment = taLeftJustify
          AlignToBand = False
          Caption = 'OT-AM'
          Color = clWhite
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          Transparent = False
          ExportAs = exptText
          WrapStyle = BreakOnSpaces
          FontSize = 10
        end
        object QRLabel7: TQRLabel
          Left = 16
          Top = 118
          Width = 40
          Height = 17
          Size.Values = (
            44.979166666666670000
            42.333333333333330000
            312.208333333333300000
            105.833333333333300000)
          XLColumn = 0
          Alignment = taLeftJustify
          AlignToBand = False
          Caption = 'OT-PM'
          Color = clWhite
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          Transparent = False
          ExportAs = exptText
          WrapStyle = BreakOnSpaces
          FontSize = 10
        end
        object QRLabel8: TQRLabel
          Left = 158
          Top = 82
          Width = 10
          Height = 17
          Size.Values = (
            44.979166666666670000
            418.041666666666700000
            216.958333333333300000
            26.458333333333330000)
          XLColumn = 0
          Alignment = taLeftJustify
          AlignToBand = False
          Caption = '='
          Color = clWhite
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          Transparent = False
          ExportAs = exptText
          WrapStyle = BreakOnSpaces
          FontSize = 10
        end
        object QRLabel9: TQRLabel
          Left = 158
          Top = 100
          Width = 10
          Height = 17
          Size.Values = (
            44.979166666666670000
            418.041666666666700000
            264.583333333333300000
            26.458333333333330000)
          XLColumn = 0
          Alignment = taLeftJustify
          AlignToBand = False
          Caption = '='
          Color = clWhite
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          Transparent = False
          ExportAs = exptText
          WrapStyle = BreakOnSpaces
          FontSize = 10
        end
        object QRLabel10: TQRLabel
          Left = 158
          Top = 118
          Width = 10
          Height = 17
          Size.Values = (
            44.979166666666670000
            418.041666666666700000
            312.208333333333300000
            26.458333333333330000)
          XLColumn = 0
          Alignment = taLeftJustify
          AlignToBand = False
          Caption = '='
          Color = clWhite
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          Transparent = False
          ExportAs = exptText
          WrapStyle = BreakOnSpaces
          FontSize = 10
        end
        object QRLabel11: TQRLabel
          Left = 109
          Top = 82
          Width = 37
          Height = 17
          Size.Values = (
            44.979166666666670000
            288.395833333333300000
            216.958333333333300000
            97.895833333333330000)
          XLColumn = 0
          Alignment = taLeftJustify
          AlignToBand = False
          Caption = 'day(s)'
          Color = clWhite
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          Transparent = False
          ExportAs = exptText
          WrapStyle = BreakOnSpaces
          FontSize = 10
        end
        object QRLabel15: TQRLabel
          Left = 109
          Top = 100
          Width = 43
          Height = 17
          Size.Values = (
            44.979166666666670000
            288.395833333333300000
            264.583333333333300000
            113.770833333333300000)
          XLColumn = 0
          Alignment = taLeftJustify
          AlignToBand = False
          Caption = 'hour(s)'
          Color = clWhite
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          Transparent = False
          ExportAs = exptText
          WrapStyle = BreakOnSpaces
          FontSize = 10
        end
        object QRLabel18: TQRLabel
          Left = 109
          Top = 118
          Width = 43
          Height = 17
          Size.Values = (
            44.979166666666670000
            288.395833333333300000
            312.208333333333300000
            113.770833333333300000)
          XLColumn = 0
          Alignment = taLeftJustify
          AlignToBand = False
          Caption = 'hour(s)'
          Color = clWhite
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          Transparent = False
          ExportAs = exptText
          WrapStyle = BreakOnSpaces
          FontSize = 10
        end
        object QRLabel20: TQRLabel
          Left = 543
          Top = 162
          Width = 25
          Height = 17
          Size.Values = (
            44.979166666666670000
            1436.687500000000000000
            428.625000000000000000
            66.145833333333330000)
          XLColumn = 0
          Alignment = taLeftJustify
          AlignToBand = False
          Caption = 'Net:'
          Color = clWhite
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          Transparent = True
          ExportAs = exptText
          WrapStyle = BreakOnSpaces
          FontSize = 10
        end
        object QRLabel23: TQRLabel
          Left = 16
          Top = 162
          Width = 38
          Height = 17
          Size.Values = (
            44.979166666666670000
            42.333333333333330000
            428.625000000000000000
            100.541666666666700000)
          XLColumn = 0
          Alignment = taLeftJustify
          AlignToBand = False
          Caption = 'Gross:'
          Color = clWhite
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          Transparent = True
          ExportAs = exptText
          WrapStyle = BreakOnSpaces
          FontSize = 10
        end
        object QRPShape7: TQRPShape
          Left = 9
          Top = 75
          Width = 1
          Height = 104
          Size.Values = (
            275.166666666666700000
            23.812500000000000000
            198.437500000000000000
            2.645833333333333000)
          XLColumn = 0
          Shape = qrpsVertLine
          VertAdjust = 0
          FixBottomPosition = False
          StretchHeightWithBand = False
        end
        object QRLabel19: TQRLabel
          Left = 258
          Top = 162
          Width = 94
          Height = 17
          Size.Values = (
            44.979166666666670000
            682.625000000000000000
            428.625000000000000000
            248.708333333333300000)
          XLColumn = 0
          Alignment = taLeftJustify
          AlignToBand = False
          Caption = 'Total deduction:'
          Color = clWhite
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          Transparent = True
          ExportAs = exptText
          WrapStyle = BreakOnSpaces
          FontSize = 10
        end
        object QRPShape8: TQRPShape
          Left = 701
          Top = 57
          Width = 1
          Height = 122
          Size.Values = (
            322.791666666666700000
            1854.729166666667000000
            150.812500000000000000
            2.645833333333333000)
          XLColumn = 0
          Shape = qrpsVertLine
          VertAdjust = 0
          FixBottomPosition = False
          StretchHeightWithBand = False
        end
        object QRLabel22: TQRLabel
          Left = 543
          Top = 82
          Width = 62
          Height = 17
          Size.Values = (
            44.979166666666670000
            1436.687500000000000000
            216.958333333333300000
            164.041666666666700000)
          XLColumn = 0
          Alignment = taLeftJustify
          AlignToBand = False
          Caption = 'Additional:'
          Color = clWhite
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          Transparent = False
          ExportAs = exptText
          WrapStyle = BreakOnSpaces
          FontSize = 10
        end
        object QRLabel24: TQRLabel
          Left = 543
          Top = 100
          Width = 71
          Height = 17
          Size.Values = (
            44.979166666666670000
            1436.687500000000000000
            264.583333333333300000
            187.854166666666700000)
          XLColumn = 0
          Alignment = taLeftJustify
          AlignToBand = False
          Caption = 'Adjustment:'
          Color = clWhite
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          Transparent = False
          ExportAs = exptText
          WrapStyle = BreakOnSpaces
          FontSize = 10
        end
        object QRDBText14: TQRDBText
          Left = 258
          Top = 82
          Width = 111
          Height = 73
          Size.Values = (
            193.145833333333300000
            682.625000000000000000
            216.958333333333400000
            293.687500000000000000)
          XLColumn = 0
          Alignment = taLeftJustify
          AlignToBand = False
          AutoSize = False
          AutoStretch = True
          Color = clWhite
          DataSet = ado_Master
          DataField = 'deductiontypes'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          Transparent = True
          ExportAs = exptText
          WrapStyle = BreakOnSpaces
          FullJustify = False
          MaxBreakChars = 0
          FontSize = 10
        end
        object QRDBText15: TQRDBText
          Left = 375
          Top = 82
          Width = 77
          Height = 73
          Size.Values = (
            193.145833333333300000
            992.187500000000000000
            216.958333333333400000
            203.729166666666700000)
          XLColumn = 0
          Alignment = taRightJustify
          AlignToBand = False
          AutoSize = False
          AutoStretch = True
          Color = clWhite
          DataSet = ado_Master
          DataField = 'deductionamounts'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          Transparent = True
          ExportAs = exptText
          WrapStyle = BreakOnSpaces
          FullJustify = False
          MaxBreakChars = 0
          FontSize = 10
        end
        object t_Balance: TQRDBText
          Left = 458
          Top = 82
          Width = 72
          Height = 73
          Size.Values = (
            193.145833333333300000
            1211.791666666667000000
            216.958333333333400000
            190.500000000000000000)
          XLColumn = 0
          Alignment = taRightJustify
          AlignToBand = False
          AutoSize = False
          Color = clWhite
          DataSet = ado_Master
          DataField = 'deductionbalance'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWhite
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          Transparent = False
          ExportAs = exptText
          WrapStyle = BreakOnSpaces
          FullJustify = False
          MaxBreakChars = 0
          FontSize = 10
        end
        object l_Balance: TQRLabel
          Left = 477
          Top = 61
          Width = 53
          Height = 17
          Size.Values = (
            44.979166666666670000
            1262.062500000000000000
            161.395833333333300000
            140.229166666666700000)
          XLColumn = 0
          Alignment = taRightJustify
          AlignToBand = False
          Caption = 'BALANCE'
          Color = clWhite
          Font.Charset = ANSI_CHARSET
          Font.Color = clWhite
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          Transparent = False
          ExportAs = exptText
          WrapStyle = BreakOnSpaces
          FontSize = 10
        end
        object QRLabel21: TQRLabel
          Left = 400
          Top = 61
          Width = 52
          Height = 17
          Size.Values = (
            44.979166666666670000
            1058.333333333333000000
            161.395833333333300000
            137.583333333333300000)
          XLColumn = 0
          Alignment = taRightJustify
          AlignToBand = False
          Caption = 'AMOUNT'
          Color = clWhite
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          Transparent = False
          ExportAs = exptText
          WrapStyle = BreakOnSpaces
          FontSize = 10
        end
        object QRExpr14: TQRExpr
          Left = 63
          Top = 82
          Width = 40
          Height = 17
          Size.Values = (
            44.979166666666670000
            166.687500000000000000
            216.958333333333300000
            105.833333333333300000)
          XLColumn = 0
          Alignment = taRightJustify
          AlignToBand = False
          AutoSize = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          Color = clWhite
          ParentFont = False
          ResetAfterPrint = False
          Transparent = False
          Expression = 'FORMATNUMERIC('#39'###,###,##0.00'#39',ado_Master.number_of_days)'
          ExportAs = exptText
          WrapStyle = BreakOnSpaces
          FontSize = 10
        end
        object QRExpr3: TQRExpr
          Left = 171
          Top = 82
          Width = 64
          Height = 17
          Size.Values = (
            44.979166666666670000
            452.437500000000000000
            216.958333333333300000
            169.333333333333300000)
          XLColumn = 0
          Alignment = taRightJustify
          AlignToBand = False
          AutoSize = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          Color = clWhite
          ParentFont = False
          ResetAfterPrint = False
          Transparent = False
          Expression = 'FORMATNUMERIC('#39'###,###,##0.00'#39',ado_Master.basic_pay)'
          ExportAs = exptText
          WrapStyle = BreakOnSpaces
          FontSize = 10
        end
        object QRExpr4: TQRExpr
          Left = 61
          Top = 100
          Width = 42
          Height = 17
          Size.Values = (
            44.979166666666670000
            161.395833333333300000
            264.583333333333300000
            111.125000000000000000)
          XLColumn = 0
          Alignment = taRightJustify
          AlignToBand = False
          AutoSize = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          Color = clWhite
          ParentFont = False
          ResetAfterPrint = False
          Transparent = False
          Expression = 'FORMATNUMERIC('#39'###,###,##0.00'#39',ado_Master.ot_am)'
          ExportAs = exptText
          WrapStyle = BreakOnSpaces
          FontSize = 10
        end
        object QRExpr5: TQRExpr
          Left = 62
          Top = 118
          Width = 41
          Height = 17
          Size.Values = (
            44.979166666666670000
            164.041666666666700000
            312.208333333333300000
            108.479166666666700000)
          XLColumn = 0
          Alignment = taRightJustify
          AlignToBand = False
          AutoSize = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          Color = clWhite
          ParentFont = False
          ResetAfterPrint = False
          Transparent = False
          Expression = 'FORMATNUMERIC('#39'###,###,##0.00'#39',ado_Master.ot_pm)'
          ExportAs = exptText
          WrapStyle = BreakOnSpaces
          FontSize = 10
        end
        object QRExpr15: TQRExpr
          Left = 171
          Top = 100
          Width = 64
          Height = 17
          Size.Values = (
            44.979166666666670000
            452.437500000000000000
            264.583333333333300000
            169.333333333333300000)
          XLColumn = 0
          Alignment = taRightJustify
          AlignToBand = False
          AutoSize = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          Color = clWhite
          ParentFont = False
          ResetAfterPrint = False
          Transparent = False
          Expression = 'FORMATNUMERIC('#39'###,###,##0.00'#39',ado_Master.ot_pay_am)'
          ExportAs = exptText
          WrapStyle = BreakOnSpaces
          FontSize = 10
        end
        object QRExpr16: TQRExpr
          Left = 171
          Top = 118
          Width = 64
          Height = 17
          Size.Values = (
            44.979166666666670000
            452.437500000000000000
            312.208333333333300000
            169.333333333333300000)
          XLColumn = 0
          Alignment = taRightJustify
          AlignToBand = False
          AutoSize = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          Color = clWhite
          ParentFont = False
          ResetAfterPrint = False
          Transparent = False
          Expression = 'FORMATNUMERIC('#39'###,###,##0.00'#39',ado_Master.ot_pay_pm)'
          ExportAs = exptText
          WrapStyle = BreakOnSpaces
          FontSize = 10
        end
        object QRExpr17: TQRExpr
          Left = 174
          Top = 162
          Width = 61
          Height = 17
          Size.Values = (
            44.979166666666670000
            460.375000000000000000
            428.625000000000000000
            161.395833333333300000)
          XLColumn = 0
          Alignment = taRightJustify
          AlignToBand = False
          AutoSize = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          Color = clWhite
          ParentFont = False
          ResetAfterPrint = False
          Transparent = True
          Expression = 'FORMATNUMERIC('#39'###,###,##0.00'#39',ado_Master.gross)'
          ExportAs = exptText
          WrapStyle = BreakOnSpaces
          FontSize = 10
        end
        object QRExpr1: TQRExpr
          Left = 375
          Top = 162
          Width = 77
          Height = 17
          Size.Values = (
            44.979166666666670000
            992.187500000000000000
            428.625000000000000000
            203.729166666666700000)
          XLColumn = 0
          Alignment = taRightJustify
          AlignToBand = False
          AutoSize = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          Color = clWhite
          ParentFont = False
          ResetAfterPrint = False
          Transparent = True
          Expression = 'FORMATNUMERIC('#39'###,###,##0.00'#39',ado_Master.deduction)'
          ExportAs = exptText
          WrapStyle = BreakOnSpaces
          FontSize = 10
        end
        object QRExpr2: TQRExpr
          Left = 584
          Top = 159
          Width = 102
          Height = 20
          Size.Values = (
            52.916666666666670000
            1545.166666666667000000
            420.687500000000000000
            269.875000000000000000)
          XLColumn = 0
          Alignment = taRightJustify
          AlignToBand = False
          AutoSize = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          Color = clWhite
          ParentFont = False
          ResetAfterPrint = False
          Transparent = True
          Expression = 'FORMATNUMERIC('#39'###,###,##0.00'#39',ado_Master.net)'
          ExportAs = exptText
          WrapStyle = BreakOnSpaces
          FontSize = 12
        end
        object QRExpr6: TQRExpr
          Left = 609
          Top = 82
          Width = 77
          Height = 17
          Size.Values = (
            44.979166666666670000
            1611.312500000000000000
            216.958333333333300000
            203.729166666666700000)
          XLColumn = 0
          Alignment = taRightJustify
          AlignToBand = False
          AutoSize = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          Color = clWhite
          ParentFont = False
          ResetAfterPrint = False
          Transparent = False
          Expression = 'FORMATNUMERIC('#39'###,###,##0.00'#39',ado_Master.additional)'
          ExportAs = exptText
          WrapStyle = BreakOnSpaces
          FontSize = 10
        end
        object QRExpr7: TQRExpr
          Left = 620
          Top = 100
          Width = 66
          Height = 17
          Size.Values = (
            44.979166666666670000
            1640.416666666667000000
            264.583333333333300000
            174.625000000000000000)
          XLColumn = 0
          Alignment = taRightJustify
          AlignToBand = False
          AutoSize = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          Color = clWhite
          ParentFont = False
          ResetAfterPrint = False
          Transparent = False
          Expression = 'FORMATNUMERIC('#39'###,###,##0.00'#39',ado_Master.adjustment)'
          ExportAs = exptText
          WrapStyle = BreakOnSpaces
          FontSize = 10
        end
        object QRPShape2: TQRPShape
          Left = 9
          Top = 178
          Width = 693
          Height = 1
          Size.Values = (
            2.645833333333333000
            23.812500000000000000
            470.958333333333300000
            1833.562500000000000000)
          XLColumn = 0
          Shape = qrpsHorLine
          VertAdjust = 0
          FixBottomPosition = False
          StretchHeightWithBand = False
        end
      end
    end
  end
  inherited ParametersPanel: TPanel
    object cb_ShowDeductibleBalance: TcxCheckBox
      Left = 48
      Top = 36
      Caption = 'Show deductible balance'
      Style.LookAndFeel.NativeStyle = False
      StyleDisabled.LookAndFeel.NativeStyle = False
      StyleFocused.LookAndFeel.NativeStyle = False
      StyleHot.LookAndFeel.NativeStyle = False
      TabOrder = 3
      Width = 465
    end
  end
  inherited ado_Master: TADODataSet
    AfterOpen = ado_MasterAfterOpen
    OnCalcFields = ado_MasterCalcFields
    CommandText = 'exec dbo.sp_rep_payslip :payroll_code, :project_id'
    Parameters = <
      item
        Name = 'payroll_code'
        Attributes = [paNullable]
        DataType = ftString
        NumericScale = 255
        Precision = 255
        Size = 15
        Value = Null
      end
      item
        Name = 'project_id'
        Attributes = [paSigned, paNullable]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    Left = 88
    Top = 56
    object ado_Masterpayroll_id: TAutoIncField
      FieldName = 'payroll_id'
      ReadOnly = True
    end
    object ado_Masternumber_of_days: TBCDField
      FieldName = 'number_of_days'
      Precision = 8
      Size = 2
    end
    object ado_Masterbasic_pay: TBCDField
      FieldName = 'basic_pay'
      ReadOnly = True
      Precision = 19
    end
    object ado_Masterrate: TBCDField
      FieldName = 'rate'
      Precision = 10
      Size = 2
    end
    object ado_Masterot_am: TBCDField
      FieldName = 'ot_am'
      Precision = 8
      Size = 2
    end
    object ado_Masterot_pm: TBCDField
      FieldName = 'ot_pm'
      Precision = 8
      Size = 2
    end
    object ado_Masterdeductiontypes: TStringField
      FieldName = 'deductiontypes'
      ReadOnly = True
      Size = 250
    end
    object ado_Masterdeductionamounts: TStringField
      FieldName = 'deductionamounts'
      ReadOnly = True
      Size = 250
    end
    object ado_Masterdeductionbalance: TStringField
      FieldName = 'deductionbalance'
      ReadOnly = True
      Size = 250
    end
    object ado_Masteremployee_name: TStringField
      FieldName = 'employee_name'
      ReadOnly = True
      Size = 92
    end
    object ado_Mastergross_without_ot: TBCDField
      FieldName = 'gross_without_ot'
      ReadOnly = True
      Precision = 19
    end
    object ado_Masterpayroll_date: TStringField
      FieldName = 'payroll_date'
      ReadOnly = True
      Size = 23
    end
    object ado_Masterproject_name: TStringField
      FieldName = 'project_name'
      Size = 100
    end
    object ado_Mastergross: TFMTBCDField
      FieldName = 'gross'
      ReadOnly = True
      Precision = 28
      Size = 10
    end
    object ado_Masterot_pay_am: TFMTBCDField
      FieldName = 'ot_pay_am'
      ReadOnly = True
      Precision = 23
    end
    object ado_Masterot_pay_pm: TFMTBCDField
      FieldName = 'ot_pay_pm'
      ReadOnly = True
      Precision = 27
      Size = 10
    end
    object ado_Masterdeduction: TFMTBCDField
      FieldName = 'deduction'
      ReadOnly = True
      Precision = 38
      Size = 2
    end
    object ado_Masteradditional: TFMTBCDField
      FieldName = 'additional'
      ReadOnly = True
      Precision = 38
      Size = 2
    end
    object ado_Masteradjustment: TBCDField
      FieldName = 'adjustment'
      ReadOnly = True
      Precision = 8
      Size = 2
    end
    object ado_Masternet: TFloatField
      FieldKind = fkCalculated
      FieldName = 'net'
      Calculated = True
    end
  end
  inherited ds_Master: TDataSource
    Left = 120
    Top = 56
  end
  object ado_Deduction: TADODataSet [5]
    Connection = DM_Main.ado_MainConn
    CursorType = ctStatic
    CommandText = 'exec dbo.sp_rep_get_deductions :payroll_id'
    Parameters = <
      item
        Name = 'payroll_id'
        Attributes = [paSigned, paNullable]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    Left = 216
    Top = 56
  end
  inherited ado_Payrollcode: TADODataSet
    Left = 152
    Top = 56
  end
  inherited ado_Project: TADODataSet
    Left = 272
    Top = 56
  end
  inherited PrintDialog: TdxPrintDialog
    Left = 304
    Top = 56
  end
end
