/*
   Thursday, March 17, 201111:06:13 AM
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
EXECUTE sp_rename N'dbo.SignificanceOfTheUses.Name', N'Tmp_NameAm_20', 'COLUMN' 
GO
EXECUTE sp_rename N'dbo.SignificanceOfTheUses.Tmp_NameAm_20', N'NameAm', 'COLUMN' 
GO
ALTER TABLE dbo.SignificanceOfTheUses ADD
	NameRu nvarchar(150) NULL,
	NameEn nvarchar(150) NULL,
	NameCz nvarchar(150) NULL,
	NameKz nvarchar(150) NULL
GO
ALTER TABLE dbo.SignificanceOfTheUses SET (LOCK_ESCALATION = TABLE)
GO
COMMIT
