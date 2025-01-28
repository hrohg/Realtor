USE [REDB]
GO

/****** Object:  Table [dbo].[OldPrices]    Script Date: 03/29/2013 10:57:05 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[OldPrices](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[EstateID] [int] NOT NULL,
	[ChangeDate] [datetime] NOT NULL,
	[OldPrice] [bigint] NOT NULL,
	[CurrencyID] [int] NOT NULL,
 CONSTRAINT [PK_OldPrices] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

ALTER TABLE [dbo].[OldPrices]  WITH CHECK ADD  CONSTRAINT [FK_OldPrices_Currencies] FOREIGN KEY([CurrencyID])
REFERENCES [dbo].[Currencies] ([CurrencyID])
GO

ALTER TABLE [dbo].[OldPrices] CHECK CONSTRAINT [FK_OldPrices_Currencies]
GO

ALTER TABLE [dbo].[OldPrices]  WITH CHECK ADD  CONSTRAINT [FK_OldPrices_Estates] FOREIGN KEY([EstateID])
REFERENCES [dbo].[Estates] ([EstateID])
GO

ALTER TABLE [dbo].[OldPrices] CHECK CONSTRAINT [FK_OldPrices_Estates]
GO

