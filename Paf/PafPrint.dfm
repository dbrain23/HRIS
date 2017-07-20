inherited fPafPrint: TfPafPrint
  Caption = 'fPafPrint'
  ClientHeight = 800
  ClientWidth = 611
  ExplicitTop = -126
  ExplicitWidth = 627
  ExplicitHeight = 839
  PixelsPerInch = 96
  TextHeight = 14
  inherited pcMain: TJvPageControl
    Width = 611
    Height = 800
    ExplicitWidth = 611
    ExplicitHeight = 800
    inherited tsMain: TTabSheet
      Caption = 'PAF Print Preview'
      ExplicitWidth = 603
      ExplicitHeight = 771
      inherited pnlMain: TPanel
        Width = 603
        Height = 771
        ExplicitWidth = 603
        ExplicitHeight = 771
        inherited pnlLeft: TPanel
          Width = 593
          ExplicitWidth = 593
          DesignSize = (
            593
            40)
          inherited bGenerate: TcxButton
            TabOrder = 3
            Visible = False
          end
          object bBack: TcxButton
            Left = 395
            Top = 4
            Width = 81
            Height = 27
            Anchors = [akRight, akBottom]
            Caption = 'Back'
            OptionsImage.Glyph.Data = {
              36040000424D3604000000000000360000002800000010000000100000000100
              2000000000000004000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000004010004000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000E060012984404C8000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              00000000000000000000000000001B0A001EAE5B11E3BD6215EE000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              000000000000000000002711002DB8651AEDF0A553FFAB5811F00A04000E0903
              000C0802000A050200090702000A0802000C0000000000000000000000000000
              0000000000003818003DC67327F4EFAA62FFE69C4FFFAB621EFFAF5C16FFAD5C
              13FFAC580FFFAB540BFFAB5407FF9E4404F20000000000000000000000000000
              00004D230053D28138F9F4B676FFEBA660FFE89F53FFE69A4AFFE39340FFE08C
              34FFDC8429FFD87D1DFFD97811FFA24905F30000000000000000000000006031
              026ADD9755FDFCC68FFFF1B070FFEEA965FFE9A259FFE59A4EFFE39345FFDE8D
              3AFFDA842DFFD87E22FFD97B18FFA64C06F40000000000000000000000006634
              036FE19E60FEFFDEBAFFF4B676FFEFAE6CFFEBA661FFE79F54FFE49748FFE08E
              3DFFDD8832FFD98026FFD97D1EFFAC4F08F60000000000000000000000000000
              000053270057D88E4AFAFFDDBDFFF3B474FFEEAB66FFEDAC68FFEEB97FFFEBB1
              72FFE9A866FFE5A059FFE49642FFAF550BF60000000000000000000000000000
              0000000000003D1B0041CF823CF5FFDFBDFFF4BB81FFD2853EFFCC7F38FFCB7B
              34FFC9772FFFC77329FFC57126FFA94D07EE0000000000000000000000000000
              000000000000000000002C120030C2752CEEFFE6C7FFBE681EF0100500151006
              0015100600140E0500120E0400120D0400110000000000000000000000000000
              00000000000000000000000000001E0D0021B86922E5CB772AEE000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              00000000000000000000000000000000000012080014A24E04CB000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000005010005000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000}
            OptionsImage.ImageIndex = 4
            TabOrder = 1
            OnClick = bBackClick
          end
          object btnSignatories: TcxButton
            Left = 2
            Top = 4
            Width = 75
            Height = 27
            Caption = 'Signatories'
            TabOrder = 2
            OnClick = btnSignatoriesClick
          end
        end
        inherited pnlReport: TPanel
          Width = 593
          Height = 688
          ExplicitWidth = 593
          ExplicitHeight = 688
          inherited rvMain: TQRPreview
            Width = 593
            Height = 688
            Zoom = 100
            ExplicitWidth = 593
            ExplicitHeight = 688
          end
          inherited qrMain: TQuickRep
            Left = 20
            DataSet = dmPaf.dstPafPrint
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
            ExplicitLeft = 20
            object SummaryBand1: TQRBand
              Left = 24
              Top = 69
              Width = 524
              Height = 618
              AlignToBottom = False
              Color = clWhite
              TransparentBand = False
              ForceNewColumn = False
              ForceNewPage = False
              Size.Values = (
                2335.892857142857000000
                1980.595238095238000000)
              PreCaluculateBandHeight = False
              KeepOnOnePage = False
              BandType = rbSummary
              object QRShape1: TQRShape
                Left = 2
                Top = 0
                Width = 521
                Height = 618
                Size.Values = (
                  2335.892857142857000000
                  7.559523809523810000
                  0.000000000000000000
                  1969.255952380952000000)
                XLColumn = 0
                Shape = qrsRectangle
                VertAdjust = 0
              end
              object QRLabel1: TQRLabel
                Left = 7
                Top = 5
                Width = 22
                Height = 12
                Size.Values = (
                  45.357142857142860000
                  26.458333333333330000
                  18.898809523809520000
                  83.154761904761900000)
                XLColumn = 0
                Alignment = taLeftJustify
                AlignToBand = False
                Caption = 'Name'
                Color = clWhite
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -12
                Font.Name = 'Tahoma'
                Font.Style = []
                ParentFont = False
                Transparent = False
                ExportAs = exptText
                WrapStyle = BreakOnSpaces
                FontSize = 9
              end
              object QRLabel2: TQRLabel
                Left = 7
                Top = 23
                Width = 25
                Height = 12
                Size.Values = (
                  45.357142857142860000
                  26.458333333333330000
                  86.934523809523810000
                  94.494047619047620000)
                XLColumn = 0
                Alignment = taLeftJustify
                AlignToBand = False
                Caption = 'ID No.'
                Color = clWhite
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -12
                Font.Name = 'Tahoma'
                Font.Style = []
                ParentFont = False
                Transparent = False
                ExportAs = exptText
                WrapStyle = BreakOnSpaces
                FontSize = 9
              end
              object QRLabel3: TQRLabel
                Left = 7
                Top = 41
                Width = 18
                Height = 12
                Size.Values = (
                  45.357142857142860000
                  26.458333333333330000
                  154.970238095238100000
                  68.035714285714290000)
                XLColumn = 0
                Alignment = taLeftJustify
                AlignToBand = False
                Caption = 'Title'
                Color = clWhite
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -12
                Font.Name = 'Tahoma'
                Font.Style = []
                ParentFont = False
                Transparent = False
                ExportAs = exptText
                WrapStyle = BreakOnSpaces
                FontSize = 9
              end
              object QRLabel5: TQRLabel
                Left = 7
                Top = 59
                Width = 36
                Height = 12
                Size.Values = (
                  45.357142857142860000
                  26.458333333333330000
                  223.005952380952400000
                  136.071428571428600000)
                XLColumn = 0
                Alignment = taLeftJustify
                AlignToBand = False
                Caption = 'Job Level'
                Color = clWhite
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -12
                Font.Name = 'Tahoma'
                Font.Style = []
                ParentFont = False
                Transparent = False
                ExportAs = exptText
                WrapStyle = BreakOnSpaces
                FontSize = 9
              end
              object QRLabel6: TQRLabel
                Left = 7
                Top = 77
                Width = 27
                Height = 12
                Size.Values = (
                  45.357142857142860000
                  26.458333333333330000
                  291.041666666666700000
                  102.053571428571400000)
                XLColumn = 0
                Alignment = taLeftJustify
                AlignToBand = False
                Caption = 'Branch'
                Color = clWhite
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -12
                Font.Name = 'Tahoma'
                Font.Style = []
                ParentFont = False
                Transparent = False
                ExportAs = exptText
                WrapStyle = BreakOnSpaces
                FontSize = 9
              end
              object QRShape2: TQRShape
                Left = 2
                Top = 18
                Width = 521
                Height = 1
                Size.Values = (
                  3.779761904761905000
                  7.559523809523811000
                  68.035714285714290000
                  1969.255952380952000000)
                XLColumn = 0
                Shape = qrsHorLine
                VertAdjust = 0
              end
              object QRShape4: TQRShape
                Left = 2
                Top = 37
                Width = 521
                Height = 1
                Size.Values = (
                  3.779761904761905000
                  7.559523809523811000
                  139.851190476190500000
                  1969.255952380952000000)
                XLColumn = 0
                Shape = qrsHorLine
                VertAdjust = 0
              end
              object QRShape5: TQRShape
                Left = 2
                Top = 55
                Width = 521
                Height = 1
                Size.Values = (
                  3.779761904761905000
                  7.559523809523811000
                  207.886904761904800000
                  1969.255952380952000000)
                XLColumn = 0
                Shape = qrsHorLine
                VertAdjust = 0
              end
              object QRShape6: TQRShape
                Left = 2
                Top = 73
                Width = 521
                Height = 1
                Size.Values = (
                  3.779761904761905000
                  7.559523809523811000
                  275.922619047619000000
                  1969.255952380952000000)
                XLColumn = 0
                Shape = qrsHorLine
                VertAdjust = 0
              end
              object QRShape7: TQRShape
                Left = 2
                Top = 91
                Width = 521
                Height = 1
                Size.Values = (
                  3.779761904761905000
                  7.559523809523811000
                  343.958333333333300000
                  1969.255952380952000000)
                XLColumn = 0
                Shape = qrsHorLine
                VertAdjust = 0
              end
              object QRShape8: TQRShape
                Left = 74
                Top = 1
                Width = 1
                Height = 91
                Size.Values = (
                  343.958333333333300000
                  279.702380952381000000
                  3.779761904761905000
                  3.779761904761905000)
                XLColumn = 0
                Shape = qrsVertLine
                VertAdjust = 0
              end
              object QRShape9: TQRShape
                Left = 300
                Top = 1
                Width = 1
                Height = 91
                Size.Values = (
                  343.958333333333300000
                  1133.928571428571000000
                  3.779761904761905000
                  3.779761904761905000)
                XLColumn = 0
                Shape = qrsVertLine
                VertAdjust = 0
              end
              object QRShape10: TQRShape
                Left = 400
                Top = 1
                Width = 1
                Height = 55
                Size.Values = (
                  207.886904761904800000
                  1511.904761904762000000
                  3.779761904761905000
                  3.779761904761905000)
                XLColumn = 0
                Shape = qrsVertLine
                VertAdjust = 0
              end
              object QRLabel7: TQRLabel
                Left = 305
                Top = 5
                Width = 41
                Height = 12
                Size.Values = (
                  45.357142857142860000
                  1152.827380952381000000
                  18.898809523809520000
                  154.970238095238100000)
                XLColumn = 0
                Alignment = taLeftJustify
                AlignToBand = False
                Caption = 'Date Hired'
                Color = clWhite
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -12
                Font.Name = 'Tahoma'
                Font.Style = []
                ParentFont = False
                Transparent = False
                ExportAs = exptText
                WrapStyle = BreakOnSpaces
                FontSize = 9
              end
              object QRLabel8: TQRLabel
                Left = 305
                Top = 23
                Width = 64
                Height = 12
                Size.Values = (
                  45.357142857142860000
                  1152.827380952381000000
                  86.934523809523810000
                  241.904761904761900000)
                XLColumn = 0
                Alignment = taLeftJustify
                AlignToBand = False
                Caption = 'Date Regularized'
                Color = clWhite
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -12
                Font.Name = 'Tahoma'
                Font.Style = []
                ParentFont = False
                Transparent = False
                ExportAs = exptText
                WrapStyle = BreakOnSpaces
                FontSize = 9
              end
              object QRLabel9: TQRLabel
                Left = 305
                Top = 41
                Width = 76
                Height = 12
                Size.Values = (
                  45.357142857142860000
                  1152.827380952381000000
                  154.970238095238100000
                  287.261904761904800000)
                XLColumn = 0
                Alignment = taLeftJustify
                AlignToBand = False
                Caption = 'Employment Status'
                Color = clWhite
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -12
                Font.Name = 'Tahoma'
                Font.Style = []
                ParentFont = False
                Transparent = False
                ExportAs = exptText
                WrapStyle = BreakOnSpaces
                FontSize = 9
              end
              object QRShape11: TQRShape
                Left = 2
                Top = 129
                Width = 521
                Height = 1
                Size.Values = (
                  3.779761904761905000
                  7.559523809523811000
                  487.589285714285700000
                  1969.255952380952000000)
                XLColumn = 0
                Shape = qrsHorLine
                VertAdjust = 0
              end
              object QRShape12: TQRShape
                Left = 2
                Top = 154
                Width = 521
                Height = 1
                Size.Values = (
                  3.779761904761905000
                  7.559523809523811000
                  582.083333333333200000
                  1969.255952380952000000)
                XLColumn = 0
                Shape = qrsHorLine
                VertAdjust = 0
              end
              object QRShape13: TQRShape
                Left = 2
                Top = 172
                Width = 521
                Height = 1
                Size.Values = (
                  3.779761904761905000
                  7.559523809523811000
                  650.119047619047600000
                  1969.255952380952000000)
                XLColumn = 0
                Shape = qrsHorLine
                VertAdjust = 0
              end
              object QRShape14: TQRShape
                Left = 2
                Top = 277
                Width = 521
                Height = 1
                Size.Values = (
                  3.779761904761905000
                  7.559523809523811000
                  1046.994047619048000000
                  1969.255952380952000000)
                XLColumn = 0
                Shape = qrsHorLine
                VertAdjust = 0
              end
              object QRLabel11: TQRLabel
                Left = 7
                Top = 137
                Width = 55
                Height = 12
                Size.Values = (
                  45.357142857142860000
                  26.458333333333330000
                  517.827380952381000000
                  207.886904761904800000)
                XLColumn = 0
                Alignment = taLeftJustify
                AlignToBand = False
                Caption = 'Date Effective'
                Color = clWhite
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -12
                Font.Name = 'Tahoma'
                Font.Style = []
                ParentFont = False
                Transparent = False
                ExportAs = exptText
                WrapStyle = BreakOnSpaces
                FontSize = 9
              end
              object QRShape15: TQRShape
                Left = 74
                Top = 129
                Width = 1
                Height = 26
                Size.Values = (
                  98.273809523809520000
                  279.702380952381000000
                  487.589285714285700000
                  3.779761904761905000)
                XLColumn = 0
                Shape = qrsVertLine
                VertAdjust = 0
              end
              object QRLabel12: TQRLabel
                Left = 95
                Top = 158
                Width = 22
                Height = 12
                Size.Values = (
                  45.357142857142860000
                  359.077380952381000000
                  597.202380952381000000
                  83.154761904761900000)
                XLColumn = 0
                Alignment = taLeftJustify
                AlignToBand = False
                Caption = 'Salary'
                Color = clWhite
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -12
                Font.Name = 'Tahoma'
                Font.Style = []
                ParentFont = False
                Transparent = False
                ExportAs = exptText
                WrapStyle = BreakOnSpaces
                FontSize = 9
              end
              object QRLabel13: TQRLabel
                Left = 219
                Top = 158
                Width = 43
                Height = 12
                Size.Values = (
                  45.357142857142860000
                  827.767857142857100000
                  597.202380952381000000
                  162.529761904761900000)
                XLColumn = 0
                Alignment = taLeftJustify
                AlignToBand = False
                Caption = 'Allowances'
                Color = clWhite
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -12
                Font.Name = 'Tahoma'
                Font.Style = []
                ParentFont = False
                Transparent = False
                ExportAs = exptText
                WrapStyle = BreakOnSpaces
                FontSize = 9
              end
              object QRLabel14: TQRLabel
                Left = 350
                Top = 158
                Width = 30
                Height = 12
                Size.Values = (
                  45.357142857142860000
                  1322.916666666667000000
                  597.202380952381000000
                  113.392857142857100000)
                XLColumn = 0
                Alignment = taLeftJustify
                AlignToBand = False
                Caption = 'Position'
                Color = clWhite
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -12
                Font.Name = 'Tahoma'
                Font.Style = []
                ParentFont = False
                Transparent = False
                ExportAs = exptText
                WrapStyle = BreakOnSpaces
                FontSize = 9
              end
              object QRLabel15: TQRLabel
                Left = 427
                Top = 158
                Width = 27
                Height = 12
                Size.Values = (
                  45.357142857142860000
                  1613.958333333333000000
                  597.202380952381000000
                  102.053571428571400000)
                XLColumn = 0
                Alignment = taLeftJustify
                AlignToBand = False
                Caption = 'Branch'
                Color = clWhite
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -12
                Font.Name = 'Tahoma'
                Font.Style = []
                ParentFont = False
                Transparent = False
                ExportAs = exptText
                WrapStyle = BreakOnSpaces
                FontSize = 9
              end
              object QRLabel16: TQRLabel
                Left = 491
                Top = 158
                Width = 20
                Height = 12
                Size.Values = (
                  45.357142857142860000
                  1855.863095238095000000
                  597.202380952381000000
                  75.595238095238100000)
                XLColumn = 0
                Alignment = taLeftJustify
                AlignToBand = False
                Caption = 'Level'
                Color = clWhite
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -12
                Font.Name = 'Tahoma'
                Font.Style = []
                ParentFont = False
                Transparent = False
                ExportAs = exptText
                WrapStyle = BreakOnSpaces
                FontSize = 9
              end
              object QRLabel19: TQRLabel
                Left = 7
                Top = 175
                Width = 22
                Height = 12
                Size.Values = (
                  45.357142857142860000
                  26.458333333333330000
                  661.458333333333300000
                  83.154761904761900000)
                XLColumn = 0
                Alignment = taLeftJustify
                AlignToBand = False
                Caption = 'FROM'
                Color = clWhite
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -12
                Font.Name = 'Tahoma'
                Font.Style = []
                ParentFont = False
                Transparent = False
                ExportAs = exptText
                WrapStyle = BreakOnSpaces
                FontSize = 9
              end
              object QRLabel20: TQRLabel
                Left = 7
                Top = 281
                Width = 13
                Height = 12
                Size.Values = (
                  45.357142857142860000
                  26.458333333333330000
                  1062.113095238095000000
                  49.136904761904760000)
                XLColumn = 0
                Alignment = taLeftJustify
                AlignToBand = False
                Caption = 'TO'
                Color = clWhite
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -12
                Font.Name = 'Tahoma'
                Font.Style = []
                ParentFont = False
                Transparent = False
                ExportAs = exptText
                WrapStyle = BreakOnSpaces
                FontSize = 9
              end
              object QRShape17: TQRShape
                Left = 74
                Top = 154
                Width = 1
                Height = 229
                Size.Values = (
                  865.565476190476200000
                  279.702380952381000000
                  582.083333333333300000
                  3.779761904761905000)
                XLColumn = 0
                Shape = qrsVertLine
                VertAdjust = 0
              end
              object QRShape18: TQRShape
                Left = 151
                Top = 154
                Width = 1
                Height = 229
                Size.Values = (
                  865.565476190476200000
                  570.744047619047600000
                  582.083333333333300000
                  3.779761904761905000)
                XLColumn = 0
                Shape = qrsVertLine
                VertAdjust = 0
              end
              object QRShape19: TQRShape
                Left = 330
                Top = 154
                Width = 1
                Height = 229
                Size.Values = (
                  865.565476190476200000
                  1247.321428571429000000
                  582.083333333333200000
                  3.779761904761905000)
                XLColumn = 0
                Shape = qrsVertLine
                VertAdjust = 0
              end
              object QRShape20: TQRShape
                Left = 405
                Top = 154
                Width = 1
                Height = 229
                Size.Values = (
                  865.565476190476200000
                  1530.803571428571000000
                  582.083333333333200000
                  3.779761904761905000)
                XLColumn = 0
                Shape = qrsVertLine
                VertAdjust = 0
              end
              object QRShape21: TQRShape
                Left = 480
                Top = 154
                Width = 1
                Height = 229
                Size.Values = (
                  865.565476190476200000
                  1814.285714285714000000
                  582.083333333333200000
                  3.779761904761905000)
                XLColumn = 0
                Shape = qrsVertLine
                VertAdjust = 0
              end
              object QRShape22: TQRShape
                Left = 2
                Top = 382
                Width = 521
                Height = 1
                Size.Values = (
                  3.779761904761905000
                  7.559523809523811000
                  1443.869047619048000000
                  1969.255952380952000000)
                XLColumn = 0
                Shape = qrsHorLine
                VertAdjust = 0
              end
              object QRShape23: TQRShape
                Left = 2
                Top = 477
                Width = 521
                Height = 1
                Size.Values = (
                  3.779761904761905000
                  7.559523809523811000
                  1802.946428571429000000
                  1969.255952380952000000)
                XLColumn = 0
                Shape = qrsHorLine
                VertAdjust = 0
              end
              object QRLabel24: TQRLabel
                Left = 7
                Top = 385
                Width = 43
                Height = 12
                Size.Values = (
                  45.357142857142860000
                  26.458333333333330000
                  1455.208333333333000000
                  162.529761904761900000)
                XLColumn = 0
                Alignment = taLeftJustify
                AlignToBand = False
                Caption = 'REMARKS'
                Color = clWhite
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -12
                Font.Name = 'Tahoma'
                Font.Style = [fsBold]
                ParentFont = False
                Transparent = False
                ExportAs = exptText
                WrapStyle = BreakOnSpaces
                FontSize = 9
              end
              object QRShape25: TQRShape
                Left = 2
                Top = 502
                Width = 521
                Height = 1
                Size.Values = (
                  3.779761904761905000
                  7.559523809523811000
                  1897.440476190476000000
                  1969.255952380952000000)
                XLColumn = 0
                Shape = qrsHorLine
                VertAdjust = 0
              end
              object QRShape26: TQRShape
                Left = 2
                Top = 529
                Width = 521
                Height = 1
                Size.Values = (
                  3.779761904761905000
                  7.559523809523811000
                  1999.494047619048000000
                  1969.255952380952000000)
                XLColumn = 0
                Shape = qrsHorLine
                VertAdjust = 0
              end
              object QRLabel26: TQRLabel
                Left = 7
                Top = 504
                Width = 114
                Height = 24
                Size.Values = (
                  90.714285714285710000
                  26.458333333333330000
                  1905.000000000000000000
                  430.892857142857100000)
                XLColumn = 0
                Alignment = taCenter
                AlignToBand = False
                AutoSize = False
                Caption = 'Human Resources Development Manager'
                Color = clWhite
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -12
                Font.Name = 'Tahoma'
                Font.Style = []
                ParentFont = False
                Transparent = False
                ExportAs = exptText
                WrapStyle = BreakOnSpaces
                FontSize = 9
              end
              object QRLabel27: TQRLabel
                Left = 139
                Top = 504
                Width = 114
                Height = 22
                Size.Values = (
                  83.154761904761890000
                  525.386904761904800000
                  1905.000000000000000000
                  430.892857142857100000)
                XLColumn = 0
                Alignment = taCenter
                AlignToBand = False
                AutoSize = False
                Caption = 'Branch Manager / Department Head'
                Color = clWhite
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -12
                Font.Name = 'Tahoma'
                Font.Style = []
                ParentFont = False
                Transparent = False
                ExportAs = exptText
                WrapStyle = BreakOnSpaces
                FontSize = 9
              end
              object QRLabel28: TQRLabel
                Left = 272
                Top = 504
                Width = 114
                Height = 22
                Size.Values = (
                  83.154761904761890000
                  1028.095238095238000000
                  1905.000000000000000000
                  430.892857142857100000)
                XLColumn = 0
                Alignment = taCenter
                AlignToBand = False
                AutoSize = False
                Caption = 'Area Manager'
                Color = clWhite
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -12
                Font.Name = 'Tahoma'
                Font.Style = []
                ParentFont = False
                Transparent = False
                ExportAs = exptText
                WrapStyle = BreakOnSpaces
                FontSize = 9
              end
              object QRLabel29: TQRLabel
                Left = 402
                Top = 504
                Width = 114
                Height = 22
                Size.Values = (
                  83.154761904761900000
                  1519.464285714286000000
                  1905.000000000000000000
                  430.892857142857100000)
                XLColumn = 0
                Alignment = taCenter
                AlignToBand = False
                AutoSize = False
                Caption = 'Chief Operating Officer'
                Color = clWhite
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -12
                Font.Name = 'Tahoma'
                Font.Style = []
                ParentFont = False
                Transparent = False
                ExportAs = exptText
                WrapStyle = BreakOnSpaces
                FontSize = 9
              end
              object QRShape27: TQRShape
                Left = 2
                Top = 578
                Width = 521
                Height = 1
                Size.Values = (
                  3.779761904761905000
                  7.559523809523811000
                  2184.702380952381000000
                  1969.255952380952000000)
                XLColumn = 0
                Shape = qrsHorLine
                VertAdjust = 0
              end
              object QRShape28: TQRShape
                Left = 129
                Top = 502
                Width = 1
                Height = 77
                Size.Values = (
                  291.041666666666700000
                  487.589285714285700000
                  1897.440476190476000000
                  3.779761904761905000)
                XLColumn = 0
                Shape = qrsVertLine
                VertAdjust = 0
              end
              object QRShape29: TQRShape
                Left = 262
                Top = 502
                Width = 1
                Height = 77
                Size.Values = (
                  291.041666666666700000
                  990.297619047618900000
                  1897.440476190476000000
                  3.779761904761905000)
                XLColumn = 0
                Shape = qrsVertLine
                VertAdjust = 0
              end
              object QRShape30: TQRShape
                Left = 395
                Top = 502
                Width = 1
                Height = 77
                Size.Values = (
                  291.041666666666700000
                  1493.005952380952000000
                  1897.440476190476000000
                  3.779761904761905000)
                XLColumn = 0
                Shape = qrsVertLine
                VertAdjust = 0
              end
              object QRLabel35: TQRLabel
                Left = 7
                Top = 580
                Width = 55
                Height = 12
                Size.Values = (
                  45.357142857142860000
                  26.458333333333330000
                  2192.261904761905000000
                  207.886904761904800000)
                XLColumn = 0
                Alignment = taLeftJustify
                AlignToBand = False
                Caption = 'Conformed By'
                Color = clWhite
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -12
                Font.Name = 'Tahoma'
                Font.Style = []
                ParentFont = False
                Transparent = False
                ExportAs = exptText
                WrapStyle = BreakOnSpaces
                FontSize = 9
              end
              object QRDBText1: TQRDBText
                Left = 80
                Top = 5
                Width = 219
                Height = 12
                Size.Values = (
                  45.357142857142860000
                  302.380952380952400000
                  18.898809523809520000
                  827.767857142857100000)
                XLColumn = 0
                Alignment = taLeftJustify
                AlignToBand = False
                AutoSize = False
                Color = clWhite
                DataSet = dmPaf.dstPafPrint
                DataField = 'employee_name'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -12
                Font.Name = 'Tahoma'
                Font.Style = [fsBold]
                ParentFont = False
                Transparent = False
                ExportAs = exptText
                WrapStyle = BreakOnSpaces
                FullJustify = False
                MaxBreakChars = 0
                FontSize = 9
              end
              object QRDBText2: TQRDBText
                Left = 80
                Top = 23
                Width = 219
                Height = 12
                Size.Values = (
                  45.357142857142860000
                  302.380952380952400000
                  86.934523809523810000
                  827.767857142857100000)
                XLColumn = 0
                Alignment = taLeftJustify
                AlignToBand = False
                AutoSize = False
                Color = clWhite
                DataSet = dmPaf.dstPafPrint
                DataField = 'id_num'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -12
                Font.Name = 'Tahoma'
                Font.Style = [fsBold]
                ParentFont = False
                Transparent = False
                ExportAs = exptText
                WrapStyle = BreakOnSpaces
                FullJustify = False
                MaxBreakChars = 0
                FontSize = 9
              end
              object QRDBText3: TQRDBText
                Left = 80
                Top = 41
                Width = 219
                Height = 12
                Size.Values = (
                  45.357142857142860000
                  302.380952380952400000
                  154.970238095238100000
                  827.767857142857100000)
                XLColumn = 0
                Alignment = taLeftJustify
                AlignToBand = False
                AutoSize = False
                Color = clWhite
                DataSet = dmPaf.dstPafPrint
                DataField = 'position'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -12
                Font.Name = 'Tahoma'
                Font.Style = [fsBold]
                ParentFont = False
                Transparent = False
                ExportAs = exptText
                WrapStyle = BreakOnSpaces
                FullJustify = False
                MaxBreakChars = 0
                FontSize = 9
              end
              object QRDBText4: TQRDBText
                Left = 80
                Top = 59
                Width = 219
                Height = 12
                Size.Values = (
                  45.357142857142860000
                  302.380952380952400000
                  223.005952380952400000
                  827.767857142857100000)
                XLColumn = 0
                Alignment = taLeftJustify
                AlignToBand = False
                AutoSize = False
                Color = clWhite
                DataSet = dmPaf.dstPafPrint
                DataField = 'job_level'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -12
                Font.Name = 'Tahoma'
                Font.Style = [fsBold]
                ParentFont = False
                Transparent = False
                ExportAs = exptText
                WrapStyle = BreakOnSpaces
                FullJustify = False
                MaxBreakChars = 0
                FontSize = 9
              end
              object QRDBText5: TQRDBText
                Left = 80
                Top = 77
                Width = 219
                Height = 12
                Size.Values = (
                  45.357142857142860000
                  302.380952380952400000
                  291.041666666666700000
                  827.767857142857100000)
                XLColumn = 0
                Alignment = taLeftJustify
                AlignToBand = False
                AutoSize = False
                Color = clWhite
                DataSet = dmPaf.dstPafPrint
                DataField = 'location'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -12
                Font.Name = 'Tahoma'
                Font.Style = [fsBold]
                ParentFont = False
                Transparent = False
                ExportAs = exptText
                WrapStyle = BreakOnSpaces
                FullJustify = False
                MaxBreakChars = 0
                FontSize = 9
              end
              object QRShape32: TQRShape
                Left = 3
                Top = 93
                Width = 520
                Height = 36
                Frame.Color = 15395562
                Frame.Style = psClear
                Size.Values = (
                  136.071428571428600000
                  11.339285714285710000
                  351.517857142857100000
                  1965.476190476190000000)
                XLColumn = 0
                Brush.Color = 15395562
                Pen.Style = psClear
                Shape = qrsRectangle
                VertAdjust = 0
              end
              object QRLabel10: TQRLabel
                Left = 7
                Top = 109
                Width = 511
                Height = 18
                Size.Values = (
                  68.035714285714290000
                  26.458333333333330000
                  411.994047619047600000
                  1931.458333333333000000)
                XLColumn = 0
                Alignment = taCenter
                AlignToBand = False
                AutoSize = False
                Caption = 'C   H   A   N   G   E   S'
                Color = 15395562
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -21
                Font.Name = 'Tahoma'
                Font.Style = [fsBold]
                ParentFont = False
                Transparent = False
                ExportAs = exptText
                WrapStyle = BreakOnSpaces
                FontSize = 16
              end
              object QRDBText6: TQRDBText
                Left = 156
                Top = 175
                Width = 87
                Height = 99
                Size.Values = (
                  374.196428571428600000
                  589.642857142857100000
                  661.458333333333300000
                  328.839285714285700000)
                XLColumn = 0
                Alignment = taLeftJustify
                AlignToBand = False
                AutoSize = False
                AutoStretch = True
                Color = clWhite
                DataSet = dmPaf.dstPafPrint
                DataField = 'allowances_previous'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -12
                Font.Name = 'Tahoma'
                Font.Style = [fsBold]
                ParentFont = False
                Transparent = False
                ExportAs = exptText
                WrapStyle = BreakOnSpaces
                FullJustify = False
                MaxBreakChars = 0
                FontSize = 9
              end
              object QRShape33: TQRShape
                Left = 3
                Top = 479
                Width = 520
                Height = 23
                Frame.Color = 15395562
                Frame.Style = psClear
                Size.Values = (
                  86.934523809523810000
                  11.339285714285710000
                  1810.505952380952000000
                  1965.476190476190000000)
                XLColumn = 0
                Brush.Color = 15395562
                Pen.Style = psClear
                Shape = qrsRectangle
                VertAdjust = 0
              end
              object QRLabel25: TQRLabel
                Left = 7
                Top = 481
                Width = 511
                Height = 18
                Size.Values = (
                  68.035714285714290000
                  26.458333333333330000
                  1818.065476190476000000
                  1931.458333333333000000)
                XLColumn = 0
                Alignment = taCenter
                AlignToBand = False
                AutoSize = False
                Caption = 'A  P  P  R  O  V  A  L  S'
                Color = 15395562
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -21
                Font.Name = 'Tahoma'
                Font.Style = [fsBold]
                ParentFont = False
                Transparent = False
                ExportAs = exptText
                WrapStyle = BreakOnSpaces
                FontSize = 16
              end
              object QRDBText7: TQRDBText
                Left = 81
                Top = 137
                Width = 440
                Height = 12
                Size.Values = (
                  45.357142857142860000
                  306.160714285714300000
                  517.827380952381000000
                  1663.095238095238000000)
                XLColumn = 0
                Alignment = taLeftJustify
                AlignToBand = False
                AutoSize = False
                Color = clWhite
                DataSet = dmPaf.dstPafPrint
                DataField = 'effective_date'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -12
                Font.Name = 'Tahoma'
                Font.Style = [fsBold]
                ParentFont = False
                Transparent = False
                ExportAs = exptText
                WrapStyle = BreakOnSpaces
                FullJustify = False
                MaxBreakChars = 0
                FontSize = 9
              end
              object QRDBText8: TQRDBText
                Left = 78
                Top = 175
                Width = 69
                Height = 99
                Size.Values = (
                  374.196428571428600000
                  294.821428571428600000
                  661.458333333333300000
                  260.803571428571400000)
                XLColumn = 0
                Alignment = taLeftJustify
                AlignToBand = False
                AutoSize = False
                Color = clWhite
                DataSet = dmPaf.dstPafPrint
                DataField = 'salary_previous'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -12
                Font.Name = 'Tahoma'
                Font.Style = [fsBold]
                ParentFont = False
                Transparent = False
                ExportAs = exptText
                WrapStyle = BreakOnSpaces
                FullJustify = False
                MaxBreakChars = 0
                FontSize = 9
              end
              object QRDBText9: TQRDBText
                Left = 156
                Top = 281
                Width = 87
                Height = 99
                Size.Values = (
                  374.196428571428600000
                  589.642857142857100000
                  1062.113095238095000000
                  328.839285714285700000)
                XLColumn = 0
                Alignment = taLeftJustify
                AlignToBand = False
                AutoSize = False
                AutoStretch = True
                Color = clWhite
                DataSet = dmPaf.dstPafPrint
                DataField = 'allowances'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -12
                Font.Name = 'Tahoma'
                Font.Style = [fsBold]
                ParentFont = False
                Transparent = False
                ExportAs = exptText
                WrapStyle = BreakOnSpaces
                FullJustify = False
                MaxBreakChars = 0
                FontSize = 9
              end
              object QRDBText10: TQRDBText
                Left = 78
                Top = 281
                Width = 69
                Height = 99
                Size.Values = (
                  374.196428571428600000
                  294.821428571428600000
                  1062.113095238095000000
                  260.803571428571400000)
                XLColumn = 0
                Alignment = taLeftJustify
                AlignToBand = False
                AutoSize = False
                Color = clWhite
                DataSet = dmPaf.dstPafPrint
                DataField = 'salary'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -12
                Font.Name = 'Tahoma'
                Font.Style = [fsBold]
                ParentFont = False
                Transparent = False
                ExportAs = exptText
                WrapStyle = BreakOnSpaces
                FullJustify = False
                MaxBreakChars = 0
                FontSize = 9
              end
              object QRLabel36: TQRLabel
                Left = 10
                Top = 429
                Width = 39
                Height = 12
                Size.Values = (
                  45.357142857142860000
                  37.797619047619050000
                  1621.517857142857000000
                  147.410714285714300000)
                XLColumn = 0
                Alignment = taLeftJustify
                AlignToBand = False
                Caption = 'Reminder:'
                Color = clWhite
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -12
                Font.Name = 'Tahoma'
                Font.Style = [fsItalic]
                ParentFont = False
                Transparent = False
                ExportAs = exptText
                WrapStyle = BreakOnSpaces
                FontSize = 9
              end
              object QRLabel37: TQRLabel
                Left = 22
                Top = 442
                Width = 491
                Height = 33
                Size.Values = (
                  124.732142857142900000
                  83.154761904761900000
                  1670.654761904762000000
                  1855.863095238095000000)
                XLColumn = 0
                Alignment = taLeftJustify
                AlignToBand = False
                AutoSize = False
                Caption = 
                  'Sec. 4.2(b) Salary is classified as confidential information. Th' +
                  'e mere inquiry of an employee about his/her co-employee'#39's salary' +
                  ' is a minor offense as well as the disclosure of ones own salary' +
                  '. This also applies to any monetary benefits/allowances received' +
                  ' by any employee.'
                Color = clWhite
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -12
                Font.Name = 'Tahoma'
                Font.Style = [fsItalic]
                ParentFont = False
                Transparent = False
                ExportAs = exptText
                WrapStyle = BreakOnSpaces
                FontSize = 9
              end
              object QRDBText11: TQRDBText
                Left = 335
                Top = 175
                Width = 67
                Height = 99
                Size.Values = (
                  374.196428571428600000
                  1266.220238095238000000
                  661.458333333333200000
                  253.244047619047600000)
                XLColumn = 0
                Alignment = taLeftJustify
                AlignToBand = False
                AutoSize = False
                AutoStretch = True
                Color = clWhite
                DataSet = dmPaf.dstPafPrint
                DataField = 'position_previous'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -12
                Font.Name = 'Tahoma'
                Font.Style = [fsBold]
                ParentFont = False
                Transparent = False
                ExportAs = exptText
                WrapStyle = BreakOnSpaces
                FullJustify = False
                MaxBreakChars = 0
                FontSize = 9
              end
              object QRDBText12: TQRDBText
                Left = 335
                Top = 281
                Width = 67
                Height = 99
                Size.Values = (
                  374.196428571428600000
                  1266.220238095238000000
                  1062.113095238095000000
                  253.244047619047600000)
                XLColumn = 0
                Alignment = taLeftJustify
                AlignToBand = False
                AutoSize = False
                AutoStretch = True
                Color = clWhite
                DataSet = dmPaf.dstPafPrint
                DataField = 'position2'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -12
                Font.Name = 'Tahoma'
                Font.Style = [fsBold]
                ParentFont = False
                Transparent = False
                ExportAs = exptText
                WrapStyle = BreakOnSpaces
                FullJustify = False
                MaxBreakChars = 0
                FontSize = 9
              end
              object QRDBText13: TQRDBText
                Left = 410
                Top = 175
                Width = 67
                Height = 99
                Size.Values = (
                  374.196428571428600000
                  1549.702380952381000000
                  661.458333333333200000
                  253.244047619047600000)
                XLColumn = 0
                Alignment = taLeftJustify
                AlignToBand = False
                AutoSize = False
                AutoStretch = True
                Color = clWhite
                DataSet = dmPaf.dstPafPrint
                DataField = 'location_previous'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -12
                Font.Name = 'Tahoma'
                Font.Style = [fsBold]
                ParentFont = False
                Transparent = False
                ExportAs = exptText
                WrapStyle = BreakOnSpaces
                FullJustify = False
                MaxBreakChars = 0
                FontSize = 9
              end
              object QRDBText14: TQRDBText
                Left = 410
                Top = 281
                Width = 67
                Height = 99
                Size.Values = (
                  374.196428571428600000
                  1549.702380952381000000
                  1062.113095238095000000
                  253.244047619047600000)
                XLColumn = 0
                Alignment = taLeftJustify
                AlignToBand = False
                AutoSize = False
                AutoStretch = True
                Color = clWhite
                DataSet = dmPaf.dstPafPrint
                DataField = 'location2'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -12
                Font.Name = 'Tahoma'
                Font.Style = [fsBold]
                ParentFont = False
                Transparent = False
                ExportAs = exptText
                WrapStyle = BreakOnSpaces
                FullJustify = False
                MaxBreakChars = 0
                FontSize = 9
              end
              object QRDBText15: TQRDBText
                Left = 484
                Top = 175
                Width = 34
                Height = 99
                Size.Values = (
                  374.196428571428600000
                  1829.404761904762000000
                  661.458333333333200000
                  128.511904761904800000)
                XLColumn = 0
                Alignment = taLeftJustify
                AlignToBand = False
                AutoSize = False
                AutoStretch = True
                Color = clWhite
                DataSet = dmPaf.dstPafPrint
                DataField = 'job_level_previous'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -12
                Font.Name = 'Tahoma'
                Font.Style = [fsBold]
                ParentFont = False
                Transparent = False
                ExportAs = exptText
                WrapStyle = BreakOnSpaces
                FullJustify = False
                MaxBreakChars = 0
                FontSize = 9
              end
              object QRDBText16: TQRDBText
                Left = 484
                Top = 281
                Width = 34
                Height = 99
                Size.Values = (
                  374.196428571428600000
                  1829.404761904762000000
                  1062.113095238095000000
                  128.511904761904800000)
                XLColumn = 0
                Alignment = taLeftJustify
                AlignToBand = False
                AutoSize = False
                AutoStretch = True
                Color = clWhite
                DataSet = dmPaf.dstPafPrint
                DataField = 'job_level2'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -12
                Font.Name = 'Tahoma'
                Font.Style = [fsBold]
                ParentFont = False
                Transparent = False
                ExportAs = exptText
                WrapStyle = BreakOnSpaces
                FullJustify = False
                MaxBreakChars = 0
                FontSize = 9
              end
              object QRDBText17: TQRDBText
                Left = 407
                Top = 41
                Width = 111
                Height = 12
                Size.Values = (
                  45.357142857142860000
                  1538.363095238095000000
                  154.970238095238100000
                  419.553571428571400000)
                XLColumn = 0
                Alignment = taLeftJustify
                AlignToBand = False
                AutoSize = False
                Color = clWhite
                DataSet = dmPaf.dstPafPrint
                DataField = 'employment_status'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -12
                Font.Name = 'Tahoma'
                Font.Style = [fsBold]
                ParentFont = False
                Transparent = False
                ExportAs = exptText
                WrapStyle = BreakOnSpaces
                FullJustify = False
                MaxBreakChars = 0
                FontSize = 9
              end
              object QRDBText18: TQRDBText
                Left = 407
                Top = 5
                Width = 111
                Height = 12
                Size.Values = (
                  45.357142857142860000
                  1538.363095238095000000
                  18.898809523809520000
                  419.553571428571400000)
                XLColumn = 0
                Alignment = taLeftJustify
                AlignToBand = False
                AutoSize = False
                Color = clWhite
                DataSet = dmPaf.dstPafPrint
                DataField = 'date_hired'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -12
                Font.Name = 'Tahoma'
                Font.Style = [fsBold]
                ParentFont = False
                Transparent = False
                ExportAs = exptText
                WrapStyle = BreakOnSpaces
                FullJustify = False
                MaxBreakChars = 0
                FontSize = 9
              end
              object QRDBText19: TQRDBText
                Left = 407
                Top = 23
                Width = 111
                Height = 12
                Size.Values = (
                  45.357142857142860000
                  1538.363095238095000000
                  86.934523809523810000
                  419.553571428571400000)
                XLColumn = 0
                Alignment = taLeftJustify
                AlignToBand = False
                AutoSize = False
                Color = clWhite
                DataSet = dmPaf.dstPafPrint
                DataField = 'date_regularized'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -12
                Font.Name = 'Tahoma'
                Font.Style = [fsBold]
                ParentFont = False
                Transparent = False
                ExportAs = exptText
                WrapStyle = BreakOnSpaces
                FullJustify = False
                MaxBreakChars = 0
                FontSize = 9
              end
              object QRDBText20: TQRDBText
                Left = 9
                Top = 564
                Width = 114
                Height = 10
                Size.Values = (
                  37.797619047619050000
                  34.017857142857140000
                  2131.785714285714000000
                  430.892857142857100000)
                XLColumn = 0
                Alignment = taCenter
                AlignToBand = False
                AutoSize = False
                Color = clWhite
                DataSet = dmPaf.dstPafSignatories
                DataField = 'human_resource'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Tahoma'
                Font.Style = [fsBold]
                ParentFont = False
                Transparent = False
                ExportAs = exptText
                WrapStyle = BreakOnSpaces
                FullJustify = False
                MaxBreakChars = 0
                FontSize = 8
              end
              object QRDBText23: TQRDBText
                Left = 399
                Top = 564
                Width = 121
                Height = 10
                Size.Values = (
                  37.797619047619050000
                  1508.125000000000000000
                  2131.785714285714000000
                  457.351190476190500000)
                XLColumn = 0
                Alignment = taCenter
                AlignToBand = False
                AutoSize = False
                Color = clWhite
                DataSet = dmPaf.dstPafSignatories
                DataField = 'chief_operating_officer'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Tahoma'
                Font.Style = [fsBold]
                ParentFont = False
                Transparent = False
                ExportAs = exptText
                WrapStyle = BreakOnSpaces
                FullJustify = False
                MaxBreakChars = 0
                FontSize = 8
              end
              object QRDBText24: TQRDBText
                Left = 249
                Top = 175
                Width = 75
                Height = 99
                Size.Values = (
                  374.196428571428600000
                  941.160714285714300000
                  661.458333333333300000
                  283.482142857142900000)
                XLColumn = 0
                Alignment = taRightJustify
                AlignToBand = False
                AutoSize = False
                AutoStretch = True
                Color = clWhite
                DataSet = dmPaf.dstPafPrint
                DataField = 'allowances_previous_amount'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -12
                Font.Name = 'Tahoma'
                Font.Style = [fsBold]
                ParentFont = False
                Transparent = False
                ExportAs = exptText
                WrapStyle = BreakOnSpaces
                FullJustify = False
                MaxBreakChars = 0
                FontSize = 9
              end
              object QRDBText25: TQRDBText
                Left = 249
                Top = 280
                Width = 75
                Height = 99
                Size.Values = (
                  374.196428571428600000
                  941.160714285714300000
                  1058.333333333333000000
                  283.482142857142900000)
                XLColumn = 0
                Alignment = taRightJustify
                AlignToBand = False
                AutoSize = False
                AutoStretch = True
                Color = clWhite
                DataSet = dmPaf.dstPafPrint
                DataField = 'allowances_amount'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -12
                Font.Name = 'Tahoma'
                Font.Style = [fsBold]
                ParentFont = False
                Transparent = False
                ExportAs = exptText
                WrapStyle = BreakOnSpaces
                FullJustify = False
                MaxBreakChars = 0
                FontSize = 9
              end
              object lblBranchManager: TQRLabel
                Left = 132
                Top = 564
                Width = 128
                Height = 10
                Size.Values = (
                  37.797619047619050000
                  498.928571428571400000
                  2131.785714285714000000
                  483.809523809523800000)
                XLColumn = 0
                Alignment = taCenter
                AlignToBand = False
                AutoSize = False
                Caption = ''
                Color = clWhite
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Tahoma'
                Font.Style = [fsBold]
                ParentFont = False
                Transparent = False
                ExportAs = exptText
                WrapStyle = BreakOnSpaces
                FontSize = 8
              end
              object QRDBText21: TQRDBText
                Left = 56
                Top = 403
                Width = 462
                Height = 20
                Size.Values = (
                  75.595238095238100000
                  211.666666666666700000
                  1523.244047619048000000
                  1746.250000000000000000)
                XLColumn = 0
                Alignment = taLeftJustify
                AlignToBand = False
                AutoSize = False
                Color = clWhite
                DataSet = dmPaf.dstPafPrint
                DataField = 'paf_remarks'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -12
                Font.Name = 'Tahoma'
                Font.Style = []
                ParentFont = False
                Transparent = False
                ExportAs = exptText
                WrapStyle = BreakOnSpaces
                FullJustify = False
                MaxBreakChars = 0
                FontSize = 9
              end
              object lblAreaManager: TQRLabel
                Left = 265
                Top = 564
                Width = 128
                Height = 10
                Size.Values = (
                  37.797619047619050000
                  1001.636904761905000000
                  2131.785714285714000000
                  483.809523809523800000)
                XLColumn = 0
                Alignment = taCenter
                AlignToBand = False
                AutoSize = False
                Caption = ''
                Color = clWhite
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Tahoma'
                Font.Style = [fsBold]
                ParentFont = False
                Transparent = False
                ExportAs = exptText
                WrapStyle = BreakOnSpaces
                FontSize = 8
              end
            end
            object TitleBand1: TQRBand
              Left = 24
              Top = 24
              Width = 524
              Height = 45
              AlignToBottom = False
              Color = clWhite
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
                Width = 524
                Height = 14
                Size.Values = (
                  52.916666666666670000
                  0.000000000000000000
                  56.696428571428570000
                  1980.595238095238000000)
                XLColumn = 0
                Alignment = taCenter
                AlignToBand = False
                AutoSize = False
                Caption = 'P E R S O N N E L   A C T I O N   F O R M'
                Color = clWhite
                Font.Charset = ANSI_CHARSET
                Font.Color = clBlack
                Font.Height = -13
                Font.Name = 'Tahoma'
                Font.Style = []
                ParentFont = False
                Transparent = False
                ExportAs = exptText
                WrapStyle = BreakOnSpaces
                FontSize = 10
              end
              object QRLabel4: TQRLabel
                Left = 0
                Top = 0
                Width = 524
                Height = 17
                Size.Values = (
                  64.255952380952380000
                  0.000000000000000000
                  0.000000000000000000
                  1980.595238095238000000)
                XLColumn = 0
                Alignment = taCenter
                AlignToBand = False
                AutoSize = False
                Caption = 'Alano & Sons Credit Corporation'
                Color = clWhite
                Font.Charset = ANSI_CHARSET
                Font.Color = clRed
                Font.Height = -19
                Font.Name = 'Tahoma'
                Font.Style = [fsBold]
                ParentFont = False
                Transparent = True
                ExportAs = exptText
                WrapStyle = BreakOnSpaces
                FontSize = 14
              end
            end
          end
        end
        inherited pStatus: TPanel
          Top = 100
          ExplicitTop = 100
          inherited lblStatus: TLabel
            Width = 207
            Caption = 'Preparing PAF printout. Please wait...'
            ExplicitWidth = 207
          end
        end
        inherited p_ReportFooter: TPanel
          Top = 733
          Width = 593
          ExplicitTop = 733
          ExplicitWidth = 593
          inherited JvGroupBox1: TJvGroupBox
            Width = 591
            ExplicitWidth = 591
            inherited bFirst: TcxButton
              Left = 493
              OnClick = nil
              ExplicitLeft = 493
            end
            inherited bLast: TcxButton
              Left = 568
              OnClick = nil
              ExplicitLeft = 568
            end
            inherited bNext: TcxButton
              Left = 543
              OnClick = nil
              ExplicitLeft = 543
            end
            inherited bPrevious: TcxButton
              Left = 518
              OnClick = nil
              ExplicitLeft = 518
            end
            inherited speZoom: TcxSpinEdit
              ExplicitHeight = 22
            end
          end
        end
        object pnlSignatories: TPanel
          Left = 139
          Top = 200
          Width = 309
          Height = 153
          BevelOuter = bvNone
          Color = 13553358
          ParentBackground = False
          TabOrder = 4
          Visible = False
          object Shape1: TShape
            Left = 0
            Top = 0
            Width = 309
            Height = 153
            Align = alClient
            Brush.Color = clSilver
            ExplicitLeft = 144
            ExplicitTop = 40
            ExplicitWidth = 65
            ExplicitHeight = 65
          end
          object Label3: TLabel
            Left = 13
            Top = 15
            Width = 316
            Height = 18
            AutoSize = False
            Caption = 'Branch Manager / Department Head'
            WordWrap = True
          end
          object Label2: TLabel
            Left = 13
            Top = 70
            Width = 316
            Height = 18
            AutoSize = False
            Caption = 'Area Manager'
            WordWrap = True
          end
          object btnBranchManager: TcxButton
            Left = 13
            Top = 121
            Width = 75
            Height = 25
            Caption = 'OK'
            TabOrder = 0
            OnClick = btnBranchManagerClick
          end
          object cmbBranchManager: TcxComboBox
            Left = 13
            Top = 39
            TabOrder = 1
            Width = 280
          end
          object btnCancel: TcxButton
            Left = 88
            Top = 121
            Width = 75
            Height = 25
            Caption = 'Cancel'
            TabOrder = 2
            OnClick = btnCancelClick
          end
          object cmbAreaManager: TcxComboBox
            Left = 13
            Top = 91
            TabOrder = 3
            Width = 280
          end
        end
      end
    end
  end
end
