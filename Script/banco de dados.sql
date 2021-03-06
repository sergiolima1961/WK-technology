USE [WKTecnologia]
GO
/****** Object:  Table [dbo].[CLIENTE]    Script Date: 07/03/2021 21:02:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CLIENTE](
	[ID_CLIENTE] [int] IDENTITY(1,1) NOT NULL,
	[DSC_CLIENTE] [varchar](90) NULL,
	[ID_ENDERECO] [int] NULL,
 CONSTRAINT [PK_ENTIDADE] PRIMARY KEY NONCLUSTERED 
(
	[ID_CLIENTE] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ENDERECO]    Script Date: 07/03/2021 21:02:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ENDERECO](
	[ID_ENDERECO] [int] IDENTITY(1,1) NOT NULL,
	[CEP] [varchar](8) NULL,
	[LOGRADOURO] [varchar](50) NULL,
	[NUMERO] [varchar](10) NULL,
	[COMPLEMENTO] [varchar](20) NULL,
	[BAIRRO] [varchar](30) NULL,
	[CIDADE] [varchar](40) NULL,
	[ESTADO] [varchar](2) NULL,
 CONSTRAINT [PK_ENDERECO] PRIMARY KEY NONCLUSTERED 
(
	[ID_ENDERECO] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ITEM_PEDIDO]    Script Date: 07/03/2021 21:02:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ITEM_PEDIDO](
	[ID_ITEM_PEDIDO] [int] IDENTITY(1,1) NOT NULL,
	[ID_PEDIDO] [int] NOT NULL,
	[ID_PRODUTO] [int] NOT NULL,
	[QTD_ITEM_PEDIDO] [int] NULL,
	[VLR_ITEM_PEDIDO_UNITARIO] [decimal](12, 2) NULL,
	[VLR_ITEM_PEDIDO_TOTAL] [decimal](18, 2) NULL,
 CONSTRAINT [PK_ITEM_PEDIDO] PRIMARY KEY NONCLUSTERED 
(
	[ID_ITEM_PEDIDO] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PEDIDO]    Script Date: 07/03/2021 21:02:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PEDIDO](
	[ID_PEDIDO] [int] IDENTITY(1,1) NOT NULL,
	[ID_CLIENTE] [int] NULL,
	[VLR_PEDIDO] [decimal](18, 2) NULL,
	[DAT_PEDIDO] [datetime] NULL,
 CONSTRAINT [PK_PEDIDO] PRIMARY KEY NONCLUSTERED 
(
	[ID_PEDIDO] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PRODUTO]    Script Date: 07/03/2021 21:02:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PRODUTO](
	[ID_PRODUTO] [int] IDENTITY(1,1) NOT NULL,
	[DSC_PRODUTO] [varchar](150) NULL,
	[VLR_PRODUTO] [decimal](18, 2) NULL,
 CONSTRAINT [PK_PRODUTO] PRIMARY KEY NONCLUSTERED 
(
	[ID_PRODUTO] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ITEM_PEDIDO] ADD  DEFAULT ((0)) FOR [QTD_ITEM_PEDIDO]
GO
ALTER TABLE [dbo].[ITEM_PEDIDO] ADD  DEFAULT ((0)) FOR [VLR_ITEM_PEDIDO_UNITARIO]
GO
ALTER TABLE [dbo].[ITEM_PEDIDO] ADD  DEFAULT ((0)) FOR [VLR_ITEM_PEDIDO_TOTAL]
GO
ALTER TABLE [dbo].[PEDIDO] ADD  DEFAULT ((0)) FOR [VLR_PEDIDO]
GO
ALTER TABLE [dbo].[PEDIDO] ADD  DEFAULT (getdate()) FOR [DAT_PEDIDO]
GO
ALTER TABLE [dbo].[PRODUTO] ADD  DEFAULT ((0)) FOR [VLR_PRODUTO]
GO
ALTER TABLE [dbo].[CLIENTE]  WITH CHECK ADD  CONSTRAINT [FK_ENDERECO_ID_ENDERECO] FOREIGN KEY([ID_ENDERECO])
REFERENCES [dbo].[ENDERECO] ([ID_ENDERECO])
GO
ALTER TABLE [dbo].[CLIENTE] CHECK CONSTRAINT [FK_ENDERECO_ID_ENDERECO]
GO
ALTER TABLE [dbo].[ITEM_PEDIDO]  WITH CHECK ADD  CONSTRAINT [FK_ITEM_PEDIDO_PEDIDO] FOREIGN KEY([ID_PEDIDO])
REFERENCES [dbo].[PEDIDO] ([ID_PEDIDO])
GO
ALTER TABLE [dbo].[ITEM_PEDIDO] CHECK CONSTRAINT [FK_ITEM_PEDIDO_PEDIDO]
GO
ALTER TABLE [dbo].[ITEM_PEDIDO]  WITH CHECK ADD  CONSTRAINT [FK_ITEM_PEDIDO_PRODUTO] FOREIGN KEY([ID_PRODUTO])
REFERENCES [dbo].[PRODUTO] ([ID_PRODUTO])
GO
ALTER TABLE [dbo].[ITEM_PEDIDO] CHECK CONSTRAINT [FK_ITEM_PEDIDO_PRODUTO]
GO
/****** Object:  StoredProcedure [dbo].[SP_IAEC_CLIENTE]    Script Date: 07/03/2021 21:02:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		sergio lima
-- Create date: 06/03/2021
-- Description:	cadastro de cliente 
-- =============================================
CREATE PROCEDURE [dbo].[SP_IAEC_CLIENTE](@ACAO           CHAR(1)='C'
                                         ,@ID_ENTIDADE   [INT]
                                         ,@NOME          [VARCHAR](90)
                                         ,@ID_ENDERECO   [INT]
                                         ,@CEP           [VARCHAR](8)
                                         ,@LOGRADOURO    [VARCHAR](50)
                                         ,@NUMERO        [VARCHAR](10)
                                         ,@COMPLEMENTO   [VARCHAR](20)
                                         ,@BAIRRO        [VARCHAR](30)
                                         ,@CIDADE        [VARCHAR](40)
                                         ,@ESTADO        [VARCHAR](2)
                                         ,@ID_RETORN     INT)
AS
  BEGIN
      DECLARE @PESQUISA VARCHAR(150)=''

      /*
        Log
      */
      SET NOCOUNT ON;

      IF @ACAO = 'I'
        BEGIN
            /*
               Endereço contrato
            */
            EXECUTE [DBO].[SP_IAEC_ENDERECO]
              @ACAO,
              @ID_ENDERECO,
              @CEP,
              @LOGRADOURO,
              @NUMERO,
              @COMPLEMENTO,
              @BAIRRO,
              @CIDADE,
              @ESTADO,
              @ID_RETORN OUTPUT

            SET @ID_ENDERECO = @@IDENTITY;

            /*
             Cadastro de Contatos
            */
            INSERT [DBO].[CLIENTE]
                   ([DSC_CLIENTE]
                    ,[ID_ENDERECO])
            VALUES(@NOME
                  ,@ID_ENDERECO );

            SET @ID_RETORN = @@IDENTITY;
        END
      ELSE IF @ACAO = 'A'
        BEGIN
            /*
               Endereço contrato
            */
            EXECUTE [DBO].[SP_IAEC_ENDERECO]
              @ACAO,
              @ID_ENDERECO,
              @CEP,
              @LOGRADOURO,
              @NUMERO,
              @COMPLEMENTO,
              @BAIRRO,
              @CIDADE,
              @ESTADO,
              @ID_RETORN OUTPUT

            /*
              contrato 
            */
            UPDATE [DBO].[CLIENTE]
            SET    [DSC_CLIENTE] = @NOME
                   ,[ID_ENDERECO] = @ID_ENDERECO
            WHERE  ID_CLIENTE = @ID_ENTIDADE;
        END
      ELSE IF @ACAO = 'C'
        BEGIN
            SELECT CLI.ID_CLIENTE                             [ID]
                   ,CLI.DSC_CLIENTE                           [NOME]
                   ,CLI.ID_ENDERECO
                   ,ED.CEP
                   ,ED.LOGRADOURO
                   ,ED.NUMERO
                   ,ED.COMPLEMENTO
                   ,ED.BAIRRO
                   ,ED.CIDADE
                   ,ED.ESTADO
            FROM   [DBO].CLIENTE CLI (NOLOCK)
                   LEFT JOIN ENDERECO ED
                          ON ED.[ID_ENDERECO] = CLI.ID_ENDERECO
        END
      ELSE IF @ACAO = 'P'
        BEGIN
            SET @PESQUISA = @NOME
            SET @PESQUISA += '%'

            SELECT [ID_CLIENTE] [ID]
                   ,[DSC_CLIENTE]         [NOME]
            FROM   [DBO].[CLIENTE] (NOLOCK)
            WHERE  [DSC_CLIENTE] LIKE @PESQUISA
        END
  END 
