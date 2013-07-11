inherited frmClientCarteDlg: TfrmClientCarteDlg
  Caption = 'frmClientCarteDlg'
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
    ExplicitLeft = 0
    ExplicitTop = 0
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
        object pnlBasic: TPanel
          Left = 0
          Top = 0
          Width = 587
          Height = 276
          Align = alLeft
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
            Height = 21
            TabOrder = 0
          end
          object edtLastName: TEdit
            Left = 397
            Top = 13
            Width = 182
            Height = 21
            TabOrder = 1
          end
          object edtEmail: TEdit
            Left = 103
            Top = 40
            Width = 476
            Height = 21
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
              'Corporate'
              'Private')
          end
          object edtUniversityName: TEdit
            Left = 104
            Top = 94
            Width = 181
            Height = 21
            TabOrder = 4
          end
          object edtDegree: TEdit
            Left = 104
            Top = 121
            Width = 181
            Height = 21
            TabOrder = 6
          end
          object edtMajor: TEdit
            Left = 398
            Top = 121
            Width = 181
            Height = 21
            TabOrder = 7
          end
          object edtGPA: TEdit
            Left = 398
            Top = 94
            Width = 181
            Height = 21
            TabOrder = 5
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
              'Yes'
              'No')
          end
          object edtPlace: TEdit
            Left = 398
            Top = 175
            Width = 181
            Height = 21
            TabOrder = 11
          end
          object edtWorkPlace: TEdit
            Left = 104
            Top = 202
            Width = 181
            Height = 21
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
              'Yes'
              'No')
          end
          object edtFutureGoal: TEdit
            Left = 104
            Top = 229
            Width = 475
            Height = 21
            TabOrder = 14
          end
          object edtDate: TDateTimePicker
            Left = 291
            Top = 67
            Width = 186
            Height = 21
            Date = 41455.633558726860000000
            Time = 41455.633558726860000000
            TabOrder = 15
            Visible = False
            OnExit = edtDateExit
          end
        end
        object pnlUpperGrid: TPanel
          Left = 590
          Top = 0
          Width = 564
          Height = 276
          Align = alClient
          BevelOuter = bvNone
          Caption = 'pnlUpperGrid'
          TabOrder = 1
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
            TabOrder = 0
            object lblGMATTitle: TLabel
              AlignWithMargins = True
              Left = 4
              Top = 4
              Width = 107
              Height = 16
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
              Left = 114
              Top = 1
              Width = 41
              Height = 22
              Align = alLeft
              Caption = 'Add'
              Transparent = False
              OnClick = btnGAddClick
            end
            object btnGDelete: TSpeedButton
              Left = 155
              Top = 1
              Width = 41
              Height = 22
              Align = alLeft
              Caption = 'Delete'
              OnClick = btnGDeleteClick
              ExplicitLeft = 141
            end
          end
          object grdGMAT: TStringGrid
            Left = 0
            Top = 24
            Width = 587
            Height = 261
            Align = alClient
            FixedCols = 0
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
            TabOrder = 0
            object lblTOEFLTitle: TLabel
              AlignWithMargins = True
              Left = 4
              Top = 4
              Width = 107
              Height = 16
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
              Left = 114
              Top = 1
              Width = 41
              Height = 22
              Align = alLeft
              Caption = 'Add'
              Transparent = False
              OnClick = SpeedButton1Click
            end
            object SpeedButton2: TSpeedButton
              Left = 155
              Top = 1
              Width = 41
              Height = 22
              Align = alLeft
              Caption = 'Delete'
              OnClick = SpeedButton2Click
              ExplicitLeft = 141
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
  object dspClientCarte: TDataSetProvider
    DataSet = SQLQuery1
    Left = 493
    Top = 1
  end
  object cdsClientCarte: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspClientCarte'
    Left = 523
    Top = 1
  end
  object ApplicationEvents1: TApplicationEvents
    OnMessage = ApplicationEvents1Message
    Left = 441
    Top = 1
  end
end
