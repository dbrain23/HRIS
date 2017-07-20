inherited fPayslips: TfPayslips
  Caption = 'fPayslips'
  ClientHeight = 833
  ClientWidth = 674
  ExplicitWidth = 690
  ExplicitHeight = 872
  PixelsPerInch = 96
  TextHeight = 14
  inherited pcMain: TJvPageControl
    Width = 674
    Height = 833
    ExplicitWidth = 674
    ExplicitHeight = 658
    inherited tsMain: TTabSheet
      Caption = 'Payslips'
      ExplicitWidth = 666
      ExplicitHeight = 629
      inherited pnlMain: TPanel
        Width = 666
        Height = 804
        ExplicitWidth = 666
        ExplicitHeight = 629
        inherited pnlLeft: TPanel
          Width = 656
          ExplicitWidth = 656
          inherited btnPrint: TcxButton
            Left = 543
            ExplicitLeft = 543
          end
          inherited bGenerate: TcxButton
            Visible = False
          end
        end
        inherited pnlReport: TPanel
          Width = 656
          Height = 721
          ExplicitWidth = 656
          ExplicitHeight = 546
          inherited rvMain: TQRPreview
            Width = 656
            Height = 721
            ExplicitWidth = 656
            ExplicitHeight = 546
          end
          inherited qrMain: TQuickRep
            Left = 11
            Height = 874
            Functions.DATA = (
              '0'
              '0'
              #39#39)
            Page.Columns = 2
            Page.PaperSize = Folio
            Page.Values = (
              37.797619047619050000
              3302.000000000000000000
              37.797619047619050000
              2159.000000000000000000
              88.900000000000000000
              88.900000000000000000
              0.000000000000000000)
            ExplicitLeft = 11
            ExplicitHeight = 874
            object DetailBand: TQRBand
              Left = 24
              Top = 10
              Width = 262
              Height = 411
              AlignToBottom = False
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
                1553.482142857143000000
                990.297619047619000000)
              PreCaluculateBandHeight = False
              KeepOnOnePage = True
              BandType = rbDetail
              object QRShape1: TQRShape
                Left = 0
                Top = 0
                Width = 260
                Height = 410
                Size.Values = (
                  1549.702380952381000000
                  0.000000000000000000
                  0.000000000000000000
                  982.738095238095200000)
                XLColumn = 0
                Shape = qrsRectangle
                VertAdjust = 0
              end
              object QRLabel16: TQRLabel
                Left = 3
                Top = 29
                Width = 20
                Height = 10
                Size.Values = (
                  37.797619047619050000
                  11.339285714285710000
                  109.613095238095200000
                  75.595238095238100000)
                XLColumn = 0
                Alignment = taLeftJustify
                AlignToBand = False
                Caption = 'Name'
                Color = clWhite
                Font.Charset = ANSI_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Tahoma'
                Font.Style = []
                ParentFont = False
                Transparent = False
                ExportAs = exptText
                WrapStyle = BreakOnSpaces
                FontSize = 8
              end
              object QRLabel17: TQRLabel
                Left = 3
                Top = 41
                Width = 46
                Height = 10
                Size.Values = (
                  37.797619047619050000
                  11.339285714285710000
                  154.970238095238100000
                  173.869047619047600000)
                XLColumn = 0
                Alignment = taLeftJustify
                AlignToBand = False
                Caption = 'Payroll Period'
                Color = clWhite
                Font.Charset = ANSI_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Tahoma'
                Font.Style = []
                ParentFont = False
                Transparent = False
                ExportAs = exptText
                WrapStyle = BreakOnSpaces
                FontSize = 8
              end
              object QRDBText16: TQRDBText
                Left = 71
                Top = 29
                Width = 186
                Height = 10
                Size.Values = (
                  37.797619047619050000
                  268.363095238095200000
                  109.613095238095200000
                  703.035714285714300000)
                XLColumn = 0
                Alignment = taLeftJustify
                AlignToBand = False
                AutoSize = False
                Color = clWhite
                DataSet = dmPayroll.dstPayslips
                DataField = 'employee_name'
                Font.Charset = ANSI_CHARSET
                Font.Color = clBlue
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
              object QRDBText17: TQRDBText
                Left = 71
                Top = 41
                Width = 186
                Height = 10
                Size.Values = (
                  37.797619047619050000
                  268.363095238095200000
                  154.970238095238100000
                  703.035714285714300000)
                XLColumn = 0
                Alignment = taLeftJustify
                AlignToBand = False
                AutoSize = False
                Color = clWhite
                DataSet = dmPayroll.dstPayslips
                DataField = 'payroll_period'
                Font.Charset = ANSI_CHARSET
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
              object QRLabel1: TQRLabel
                Left = 3
                Top = 3
                Width = 256
                Height = 13
                Size.Values = (
                  49.136904761904760000
                  11.339285714285710000
                  11.339285714285710000
                  967.619047619047600000)
                XLColumn = 0
                Alignment = taCenter
                AlignToBand = False
                AutoSize = False
                Caption = 'ALANO & SONS CREDIT CORPORATION'
                Color = clWhite
                Font.Charset = ANSI_CHARSET
                Font.Color = clRed
                Font.Height = -13
                Font.Name = 'Tahoma'
                Font.Style = [fsBold]
                ParentFont = False
                Transparent = False
                ExportAs = exptText
                WrapStyle = BreakOnSpaces
                FontSize = 10
              end
              object QRLabel2: TQRLabel
                Left = 3
                Top = 14
                Width = 256
                Height = 12
                Size.Values = (
                  45.357142857142860000
                  11.339285714285710000
                  52.916666666666670000
                  967.619047619047600000)
                XLColumn = 0
                Alignment = taCenter
                AlignToBand = False
                AutoSize = False
                Caption = 'P A Y S L I P'
                Color = clWhite
                Font.Charset = ANSI_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Tahoma'
                Font.Style = []
                ParentFont = False
                Transparent = False
                ExportAs = exptText
                WrapStyle = BreakOnSpaces
                FontSize = 8
              end
              object QRLabel3: TQRLabel
                Left = 3
                Top = 53
                Width = 47
                Height = 10
                Size.Values = (
                  37.797619047619050000
                  11.339285714285710000
                  200.327380952381000000
                  177.648809523809500000)
                XLColumn = 0
                Alignment = taLeftJustify
                AlignToBand = False
                Caption = 'Working Days'
                Color = clWhite
                Font.Charset = ANSI_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Tahoma'
                Font.Style = []
                ParentFont = False
                Transparent = False
                ExportAs = exptText
                WrapStyle = BreakOnSpaces
                FontSize = 8
              end
              object QRDBText1: TQRDBText
                Left = 71
                Top = 53
                Width = 50
                Height = 10
                Size.Values = (
                  37.797619047619050000
                  268.363095238095200000
                  200.327380952381000000
                  188.988095238095200000)
                XLColumn = 0
                Alignment = taCenter
                AlignToBand = False
                AutoSize = False
                Color = clWhite
                DataSet = dmPayroll.dstPayslips
                DataField = 'working_days'
                Font.Charset = ANSI_CHARSET
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
              object QRLabel4: TQRLabel
                Left = 3
                Top = 356
                Width = 69
                Height = 10
                Size.Values = (
                  37.797619047619050000
                  11.339285714285710000
                  1345.595238095238000000
                  260.803571428571400000)
                XLColumn = 0
                Alignment = taLeftJustify
                AlignToBand = False
                Caption = 'Net Take Home Pay:'
                Color = clWhite
                Font.Charset = ANSI_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Tahoma'
                Font.Style = []
                ParentFont = False
                Transparent = False
                ExportAs = exptText
                WrapStyle = BreakOnSpaces
                FontSize = 8
              end
              object QRDBText2: TQRDBText
                Left = 92
                Top = 356
                Width = 160
                Height = 10
                Size.Values = (
                  37.797619047619050000
                  347.738095238095200000
                  1345.595238095238000000
                  604.761904761904800000)
                XLColumn = 0
                Alignment = taRightJustify
                AlignToBand = False
                AutoSize = False
                Color = clWhite
                DataSet = dmPayroll.dstPayslips
                DataField = 'net'
                Font.Charset = ANSI_CHARSET
                Font.Color = clBlue
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
              object QRLabel5: TQRLabel
                Left = 131
                Top = 53
                Width = 51
                Height = 10
                Size.Values = (
                  37.797619047619050000
                  495.148809523809500000
                  200.327380952381000000
                  192.767857142857100000)
                XLColumn = 0
                Alignment = taLeftJustify
                AlignToBand = False
                Caption = 'Days Attended'
                Color = clWhite
                Font.Charset = ANSI_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Tahoma'
                Font.Style = []
                ParentFont = False
                Transparent = False
                ExportAs = exptText
                WrapStyle = BreakOnSpaces
                FontSize = 8
              end
              object QRDBText3: TQRDBText
                Left = 202
                Top = 53
                Width = 50
                Height = 10
                Size.Values = (
                  37.797619047619050000
                  763.511904761904800000
                  200.327380952381000000
                  188.988095238095200000)
                XLColumn = 0
                Alignment = taCenter
                AlignToBand = False
                AutoSize = False
                Color = clWhite
                DataSet = dmPayroll.dstPayslips
                DataField = 'days_attended'
                Font.Charset = ANSI_CHARSET
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
              object QRLabel6: TQRLabel
                Left = 3
                Top = 65
                Width = 29
                Height = 10
                Size.Values = (
                  37.797619047619050000
                  11.339285714285710000
                  245.684523809523800000
                  109.613095238095200000)
                XLColumn = 0
                Alignment = taLeftJustify
                AlignToBand = False
                Caption = 'Holidays'
                Color = clWhite
                Font.Charset = ANSI_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Tahoma'
                Font.Style = []
                ParentFont = False
                Transparent = False
                ExportAs = exptText
                WrapStyle = BreakOnSpaces
                FontSize = 8
              end
              object QRDBText4: TQRDBText
                Left = 71
                Top = 65
                Width = 50
                Height = 10
                Size.Values = (
                  37.797619047619050000
                  268.363095238095200000
                  245.684523809523800000
                  188.988095238095200000)
                XLColumn = 0
                Alignment = taCenter
                AlignToBand = False
                AutoSize = False
                Color = clWhite
                DataSet = dmPayroll.dstPayslips
                DataField = 'holidays'
                Font.Charset = ANSI_CHARSET
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
              object QRLabel7: TQRLabel
                Left = 131
                Top = 65
                Width = 46
                Height = 10
                Size.Values = (
                  37.797619047619050000
                  495.148809523809500000
                  245.684523809523800000
                  173.869047619047600000)
                XLColumn = 0
                Alignment = taLeftJustify
                AlignToBand = False
                Caption = 'Leave w/ Pay'
                Color = clWhite
                Font.Charset = ANSI_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Tahoma'
                Font.Style = []
                ParentFont = False
                Transparent = False
                ExportAs = exptText
                WrapStyle = BreakOnSpaces
                FontSize = 8
              end
              object QRDBText5: TQRDBText
                Left = 202
                Top = 65
                Width = 50
                Height = 10
                Size.Values = (
                  37.797619047619050000
                  763.511904761904800000
                  245.684523809523800000
                  188.988095238095200000)
                XLColumn = 0
                Alignment = taCenter
                AlignToBand = False
                AutoSize = False
                Color = clWhite
                DataSet = dmPayroll.dstPayslips
                DataField = 'leave_with_pay'
                Font.Charset = ANSI_CHARSET
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
              object QRShape2: TQRShape
                Left = 0
                Top = 27
                Width = 260
                Height = 1
                Size.Values = (
                  3.779761904761905000
                  0.000000000000000000
                  102.053571428571400000
                  982.738095238095200000)
                XLColumn = 0
                Shape = qrsHorLine
                VertAdjust = 0
              end
              object QRShape3: TQRShape
                Left = 0
                Top = 39
                Width = 260
                Height = 1
                Size.Values = (
                  3.779761904761905000
                  0.000000000000000000
                  147.410714285714300000
                  982.738095238095200000)
                XLColumn = 0
                Shape = qrsHorLine
                VertAdjust = 0
              end
              object QRShape4: TQRShape
                Left = 0
                Top = 51
                Width = 260
                Height = 1
                Size.Values = (
                  3.779761904761905000
                  0.000000000000000000
                  192.767857142857100000
                  982.738095238095200000)
                XLColumn = 0
                Shape = qrsHorLine
                VertAdjust = 0
              end
              object QRShape5: TQRShape
                Left = 0
                Top = 63
                Width = 260
                Height = 1
                Size.Values = (
                  3.779761904761905000
                  0.000000000000000000
                  238.125000000000000000
                  982.738095238095200000)
                XLColumn = 0
                Shape = qrsHorLine
                VertAdjust = 0
              end
              object QRShape6: TQRShape
                Left = 0
                Top = 75
                Width = 260
                Height = 1
                Size.Values = (
                  3.779761904761905000
                  0.000000000000000000
                  283.482142857142900000
                  982.738095238095200000)
                XLColumn = 0
                Shape = qrsHorLine
                VertAdjust = 0
              end
              object QRShape7: TQRShape
                Left = 66
                Top = 27
                Width = 1
                Height = 73
                Size.Values = (
                  275.922619047619000000
                  249.464285714285700000
                  102.053571428571400000
                  3.779761904761905000)
                XLColumn = 0
                Shape = qrsVertLine
                VertAdjust = 0
              end
              object QRShape8: TQRShape
                Left = 126
                Top = 51
                Width = 1
                Height = 49
                Size.Values = (
                  185.208333333333300000
                  476.250000000000000000
                  192.767857142857100000
                  3.779761904761905000)
                XLColumn = 0
                Shape = qrsVertLine
                VertAdjust = 0
              end
              object QRShape9: TQRShape
                Left = 195
                Top = 51
                Width = 1
                Height = 303
                Size.Values = (
                  1145.267857142857000000
                  737.053571428571400000
                  192.767857142857100000
                  3.779761904761905000)
                XLColumn = 0
                Shape = qrsVertLine
                VertAdjust = 0
              end
              object QRLabel8: TQRLabel
                Left = 3
                Top = 77
                Width = 35
                Height = 10
                Size.Values = (
                  37.797619047619050000
                  11.339285714285710000
                  291.041666666666700000
                  132.291666666666700000)
                XLColumn = 0
                Alignment = taLeftJustify
                AlignToBand = False
                Caption = 'Undertime'
                Color = clWhite
                Font.Charset = ANSI_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Tahoma'
                Font.Style = []
                ParentFont = False
                Transparent = False
                ExportAs = exptText
                WrapStyle = BreakOnSpaces
                FontSize = 8
              end
              object QRLabel9: TQRLabel
                Left = 3
                Top = 89
                Width = 22
                Height = 10
                Size.Values = (
                  37.797619047619050000
                  11.339285714285710000
                  336.398809523809500000
                  83.154761904761900000)
                XLColumn = 0
                Alignment = taLeftJustify
                AlignToBand = False
                Caption = 'AWOL'
                Color = clWhite
                Font.Charset = ANSI_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Tahoma'
                Font.Style = []
                ParentFont = False
                Transparent = False
                ExportAs = exptText
                WrapStyle = BreakOnSpaces
                FontSize = 8
              end
              object QRDBText6: TQRDBText
                Left = 71
                Top = 89
                Width = 50
                Height = 10
                Size.Values = (
                  37.797619047619050000
                  268.363095238095200000
                  336.398809523809500000
                  188.988095238095200000)
                XLColumn = 0
                Alignment = taCenter
                AlignToBand = False
                AutoSize = False
                Color = clWhite
                DataSet = dmPayroll.dstPayslips
                DataField = 'awol'
                Font.Charset = ANSI_CHARSET
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
              object QRDBText7: TQRDBText
                Left = 71
                Top = 77
                Width = 50
                Height = 10
                Size.Values = (
                  37.797619047619050000
                  268.363095238095200000
                  291.041666666666700000
                  188.988095238095200000)
                XLColumn = 0
                Alignment = taCenter
                AlignToBand = False
                AutoSize = False
                Color = clWhite
                DataSet = dmPayroll.dstPayslips
                DataField = 'undertime'
                Font.Charset = ANSI_CHARSET
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
              object QRLabel10: TQRLabel
                Left = 131
                Top = 77
                Width = 50
                Height = 10
                Size.Values = (
                  37.797619047619050000
                  495.148809523809500000
                  291.041666666666700000
                  188.988095238095200000)
                XLColumn = 0
                Alignment = taLeftJustify
                AlignToBand = False
                Caption = 'Leave w/o Pay'
                Color = clWhite
                Font.Charset = ANSI_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Tahoma'
                Font.Style = []
                ParentFont = False
                Transparent = False
                ExportAs = exptText
                WrapStyle = BreakOnSpaces
                FontSize = 8
              end
              object QRLabel11: TQRLabel
                Left = 131
                Top = 89
                Width = 44
                Height = 10
                Size.Values = (
                  37.797619047619050000
                  495.148809523809500000
                  336.398809523809500000
                  166.309523809523800000)
                XLColumn = 0
                Alignment = taLeftJustify
                AlignToBand = False
                Caption = 'Business Trip'
                Color = clWhite
                Font.Charset = ANSI_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Tahoma'
                Font.Style = []
                ParentFont = False
                Transparent = False
                ExportAs = exptText
                WrapStyle = BreakOnSpaces
                FontSize = 8
              end
              object QRDBText8: TQRDBText
                Left = 202
                Top = 89
                Width = 50
                Height = 10
                Size.Values = (
                  37.797619047619050000
                  763.511904761904800000
                  336.398809523809500000
                  188.988095238095200000)
                XLColumn = 0
                Alignment = taCenter
                AlignToBand = False
                AutoSize = False
                Color = clWhite
                DataSet = dmPayroll.dstPayslips
                DataField = 'business_trip'
                Font.Charset = ANSI_CHARSET
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
              object QRDBText9: TQRDBText
                Left = 202
                Top = 77
                Width = 50
                Height = 10
                Size.Values = (
                  37.797619047619050000
                  763.511904761904800000
                  291.041666666666700000
                  188.988095238095200000)
                XLColumn = 0
                Alignment = taCenter
                AlignToBand = False
                AutoSize = False
                Color = clWhite
                DataSet = dmPayroll.dstPayslips
                DataField = 'leave_without_pay'
                Font.Charset = ANSI_CHARSET
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
              object QRShape10: TQRShape
                Left = 0
                Top = 87
                Width = 260
                Height = 1
                Size.Values = (
                  3.779761904761905000
                  0.000000000000000000
                  328.839285714285700000
                  982.738095238095200000)
                XLColumn = 0
                Shape = qrsHorLine
                VertAdjust = 0
              end
              object QRShape11: TQRShape
                Left = 0
                Top = 99
                Width = 260
                Height = 1
                Size.Values = (
                  3.779761904761905000
                  0.000000000000000000
                  374.196428571428600000
                  982.738095238095200000)
                XLColumn = 0
                Shape = qrsHorLine
                VertAdjust = 0
              end
              object QRShape12: TQRShape
                Left = 0
                Top = 111
                Width = 260
                Height = 1
                Size.Values = (
                  3.779761904761905000
                  0.000000000000000000
                  419.553571428571400000
                  982.738095238095200000)
                XLColumn = 0
                Shape = qrsHorLine
                VertAdjust = 0
              end
              object QRLabel12: TQRLabel
                Left = 3
                Top = 101
                Width = 186
                Height = 10
                Size.Values = (
                  37.797619047619050000
                  11.339285714285710000
                  381.755952380952400000
                  703.035714285714300000)
                XLColumn = 0
                Alignment = taLeftJustify
                AlignToBand = False
                AutoSize = False
                Caption = 'Semi-Monthly Rate'
                Color = clWhite
                Font.Charset = ANSI_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Tahoma'
                Font.Style = []
                ParentFont = False
                Transparent = False
                ExportAs = exptText
                WrapStyle = BreakOnSpaces
                FontSize = 8
              end
              object QRDBText10: TQRDBText
                Left = 202
                Top = 101
                Width = 50
                Height = 10
                Size.Values = (
                  37.797619047619050000
                  763.511904761904800000
                  381.755952380952400000
                  188.988095238095200000)
                XLColumn = 0
                Alignment = taRightJustify
                AlignToBand = False
                AutoSize = False
                Color = clWhite
                DataSet = dmPayroll.dstPayslips
                DataField = 'semi_monthly_rate'
                Font.Charset = ANSI_CHARSET
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
              object QRShape13: TQRShape
                Left = 0
                Top = 123
                Width = 260
                Height = 1
                Size.Values = (
                  3.779761904761905000
                  0.000000000000000000
                  464.910714285714300000
                  982.738095238095200000)
                XLColumn = 0
                Shape = qrsHorLine
                VertAdjust = 0
              end
              object QRLabel13: TQRLabel
                Left = 3
                Top = 113
                Width = 186
                Height = 10
                Size.Values = (
                  37.797619047619050000
                  11.339285714285710000
                  427.113095238095200000
                  703.035714285714300000)
                XLColumn = 0
                Alignment = taLeftJustify
                AlignToBand = False
                AutoSize = False
                Caption = 'Allowance'
                Color = clWhite
                Font.Charset = ANSI_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Tahoma'
                Font.Style = []
                ParentFont = False
                Transparent = False
                ExportAs = exptText
                WrapStyle = BreakOnSpaces
                FontSize = 8
              end
              object QRDBText11: TQRDBText
                Left = 202
                Top = 113
                Width = 50
                Height = 10
                Size.Values = (
                  37.797619047619050000
                  763.511904761904800000
                  427.113095238095200000
                  188.988095238095200000)
                XLColumn = 0
                Alignment = taRightJustify
                AlignToBand = False
                AutoSize = False
                Color = clWhite
                DataSet = dmPayroll.dstPayslips
                DataField = 'allowance'
                Font.Charset = ANSI_CHARSET
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
              object QRLabel14: TQRLabel
                Left = 3
                Top = 125
                Width = 186
                Height = 10
                Size.Values = (
                  37.797619047619050000
                  11.339285714285710000
                  472.470238095238100000
                  703.035714285714300000)
                XLColumn = 0
                Alignment = taLeftJustify
                AlignToBand = False
                AutoSize = False
                Caption = 'Adjustments'
                Color = clWhite
                Font.Charset = ANSI_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Tahoma'
                Font.Style = []
                ParentFont = False
                Transparent = False
                ExportAs = exptText
                WrapStyle = BreakOnSpaces
                FontSize = 8
              end
              object QRShape14: TQRShape
                Left = 0
                Top = 135
                Width = 260
                Height = 1
                Size.Values = (
                  3.779761904761905000
                  0.000000000000000000
                  510.267857142857100000
                  982.738095238095200000)
                XLColumn = 0
                Shape = qrsHorLine
                VertAdjust = 0
              end
              object QRDBText12: TQRDBText
                Left = 202
                Top = 125
                Width = 50
                Height = 10
                Size.Values = (
                  37.797619047619050000
                  763.511904761904800000
                  472.470238095238100000
                  188.988095238095200000)
                XLColumn = 0
                Alignment = taRightJustify
                AlignToBand = False
                AutoSize = False
                Color = clWhite
                DataSet = dmPayroll.dstPayslips
                DataField = 'adjustment'
                Font.Charset = ANSI_CHARSET
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
              object QRDBText13: TQRDBText
                Left = 202
                Top = 137
                Width = 50
                Height = 10
                Size.Values = (
                  37.797619047619050000
                  763.511904761904800000
                  517.827380952381000000
                  188.988095238095200000)
                XLColumn = 0
                Alignment = taRightJustify
                AlignToBand = False
                AutoSize = False
                Color = clWhite
                DataSet = dmPayroll.dstPayslips
                DataField = 'undertime_lwop'
                Font.Charset = ANSI_CHARSET
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
              object QRLabel15: TQRLabel
                Left = 3
                Top = 137
                Width = 186
                Height = 10
                Size.Values = (
                  37.797619047619050000
                  11.339285714285710000
                  517.827380952381000000
                  703.035714285714300000)
                XLColumn = 0
                Alignment = taLeftJustify
                AlignToBand = False
                AutoSize = False
                Caption = 'Undertime/LWOP'
                Color = clWhite
                Font.Charset = ANSI_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Tahoma'
                Font.Style = []
                ParentFont = False
                Transparent = False
                ExportAs = exptText
                WrapStyle = BreakOnSpaces
                FontSize = 8
              end
              object QRShape15: TQRShape
                Left = 0
                Top = 147
                Width = 260
                Height = 1
                Size.Values = (
                  3.779761904761905000
                  0.000000000000000000
                  555.625000000000000000
                  982.738095238095200000)
                XLColumn = 0
                Shape = qrsHorLine
                VertAdjust = 0
              end
              object QRLabel18: TQRLabel
                Left = 3
                Top = 149
                Width = 186
                Height = 10
                Size.Values = (
                  37.797619047619050000
                  11.339285714285710000
                  563.184523809523800000
                  703.035714285714300000)
                XLColumn = 0
                Alignment = taLeftJustify
                AlignToBand = False
                AutoSize = False
                Caption = 'Late'
                Color = clWhite
                Font.Charset = ANSI_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Tahoma'
                Font.Style = []
                ParentFont = False
                Transparent = False
                ExportAs = exptText
                WrapStyle = BreakOnSpaces
                FontSize = 8
              end
              object QRDBText14: TQRDBText
                Left = 202
                Top = 173
                Width = 50
                Height = 10
                Size.Values = (
                  37.797619047619050000
                  763.511904761904800000
                  653.898809523809500000
                  188.988095238095200000)
                XLColumn = 0
                Alignment = taRightJustify
                AlignToBand = False
                AutoSize = False
                Color = clWhite
                DataSet = dmPayroll.dstPayslips
                DataField = 'gross_pay'
                Font.Charset = ANSI_CHARSET
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
              object QRShape16: TQRShape
                Left = 0
                Top = 159
                Width = 260
                Height = 1
                Size.Values = (
                  3.779761904761905000
                  0.000000000000000000
                  600.982142857142900000
                  982.738095238095200000)
                XLColumn = 0
                Shape = qrsHorLine
                VertAdjust = 0
              end
              object QRShape17: TQRShape
                Left = 0
                Top = 352
                Width = 260
                Height = 3
                Size.Values = (
                  11.339285714285710000
                  0.000000000000000000
                  1330.476190476190000000
                  982.738095238095200000)
                XLColumn = 0
                Shape = qrsHorLine
                VertAdjust = 0
              end
              object QRShape18: TQRShape
                Left = 0
                Top = 195
                Width = 196
                Height = 1
                Size.Values = (
                  3.779761904761905000
                  0.000000000000000000
                  737.053571428571400000
                  740.833333333333300000)
                XLColumn = 0
                Shape = qrsHorLine
                VertAdjust = 0
              end
              object QRLabel19: TQRLabel
                Left = 3
                Top = 185
                Width = 186
                Height = 10
                Size.Values = (
                  37.797619047619050000
                  11.339285714285710000
                  699.255952380952400000
                  703.035714285714300000)
                XLColumn = 0
                Alignment = taLeftJustify
                AlignToBand = False
                AutoSize = False
                Caption = 'Deductions'
                Color = clWhite
                Font.Charset = ANSI_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Tahoma'
                Font.Style = []
                ParentFont = False
                Transparent = False
                ExportAs = exptText
                WrapStyle = BreakOnSpaces
                FontSize = 8
              end
              object QRDBText15: TQRDBText
                Left = 202
                Top = 341
                Width = 50
                Height = 10
                Size.Values = (
                  37.797619047619050000
                  763.511904761904800000
                  1288.898809523810000000
                  188.988095238095200000)
                XLColumn = 0
                Alignment = taRightJustify
                AlignToBand = False
                AutoSize = False
                Color = clWhite
                DataSet = dmPayroll.dstPayslips
                DataField = 'deduction'
                Font.Charset = ANSI_CHARSET
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
              object QRDBText19: TQRDBText
                Left = 135
                Top = 196
                Width = 54
                Height = 155
                Size.Values = (
                  585.863095238095200000
                  510.267857142857100000
                  740.833333333333300000
                  204.107142857142900000)
                XLColumn = 0
                Alignment = taRightJustify
                AlignToBand = False
                AutoSize = False
                AutoStretch = True
                Color = clWhite
                DataSet = dmPayroll.dstPayslips
                DataField = 'deduction_amount'
                Font.Charset = ANSI_CHARSET
                Font.Color = clWindowText
                Font.Height = -9
                Font.Name = 'Tahoma'
                Font.Style = []
                ParentFont = False
                Transparent = True
                ExportAs = exptText
                WrapStyle = BreakOnSpaces
                FullJustify = False
                MaxBreakChars = 0
                FontSize = 7
              end
              object QRShape19: TQRShape
                Left = 0
                Top = 367
                Width = 260
                Height = 3
                Size.Values = (
                  11.339285714285710000
                  0.000000000000000000
                  1387.172619047619000000
                  982.738095238095200000)
                XLColumn = 0
                Shape = qrsHorLine
                VertAdjust = 0
              end
              object QRLabel20: TQRLabel
                Left = 3
                Top = 371
                Width = 45
                Height = 10
                Size.Values = (
                  37.797619047619050000
                  11.339285714285710000
                  1402.291666666667000000
                  170.089285714285700000)
                XLColumn = 0
                Alignment = taLeftJustify
                AlignToBand = False
                Caption = 'Prepared By:'
                Color = clWhite
                Font.Charset = ANSI_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Tahoma'
                Font.Style = []
                ParentFont = False
                Transparent = False
                ExportAs = exptText
                WrapStyle = BreakOnSpaces
                FontSize = 8
              end
              object QRShape20: TQRShape
                Left = 130
                Top = 368
                Width = 1
                Height = 42
                Size.Values = (
                  158.750000000000000000
                  491.369047619047600000
                  1390.952380952381000000
                  3.779761904761905000)
                XLColumn = 0
                Shape = qrsVertLine
                VertAdjust = 0
              end
              object QRLabel21: TQRLabel
                Left = 133
                Top = 371
                Width = 45
                Height = 10
                Size.Values = (
                  37.797619047619050000
                  502.708333333333300000
                  1402.291666666667000000
                  170.089285714285700000)
                XLColumn = 0
                Alignment = taLeftJustify
                AlignToBand = False
                Caption = 'Received By:'
                Color = clWhite
                Font.Charset = ANSI_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Tahoma'
                Font.Style = []
                ParentFont = False
                Transparent = False
                ExportAs = exptText
                WrapStyle = BreakOnSpaces
                FontSize = 8
              end
              object QRLabel22: TQRLabel
                Left = 5
                Top = 388
                Width = 121
                Height = 20
                Size.Values = (
                  75.595238095238100000
                  18.898809523809520000
                  1466.547619047619000000
                  457.351190476190500000)
                XLColumn = 0
                Alignment = taCenter
                AlignToBand = False
                AutoSize = False
                Caption = 'KAREN GAY M. GALEZA Accountant III'
                Color = clWhite
                Font.Charset = ANSI_CHARSET
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
              object QRDBText18: TQRDBText
                Left = 16
                Top = 196
                Width = 78
                Height = 155
                Size.Values = (
                  585.863095238095200000
                  60.476190476190480000
                  740.833333333333300000
                  294.821428571428600000)
                XLColumn = 0
                Alignment = taLeftJustify
                AlignToBand = False
                AutoSize = False
                AutoStretch = True
                Color = clWhite
                DataSet = dmPayroll.dstPayslips
                DataField = 'deduction_types'
                Font.Charset = ANSI_CHARSET
                Font.Color = clWindowText
                Font.Height = -9
                Font.Name = 'Tahoma'
                Font.Style = []
                ParentFont = False
                Transparent = True
                ExportAs = exptText
                WrapStyle = BreakOnSpaces
                FullJustify = False
                MaxBreakChars = 0
                FontSize = 7
              end
              object QRShape21: TQRShape
                Left = 129
                Top = 195
                Width = 1
                Height = 158
                Size.Values = (
                  597.202380952381000000
                  487.589285714285700000
                  737.053571428571400000
                  3.779761904761905000)
                XLColumn = 0
                Shape = qrsVertLine
                VertAdjust = 0
              end
              object QRShape22: TQRShape
                Left = 0
                Top = 171
                Width = 260
                Height = 1
                Size.Values = (
                  3.779761904761905000
                  0.000000000000000000
                  646.339285714285700000
                  982.738095238095200000)
                XLColumn = 0
                Shape = qrsHorLine
                VertAdjust = 0
              end
              object QRLabel23: TQRLabel
                Left = 3
                Top = 161
                Width = 186
                Height = 10
                Size.Values = (
                  37.797619047619050000
                  11.339285714285710000
                  608.541666666666700000
                  703.035714285714300000)
                XLColumn = 0
                Alignment = taLeftJustify
                AlignToBand = False
                AutoSize = False
                Caption = 'Incomplete Logs'
                Color = clWhite
                Font.Charset = ANSI_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Tahoma'
                Font.Style = []
                ParentFont = False
                Transparent = False
                ExportAs = exptText
                WrapStyle = BreakOnSpaces
                FontSize = 8
              end
              object QRShape23: TQRShape
                Left = 0
                Top = 183
                Width = 260
                Height = 1
                Size.Values = (
                  3.779761904761905000
                  0.000000000000000000
                  691.696428571428600000
                  982.738095238095200000)
                XLColumn = 0
                Shape = qrsHorLine
                VertAdjust = 0
              end
              object QRLabel24: TQRLabel
                Left = 3
                Top = 173
                Width = 186
                Height = 10
                Size.Values = (
                  37.797619047619050000
                  11.339285714285710000
                  653.898809523809500000
                  703.035714285714300000)
                XLColumn = 0
                Alignment = taLeftJustify
                AlignToBand = False
                AutoSize = False
                Caption = 'Gross Pay'
                Color = clWhite
                Font.Charset = ANSI_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Tahoma'
                Font.Style = []
                ParentFont = False
                Transparent = False
                ExportAs = exptText
                WrapStyle = BreakOnSpaces
                FontSize = 8
              end
              object QRDBText20: TQRDBText
                Left = 202
                Top = 149
                Width = 50
                Height = 10
                Size.Values = (
                  37.797619047619050000
                  763.511904761904800000
                  563.184523809523800000
                  188.988095238095200000)
                XLColumn = 0
                Alignment = taRightJustify
                AlignToBand = False
                AutoSize = False
                Color = clWhite
                DataSet = dmPayroll.dstPayslips
                DataField = 'late'
                Font.Charset = ANSI_CHARSET
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
              object QRDBText21: TQRDBText
                Left = 202
                Top = 161
                Width = 50
                Height = 10
                Size.Values = (
                  37.797619047619050000
                  763.511904761904800000
                  608.541666666666700000
                  188.988095238095200000)
                XLColumn = 0
                Alignment = taRightJustify
                AlignToBand = False
                AutoSize = False
                Color = clWhite
                DataSet = dmPayroll.dstPayslips
                DataField = 'incomplete'
                Font.Charset = ANSI_CHARSET
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
            end
          end
        end
        inherited pStatus: TPanel
          Left = 350
          Top = 420
          ExplicitLeft = 350
          ExplicitTop = 420
          inherited lblStatus: TLabel
            Width = 191
            Caption = 'Generating payslips. Please wait...'
            ExplicitWidth = 191
          end
        end
        inherited p_ReportFooter: TPanel
          Top = 766
          Width = 656
          ExplicitTop = 591
          ExplicitWidth = 656
          inherited JvGroupBox1: TJvGroupBox
            Width = 654
            ExplicitWidth = 654
            inherited bFirst: TcxButton
              Left = 552
              ExplicitLeft = 552
            end
            inherited bLast: TcxButton
              Left = 627
              ExplicitLeft = 627
            end
            inherited bNext: TcxButton
              Left = 602
              ExplicitLeft = 602
            end
            inherited bPrevious: TcxButton
              Left = 577
              ExplicitLeft = 577
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
