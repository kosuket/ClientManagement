inherited FrmTableList: TFrmTableList
  Caption = 'FrmTableList'
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  inherited MainGrid: TDBGrid
    OnCellClick = MainGridCellClick
    OnKeyDown = MainGridKeyDown
    OnKeyUp = MainGridKeyUp
  end
end
