inherited CounselingDialogframe: TCounselingDialogframe
  Caption = 'CounselingDialogframe'
  ClientHeight = 510
  ClientWidth = 637
  Position = poScreenCenter
  ExplicitWidth = 653
  ExplicitHeight = 548
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlBase: TPanel
    Width = 637
    Height = 510
    ExplicitWidth = 637
    ExplicitHeight = 510
    inherited pnlTitle: TPanel
      Width = 635
      ExplicitWidth = 635
      inherited Image1: TImage
        Width = 633
        ExplicitWidth = 720
      end
      inherited lblTitle: TPanel
        object btnOK: TButton
          Left = 105
          Top = 1
          Width = 75
          Height = 24
          Caption = 'btnOK'
          ParentShowHint = False
          ShowHint = True
          TabOrder = 0
          OnClick = btnOKClick
        end
        object btnCancel: TButton
          Left = 193
          Top = 0
          Width = 75
          Height = 25
          Hint = 'Delete This Counseling Data and Cancel Billing Request'
          Caption = 'Delete'
          ParentShowHint = False
          ShowHint = True
          TabOrder = 1
          OnClick = btnCancelClick
        end
      end
      object cmbItemType: TComboBox
        Left = 8
        Top = 2
        Width = 105
        Height = 22
        Style = csOwnerDrawFixed
        ItemIndex = 0
        TabOrder = 1
        Text = 'Counseling'
        OnChange = cmbItemTypeChange
        Items.Strings = (
          'Counseling'
          'Seminar'
          'Package')
      end
    end
    object pnlClient: TPanel
      Left = 1
      Top = 28
      Width = 635
      Height = 45
      Align = alTop
      BevelOuter = bvNone
      Color = clCream
      ParentBackground = False
      TabOrder = 1
      object lblClient: TLabel
        Left = 128
        Top = 11
        Width = 478
        Height = 25
        Hint = 'Click to show detailed Client info'
        AutoSize = False
        Color = clWindow
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Georgia'
        Font.Style = []
        ParentColor = False
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        Transparent = False
        Layout = tlCenter
        OnClick = lblClientClick
      end
      object btnClient: TButton
        Left = 8
        Top = 11
        Width = 105
        Height = 25
        Caption = 'Select Client'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Georgia'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        OnClick = btnClientClick
      end
      object lbClient: TListBox
        Left = 128
        Top = 3
        Width = 477
        Height = 41
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Georgia'
        Font.Style = []
        ItemHeight = 14
        ParentFont = False
        TabOrder = 1
      end
    end
    object gbCounseling: TGroupBox
      Left = 1
      Top = 73
      Width = 635
      Height = 282
      Align = alTop
      Caption = 'Counseling'
      Color = clCream
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Georgia'
      Font.Style = []
      ParentBackground = False
      ParentColor = False
      ParentFont = False
      TabOrder = 2
      object lblCounselingType: TLabel
        Left = 8
        Top = 16
        Width = 105
        Height = 21
        AutoSize = False
        Caption = 'Counseling Type'
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
      object lblCounselingDate: TLabel
        Left = 8
        Top = 46
        Width = 105
        Height = 21
        AutoSize = False
        Caption = 'Counseling Date'
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
      object lblStartTime: TLabel
        Left = 245
        Top = 46
        Width = 70
        Height = 21
        AutoSize = False
        Caption = 'Start Time'
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
      object lblEndTime: TLabel
        Left = 432
        Top = 46
        Width = 70
        Height = 21
        AutoSize = False
        Caption = 'End Time'
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
      object lblContentType: TLabel
        Left = 8
        Top = 76
        Width = 105
        Height = 21
        AutoSize = False
        Caption = 'Content Type'
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
      object lblNextAction: TLabel
        Left = 8
        Top = 106
        Width = 105
        Height = 21
        AutoSize = False
        Caption = 'Next Action'
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
      object lblCounselingMemo: TLabel
        Left = 8
        Top = 177
        Width = 105
        Height = 21
        AutoSize = False
        Caption = 'Memo'
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
      object lblCharge: TLabel
        Left = 128
        Top = 248
        Width = 46
        Height = 21
        AutoSize = False
        Caption = 'Charge'
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
      object lblExplanation: TLabel
        Left = 374
        Top = 248
        Width = 232
        Height = 21
        AutoSize = False
        Caption = 'Charge'
        Color = clCream
        Font.Charset = ANSI_CHARSET
        Font.Color = clRed
        Font.Height = -13
        Font.Name = 'Georgia'
        Font.Style = []
        ParentColor = False
        ParentFont = False
        Transparent = False
        Layout = tlBottom
        Visible = False
      end
      object cmbCounselingType: TComboBox
        Left = 128
        Top = 16
        Width = 104
        Height = 22
        Style = csOwnerDrawFixed
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Georgia'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        Items.Strings = (
          'Face To Face'
          'Skype'
          'Email'
          'Seminar')
      end
      object edtCounselingDate: TDateTimePicker
        Left = 128
        Top = 46
        Width = 104
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
        OnChange = edtCounselingDateChange
      end
      object edtStartTime: TDateTimePicker
        Left = 329
        Top = 46
        Width = 89
        Height = 22
        Date = 41485.000000000000000000
        Time = 41485.000000000000000000
        DateMode = dmUpDown
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Georgia'
        Font.Style = []
        Kind = dtkTime
        ParentFont = False
        TabOrder = 2
        OnChange = edtStartTimeChange
      end
      object edtEndTime: TDateTimePicker
        Left = 516
        Top = 46
        Width = 89
        Height = 22
        Date = 41485.000000000000000000
        Time = 41485.000000000000000000
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Georgia'
        Font.Style = []
        Kind = dtkTime
        ParentFont = False
        TabOrder = 3
        OnChange = edtEndTimeChange
      end
      object edtContentType: TEdit
        Left = 128
        Top = 76
        Width = 103
        Height = 22
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Georgia'
        Font.Style = []
        ParentFont = False
        TabOrder = 4
      end
      object cbPanicFee: TCheckBox
        Left = 8
        Top = 250
        Width = 82
        Height = 22
        Alignment = taLeftJustify
        Caption = 'Panic Fee'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Georgia'
        Font.Style = []
        ParentFont = False
        TabOrder = 5
        OnClick = cbPanicFeeClick
      end
      object memoNextAction: TRichEdit
        Left = 128
        Top = 106
        Width = 478
        Height = 64
        ScrollBars = ssBoth
        TabOrder = 6
      end
      object memoCounseling: TRichEdit
        Left = 128
        Top = 177
        Width = 478
        Height = 64
        ScrollBars = ssBoth
        TabOrder = 7
      end
      object edtCounselingAmount: TEdit
        Left = 195
        Top = 248
        Width = 173
        Height = 22
        Alignment = taRightJustify
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Georgia'
        Font.Style = []
        NumbersOnly = True
        ParentFont = False
        TabOrder = 8
        Text = '0'
      end
      object cbCounselingPaid: TCheckBox
        Left = 245
        Top = 18
        Width = 81
        Height = 22
        Alignment = taLeftJustify
        Caption = 'Fee Paid'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Georgia'
        Font.Style = []
        ParentFont = False
        TabOrder = 9
      end
    end
    object gbPackage: TGroupBox
      Left = 1
      Top = 355
      Width = 635
      Height = 154
      Align = alClient
      Caption = 'Package'
      Color = clCream
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Georgia'
      Font.Style = []
      ParentBackground = False
      ParentColor = False
      ParentFont = False
      TabOrder = 3
      object lblPackageType: TLabel
        Left = 16
        Top = 24
        Width = 105
        Height = 21
        AutoSize = False
        Caption = 'Package Type'
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
      object lblBookDate: TLabel
        Left = 245
        Top = 24
        Width = 81
        Height = 21
        AutoSize = False
        Caption = 'Book Date'
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
      object lblBookAmount: TLabel
        Left = 245
        Top = 54
        Width = 81
        Height = 21
        AutoSize = False
        Caption = 'Charge'
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
      object Label1: TLabel
        Left = 16
        Top = 84
        Width = 70
        Height = 21
        AutoSize = False
        Caption = 'Memo'
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
      object cmbPackageType: TComboBox
        Left = 128
        Top = 24
        Width = 96
        Height = 22
        Style = csOwnerDrawFixed
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Georgia'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        OnChange = cmbPackageTypeChange
        Items.Strings = (
          'Alpha'
          'Standard')
      end
      object edtBookDate: TDateTimePicker
        Left = 329
        Top = 24
        Width = 96
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
      object edtPackageAmount: TEdit
        Left = 329
        Top = 54
        Width = 96
        Height = 22
        Alignment = taRightJustify
        NumbersOnly = True
        TabOrder = 2
        Text = '0'
      end
      object memoBilling: TRichEdit
        Left = 128
        Top = 84
        Width = 471
        Height = 62
        ScrollBars = ssBoth
        TabOrder = 3
      end
      object cbPackagePaid: TCheckBox
        Left = 16
        Top = 56
        Width = 84
        Height = 22
        Alignment = taLeftJustify
        Caption = 'Fee Paid'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Georgia'
        Font.Style = []
        ParentFont = False
        TabOrder = 4
      end
    end
  end
end
