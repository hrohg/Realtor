/*
   Thursday, March 17, 201111:01:13 AM
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
EXECUTE sp_rename N'dbo.EstateTypes.TypeName', N'Tmp_TypeNameAm_7', 'COLUMN' 
GO
EXECUTE sp_rename N'dbo.EstateTypes.Tmp_TypeNameAm_7', N'TypeNameAm', 'COLUMN' 
GO
ALTER TABLE dbo.EstateTypes ADD
	TypeNameEn nvarchar(255) NULL,
	TypeNameRu nvarchar(255) NULL,
	TypeNameCz nvarchar(255) NULL,
	TypeNameKz nvarchar(255) NULL
GO
ALTER TABLE dbo.EstateTypes SET (LOCK_ESCALATION = TABLE)
GO
COMMIT
