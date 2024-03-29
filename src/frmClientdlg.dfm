inherited frmClientCarteDlg: TfrmClientCarteDlg
  Caption = 'Client'
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
    BevelOuter = bvNone
    ExplicitWidth = 1158
    ExplicitHeight = 595
    inherited pnlTitle: TPanel
      Left = 0
      Top = 0
      Width = 1158
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 1158
      inherited Image1: TImage
        Width = 1156
        ExplicitWidth = 589
      end
      inherited lblTitle: TPanel
        Left = 1
        Top = 1
        Width = 1156
        Height = 25
        Align = alClient
        ExplicitLeft = 1
        ExplicitTop = 1
        ExplicitWidth = 1156
        ExplicitHeight = 25
        object btnOK: TButton
          Left = 12
          Top = 1
          Width = 75
          Height = 24
          Caption = 'btnOK'
          TabOrder = 0
          OnClick = btnOKClick
        end
      end
    end
    object ScrollBox1: TScrollBox
      Left = 0
      Top = 27
      Width = 1158
      Height = 568
      VertScrollBar.Range = 400
      VertScrollBar.Size = 400
      Align = alClient
      AutoScroll = False
      BevelOuter = bvNone
      TabOrder = 1
      object Splitter2: TSplitter
        Left = 0
        Top = 276
        Width = 1154
        Height = 3
        Cursor = crVSplit
        Align = alTop
        ExplicitWidth = 288
      end
      object pnlUpper: TPanel
        Left = 0
        Top = 0
        Width = 1154
        Height = 276
        Align = alTop
        BevelOuter = bvNone
        Caption = 'pnlUpper'
        Color = clCream
        ParentBackground = False
        TabOrder = 0
        object Splitter1: TSplitter
          Left = 587
          Top = 0
          Height = 276
          OnMoved = Splitter1Moved
          ExplicitLeft = 588
        end
        object pnlUpperGrid: TPanel
          Left = 590
          Top = 0
          Width = 564
          Height = 276
          Align = alClient
          BevelOuter = bvNone
          Caption = 'pnlUpperGrid'
          TabOrder = 0
          object grdSchool: TStringGrid
            Left = 0
            Top = 24
            Width = 564
            Height = 252
            Align = alClient
            ColCount = 3
            FixedCols = 0
            Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goColSizing]
            TabOrder = 0
            OnClick = grdSchoolClick
          end
          object pnlSchoolTitle: TPanel
            Left = 0
            Top = 0
            Width = 564
            Height = 24
            Align = alTop
            TabOrder = 1
            object lblSchoolTitle: TLabel
              AlignWithMargins = True
              Left = 4
              Top = 4
              Width = 107
              Height = 16
              Align = alLeft
              AutoSize = False
              Caption = 'Applying School'
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Georgia'
              Font.Style = []
              ParentFont = False
              Layout = tlCenter
              ExplicitLeft = 1
              ExplicitTop = 1
              ExplicitHeight = 22
            end
            object btnSAdd: TSpeedButton
              Left = 114
              Top = 1
              Width = 41
              Height = 22
              Align = alLeft
              Caption = 'Add'
              Transparent = False
              OnClick = btnSAddClick
            end
            object btnSDelete: TSpeedButton
              Left = 155
              Top = 1
              Width = 41
              Height = 22
              Align = alLeft
              Caption = 'Delete'
              OnClick = btnSDeleteClick
              ExplicitLeft = 141
            end
          end
        end
        object ScrollBox2: TScrollBox
          Left = 0
          Top = 0
          Width = 587
          Height = 276
          VertScrollBar.Range = 427
          VertScrollBar.Size = 427
          Align = alLeft
          AutoScroll = False
          BevelInner = bvNone
          BevelOuter = bvNone
          TabOrder = 1
          object pnlBasic: TPanel
            Left = 0
            Top = 0
            Width = 566
            Height = 427
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
              Color = clCream
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Georgia'
              Font.Style = []
              ParentColor = False
              ParentFont = False
              Transparent = False
              Layout = tlBottom
            end
            object lblLastName: TLabel
              Left = 286
              Top = 13
              Width = 95
              Height = 21
              AutoSize = False
              Caption = 'Last Name'
              Color = clCream
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Georgia'
              Font.Style = []
              ParentColor = False
              ParentFont = False
              Transparent = False
              Layout = tlBottom
            end
            object lblEmail: TLabel
              Left = 8
              Top = 67
              Width = 95
              Height = 21
              AutoSize = False
              Caption = 'Email Address'
              Color = clCream
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Georgia'
              Font.Style = []
              ParentColor = False
              ParentFont = False
              Transparent = False
              Layout = tlBottom
            end
            object lblSponsored: TLabel
              Left = 8
              Top = 94
              Width = 95
              Height = 21
              AutoSize = False
              Caption = 'Sponsored'
              Color = clCream
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Georgia'
              Font.Style = []
              ParentColor = False
              ParentFont = False
              Transparent = False
              Layout = tlBottom
            end
            object lblUniversityName: TLabel
              Left = 8
              Top = 121
              Width = 95
              Height = 21
              AutoSize = False
              Caption = 'University'
              Color = clCream
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Georgia'
              Font.Style = []
              ParentColor = False
              ParentFont = False
              Transparent = False
              Layout = tlBottom
            end
            object lblDegree: TLabel
              Left = 8
              Top = 148
              Width = 95
              Height = 21
              AutoSize = False
              Caption = 'Degree'
              Color = clCream
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Georgia'
              Font.Style = []
              ParentColor = False
              ParentFont = False
              Transparent = False
              Layout = tlBottom
            end
            object lblMajor: TLabel
              Left = 286
              Top = 148
              Width = 95
              Height = 21
              AutoSize = False
              Caption = 'Major'
              Color = clCream
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Georgia'
              Font.Style = []
              ParentColor = False
              ParentFont = False
              Transparent = False
              Layout = tlBottom
            end
            object lblGPA: TLabel
              Left = 286
              Top = 121
              Width = 95
              Height = 21
              AutoSize = False
              Caption = 'GPA'
              Color = clCream
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Georgia'
              Font.Style = []
              ParentColor = False
              ParentFont = False
              Transparent = False
              Layout = tlBottom
            end
            object lblAcademicAward: TLabel
              Left = 8
              Top = 175
              Width = 95
              Height = 21
              AutoSize = False
              Caption = 'Academic'
              Color = clCream
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Georgia'
              Font.Style = []
              ParentColor = False
              ParentFont = False
              Transparent = False
              Layout = tlBottom
            end
            object lblPublication: TLabel
              Left = 286
              Top = 175
              Width = 95
              Height = 21
              AutoSize = False
              Caption = 'Publication'
              Color = clCream
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Georgia'
              Font.Style = []
              ParentColor = False
              ParentFont = False
              Transparent = False
              Layout = tlBottom
            end
            object lblStudyAbroad: TLabel
              Left = 8
              Top = 202
              Width = 95
              Height = 21
              AutoSize = False
              Caption = 'Study Abroad'
              Color = clCream
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Georgia'
              Font.Style = []
              ParentColor = False
              ParentFont = False
              Transparent = False
              Layout = tlBottom
            end
            object lblPlace: TLabel
              Left = 286
              Top = 202
              Width = 95
              Height = 21
              AutoSize = False
              Caption = 'Place'
              Color = clCream
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Georgia'
              Font.Style = []
              ParentColor = False
              ParentFont = False
              Transparent = False
              Layout = tlBottom
            end
            object lblWorkPlace: TLabel
              Left = 8
              Top = 229
              Width = 95
              Height = 21
              AutoSize = False
              Caption = 'Work Place'
              Color = clCream
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Georgia'
              Font.Style = []
              ParentColor = False
              ParentFont = False
              Transparent = False
              Layout = tlBottom
            end
            object lblUseEnglish: TLabel
              Left = 286
              Top = 229
              Width = 95
              Height = 21
              AutoSize = False
              Caption = 'Use English'
              Color = clCream
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Georgia'
              Font.Style = []
              ParentColor = False
              ParentFont = False
              Transparent = False
              Layout = tlBottom
            end
            object lblFutureGoal: TLabel
              Left = 8
              Top = 256
              Width = 95
              Height = 21
              AutoSize = False
              Caption = 'Future Goal'
              Color = clCream
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Georgia'
              Font.Style = []
              ParentColor = False
              ParentFont = False
              Transparent = False
              Layout = tlBottom
            end
            object lblClientMemo: TLabel
              Left = 9
              Top = 283
              Width = 95
              Height = 21
              AutoSize = False
              Caption = 'Client'
              Color = clCream
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Georgia'
              Font.Style = []
              ParentColor = False
              ParentFont = False
              Transparent = False
              Layout = tlBottom
            end
            object lblCounselorMemo: TLabel
              Left = 9
              Top = 352
              Width = 95
              Height = 21
              AutoSize = False
              Caption = 'Counselor'
              Color = clCream
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Georgia'
              Font.Style = []
              ParentColor = False
              ParentFont = False
              Transparent = False
              Layout = tlBottom
            end
            object lblKnjiF: TLabel
              Left = 8
              Top = 40
              Width = 95
              Height = 21
              AutoSize = False
              Caption = 'Kanji First'
              Color = clCream
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Georgia'
              Font.Style = []
              ParentColor = False
              ParentFont = False
              Transparent = False
              Layout = tlBottom
            end
            object lblKanjiL: TLabel
              Left = 286
              Top = 40
              Width = 95
              Height = 21
              AutoSize = False
              Caption = 'Kanji Last'
              Color = clCream
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Georgia'
              Font.Style = []
              ParentColor = False
              ParentFont = False
              Transparent = False
              Layout = tlBottom
            end
            object lblGender: TLabel
              Left = 286
              Top = 94
              Width = 95
              Height = 21
              AutoSize = False
              Caption = 'Gender'
              Color = clCream
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Georgia'
              Font.Style = []
              ParentColor = False
              ParentFont = False
              Transparent = False
              Layout = tlBottom
            end
            object edtFirstName: TEdit
              Left = 103
              Top = 13
              Width = 166
              Height = 21
              MaxLength = 45
              TabOrder = 0
            end
            object edtLastName: TEdit
              Left = 381
              Top = 13
              Width = 166
              Height = 21
              MaxLength = 45
              TabOrder = 1
            end
            object edtEmail: TEdit
              Left = 103
              Top = 67
              Width = 444
              Height = 21
              MaxLength = 45
              TabOrder = 4
            end
            object cmbSponsored: TComboBox
              Left = 104
              Top = 94
              Width = 83
              Height = 22
              Style = csOwnerDrawFixed
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Georgia'
              Font.Style = []
              ItemIndex = 1
              ParentFont = False
              TabOrder = 5
              Text = 'Private'
              Items.Strings = (
                'Corporate'
                'Private')
            end
            object edtUniversityName: TEdit
              Left = 104
              Top = 121
              Width = 165
              Height = 21
              MaxLength = 200
              TabOrder = 7
            end
            object edtDegree: TEdit
              Left = 104
              Top = 148
              Width = 165
              Height = 21
              MaxLength = 45
              TabOrder = 9
            end
            object edtMajor: TEdit
              Left = 382
              Top = 148
              Width = 165
              Height = 21
              MaxLength = 45
              TabOrder = 10
            end
            object edtGPA: TEdit
              Left = 382
              Top = 121
              Width = 165
              Height = 21
              TabOrder = 8
              Text = '0'
            end
            object cmbAcademicAward: TComboBox
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
              ItemIndex = 1
              ParentFont = False
              TabOrder = 11
              Text = 'No'
              Items.Strings = (
                'Yes'
                'No')
            end
            object cmbPublication: TComboBox
              Left = 381
              Top = 175
              Width = 83
              Height = 22
              Style = csOwnerDrawFixed
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Georgia'
              Font.Style = []
              ItemIndex = 1
              ParentFont = False
              TabOrder = 12
              Text = 'No'
              Items.Strings = (
                'Yes'
                'No')
            end
            object cmbStudyAbroad: TComboBox
              Left = 104
              Top = 202
              Width = 83
              Height = 22
              Style = csOwnerDrawFixed
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Georgia'
              Font.Style = []
              ItemIndex = 1
              ParentFont = False
              TabOrder = 13
              Text = 'No'
              Items.Strings = (
                'Yes'
                'No')
            end
            object edtPlace: TEdit
              Left = 382
              Top = 202
              Width = 165
              Height = 21
              MaxLength = 45
              TabOrder = 14
            end
            object edtWorkPlace: TEdit
              Left = 104
              Top = 229
              Width = 165
              Height = 21
              MaxLength = 1000
              TabOrder = 15
            end
            object cmbUseEnglish: TComboBox
              Left = 382
              Top = 229
              Width = 83
              Height = 22
              Style = csOwnerDrawFixed
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Georgia'
              Font.Style = []
              ItemIndex = 1
              ParentFont = False
              TabOrder = 16
              Text = 'No'
              Items.Strings = (
                'Yes'
                'No')
            end
            object edtFutureGoal: TEdit
              Left = 104
              Top = 256
              Width = 443
              Height = 21
              MaxLength = 2000
              TabOrder = 17
            end
            object edtDate: TDateTimePicker
              Left = 291
              Top = 120
              Width = 186
              Height = 21
              Date = 41455.633558726860000000
              Time = 41455.633558726860000000
              TabOrder = 20
              Visible = False
              OnExit = edtDateExit
            end
            object memoClientMemo: TRichEdit
              Left = 104
              Top = 283
              Width = 443
              Height = 63
              MaxLength = 4000
              ScrollBars = ssBoth
              TabOrder = 18
            end
            object memoCounselorMemo: TRichEdit
              Left = 104
              Top = 352
              Width = 443
              Height = 63
              MaxLength = 4000
              ScrollBars = ssBoth
              TabOrder = 19
            end
            object edtKanjiF: TEdit
              Left = 103
              Top = 40
              Width = 166
              Height = 21
              MaxLength = 50
              TabOrder = 2
            end
            object edtKanjiL: TEdit
              Left = 381
              Top = 40
              Width = 166
              Height = 21
              MaxLength = 50
              TabOrder = 3
            end
            object cmbGender: TComboBox
              Left = 382
              Top = 94
              Width = 83
              Height = 22
              Style = csOwnerDrawFixed
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Georgia'
              Font.Style = []
              ItemIndex = 0
              ParentFont = False
              TabOrder = 6
              Text = 'Male'
              Items.Strings = (
                'Male'
                'Female')
            end
          end
        end
      end
      object pnlLower: TPanel
        Left = 0
        Top = 279
        Width = 1154
        Height = 285
        Align = alClient
        BevelOuter = bvNone
        Caption = 'pnlLower'
        Color = clCream
        ParentBackground = False
        TabOrder = 1
        object Splitter3: TSplitter
          Left = 587
          Top = 0
          Height = 285
          OnMoved = Splitter3Moved
          ExplicitLeft = 576
          ExplicitTop = 40
          ExplicitHeight = 100
        end
        object pnlGMAT: TPanel
          Left = 0
          Top = 0
          Width = 587
          Height = 285
          Align = alLeft
          BevelOuter = bvNone
          Caption = 'pnlGMAT'
          TabOrder = 0
          object pnlGMATTitle: TPanel
            Left = 0
            Top = 0
            Width = 587
            Height = 24
            Align = alTop
            BevelOuter = bvNone
            TabOrder = 0
            object lblGMATTitle: TLabel
              AlignWithMargins = True
              Left = 3
              Top = 3
              Width = 107
              Height = 18
              Align = alLeft
              Alignment = taCenter
              AutoSize = False
              Caption = 'GMAT'
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Georgia'
              Font.Style = []
              ParentFont = False
              Layout = tlCenter
              ExplicitLeft = 1
              ExplicitTop = 1
              ExplicitHeight = 22
            end
            object btnGAdd: TSpeedButton
              Left = 113
              Top = 0
              Width = 41
              Height = 24
              Align = alLeft
              Caption = 'Add'
              Transparent = False
              OnClick = btnGAddClick
              ExplicitLeft = 114
              ExplicitTop = 1
              ExplicitHeight = 22
            end
            object btnGDelete: TSpeedButton
              Left = 154
              Top = 0
              Width = 41
              Height = 24
              Align = alLeft
              Caption = 'Delete'
              OnClick = btnGDeleteClick
              ExplicitLeft = 141
              ExplicitTop = 1
              ExplicitHeight = 22
            end
          end
          object grdGMAT: TStringGrid
            Left = 0
            Top = 24
            Width = 587
            Height = 261
            Align = alClient
            FixedCols = 0
            Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goEditing]
            TabOrder = 1
            OnClick = grdGMATClick
            RowHeights = (
              24
              24
              24
              24
              24)
          end
        end
        object pnlTOEFL: TPanel
          Left = 590
          Top = 0
          Width = 564
          Height = 285
          Align = alClient
          BevelOuter = bvNone
          Caption = 'pnlTOEFL'
          TabOrder = 1
          object pnlTOEFLTitle: TPanel
            Left = 0
            Top = 0
            Width = 564
            Height = 24
            Align = alTop
            BevelOuter = bvNone
            TabOrder = 0
            object lblTOEFLTitle: TLabel
              AlignWithMargins = True
              Left = 3
              Top = 3
              Width = 107
              Height = 18
              Align = alLeft
              Alignment = taCenter
              AutoSize = False
              Caption = 'TOEFL'
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Georgia'
              Font.Style = []
              ParentFont = False
              Layout = tlCenter
              ExplicitLeft = 1
              ExplicitTop = 1
              ExplicitHeight = 22
            end
            object SpeedButton1: TSpeedButton
              Left = 113
              Top = 0
              Width = 41
              Height = 24
              Align = alLeft
              Caption = 'Add'
              Transparent = False
              OnClick = SpeedButton1Click
              ExplicitLeft = 114
              ExplicitTop = 1
              ExplicitHeight = 22
            end
            object SpeedButton2: TSpeedButton
              Left = 154
              Top = 0
              Width = 41
              Height = 24
              Align = alLeft
              Caption = 'Delete'
              OnClick = SpeedButton2Click
              ExplicitLeft = 141
              ExplicitTop = 1
              ExplicitHeight = 22
            end
          end
          object grdTOEFL: TStringGrid
            Left = 0
            Top = 24
            Width = 564
            Height = 261
            Align = alClient
            ColCount = 8
            FixedCols = 0
            RowCount = 2
            Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goEditing]
            TabOrder = 1
            OnClick = grdTOEFLClick
          end
        end
      end
    end
  end
  inherited SQLQuery1: TSQLQuery
    Left = 465
    Top = 65535
  end
  object ApplicationEvents1: TApplicationEvents
    OnMessage = ApplicationEvents1Message
    Left = 441
    Top = 1
  end
end
