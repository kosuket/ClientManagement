inherited MailDlgframe: TMailDlgframe
  Caption = 'MailDlgframe'
  ClientHeight = 509
  ExplicitWidth = 434
  ExplicitHeight = 547
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlBase: TPanel
    Height = 509
    ExplicitHeight = 509
    object Splitter1: TSplitter [0]
      Left = 1
      Top = 73
      Width = 416
      Height = 3
      Cursor = crVSplit
      Align = alTop
      ExplicitWidth = 435
    end
    inherited pnlTitle: TPanel
      inherited lblTitle: TPanel
        object btnSend: TSpeedButton
          Left = 1
          Top = 2
          Width = 67
          Height = 22
          Caption = 'SEND'
          OnClick = btnSendClick
        end
      end
    end
    object pnlAddress: TPanel
      Left = 1
      Top = 28
      Width = 416
      Height = 45
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 1
      object sgRecepient: TStringGrid
        Left = 0
        Top = 0
        Width = 416
        Height = 45
        Align = alClient
        ColCount = 2
        DefaultColWidth = 180
        FixedCols = 0
        RowCount = 1
        FixedRows = 0
        Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goEditing]
        TabOrder = 0
        OnSetEditText = sgRecepientSetEditText
      end
    end
    object pnlContents: TPanel
      Left = 1
      Top = 76
      Width = 416
      Height = 432
      Align = alClient
      BevelOuter = bvNone
      TabOrder = 2
      object pnlSubject: TPanel
        Left = 0
        Top = 0
        Width = 416
        Height = 22
        Align = alTop
        BevelOuter = bvNone
        Color = clCream
        ParentBackground = False
        TabOrder = 0
        object lblSubject: TLabel
          Left = 0
          Top = 0
          Width = 50
          Height = 22
          Align = alLeft
          Alignment = taCenter
          AutoSize = False
          Caption = 'Subject:'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Georgia'
          Font.Style = []
          ParentFont = False
          Layout = tlCenter
        end
        object edtSubject: TEdit
          Left = 50
          Top = 0
          Width = 366
          Height = 22
          Align = alClient
          TabOrder = 0
          ExplicitWidth = 367
        end
      end
      object memoContents: TRichEdit
        Left = 0
        Top = 49
        Width = 416
        Height = 383
        Align = alClient
        BevelInner = bvNone
        BorderStyle = bsNone
        ScrollBars = ssBoth
        TabOrder = 1
      end
      object pnlAttachment: TPanel
        Left = 0
        Top = 22
        Width = 416
        Height = 27
        Align = alTop
        BevelOuter = bvNone
        Color = clCream
        ParentBackground = False
        TabOrder = 2
        DesignSize = (
          416
          27)
        object btnAttach: TSpeedButton
          Left = 50
          Top = 5
          Width = 19
          Height = 18
          Hint = 'Attach File'
          Glyph.Data = {
            96060000424D9606000000000000360000002800000016000000180000000100
            18000000000060060000C40E0000C40E00000000000000000000FEFEFEFFFFFF
            FFFFFFFEFFFFFEFEFFFCFCFBFCF9F5FDF7EEFDF3E9FDF2E5FDF0E2FDF0E0FCEF
            E2FDF1E3FCF3E8FDF6EEFEF9F4FEFBF9FCFEFEFEFFFFFDFDFEFEFEFE0000FEFE
            FEFFFFFFFDFEFEFEF8F3FCEFE0FDEAD2FBE3C2FCDCB8FAD6ADFCD19FFDCC95FD
            CA90FEC988FEC783FEC581FFC87EFDCA88FDD198FFD9B0FEE5CBFCF7F1FEFEFF
            0000FEFEFEFDFDFDFEFFFFFFFFFFFFFEF8FFFAECFFF8E3FFF5DBFFF3D8FFF5D4
            FBEAC3F3CB9EF0B17BEF975FEA8347EB6C34E87945EDA274F4D2ABF8FDF9FFFF
            FFFEFEFF0000FFFFFFFFFFFFFAFFFFECE0D8E7BEB1E2A296DD8068D66546D956
            2BD84911DD4906E75B05ED6A05F27D0EF6941DFAAA1FFFB917FEB50FF5841BED
            7A0FF5F8F3FFFFFF0000E8D2C8C61C00CB1400D02700E67520EC7213F4811CFC
            9220FF951AFE8A00F4A42AF9D798F8EBC5F6E29CF7B600FEC400FDCA00FECC00
            F69B30F58E1CF1BD84FFFFFF0000D54816D63B00D03500F5A946FB5100FE6000
            FE6900FD7200FE7500F0B977F1DFBCF1CE92F1D482EFC757F4F1CCFDC300FBD2
            00FDDA00F9A931F89B24F4B572FFFFFF0000D6470BD94307D95513FC781FFE56
            00FD6402FD6C01FD7400F97600F1E8C9F4C182F4CD82F3BD4EF4EECDF4E2ACF6
            CC0DFFDA00FEE700FCB432FAA028F1AD58FFFFFF0000DA642BD94907DA5211FB
            771EFF5600FC6202FB6A02FF7500F77E06F7D3AAF3E1BFFA8B00FFA100F6DB9A
            F3DD8BF8D443FDD200FDDB00FAB22AF99D2AEF9C3DFEFFFF0000DD7B49DC4F09
            D74D0AFA9B46FC5000FD6202FB6900FD7100F97C03F7D4B1F5DFB3FF9000FEA1
            00F6C95CF1DD90F6DA74FEC600FFCE00F7AB22F8982DEE871BFDFFFF0000E290
            62DE530DD94F0CFAA34EF77B33FC5800FD6802FF7000E97000E8CAA2E0CDAEED
            8200F29600F8BB3CF0DCA8F6D982FEB800FEC200F8A31BF28D2CEF780CFAFFFF
            0000E7A179E25910DF5914F59843FE9352F67623FC5F00FE6D00F36D00DDC6A5
            E0C9AEE77A00E98E06F0AA33F2D899F1D58EFEAB00FEB400F79C14F08427EF6E
            0AF7FCFC0000ECB691E25C11E06117F0933DFF8A4CFC9851F7731AFE6300F268
            00DCC6AAD8BBA3E57E03EE8C08F79D1BEBD29AEED3A0FF9E00FFA700F8960CEE
            7624EE6609F4EBE10000EDCBAFE26210E2691EEE8F3AFE894AFE8E49FC9954F9
            7215F65F00ECCEB5CFAA87F18415F98603F88E01E6CAA0E8D0AAFE9100FD9C00
            F99108EB6B21E95E0AF3DCCB0000F0DBC8E56812E67122EE8C35FE894DFE8A4A
            FE8E49FC9A52F47015E5BD9ED9A77CF48B2DF7810CFA7C00E7C9ADE8CFB8FC86
            00FC9000FB8B04EA6021E95806F1C8B40000F3E8DBE86E13E87828EE8C35FD87
            4AFE8849FD8C46FD914AFF9444E0BDA2E59E6DE9924EF87500FD7000DFCAB0EB
            9D4AFD8100FE8501FE8402E6591AEA4F09ECB1950000F7F9F6E87415EC7F2CED
            8D34FF864BFC8548FB8849FF8D48FE8B3EECBD9AEAB389E99660FE6900FF6900
            DEC4ADFD7000FB7A00FD7C01FC7C00E55016E6470CEB9A790000FCFFFFEB7919
            ED8731F18F33FC884BFD8149FD8549FC8849FF8841EFAD80ECB58EEFAB77F963
            00FF5C00DCB79FF96F07FE6F00FD7002FE7300E54B14E14209E683660000FFFF
            FFE98224EF8D34F19236FC894AFE7F4DFD8248FD8649FF8646F29C6CEBB494FF
            8B3CFD9A54F96F10DAAA8BF66810FE6600FD6800FF6B00E6470FE33B0BE26E4B
            0000FFFFFFEE9840F39239F19839FB8A49FD7D4BFD7F4BFD8148FD8446F8884E
            E1C3B2FF853EFF8E48FF8F44E3C4ACF1691BFE5600FE5D03FF6103E6430BE037
            0DDE522D0000FFFFFFF0A95CF49939F39E3CFB8C47FF794BFC7D4BFF804BFD82
            48FD7A39DACEC9FF8038FD8A4AFF8540E4BDA6F39A5FFA8037F75905FF5200E9
            3A07DF330BDF340A0000FFFFFFF3BB78F99E3BF7A342FB9047FC7548FD7B49FD
            7D4AFE7E4BFF783EDFCCC3F77C3EFF7C3DFF752ADDCDC5FB8646FF8B4CFF9354
            F77F40E0401CDE1A00DB3A210000FFFFFFF6C78BF9A43CF8AA47FB9544FE724B
            FC7749FE7B4AFF7C4AFF7C48F88050D9E3E7DCC9B9D9DEDEE4A388F8753DF278
            46F07443E86E43E86F42E67C54F0E2DE0000FFFFFFF3E1BDFAA530FCB046FB9B
            41FF6D49FD7649F87448F57347F37145F06E42EC6234E7673CE66334E98861EA
            A48BF0BDAAF0D6CCF7F0EDFDFFFFFFFFFFFFFFFF0000FEFEFEFDFFFFF6DBAFF6
            CA7DF7C46CE98559E57658E89277EBA690EEBBACF0D4CAF4EAE6FBFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCFCFCFEFEFE0000}
          ParentShowHint = False
          ShowHint = True
          OnClick = btnAttachClick
        end
        object lblAttatch: TLabel
          Left = 0
          Top = 0
          Width = 50
          Height = 27
          Align = alLeft
          Alignment = taCenter
          AutoSize = False
          Caption = 'Attatch'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Georgia'
          Font.Style = []
          ParentFont = False
          Layout = tlCenter
          ExplicitLeft = 8
        end
        object lbAttachment: TListBox
          Left = 71
          Top = 3
          Width = 344
          Height = 22
          Anchors = [akLeft, akTop, akRight, akBottom]
          BevelInner = bvNone
          BevelOuter = bvNone
          BorderStyle = bsNone
          Color = clCream
          ItemHeight = 13
          PopupMenu = PopupMenu1
          TabOrder = 0
          OnKeyDown = lbAttachmentKeyDown
        end
      end
      object ProgressBar1: TProgressBar
        Left = 128
        Top = 160
        Width = 150
        Height = 17
        TabOrder = 3
        Visible = False
      end
    end
  end
  object IdSMTP1: TIdSMTP
    AuthType = satNone
    SASLMechanisms = <>
    Left = 329
    Top = 17
  end
  object IdMessage1: TIdMessage
    AttachmentEncoding = 'UUE'
    BccList = <>
    CCList = <>
    Encoding = meDefault
    FromList = <
      item
      end>
    Recipients = <>
    ReplyTo = <>
    ConvertPreamble = True
    Left = 288
    Top = 25
  end
  object OpenDialog1: TOpenDialog
    Left = 280
    Top = 1
  end
  object PopupMenu1: TPopupMenu
    Left = 305
    Top = 114
    object pmDeleteAttachment: TMenuItem
      Caption = 'Detach'
      Enabled = False
      OnClick = pmDeleteAttachmentClick
    end
  end
end
