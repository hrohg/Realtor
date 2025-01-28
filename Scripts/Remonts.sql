/*
   Thursday, March 17, 201111:04:54 AM
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
EXECUTE sp_rename N'dbo.Remonts.Name', N'Tmp_NameAm_16', 'COLUMN' 
GO
EXECUTE sp_rename N'dbo.Remonts.Tmp_NameAm_16', N'NameAm', 'COLUMN' 
GO
ALTER TABLE dbo.Remonts ADD
	NameRu nvarchar(255) NULL,
	NameKz nvarchar(255) NULL,
	NameEn nvarchar(255) NULL,
	NameCz nvarchar(255) NULL
GO
ALTER TABLE dbo.Remonts SET (LOCK_ESCALATION = TABLE)
GO
COMMIT