GO
/****** Object:  StoredProcedure [dbo].[SP_IAEC_ENDERECO]    Script Date: 07/03/2021 21:02:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		sergio lima
-- Create date: 06/03/2021
-- Description:	cadastro de endereço 
-- =============================================
CREATE PROCEDURE [dbo].[SP_IAEC_ENDERECO](@ACAO             CHAR(1)='C'
                                         ,@ID_ENDERECO     [INT]
                                         ,@CEP             [VARCHAR](8)
                                         ,@LOGRADOURO      [VARCHAR](50)
                                         ,@NUMERO          [VARCHAR](10)
                                         ,@COMPLEMENTO     [VARCHAR](20)
                                         ,@BAIRRO          [VARCHAR](30)
                                         ,@CIDADE          [VARCHAR](40)
                                         ,@ESTADO          [VARCHAR](2)
                                         ,@ID_RETORN       INT OUTPUT)
AS
  BEGIN
      SET NOCOUNT ON;
                  DECLARE @ID_CEPS INT  =0


      IF @ACAO = 'I'
        BEGIN

            INSERT [DBO].[ENDERECO]
                   ([CEP]
                    ,[LOGRADOURO]
                    ,[NUMERO]
                    ,[COMPLEMENTO]
                    ,[BAIRRO]
                    ,[CIDADE]
                    ,[ESTADO]
                     )
            VALUES (@CEP
                    ,@LOGRADOURO
                    ,@NUMERO
                    ,@COMPLEMENTO
                    ,@BAIRRO
                    ,@CIDADE
                    ,@ESTADO
                     )

            SET @ID_RETORN = @@IDENTITY;
        END
      ELSE IF @ACAO = 'A'
        BEGIN


            UPDATE [DBO].[ENDERECO]
            SET    [CEP] = @CEP
                   ,[LOGRADOURO] = @LOGRADOURO
                   ,[NUMERO] = @NUMERO
                   ,[COMPLEMENTO] = @COMPLEMENTO
                   ,[BAIRRO] = @BAIRRO
                   ,[CIDADE] = @CIDADE
                   ,[ESTADO] = @ESTADO
            WHERE  ID_ENDERECO = @ID_ENDERECO
        END
      ELSE IF @ACAO = 'E'
        BEGIN
            DELETE FROM [DBO].[ENDERECO]
            WHERE  ID_ENDERECO = @ID_ENDERECO
        END
      ELSE IF @ACAO = 'C'
        BEGIN
            SELECT [ID_ENDERECO] [ID]
                   ,[CEP]
                   ,[LOGRADOURO]
                   ,[NUMERO]
                   ,[COMPLEMENTO]
                   ,[BAIRRO]
                   ,[CIDADE]
                   ,[ESTADO]
            FROM   [DBO].[ENDERECO]
            WHERE  ID_ENDERECO = @ID_ENDERECO
        END
  END 
GO
/****** Object:  StoredProcedure [dbo].[SP_IAEC_ITEM_PEDIDO]    Script Date: 07/03/2021 21:02:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:  <Author,,Name>
-- Create date: <Create Date,,>
-- Description: <Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SP_IAEC_ITEM_PEDIDO] (@ACAO                     CHAR(1)='C',
                                             @ID_ITEM_PEDIDO           INT,
                                             @ID_PEDIDO                INT,
                                             @ID_PRODUTO               INT,
                                             @QTD_ITEM_PEDIDO          INT,
                                             @VLR_ITEM_PEDIDO_UNITARIO DECIMAL(12, 2),
                                             @VLR_ITEM_PEDIDO_TOTAL    DECIMAL(18, 2),
                                             @ID_RETORN                INT)
AS
  BEGIN
      SET nocount ON;

      DECLARE @PESQUISA VARCHAR(150)=''

      IF @ACAO = 'I'
        BEGIN
            INSERT item_pedido
                   (id_pedido,
                    id_produto,
                    qtd_item_pedido,
                    vlr_item_pedido_unitario,
                    vlr_item_pedido_total)
            VALUES ( @ID_PEDIDO,
                     @ID_PRODUTO,
                     @QTD_ITEM_PEDIDO,
                     @VLR_ITEM_PEDIDO_UNITARIO,
                     ( @VLR_ITEM_PEDIDO_UNITARIO * @QTD_ITEM_PEDIDO ) );

            SET @ID_RETORN = @@IDENTITY;
        END
      ELSE IF @ACAO = 'A'
        BEGIN
            UPDATE item_pedido
            SET    id_produto = @ID_PRODUTO,
                   qtd_item_pedido = @QTD_ITEM_PEDIDO,
                   vlr_item_pedido_unitario = @VLR_ITEM_PEDIDO_UNITARIO,
                   vlr_item_pedido_total = ( @VLR_ITEM_PEDIDO_UNITARIO * @QTD_ITEM_PEDIDO )
            WHERE  id_item_pedido = @ID_ITEM_PEDIDO
                   AND id_pedido = @ID_PEDIDO

            --
            -- TOTALIZA 
            --
            SET @VLR_ITEM_PEDIDO_TOTAL = Isnull((SELECT Sum(ipe.vlr_item_pedido_total)
                                                 FROM   pedido PD
                                                        INNER JOIN item_pedido IPE
                                                                ON ipe.id_pedido = pd.id_pedido
                                                 WHERE  PD.id_pedido = @ID_PEDIDO), 0)

            UPDATE pedido
            SET    vlr_pedido = @VLR_ITEM_PEDIDO_TOTAL
            WHERE  id_pedido = @ID_PEDIDO
        --
        --
        --
        END
      ELSE IF @ACAO = 'E'
        BEGIN
            DELETE FROM item_pedido
            WHERE  id_item_pedido = @ID_ITEM_PEDIDO
                   AND id_pedido = @ID_PEDIDO
        END
      ELSE IF @ACAO = 'C'
        BEGIN
            SELECT IPE.id_item_pedido           [CODIGO],
                   IPE.id_pedido                [PEDIDO],
                   IPE.id_produto               [ID_PRODUTO],
                   PRO.dsc_produto              [Descrição],
                   IPE.qtd_item_pedido          [Qtd],
                   IPE.vlr_item_pedido_unitario [Unitario],
                   IPE.vlr_item_pedido_total    [Total]
            FROM   item_pedido IPE
                   INNER JOIN produto PRO
                           ON PRO.id_produto = IPE.id_produto
            WHERE  IPE.id_pedido = @ID_PEDIDO
            ORDER  BY 1;
        END
      ELSE IF @ACAO = 'P'
        BEGIN
            IF EXISTS(SELECT 1
                      FROM   item_pedido IPE
                      WHERE  IPE.id_pedido = @ID_PEDIDO
                             AND IPE.id_produto = @ID_PRODUTO)
              BEGIN
                  -- - Criar verificação para não deixar adicionar produto duplicado no pedido;
                  SELECT IPE.id_item_pedido           [CODIGO],
                         IPE.id_produto               [ID_PRODUTO],
                         PRO.dsc_produto              [Descrição],
                         IPE.qtd_item_pedido          [Qtd],
                         IPE.vlr_item_pedido_unitario [Unitario],
                         IPE.vlr_item_pedido_total    [Total]
                  FROM   item_pedido IPE
                         INNER JOIN produto PRO
                                 ON PRO.id_produto = IPE.id_produto
                  WHERE  IPE.id_pedido = @ID_PEDIDO
                         AND IPE.id_produto = @ID_PRODUTO;
              END
        END
  END 
GO
/****** Object:  StoredProcedure [dbo].[SP_IAEC_PEDIDO]    Script Date: 07/03/2021 21:02:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SP_IAEC_PEDIDO] @ACAO       CHAR(1) ='C',
                                       @RET        SMALLINT = 0,
                                       @BUSCA      VARCHAR(150)='',
                                       @ID_PEDIDO  INT,
                                       @ID_CLIENTE INT,
                                       @VLR_PEDIDO DECIMAL(18, 2) = 0.00,
                                       @DAT_PEDIDO DATETIME,
                                       @ID_RETORN  INT output
AS
  BEGIN
      -- SET NOCOUNT ON added to prevent extra result sets from
      -- interfering with SELECT statements.
      SET nocount ON;

      DECLARE @PESQUISA VARCHAR(150)=''

      IF @ACAO = 'I'
        BEGIN
            INSERT pedido
                   (id_cliente)
            VALUES(@ID_CLIENTE );

            SET @ID_RETORN = @@IDENTITY;
        END
      ELSE IF @ACAO = 'A'
        BEGIN
            UPDATE pedido
            SET    id_cliente = @ID_CLIENTE
            WHERE  id_pedido = @ID_PEDIDO;
        END
      ELSE IF @ACAO = 'E'
        BEGIN
            -- item
            DELETE FROM item_pedido
            WHERE  id_pedido = @ID_PEDIDO

            -- pedido
            DELETE FROM pedido
            WHERE  id_pedido = @ID_PEDIDO;
        END
      ELSE IF @ACAO = 'C'
        BEGIN
            IF @ID_PEDIDO > 0
              BEGIN
                  SELECT PED.id_pedido                          [PEDIDO],
                         PED.id_cliente                         [ID_CLIENTE],
                         CONVERT(VARCHAR(100), CLI.dsc_cliente) [NOME CLIENTE],
                         PED.vlr_pedido                         [VALOR PEDIDO],
                         PED.dat_pedido                         [DATA PEDIDO],
                         ED.cep,
                         ED.logradouro,
                         ED.numero,
                         ED.complemento,
                         ED.bairro,
                         ED.cidade,
                         ED.estado
                  FROM   pedido PED (nolock)
                         INNER JOIN cliente CLI (nolock)
                                 ON CLI.id_cliente = PED.id_cliente
                         LEFT JOIN endereco ED
                                ON ED.[id_endereco] = CLI.id_endereco
                  WHERE  PED.id_pedido = @ID_PEDIDO
              END
            ELSE
              BEGIN
                  SELECT PED.id_pedido                          [PEDIDO],
                         PED.id_cliente                         [ID_CLIENTE],
                         CONVERT(VARCHAR(100), CLI.dsc_cliente) [NOME CLIENTE],
                         PED.vlr_pedido                         [VALOR PEDIDO],
                         PED.dat_pedido                         [DATA PEDIDO],
                         ED.cep,
                         ED.logradouro,
                         ED.numero,
                         ED.complemento,
                         ED.bairro,
                         ED.cidade,
                         ED.estado
                  FROM   pedido PED (nolock)
                         INNER JOIN cliente CLI (nolock)
                                 ON CLI.id_cliente = PED.id_cliente
                         LEFT JOIN endereco ED
                                ON ED.[id_endereco] = CLI.id_endereco
                  ORDER  BY 1 DESC
              END
        END
      ELSE IF @ACAO = 'P'
        BEGIN
            -- - Fazer tratamento de erros necessários no sistema para melhor interação com o Usuário;
            -- Opção de Pesquisa de pedidos por Data , Cliente ou Código do PEDIDO
            IF @RET = -1
              BEGIN
                  SELECT PED.id_pedido                                              AS Pedido,
                         CONVERT(VARCHAR(10), Format(PED.dat_pedido, 'dd/MM/yyyy')) AS [Data Pedido],
                         PED.vlr_pedido                                             AS [Valor Pedido],
                         CONVERT(VARCHAR(70), CLI.dsc_cliente)                      AS Cliente,
                         ED.cep,
                         ED.logradouro,
                         ED.numero,
                         ED.complemento,
                         ED.bairro,
                         ED.cidade,
                         ED.estado
                  FROM   pedido PED (nolock)
                         INNER JOIN cliente CLI (nolock)
                                 ON CLI.id_cliente = PED.id_cliente
                         LEFT JOIN endereco ED
                                ON ED.[id_endereco] = CLI.id_endereco
                  ORDER  BY PED.dat_pedido DESC,
                            1
              END
            ELSE IF @RET = 1
              BEGIN
                  SET @PESQUISA = '%'
                  SET @PESQUISA += @BUSCA
                  SET @PESQUISA += '%'

                  SELECT PED.id_pedido                                              AS Pedido,
                         CONVERT(VARCHAR(10), Format(PED.dat_pedido, 'dd/MM/yyyy')) AS [Data Pedido],
                         PED.vlr_pedido                                             AS [Valor Pedido],
                         CONVERT(VARCHAR(70), CLI.dsc_cliente)                      AS Cliente,
                         ED.cep,
                         ED.logradouro,
                         ED.numero,
                         ED.complemento,
                         ED.bairro,
                         ED.cidade,
                         ED.estado
                  FROM   pedido PED (nolock)
                         INNER JOIN cliente CLI (nolock)
                                 ON PED.id_cliente = CLI.id_cliente
                         LEFT JOIN endereco ED
                                ON ED.[id_endereco] = CLI.id_endereco
                  WHERE  CLI.dsc_cliente LIKE @PESQUISA
                  ORDER  BY 2 DESC,
                            4
              END
            ELSE IF @RET = 2
              BEGIN
                  SET @PESQUISA =''
                  SET @PESQUISA += @BUSCA
                  SET @PESQUISA +=''

                  SELECT PED.id_pedido                                              AS Pedido,
                         CONVERT(VARCHAR(10), Format(PED.dat_pedido, 'dd/MM/yyyy')) AS [Data Pedido],
                         PED.vlr_pedido                                             AS [Valor Pedido],
                         CONVERT(VARCHAR(70), CLI.dsc_cliente)                      AS Cliente,
                         ED.cep,
                         ED.logradouro,
                         ED.numero,
                         ED.complemento,
                         ED.bairro,
                         ED.cidade,
                         ED.estado
                  FROM   pedido PED (nolock)
                         INNER JOIN cliente CLI (nolock)
                                 ON PED.id_cliente = CLI.id_cliente
                         LEFT JOIN endereco ED
                                ON ED.[id_endereco] = CLI.id_endereco
                  WHERE  CONVERT(DATE, PED.dat_pedido) = CONVERT(DATE, @PESQUISA)
                  ORDER  BY PED.dat_pedido DESC,
                            1
              END
        END
  END 
GO
/****** Object:  StoredProcedure [dbo].[SP_IAEC_PRODUTO]    Script Date: 07/03/2021 21:02:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SP_IAEC_PRODUTO] (@ACAO         CHAR(1)='C'
                                  ,@ID_PRODUTO  INT
                                  ,@DSC_PRODUTO VARCHAR(150)
                                  ,@VLR_PRODUTO DECIMAL(18, 2)
                                  ,@ID_RETORN   INT)
AS
  BEGIN
      -- SET NOCOUNT ON added to prevent extra result sets from
      -- interfering with SELECT statements.
      SET NOCOUNT ON;

      DECLARE @PESQUISA VARCHAR(150)=''

      IF @ACAO = 'I'
        BEGIN
            INSERT PRODUTO
                   (DSC_PRODUTO
                    ,VLR_PRODUTO)
            VALUES(@DSC_PRODUTO
                   ,@VLR_PRODUTO );

            SET @ID_RETORN = @@IDENTITY;
        END
      ELSE IF @ACAO = 'A'
        BEGIN
            UPDATE PRODUTO
            SET    DSC_PRODUTO = @DSC_PRODUTO
                   ,VLR_PRODUTO = @VLR_PRODUTO
            WHERE  ID_PRODUTO = @ID_PRODUTO;
        END
      ELSE IF @ACAO = 'E'
        BEGIN
            DELETE FROM PRODUTO
            WHERE  ID_PRODUTO = @ID_PRODUTO;
        END
      ELSE IF @ACAO = 'C'
        BEGIN
            SELECT ID_PRODUTO   [Codigo]
                   ,CONVERT(VARCHAR(30), DSC_PRODUTO ) [Produto]
                   ,VLR_PRODUTO [Valor]
            FROM   PRODUTO (NOLOCK)
			ORDER BY  2
        END
      ELSE IF @ACAO = 'P'
        BEGIN
            SET @PESQUISA = @DSC_PRODUTO
            SET @PESQUISA += '%'

            SELECT ID_PRODUTO   [Codigo]
                   ,CONVERT(VARCHAR(50), DSC_PRODUTO ) [Produto]
            FROM   PRODUTO (NOLOCK)
            WHERE  DSC_PRODUTO LIKE @PESQUISA
			ORDER BY  2
        END
  END

GO


/****** Object:  Trigger [dbo].[TGR_VENDAS_AD]    Script Date: 07/03/2021 22:41:07 ******/

