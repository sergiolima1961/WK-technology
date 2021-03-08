object DM_DB: TDM_DB
  OldCreateOrder = False
  Height = 355
  Width = 520
  object FD_SQLlocal: TFDConnection
    Params.Strings = (
      'Database=WKTecnologia'
      'User_Name=LAPTOPSLIMA\slima'
      'Server=LAPTOPSLIMA'
      'OSAuthent=Yes'
      'DriverID=MSSQL')
    Connected = True
    LoginPrompt = False
    Left = 40
    Top = 48
  end
  object FvCliente: TFDQuery
    Connection = FD_SQLlocal
    SQL.Strings = (
      'DECLARE @ACAO            CHAR(1)      = :ACAO,'
      '        @ID_CLIENTE      INT          = :ID,'
      '        @NOME            VARCHAR(90)  = :NOM,'
      '        @ID_ENDERECO     INT          = :IDEND,'
      '        @CEP             VARCHAR(8)   = :CEP,'
      '        @LOGRADOURO      VARCHAR(50)  = :LOG,'
      '        @NUMERO          VARCHAR(10)  = :NUM,'
      '        @COMPLEMENTO     VARCHAR(20)  = :COM,'
      '        @BAIRRO          VARCHAR(30)  = :BAI,'
      '        @CIDADE          VARCHAR(40)  = :CID,'
      '        @ESTADO          VARCHAR(2)   = :EST,'
      '        @ID_RETORN       INT          = :IDR'
      ''
      'EXECUTE [DBO].[SP_IAEC_CLIENTE]'
      '  @ACAO,'
      '  @ID_CLIENTE,'
      '  @NOME,'
      '  @ID_ENDERECO,'
      '  @CEP,'
      '  @LOGRADOURO,'
      '  @NUMERO,'
      '  @COMPLEMENTO,'
      '  @BAIRRO,'
      '  @CIDADE,'
      '  @ESTADO,'
      '  @ID_RETORN'
      '')
    Left = 184
    Top = 40
    ParamData = <
      item
        Name = 'ACAO'
        DataType = ftString
        ParamType = ptInput
        Value = 'C'
      end
      item
        Name = 'ID'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'NOM'
        DataType = ftString
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'IDEND'
        DataType = ftSmallint
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'CEP'
        DataType = ftString
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'LOG'
        DataType = ftString
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'NUM'
        DataType = ftString
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'COM'
        DataType = ftString
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'BAI'
        DataType = ftString
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'CID'
        DataType = ftString
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'EST'
        DataType = ftString
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'IDR'
        DataType = ftString
        ParamType = ptInput
        Value = Null
      end>
    object FvClienteID: TFDAutoIncField
      FieldName = 'ID'
      Origin = 'ID'
      ReadOnly = True
    end
    object FvClienteNOME: TStringField
      FieldName = 'NOME'
      Origin = 'NOME'
      Size = 90
    end
    object FvClienteID_ENDERECO: TIntegerField
      FieldName = 'ID_ENDERECO'
      Origin = 'ID_ENDERECO'
    end
    object FvClienteCEP: TStringField
      FieldName = 'CEP'
      Origin = 'CEP'
      EditMask = '00000\-999;0;_'
      Size = 8
    end
    object FvClienteLOGRADOURO: TStringField
      FieldName = 'LOGRADOURO'
      Origin = 'LOGRADOURO'
      Size = 50
    end
    object FvClienteNUMERO: TStringField
      FieldName = 'NUMERO'
      Origin = 'NUMERO'
      Size = 10
    end
    object FvClienteCOMPLEMENTO: TStringField
      FieldName = 'COMPLEMENTO'
      Origin = 'COMPLEMENTO'
    end
    object FvClienteBAIRRO: TStringField
      FieldName = 'BAIRRO'
      Origin = 'BAIRRO'
      Size = 30
    end
    object FvClienteCIDADE: TStringField
      FieldName = 'CIDADE'
      Origin = 'CIDADE'
      Size = 40
    end
    object FvClienteESTADO: TStringField
      FieldName = 'ESTADO'
      Origin = 'ESTADO'
      Size = 2
    end
  end
  object FvEndereco: TFDQuery
    Connection = FD_SQLlocal
    SQL.Strings = (
      ''
      'DECLARE @ACAO            CHAR(1) = :AC,'
      '        @ID_ENDERECO     INT = :ID,'
      '        @CEP             VARCHAR(8) = :CEP,'
      '        @LOGRADOURO      VARCHAR(50) = :LOG,'
      '        @NUMERO          VARCHAR(10) = :NUM ,'
      '        @COMPLEMENTO     VARCHAR(20) = :COM,'
      '        @BAIRRO          VARCHAR(30) = :BAI,'
      '        @CIDADE          VARCHAR(40) = :CID,'
      '        @ESTADO          VARCHAR(2)  = :UF,'
      '        @ID_RETORN       INT = 0'
      ''
      'EXECUTE [DBO].[SP_IAEC_ENDERECO]'
      '  @ACAO,'
      '  @ID_ENDERECO,'
      '  @CEP,'
      '  @LOGRADOURO,'
      '  @NUMERO,'
      '  @COMPLEMENTO,'
      '  @BAIRRO,'
      '  @CIDADE,'
      '  @ESTADO,'
      '        @ID_RETORN')
    Left = 400
    Top = 208
    ParamData = <
      item
        Name = 'AC'
        DataType = ftString
        ParamType = ptInput
        Value = 'C'
      end
      item
        Name = 'ID'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'CEP'
        DataType = ftString
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'LOG'
        DataType = ftString
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'NUM'
        DataType = ftString
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'COM'
        DataType = ftString
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'BAI'
        DataType = ftString
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'CID'
        DataType = ftString
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'UF'
        DataType = ftString
        ParamType = ptInput
        Value = Null
      end>
    object FDAutoIncField5: TFDAutoIncField
      FieldName = 'ID'
      Origin = 'ID'
      ReadOnly = True
    end
    object StringField4: TStringField
      FieldName = 'CEP'
      Origin = 'CEP'
      EditMask = '00000\-000;0;_'
      Size = 8
    end
    object StringField5: TStringField
      FieldName = 'LOGRADOURO'
      Origin = 'LOGRADOURO'
      Size = 50
    end
    object StringField6: TStringField
      FieldName = 'NUMERO'
      Origin = 'NUMERO'
      Size = 10
    end
    object StringField7: TStringField
      FieldName = 'COMPLEMENTO'
      Origin = 'COMPLEMENTO'
    end
    object StringField8: TStringField
      FieldName = 'BAIRRO'
      Origin = 'BAIRRO'
      Size = 30
    end
    object StringField9: TStringField
      FieldName = 'CIDADE'
      Origin = 'CIDADE'
      Size = 40
    end
    object StringField10: TStringField
      FieldName = 'ESTADO'
      Origin = 'ESTADO'
      Size = 2
    end
  end
  object fvCEPS: TFDQuery
    Connection = FD_SQLlocal
    SQL.Strings = (
      'DECLARE @ACAO            CHAR(1) = :AC,'
      '        @ID_CEPS         INT = :ID,'
      '        @CEP             VARCHAR(8) = :CEP,'
      '        @LOGRADOURO      VARCHAR(50) = :LOG,'
      '        @COMPLEMENTO     VARCHAR(20) = :COM,'
      '        @BAIRRO          VARCHAR(30) = :BAI,'
      '        @CIDADE          VARCHAR(40) = :CID,'
      '        @ESTADO          VARCHAR(2)  = :EST'
      ''
      'EXECUTE SP_IAEC_CEPS'
      '  @ACAO,'
      '  @ID_CEPS,'
      '  @CEP,'
      '  @LOGRADOURO,'
      '  @COMPLEMENTO,'
      '  @BAIRRO,'
      '  @CIDADE,'
      '  @ESTADO ')
    Left = 408
    Top = 256
    ParamData = <
      item
        Name = 'AC'
        DataType = ftString
        ParamType = ptInput
        Value = 'C'
      end
      item
        Name = 'ID'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'CEP'
        DataType = ftString
        ParamType = ptInput
        Value = '04141020'
      end
      item
        Name = 'LOG'
        DataType = ftString
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'COM'
        DataType = ftString
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'BAI'
        DataType = ftString
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'CID'
        DataType = ftString
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'EST'
        DataType = ftString
        ParamType = ptInput
        Value = Null
      end>
    object FDAutoIncField7: TFDAutoIncField
      FieldName = 'ID'
      Origin = 'ID'
      ReadOnly = True
    end
    object StringField20: TStringField
      FieldName = 'CEP'
      Origin = 'CEP'
      Size = 8
    end
    object StringField21: TStringField
      FieldName = 'LOGRADOURO'
      Origin = 'LOGRADOURO'
      Size = 50
    end
    object StringField23: TStringField
      FieldName = 'COMPLEMENTO'
      Origin = 'COMPLEMENTO'
    end
    object StringField24: TStringField
      FieldName = 'BAIRRO'
      Origin = 'BAIRRO'
      Size = 30
    end
    object StringField25: TStringField
      FieldName = 'CIDADE'
      Origin = 'CIDADE'
      Size = 40
    end
    object StringField26: TStringField
      FieldName = 'ESTADO'
      Origin = 'ESTADO'
      Size = 2
    end
  end
  object fvProduto: TFDQuery
    Connection = FD_SQLlocal
    SQL.Strings = (
      'DECLARE @ACAO        CHAR(1) =:AC,'
      '        @ID_PRODUTO  INT =:ID,'
      '        @DSC_PRODUTO VARCHAR(150) =:DS,'
      '        @VLR_PRODUTO DECIMAL(18, 2) = :VL,'
      '        @ID_RETORN   INT = :RT'
      ''
      'EXECUTE [dbo].[Sp_iaec_produto]'
      '  @ACAO,'
      '  @ID_PRODUTO,'
      '  @DSC_PRODUTO,'
      '  @VLR_PRODUTO,'
      '  @ID_RETORN'
      '')
    Left = 192
    Top = 96
    ParamData = <
      item
        Name = 'AC'
        DataType = ftString
        ParamType = ptInput
        Value = 'c'
      end
      item
        Name = 'ID'
        DataType = ftInteger
        ParamType = ptInput
        Value = 0
      end
      item
        Name = 'DS'
        DataType = ftString
        ParamType = ptInput
        Value = ' '
      end
      item
        Name = 'VL'
        DataType = ftCurrency
        ParamType = ptInput
        Value = 0c
      end
      item
        Name = 'RT'
        DataType = ftInteger
        ParamType = ptInput
        Value = 0
      end>
    object fvProdutoCodigo: TFDAutoIncField
      FieldName = 'Codigo'
      Origin = 'Codigo'
      ReadOnly = True
    end
    object fvProdutoProduto: TStringField
      FieldName = 'Produto'
      Origin = 'Produto'
      ReadOnly = True
      Size = 30
    end
    object fvProdutoValor: TFMTBCDField
      FieldName = 'Valor'
      Origin = 'Valor'
      Precision = 18
      Size = 2
    end
  end
  object FvPedido: TFDQuery
    AfterScroll = FvPedidoAfterScroll
    Connection = FD_SQLlocal
    SQL.Strings = (
      'DECLARE @ACAO       CHAR(1) =:ACAO,'
      '        @RET        SMALLINT = :RET,'
      '        @BUSCA      VARCHAR(150) =:BUS,'
      '        @ID_PEDIDO  INT = :IDP,'
      '        @ID_CLIENTE INT  = :ICL ,'
      '        @VLR_PEDIDO DECIMAL(18, 2) = :VLP,'
      '        @DAT_PEDIDO DATETIME = :DTP ,'
      '        @ID_RETORN  INT = :IRE'
      ''
      'EXECUTE  [dbo].[Sp_iaec_pedido]'
      '  @ACAO,'
      '  @RET,'
      '  @BUSCA,'
      '  @ID_PEDIDO,'
      '  @ID_CLIENTE,'
      '  @VLR_PEDIDO,'
      '  @DAT_PEDIDO,'
      '  @ID_RETORN output'
      ''
      ' ')
    Left = 448
    Top = 40
    ParamData = <
      item
        Name = 'ACAO'
        DataType = ftString
        ParamType = ptInput
        Value = 'C'
      end
      item
        Name = 'RET'
        DataType = ftSmallint
        ParamType = ptInput
        Value = 0
      end
      item
        Name = 'BUS'
        DataType = ftString
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'IDP'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'ICL'
        DataType = ftCurrency
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'VLP'
        DataType = ftCurrency
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'DTP'
        DataType = ftCurrency
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'IRE'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
    object FvPedidoPEDIDO: TFDAutoIncField
      DisplayLabel = 'N'#186' Pedido'
      FieldName = 'PEDIDO'
      Origin = 'PEDIDO'
      ReadOnly = True
      DisplayFormat = '000#'
    end
    object FvPedidoID_CLIENTE: TIntegerField
      FieldName = 'ID_CLIENTE'
      Origin = 'ID_CLIENTE'
      Visible = False
    end
    object FvPedidoNOMECLIENTE: TStringField
      DisplayLabel = 'Cliente'
      DisplayWidth = 60
      FieldName = 'NOME CLIENTE'
      Origin = '[NOME CLIENTE]'
      Required = True
      Size = 100
    end
    object FvPedidoVALORPEDIDO: TFMTBCDField
      DisplayLabel = 'Total do Pedido'
      FieldName = 'VALOR PEDIDO'
      Origin = '[VALOR PEDIDO]'
      DisplayFormat = '#,0.00'
      Precision = 18
      Size = 2
    end
    object FvPedidoDATAPEDIDO: TSQLTimeStampField
      DisplayLabel = 'Data do Pedido '
      DisplayWidth = 18
      FieldName = 'DATA PEDIDO'
      Origin = '[DATA PEDIDO]'
    end
    object FvPedidocep: TStringField
      FieldName = 'cep'
      Origin = 'cep'
      Visible = False
      Size = 8
    end
    object FvPedidologradouro: TStringField
      FieldName = 'logradouro'
      Origin = 'logradouro'
      Visible = False
      Size = 50
    end
    object FvPedidonumero: TStringField
      FieldName = 'numero'
      Origin = 'numero'
      Visible = False
      Size = 10
    end
    object FvPedidocomplemento: TStringField
      FieldName = 'complemento'
      Origin = 'complemento'
      Visible = False
    end
    object FvPedidobairro: TStringField
      FieldName = 'bairro'
      Origin = 'bairro'
      Visible = False
      Size = 30
    end
    object FvPedidocidade: TStringField
      FieldName = 'cidade'
      Origin = 'cidade'
      Visible = False
      Size = 40
    end
    object FvPedidoestado: TStringField
      FieldName = 'estado'
      Origin = 'estado'
      Visible = False
      Size = 2
    end
  end
  object ftPedido: TFDQuery
    Connection = FD_SQLlocal
    SQL.Strings = (
      'DECLARE @ACAO       CHAR(1) =:ACAO,'
      '        @RET        SMALLINT = :RET,'
      '        @BUSCA      VARCHAR(150) =:BUS,'
      '        @ID_PEDIDO  INT = :IDP,'
      '        @ID_CLIENTE INT  = :ICL ,'
      '        @VLR_PEDIDO DECIMAL(18, 2) = :VLP,'
      '        @DAT_PEDIDO DATETIME = :DTP ,'
      '        @ID_RETORN  INT = :IRE'
      ''
      'EXECUTE  [dbo].[Sp_iaec_pedido]'
      '  @ACAO,'
      '  @RET,'
      '  @BUSCA,'
      '  @ID_PEDIDO,'
      '  @ID_CLIENTE,'
      '  @VLR_PEDIDO,'
      '  @DAT_PEDIDO,'
      '  @ID_RETORN output'
      ''
      ' ')
    Left = 464
    Top = 96
    ParamData = <
      item
        Name = 'ACAO'
        DataType = ftString
        ParamType = ptInput
        Value = 'C'
      end
      item
        Name = 'RET'
        DataType = ftSmallint
        ParamType = ptInput
        Value = 0
      end
      item
        Name = 'BUS'
        DataType = ftString
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'IDP'
        DataType = ftInteger
        ParamType = ptInput
        Value = 1
      end
      item
        Name = 'ICL'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'VLP'
        DataType = ftCurrency
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'DTP'
        DataType = ftDateTime
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'IRE'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
    object ftPedidoPEDIDO: TFDAutoIncField
      FieldName = 'PEDIDO'
      Origin = 'PEDIDO'
      ReadOnly = True
    end
    object ftPedidoID_CLIENTE: TIntegerField
      FieldName = 'ID_CLIENTE'
      Origin = 'ID_CLIENTE'
    end
    object ftPedidoNOMECLIENTE: TStringField
      FieldName = 'NOME CLIENTE'
      Origin = '[NOME CLIENTE]'
      ReadOnly = True
      Size = 100
    end
    object ftPedidoVALORPEDIDO: TFMTBCDField
      FieldName = 'VALOR PEDIDO'
      Origin = '[VALOR PEDIDO]'
      Precision = 18
      Size = 2
    end
    object ftPedidoDATAPEDIDO: TSQLTimeStampField
      FieldName = 'DATA PEDIDO'
      Origin = '[DATA PEDIDO]'
    end
  end
  object FfPedido: TFDQuery
    Connection = FD_SQLlocal
    SQL.Strings = (
      'DECLARE @ACAO       CHAR(1) =:ACAO,'
      '        @RET        SMALLINT = :RET,'
      '        @BUSCA      VARCHAR(150) =:BUS,'
      '        @ID_PEDIDO  INT = :IDP,'
      '        @ID_CLIENTE INT  = :ICL ,'
      '        @VLR_PEDIDO DECIMAL(18, 2) = :VLP,'
      '        @DAT_PEDIDO DATETIME = :DTP ,'
      '        @ID_RETORN  INT = :IRE'
      ''
      'EXECUTE  [dbo].[Sp_iaec_pedido]'
      '  @ACAO,'
      '  @RET,'
      '  @BUSCA,'
      '  @ID_PEDIDO,'
      '  @ID_CLIENTE,'
      '  @VLR_PEDIDO,'
      '  @DAT_PEDIDO,'
      '  @ID_RETORN output'
      ''
      ' ')
    Left = 464
    Top = 152
    ParamData = <
      item
        Name = 'ACAO'
        DataType = ftString
        ParamType = ptInput
        Value = 'P'
      end
      item
        Name = 'RET'
        DataType = ftSmallint
        ParamType = ptInput
        Value = 1
      end
      item
        Name = 'BUS'
        DataType = ftString
        ParamType = ptInput
        Value = ''
      end
      item
        Name = 'IDP'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'ICL'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'VLP'
        DataType = ftCurrency
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'DTP'
        DataType = ftDateTime
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'IRE'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
    object FfPedidoPedido: TFDAutoIncField
      FieldName = 'Pedido'
      Origin = 'Pedido'
      ReadOnly = True
    end
    object FfPedidoDataPedido: TStringField
      FieldName = 'Data Pedido'
      Origin = '[Data Pedido]'
      ReadOnly = True
      Size = 10
    end
    object FfPedidoValorPedido: TFMTBCDField
      FieldName = 'Valor Pedido'
      Origin = '[Valor Pedido]'
      Precision = 18
      Size = 2
    end
    object FfPedidoCliente: TStringField
      FieldName = 'Cliente'
      Origin = 'Cliente'
      ReadOnly = True
      Size = 70
    end
  end
  object fvItem: TFDQuery
    Connection = FD_SQLlocal
    SQL.Strings = (
      'DECLARE @ACAO                     CHAR(1) =:AC,'
      '        @ID_ITEM_PEDIDO           INT = :IIP,'
      '        @ID_PEDIDO                INT = :IPE,'
      '        @ID_PRODUTO               INT = :IPR ,'
      '        @QTD_ITEM_PEDIDO          INT = :QT,'
      '        @VLR_ITEM_PEDIDO_UNITARIO DECIMAL(12, 2) = :VIPU,'
      '        @VLR_ITEM_PEDIDO_TOTAL    DECIMAL(18, 2) = :VIPT,'
      '        @ID_RETORN                INT = :RT'
      ''
      'EXECUTE [dbo].[Sp_iaec_item_pedido]'
      '  @ACAO,'
      '  @ID_ITEM_PEDIDO,'
      '  @ID_PEDIDO,'
      '  @ID_PRODUTO,'
      '  @QTD_ITEM_PEDIDO,'
      '  @VLR_ITEM_PEDIDO_UNITARIO,'
      '  @VLR_ITEM_PEDIDO_TOTAL,'
      '  @ID_RETORN ')
    Left = 280
    Top = 168
    ParamData = <
      item
        Name = 'AC'
        DataType = ftString
        ParamType = ptInput
        Value = 'c'
      end
      item
        Name = 'IIP'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'IPE'
        DataType = ftInteger
        ParamType = ptInput
        Value = 3
      end
      item
        Name = 'IPR'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'QT'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'VIPU'
        DataType = ftCurrency
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'VIPT'
        DataType = ftCurrency
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'RT'
        DataType = ftInteger
        ParamType = ptInput
        Value = 0
      end>
    object fvItemCODIGO: TFDAutoIncField
      DisplayLabel = 'Item'
      DisplayWidth = 6
      FieldName = 'CODIGO'
      Origin = 'CODIGO'
      ReadOnly = True
    end
    object fvItemPEDIDO: TIntegerField
      FieldName = 'PEDIDO'
      Origin = 'PEDIDO'
      Required = True
      Visible = False
    end
    object fvItemID_PRODUTO: TIntegerField
      FieldName = 'ID_PRODUTO'
      Origin = 'ID_PRODUTO'
      Required = True
      Visible = False
    end
    object fvItemDescrição: TStringField
      DisplayWidth = 60
      FieldName = 'Descri'#231#227'o'
      Origin = '[Descri'#231#227'o]'
      Required = True
      Size = 150
    end
    object fvItemQtd: TIntegerField
      DisplayLabel = 'Quantidade'
      FieldName = 'Qtd'
      Origin = 'Qtd'
    end
    object fvItemUnitario: TBCDField
      DisplayLabel = 'Valor Unitario'
      FieldName = 'Unitario'
      Origin = 'Unitario'
      DisplayFormat = '#,0.00'
      Precision = 12
      Size = 2
    end
    object fvItemTotal: TFMTBCDField
      DisplayLabel = 'Valor Total'
      FieldName = 'Total'
      Origin = 'Total'
      DisplayFormat = '#,0.00'
      Precision = 18
      Size = 2
    end
  end
  object FtItem: TFDQuery
    Connection = FD_SQLlocal
    SQL.Strings = (
      'DECLARE @ACAO                     CHAR(1) =:AC,'
      '        @ID_ITEM_PEDIDO           INT = :IIP,'
      '        @ID_PEDIDO                INT = :IPE,'
      '        @ID_PRODUTO               INT = :IPR ,'
      '        @QTD_ITEM_PEDIDO          INT = :QT,'
      '        @VLR_ITEM_PEDIDO_UNITARIO DECIMAL(12, 2) = :VIPU,'
      '        @VLR_ITEM_PEDIDO_TOTAL    DECIMAL(18, 2) = :VIPT,'
      '        @ID_RETORN                INT = :RT'
      ''
      'EXECUTE [dbo].[Sp_iaec_item_pedido]'
      '  @ACAO,'
      '  @ID_ITEM_PEDIDO,'
      '  @ID_PEDIDO,'
      '  @ID_PRODUTO,'
      '  @QTD_ITEM_PEDIDO,'
      '  @VLR_ITEM_PEDIDO_UNITARIO,'
      '  @VLR_ITEM_PEDIDO_TOTAL,'
      '  @ID_RETORN ')
    Left = 264
    Top = 232
    ParamData = <
      item
        Name = 'AC'
        DataType = ftString
        ParamType = ptInput
        Value = 'c'
      end
      item
        Name = 'IIP'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'IPE'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'IPR'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'QT'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'VIPU'
        DataType = ftCurrency
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'VIPT'
        DataType = ftCurrency
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'RT'
        DataType = ftInteger
        ParamType = ptInput
        Value = 0
      end>
    object FtItemCODIGO: TFDAutoIncField
      DisplayLabel = 'Item'
      FieldName = 'CODIGO'
      Origin = 'CODIGO'
      ReadOnly = True
    end
    object FtItemPEDIDO: TIntegerField
      FieldName = 'PEDIDO'
      Origin = 'PEDIDO'
      Required = True
    end
    object FtItemID_PRODUTO: TIntegerField
      FieldName = 'ID_PRODUTO'
      Origin = 'ID_PRODUTO'
      Required = True
    end
    object FtItemDescrição: TStringField
      FieldName = 'Descri'#231#227'o'
      Origin = '[Descri'#231#227'o]'
      Size = 150
    end
    object FtItemQtd: TIntegerField
      FieldName = 'Qtd'
      Origin = 'Qtd'
    end
    object FtItemUnitario: TBCDField
      FieldName = 'Unitario'
      Origin = 'Unitario'
      Precision = 12
      Size = 2
    end
    object FtItemTotal: TFMTBCDField
      FieldName = 'Total'
      Origin = 'Total'
      Precision = 18
      Size = 2
    end
  end
end
