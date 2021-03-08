object FProspects: TFProspects
  Left = 0
  Top = 0
  Caption = 'Pedido de vendas'
  ClientHeight = 504
  ClientWidth = 833
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label11: TLabel
    Left = 520
    Top = 192
    Width = 39
    Height = 13
    Caption = 'BAIRRO'
  end
  object PC_Funil: TPageControl
    Left = 0
    Top = 0
    Width = 833
    Height = 504
    ActivePage = TabSheet1
    Align = alClient
    Style = tsButtons
    TabOrder = 0
    OnChange = PC_FunilChange
    object TabSheet1: TTabSheet
      Caption = 'Venda'
      object Panel1: TPanel
        Left = 0
        Top = 165
        Width = 825
        Height = 191
        Align = alTop
        BevelOuter = bvNone
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        object Label4: TLabel
          Left = 11
          Top = 50
          Width = 37
          Height = 14
          Caption = 'Cliente'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object Label5: TLabel
          Left = 12
          Top = 15
          Width = 25
          Height = 14
          Caption = 'Data'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object Label6: TLabel
          Left = 263
          Top = 15
          Width = 46
          Height = 14
          Caption = 'Total R$'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object DBText1: TDBText
          Left = 164
          Top = 53
          Width = 48
          Height = 14
          AutoSize = True
          DataField = 'NOME CLIENTE'
          DataSource = dsPedido
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -12
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object DBText2: TDBText
          Left = 101
          Top = 15
          Width = 48
          Height = 14
          AutoSize = True
          DataField = 'DATA PEDIDO'
          DataSource = dsPedido
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -12
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object DBText3: TDBText
          Left = 350
          Top = 15
          Width = 48
          Height = 14
          AutoSize = True
          DataField = 'VALOR PEDIDO'
          DataSource = dsPedido
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -12
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object Label7: TLabel
          Left = 12
          Top = 86
          Width = 21
          Height = 14
          Caption = 'CEP'
          FocusControl = DBEdit2
        end
        object Label8: TLabel
          Left = 176
          Top = 86
          Width = 62
          Height = 14
          Caption = 'Logradouro'
          FocusControl = DBEdit3
        end
        object Label9: TLabel
          Left = 695
          Top = 86
          Width = 43
          Height = 14
          Caption = 'Numero'
          FocusControl = DBEdit4
        end
        object Label10: TLabel
          Left = 12
          Top = 114
          Width = 76
          Height = 14
          Caption = 'Complemento'
          FocusControl = DBEdit5
        end
        object Label12: TLabel
          Left = 280
          Top = 120
          Width = 30
          Height = 14
          Caption = 'Bairro'
          FocusControl = DBEdit6
        end
        object Label13: TLabel
          Left = 12
          Top = 157
          Width = 36
          Height = 14
          Caption = 'Cidade'
          FocusControl = DBEdit7
        end
        object Label14: TLabel
          Left = 724
          Top = 164
          Width = 14
          Height = 14
          Caption = 'UF'
          FocusControl = DBEdit8
        end
        object dblCliente: TDBLookupComboBox
          Left = 101
          Top = 47
          Width = 57
          Height = 22
          DataField = 'ID_CLIENTE'
          DataSource = dsPedido
          DropDownRows = 20
          DropDownWidth = 360
          KeyField = 'ID'
          ListField = 'NOME;ID'
          ListFieldIndex = 1
          ListSource = dsCliente
          TabOrder = 0
          OnExit = dblClienteExit
        end
        object DBEdit2: TDBEdit
          Left = 104
          Top = 86
          Width = 70
          Height = 22
          DataField = 'CEP'
          DataSource = dsPedido
          TabOrder = 1
        end
        object DBEdit3: TDBEdit
          Left = 261
          Top = 86
          Width = 405
          Height = 22
          DataField = 'LOGRADOURO'
          DataSource = dsPedido
          TabOrder = 2
        end
        object DBEdit4: TDBEdit
          Left = 749
          Top = 86
          Width = 70
          Height = 22
          DataField = 'NUMERO'
          DataSource = dsPedido
          TabOrder = 3
        end
        object DBEdit5: TDBEdit
          Left = 104
          Top = 120
          Width = 157
          Height = 22
          DataField = 'COMPLEMENTO'
          DataSource = dsPedido
          TabOrder = 4
        end
        object DBEdit6: TDBEdit
          Left = 328
          Top = 120
          Width = 394
          Height = 22
          DataField = 'BAIRRO'
          DataSource = dsPedido
          TabOrder = 5
        end
        object DBEdit7: TDBEdit
          Left = 104
          Top = 157
          Width = 524
          Height = 22
          DataField = 'CIDADE'
          DataSource = dsPedido
          TabOrder = 6
        end
        object DBEdit8: TDBEdit
          Left = 749
          Top = 157
          Width = 30
          Height = 22
          DataField = 'ESTADO'
          DataSource = dsPedido
          TabOrder = 7
        end
      end
      object Panel3: TPanel
        Left = 0
        Top = 0
        Width = 825
        Height = 34
        Align = alTop
        AutoSize = True
        Caption = 'Panel1'
        ShowCaption = False
        TabOrder = 1
        object Label16: TLabel
          Left = 453
          Top = 7
          Width = 52
          Height = 13
          Caption = '0000/0000'
        end
        object Button1: TButton
          Left = 1
          Top = 1
          Width = 60
          Height = 32
          Align = alLeft
          Caption = 'Novo'
          TabOrder = 0
          OnClick = Button1Click
        end
        object Button2: TButton
          Left = 241
          Top = 1
          Width = 60
          Height = 32
          Align = alLeft
          Caption = 'Cancelar'
          Enabled = False
          TabOrder = 1
          OnClick = Button2Click
        end
        object Button3: TButton
          Left = 181
          Top = 1
          Width = 60
          Height = 32
          Align = alLeft
          Caption = 'Gravar'
          Enabled = False
          TabOrder = 2
          OnClick = Button3Click
        end
        object Button4: TButton
          Left = 61
          Top = 1
          Width = 60
          Height = 32
          Align = alLeft
          Caption = 'Editar'
          TabOrder = 3
          OnClick = Button4Click
        end
        object Button5: TButton
          Left = 121
          Top = 1
          Width = 60
          Height = 32
          Align = alLeft
          Caption = 'Excluir'
          TabOrder = 4
        end
        object BtFechar: TButton
          Left = 301
          Top = 1
          Width = 60
          Height = 32
          Align = alLeft
          Caption = 'Pesquisa..'
          TabOrder = 5
          OnClick = BtFecharClick
        end
      end
      object Pnl_Atividade: TPanel
        Left = 0
        Top = 356
        Width = 825
        Height = 19
        Align = alTop
        Caption = 'Item de Pedidos'
        TabOrder = 2
      end
      object DBGrid1: TDBGrid
        Left = 0
        Top = 34
        Width = 825
        Height = 131
        Hint = 
          'Pressione a Tecla insert(adicionar) ou Enter(altera'#231#227'o) ou Del (' +
          'Excluir)'
        Align = alTop
        DataSource = dsPedido
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
        ParentShowHint = False
        ShowHint = True
        TabOrder = 3
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
      end
      object DBGrid2: TDBGrid
        Left = 0
        Top = 375
        Width = 825
        Height = 98
        Align = alClient
        DataSource = dsItem
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
        TabOrder = 4
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
        OnKeyDown = DBGrid2KeyDown
      end
    end
  end
  object dsCliente: TDataSource
    AutoEdit = False
    DataSet = DM_DB.FvCliente
    Left = 608
    Top = 80
  end
  object dsProduto: TDataSource
    AutoEdit = False
    DataSet = DM_DB.fvProduto
    OnDataChange = dsProdutoDataChange
    Left = 584
    Top = 328
  end
  object dsPedido: TDataSource
    AutoEdit = False
    DataSet = DM_DB.FvPedido
    OnDataChange = dsPedidoDataChange
    Left = 528
    Top = 96
  end
  object dsItem: TDataSource
    DataSet = DM_DB.fvItem
    Left = 488
    Top = 328
  end
end
