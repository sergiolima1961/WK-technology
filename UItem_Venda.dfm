object Frm_Item: TFrm_Item
  Left = 0
  Top = 0
  BorderIcons = []
  Caption = 'Frm_Item_venda'
  ClientHeight = 134
  ClientWidth = 343
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label2: TLabel
    Left = 9
    Top = 82
    Width = 56
    Height = 13
    Caption = 'Quantidade'
    FocusControl = DBEdit2
  end
  object Label3: TLabel
    Left = 83
    Top = 82
    Width = 64
    Height = 13
    Caption = 'Valor Unitario'
    FocusControl = DBEdit3
  end
  object DBText1: TDBText
    Left = 83
    Top = 56
    Width = 65
    Height = 17
    DataField = 'Descri'#231#227'o'
    DataSource = dsItem
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlue
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object DBText2: TDBText
    Left = 270
    Top = 104
    Width = 65
    Height = 17
    DataField = 'Total'
    DataSource = dsItem
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlue
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label4: TLabel
    Left = 271
    Top = 82
    Width = 48
    Height = 13
    Caption = 'ValorTotal'
    FocusControl = DBEdit3
  end
  object DBEdit2: TDBEdit
    Left = 9
    Top = 101
    Width = 56
    Height = 21
    DataField = 'Qtd'
    DataSource = dsItem
    TabOrder = 1
  end
  object DBEdit3: TDBEdit
    Left = 83
    Top = 101
    Width = 173
    Height = 21
    DataField = 'Unitario'
    DataSource = dsItem
    TabOrder = 2
  end
  object DBLookupComboBox1: TDBLookupComboBox
    Left = 9
    Top = 55
    Width = 57
    Height = 21
    DataField = 'ID_PRODUTO'
    DataSource = dsItem
    DropDownRows = 15
    DropDownWidth = 360
    KeyField = 'Codigo'
    ListField = 'Produto;codigo'
    ListFieldIndex = 1
    ListSource = dsProduto
    TabOrder = 0
    OnExit = DBLookupComboBox1Exit
  end
  object Panel4: TPanel
    Left = 0
    Top = 0
    Width = 343
    Height = 26
    Align = alTop
    AutoSize = True
    Caption = 'Panel1'
    ShowCaption = False
    TabOrder = 3
    object Button7: TButton
      Left = 61
      Top = 1
      Width = 60
      Height = 24
      Align = alLeft
      Caption = 'Cancelar'
      TabOrder = 0
      OnClick = Button7Click
    end
    object Button8: TButton
      Left = 1
      Top = 1
      Width = 60
      Height = 24
      Align = alLeft
      Caption = 'Gravar'
      TabOrder = 1
      OnClick = Button8Click
      ExplicitLeft = -5
    end
  end
  object dsItem: TDataSource
    DataSet = DM_DB.fvItem
    Left = 328
    Top = 8
  end
  object dsProduto: TDataSource
    DataSet = DM_DB.fvProduto
    Left = 272
  end
end