CREATE TRIGGER [dbo].[TGR_VENDAS_AD]
ON [dbo].[ITEM_PEDIDO]
FOR DELETE
AS
  BEGIN
      DECLARE @VALOR DECIMAL(10, 2),
              @ID    INT

      SELECT @ID = D.ID_PEDIDO
             ,@VALOR = D.VLR_ITEM_PEDIDO_TOTAL
      FROM   DELETED D

      UPDATE PEDIDO
      SET    VLR_PEDIDO -=  isnull(@VALOR,0)  
      WHERE  ID_PEDIDO = @ID
	  
  END

GO

ALTER TABLE [dbo].[ITEM_PEDIDO] ENABLE TRIGGER [TGR_VENDAS_AD]
GO


CREATE TRIGGER [dbo].[TGR_VENDAS_AI]
ON [dbo].[ITEM_PEDIDO]
FOR INSERT
AS
  BEGIN
      DECLARE @VALOR DECIMAL(10, 2),
              @ID    INT

      SELECT @ID = I.ID_PEDIDO
             ,@VALOR = I.VLR_ITEM_PEDIDO_TOTAL
      FROM   INSERTED I

      UPDATE PEDIDO
      SET    VLR_PEDIDO += @VALOR
      WHERE  ID_PEDIDO = @ID
	  
  END

GO

ALTER TABLE [dbo].[ITEM_PEDIDO] ENABLE TRIGGER [TGR_VENDAS_AI]
GO




