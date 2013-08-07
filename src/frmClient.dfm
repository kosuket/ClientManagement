inherited Clientframe: TClientframe
  Caption = 'Clientframe'
  ClientHeight = 595
  ClientWidth = 1158
  Position = poScreenCenter
  ExplicitWidth = 1174
  ExplicitHeight = 633
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlBase: TPanel
    Width = 1158
    Height = 595
    ExplicitWidth = 1158
    ExplicitHeight = 595
    inherited Splitter1: TSplitter
      Top = 185
      Width = 1158
      ExplicitTop = 171
      ExplicitWidth = 1158
    end
    inherited Panel2: TPanel
      Top = 188
      Width = 1158
      Height = 407
      ExplicitTop = 188
      ExplicitWidth = 1158
      ExplicitHeight = 407
      inherited DBGrid1: TDBGrid
        Width = 1158
        Height = 407
        Ctl3D = False
        FixedColor = 14221016
        ParentCtl3D = False
        PopupMenu = pmGrid
        OnDblClick = DBGrid1DblClick
      end
    end
    inherited pnlCondition: TPanel
      Width = 1158
      Height = 185
      ExplicitWidth = 1158
      ExplicitHeight = 185
      inherited pnlCondBar: TPanel
        Top = 150
        Width = 1158
        ExplicitTop = 150
        ExplicitWidth = 1158
        inherited Image1: TImage
          Width = 1158
          ExplicitWidth = 1158
        end
        inherited btnLoad: TButton
          Left = 12
          Top = 5
          Width = 75
          Height = 25
          Anchors = [akLeft, akBottom]
          ExplicitLeft = 12
          ExplicitTop = 5
          ExplicitWidth = 75
          ExplicitHeight = 25
        end
        object btnMail: TButton
          Left = 1062
          Top = 5
          Width = 75
          Height = 25
          Anchors = [akRight, akBottom]
          Caption = 'Mail All'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Georgia'
          Font.Style = []
          ParentFont = False
          TabOrder = 1
          OnClick = btnMailClick
        end
      end
      inherited Panel1: TPanel
        Width = 1158
        TabOrder = 2
        ExplicitWidth = 1158
        DesignSize = (
          1158
          24)
        inherited Image2: TImage
          Width = 1158
          ExplicitLeft = 0
          ExplicitTop = 0
          ExplicitWidth = 1158
          ExplicitHeight = 23
        end
        object btnAdd: TSpeedButton
          Left = 0
          Top = 0
          Width = 24
          Height = 22
          Hint = 'Register New Client'
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
            FFFF07A4A4A407FFFFFFFFFFFF07F6FF0000FF07FFFFFFFFFFFFA4070707A4FF
            FFFFFFFFFF07F6FF0000FF07FFFFFFFFFFFFA4FFFFFFA4FFFFFFFFFFFF07F6FF
            0000FF07FFFFF6FFFF07A4FFFFFFA407FFFFFFFFFF07F6FF0000FF07FFFF07A4
            A4A400FFFFFF00A4A4A407FFFF07F6FF0000FF07FFFFA407FFFFFFFFFFFFFFFF
            FF07A4FFFF07F6FF0000FF07FFFFA407FFFFFFFFFFFFFFFFFF07A4FFFF07F6FF
            0000FF07FFFFA407FFFFFFFFFFFFFFFFFF07A4FFFF07F6FF0000FF07FFFF07A4
            A4A400FFFFFF00A4A4A407FFFF07F6FF0000FF07FFFFFFFFFF07A4FFFFFFA407
            FFFFFFFFFF07F6FF0000FF07FFFFFFFFFFFFA4FFFFFFA4FFFFFFFFFFFF07F6FF
            0000FF07FFFFFFFFFFFFA4070707A4FFFFFFFFFFFF07F6FF0000FF07FFFFFFFF
            FFFF07A4A4A407FFFFFFFFFFFF07F6FF0000FF07FFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFF07F6FF0000FFEDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF6FFF5F6FF
            0000FF08E308070707070707070707070707080809ECFFFF0000FFFFFFF6F6F6
            F6F6F6F6F6F6F6F6F6F6F6F6F6FFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFF0000}
          Layout = blGlyphBottom
          ParentShowHint = False
          ShowHint = True
          OnClick = btnAddClick
        end
        object btnClear: TSpeedButton
          Left = 1121
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
      object pgctrlCond: TPageControl
        Left = 0
        Top = 24
        Width = 1158
        Height = 126
        ActivePage = tbSchoolScore
        Align = alClient
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Georgia'
        Font.Style = []
        ParentFont = False
        Style = tsFlatButtons
        TabOrder = 1
        object tbSchoolScore: TTabSheet
          Caption = 'Schools and Scores'
          ImageIndex = 1
          object pnlSchoolScore: TPanel
            Left = 0
            Top = 0
            Width = 1150
            Height = 94
            Align = alClient
            BevelOuter = bvNone
            Color = clCream
            ParentBackground = False
            TabOrder = 0
            object lblSchool: TLabel
              Left = 8
              Top = 13
              Width = 89
              Height = 21
              AutoSize = False
              Caption = 'School Name'
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Georgia'
              Font.Style = []
              ParentFont = False
              Layout = tlBottom
            end
            object lblRound: TLabel
              Left = 354
              Top = 13
              Width = 88
              Height = 21
              AutoSize = False
              Caption = 'Apply Round'
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Georgia'
              Font.Style = []
              ParentFont = False
              Layout = tlCenter
            end
            object lblGMAT: TLabel
              Left = 8
              Top = 38
              Width = 89
              Height = 21
              AutoSize = False
              Caption = 'GMAT Score'
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Georgia'
              Font.Style = []
              ParentFont = False
              Layout = tlBottom
            end
            object lblTOEFL: TLabel
              Left = 8
              Top = 64
              Width = 89
              Height = 21
              AutoSize = False
              Caption = 'TOEFL Score'
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Georgia'
              Font.Style = []
              ParentFont = False
              Layout = tlBottom
            end
            object cmbSchoolName: TComboBox
              Left = 103
              Top = 12
              Width = 236
              Height = 22
              Style = csOwnerDrawFixed
              TabOrder = 0
            end
            object cmbRound: TComboBox
              Left = 449
              Top = 12
              Width = 72
              Height = 22
              Style = csOwnerDrawFixed
              TabOrder = 1
              Items.Strings = (
                'All'
                '1st'
                '2nd'
                '3rd'
                '4th')
            end
            object edtGMATScore: TSpinEdit
              Left = 103
              Top = 38
              Width = 79
              Height = 23
              Increment = 10
              MaxLength = 3
              MaxValue = 800
              MinValue = 0
              TabOrder = 2
              Value = 700
            end
            object cmbGMATCond: TComboBox
              Left = 197
              Top = 38
              Width = 167
              Height = 22
              Style = csOwnerDrawFixed
              TabOrder = 3
              Items.Strings = (
                'N/A'
                'Or Lower(Includes Non-taken)'
                'Or Lower(Excludes Non-taken)'
                'Or Higher(Includes Non-taken)'
                'Or Higher(Excludes Non-taken)')
            end
            object edtTOEFLScore: TSpinEdit
              Left = 103
              Top = 64
              Width = 79
              Height = 23
              MaxLength = 3
              MaxValue = 800
              MinValue = 0
              TabOrder = 4
              Value = 100
            end
            object cmbTOEFLCond: TComboBox
              Left = 197
              Top = 64
              Width = 167
              Height = 22
              Style = csOwnerDrawFixed
              TabOrder = 5
              Items.Strings = (
                'N/A'
                'Or Lower(Includes Non-taken)'
                'Or Lower(Excludes Non-taken)'
                'Or Higher(Includes Non-taken)'
                'Or Higher(Excludes Non-taken)')
            end
            object Memo1: TMemo
              Left = 366
              Top = 38
              Width = 185
              Height = 89
              ScrollBars = ssBoth
              TabOrder = 6
            end
          end
        end
        object tbBasic: TTabSheet
          Caption = 'Basic Info'
          object ScrollBox1: TScrollBox
            Left = 0
            Top = 0
            Width = 1150
            Height = 94
            VertScrollBar.Color = 13627640
            VertScrollBar.ParentColor = False
            VertScrollBar.Range = 256
            VertScrollBar.Smooth = True
            VertScrollBar.Size = 100
            VertScrollBar.Style = ssFlat
            VertScrollBar.Tracking = True
            Align = alClient
            AutoScroll = False
            BevelInner = bvNone
            BevelOuter = bvNone
            BorderStyle = bsNone
            TabOrder = 0
            object pnlBasic: TPanel
              Left = 0
              Top = 0
              Width = 1133
              Height = 256
              Align = alClient
              BevelOuter = bvNone
              Color = clCream
              ParentBackground = False
              TabOrder = 0
              object lblFirstName: TLabel
                Left = 8
                Top = 13
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
                Left = 302
                Top = 13
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
              object lblEmail: TLabel
                Left = 8
                Top = 40
                Width = 95
                Height = 21
                AutoSize = False
                Caption = 'Email Address'
                Font.Charset = ANSI_CHARSET
                Font.Color = clWindowText
                Font.Height = -13
                Font.Name = 'Georgia'
                Font.Style = []
                ParentFont = False
                Layout = tlBottom
              end
              object lblSponsored: TLabel
                Left = 8
                Top = 67
                Width = 95
                Height = 21
                AutoSize = False
                Caption = 'Sponsored'
                Font.Charset = ANSI_CHARSET
                Font.Color = clWindowText
                Font.Height = -13
                Font.Name = 'Georgia'
                Font.Style = []
                ParentFont = False
                Layout = tlBottom
              end
              object lblUniversityName: TLabel
                Left = 8
                Top = 94
                Width = 95
                Height = 21
                AutoSize = False
                Caption = 'University'
                Font.Charset = ANSI_CHARSET
                Font.Color = clWindowText
                Font.Height = -13
                Font.Name = 'Georgia'
                Font.Style = []
                ParentFont = False
                Layout = tlBottom
              end
              object lblDegree: TLabel
                Left = 8
                Top = 121
                Width = 95
                Height = 21
                AutoSize = False
                Caption = 'Degree'
                Font.Charset = ANSI_CHARSET
                Font.Color = clWindowText
                Font.Height = -13
                Font.Name = 'Georgia'
                Font.Style = []
                ParentFont = False
                Layout = tlBottom
              end
              object lblMajor: TLabel
                Left = 302
                Top = 121
                Width = 95
                Height = 21
                AutoSize = False
                Caption = 'Major'
                Font.Charset = ANSI_CHARSET
                Font.Color = clWindowText
                Font.Height = -13
                Font.Name = 'Georgia'
                Font.Style = []
                ParentFont = False
                Layout = tlBottom
              end
              object lblGPA: TLabel
                Left = 302
                Top = 94
                Width = 95
                Height = 21
                AutoSize = False
                Caption = 'GPA'
                Font.Charset = ANSI_CHARSET
                Font.Color = clWindowText
                Font.Height = -13
                Font.Name = 'Georgia'
                Font.Style = []
                ParentFont = False
                Layout = tlBottom
              end
              object lblAcademicAward: TLabel
                Left = 8
                Top = 148
                Width = 95
                Height = 21
                AutoSize = False
                Caption = 'Academic'
                Font.Charset = ANSI_CHARSET
                Font.Color = clWindowText
                Font.Height = -13
                Font.Name = 'Georgia'
                Font.Style = []
                ParentFont = False
                Layout = tlBottom
              end
              object lblPublication: TLabel
                Left = 302
                Top = 148
                Width = 95
                Height = 21
                AutoSize = False
                Caption = 'Publication'
                Font.Charset = ANSI_CHARSET
                Font.Color = clWindowText
                Font.Height = -13
                Font.Name = 'Georgia'
                Font.Style = []
                ParentFont = False
                Layout = tlBottom
              end
              object lblStudyAbroad: TLabel
                Left = 8
                Top = 175
                Width = 95
                Height = 21
                AutoSize = False
                Caption = 'Study Abroad'
                Font.Charset = ANSI_CHARSET
                Font.Color = clWindowText
                Font.Height = -13
                Font.Name = 'Georgia'
                Font.Style = []
                ParentFont = False
                Layout = tlBottom
              end
              object lblPlace: TLabel
                Left = 302
                Top = 175
                Width = 95
                Height = 21
                AutoSize = False
                Caption = 'Place'
                Font.Charset = ANSI_CHARSET
                Font.Color = clWindowText
                Font.Height = -13
                Font.Name = 'Georgia'
                Font.Style = []
                ParentFont = False
                Layout = tlBottom
              end
              object lblWorkPlace: TLabel
                Left = 8
                Top = 202
                Width = 95
                Height = 21
                AutoSize = False
                Caption = 'Work Place'
                Font.Charset = ANSI_CHARSET
                Font.Color = clWindowText
                Font.Height = -13
                Font.Name = 'Georgia'
                Font.Style = []
                ParentFont = False
                Layout = tlBottom
              end
              object lblUseEnglish: TLabel
                Left = 302
                Top = 202
                Width = 95
                Height = 21
                AutoSize = False
                Caption = 'Use English'
                Font.Charset = ANSI_CHARSET
                Font.Color = clWindowText
                Font.Height = -13
                Font.Name = 'Georgia'
                Font.Style = []
                ParentFont = False
                Layout = tlBottom
              end
              object lblFutureGoal: TLabel
                Left = 8
                Top = 229
                Width = 95
                Height = 21
                AutoSize = False
                Caption = 'Future Goal'
                Font.Charset = ANSI_CHARSET
                Font.Color = clWindowText
                Font.Height = -13
                Font.Name = 'Georgia'
                Font.Style = []
                ParentFont = False
                Layout = tlBottom
              end
              object edtFirstName: TEdit
                Left = 103
                Top = 13
                Width = 182
                Height = 22
                TabOrder = 0
              end
              object edtLastName: TEdit
                Left = 397
                Top = 13
                Width = 182
                Height = 22
                TabOrder = 1
              end
              object edtEmail: TEdit
                Left = 103
                Top = 40
                Width = 476
                Height = 22
                TabOrder = 2
              end
              object cmbSponsored: TComboBox
                Left = 104
                Top = 67
                Width = 83
                Height = 22
                Style = csOwnerDrawFixed
                Font.Charset = ANSI_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Georgia'
                Font.Style = []
                ParentFont = False
                TabOrder = 3
                Items.Strings = (
                  'All'
                  'Corporate'
                  'Private')
              end
              object edtUniversityName: TEdit
                Left = 104
                Top = 94
                Width = 181
                Height = 22
                TabOrder = 4
              end
              object edtDegree: TEdit
                Left = 104
                Top = 121
                Width = 181
                Height = 22
                TabOrder = 5
              end
              object edtMajor: TEdit
                Left = 398
                Top = 121
                Width = 181
                Height = 22
                TabOrder = 6
              end
              object edtGPA: TEdit
                Left = 398
                Top = 94
                Width = 181
                Height = 22
                TabOrder = 7
              end
              object cmbAcademicAward: TComboBox
                Left = 104
                Top = 148
                Width = 83
                Height = 22
                Style = csOwnerDrawFixed
                Font.Charset = ANSI_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Georgia'
                Font.Style = []
                ParentFont = False
                TabOrder = 8
                Items.Strings = (
                  'All'
                  'Yes'
                  'No')
              end
              object cmbPublication: TComboBox
                Left = 397
                Top = 148
                Width = 83
                Height = 22
                Style = csOwnerDrawFixed
                Font.Charset = ANSI_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Georgia'
                Font.Style = []
                ParentFont = False
                TabOrder = 9
                Items.Strings = (
                  'All'
                  'Yes'
                  'No')
              end
              object cmbStudyAbroad: TComboBox
                Left = 104
                Top = 175
                Width = 83
                Height = 22
                Style = csOwnerDrawFixed
                Font.Charset = ANSI_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Georgia'
                Font.Style = []
                ParentFont = False
                TabOrder = 10
                Items.Strings = (
                  'All'
                  'Yes'
                  'No')
              end
              object edtPlace: TEdit
                Left = 398
                Top = 175
                Width = 181
                Height = 22
                TabOrder = 11
              end
              object edtWorkPlace: TEdit
                Left = 104
                Top = 202
                Width = 181
                Height = 22
                TabOrder = 12
              end
              object cmbUseEnglish: TComboBox
                Left = 398
                Top = 202
                Width = 83
                Height = 22
                Style = csOwnerDrawFixed
                Font.Charset = ANSI_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Georgia'
                Font.Style = []
                ParentFont = False
                TabOrder = 13
                Items.Strings = (
                  'All'
                  'Yes'
                  'No')
              end
              object edtFutureGoal: TEdit
                Left = 104
                Top = 229
                Width = 475
                Height = 22
                TabOrder = 14
              end
            end
          end
        end
      end
    end
  end
  object pmGrid: TPopupMenu
    OnPopup = pmGridPopup
    Left = 392
    Top = 270
    object pmDetail: TMenuItem
      Caption = 'View Detail'
      OnClick = pmDetailClick
    end
    object pmMail: TMenuItem
      Caption = 'Send Mail'
      OnClick = pmMailClick
    end
  end
end
