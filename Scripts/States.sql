/*
   Thursday, March 17, 201111:23:13 AM
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
EXECUTE sp_rename N'dbo.States.Name', N'Tmp_NameAm_22', 'COLUMN' 
GO
EXECUTE sp_rename N'dbo.States.Tmp_NameAm_22', N'NameAm', 'COLUMN' 
GO
ALTER TABLE dbo.States ADD
	NameEn nvarchar(100) NULL,
	NameRu nvarchar(100) NULL,
	NameCz nvarchar(100) NULL,
	NameKz nvarchar(100) NULL
GO
ALTER TABLE dbo.States SET (LOCK_ESCALATION = TABLE)
GO
COMMIT
