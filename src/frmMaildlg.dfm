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
          ExplicitHeight = 21
        end
      end
      object memoContents: TRichEdit
        Left = 0
        Top = 51
        Width = 416
        Height = 381
        Align = alClient
        BevelInner = bvNone
        BorderStyle = bsNone
        ScrollBars = ssBoth
        TabOrder = 1
        ExplicitTop = 49
        ExplicitHeight = 383
      end
      object pnlAttachment: TPanel
        Left = 0
        Top = 22
        Width = 416
        Height = 29
        Align = alTop
        BevelOuter = bvNone
        Color = clCream
        ParentBackground = False
        TabOrder = 2
        DesignSize = (
          416
          29)
        object btnAttach: TSpeedButton
          Left = 50
          Top = -1
          Width = 25
          Height = 23
          Hint = 'Attach File'
          Glyph.Data = {
            46060000424D4606000000000000360400002800000016000000160000000100
            08000000000010020000C40E0000C40E00000001000000000000000000000000
            80000080000000808000800000008000800080800000C0C0C000C0DCC000F0CA
            A6000020400000206000002080000020A0000020C0000020E000004000000040
            20000040400000406000004080000040A0000040C0000040E000006000000060
            20000060400000606000006080000060A0000060C0000060E000008000000080
            20000080400000806000008080000080A0000080C0000080E00000A0000000A0
            200000A0400000A0600000A0800000A0A00000A0C00000A0E00000C0000000C0
            200000C0400000C0600000C0800000C0A00000C0C00000C0E00000E0000000E0
            200000E0400000E0600000E0800000E0A00000E0C00000E0E000400000004000
            20004000400040006000400080004000A0004000C0004000E000402000004020
            20004020400040206000402080004020A0004020C0004020E000404000004040
            20004040400040406000404080004040A0004040C0004040E000406000004060
            20004060400040606000406080004060A0004060C0004060E000408000004080
            20004080400040806000408080004080A0004080C0004080E00040A0000040A0
            200040A0400040A0600040A0800040A0A00040A0C00040A0E00040C0000040C0
            200040C0400040C0600040C0800040C0A00040C0C00040C0E00040E0000040E0
            200040E0400040E0600040E0800040E0A00040E0C00040E0E000800000008000
            20008000400080006000800080008000A0008000C0008000E000802000008020
            20008020400080206000802080008020A0008020C0008020E000804000008040
            20008040400080406000804080008040A0008040C0008040E000806000008060
            20008060400080606000806080008060A0008060C0008060E000808000008080
            20008080400080806000808080008080A0008080C0008080E00080A0000080A0
            200080A0400080A0600080A0800080A0A00080A0C00080A0E00080C0000080C0
            200080C0400080C0600080C0800080C0A00080C0C00080C0E00080E0000080E0
            200080E0400080E0600080E0800080E0A00080E0C00080E0E000C0000000C000
            2000C0004000C0006000C0008000C000A000C000C000C000E000C0200000C020
            2000C0204000C0206000C0208000C020A000C020C000C020E000C0400000C040
            2000C0404000C0406000C0408000C040A000C040C000C040E000C0600000C060
            2000C0604000C0606000C0608000C060A000C060C000C060E000C0800000C080
            2000C0804000C0806000C0808000C080A000C080C000C080E000C0A00000C0A0
            2000C0A04000C0A06000C0A08000C0A0A000C0A0C000C0A0E000C0C00000C0C0
            2000C0C04000C0C06000C0C08000C0C0A000F0FBFF00A4A0A000808080000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFED0707070707070707070707
            07070707ED08FFFF0000FFED09FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE3FFFF
            0000FFEDFFFFFFFF07A407A4FFFFFFFFFFFFFFFFFF07F6FF0000FF07FFFFFFA4
            FFFFFFFFA4FFFFFFFFFFFFFFFF07F6FF0000FF07FFFF07FFFFFFFFFFFFA4FFFF
            FFFFFFFFFF07F6FF0000FF07FFFFA4FFFFFFA4A407FFA4FFFFFFFFFFFF07F6FF
            0000FF07FFFFFF07FFFF07FFFFA4FFA4FFFFFFFFFF07F6FF0000FF07FFFFFFA4
            FFFFA4FFFFFFA4FFA4FFFFFFFF07F6FF0000FF07FFFFFF07FFFFFFA4FFFFA4FF
            FFFFFFFFFF07F6FF0000FF07FFFFFFFFA4FFFFFFA4FFFFA4FFA4FFFFFF07F6FF
            0000FF07FFFFFFFFFFA4FFFFA4FFFFA4FFFFFFFFFF07F6FF0000FF07FFFFFFFF
            FFA4FFFFFFA4FFFFA4FFFFFFFF07F6FF0000FF07FFFFFFFFFFFFA4FFFFA4FFFF
            FFA4FFFFFF07F6FF0000FF07FFFFFFFFFFFFFFA4FFFFA4FFFFA4FFFFFF07F6FF
            0000FF07FFFFFFFFFFFFFFA4FFFFFFFFFFFFFFFFFF07F6FF0000FF07FFFFFFFF
            FFFFFFFFA4FFFFFFA4FFFFFFFF07F6FF0000FF07FFFFFFFFFFFFFFFFFFFFA4A4
            FFFFFFFFFF07F6FF0000FFEDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF5F6FF
            0000FF08E308070707070707070707070707080809ECFFFF0000FFFFFFF6F6F6
            F6F6F6F6F6F6F6F6F6F6F6F6F6FFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFF0000}
          ParentShowHint = False
          ShowHint = True
          OnClick = btnAttachClick
        end
        object lblAttatch: TLabel
          Left = 0
          Top = 0
          Width = 50
          Height = 29
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
          ExplicitHeight = 27
        end
        object lbAttachment: TListBox
          Left = 77
          Top = 3
          Width = 338
          Height = 24
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
