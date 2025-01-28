BEGIN TRANSACTION
SET QUOTED_IDENTIFIER ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ANSI_NULLS ON
SET ANSI_PADDING ON
SET ANSI_WARNINGS ON
COMMIT
BEGIN TRANSACTION
GO
ALTER TABLE dbo.NeededEstates ADD
	Email nvarchar(100) NULL
GO
ALTER TABLE dbo.NeededEstates SET (LOCK_ESCALATION = TABLE)
GO
COMMIT
select Has_Perms_By_Name(N'dbo.NeededEstates', 'Object', 'ALTER') as ALT_Per, Has_Perms_By_Name(N'dbo.NeededEstates', 'Object', 'VIEW DEFINITION') as View_def_Per, Has_Perms_By_Name(N'dbo.NeededEstates', 'Object', 'CONTROL') as Contr_Per 





/****** Object:  Table [dbo].[ClientSuggestedEstates]    Script Date: 7/5/2014 2:37:01 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[ClientSuggestedEstates](
	[EstateID] [int] NOT NULL,
	[ClientID] [int] NOT NULL,
	[SuggestDate] [datetime] NOT NULL,
	[BrokerID] [int] NULL,
	[Comment] [nvarchar](max) NULL,
 CONSTRAINT [PK_ClientSuggestedEstates] PRIMARY KEY CLUSTERED 
(
	[EstateID] ASC,
	[ClientID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO

ALTER TABLE [dbo].[ClientSuggestedEstates]  WITH CHECK ADD  CONSTRAINT [FK_ClientSuggestedEstates_ClientSuggestedEstates3] FOREIGN KEY([BrokerID])
REFERENCES [dbo].[Users] ([ID])
GO

ALTER TABLE [dbo].[ClientSuggestedEstates] CHECK CONSTRAINT [FK_ClientSuggestedEstates_ClientSuggestedEstates3]
GO

ALTER TABLE [dbo].[ClientSuggestedEstates]  WITH CHECK ADD  CONSTRAINT [FK_ClientSuggestedEstates_Estates] FOREIGN KEY([EstateID])
REFERENCES [dbo].[Estates] ([EstateID])
GO

ALTER TABLE [dbo].[ClientSuggestedEstates] CHECK CONSTRAINT [FK_ClientSuggestedEstates_Estates]
GO

ALTER TABLE [dbo].[ClientSuggestedEstates]  WITH CHECK ADD  CONSTRAINT [FK_ClientSuggestedEstates_NeededEstates] FOREIGN KEY([ClientID])
REFERENCES [dbo].[NeededEstates] ([ID])
GO

ALTER TABLE [dbo].[ClientSuggestedEstates] CHECK CONSTRAINT [FK_ClientSuggestedEstates_NeededEstates]
GO





BEGIN TRANSACTION
SET QUOTED_IDENTIFIER ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ANSI_NULLS ON
SET ANSI_PADDING ON
SET ANSI_WARNINGS ON
COMMIT
BEGIN TRANSACTION
GO
ALTER TABLE dbo.EstatesAndDemands ADD
	Comment nvarchar(MAX) NULL
GO
ALTER TABLE dbo.EstatesAndDemands SET (LOCK_ESCALATION = TABLE)
GO
COMMIT
select Has_Perms_By_Name(N'dbo.EstatesAndDemands', 'Object', 'ALTER') as ALT_Per, Has_Perms_By_Name(N'dbo.EstatesAndDemands', 'Object', 'VIEW DEFINITION') as View_def_Per, Has_Perms_By_Name(N'dbo.EstatesAndDemands', 'Object', 'CONTROL') as Contr_Per 