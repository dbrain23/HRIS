inherited fBaseLoginForm: TfBaseLoginForm
  Align = alNone
  BorderIcons = [biSystemMenu]
  BorderStyle = bsNone
  Caption = ''
  ClientHeight = 231
  ClientWidth = 495
  KeyPreview = True
  Position = poDesktopCenter
  OnCreate = FormCreate
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  ExplicitWidth = 495
  ExplicitHeight = 231
  PixelsPerInch = 96
  TextHeight = 14
  object cxGroupBox1: TcxGroupBox
    Left = 0
    Top = 0
    Align = alClient
    Ctl3D = False
    PanelStyle.Active = True
    PanelStyle.BorderWidth = 2
    PanelStyle.OfficeBackgroundKind = pobkStyleColor
    ParentCtl3D = False
    Style.BorderColor = clGray
    Style.BorderStyle = ebsSingle
    Style.Edges = [bLeft, bTop, bRight, bBottom]
    Style.LookAndFeel.Kind = lfUltraFlat
    Style.LookAndFeel.NativeStyle = False
    Style.LookAndFeel.SkinName = ''
    Style.Shadow = True
    Style.TransparentBorder = True
    StyleDisabled.LookAndFeel.Kind = lfUltraFlat
    StyleDisabled.LookAndFeel.NativeStyle = False
    StyleDisabled.LookAndFeel.SkinName = ''
    StyleFocused.LookAndFeel.Kind = lfUltraFlat
    StyleFocused.LookAndFeel.NativeStyle = False
    StyleFocused.LookAndFeel.SkinName = ''
    StyleHot.LookAndFeel.Kind = lfUltraFlat
    StyleHot.LookAndFeel.NativeStyle = False
    StyleHot.LookAndFeel.SkinName = ''
    TabOrder = 0
    Height = 231
    Width = 495
    object Label1: TLabel
      Left = 243
      Top = 124
      Width = 54
      Height = 14
      Caption = 'Username'
    end
    object Label2: TLabel
      Left = 243
      Top = 148
      Width = 51
      Height = 14
      Caption = 'Password'
    end
    object lbErrorMessage: TLabel
      Left = 243
      Top = 173
      Width = 76
      Height = 14
      Caption = 'Error Message'
      Font.Charset = ANSI_CHARSET
      Font.Color = clRed
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      Visible = False
    end
    object p_Top: TAdvPanel
      Left = 4
      Top = 4
      Width = 484
      Height = 93
      Align = alTop
      BevelOuter = bvNone
      Color = 11971188
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 5
      UseDockManager = True
      Version = '2.2.0.2'
      Caption.Color = clHighlight
      Caption.ColorTo = clNone
      Caption.Font.Charset = DEFAULT_CHARSET
      Caption.Font.Color = clHighlightText
      Caption.Font.Height = -13
      Caption.Font.Name = 'Tahoma'
      Caption.Font.Style = []
      Caption.Height = 24
      StatusBar.Font.Charset = DEFAULT_CHARSET
      StatusBar.Font.Color = clWindowText
      StatusBar.Font.Height = -11
      StatusBar.Font.Name = 'Tahoma'
      StatusBar.Font.Style = []
      Text = ''
      FullHeight = 0
      object lblVersion: TLabel
        Left = 392
        Top = 63
        Width = 60
        Height = 13
        Caption = 'VersionLabel'
        Font.Charset = ANSI_CHARSET
        Font.Color = 15395562
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        Transparent = True
      end
      object imgLogo: TImage
        Left = 392
        Top = 17
        Width = 70
        Height = 55
        Picture.Data = {
          0B546478504E47496D61676589504E470D0A1A0A0000000D4948445200000030
          0000003008060000005702F9870000000467414D410000B18F0BFC6105000000
          097048597300000B0F00000B0F0192F903A50000000774494D4507D3071D1217
          16A6D8D1AA0000100E494441546843ED59095055D7B26D1004141C704E445011
          11644684189FD1E76CFC0E7951E314358080220A890C8A232A0AC619E502324F
          323880A020930A0ACE318AE6279A7C358371888931898977FDEE730F269557EF
          FDD2BC5F15ABD255BBCEBDE7DCDDBD56F7EADEA780FEB2BFEC2F7B3EAB5B4566
          35D1D43EFA7DD297EF8D1BA97DDD4672AEDC405E55D1645BB9899A2B3FFC33D9
          FACDA45FBE8CBC4B57D3A5A295F47349143DA95847F76B37D167E5EBE9C9E1B5
          A42D8D221C584EDAC208BA5FB28C76952DA14EEAF67FB2FC10324C0FA4E1A901
          14953A8F9253E753764A0069D2E6536446208DC99A41A6EA4FFFB8554FA76679
          8B29AD2082B465EB08473711EAB6114EEED0AD869D8413DB09C73613AA3712E4
          377B9712B2DFA52F4A9792B3EA463110E969826856BC0F7D921440DA3DA10A69
          14AF2414AD20E487135202093B7DE87E8A3F6DCB0FA6F6EAD6E7B7BC700AE540
          DA23EB0955B13A020258809FD1104EC7EB08D5BC4FA88C21546C20704550B884
          90BE903E2B984F66E2273D8C4C77CCA3BD89F3487B70958EF0F12DBABDE24BFC
          883F591223E73D0213FD3C3798DC1520CF63050BC83C7D113D900C9547FF4AA0
          76AB0EEC01CE5A21675B32278025A31258EE09C8CC60426A202DDB3A894C76F9
          524DDA02822442F64AB5844453359B08C8B53E4E774FAAC224BE280CFAD772FC
          B7961342BE02A264B52EAB125C028BDE8B961BE38BDCB1F8F1902F501D0C1C0D
          056ADEC5DDBD5371704507642CD2114BF2A76B0C6277F2FC5F7D48959A084832
          04ECA95D3AF0721502424C96C44F9F4F8B5548CF66D90B698F6455B229A0A50A
          A27171FAC3211F06BD183816061C0F076A791D97CF4C84EF152FEF0CAE1E12FD
          49AB994B5AA9A21090FD4240AAF9DB0A888C04BC5CE5BBDC976A8B8F947914A9
          427A3663E697F2C274A5141287D670562338C0667B1DE05A065CB71438B95C5D
          2BF87B249388C0E3230BA0F16509F0E2867E9A0421D15401F19BCC4DBBCB872B
          15404AD54482B2D28208DBE6F0BE1033ED67D1967D5548CF663CDE6E4905F645
          EA8289947673C03B2C13D445002718744314707A2D70269AAFEBF8FB2A26B28C
          9F45E2788C23E2DE216485E8268DEC9724888C04E4EE00637C943A16774BFC71
          3D6F3A2EA54FC0B9A4912CA5A1F870F7283C2C9B0F648D00D2FA05A8909ECDB8
          029F4B20A982645188B02438F3029E332D60CF31F00FDE072EF23A1FCB44D603
          F52BF9F9327C933F45C9A2484E12202484808CD904BFE6F8B96A91EEB7673801
          1F6C043EDC025CE27541FCACD125A8701290EA9AAC427A36E399FC810497D91C
          E7AD5BE551D6EC9865C300719A839C67E097B6038D3BF9BA8D83C700A7B82A22
          A9AAF9D8CDF21069C8BC171222238D1FE1A364CE6CDD1226C0B23BC395BBB899
          7DC4019777E81222BEC547F14CAE805BA90AE9D92C6D1EE5A5F2E8E38305D7E2
          FF862B9AC1F8A562A1AE5945EF229D0B9B382807BEAAD1051742923D91D19179
          A8093347062741B2BE7F996E6DE7AA40B2AFF8E10A481525FB5776E912213EC5
          B7C438380B48712D57213D9BF1B1EE1F3F97B5EAA70714FC03A8604D5609019E
          3E525E29BD64FCC3ADBCB80A02E29C5460B5EE79991F7ED86E875C1EA7424096
          F4546E88394FB0F774A357F1C3842F8884D8CF07E283252415902A17CF60026E
          252AA467B382106ACF733CE1BBAD76F5C81BCF80E632894065DEA3966554CF3D
          202424E0790620E095469669C4CF4B66E1EE661B642DD69D09424024591269C9
          670727A25AFCB08CE4F7B2EF2C5742AAA148507C70AF1572E252DD125548CF67
          EC4083AC51801C5AE5015C053EB8A4FC0252342C1997A0A7F92A92106DCBF9C0
          0DF8598C1532790048E6F97D4AE98792480B4EC43CA072012783ABA90C05CEB6
          F812E032207814E3183FCB1A09A4BB2D52A13C9F711305237530503A4747E208
          4B49397DD5E0424482CA550E35918754297304DFEA804C1EA332CD84848CD4BC
          90365C4D7FDD1212D5213A59CAB9724CF6CBA9CEFE45AEF11E5A685C5D5428CF
          67C8F77285A69F569908A5EF0087594A4242021CE5E08A9E653108914565103F
          67A9257A68731718D727F22125633897A5244476F0D980A2B7D99737FB6212F2
          DB2A2652C98D2D7B2BF8B3DC2B7C13D8E1761E203D15CAF399BC067323352067
          0C07E6A63A385B95930467221250591C54BE97B33CF2270209AE27F8BDBF1D9F
          C88D72D24AF68500BFD8E1EAB6FEEC8749709F2844C49F24A669498C044E5A9E
          E7EB2A8C3F665C85314A15F64E6612D3793A4870AE86BC1395A9C105842C197D
          09EE4F90D36F98ECE503F1A5441FAA49E2F99FCEAF08A9BC52FC9B01D9A38103
          ECAB882B2BFE047409AF7D538064772DB25D6295E0FF2943A6C71624796A51F0
          06B07F9A8E8848A19801CB12000228D94B8B5C8F8DEA36C5DEDF44FA816FDAAD
          8B9A61AE4DE5D19CC855D81FA80F681C794CBE0A64FC9D0F2CEEB3447720CE1E
          DBE6CF6830734F3251B7FF71FB7A81A579E3D4AE8BBE0EB7FD9EB3AB0B98374E
          97ADFD6FE9CE89CC610CC0051F7B5B3E493731D8BCBF25D92B9B1D363627878C
          0DE494F293D19862387AA760D088C9488AF7C3D173B5B85E118BAF0E85E3F691
          95B8F1413EBC37D582EC1240CEF11F91D79E57151FCF6B776650F3BB4136611F
          CFB1BA77CDB7076E06F5C2E7C1D678B47328679A33B7CD06D86E0BED2E677C99
          3C0985A99B91E5D21DFBAC4C90DAB2D92F79FC4ED8CC25BE4CFF6F69E8E67D18
          D68B8EC236B41ED43701AB2ABF46CEF59FB0EFD62F387C875BE82E0F9F074068
          4E230C0767A09B4FB99078445E39E35438CF6658D9D3F26660AFD30C5AFB20AA
          2FBEE7B7CB6FD7F6C5ED705B5CF1B6C54FBF00B7EFDE45E3E5CBA8A93D85827D
          0791909689F4E15EA8ECD71AB5433A20A7BD2136E8B540EF1985B00AAC610235
          B00B3B01D351B918125E858C8F1F22E793EFB0F7B3873870E37B14DF7C841545
          9F803C12E1B6EE3CACFC8E805C763DA47E394E2AACDF9837B9A99FFEC91E87DB
          F6BC11D4F3C6ED0806BAD9098FB738636BECCBB8BDDE1E0F56F7C5A77E96B8FA
          DE08DCBA7D07172F5F415575350A0A0BA1494D43EAE801A8706B8D13433BE2D8
          A0F628E86C8858A336E83EAF0ABD161D479FB03AFE5C09030F0D121BBF43E2A5
          6F90D2F800E957BF45C647DF624DF9FF70E677C165ED79384436A0C3E47D20B7
          F87AA218E54F39BF9A0FD5932F7553BF3D35847634BDB1C0FAD257E1BDF1C346
          27FCBCCD054FE25C3122C60C2EB126B8B2D606F796F5C195E95D7076A613EAB3
          35387CB81CD9057B91101D853CEBD60AF0BABF77C0D181ED50E5698EAC168440
          9BE1B05A7C8A25540BC715A741FD12307DE7056C3D7F1FDBCFDFC30EBEC65D7C
          80F083D739EB1A26700E7D979C54081B782669C92B73BC0A51351FBACC5568A0
          E9D452BDA3D8BD206B8D685DE4F228C681B3CF24B6BB60F88656F02CED058B2D
          46A85CD5035F86D9E0BF675BA27E681B547998A2CCD914A536C6A8F26A8B8631
          9D1509D5BCDA0E473CDAA2D4C10CFC520F17EF42267092337B0A16AC7123AF24
          AC3D7997D71DAC3B7107EB1BEE6156C28768F64A329CA2CEC22EFC246CDFAB43
          FB49FBB90A29652A44D57CA8AE79A401F85A4181D44A6EFD1468ED74CDB7FBCF
          5F2FED83FBABEDF05D346B3FD6118F780D5E6F8AD98D8331FBCA60744C3041D2
          8A977083897E1AD01357675BE1F2D4AEB838A92BCE8EEB8286919D1402D50398
          40BFB64CAE0DB2CD08731D27A247E829D8731F38AD3A03E321E9B09EBE1FCB6A
          EF21F2F81DACAABF0F47FF43683BBE008ECB4FA34F681D7A851C65C9557055E2
          7FA43E09ED14EC8AF9505EAB381398C59880FCE9530AA0B9F53E5D73AEFBF7E0
          46ED8D7BCB85445F3CE04A7CBBAE2F06AE6B89390C7EE9D713F1EEE763F17276
          5B84AE6C874F7CBBE3EA2C4B5C9A66810B6FBC8CD363BBE0E4884E38FE1A1378
          C51CE5EE6D50EAD80A7BBB1963AB8109BA859E51B26AB7A41E0ECB1B60383015
          260393E1BEA80276BE25208738AE521DEC234EA2F7BBC761BDB0063DE757C1E0
          95DDD20B6354F46C3EB4A665AC11BAEC698BAE19E6681BD31226E1067839D800
          CE8B8DE1196102CFA52D58AFC6E8B1AA395AC41AE09DAB43B08409447D33196B
          1E4C81438905264699E2C24C0B5C9CDC15E726BC84532C9F13C3740D5CE5658E
          32D7362871688D225B53A4B08C9CE7E4C39A81492FD847D42BFD60C12356B2DE
          EE8D42F40EA9851DDF17F0360B8FA1676015BAFB57A0C5B04C906B7C988A9ECD
          9B26182D3744975C9E107B3BA24FF1CB7029EB0ECF8A5E1850D11B83ABED31A2
          D61913CE786066E320047C3A0221B75E5708AC6602318F6660EBE3D9185AE700
          F70D46A899CA4D2DF219D5E9690357F46F8BC32EAD71D0CE0C076C5A225D8F30
          6AF832740FAAE589745401691B7A82019F843D57C49E352FB2B10939A6CBFC82
          6A988EC842EBB17BD06A748E54204E45CFF60E99EB07EA3DEE2C040A3B3C25E0
          55658321B57D31BAC10513CE79E0AD4BAF62CE47831502C14C20E2F6041D81EF
          A763DBCF73B04BEB83E99707C2728B21F2A6B4C7C9E11D593EED593EAC7FF7B6
          38E4D81AC5B666D8DFD314992684696E336131EF287AB02CAC1960AF854C24F8
          186C7809A95E2AF01E3C6ABBFB55A0F5EB7BD0626806DA30091EAFB92A7AD5BC
          A9A4DD2E535831015B2170D84A2130F8B83D463511F87000663301FFEBC39F12
          58D544802B2004E2E18B4537C7A093C6189BA7B656B25FC9E353279F5638D0DB
          147BBBB74496293772AF51E8E2570D4BBF7258B134E44C1032BAC5A0032A9503
          CC6AEE1158FA94C17C62019AF54F847EFF442DB9A706ABC855F3A591466106DA
          2602CE4CC0F33704C63711B8FA9A4240402A04EE4FC2062620126A2210F7C41B
          4E872C3131C458695E25FB4E9C7D964F5E5763E4BD64824C333D2CB2F044479F
          2A58CC39C4AF1765B0F4652202989790B214E0BE65E83CFD205A71F60D0770F3
          BAC6DF20CF9C692AEADF990F9575D8D10AB6452FE90854F6C26B4C6064BD33C6
          9FED87294C60D66F088433819542E0E1B4A70404BC478535C672F357F3ECAFE0
          D95FC6DA2FB16F85A2DE66D86DD40C196D9B23CD88B0D0DC1186A3F2195C0EDA
          8CCB87F9F83CE5DA6A4C2E5A0ECF84F16BA9D0F748D032E86F38E307A87FC654
          B2E19DFFD2669185DE3CBD2FBAA5B55732F85B02E384C0C55714027ED78661A1
          10F86ABC42603D13D8C2049AC08F61F055229DFE3AE91CE2D159DCC7949BD714
          4946FAD0E8931C66672D6C5705917BC626724DCDA07EE97BA85FDA1EFE9C4BEE
          29F1E496B692DC92673068D77F0FFAF7F60E39EA05EADDEAAA6987FE0C66D031
          BBA70426FF8E409810B8F7A64260D38F6F2B84C7861AA346199B9C7D3EB864F2
          1431F0EC0ECDB1BBB93EE2F9C5369528E22091B11AF1FFC102A8332DA02C93A5
          CD9FF44CE9840165BD31F6949B42E0ED2B8330F793A108BA315A21B08209ACFB
          F62D781CB1C6D0404314F66881FCAE260AE0145303CEB69E5643F480E77E511A
          D7388BFE83FF36FA3F2D986C298456501855EA45D24DC3A8660F8DA20D1E358B
          D6FF455E2342BF1C876577FF01D7D2EE705840D792F5299B41EEE6B589576426
          D134BE3AC5D09FED1F7E6BA97676E36B58FCC57FC1B9D80AB49D32690F35539F
          BE00B6964E0801C7FD96A0CD94F56281175B43A7AD323A806239F36FBE68E0C5
          980045530E2D2703F5CE0B6651F4DE8B0BFE4F6544FF0B70C447A9033604A400
          00000049454E44AE426082}
      end
      object Label5: TLabel
        Left = 18
        Top = 24
        Width = 359
        Height = 43
        AutoSize = False
        Caption = 'Human Resource Information Management System'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = 15395562
        Font.Height = -19
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
        WordWrap = True
      end
    end
    object t_Username: TcxTextEdit
      Left = 312
      Top = 118
      Properties.CharCase = ecUpperCase
      Properties.OnChange = t_UsernamePropertiesChange
      Style.LookAndFeel.NativeStyle = False
      Style.Shadow = False
      StyleDisabled.LookAndFeel.NativeStyle = False
      StyleFocused.LookAndFeel.NativeStyle = False
      StyleHot.LookAndFeel.NativeStyle = False
      TabOrder = 0
      Width = 132
    end
    object t_Password: TcxTextEdit
      Left = 312
      Top = 142
      Properties.EchoMode = eemPassword
      Properties.PasswordChar = '*'
      Properties.OnChange = t_UsernamePropertiesChange
      Style.LookAndFeel.NativeStyle = False
      Style.Shadow = False
      StyleDisabled.LookAndFeel.NativeStyle = False
      StyleFocused.LookAndFeel.NativeStyle = False
      StyleHot.LookAndFeel.NativeStyle = False
      TabOrder = 1
      Width = 132
    end
    object btLogin: TcxButton
      Left = 265
      Top = 193
      Width = 82
      Height = 25
      Caption = 'Login'
      LookAndFeel.Kind = lfUltraFlat
      OptionsImage.Glyph.Data = {
        36040000424D3604000000000000360000002800000010000000100000000100
        20000000000000040000000000000000000000000000000000000000001A0000
        001A0000001A0000001A0000001A0000001A0000001A0000001A0000001A0000
        001A0000001A0000001A0000001A0000001A0000001600000009000000330015
        29A200213FB300223E9E0128449301334F95013E5EA2002140BD002140BC0021
        40BC002141BC002141BC00142797000000330000002C00000012000000000123
        3EA0A9EDFFFFA4E7FCFF9CDFF8FF94D6F4FF8BCFF0FF66BCDEFF66C2E4FF66CA
        ECFF66D2F4FF66DAFCFF01233EA0000000000000000000000000000000000129
        458D66AACAFF68ACCEFF6CB0D2FF6EB1D3FF6AAED0FF559DBFFF55A0C2FF55A5
        CAFF55ABD3FF5AB8DEFF0129458F000000000000000000000000000000000136
        5487A5E9FFFF9CDFFAFF94D7F4FF8CCEEEFF83C7E8FF5EB4D7FF5EBADEFF5EC2
        E8FF5ECAF2FF62D6FBFF0137548A000000000000000000000000000000000244
        658A66AACAFF68ACCEFF6CB0D2FF6EB1D3FF6AAED0FF559DBFFF55A0C2FF55A5
        CAFF55ABD3FF5AB8DEFF0244668F000000000000000000000000000000000246
        688BA5E9FFFF9CDFFAFF94D7F4FF8CCEEEFF83C7E8FF5EB4D7FF5EBADEFF5EC2
        E8FF5ECAF2FF62D6FBFF02476A90000000000000000000000000000000000246
        688B66AACAFF68ACCEFF6CB0D2FF6EB1D3FF6AAED0FF559DBFFF55A0C2FF55A5
        CAFF55ABD3FF5AB8DEFF02476A90000000000000000000000000000000000246
        688BA5E9FFFF9CDFFAFF94D7F4FF8CCEEEFF83C7E8FF5EB4D7FF5EBADEFF5EC2
        E8FF5ECAF2FF62D6FBFF02476A90000000000000000000000000000000000135
        4F690246688F014669950146699C014668A2014667A9004568CA003B58A84B91
        B5FF014567AD01486B9B0136506D000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000013D5CA378BC
        DDFF014667B2000000000000000001354E86013D5CA3002E467A000000000000
        0000000000000000000000000000000000000000000000000000013E5D9783C7
        E4FD04496BB9000000000000000004496BB983C7E4FD013E5D97000000000000
        00000000000000000000000000000000000000000000000000000137517A70B4
        D0E62F7395D501344D9101344D912F7395D570B4D0E60137517A000000000000
        0000000000000000000000000000000000000000000000000000011926351255
        769B6FB5CFE161A6C0EA61A6C0EA6FB5CFE11255769B01192635000000000000
        000000000000000000000000000000000000000000000000000000000000011A
        263301395572024567890245678901395572011A263300000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000}
      TabOrder = 2
      OnClick = btLoginClick
    end
    object btCancel: TcxButton
      Left = 348
      Top = 193
      Width = 82
      Height = 25
      Caption = 'Cancel'
      OptionsImage.Glyph.Data = {
        36040000424D3604000000000000360000002800000010000000100000000100
        2000000000000004000000000000000000000000000000000000000000090000
        00160000001A0000001A0000001A0000001A0000001A0000001A0000001A0000
        001A0000001A0000001A0000001A0000001A0000001600000009000000120000
        033300002683000045BC00004ACC00004ACC00004ACC00004ACC00004ACC0000
        4ACC00004ACC00004ACC000045BC000026830000033300000012000000000000
        317307077FDD1010C7F91111D9FF1111D9FF1111D9FF1111D9FF1111D9FF1111
        D9FF1111D9FF1111D9FF0F0FC7F906067FDD0000317300000000000000000000
        5BBA1515C6F91313D2FF1717D4FF0E0EAFEF040480D902026DCF02026DCF0404
        80D90B0BAFEF1111D1FF1111D1FF0F0FC3F900005BBA00000000000000000000
        6ACC1E1ECFFF2020D0FF0D0D96E4000055AA0000203F0000080F0000080F0000
        3E7C000066CC1111C8FF1111C8FF1111C8FF00006ACC00000000000000000000
        6ECC3030D1FF1E1EADEF000055AA00000A130000000000000000000024480000
        66CC1818C2FF000066CC0D0DA2EF1212BEFF00006ECC00000000000000000000
        71CC4C4CDBFF0E0E80D90000203F000000000000000000002448000066CC2323
        C1FF000066CC00003E7C06067BD91919BAFF000071CC00000000000000000000
        75CC6060E8FF05056ECF0000080F0000000000002448000066CC3131C4FF0000
        66CC000024480000080F02026BCF2525BBFF000075CC00000000000000000000
        78CC6767EFFF06066ECF0000080F00002448000066CC4040CDFF000066CC0000
        2448000000000000080F02026CCF3232BFFF000078CC00000000000000000000
        7BCC6B6BF3FF191986D900003E7C000066CC5C5CE5FF000066CC000024480000
        0000000000000000203F0E0E7DD94141CAFF00007BCC00000000000000000000
        7ECC6B6BF3FF4A4AC7EF181886D96B6BF3FF000066CC00002448000000000000
        000000000A13000055AA3E3EBBEF5959E1FF00007ECC00000000000000000000
        82CC6262EAFF6D6DF5FF7373FBFF181886D900003E7C0000080F0000080F0000
        203F000055AA2F2FA5E46363EBFF5C5CE4FF000082CC00000000000000000000
        78BA5E5EE6F95B5BE3FF7171F9FF4F4FCCEF1B1B8BD906066FCF06066FCF1B1B
        8AD94C4CCAEF6D6DF5FF5E5EE6FF5959E2F9000078BA00000000000000000000
        4C732424ACDD6161E9F96D6DF5FF7575FDFF7777FFFF7777FFFF7777FFFF7676
        FEFF7373FBFF6D6DF5FF6060E8F92424ABDD00004C7300000000000000000000
        080C00004D7300007CBA000088CC000088CC000088CC000088CC000088CC0000
        88CC000088CC000088CC00007CBA00004D730000080C00000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000}
      TabOrder = 3
      OnClick = btCancelClick
    end
    object p_Left: TAdvPanel
      Left = 4
      Top = 97
      Width = 189
      Height = 127
      Align = alLeft
      BevelOuter = bvNone
      Color = 14671839
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 4
      UseDockManager = True
      Version = '2.2.0.2'
      Caption.Color = clHighlight
      Caption.ColorTo = clNone
      Caption.Font.Charset = DEFAULT_CHARSET
      Caption.Font.Color = clHighlightText
      Caption.Font.Height = -13
      Caption.Font.Name = 'Tahoma'
      Caption.Font.Style = []
      Caption.Height = 24
      StatusBar.Font.Charset = DEFAULT_CHARSET
      StatusBar.Font.Color = clWindowText
      StatusBar.Font.Height = -11
      StatusBar.Font.Name = 'Tahoma'
      StatusBar.Font.Style = []
      Text = ''
      FullHeight = 0
      object l_Status: TLabel
        Left = 10
        Top = 96
        Width = 18
        Height = 13
        Caption = 'Idle'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        Transparent = True
        Visible = False
      end
      object Label4: TLabel
        Left = 12
        Top = 33
        Width = 152
        Height = 38
        Alignment = taCenter
        Caption = 'Alano and Sons Credit Corporation'
        Color = 10196313
        Font.Charset = ANSI_CHARSET
        Font.Color = 11579568
        Font.Height = -16
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
        WordWrap = True
      end
      object pr_Status: TAdvProgress
        Left = 10
        Top = 112
        Width = 167
        Height = 9
        DoubleBuffered = False
        ParentDoubleBuffered = False
        Smooth = True
        BarColor = clGreen
        TabOrder = 0
        BkColor = clWindow
        Version = '1.2.0.0'
      end
    end
  end
end
