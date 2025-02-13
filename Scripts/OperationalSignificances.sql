/*
   Thursday, March 17, 201111:02:16 AM
   User: 
   Server: ARSEN-PC\SQLEXPRESS
   Database: REDB
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
EXECUTE sp_rename N'dbo.OperationalSignificances.Name', N'Tmp_NameAm_9', 'COLUMN' 
GO
EXECUTE sp_rename N'dbo.OperationalSignificances.Tmp_NameAm_9', N'NameAm', 'COLUMN' 
GO
ALTER TABLE dbo.OperationalSignificances ADD
	NameRu nvarchar(250) NULL,
	NameEn nvarchar(250) NULL,
	NameCz nvarchar(250) NULL,
	NameKz nvarchar(250) NULL
GO
ALTER TABLE dbo.OperationalSignificances SET (LOCK_ESCALATION = TABLE)
GO
COMMIT
