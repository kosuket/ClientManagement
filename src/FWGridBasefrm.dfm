object FWGridBaseframe: TFWGridBaseframe
  Left = 0
  Top = 0
  Caption = 'FWGridBaseframe'
  ClientHeight = 439
  ClientWidth = 751
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesigned
  PixelsPerInch = 96
  TextHeight = 13
  object pnlBase: TPanel
    Left = 0
    Top = 0
    Width = 751
    Height = 439
    Align = alClient
    BevelOuter = bvNone
    Color = 14221016
    ParentBackground = False
    TabOrder = 0
    object Splitter1: TSplitter
      Left = 0
      Top = 285
      Width = 751
      Height = 3
      Cursor = crVSplit
      Align = alTop
      ExplicitLeft = 1
      ExplicitTop = 1
      ExplicitWidth = 167
    end
    object Panel2: TPanel
      Left = 0
      Top = 288
      Width = 751
      Height = 151
      Align = alClient
      BevelOuter = bvNone
      TabOrder = 0
      object DBGrid1: TDBGrid
        Left = 0
        Top = 0
        Width = 751
        Height = 151
        Align = alClient
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Georgia'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 0
        TitleFont.Charset = ANSI_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Georgia'
        TitleFont.Style = []
      end
    end
    object pnlCondition: TPanel
      Left = 0
      Top = 0
      Width = 751
      Height = 285
      Align = alTop
      BevelOuter = bvNone
      Color = clWindow
      ParentBackground = False
      TabOrder = 1
      object pnlCondBar: TPanel
        Left = 0
        Top = 250
        Width = 751
        Height = 35
        Align = alBottom
        BevelOuter = bvNone
        Color = clWindow
        ParentBackground = False
        TabOrder = 0
        DesignSize = (
          751
          35)
        object Image1: TImage
          Left = 0
          Top = 0
          Width = 751
          Height = 35
          Align = alClient
          Picture.Data = {
            0A544A504547496D616765251F0000FFD8FFE000104A46494600010101004800
            480000FFE21AC44943435F50524F46494C4500010100001AB46170706C021000
            006D6E74725247422058595A2007DD0001000500050007000A61637370415050
            4C0000000000000000000000000000000000000000000000000000F6D6000100
            000000D32D6170706C0000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000001164657363000001
            50000000626473636D000001B4000003B8637072740000056C00000024777470
            7400000590000000147258595A000005A4000000146758595A000005B8000000
            146258595A000005CC0000001472545243000005E00000080C6161726700000D
            EC000000207663677400000E0C000006126E64696E000014200000063E636861
            6400001A600000002C6D6D6F6400001A8C0000002862545243000005E0000008
            0C67545243000005E00000080C6161626700000DEC000000206161676700000D
            EC00000020646573630000000000000008446973706C61790000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000006D6C7563000000000000001E0000000C736B534B000000
            160000017863614553000000180000018E6865494C00000016000001A6707442
            5200000018000001BC6974495400000014000001D46875485500000014000001
            E8756B55410000001C000001FC6B6F4B520000000C000002186E624E4F000000
            12000002246373435A00000016000002367A6854570000000C0000024C646544
            450000001000000258726F524F00000012000002687376534500000010000002
            7A7A68434E0000000C0000024C6A614A500000000E0000028A61720000000000
            1400000298656C475200000022000002AC7074505400000016000002CE6E6C4E
            4C00000016000002E46672465200000016000002FA6573455300000012000002
            68746854480000000C0000031074725452000000140000031C66694649000000
            1000000330687248520000001400000340706C504C0000001200000354727552
            550000002400000366656E5553000000120000038A6461444B0000001C000003
            9C00460061007200650062006E00E90020004C00430044004C00430044002000
            65006E00200063006F006C006F0072200F004C00430044002005E605D105E205
            D505E005D9004C0043004400200043006F006C006F007200690064006F004C00
            43004400200063006F006C006F007200690053007A00ED006E00650073002000
            4C00430044041A043E043B044C043E0440043E0432043804390020004C004300
            44CEECB7EC0020004C0043004400460061007200670065002D004C0043004400
            420061007200650076006E00FD0020004C004300445F6982720020004C004300
            440046006100720062002D004C00430044004C0043004400200063006F006C00
            6F0072004600E400720067002D004C0043004430AB30E930FC0020004C004300
            44200F004C00430044002006450644064806460629038803B303C703C103C903
            BC03B7002003BF03B803CC03BD03B70020004C00430044004C00430044002000
            6100200043006F007200650073004B006C0065007500720065006E002D004C00
            430044004C0043004400200063006F0075006C006500750072004C0043004400
            200E2A0E3500520065006E006B006C00690020004C00430044005600E4007200
            69002D004C00430044004C004300440020007500200062006F006A0069004B00
            6F006C006F00720020004C004300440426043204350442043D043E0439002004
            16041A002D043404380441043F043B043504390043006F006C006F0072002000
            4C00430044004C00430044002D006600610072007600650073006B00E6007200
            6D7465787400000000436F70797269676874204170706C652C20496E632E2C20
            323031330058595A20000000000000F35200010000000116CF58595A20000000
            000000616C0000383200000A4258595A200000000000006F1C0000AE95000016
            9958595A20000000000000264E000019390000B2526375727600000000000004
            0000000005000A000F00140019001E00230028002D00320036003B0040004500
            4A004F00540059005E00630068006D00720077007C00810086008B0090009500
            9A009F00A300A800AD00B200B700BC00C100C600CB00D000D500DB00E000E500
            EB00F000F600FB01010107010D01130119011F0125012B01320138013E014501
            4C0152015901600167016E0175017C0183018B0192019A01A101A901B101B901
            C101C901D101D901E101E901F201FA0203020C0214021D0226022F0238024102
            4B0254025D02670271027A0284028E029802A202AC02B602C102CB02D502E002
            EB02F50300030B03160321032D03380343034F035A03660372037E038A039603
            A203AE03BA03C703D303E003EC03F9040604130420042D043B04480455046304
            71047E048C049A04A804B604C404D304E104F004FE050D051C052B053A054905
            58056705770586059605A605B505C505D505E505F60606061606270637064806
            59066A067B068C069D06AF06C006D106E306F507070719072B073D074F076107
            740786079907AC07BF07D207E507F8080B081F08320846085A086E0882089608
            AA08BE08D208E708FB09100925093A094F09640979098F09A409BA09CF09E509
            FB0A110A270A3D0A540A6A0A810A980AAE0AC50ADC0AF30B0B0B220B390B510B
            690B800B980BB00BC80BE10BF90C120C2A0C430C5C0C750C8E0CA70CC00CD90C
            F30D0D0D260D400D5A0D740D8E0DA90DC30DDE0DF80E130E2E0E490E640E7F0E
            9B0EB60ED20EEE0F090F250F410F5E0F7A0F960FB30FCF0FEC10091026104310
            61107E109B10B910D710F511131131114F116D118C11AA11C911E81207122612
            451264128412A312C312E31303132313431363138313A413C513E51406142714
            49146A148B14AD14CE14F01512153415561578159B15BD15E016031626164916
            6C168F16B216D616FA171D17411765178917AE17D217F7181B18401865188A18
            AF18D518FA19201945196B199119B719DD1A041A2A1A511A771A9E1AC51AEC1B
            141B3B1B631B8A1BB21BDA1C021C2A1C521C7B1CA31CCC1CF51D1E1D471D701D
            991DC31DEC1E161E401E6A1E941EBE1EE91F131F3E1F691F941FBF1FEA201520
            41206C209820C420F0211C2148217521A121CE21FB22272255228222AF22DD23
            0A23382366239423C223F0241F244D247C24AB24DA250925382568259725C725
            F726272657268726B726E827182749277A27AB27DC280D283F287128A228D429
            062938296B299D29D02A022A352A682A9B2ACF2B022B362B692B9D2BD12C052C
            392C6E2CA22CD72D0C2D412D762DAB2DE12E162E4C2E822EB72EEE2F242F5A2F
            912FC72FFE3035306C30A430DB3112314A318231BA31F2322A3263329B32D433
            0D3346337F33B833F1342B3465349E34D83513354D358735C235FD3637367236
            AE36E937243760379C37D738143850388C38C839053942397F39BC39F93A363A
            743AB23AEF3B2D3B6B3BAA3BE83C273C653CA43CE33D223D613DA13DE03E203E
            603EA03EE03F213F613FA23FE24023406440A640E74129416A41AC41EE423042
            7242B542F7433A437D43C044034447448A44CE45124555459A45DE4622466746
            AB46F04735477B47C04805484B489148D7491D496349A949F04A374A7D4AC44B
            0C4B534B9A4BE24C2A4C724CBA4D024D4A4D934DDC4E254E6E4EB74F004F494F
            934FDD5027507150BB51065150519B51E65231527C52C75313535F53AA53F654
            42548F54DB5528557555C2560F565C56A956F75744579257E0582F587D58CB59
            1A596959B85A075A565AA65AF55B455B955BE55C355C865CD65D275D785DC95E
            1A5E6C5EBD5F0F5F615FB36005605760AA60FC614F61A261F56249629C62F063
            43639763EB6440649464E9653D659265E7663D669266E8673D679367E9683F68
            9668EC6943699A69F16A486A9F6AF76B4F6BA76BFF6C576CAF6D086D606DB96E
            126E6B6EC46F1E6F786FD1702B708670E0713A719571F0724B72A67301735D73
            B87414747074CC7528758575E1763E769B76F8775677B37811786E78CC792A79
            8979E77A467AA57B047B637BC27C217C817CE17D417DA17E017E627EC27F237F
            847FE5804780A8810A816B81CD8230829282F4835783BA841D848084E3854785
            AB860E867286D7873B879F8804886988CE8933899989FE8A648ACA8B308B968B
            FC8C638CCA8D318D988DFF8E668ECE8F368F9E9006906E90D6913F91A8921192
            7A92E3934D93B69420948A94F4955F95C99634969F970A977597E0984C98B899
            24999099FC9A689AD59B429BAF9C1C9C899CF79D649DD29E409EAE9F1D9F8B9F
            FAA069A0D8A147A1B6A226A296A306A376A3E6A456A4C7A538A5A9A61AA68BA6
            FDA76EA7E0A852A8C4A937A9A9AA1CAA8FAB02AB75ABE9AC5CACD0AD44ADB8AE
            2DAEA1AF16AF8BB000B075B0EAB160B1D6B24BB2C2B338B3AEB425B49CB513B5
            8AB601B679B6F0B768B7E0B859B8D1B94AB9C2BA3BBAB5BB2EBBA7BC21BC9BBD
            15BD8FBE0ABE84BEFFBF7ABFF5C070C0ECC167C1E3C25FC2DBC358C3D4C451C4
            CEC54BC5C8C646C6C3C741C7BFC83DC8BCC93AC9B9CA38CAB7CB36CBB6CC35CC
            B5CD35CDB5CE36CEB6CF37CFB8D039D0BAD13CD1BED23FD2C1D344D3C6D449D4
            CBD54ED5D1D655D6D8D75CD7E0D864D8E8D96CD9F1DA76DAFBDB80DC05DC8ADD
            10DD96DE1CDEA2DF29DFAFE036E0BDE144E1CCE253E2DBE363E3EBE473E4FCE5
            84E60DE696E71FE7A9E832E8BCE946E9D0EA5BEAE5EB70EBFBEC86ED11ED9CEE
            28EEB4EF40EFCCF058F0E5F172F1FFF28CF319F3A7F434F4C2F550F5DEF66DF6
            FBF78AF819F8A8F938F9C7FA57FAE7FB77FC07FC98FD29FDBAFE4BFEDCFF6DFF
            FF706172610000000000030000000266660000F2A700000D59000013D000000A
            0E76636774000000000000000000030100000200000056012E01EB02C4038304
            5305400627071A0818091F0A3D0B4E0C6B0D900EB90FEC112D126513A314E316
            2A177918BF1A0F1B571CA41DF31F3C208421CD23112452258D26CB280029332A
            662B972CCA2DF72F283051318032AB33D535023631375D388A39B63AE13C0D3D
            383E603F8940B141DC430844364563469047B848DE4A014B244C474D6A4E8F4F
            B450D851F853165433554F566D578D58AE59CB5AE15BF05CF75DFB5F00600A61
            19622D63416452655F666567616853693C6A206B016BE06CBF6DA06E836F6870
            5071387220730873EF74D675BE76A87793787E796C7A597B497C3D7D377E367F
            398041814B8257836584748585869487A488B389C08ACC8BD68CDF8DE78EED8F
            F290F591F692F593F594FA96049715982C99479A639B7F9C989DAE9EBF9FCBA0
            D4A1DAA2E0A3E9A4F4A603A715A82AA942AA5CAB77AC94ADB2AED1AFF1B111B2
            33B353B473B590B6A9B7BAB8C1B9C3BAC0BBBBBCB5BDAFBEA9BFA3C09DC195C2
            8AC37CC46AC553C636C718C7F9C8E0C9CFCAC6CBC3CCC1CDBCCEAFCF98D073D1
            43D20DD2D3D39BD466D535D605D6D7D7A8D876D940DA06DAC7DB80DC35DCE7DD
            91DE3BDEE3DF8DE03BE0EBE19FE252E303E3AFE455E4F9E594E62CE6BFE752E7
            E4E885E92FE9E4EAA8EB6EEC33ECF5EDAFEE63EF11EFB5F050F0E6F17CF217F2
            C6F38FF46EF561F666F78AF8E4FAC5FD2EFFFF00000056012301B0026A033203
            E804B105800658073D082D09270A270B220C300D3A0E510F63107E119F12BE13
            E9151016381761188819B41ADE1C0B1D331E5B1F8020A121BF22DB23F5250B26
            1F2735284929602A792B932CB12DCC2EE830043121323C335A3474358B36A437
            B938CD39E23AF43C063D1B3E313F4D406C418F42B043D044ED4608471D483249
            454A554B634C6E4D784E7E4F83508551865288538A548C558A56845779586859
            545A445B3F5C465D5A5E775F9560B061C262CA63C564B5659C667B6757683069
            0C69EC6AD06BBA6CA96D9B6E8F6F827072715C7240731F73FB74D575AD768677
            62784579307A247B1D7C197D157E107F067FF680E281CA82B183958477855D86
            4A8744884C89618A818BA58CC68DDE8EEE8FF590F791F592F393F094ED95EC96
            EE97F899109A399B6E9CA69DCE9EE39FE9A0E5A1DFA2D9A3D1A4C8A5BEA6BCA7
            CAA8EDAA21AB5DAC9CADD9AF14B04EB188B2C2B3F9B52EB664B79BB8D2BA05BB
            34BC5FBD85BEA6BFBCC0BEC1AAC290C37DC477C580C68FC79DC8A3C99ECA8ECB
            75CC53CD2DCE04CEDACFB2D08BD16AD251D345D445D551D662D775D884D987DA
            7DDB66DC43DD1ADDECDEB9DF87E058E12DE208E2E6E3C3E49DE571E640E70CE7
            D4E8A3E97FEA69EB64EC68ED6DEE70EF70F070F172F276F379F477F569F647F7
            0FF7B3F845F8CBF95AF9EDFAD0FC0CFDDAFFFF0000002B00C4014B01D8026503
            06038F042B04CF057A062F06E907A50868092F09F90ACA0B9F0C770D520E320F
            0E0FF610D911C012A91393147D15671652173D1829191519FC1AE81BD21CBE1D
            AE1EA31F9B20962194228F2386247625612645272027F828CC299F2A732B482C
            212D022DE92ED72FC830BA31AA3298338034603539360636CF37953858391939
            D93A9D3B643C323D063DDE3EB63F8F4068414442264310440044F345E746D647
            BB489649654A254AE04B984C4F4D074DC34E834F49501850EA51BE5293536854
            3B550D55DE56AD577C584A591559DF5AA85B6F5C355CF95DBD5E805F43600860
            D1619C626B633C640C64DA65A76671673867FC68BF69806A406B006BC06C816D
            436E046EC56F85704170F871AB7259730173A9744F74F47598763C76DE778078
            1D78BD79607A167ADA7BAB7C837D587E287EF67FC3809381678244832A841885
            0B860086F487E388CD89AF8A8C8B618C348D078DDA8EB08F8A906B9147921292
            C6935B93EC947A95419642978899089A8A9BE49D199E329F39A039A135A22FA3
            28A421A519A611A70AA809A90FAA21AB3DAC60AD87AEADAFD3B0FCB228B35AB4
            92B5D1B714B859B99CBAD7BC05BD29BE47BF62C07FC19EC2BEC3DFC4FFC621C7
            43C867C98CCAB1CBD6CCFDCE29CF5BD097D1DED332D48DD5EED753D8B9DA21DB
            95DD2FDF0EE177E48BE879ED4EF2F6F951FFFF00006E64696E00000000000006
            36000093950000568D000056E9000091B7000026BB0000170A0000500D000054
            39000287AE000247AE00016B850003010000020000000100040008000F001600
            1F002900340040004C005A006900780089009A00AC00BE00D200E600FC011201
            29014001590173018D01A901C501E30201022102420264028702AC02D202FA03
            23034D037A03A803D70408043A046D04A304D90512054B058605C30601064006
            8006C20705074A079007D80821086C08B90907095709A809FA0A4D0AA10AF70B
            4E0BA80C040C620CC30D250D890DEE0E540EBC0F250F911000107110E4115911
            CF124612BD133813B6143A14C3155215E3167517061796182618B8194E19E81A
            881B311BE31C9F1D621E2B1EF81FC6209521642234230623DB24B3258F266C27
            4B282B290D29F02AD52BBB2C9E2D7E2E5C2F39301430F031CD32AA3389346835
            4A362E371537FF38ED39DE3AD23BCA3CC53DC43EC73FCE40DA41E842F6440045
            0646084708480849094A0C4B144C214D344E4E4F6E509451BC52E5540D553456
            59577D58A059C45AE75C0B5D305E565F7C60A461CE62F864246553668567BC68
            FA6A436B996CF96E636FD2714672BC743475AF772D78B17A3C7BD07D6F7F1C80
            D68294844C85F68794892C8AC58C658E158FDF91CD93DD95FF98209A399C4C9E
            5FA079A2A0A4DAA72DA9A0AC30AEE0B1A1B45EB70BB9AEBC5DBF2BC21FC546C8
            A2CC0CCF28D1F6D491D728D9D1DC9EDF97E2D2E660E9F9ED12EFACF200F430F6
            39F7FFF98AFAB8FBD4FCBBFDA3FE70FF37FFFF000000010005000A0012001B00
            260032003F004D005C006D007E009100A400B900CF00E500FD0116012F014A01
            66018301A201C101E202040227024C0272029A02C302EF031C034B037C03AF03
            E4041A0452048B04C50501053D057B05BB05FC063F068306C90710075907A507
            F20841089308E6093B099309EC0A460AA10AFC0B580BB40C120C720CD40D390D
            A00E0B0E780EE70F590FCE104610C0113E11BF124312CA135313DD146A14FA15
            8F162A16CB1771181618B6195119E61A791B0D1BA41C401CE41D911E4A1F0E1F
            DD20B3218E22692342241824EB25BD26902766284229252A122B082C052D082E
            0E2F123011310831F932E833D734CA35C136C137CA38DB39F23B0E3C303D513E
            693F7440724168425843474439453446384747485F497E4AA14BC74CF04E1B4F
            45506B5186529453975495559456A057BF58F15A355B805CCD5E1E5F7460CF62
            236366649565B566CE67E468FB6A166B336C546D766E9A6FC070EA7217734674
            7675A776DA7810794D7A8F7BD87D267E7D7FE38167831084CA8674880689878B
            048C888E1B8FC3918293589543973B993B9B3B9D399F29A104A2C6A476A61BA7
            BDA962AB15ACDDAEC5B0CFB2F5B531B77CB9CBBC0FBE44C072C2A6C4E9C742C9
            B2CC31CE9CD0DDD2F4D4F1D6E7D8E3DAE8DCF4DF01E10AE314E524E748E996EC
            37EF8AF3A6F76CF9CEFB84FCC3FDF4FEF9FFFF0000000200080011001E002D00
            3E00510066007D009600B000CC00EA0109012B014D0172019801C001EA021602
            44027402A602DA03110349038403C003FD043B047A04BA04FC0541058A05D706
            29068106DD073E07A20808086F08D40939099D0A020A6A0AD50B440BBB0C390C
            C10D500DE60E820F210FC0105C10F61190122D12CD136E140D14A8154215DC16
            79171E17CE188E19621A421B2A1C141CFB1DDD1EB81F92206D214C2230231824
            0624F925F126EF27F328FD2A0E2B242C402D602E802F9D30B831D332F3341A35
            49368237C3390C3A5C3BB03D073E603FBE41224293441645AE475A49114AD14C
            9A4E6F5055523253DA555A56CC584859D35B665CF85E836001617062D5643765
            9C670968816A0A6BA36D4D6F0070B7726F741E75C3777579647BEE7EA4807981
            D682FC8402850886108733887389D48B558CE98E88902E91D99388953B96F198
            A99A5E9C0A9DA79F37A0BDA23FA3C0A544A6CAA850A9D4AB54ACD0AE46AFB9B1
            28B297B408B57DB6FCB889BA26BBD0BD82BF36C0E9C29CC44FC604C7BBC973CB
            2BCCE4CE9ED058D214D3D2D58FD74AD8FFDAACDC4FDDE8DF75E0FDE282E403E5
            82E702E883EA04EB7FECEEEE46EF79F09DF18DF275F344F3F7F4AAF54EF5DBF6
            68F6F6F776F7E9F85CF8CFF943F9ABFA0DFA70FAD2FB35FB98FBF1FC49FCA2FC
            FBFD54FDADFE03FE58FEACFF01FF55FFAAFFFF0000736633320000000000010C
            42000005DEFFFFF326000007920000FD91FFFFFBA2FFFFFDA3000003DC0000C0
            6C6D6D6F64000000000000061000009CDF00000000CA2AD58000000000000000
            000000000000000000FFE100804578696600004D4D002A000000080005011200
            030000000100010000011A0005000000010000004A011B000500000001000000
            5201280003000000010002000087690004000000010000005A00000000000000
            480000000100000048000000010002A00200040000000100000034A003000400
            0000010000002F00000000FFDB00430002010102010102020102020202020305
            03030303030604040305070607070706060607080B0907080A080606090D090A
            0B0B0C0C0C07090D0E0D0C0E0B0C0C0BFFDB004301020202030203050303050B
            0806080B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B
            0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0BFFC0001108002F00340301
            2200021101031101FFC4001F0000010501010101010100000000000000000102
            030405060708090A0BFFC400B5100002010303020403050504040000017D0102
            0300041105122131410613516107227114328191A1082342B1C11552D1F02433
            627282090A161718191A25262728292A3435363738393A434445464748494A53
            5455565758595A636465666768696A737475767778797A838485868788898A92
            939495969798999AA2A3A4A5A6A7A8A9AAB2B3B4B5B6B7B8B9BAC2C3C4C5C6C7
            C8C9CAD2D3D4D5D6D7D8D9DAE1E2E3E4E5E6E7E8E9EAF1F2F3F4F5F6F7F8F9FA
            FFC4001F0100030101010101010101010000000000000102030405060708090A
            0BFFC400B5110002010204040304070504040001027700010203110405213106
            1241510761711322328108144291A1B1C109233352F0156272D10A162434E125
            F11718191A262728292A35363738393A434445464748494A535455565758595A
            636465666768696A737475767778797A82838485868788898A92939495969798
            999AA2A3A4A5A6A7A8A9AAB2B3B4B5B6B7B8B9BAC2C3C4C5C6C7C8C9CAD2D3D4
            D5D6D7D8D9DAE2E3E4E5E6E7E8E9EAF2F3F4F5F6F7F8F9FAFFDA000C03010002
            110311003F00F9C8FC23F0F1FF0097441FF004FF00E269A7E0EF877BDA0FFBE1
            3FF89ABE351C75268FED1CF7A00CE3F067C3A7FE5D47FDF31FFF00134D6F829E
            1C6EB6DFF8EC7FFC4569FF0068FA9A3FB43DCD00649F81FE1B27FE3D8FFDF31F
            FF0011487E05F8688E6DDFFEF98FFF0088AD7FED2F56CD1F6FF7A00C6FF850FE
            1AFF009F76FCA3FF00E228AD9FED1F7FD28A00E7FF00B4FDC0A06A87D6B9F1AA
            0F5A3FB4C7A9A00E83FB4F3DC51FDA7EA4573FFDA9F5A3FB53D49A00E83FB50F
            A8A3FB53DC573FFDA83B9A3FB4A803A0FED33ED4573FFDABEE68A00E7FFB471D
            E97FB471DCD7950FDA13491FF2EFA9FF00DFB4FF00E2E8FF008684D28FFCBAEA
            7FF7C47FFC5D007AA1D4334BFDA1EF5E55FF000D0BA4F7B6D4FF00EFDA7FF174
            7FC342693FF3EDA9FF00DF09FF00C5D007AAFF00697BD1FDA1EA6BCA87ED09A5
            1EB6DA9FFDFB4FFE2E90FED07A50FF00975D4FFEF84FFE2E803D5BFB43DE8AF2
            AFF8684D27FE7DF52FFBF71FFF001745007FFFD9}
          Stretch = True
          ExplicitLeft = 48
          ExplicitTop = 16
          ExplicitWidth = 105
          ExplicitHeight = 105
        end
        object btnLoad: TButton
          Left = 682
          Top = 7
          Width = 63
          Height = 24
          Anchors = [akRight, akBottom]
          Caption = 'Load'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Georgia'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
          OnClick = btnLoadClick
        end
      end
      object Panel1: TPanel
        Left = 0
        Top = 0
        Width = 751
        Height = 24
        Align = alTop
        BevelOuter = bvNone
        Color = clWindow
        ParentBackground = False
        TabOrder = 1
        object Image2: TImage
          Left = 0
          Top = 0
          Width = 751
          Height = 24
          Align = alClient
          Picture.Data = {
            07544269746D617056010000424D560100000000000036000000280000000800
            00000C0000000100180000000000200100000000000000000000000000000000
            0000CECECECECECECECECECECECECECECECECECECECECECECECED1D1D1D1D1D1
            D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D6D6D6D6D6D6D6D6D6D6D6D6D6D6
            D6D6D6D6D6D6D6D6D6D6DBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDB
            DBDBDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFE3E3E3E3E3E3
            E3E3E3E3E3E3E3E3E3E3E3E3E3E3E3E3E3E3E8E8E8E8E8E8E8E8E8E8E8E8E8E8
            E8E8E8E8E8E8E8E8E8E8ECECECECECECECECECECECECECECECECECECECECECEC
            ECECF0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F5F5F5F5F5F5
            F5F5F5F5F5F5F5F5F5F5F5F5F5F5F5F5F5F5FAFAFAFAFAFAFAFAFAFAFAFAFAFA
            FAFAFAFAFAFAFAFAFAFAFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE
            FEFE}
          Stretch = True
          ExplicitLeft = 640
          ExplicitTop = 8
          ExplicitWidth = 105
          ExplicitHeight = 105
        end
      end
    end
  end
  object ApplicationEvents1: TApplicationEvents
    Left = 528
  end
end
