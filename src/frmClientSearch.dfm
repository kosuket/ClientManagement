inherited ClientSearchframe: TClientSearchframe
  Caption = 'ClientSearchframe'
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
      Top = 171
      Width = 1158
      ExplicitTop = 171
      ExplicitWidth = 1158
    end
    inherited Panel2: TPanel
      Top = 174
      Width = 1158
      Height = 421
      ExplicitTop = 174
      ExplicitWidth = 1158
      ExplicitHeight = 421
      inherited DBGrid1: TDBGrid
        Width = 1158
        Height = 421
        Ctl3D = False
        FixedColor = 14221016
        ParentCtl3D = False
        OnDblClick = DBGrid1DblClick
      end
    end
    inherited pnlCondition: TPanel
      Width = 1158
      Height = 171
      ExplicitWidth = 1158
      ExplicitHeight = 171
      inherited pnlCondBar: TPanel
        Top = 136
        Width = 1158
        ExplicitTop = 136
        ExplicitWidth = 1158
        inherited Image1: TImage
          Width = 1158
          ExplicitWidth = 1158
        end
        inherited btnLoad: TButton
          Left = 968
          Top = 5
          Width = 75
          Height = 25
          ExplicitLeft = 968
          ExplicitTop = 5
          ExplicitWidth = 75
          ExplicitHeight = 25
        end
        object btnAdd: TButton
          Left = 109
          Top = 4
          Width = 75
          Height = 25
          Caption = 'Add'
          TabOrder = 1
          OnClick = btnAddClick
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
          TabOrder = 2
          OnClick = btnMailClick
        end
        object btnClear: TButton
          Left = 16
          Top = 5
          Width = 75
          Height = 25
          Caption = 'Clear'
          TabOrder = 3
          OnClick = btnClearClick
        end
      end
      object pgctrlCond: TPageControl
        Left = 0
        Top = 0
        Width = 1158
        Height = 136
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
            Height = 104
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
            Height = 104
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
end
