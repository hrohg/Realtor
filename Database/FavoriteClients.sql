/*
   Monday, August 18, 20142:02:23 PM
   User: 
   Server: ARSEN-PC
   Database: REDBHamik
   Application: 
*/

/* To prevent any potential data loss issues, you should review this script in detail before running it outside the context of the database designer.*/
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
CREATE TABLE dbo.FavoriteClients
	(
	ID int NOT NULL IDENTITY (1, 1),
	UserID int NOT NULL,
	ClientID int NOT NULL
	)  ON [PRIMARY]
GO
ALTER TABLE dbo.FavoriteClients ADD CONSTRAINT
	PK_FavoriteClients PRIMARY KEY CLUSTERED 
	(
	ID
	) WITH( STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]

GO
ALTER TABLE dbo.FavoriteClients SET (LOCK_ESCALATION = TABLE)
GO
COMMIT
select Has_Perms_By_Name(N'dbo.FavoriteClients', 'Object', 'ALTER') as ALT_Per, Has_Perms_By_Name(N'dbo.FavoriteClients', 'Object', 'VIEW DEFINITION') as View_def_Per, Has_Perms_By_Name(N'dbo.FavoriteClients', 'Object', 'CONTROL') as Contr_Per 







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
ALTER TABLE dbo.Users SET (LOCK_ESCALATION = TABLE)
GO
COMMIT
select Has_Perms_By_Name(N'dbo.Users', 'Object', 'ALTER') as ALT_Per, Has_Perms_By_Name(N'dbo.Users', 'Object', 'VIEW DEFINITION') as View_def_Per, Has_Perms_By_Name(N'dbo.Users', 'Object', 'CONTROL') as Contr_Per BEGIN TRANSACTION
GO
ALTER TABLE dbo.NeededEstates SET (LOCK_ESCALATION = TABLE)
GO
COMMIT
select Has_Perms_By_Name(N'dbo.NeededEstates', 'Object', 'ALTER') as ALT_Per, Has_Perms_By_Name(N'dbo.NeededEstates', 'Object', 'VIEW DEFINITION') as View_def_Per, Has_Perms_By_Name(N'dbo.NeededEstates', 'Object', 'CONTROL') as Contr_Per BEGIN TRANSACTION

GO
ALTER TABLE dbo.FavoriteClients ADD CONSTRAINT
	FK_FavoriteClients_NeededEstates FOREIGN KEY
	(
	ClientID
	) REFERENCES dbo.NeededEstates
	(
	ID
	) ON UPDATE  NO ACTION 
	 ON DELETE  NO ACTION 
	
GO
ALTER TABLE dbo.FavoriteClients ADD CONSTRAINT
	FK_FavoriteClients_Users FOREIGN KEY
	(
	UserID
	) REFERENCES dbo.Users
	(
	ID
	) ON UPDATE  NO ACTION 
	 ON DELETE  NO ACTION 
	
GO
ALTER TABLE dbo.FavoriteClients SET (LOCK_ESCALATION = TABLE)
GO
COMMIT
select Has_Perms_By_Name(N'dbo.FavoriteClients', 'Object', 'ALTER') as ALT_Per, Has_Perms_By_Name(N'dbo.FavoriteClients', 'Object', 'VIEW DEFINITION') as View_def_Per, Has_Perms_By_Name(N'dbo.FavoriteClients', 'Object', 'CONTROL') as Contr_Per 





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
ALTER TABLE dbo.Estates ADD
	ChangeToBrokerDate datetime NULL
GO
ALTER TABLE dbo.Estates SET (LOCK_ESCALATION = TABLE)
GO
COMMIT
select Has_Perms_By_Name(N'dbo.Estates', 'Object', 'ALTER') as ALT_Per, Has_Perms_By_Name(N'dbo.Estates', 'Object', 'VIEW DEFINITION') as View_def_Per, Has_Perms_By_Name(N'dbo.Estates', 'Object', 'CONTROL') as Contr_Per 
