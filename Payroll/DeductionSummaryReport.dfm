inherited fDeductionSummaryReport: TfDeductionSummaryReport
  Caption = 'fDeductionSummaryReport'
  ClientHeight = 586
  ClientWidth = 994
  ExplicitWidth = 1010
  ExplicitHeight = 625
  PixelsPerInch = 96
  TextHeight = 14
  inherited pcMain: TJvPageControl
    Width = 994
    Height = 586
    ExplicitWidth = 994
    ExplicitHeight = 586
    inherited tsMain: TTabSheet
      Caption = 'Deduction Summary Report'
      ExplicitWidth = 986
      ExplicitHeight = 557
      inherited pnlMain: TPanel
        Width = 986
        Height = 557
        ExplicitWidth = 986
        ExplicitHeight = 557
        inherited pnlLeft: TPanel
          Width = 976
          ExplicitWidth = 976
          inherited btnPrint: TcxButton
            Left = 863
            ExplicitLeft = 863
          end
          inherited bGenerate: TcxButton
            Left = 744
            Visible = False
            ExplicitLeft = 744
          end
        end
        inherited pnlReport: TPanel
          Width = 976
          Height = 474
          ExplicitWidth = 976
          ExplicitHeight = 474
          inherited rvMain: TQRPreview
            Width = 976
            Height = 474
            ExplicitWidth = 976
            ExplicitHeight = 474
          end
          inherited qrMain: TQuickRep
            Tag = 1
            Width = 941
            Height = 571
            BeforePrint = qrMainBeforePrint
            DataSet = dmPayroll.dstDeductionSummary
            Functions.Strings = (
              'PAGENUMBER'
              'COLUMNNUMBER'
              'REPORTTITLE'
              'QRSTRINGSBAND1')
            Functions.DATA = (
              '0'
              '0'
              #39#39
              #39#39)
            Page.Orientation = poLandscape
            Page.PaperSize = Legal
            Page.Values = (
              88.900000000000000000
              2159.000000000000000000
              88.900000000000000000
              3556.000000000000000000
              88.900000000000000000
              88.900000000000000000
              0.000000000000000000)
            ExplicitWidth = 941
            ExplicitHeight = 571
            object TitleBand1: TQRBand
              Left = 24
              Top = 24
              Width = 894
              Height = 64
              AlignToBottom = False
              Color = clWhite
              TransparentBand = False
              ForceNewColumn = False
              ForceNewPage = False
              Size.Values = (
                241.904761904761900000
                3379.107142857143000000)
              PreCaluculateBandHeight = False
              KeepOnOnePage = False
              BandType = rbTitle
              object ReportTitle: TQRLabel
                Left = 0
                Top = 15
                Width = 889
                Height = 14
                Size.Values = (
                  52.916666666666670000
                  0.000000000000000000
                  56.696428571428570000
                  3360.208333333333000000)
                XLColumn = 0
                Alignment = taCenter
                AlignToBand = False
                AutoSize = False
                Caption = 'Deduction Summary Report'
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
                Width = 890
                Height = 17
                Size.Values = (
                  64.255952380952380000
                  0.000000000000000000
                  0.000000000000000000
                  3363.988095238095000000)
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
              object QRExpr3: TQRExpr
                Left = 0
                Top = 26
                Width = 889
                Height = 12
                Size.Values = (
                  45.357142857142860000
                  0.000000000000000000
                  98.273809523809520000
                  3360.208333333333000000)
                XLColumn = 0
                Alignment = taCenter
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
                Expression = 'payroll_period'
                ExportAs = exptText
                WrapStyle = BreakOnSpaces
                FontSize = 10
              end
            end
            object ColumnHeaderBand: TQRBand
              Left = 24
              Top = 88
              Width = 894
              Height = 32
              AlignToBottom = False
              Color = clWhite
              TransparentBand = False
              ForceNewColumn = False
              ForceNewPage = False
              Size.Values = (
                120.952380952381000000
                3379.107142857143000000)
              PreCaluculateBandHeight = False
              KeepOnOnePage = False
              BandType = rbColumnHeader
              object QRShape1: TQRShape
                Left = 0
                Top = 1
                Width = 890
                Height = 30
                Size.Values = (
                  113.392857142857100000
                  0.000000000000000000
                  3.779761904761905000
                  3363.988095238095000000)
                XLColumn = 0
                Shape = qrsTopAndBottom
                VertAdjust = 0
              end
              object QRLabel1: TQRLabel
                Left = 23
                Top = 3
                Width = 23
                Height = 12
                Size.Values = (
                  45.357142857142860000
                  86.934523809523810000
                  11.339285714285710000
                  86.934523809523810000)
                XLColumn = 0
                Alignment = taLeftJustify
                AlignToBand = False
                Caption = 'Name'
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
              object QRLabel2: TQRLabel
                Left = 865
                Top = 3
                Width = 21
                Height = 12
                Size.Values = (
                  45.357142857142860000
                  3269.494047619048000000
                  11.339285714285710000
                  79.375000000000000000)
                XLColumn = 0
                Alignment = taRightJustify
                AlignToBand = False
                Caption = 'Total'
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
            object DetailBand: TQRBand
              Left = 24
              Top = 136
              Width = 894
              Height = 12
              AlignToBottom = False
              Color = clWhite
              TransparentBand = False
              ForceNewColumn = False
              ForceNewPage = False
              Size.Values = (
                45.357142857142860000
                3379.107142857143000000)
              PreCaluculateBandHeight = False
              KeepOnOnePage = False
              BandType = rbDetail
              object QRDBText1: TQRDBText
                Left = 23
                Top = 1
                Width = 158
                Height = 10
                Size.Values = (
                  37.797619047619050000
                  86.934523809523810000
                  3.779761904761905000
                  597.202380952381000000)
                XLColumn = 0
                Alignment = taLeftJustify
                AlignToBand = False
                AutoSize = False
                Color = clWhite
                DataSet = dmPayroll.dstDeductionSummary
                DataField = 'employee_name'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Tahoma'
                Font.Style = []
                ParentFont = False
                Transparent = False
                ExportAs = exptText
                WrapStyle = BreakOnSpaces
                FullJustify = False
                MaxBreakChars = 0
                FontSize = 8
              end
              object QRExpr2: TQRExpr
                Left = 690
                Top = 1
                Width = 196
                Height = 10
                Size.Values = (
                  37.797619047619050000
                  2608.035714285714000000
                  3.779761904761905000
                  740.833333333333300000)
                XLColumn = 0
                Alignment = taRightJustify
                AlignToBand = False
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Tahoma'
                Font.Style = [fsBold]
                Color = clWhite
                ParentFont = False
                ResetAfterPrint = False
                Transparent = False
                Expression = 'FORMATNUMERIC('#39'###,##0.00'#39',total_deduction)'
                ExportAs = exptText
                WrapStyle = BreakOnSpaces
                FontSize = 8
              end
            end
            object QRGroup1: TQRGroup
              Left = 24
              Top = 120
              Width = 894
              Height = 16
              AlignToBottom = False
              Color = 15395562
              TransparentBand = False
              ForceNewColumn = False
              ForceNewPage = False
              Size.Values = (
                60.476190476190480000
                3379.107142857143000000)
              PreCaluculateBandHeight = False
              KeepOnOnePage = False
              Expression = 'location_name'
              FooterBand = GroupFooterBand
              Master = qrMain
              ReprintOnNewPage = False
              object QRDBText3: TQRDBText
                Left = 6
                Top = 2
                Width = 158
                Height = 12
                Size.Values = (
                  45.357142857142860000
                  22.678571428571430000
                  7.559523809523810000
                  597.202380952381000000)
                XLColumn = 0
                Alignment = taLeftJustify
                AlignToBand = False
                AutoSize = False
                Color = 15395562
                DataSet = dmPayroll.dstDeductionSummary
                DataField = 'location_name'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -13
                Font.Name = 'Tahoma'
                Font.Style = [fsBold]
                ParentFont = False
                Transparent = False
                ExportAs = exptText
                WrapStyle = BreakOnSpaces
                FullJustify = False
                MaxBreakChars = 0
                FontSize = 10
              end
            end
            object GroupFooterBand: TQRBand
              Left = 24
              Top = 148
              Width = 894
              Height = 22
              AlignToBottom = False
              Color = clWhite
              TransparentBand = False
              ForceNewColumn = False
              ForceNewPage = False
              Size.Values = (
                83.154761904761900000
                3379.107142857143000000)
              PreCaluculateBandHeight = False
              KeepOnOnePage = False
              BandType = rbGroupFooter
              object QRShape2: TQRShape
                Left = 0
                Top = 1
                Width = 894
                Height = 2
                Size.Values = (
                  7.559523809523810000
                  0.000000000000000000
                  3.779761904761905000
                  3379.107142857143000000)
                XLColumn = 0
                Pen.Style = psDot
                Shape = qrsHorLine
                VertAdjust = 0
              end
              object QRExpr1: TQRExpr
                Left = 665
                Top = 3
                Width = 221
                Height = 12
                Size.Values = (
                  45.357142857142860000
                  2513.541666666667000000
                  11.339285714285710000
                  835.327380952381000000)
                XLColumn = 0
                Alignment = taRightJustify
                AlignToBand = False
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -11
                Font.Name = 'Tahoma'
                Font.Style = [fsBold]
                Color = clWhite
                ParentFont = False
                ResetAfterPrint = True
                Transparent = False
                Expression = 'FORMATNUMERIC('#39'###,##0.00'#39',SUM(total_deduction))'
                ExportAs = exptText
                WrapStyle = BreakOnSpaces
                FontSize = 8
              end
            end
            object SummaryBand: TQRBand
              Left = 24
              Top = 170
              Width = 894
              Height = 39
              AlignToBottom = False
              Color = clWhite
              TransparentBand = False
              ForceNewColumn = False
              ForceNewPage = False
              Size.Values = (
                147.410714285714300000
                3379.107142857143000000)
              PreCaluculateBandHeight = False
              KeepOnOnePage = False
              BandType = rbSummary
              object QRShape3: TQRShape
                Left = 0
                Top = 1
                Width = 890
                Height = 3
                Size.Values = (
                  11.339285714285710000
                  0.000000000000000000
                  3.779761904761905000
                  3363.988095238095000000)
                XLColumn = 0
                Shape = qrsHorLine
                VertAdjust = 0
              end
              object QRExpr4: TQRExpr
                Left = 665
                Top = 7
                Width = 221
                Height = 12
                Size.Values = (
                  45.357142857142860000
                  2513.541666666667000000
                  26.458333333333330000
                  835.327380952381000000)
                XLColumn = 0
                Alignment = taRightJustify
                AlignToBand = False
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -11
                Font.Name = 'Tahoma'
                Font.Style = [fsBold]
                Color = clWhite
                ParentFont = False
                ResetAfterPrint = False
                Transparent = False
                Expression = 'FORMATNUMERIC('#39'###,##0.00'#39',SUM(total_deduction))'
                ExportAs = exptText
                WrapStyle = BreakOnSpaces
                FontSize = 8
              end
              object QRLabel3: TQRLabel
                Left = 6
                Top = 7
                Width = 51
                Height = 12
                Size.Values = (
                  45.357142857142860000
                  22.678571428571430000
                  26.458333333333330000
                  192.767857142857100000)
                XLColumn = 0
                Alignment = taLeftJustify
                AlignToBand = False
                Caption = 'Overall Total'
                Color = clWhite
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
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
            object PageFooterBand1: TQRBand
              Left = 24
              Top = 209
              Width = 894
              Height = 19
              AlignToBottom = False
              Color = clWhite
              TransparentBand = False
              ForceNewColumn = False
              ForceNewPage = False
              Size.Values = (
                71.815476190476190000
                3379.107142857143000000)
              PreCaluculateBandHeight = False
              KeepOnOnePage = False
              BandType = rbPageFooter
              object QRExpr6: TQRExpr
                Left = 845
                Top = 7
                Width = 48
                Height = 10
                Size.Values = (
                  37.797619047619050000
                  3193.898809523810000000
                  26.458333333333330000
                  181.428571428571400000)
                XLColumn = 0
                Alignment = taRightJustify
                AlignToBand = False
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Tahoma'
                Font.Style = []
                Color = clWhite
                ParentFont = False
                ResetAfterPrint = False
                Transparent = False
                Expression = 'PAGENUMBER'
                ExportAs = exptText
                WrapStyle = BreakOnSpaces
                FontSize = 8
              end
              object QRShape16: TQRShape
                AlignWithMargins = True
                Left = 0
                Top = 1
                Width = 890
                Height = 3
                Size.Values = (
                  11.339285714285710000
                  0.000000000000000000
                  3.779761904761905000
                  3363.988095238095000000)
                XLColumn = 0
                Shape = qrsTopAndBottom
                VertAdjust = 0
              end
              object QRExpr7: TQRExpr
                Left = 3
                Top = 5
                Width = 262
                Height = 12
                Size.Values = (
                  45.357142857142860000
                  11.339285714285710000
                  18.898809523809520000
                  990.297619047619000000)
                XLColumn = 0
                Alignment = taLeftJustify
                AlignToBand = False
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -11
                Font.Name = 'Tahoma'
                Font.Style = []
                Color = clWhite
                ParentFont = False
                ResetAfterPrint = False
                Transparent = False
                Expression = 
                  #39'Print date: '#39' + REFORMATDATE(DATE + TIME,'#39'mmm dd, yyyy hh:mm am' +
                  '/pm'#39')'
                ExportAs = exptText
                WrapStyle = BreakOnSpaces
                FontSize = 8
              end
            end
          end
        end
        inherited p_ReportFooter: TPanel
          Top = 519
          Width = 976
          ExplicitTop = 519
          ExplicitWidth = 976
          inherited JvGroupBox1: TJvGroupBox
            Width = 974
            ExplicitWidth = 974
            inherited bFirst: TcxButton
              Left = 872
              ExplicitLeft = 872
            end
            inherited bLast: TcxButton
              Left = 947
              ExplicitLeft = 947
            end
            inherited bNext: TcxButton
              Left = 922
              ExplicitLeft = 922
            end
            inherited bPrevious: TcxButton
              Left = 897
              ExplicitLeft = 897
            end
            inherited speZoom: TcxSpinEdit
              ExplicitHeight = 22
            end
          end
        end
      end
    end
  end
end
