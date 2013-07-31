inherited FrmDBEdit: TFrmDBEdit
  Caption = 'FrmDBEdit'
  ClientHeight = 424
  ClientWidth = 555
  OnCreate = FormCreate
  ExplicitWidth = 571
  ExplicitHeight = 463
  PixelsPerInch = 96
  TextHeight = 13
  object Splitter1: TSplitter [0]
    Left = 0
    Top = 65
    Width = 555
    Height = 3
    Cursor = crVSplit
    Align = alTop
    ExplicitTop = 41
    ExplicitWidth = 418
  end
  inherited MainGrid: TDBGrid
    Left = 64
    Top = 104
    Width = 249
    PopupMenu = MainGridPopup
    OnKeyPress = MainGridKeyPress
  end
  object pnlDataList: TPanel
    Left = 64
    Top = 248
    Width = 249
    Height = 145
    TabOrder = 1
  end
  object pnlHeader: TPanel
    Left = 0
    Top = 0
    Width = 555
    Height = 65
    Align = alTop
    TabOrder = 2
    object pnlOperations: TPanel
      Left = 1
      Top = 1
      Width = 553
      Height = 63
      Align = alClient
      BevelOuter = bvNone
      TabOrder = 0
      object btnAddRow: TSpeedButton
        Left = 9
        Top = 13
        Width = 41
        Height = 36
        Hint = 'Add new record.'
        Action = actAddRow
        Caption = 'Add'
        ParentShowHint = False
        ShowHint = True
      end
      object btnDelete: TSpeedButton
        Left = 58
        Top = 13
        Width = 40
        Height = 36
        Hint = 'Delete selected row.'
        Action = actDeleteRow
        Caption = 'Delete'
        ParentShowHint = False
        ShowHint = True
      end
      object btnLoad: TSpeedButton
        Left = 254
        Top = 13
        Width = 41
        Height = 36
        Hint = 'Discard changes and load table.'
        Action = actLoad
        Caption = 'Load'
        ParentShowHint = False
        ShowHint = True
      end
      object btnCommit: TSpeedButton
        Left = 304
        Top = 13
        Width = 41
        Height = 36
        Hint = 'Save changes.'
        Action = actCommit
        Caption = 'Save'
        ParentShowHint = False
        ShowHint = True
      end
      object btnExport: TSpeedButton
        Left = 181
        Top = 13
        Width = 41
        Height = 36
        Hint = 'Export table to csv file.'
        Action = actExport
        Caption = 'Export'
        ParentShowHint = False
        ShowHint = True
      end
      object btnImport: TSpeedButton
        Left = 131
        Top = 13
        Width = 41
        Height = 36
        Hint = 'Import csv file to table.'
        Action = actImport
        Caption = 'Import'
        ParentShowHint = False
        ShowHint = True
      end
    end
  end
  object ActionList: TActionList
    Left = 336
    Top = 256
    object actCommit: TAction
      Caption = 'actCommit'
      ShortCut = 16397
      OnExecute = actCommitExecute
    end
    object actLoad: TAction
      Caption = 'actLoad'
      ShortCut = 120
      OnExecute = actLoadExecute
    end
    object actAddRow: TAction
      Caption = 'actAddRow'
      ShortCut = 16429
      OnExecute = actAddRowExecute
    end
    object actDeleteRow: TAction
      Caption = 'actDeleteRow'
      ShortCut = 16430
      OnExecute = actDeleteRowExecute
    end
    object actImport: TAction
      Caption = 'actImport'
      OnExecute = actImportExecute
    end
    object actExport: TAction
      Caption = 'actExport'
      OnExecute = actExportExecute
    end
    object actDuplicateRow: TAction
      Caption = 'Duplicate Row'
      OnExecute = actDuplicateRowExecute
    end
  end
  object MainGridPopup: TPopupMenu
    Left = 336
    Top = 200
    object miDuplRow: TMenuItem
      Action = actDuplicateRow
    end
  end
end
