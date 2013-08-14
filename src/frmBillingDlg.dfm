inherited BillingDialogframe: TBillingDialogframe
  Caption = 'Billing'
  ClientHeight = 575
  ClientWidth = 978
  ExplicitWidth = 994
  ExplicitHeight = 613
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlBase: TPanel
    Width = 978
    Height = 575
    ExplicitWidth = 978
    ExplicitHeight = 575
    object Splitter1: TSplitter [0]
      Left = 489
      Top = 28
      Height = 546
      ExplicitLeft = 528
      ExplicitTop = 112
      ExplicitHeight = 100
    end
    inherited pnlTitle: TPanel
      Width = 976
      ExplicitWidth = 976
      inherited Image1: TImage
        Width = 974
        ExplicitWidth = 974
      end
      object btnReflectOnMail: TSpeedButton [1]
        Left = 491
        Top = 2
        Width = 182
        Height = 22
        Caption = 'Reflect Billing Info on Mail'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Georgia'
        Font.Style = []
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
          0000FFEDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF07F6FF0000FF07FFFFFFFF
          FFFFFFA4FFFFFFFFFFFFFFFFFF07F6FF0000FF07FFFFFFFFFFFFA4A4FFFFFFFF
          FFFFFFFFFF07F6FF0000FF07FFFFFFFFFFA4FFA4FFFFFFFFFFFFFFFFFF07F6FF
          0000FF07FFFFFFFFA4FFFFA4A4A4A4A4A4A4A4FFFF07F6FF0000FF07FFFFFFA4
          FFFFFFFFFFFFFFFFFFFFA4FFFF07F6FF0000FF07FFFFA4FFFFFFFFFFFFFFFFFF
          FFFFA4FFFF07F6FF0000FF07FFA4FFFFFFFFFFFFFFFFFFFFFFFFA4FFFF07F6FF
          0000FF07FFFFA4FFFFFFFFFFFFFFFFFFFFFFA4FFFF07F6FF0000FF07FFFFFFA4
          FFFFFFFFFFFFFFFFFFFFA4FFFF07F6FF0000FF07FFFFFFFFA4FFFFA4A4A4A4A4
          A4A4A4FFFF07F6FF0000FF07FFFFFFFFFFA4FFA4FFFFFFFFFFFFFFFFFF07F6FF
          0000FF07FFFFFFFFFFFFA4A4FFFFFFFFFFFFFFFFFF07F6FF0000FF07FFFFFFFF
          FFFFFFA4FFFFFFFFFFFFFFFFFF07F6FF0000FF07FFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFF07F6FF0000FFEDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF6FFF5F6FF
          0000FF08E308070707070707070707070707080809ECFFFF0000FFFFFFF6F6F6
          F6F6F6F6F6F6F6F6F6F6F6F6F6FFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFF0000}
        ParentFont = False
        OnClick = btnReflectOnMailClick
      end
      inherited lblTitle: TPanel
        object btnSend: TSpeedButton
          Left = 1
          Top = 2
          Width = 67
          Height = 22
          Hint = 'Send Email and register Invoice Info'
          Caption = 'SEND'
          ParentShowHint = False
          ShowHint = True
          OnClick = btnSendClick
        end
        object btnInvoice: TSpeedButton
          Left = 80
          Top = 2
          Width = 67
          Height = 22
          Hint = 'Register Invoice Info without sending email'
          Caption = 'INVOICE'
          ParentShowHint = False
          ShowHint = True
          OnClick = btnInvoiceClick
        end
      end
    end
    object pnlMail: TPanel
      Left = 1
      Top = 28
      Width = 488
      Height = 546
      Align = alLeft
      BevelOuter = bvNone
      Color = clCream
      ParentBackground = False
      TabOrder = 1
    end
    object pnlGrid: TPanel
      Left = 492
      Top = 28
      Width = 485
      Height = 546
      Align = alClient
      BevelOuter = bvNone
      TabOrder = 2
      object Splitter2: TSplitter
        Left = 0
        Top = 266
        Width = 485
        Height = 3
        Cursor = crVSplit
        Align = alTop
        ExplicitTop = 305
        ExplicitWidth = 241
      end
      object pnlBilling: TPanel
        Left = 0
        Top = 33
        Width = 485
        Height = 233
        Align = alTop
        BevelOuter = bvNone
        Caption = 'pnlBilling'
        TabOrder = 0
        object grdBilling: TStringGrid
          Left = 0
          Top = 0
          Width = 485
          Height = 200
          Align = alClient
          FixedColor = clCream
          FixedCols = 0
          TabOrder = 0
        end
        object pnlBillSummary: TPanel
          Left = 0
          Top = 200
          Width = 485
          Height = 33
          Align = alBottom
          BevelOuter = bvNone
          Color = clCream
          ParentBackground = False
          TabOrder = 1
          object lblTotalCharge: TLabel
            Left = 9
            Top = 6
            Width = 40
            Height = 21
            AutoSize = False
            Caption = 'Total:'
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Georgia'
            Font.Style = []
            ParentFont = False
            Layout = tlCenter
          end
          object edtTotalCharge: TStaticText
            Left = 47
            Top = 6
            Width = 394
            Height = 21
            AutoSize = False
            BevelInner = bvLowered
            BorderStyle = sbsSunken
            Caption = 'edtTotalCharge'
            Color = clWindow
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Georgia'
            Font.Style = []
            ParentColor = False
            ParentFont = False
            TabOrder = 0
            Transparent = False
          end
        end
      end
      object pnlCounseling: TPanel
        Left = 0
        Top = 269
        Width = 485
        Height = 277
        Align = alClient
        BevelOuter = bvNone
        Caption = 'pnlCounseling'
        TabOrder = 1
        object grdCounseling: TStringGrid
          Left = 0
          Top = 0
          Width = 485
          Height = 277
          Align = alClient
          ColCount = 6
          FixedColor = clCream
          FixedCols = 0
          TabOrder = 0
          ColWidths = (
            64
            64
            64
            64
            64
            64)
        end
      end
      object pnlCtrl: TPanel
        Left = 0
        Top = 0
        Width = 485
        Height = 33
        Align = alTop
        BevelOuter = bvNone
        Color = clCream
        ParentBackground = False
        TabOrder = 2
        object lblPeriod: TLabel
          Left = 8
          Top = 6
          Width = 89
          Height = 21
          AutoSize = False
          Caption = 'Period'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Georgia'
          Font.Style = []
          ParentFont = False
          Layout = tlBottom
        end
        object lblBetween: TLabel
          Left = 323
          Top = 6
          Width = 17
          Height = 21
          AutoSize = False
          Caption = #65374
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Georgia'
          Font.Style = []
          ParentFont = False
          Layout = tlCenter
        end
        object btnReload: TSpeedButton
          Left = 456
          Top = 5
          Width = 23
          Height = 22
          Hint = 'Reload Billing and Counseling Info'
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
            0000FFEDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF07F6FF0000FF07FFFFFFFF
            FFFFA4A4A4A4A4FFFFFFFFFFFF07F6FF0000FF07FFFFFFFFFFA4FFFFFFFFFFA4
            FFFFFFFFFF07F6FF0000FF07FFFFFFFFA4FFFFFFFFFFFFFFA4FFFFFFFF07F6FF
            0000FF07FFFFA4A4FFFFFFFFFFFFFFFFFFA4FFFFFF07F6FF0000FF07FFFFA4A4
            A4A4FFFFFFFFFFFFFFFFFFFFFF07F6FF0000FF07FFFFA4A4A4FFFFFFFFFFFFFF
            FFFFA4FFFF07F6FF0000FF07FFFFA4A4FFFFFFFFFFFFFFFFFFA4A4FFFF07F6FF
            0000FF07FFFFA4FFFFFFFFFFFFFFFFFFA4A4A4FFFF07F6FF0000FF07FFFFFFFF
            FFFFFFFFFFFFFFA4A4A4A4FFFF07F6FF0000FF07FFFFFFA4FFFFFFFFFFFFFFFF
            FFA4A4FFFF07F6FF0000FF07FFFFFFFFA4FFFFFFFFFFFFFFA4FFFFFFFF07F6FF
            0000FF07FFFFFFFFFFA4FFFFFFFFFFA4FFFFFFFFFF07F6FF0000FF07FFFFFFFF
            FFFFA4A4A4A4A4FFFFFFFFFFFF07F6FF0000FF07FFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFF07F6FF0000FFEDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF6FFF5F6FF
            0000FF08E308070707070707070707070707080809ECFFFF0000FFFFFFF6F6F6
            F6F6F6F6F6F6F6F6F6F6F6F6F6FFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFF0000}
          ParentShowHint = False
          ShowHint = True
          OnClick = btnReloadClick
        end
        object cmbPeriod: TComboBox
          Left = 95
          Top = 5
          Width = 104
          Height = 22
          Style = csOwnerDrawFixed
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Georgia'
          Font.Style = []
          ItemIndex = 0
          ParentFont = False
          TabOrder = 0
          Text = 'All'
          OnChange = cmbPeriodChange
          Items.Strings = (
            'All'
            'This Month'
            'Last Month'
            '2 Months Ago')
        end
        object edtFirstDate: TDateTimePicker
          Left = 221
          Top = 5
          Width = 95
          Height = 22
          Date = 41455.633558726860000000
          Time = 41455.633558726860000000
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Georgia'
          Font.Style = []
          ParentFont = False
          TabOrder = 1
        end
        object edtLastDate: TDateTimePicker
          Left = 346
          Top = 5
          Width = 95
          Height = 22
          Date = 41455.633558726860000000
          Time = 41455.633558726860000000
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Georgia'
          Font.Style = []
          ParentFont = False
          TabOrder = 2
        end
      end
    end
  end
end
