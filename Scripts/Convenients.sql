/*
   Thursday, March 17, 201110:58:38 AM
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
EXECUTE sp_rename N'dbo.Convenients.Name', N'Tmp_NameAm_3', 'COLUMN' 
GO
EXECUTE sp_rename N'dbo.Convenients.Tmp_NameAm_3', N'NameAm', 'COLUMN' 
GO
ALTER TABLE dbo.Convenients ADD
	NameEn nvarchar(200) NULL,
	NameRu nvarchar(200) NULL,
	NameCz nvarchar(200) NULL,
	NameKz nvarchar(200) NULL
GO
ALTER TABLE dbo.Convenients SET (LOCK_ESCALATION = TABLE)
GO
COMMIT
