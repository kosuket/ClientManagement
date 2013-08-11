inherited Receiptframe: TReceiptframe
  Caption = 'Receiptframe'
  ExplicitWidth = 767
  ExplicitHeight = 477
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlBase: TPanel
    inherited Splitter1: TSplitter
      Top = 201
      ExplicitTop = 169
    end
    inherited Panel2: TPanel
      Top = 204
      Height = 235
      ExplicitTop = 204
      ExplicitHeight = 235
      inherited DBGrid1: TDBGrid
        Height = 235
        OnDblClick = DBGrid1DblClick
      end
    end
    inherited pnlCondition: TPanel
      Height = 201
      ExplicitHeight = 201
      inherited pnlCondBar: TPanel
        Top = 166
        ExplicitTop = 166
      end
      inherited Panel1: TPanel
        object btnClear: TSpeedButton
          Left = 714
          Top = 0
          Width = 24
          Height = 22
          Hint = 'Clear Search Condition'
          Anchors = [akTop, akRight]
          Flat = True
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
            FFFFFFFFFFFFFFFFFFFFFFFFFF07F6FF0000FF07FFFFFFFFFFFFA4A4A4A4A407
            FFFFFFFFFF07F6FF0000FF07FFFFFFFFFFA40707070707A407FFFFFFFF07F6FF
            0000FF07FFFFFFA4A40707FFFFFFFF07A4FFFFFFFF07F6FF0000FF07FFFF07A4
            0707FFFFFFFFFFFFA4FFFFFFFF07F6FF0000FF07FF07A4A4A4FFFFFFFFFFFFFF
            FFFFFFFFFF07F6FF0000FF07FF07A4A407FFFFFFFFFFFFFFFFFFFFFFFF07F6FF
            0000FF07FF0707A407FFFFFFFFFFFFFFFFFFFFFFFF07F6FF0000FF07FF07A4A4
            A4FFFFFFFFFFFFFFA4FFFFFFFF07F6FF0000FF07FFFF07A40707FFFFFFFFFFFF
            A4FFFFFFFF07F6FF0000FF07FFFFFFA4070707FFFFFFFF07A4FFFFFFFF07F6FF
            0000FF07FFFFFFFFA4A40707070707A4A4FFFFFFFF07F6FF0000FF07FFFFFFFF
            FFFFA4A4A4A4A407A4FFFFFFFF07F6FF0000FF07FFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFF07F6FF0000FFEDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF6FFF5F6FF
            0000FF08E308070707070707070707070707080809ECFFFF0000FFFFFFF6F6F6
            F6F6F6F6F6F6F6F6F6F6F6F6F6FFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFF0000}
          Layout = blGlyphBottom
          ParentShowHint = False
          ShowHint = True
          OnClick = btnClearClick
        end
      end
      object pnlAccounting: TPanel
        Left = 0
        Top = 24
        Width = 751
        Height = 142
        Align = alClient
        BevelOuter = bvNone
        Color = clCream
        DockSite = True
        ParentBackground = False
        TabOrder = 2
        object lblStartDate: TLabel
          Left = 8
          Top = 13
          Width = 89
          Height = 21
          AutoSize = False
          Caption = 'START DATE'
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
          Top = 12
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
        object lblFirstName: TLabel
          Left = 8
          Top = 77
          Width = 95
          Height = 21
          AutoSize = False
          Caption = 'First Name'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Georgia'
          Font.Style = []
          ParentFont = False
          Layout = tlBottom
        end
        object lblLastName: TLabel
          Left = 221
          Top = 77
          Width = 95
          Height = 21
          AutoSize = False
          Caption = 'Last Name'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Georgia'
          Font.Style = []
          ParentFont = False
          Layout = tlBottom
        end
        object lblEndDate: TLabel
          Left = 8
          Top = 45
          Width = 89
          Height = 21
          AutoSize = False
          Caption = 'END DATE'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Georgia'
          Font.Style = []
          ParentFont = False
          Layout = tlBottom
        end
        object Label2: TLabel
          Left = 323
          Top = 44
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
        object cmbStartDate: TComboBox
          Left = 95
          Top = 12
          Width = 104
          Height = 22
          Style = csOwnerDrawFixed
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Georgia'
          Font.Style = []
          ItemIndex = 1
          ParentFont = False
          TabOrder = 0
          Text = 'This Month'
          OnChange = cmbStartDateChange
          Items.Strings = (
            'All'
            'This Month'
            'Last Month'
            '2 Months Ago')
        end
        object edtFirstStartDate: TDateTimePicker
          Left = 221
          Top = 13
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
        object edtLastStartDate: TDateTimePicker
          Left = 346
          Top = 13
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
        object edtFirstName: TEdit
          Left = 95
          Top = 77
          Width = 104
          Height = 22
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Georgia'
          Font.Style = []
          ParentFont = False
          TabOrder = 6
        end
        object edtLastName: TEdit
          Left = 316
          Top = 77
          Width = 125
          Height = 22
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Georgia'
          Font.Style = []
          ParentFont = False
          TabOrder = 7
        end
        object cmbEndDate: TComboBox
          Left = 95
          Top = 44
          Width = 104
          Height = 22
          Style = csOwnerDrawFixed
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Georgia'
          Font.Style = []
          ItemIndex = 1
          ParentFont = False
          TabOrder = 3
          Text = 'This Month'
          OnChange = cmbEndDateChange
          Items.Strings = (
            'All'
            'This Month'
            'Last Month'
            '2 Months Ago')
        end
        object edtFirstEndDate: TDateTimePicker
          Left = 221
          Top = 45
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
          TabOrder = 4
        end
        object edtLastEndDate: TDateTimePicker
          Left = 346
          Top = 45
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
          TabOrder = 5
        end
        object chkReceived: TCheckBox
          Left = 7
          Top = 110
          Width = 173
          Height = 17
          Caption = 'Show Received Invoices'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Georgia'
          Font.Style = []
          ParentFont = False
          TabOrder = 8
        end
      end
    end
  end
end
