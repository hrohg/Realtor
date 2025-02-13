CREATE DATABASE [REDB] ON  PRIMARY 
( NAME = N'REDB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL10.SQLEXPRESS\MSSQL\DATA\REDB.mdf' , SIZE = 3072KB , FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'REDB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL10.SQLEXPRESS\MSSQL\DATA\REDB_log.ldf' , SIZE = 1024KB , FILEGROWTH = 10%)
GO
ALTER DATABASE [REDB] SET COMPATIBILITY_LEVEL = 100
GO
ALTER DATABASE [REDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [REDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [REDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [REDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [REDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [REDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [REDB] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [REDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [REDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [REDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [REDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [REDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [REDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [REDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [REDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [REDB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [REDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [REDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [REDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [REDB] SET  READ_WRITE 
GO
ALTER DATABASE [REDB] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [REDB] SET  MULTI_USER 
GO
ALTER DATABASE [REDB] SET PAGE_VERIFY CHECKSUM  
GO
USE [REDB]
GO
IF NOT EXISTS (SELECT name FROM sys.filegroups WHERE is_default=1 AND name = N'PRIMARY') ALTER DATABASE [REDB] MODIFY FILEGROUP [PRIMARY] DEFAULT
GO

/****** Object:  Table [dbo].[Remonts]    Script Date: 03/31/2011 09:16:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Remonts](
	[RemontID] [int] IDENTITY(1,1) NOT NULL,
	[NameAm] [nvarchar](255) NULL,
	[SortIndex] [int] NULL,
	[IsDeleted] [bit] NULL,
	[NameRu] [nvarchar](255) NULL,
	[NameKz] [nvarchar](255) NULL,
	[NameEn] [nvarchar](255) NULL,
	[NameCz] [nvarchar](255) NULL,
 CONSTRAINT [PK_Remonts] PRIMARY KEY CLUSTERED 
(
	[RemontID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Remonts] ON
INSERT [dbo].[Remonts] ([RemontID], [NameAm], [SortIndex], [IsDeleted], [NameRu], [NameKz], [NameEn], [NameCz]) VALUES (1, N'Հին վերանորոգում', NULL, NULL, N'Старый ремонт', NULL, NULL, NULL)
INSERT [dbo].[Remonts] ([RemontID], [NameAm], [SortIndex], [IsDeleted], [NameRu], [NameKz], [NameEn], [NameCz]) VALUES (2, N'Եվրո վերանորոգում', NULL, NULL, N'Евро ремонт', NULL, NULL, NULL)
INSERT [dbo].[Remonts] ([RemontID], [NameAm], [SortIndex], [IsDeleted], [NameRu], [NameKz], [NameEn], [NameCz]) VALUES (3, N'Կապիտալ վերանորոգում', NULL, NULL, N'Капитальный ремонт', NULL, NULL, NULL)
INSERT [dbo].[Remonts] ([RemontID], [NameAm], [SortIndex], [IsDeleted], [NameRu], [NameKz], [NameEn], [NameCz]) VALUES (4, N'Վերանորոգված', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Remonts] ([RemontID], [NameAm], [SortIndex], [IsDeleted], [NameRu], [NameKz], [NameEn], [NameCz]) VALUES (5, N'Պետական վիճակ', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Remonts] ([RemontID], [NameAm], [SortIndex], [IsDeleted], [NameRu], [NameKz], [NameEn], [NameCz]) VALUES (6, N'Մաքուր  վիճակ', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Remonts] ([RemontID], [NameAm], [SortIndex], [IsDeleted], [NameRu], [NameKz], [NameEn], [NameCz]) VALUES (7, N'Միջին    վիճակ', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Remonts] ([RemontID], [NameAm], [SortIndex], [IsDeleted], [NameRu], [NameKz], [NameEn], [NameCz]) VALUES (8, N'Բարվոք  վիճակ', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Remonts] ([RemontID], [NameAm], [SortIndex], [IsDeleted], [NameRu], [NameKz], [NameEn], [NameCz]) VALUES (9, N' Նորմալ  վիճակ', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Remonts] ([RemontID], [NameAm], [SortIndex], [IsDeleted], [NameRu], [NameKz], [NameEn], [NameCz]) VALUES (10, N'Առանց ներքին հարդարման', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Remonts] ([RemontID], [NameAm], [SortIndex], [IsDeleted], [NameRu], [NameKz], [NameEn], [NameCz]) VALUES (11, N'Հին կապիտալ վերանորոգում', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Remonts] ([RemontID], [NameAm], [SortIndex], [IsDeleted], [NameRu], [NameKz], [NameEn], [NameCz]) VALUES (12, N'0-ական  վիճակ', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Remonts] ([RemontID], [NameAm], [SortIndex], [IsDeleted], [NameRu], [NameKz], [NameEn], [NameCz]) VALUES (13, N'Կոսմետիկ վերանորոգման կարիք', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Remonts] ([RemontID], [NameAm], [SortIndex], [IsDeleted], [NameRu], [NameKz], [NameEn], [NameCz]) VALUES (14, N'ՈՒնի վերանորոգման կարիք', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Remonts] ([RemontID], [NameAm], [SortIndex], [IsDeleted], [NameRu], [NameKz], [NameEn], [NameCz]) VALUES (15, N'Մասնակի վերանորոգված', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Remonts] ([RemontID], [NameAm], [SortIndex], [IsDeleted], [NameRu], [NameKz], [NameEn], [NameCz]) VALUES (16, N'Գերազանց վիճակ', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Remonts] ([RemontID], [NameAm], [SortIndex], [IsDeleted], [NameRu], [NameKz], [NameEn], [NameCz]) VALUES (17, N'Վատ վիճակ', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Remonts] ([RemontID], [NameAm], [SortIndex], [IsDeleted], [NameRu], [NameKz], [NameEn], [NameCz]) VALUES (18, N'Կոսմետիկ նորգում', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Remonts] ([RemontID], [NameAm], [SortIndex], [IsDeleted], [NameRu], [NameKz], [NameEn], [NameCz]) VALUES (19, N'Նոր  վերանորոգված', NULL, NULL, NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Remonts] OFF
/****** Object:  Table [dbo].[Roofings]    Script Date: 03/31/2011 09:16:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Roofings](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[NameAm] [nvarchar](100) NULL,
	[IsDeleted] [bit] NULL,
	[NameEn] [nvarchar](100) NULL,
	[NameRu] [nvarchar](100) NULL,
	[NameCz] [nvarchar](100) NULL,
	[NameKz] [nvarchar](100) NULL,
 CONSTRAINT [PK_Roofings] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Roofings] ON
INSERT [dbo].[Roofings] ([ID], [NameAm], [IsDeleted], [NameEn], [NameRu], [NameCz], [NameKz]) VALUES (1, N'Քարե', NULL, N'Stone', N'Каменный', NULL, NULL)
INSERT [dbo].[Roofings] ([ID], [NameAm], [IsDeleted], [NameEn], [NameRu], [NameCz], [NameKz]) VALUES (2, N'Փայտե', NULL, N'Wooden', N'Деревянный', NULL, NULL)
INSERT [dbo].[Roofings] ([ID], [NameAm], [IsDeleted], [NameEn], [NameRu], [NameCz], [NameKz]) VALUES (3, N'Բետոնե', NULL, NULL, N'Бетонный', NULL, NULL)
SET IDENTITY_INSERT [dbo].[Roofings] OFF
/****** Object:  Table [dbo].[Users]    Script Date: 03/31/2011 09:16:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
	[Family] [nvarchar](50) NULL,
	[Telephone1] [nvarchar](50) NULL,
	[Telephone2] [nvarchar](50) NULL,
	[UserName] [nvarchar](50) NULL,
	[RoleID] [int] NULL,
	[Password] [nvarchar](50) NULL,
	[IsDeleted] [bit] NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Users] ON
INSERT [dbo].[Users] ([ID], [Name], [Family], [Telephone1], [Telephone2], [UserName], [RoleID], [Password], [IsDeleted]) VALUES (1, N'Արսեն', N'Կոստանդյան', N'099300411', N'094300401', N'arsen', 1, N'111', NULL)
INSERT [dbo].[Users] ([ID], [Name], [Family], [Telephone1], [Telephone2], [UserName], [RoleID], [Password], [IsDeleted]) VALUES (27, N'admin', N'admin', N'1', N'1', N'admin', 1, N'111', NULL)
SET IDENTITY_INSERT [dbo].[Users] OFF
/****** Object:  Table [dbo].[Streets]    Script Date: 03/31/2011 09:16:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Streets](
	[StreetID] [int] IDENTITY(1,1) NOT NULL,
	[NameAm] [nvarchar](255) NULL,
	[RegionID] [int] NULL,
	[IsDeleted] [bit] NULL,
	[NameRu] [nvarchar](255) NULL,
	[NameEn] [nvarchar](255) NULL,
	[NameCz] [nvarchar](255) NULL,
	[NameKz] [nvarchar](255) NULL,
 CONSTRAINT [PK_Streets] PRIMARY KEY CLUSTERED 
(
	[StreetID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Streets] ON
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (1, N'Վաղարշյան', 1, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (2, N'Կոմիտաս', 1, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (3, N'Խաչատրյան', 1, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (5, N'Փափազյան', 1, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (6, N'Ավետյան', 1, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (10, N'Աղաբաբյան', 2, NULL, N'Агабабян', NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (20, N'Աբովյան', 3, NULL, N'Абовян', NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (21, N'Ա.Սարգսյան ', 4, NULL, N'А. Саргсян', NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (22, N'Աբելյան ', 4, NULL, N'Абелян', NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (23, N'Սեբաստիայի ', 4, NULL, N'Себастиаи', NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (24, N'Աեբաստիայի', 4, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (25, N'Ալիխանյան եղբայրներ', 4, NULL, N'Алиханян ехпаирнери', NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (26, N'Ալիխանյան եղբայրներ նրբ.', 4, NULL, N'пер. братьев Алиханян', NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (27, N'Առաքելյան', 4, NULL, N'Аракелян', NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (28, N'Արզումանյան', 4, NULL, N'Арзуманян', NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (29, N'Բաշինջաղյան ', 4, NULL, N'Башинджахян', NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (30, N'Բաշինջաղյան 1-ին նրբ.', 4, NULL, N'Башинджахян 1 пер.', NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (31, N'Բաշինջաղյան 2-րդ նրբ.', 4, NULL, N'Башинджахян 2 пер.', NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (32, N'Բաշինջաղյան փակուղի', 4, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (33, N'Բեկնազարյան', 4, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (34, N'Գ.Հակոբյանց ', 4, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (35, N'Գևորգ Չաուշի', 4, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (36, N'Եղիազարյան', 4, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (37, N'Զոհրապի', 4, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (38, N'Էստոնական', 4, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (39, N'Թերլեմեզյան', 4, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (40, N'Լենինականի նրբ.', 4, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (41, N'Լենինականի', 4, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (42, N'Լենինգրադյան', 4, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (43, N'Լուկաշին', 4, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (44, N'Լուկաշին 1-ին փող.', 4, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (45, N'Լուկաշին 2-րդ փող.', 4, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (46, N'Լուկաշին 3-րդ փող.', 4, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (47, N'Լևոնյան', 4, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (48, N'Խ.Խաչատրյան ', 4, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (49, N'Խ.Խաչատրյան փող. 1-ին նրբ.', 4, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (50, N'Խ.Խաչատրյան փող. 2-րդ նրբ.', 4, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (51, N'Կարապետյան ', 4, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (52, N'Հասմիկի ', 4, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (53, N'Մազմանյան', 4, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (54, N'Մարգարյան', 4, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (55, N'Մարգարյան 1-ին նրբ.', 4, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (56, N'Մարգարյան 2-րդ նրբ.', 4, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (57, N'Մարտիրոսյան', 4, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (58, N'Մելքումովի ', 4, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (59, N'Նազարբեկյան թաղամաս', 4, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (60, N'Նորաշեն թաղամաս', 4, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (61, N'Շինարարների ', 4, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (62, N'Շիրազի ', 4, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (63, N'Չուխաջյան', 4, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (64, N'Պարսեղովի ', 4, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (65, N'Ջանիբեկյան ', 4, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (66, N'Ռուստամյան ', 4, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (67, N'Սիլիկյան թաղամաս', 4, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (68, N'Սիլիկյան թաղամաս 10-րդ ', 4, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (69, N'Սիլիկյան թաղամաս 11-րդ ', 4, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (70, N'Սիլիկյան թաղամաս 12-րդ ', 4, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (71, N'Սիլիկյան թաղամաս 13-րդ ', 4, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (72, N'Սիլիկյան թաղամաս 1-ին', 4, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (73, N'Սիլիկյան թաղամաս 2-րդ փող.', 4, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (74, N'Սիլիկյան թաղամաս 3-րդ փող.', 4, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (75, N'Սիլիկյան թաղամաս 4-րդ փող.', 4, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (76, N'Սիլիկյան թաղամաս 5-րդ փող.', 4, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (77, N'Սիլիկյան թաղամաս 6-րդ փող.', 4, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (78, N'Սիլիկյան թաղամաս 7-րդ փող.', 4, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (79, N'Սիլիկյան թաղամաս 8-րդ փող.', 4, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (80, N'Սիլիկյան թաղամաս 9-րդ փող.', 4, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (81, N'Սիսակյան', 4, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (82, N'Սպորտի', 4, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (83, N'Վշտունու 1-ին նրբ.', 4, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (84, N'Վշտունու 2-րդ նրբ.', 4, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (85, N'Վշտունու 3-րդ նրբ.', 4, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (86, N'Վշտունու 4-րդ նրբ.', 4, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (87, N'Վշտունու ', 4, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (88, N'Ֆուչիկի 1-ին նրբ.', 4, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (89, N'Ֆուչիկի 2-րդ նրբ.', 4, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (90, N'Ֆուչիկի ', 4, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (91, N'Ա.Շահինյան ', 8, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (92, N'Ա.Շահինյան փող. 1-ին նրբ.', 8, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (93, N'Ա.Շահինյան փող. 2-րդ նրբ.', 8, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (94, N'Ա.Շահինյան փող. 3-րդ նրբ.', 8, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (95, N'Ա.Շահինյան փող. 4-րդ նրբ.', 8, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (96, N'Ա.Շահինյան փող. 5-րդ նրբ.', 8, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (97, N'Ալմա-Աթայի', 8, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (98, N'Աճառյան 1-ին փակուղի', 8, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (99, N'Աճառյան 2-րդ փակուղի', 8, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (100, N'Աշխաբադի', 8, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (101, N'Աճառյան', 8, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (102, N'Ավան-Առինջ 1-ին միկրոզանգված', 8, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (103, N'Ավան-Առինջ 2-րդ միկրոզանգված', 8, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (104, N'Ավանի 10-րդ ', 8, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (105, N'Ավանի 12-րդ ', 8, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (106, N'Ավանի 3-րդ ', 8, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (107, N'Ավանի 4-րդ ', 8, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (108, N'Ավանի 4-րդ փող. 1-ին նրբ.', 8, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (109, N'Ավանի 4-րդ փող. 2-րդ նրբ.', 8, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (110, N'Ավանի 4-րդ փող. 3-րդ նրբ.', 8, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (111, N'Ավանի 4-րդ փող. 4-րդ նրբ.', 8, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (112, N'Ավանի 5-րդ ', 8, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (113, N'Ավանի 6-րդ ', 8, NULL, NULL, NULL, NULL, NULL)
GO

INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (114, N'Ավանի 8-րդ ', 8, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (115, N'Դուշանբի ', 8, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (116, N'Դուրյան թաղամաս', 8, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (117, N'Թամրուչի ', 8, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (118, N'Թումանյան թաղամաս', 8, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (119, N'Իսահակյան թաղամաս', 8, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (120, N'Խուդյակովի', 8, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (121, N'Խուդյակովի փող. 1-ին նրբ.', 8, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (122, N'Խուդյակովի փող. 2-րդ նրբ.', 8, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (123, N'Խուդյակովի փող. 3-րդ նրբ.', 8, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (124, N'Խուդյակովի փող. 4-րդ նրբ.', 8, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (125, N'Խուդյակովի փող. 5-րդ նրբ.', 8, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (126, N'Հովհաննիսյան թաղամաս', 8, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (127, N'Մ. Բաբաջանյան ', 8, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (128, N'Մալյան ', 8, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (129, N'Ն.Սաֆարյան ', 8, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (130, N'Նարեկացու թաղամաս', 8, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (131, N'Չարենցի թաղամաս', 8, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (132, N'Սայաթ-Նովա թաղամաս', 8, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (133, N'Վարուժանի թաղամաս', 8, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (134, N'Տաշքենդի', 8, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (135, N'Քուչակի թաղամաս', 8, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (136, N'Ա.Ավետիսյան ', 1, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (137, N'Ա.Խաչատրյան', 1, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (138, N'Ա.Խաչատրյան 1-ին նրբ.', 1, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (139, N'Ադոնց', 1, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (140, N'Ազատության պող.', 1, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (141, N'Աղբյուր Սերոբի', 1, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (142, N'Այգեկցու', 1, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (143, N'Այգեձորի', 1, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (144, N'Արաբկիր 17-րդ ', 1, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (145, N'Արաբկիր 21-րդ ', 1, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (146, N'Արաբկիր 19-րդ ', 1, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (147, N'Արաբկիր 23-րդ ', 1, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (148, N'Արաբկիր 29-րդ ', 1, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (149, N'Արաբկիր 25-րդ ', 1, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (150, N'Արաբկիր 27-րդ ', 1, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (151, N'Արաբկիր 29-րդ փող. 1-ին նրբ.', 1, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (152, N'Արաբկիր 29-րդ փող. 2-րդ նրբ.', 1, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (153, N'Արաբկիր 31-րդ ', 1, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (154, N'Արաբկիր 33-րդ ', 1, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (155, N'Արաբկիր 35-րդ ', 1, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (156, N'Արաբկիր 37-րդ ', 1, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (157, N'Արաբկիր 38-րդ ', 1, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (158, N'Արաբկիր 39-րդ ', 1, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (159, N'Արաբկիր 41-րդ ', 1, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (160, N'Արաբկիր 43-րդ ', 1, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (161, N'Արաբկիր 45-րդ ', 1, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (162, N'Արաբկիր 47-րդ ', 1, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (163, N'Արաբկիր 49-րդ ', 1, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (164, N'Արաբկիր 51-րդ ', 1, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (165, N'Արաբկիր 53-րդ ', 1, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (166, N'Արծրունու', 1, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (167, N'Բաղրամյան պող. 2-րդ նրբ.', 1, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (168, N'Բաբայան', 1, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (169, N'Բաղրամյան պող. 2-րդ փակուղի', 1, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (170, N'Բաղրամյան պող. 3-րդ նրբ.', 1, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (171, N'Բարբյուսի', 1, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (172, N'Գյուլբենկյան 1-ին փակուղի', 1, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (173, N'Գյուլբենկյան ', 1, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (174, N'Գուլակյան ', 1, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (175, N'Գրիբոյեդովի', 1, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (176, N'Գրիբոյեդովի փող. 1-ին նրբ.', 1, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (177, N'Գրիբոյեդովի փող. 4-րդ նրբ.', 1, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (178, N'Դարաբաղի', 1, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (179, N'Երզնկյան', 1, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (180, N'Զարյան', 1, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (181, N'Զարյան փող. 1-ին նրբ.', 1, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (182, N'Թավրիզյան', 1, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (183, N'Թբիլիսյան խճուղի', 1, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (184, N'Խնկո Ապոր', 1, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (185, N'Կալենցի', 1, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (186, N'Կասյան', 1, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (187, N'Կիևյան', 1, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (188, N'Կիևյան փող. 2-րդ նրբ.', 1, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (189, N'Կիևյան փող. 1-ին նրբ.', 1, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (190, N'Կոմիտասի պող.', 1, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (191, N'Կոմիտասի պող. 1-ին նրբ.', 1, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (192, N'Կոմիտասի պող. 2-րդ նրբ.', 1, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (193, N'Կովկասյան ', 1, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (194, N'Հ.Ավետիսյան', 1, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (195, N'Հ.Հակոբյան', 1, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (196, N'Համբարձումյան ', 1, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (197, N'Հյուսիսային Ճառագայթ', 1, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (198, N'Հր.Քոչարի 1-ին նրբ.', 1, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (199, N'Հր.Քոչարի 2-րդ նրբ.', 1, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (200, N'Հր.Քոչարի ', 1, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (201, N'Ղափանցյան ', 1, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (202, N'Մալխասյանց ', 1, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (203, N'Մամիկոնյանց', 1, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (204, N'Մանուշյան', 1, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (205, N'Ն.Տիգրանյան', 1, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (206, N'Նիկոլ Դումանի ', 1, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (207, N'Շահսուվարյան', 1, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (208, N'Շիրվանզադեի', 1, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (209, N'Շիրվանզադեի փող. 1-ին նրբ.', 1, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (210, N'Շիրվանզադեի փող. 2-րդ նրբ.', 1, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (211, N'Շիրվանզադեի փող. 3-րդ նրբ.', 1, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (212, N'Ջեյմս Բրայսի', 1, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (213, N'Ռիգայի', 1, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (214, N'Ռիգայի փող. 1-ին նրբ.', 1, NULL, NULL, NULL, NULL, NULL)
GO

INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (215, N'Սեպուհի փողոց', 1, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (216, N'Սոսեի փողոց', 1, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (217, N'Սոսեի փող. 1-ին նրբ.', 1, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (218, N'Սոսեի փող. 2-րդ նրբ.', 1, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (219, N'Սունդուկյան', 1, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (220, N'Սևաստոպոլյան ', 1, NULL, N'', NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (221, N'Սևքարեցի Սաքոյի ', 1, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (222, N'Վաղարշյան ', 1, NULL, N'Вагаршян', NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (223, N'Վահր. Փափազյան ', 1, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (224, N'Վահր. Փափազյան փող. 2-րդ նրբ.', 1, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (225, N'Վրացական ', 1, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (226, N'Վրացական փող. 2-րդ նրբ.', 1, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (227, N'Վրացական փող. 4-րդ նրբ.', 1, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (228, N'Տոյբուխինի', 1, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (229, N'Քեռու', 1, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (230, N'Օրբելի եղբայրների ', 1, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (231, N'Դավթաշեն 1-ին թաղ.', 2, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (232, N'Դավթաշեն 2-րդ թաղ.', 2, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (233, N'Դավթաշեն 3-րդ թաղ.', 2, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (234, N'Դավթաշեն 4-րդ թաղ.', 2, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (235, N'Դավթաշենի 1-ին փող. 1-ին նրբ.', 2, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (236, N'Դավթաշենի 1-ին փող. 2-րդ նրբ.', 2, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (237, N'Դավթաշենի 10-րդ ', 2, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (238, N'Դավթաշենի 1-ին ', 2, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (239, N'Դավթաշենի 2-րդ ', 2, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (240, N'Դավթաշենի 3-րդ ', 2, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (241, N'Դավթաշենի 4-րդ', 2, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (242, N'Դավթաշենի 5-րդ', 2, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (243, N'Դավթաշենի 6րդ ', 2, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (244, N'Դավթաշենի 7-րդ ', 2, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (245, N'Դավթաշենի 8-րդ ', 2, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (246, N'Դավթաշենի 9-րդ ', 2, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (247, N'Պետրոսյան ', 2, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (248, N'Սասնա ծռեր ', 2, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (249, N'Փիրումյանների ', 2, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (250, N'Ազատամարտիկների 1-ին նրբ.', 9, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (251, N'Ազատամարտիկների 2-րդ նրբ.', 9, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (252, N'Ազատամարտիկների 3-րդ նրբ.', 9, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (253, N'Ազատամարտիկների 4-րդ նրբ.', 9, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (254, N'Ազատամարտիկների 5-րդ նրբ.', 9, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (255, N'Ազատամարտիկների պող.', 9, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (256, N'Աթոյան', 9, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (257, N'Աճեմյան ', 9, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (258, N'Աճեմյան փող. 1-ին նրբ.', 9, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (259, N'Աճեմյան փող. 2-րդ նրբ.', 9, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (260, N'Աճեմյան փող. 2-րդ փակուղի', 9, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (261, N'Աճեմյան փող. 3-րդ նրբ.', 9, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (262, N'Այվազովսկու նրբ.', 9, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (263, N'Այվազովսկու', 9, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (264, N'Ավանեսովի ', 9, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (265, N'Ավանեսովի ', 9, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (266, N'Արգիշտի թաղ.', 9, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (267, N'Արին-Բերդի ', 9, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (268, N'Արին-Բերդի փող. 1-ին նրբ.', 9, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (269, N'Արին-Բերդի փող. 2-րդ նրբ.', 9, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (270, N'Արին-Բերդի փող. 3-րդ նրբ.', 9, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (271, N'Արին-Բերդի փող. 4-րդ նրբ.', 9, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (272, N'Արին-Բերդի փող. 5-րդ նրբ.', 9, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (273, N'Արցախի պող.', 9, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (274, N'Արցախի պող. 2-րդ նրբ.', 9, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (275, N'Արցախի պող. 4-րդ նրբ.', 9, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (276, N'Արցախի պող. 5-րդ նրբ.', 9, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (277, N'Բելինսկու ', 9, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (278, N'Բեռնակիրների ', 9, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (279, N'Բուռնազյան ', 9, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (280, N'Բուռնազյան փող. 2-րդ փակ.', 9, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (281, N'Գաջեգործների 1-ին ', 9, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (282, N'Գաջեգործների 2-րդ', 9, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (283, N'Գաջեգործների 3-րդ', 9, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (284, N'Գլինկայի ', 9, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (285, N'Դաշտենցի', 9, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (286, N'Դավիթ-Բեկի', 9, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (287, N'Երկաթուղայինների 2-րդ ', 9, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (288, N'Երկաթուղայինների 3-րդ ', 9, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (289, N'Երկաթուղայինների 4-րդ ', 9, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (290, N'Երկաթուղայինների 5-րդ ', 9, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (291, N'Երկաթուղայինների 6-րդ ', 9, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (292, N'Երկաթուղայինների 7-րդ ', 9, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (293, N'Երկաթուղայինների 8-րդ ', 9, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (294, N'Երկաթուղայինների 9-րդ ', 9, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (295, N'Էրեբունի փող. 1-ին նրբ.', 9, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (296, N'Էրեբունի փող. 2-րդ նրբ.', 9, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (297, N'Էրեբունի փող. 3-րդ նրբ.', 9, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (298, N'Էրեբունու ', 9, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (299, N'Թեյշեբաինի ', 9, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (300, N'Թորամանյան', 9, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (301, N'Լիսինյան ', 9, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (302, N'Լոմոնոսովի', 9, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (303, N'Լորիս Մելիքյան', 9, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (304, N'Խաղաղ-Դոնի ', 9, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (305, N'Խորենացու փող. 2-րդ փակ.', 9, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (306, N'Խորենացու փող. 3-րդ նրբ.', 9, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (307, N'Խորենացու փող. 3-րդ փակուղի', 9, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (308, N'Խորենացու փող. 4-րդ նրբ.', 9, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (309, N'Ծատուրյան', 9, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (310, N'Ծխախոտագործների ', 9, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (311, N'Կուստոյի', 9, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (312, N'Կռիլովի', 9, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (313, N'Միչուրինի ', 9, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (314, N'Մուշավան', 9, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (315, N'Մուշավանի 1-ին ', 9, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (316, N'Մուշավանի 2-րդ ', 9, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (317, N'Մուշավանի 3-րդ', 9, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (318, N'Մուշավանի 4-րդ ', 9, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (319, N'Մուշավանի 5-րդ ', 9, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (320, N'Մուշավանի 6-րդ ', 9, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (321, N'Մուրացանի ', 9, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (322, N'Մուրացանի փող. 1-ին նրբ.', 9, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (323, N'Նոր Արեշ 11-րդ', 9, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (324, N'Նոր Արեշ 12-րդ', 9, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (325, N'Նոր Արեշ 14-րդ', 9, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (326, N'Նոր Արեշ 15-րդ', 9, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (327, N'Նոր Արեշ 16-րդ', 9, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (328, N'Նոր Արեշ 17-րդ', 9, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (329, N'Նոր Արեշ 19-րդ', 9, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (330, N'Նոր Արեշ 20-րդ', 9, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (331, N'Նոր Արեշ 22-րդ', 9, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (332, N'Նոր Արեշ 24-րդ', 9, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (333, N'Նոր Արեշ 25-րդ', 9, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (334, N'Նոր Արեշ 26-րդ', 9, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (335, N'Նոր Արեշ 27-րդ', 9, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (336, N'Նոր Արեշ 28-րդ', 9, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (337, N'Նոր Արեշ 29-րդ', 9, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (338, N'Նոր Արեշ 2-րդ', 9, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (339, N'Նոր Արեշ 31-րդ', 9, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (340, N'Նոր Արեշ 32-րդ', 9, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (341, N'Նոր Արեշ 33-րդ', 9, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (342, N'Նոր Արեշ 34-րդ', 9, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (343, N'Նոր Արեշ 35-րդ', 9, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (344, N'Նոր Արեշ 36-րդ', 9, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (345, N'Նոր Արեշ 37-րդ', 9, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (346, N'Նոր Արեշ 38-րդ', 9, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (347, N'Նոր Արեշ 39-րդ', 9, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (348, N'Նոր Արեշ 3-րդ', 9, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (349, N'Նոր Արեշ 40-րդ', 9, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (350, N'Նոր Արեշ 41-րդ', 9, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (351, N'Նոր Արեշ 42-րդ', 9, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (352, N'Նոր Արեշ 43-րդ', 9, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (353, N'Նոր Արեշ 44-րդ', 9, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (354, N'Նոր Արեշ 46-րդ', 9, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (355, N'Նոր Արեշ 48-րդ', 9, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (356, N'Նոր Արեշ 4-րդ', 9, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (357, N'Նոր Արեշ 5-րդ', 9, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (358, N'Նոր Արեշ 50-րդ', 9, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (359, N'Նոր Արեշ 7-րդ', 9, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (360, N'Նոր Արեշ 8-րդ', 9, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (361, N'Նոր Արեշ 9-րդ', 9, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (362, N'Նուբարաշեն խճ.', 9, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (363, N'Նուբարաշեն', 9, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (364, N'Որմնադիրների', 9, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (365, N'Որմնադիրների փող. 1-ին նրբ.', 9, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (366, N'Որմնադիրների փող. 2-րդ նրբ.', 9, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (367, N'Չեռնիշևսկու', 9, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (368, N'Ջրաշեն 1-ին փող. 1-ին նրբ.', 9, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (369, N'Ջրաշեն 1-ին փող. 2-րդ նրբ.', 9, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (370, N'Ջրաշեն 1-ին ', 9, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (371, N'Ռոստովյան ', 9, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (372, N'Սասունցի Դավթի ', 9, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (373, N'Սարիթաղ', 9, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (374, N'Սարիթաղ 10-րդ շարք', 9, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (375, N'Սարիթաղ 10-րդ ', 9, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (376, N'Սարիթաղ 11-րդ ', 9, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (377, N'Սարիթաղ 13-րդ ', 9, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (378, N'Սարիթաղ 12-րդ ', 9, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (379, N'Սարիթաղ 14-րդ ', 9, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (380, N'Սարիթաղ 15-րդ ', 9, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (381, N'Սարիթաղ 16-րդ ', 9, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (382, N'Սարիթաղ 17-րդ ', 9, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (383, N'Սարիթաղ 18-րդ ', 9, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (384, N'Սարիթաղ 19-րդ ', 9, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (385, N'Սարիթաղ 1-ին շարք', 9, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (386, N'Սարիթաղ 1-ին ', 9, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (387, N'Սարիթաղ 20-րդ ', 9, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (388, N'Սարիթաղ 21-րդ ', 9, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (389, N'Սարիթաղ 22-րդ ', 9, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (390, N'Սարիթաղ 23-րդ ', 9, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (391, N'Սարիթաղ 24-րդ ', 9, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (392, N'Սարիթաղ 25-րդ ', 9, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (393, N'Սարիթաղ 26-րդ ', 9, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (394, N'Սարիթաղ 27-րդ ', 9, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (395, N'Սարիթաղ 28-րդ ', 9, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (396, N'Սարիթաղ 2-րդ շարք', 9, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (397, N'Սարիթաղ 2-րդ ', 9, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (398, N'Սարիթաղ 3-րդ շարք', 9, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (399, N'Սարիթաղ 3-րդ ', 9, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (400, N'Սարիթաղ 4-րդ ', 9, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (401, N'Սարիթաղ 4-րդ շարք', 9, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (402, N'Սարիթաղ 5-րդ շարք', 9, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (403, N'Սարիթաղ 5-րդ ', 9, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (404, N'Սարիթաղ 6-րդ ', 9, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (405, N'Սարիթաղ 7-րդ ', 9, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (406, N'Սարիթաղ 6-րդ շարք', 9, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (407, N'Սարիթաղ 7-րդ շարք', 9, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (408, N'Սարիթաղ 8-րդ շարք', 9, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (409, N'Սարիթաղ 9-րդ շարք', 9, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (410, N'Սարիթաղ 8-րդ ', 9, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (411, N'Սարիթաղ 9-րդ ', 9, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (412, N'Սուվորովի', 9, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (413, N'Սևանի ', 9, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (414, N'Սևանի փող. 2-րդ փակուղի', 9, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (415, N'Վարդաշեն թաղամաս', 9, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (416, N'Վարդաշենի 10-րդ ', 9, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (417, N'Վարդաշենի 11-րդ ', 9, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (418, N'Վարդաշենի 12-րդ ', 9, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (419, N'Վարդաշենի 2-րդ ', 9, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (420, N'Վարդաշենի 3-րդ ', 9, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (421, N'Վարդաշենի 4-րդ ', 9, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (422, N'Վարդաշենի 5-րդ ', 9, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (423, N'Վարդաշենի 6-րդ ', 9, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (424, N'Վարդաշենի 7-րդ ', 9, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (425, N'Վարդաշենի 8-րդ ', 9, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (426, N'Վարդաշենի 9-րդ ', 9, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (427, N'Տիտոգրադյան ', 9, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (428, N'Տոլստոյի ', 9, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (429, N'Օստրովսկու ', 9, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (430, N'Ագաթանգեղոս', 3, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (431, N'Ադամյան ', 3, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (432, N'Ադանայի', 3, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (433, N'Աթենքի', 3, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (434, N'Ալեք Մանուկյան ', 3, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (435, N'Աղայան', 3, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (436, N'Աղյուսագործների 2-րդ փող.', 3, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (437, N'Ամիրյան ', 3, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (438, N'Այասի', 3, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (439, N'Այգեստան 10-րդ ', 3, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (440, N'Այգեստան 11-րդ ', 3, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (441, N'Այգեստան 1-ին ', 3, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (442, N'Այգեստան 2-րդ ', 3, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (443, N'Այգեստան 3-րդ ', 3, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (444, N'Այգեստան 4-րդ ', 3, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (445, N'Այգեստան 5-րդ ', 3, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (446, N'Այգեստան 7-րդ ', 3, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (447, N'Այգեստան 9-րդ ', 3, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (448, N'Անտառային', 3, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (449, N'Ասրիևի', 3, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (450, N'Արամի ', 3, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (451, N'Արգիշտի', 3, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (452, N'Արհեստավորների 1-ին ', 3, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (453, N'Արհեստավորների 2-րդ ', 3, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (454, N'Արշակունյաց ', 3, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (455, N'Արշակունյաց պող. 1-ին նրբ.', 3, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (456, N'Արշակունյաց պող. 2-րդ նրբ.', 3, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (457, N'Արշակունյաց պող. 4-րդ նրբ.', 3, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (458, N'Բաղրամյան պող.', 3, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (459, N'Բայրոնի', 3, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (460, N'Բարձրաբերդի ', 3, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (461, N'Բեյրութի', 3, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (462, N'Բուդապեշտի', 3, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (463, N'Բուզանդի', 3, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (464, N'Բրյուսովի', 3, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (465, N'Ե.Քոչարի ', 3, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (466, N'Գետառի', 3, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (467, N'Գրիգոր Լուսավորիչ ', 3, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (468, N'Գրողների ', 3, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (469, N'Գևորգ Էմինի ', 3, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (470, N'Դ.Դեմիրճյան ', 3, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (471, N'Դեղատան', 3, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (472, N'Ե.Քոչարի ', 3, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (473, N'Եզնիկ Կողբացու ', 3, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (474, N'Եկմալյան 1-ին ', 3, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (475, N'Զավարյան ', 3, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (476, N'Զարուբյան ', 3, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (477, N'Զաքյան', 3, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (478, N'Զորյան ', 3, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (479, N'Էջմիածինի հին խճ.', 3, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (480, N'Թաիրովի', 3, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (481, N'Թամանյան', 3, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (482, N'Թումանյան ', 3, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (483, N'Թումանյան փող. 2-րդ փակ.', 3, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (484, N'Ի. Ալիխանյան 1-ին փակ.', 3, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (485, N'Ի. Ալիխանյան փող.', 3, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (486, N'Իսակովի պողոտա', 3, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (487, N'Իսահակյան', 3, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (488, N'Իսրայելյան ', 3, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (489, N'Լամբրոնի ', 3, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (490, N'Լեոյի ', 3, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (491, N'Լեռ Կամսարի ', 3, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (492, N'Լուսինյանց ', 3, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (493, N'Խանջյան ', 3, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (494, N'Խորենացու ', 3, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (495, N'Խորենացու փող. 1-ին նրբ.', 3, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (496, N'Խորենացու փող. 2-րդ նրբ.', 3, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (497, N'Խորհրդարանի ', 3, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (498, N'Ծիծեռնակաբերդի ', 3, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (499, N'Ծովակալ Իսակովի', 3, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (500, N'Կարեն Դեմիրճյան', 3, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (501, N'Կիլիկիա թաղամաս', 3, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (502, N'Կողբացու ', 3, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (503, N'Կոնդի ', 3, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (504, N'Կորի ', 3, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (505, N'Կորյունի ', 3, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (506, N'Հ.Շահինյան', 3, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (507, N'Հանրապետության', 3, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (508, N'Հանրապետության փող. 2-րդ նրբ.', 3, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (509, N'Հանրապետության փող. 3-րդ նրբ.', 3, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (510, N'Հերացու ', 3, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (511, N'Հին երևանցու ', 3, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (512, N'Հյուսիսային պող.', 3, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (513, N'Հովհաննես Կոզեռնի ', 3, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (514, N'Ձորագյուղի 1-ին ', 3, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (515, N'Ձորափի ', 3, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (516, N'Ղազար Փարպեցու ', 3, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (517, N'Մայիսյան ', 3, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (518, N'Մաշտոցի պող', 3, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (519, N'Մարտի 8-ի', 3, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (520, N'Մելիք-Ադամյան', 3, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (521, N'Մհեր Մկրտչյան', 3, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (522, N'Մյասնիկյան', 3, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (523, N'Մոսկովյան ', 3, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (524, N'Նալբանդյան ', 3, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (525, N'Նար-Դոսի 1-ին նրբ.', 3, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (526, N'Նար-Դոսի 2-րդ նրբ.', 3, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (527, N'Նար-Դոսի 3-րդ նրբ.', 3, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (528, N'Նար-Դոսի ', 3, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (529, N'Նորագյուղ', 3, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (530, N'Շարա Տալյան', 3, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (531, N'Շարիմանյան ', 3, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (532, N'Չայկովսկու ', 3, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (533, N'Չարենցի ', 3, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (534, N'Չարենցի փող. 1-ին նրբ.', 3, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (535, N'Չարենցի փող. 2-րդ նրբ.', 3, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (536, N'Պարոնյան ', 3, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (537, N'Պուշկինի ', 3, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (538, N'Պռոշյան ', 3, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (539, N'Պռոշյան ', 3, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (540, N'Պրահայի ', 3, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (541, N'Ռոստոմի ', 3, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (542, N'Ռուսթավելու ', 3, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (543, N'Սախարով', 3, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (544, N'Սայաթ-Նովա պող.', 3, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (545, N'Սարալանջի ', 3, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (546, N'Սարմենի ', 3, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (547, N'Սարյան ', 3, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (548, N'Սիմեոն Երևանցու', 3, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (549, N'Սուրբ Հովհաննեսի', 3, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (550, N'Սուրենյանց ', 3, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (551, N'Սպենդարյան ', 3, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (552, N'Վ.Սարգսյան', 3, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (553, N'Վարդանանց ', 3, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (554, N'Վերֆելի ', 3, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (555, N'Վրացյան ', 3, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (556, N'Տարսոնի ', 3, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (557, N'Տերյան ', 3, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (558, N'Տիգրան Մեծի', 3, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (559, N'Տիգրան Մեծի պող. 1-ին նրբ.', 3, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (560, N'Տիգրան Մեծի պող. 1-ին փակ.', 3, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (561, N'Տիգրան Մեծի պող. 2-րդ փակ.', 3, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (562, N'Տիգրան Մեծի պող. 3-րդ նրբ.', 3, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (563, N'Տպագրիչների ', 3, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (564, N'Քաջազնունու ', 3, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (565, N'Քրիստափորի ', 3, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (566, N'Քրիստափորի փող. 1-ին նրբ.', 3, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (567, N'Քրիստափորի փող. 2-րդ նրբ.', 3, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (568, N'Քրիստափորի փող. 3-րդ նրբ.', 3, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (569, N'Օմար Խայամի փող.', 3, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (570, N'Ֆիզկուլտուրնիկների', 3, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (571, N'Ֆիրդուսի', 3, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (572, N'Ֆրիկի ', 3, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (573, N'Ա.Բաբաջանյան ', 10, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (574, N'Անդրանիկի ', 10, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (575, N'Արմին Վեգների ', 10, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (576, N'Բատիկյան ', 10, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (577, N'Գագարինի ', 10, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (578, N'Գոշի ', 10, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (579, N'Գոշի փող. 1-ին փակ.', 10, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (580, N'Գոշի փող. 2-րդ փակ.', 10, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (581, N'Գուսան Շերամի ', 10, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (582, N'Դուրյան ', 10, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (583, N'Զորավար Անդրանիկի ', 10, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (584, N'Իսրայել Օրի ', 10, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (585, N'Ծերենցի ', 10, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (586, N'Ծերենցի փող. 1-ին նրբ.', 10, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (587, N'Ծերենցի փող. 2-րդ նրբ.', 10, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (588, N'Ծերենցի փող. 3րդ նրբ.', 10, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (589, N'Ծերենցի փող. 4-րդ նրբ.', 10, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (590, N'Կուրղինյան ', 10, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (591, N'Հովնաթանի ', 10, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (592, N'Մալաթիայի ', 10, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (593, N'Մամիկոնյան ', 10, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (594, N'Մանուկյան ', 10, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (595, N'Մարտիկյան ', 10, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (596, N'Միրաքյան ', 10, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (597, N'Նոյ թաղամաս', 10, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (598, N'Շահումյան 14-րդ', 10, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (599, N'Շահումյան 16-րդ ', 10, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (600, N'Շահումյան 17-րդ', 10, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (601, N'Շահումյան 19-րդ ', 10, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (602, N'Շահումյան 1-ին ', 10, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (603, N'Շահումյան 2-րդ ', 10, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (604, N'Շահումյան 3-րդ ', 10, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (605, N'Շահումյան 3-րդ ', 10, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (606, N'Շահումյան 4-րդ փող. 1-ին նրբ.', 10, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (607, N'Շահումյան 4-րդ փող. 2-րդ նրբ.', 10, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (608, N'Շահումյան 4-րդ փող. 3-րդ նրբ.', 10, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (609, N'Շահումյան 5-րդ ', 10, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (610, N'Շահումյան 6-րդ ', 10, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (611, N'Շահումյան 7-րդ ', 10, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (612, N'Շահումյան 8-րդ ', 10, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (613, N'Շրջանայինի ', 10, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (614, N'Ոսկանյան ', 10, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (615, N'Ջամբուլի ', 10, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (616, N'Ջիվանու ', 10, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (617, N'Ռ.Մելիքյան ', 10, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (618, N'Սվաճյան ', 10, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (619, N'Վանթյան ', 10, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (620, N'Վարուժանի ', 10, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (621, N'Տիչինայի ', 10, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (622, N'Տիտովի ', 10, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (623, N'Րաֆֆու ', 10, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (624, N'Քուչակի ', 10, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (625, N'Օգանովի ', 10, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (626, N'Օտյան ', 10, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (627, N'Ա.Հովհաննիսյան ', 11, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (628, N'Բադալ Մուրադյան', 11, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (629, N'Բակունցի ', 11, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (630, N'Բաղյան ', 11, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (631, N'Բաղյան  I-ին նրբ', 11, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (632, N'Բորյան ', 11, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (633, N'Գալշոյան ', 11, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (634, N'Գայի ', 11, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (635, N'Գյուլիքևխյան ', 11, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (636, N'Գյուրջյան ', 11, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (637, N'Թոթովենցի ', 11, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (638, N'Թևոսյան ', 11, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (639, N'Լյուքսեմբուրգի ', 11, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (640, N'Լվովյան ', 11, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (641, N'Կարախանյան ', 11, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (642, N'Մայակ թաղամաս', 11, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (643, N'Մառի ', 11, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (644, N'Միկոյան ', 11, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (645, N'Մինսկի ', 11, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (646, N'Մոլդովական ', 11, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (647, N'Շոպրոնի ', 11, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (648, N'Նանսենի ', 11, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (649, N'Ջուղայի ', 11, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (650, N'Ջրվեժ թաղամաս', 11, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (651, N'Ս.Սաֆարյան ', 11, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (652, N'Ս.Քոչարյան ', 11, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (653, N'Ստեփանյան ', 11, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (654, N'Վախթանգովի ', 11, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (655, N'Վիլնյուսի ', 11, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (656, N'Արմենակ Արմենակյան ', 12, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (657, N'Արմենակյան փակուղի', 12, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (658, N'Գ.Հովսեփյան', 12, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (659, N'Խանզադյան ', 12, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (660, N'Նորքի 10-րդ', 12, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (661, N'Նորքի 11-րդ', 12, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (662, N'Նորքի 13-րդ', 12, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (663, N'Նորքի 15-րդ', 12, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (664, N'Նորքի 17-րդ', 12, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (665, N'Նորքի 1-ին ', 12, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (666, N'Նորքի 2-րդ', 12, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (667, N'Նորքի 4-րդ', 12, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (668, N'Նորքի 5-րդ', 12, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (669, N'Նորքի 6-րդ', 12, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (670, N'Նորքի 7-րդ', 12, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (671, N'Նորքի 8-րդ', 12, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (672, N'Նորքի 9-րդ', 12, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (673, N'Նորքի այգիներ ', 12, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (674, N'Նուբարաշեն 10-րդ ', 13, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (675, N'Նուբարաշեն 11-րդ ', 13, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (676, N'Նուբարաշեն 12-րդ ', 13, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (677, N'Նուբարաշեն 13-րդ ', 13, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (678, N'Նուբարաշեն 15-րդ ', 13, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (679, N'Նուբարաշեն 16-րդ ', 13, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (680, N'Նուբարաշեն 17-րդ ', 13, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (681, N'Նուբարաշեն 20-րդ ', 13, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (682, N'Նուբարաշեն 2-րդ ', 13, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (683, N'Նուբարաշեն 3-րդ ', 13, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (684, N'Նուբարաշեն 5-րդ ', 13, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (685, N'Նուբարաշեն 6-րդ ', 13, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (686, N'Նուբարաշեն 8-րդ ', 13, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (687, N'Նուբարաշեն 7-րդ ', 13, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (688, N'Նուբարաշեն 9-րդ ', 13, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (689, N'Նուբարաշեն ավան', 13, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (690, N'Նուբարաշեն ավան 1-ին ', 13, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (691, N'Չմշկածագի ', 13, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (692, N'Չնքուշի ', 13, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (693, N'Արագածի ', 14, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (694, N'Արարատյան ', 14, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (695, N'Արտաշատի խճ.', 14, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (696, N'Արտաշատի խճ. ', 14, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (697, N'Արտաշիսյան 1-ին նրբ.', 14, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (698, N'Արտաշիսյան 2-րդ նրբ.', 14, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (699, N'Արտաշիսյան 3-րդ նրբ.', 14, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (700, N'Արտաշիսյան ', 14, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (701, N'Բագրատունյաց ', 14, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (702, N'Գարեգին Նժդեհի ', 14, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (703, N'Գորգագործների ', 14, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (704, N'Գործարանային ', 14, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (705, N'Դոդոխյան ', 14, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (706, N'Եղբայրության ', 14, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (707, N'Եղբայրության ', 14, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (708, N'Եսայան ', 14, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (709, N'Թադևոսյան ', 14, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (710, N'Թաթիկ Սարյան ', 14, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (711, N'Թամանցիների', 14, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (712, N'Լ.Խաչիկյան ', 14, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (713, N'Լազոյի ', 14, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (714, N'Կաշեգործների ', 14, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (715, N'Կարա-Մուրզայի ', 14, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (716, N'Կարմիր բլուրի ', 14, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (717, N'Կույբիշևի ', 14, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (718, N'Կուրղինյան ', 14, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (719, N'Հ.Հովհաննիսյան ', 14, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (720, N'Հրազդանի ', 14, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (721, N'Ղարիբջանյան ', 14, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (722, N'Մադոյան ', 14, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (723, N'Մայիսի 9-ի ', 14, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (724, N'Մանանդյան ', 14, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (725, N'Մանթաշյան ', 14, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (726, N'Մասիսի ', 14, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (727, N'Մարկվարտի ', 14, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (728, N'Մխչյան ', 14, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (729, N'Մուսայելյան ', 14, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (730, N'Ն. Չարբախ 1-ին ', 14, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (731, N'Ն. Չարբախ 2-րդ ', 14, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (732, N'Ն. Չարբախ 3-րդ ', 14, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (733, N'Ն. Չարբախ 4-րդ ', 14, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (734, N'Ն. Չարբախ 5-րդ ', 14, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (735, N'Ն. Չարբախ 6-րդ ', 14, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (736, N'Ն. Չարբախ 7-րդ ', 14, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (737, N'Ն. Չարբախ 8-րդ ', 14, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (738, N'Ն. Չարբախ 9-րդ ', 14, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (739, N'Ն. Շենգավիթ 10-րդ ', 14, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (740, N'Ն. Շենգավիթ 11-րդ ', 14, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (741, N'Ն. Շենգավիթ 12-րդ ', 14, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (742, N'Ն. Շենգավիթ 13-րդ ', 14, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (743, N'Ն. Շենգավիթ 14-րդ ', 14, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (744, N'Ն. Շենգավիթ 3-րդ ', 14, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (745, N'Ն. Շենգավիթ 15-րդ ', 14, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (746, N'Ն. Շենգավիթ 16-րդ ', 14, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (747, N'Ն. Շենգավիթ 2-րդ ', 14, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (748, N'Ն. Շենգավիթ 3-րդ ', 14, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (749, N'Ն. Շենգավիթ 4-րդ ', 14, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (750, N'Ն. Շենգավիթ 5-րդ ', 14, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (751, N'Ն. Շենգավիթ 6-րդ ', 14, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (752, N'Ն. Շենգավիթ 7-րդ ', 14, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (753, N'Ն. Շենգավիթ 8-րդ ', 14, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (754, N'Ն. Շենգավիթ 9-րդ ', 14, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (755, N'Նորագավիթ  10-րդ ', 14, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (756, N'Նորագավիթ  11-րդ ', 14, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (757, N'Նորագավիթ  12-րդ ', 14, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (758, N'Նորագավիթ  13-րդ ', 14, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (759, N'Նորագավիթ 1-ին ', 14, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (760, N'Նորագավիթ 2-րդ ', 14, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (761, N'Նորագավիթ 3-րդ ', 14, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (762, N'Նորագավիթ 4-րդ ', 14, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (763, N'Նորագավիթ 5-րդ ', 14, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (764, N'Նորագավիթ 6-րդ ', 14, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (765, N'Նորագավիթ 7-րդ ', 14, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (766, N'Նորագավիթ 8-րդ ', 14, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (767, N'Նորագավիթ 9-րդ ', 14, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (768, N'Շահամիրյանների', 14, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (769, N'Շարուրի ', 14, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (770, N'Շիրակի ', 14, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (771, N'Շևչենկոյի ', 14, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (772, N'Չեխովի ', 14, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (773, N'Պատկանյան ', 14, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (774, N'Պոպովի ', 14, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (775, N'Ռ.Մելիքյան ', 14, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (776, N'Ս.Սարգսյան ', 14, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (777, N'Սմբատ Զորավարի ', 14, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (778, N'Տարոնցու ', 14, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (779, N'Տիմիրյազևի ', 14, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (780, N'Տրանսպորտայինների ', 14, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (781, N'Օդեսայի ', 14, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (782, N'Ֆրունզեի ', 14, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (783, N'Ա.Տիգրանյան ', 15, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (784, N'Ահարոնյան ', 15, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (785, N'Աղասու ', 15, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (786, N'Բուսաբանական ', 15, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (787, N'Գերցենի ', 15, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (788, N'Գոգոլի ', 15, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (789, N'Դավիթ Անհաղթի', 15, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (790, N'Դրոյի ', 15, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (791, N'Զաքարիա Սարկավագի', 15, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (792, N'Զեյթուն 10-րդ', 15, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (793, N'Էմինեսկու ', 15, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (794, N'Լեփսիուսի ', 15, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (795, N'Ծարավ Աղբյուրի ', 15, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (796, N'Կամարակ ', 15, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (797, N'Կարապետ Ուլնեցու ', 15, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (798, N'Հասրաթյան ', 15, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (799, N'Մ.Ավետիսյան ', 15, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (800, N'Յաղուբյան ', 15, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (801, N'Նազարեթ Սուրենյան ', 15, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (802, N'Ներսիսյան ', 15, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (803, N'Նորաշխարհյան ', 15, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (804, N'Շովրոյան ', 15, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (805, N'Ուլնեցի', 15, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (806, N'Չոլաքյան ', 15, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (807, N'Ռ.Մելիքյան ', 15, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (808, N'Ռայնիսի ', 15, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (809, N'Ռուբինյանց ', 15, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (810, N'Սևակի ', 15, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (811, N'Վահե Վահյան', 15, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (812, N'Վարշավյան ', 15, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (813, N'Վրթ. Փափազյան', 15, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (814, N'Տոնյան ', 15, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (815, N'Քանաքեռի 10-րդ', 15, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (816, N'Քանաքեռի 12-րդ', 15, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (817, N'Քանաքեռի 11-րդ', 15, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (818, N'Քանաքեռի 13-րդ', 15, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (819, N'Քանաքեռի 14-րդ', 15, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (820, N'Քանաքեռի 15-րդ', 15, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (821, N'Քանաքեռի 16-րդ', 15, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (822, N'Քանաքեռի 17-րդ', 15, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (823, N'Քանաքեռի 1-ին ', 15, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (824, N'Քանաքեռի 2-րդ ', 15, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (825, N'Քանաքեռի 3-րդ ', 15, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (826, N'Քանաքեռի 5-րդ ', 15, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (827, N'Քանաքեռի 6-րդ ', 15, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (828, N'Քանաքեռի 8-րդ ', 15, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (829, N'Քանաքեռի 9-րդ ', 15, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (830, N'Ֆանարջյան ', 15, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (831, N'Հալաբյան', 4, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (832, N'2 շղթա', 4, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (833, N'Գ3', 4, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (834, N'Բաղրամյան պող.', 1, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (835, N'16թ', 4, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (836, N'17թ', 4, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (837, N'15թ', 4, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (838, N'Էմինի', 1, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (839, N'Արղության', 1, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (840, N'Շիրազի', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (841, N'Մուշ թաղամաս', 10, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (842, N'Բաղրամյան 1 նրբանցք', 3, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (843, N'Ամառանոցային', 3, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (844, N'Լալայանց', 3, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (845, N'Բաղրամյան պող. 1-րդ փակուղի.', 1, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (846, N'Անտառային', 12, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (847, N'Այգեձոր 1-ին նրբ', 1, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (848, N'Ավագ Պետրոսյան', 3, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (849, N'Այգեստան', 3, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (850, N'Կիլիկիա թաղամաս 3 փ', 3, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (851, N'Այգեստան 6-րդ փողոց', 3, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (852, N'Դ. Դեմիրճյան փակուղի', 3, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (853, N'Մերգելյանի ', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (854, N'Ալեք Մանուկյան', 3, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (855, N'Բաղրամյան 1 նրբ', 3, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (856, N'Հ. Էմինի', 1, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (857, N'Կուտուզովի փ', 1, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (858, N'Բակունցի փ', 1, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (859, N'Գայդարի փ', 1, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (860, N'Բաղրամյան պող', 1, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (861, N'Արշակունյաց պող', 14, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (862, N'Վ. Սուրենյան', 1, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (863, N'Ավան-Առիջ', 8, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (864, N'Ծարավ Աղբյուր', 8, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (865, N' Դմիտրով 2 նրբ', 9, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (866, N'Տիգրան Մեծի պող.', 9, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (867, N'Ռոստոմյան', 10, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (868, N'Ռոստոմի', 10, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (869, N'Ա. Սարգսյան', 10, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (870, N'Նուբարաշեն', 13, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (871, N'Նուբարաշեն 6-րդ փող, 1 նրբ', 13, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (872, N'Մանթաշյան 1 նրբ', 14, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (873, N'Արշակունյաց պող.', 14, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (874, N'Բագրատունյաց  4 նրբ', 14, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (875, N'Թբիլիսյան խճուղի', 15, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (876, N'Բաբայան', 15, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (877, N'Ազատության պող.', 15, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (878, N'Ազատության նրբ', 15, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (879, N'Սուրենյանց', 15, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (880, N'Բրյուսովի ', 3, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (881, N'Կիլիկիա թաղ.,Սիսվան 5', 3, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (882, N'Թաիրով 5', 3, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (883, N'Կիլիկիա թաղ. 5 փ', 3, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (884, N'Ալավերդյան', 3, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (885, N'Գ. Արծրունու', 1, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (886, N'Սևքարեցի Սաքոյի', 1, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (887, N'Զարոբյան', 1, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (888, N'Ազատության 2-րդ նրբ', 15, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (889, N'Բրյուսով թաղամաս', 8, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (890, N'Ավան 7-րդ փ', 8, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (891, N'Տիգրան Պետրոսյան ', 2, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (892, N'Գևորգ Չաուշ', 2, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (893, N'Գևորգ Չաուշ I-ին գիծ', 2, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (894, N'Դմիտրով', 9, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (895, N'Նոր Արեշ', 9, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (896, N'4 զանգված,6-րդ թաղամաս', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (897, N'Խորենացի', 9, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (898, N'Նոր Արեշ Ափոյան փ', 9, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (899, N'Միքայելյան', 10, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (900, N'Սեբաստիայի', 10, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (901, N'Արգավանդի 4 փ', 10, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (902, N'Իսակովի պող.', 10, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (903, N'Դավիթ Բեկի', 12, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (904, N'Կարապետ Ուլնեցու 1-ին փակուղի', 15, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (905, N'Մինաս Ավետիսյան 1', 15, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (906, N'Մինաս Ավետիսյան 4', 15, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (907, N'Լեփսիուսի 6', 15, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (908, N'Մելքոնյան', 15, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (909, N'Մինաս Ավետիսան 2', 15, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (910, N'Կարապետ Ուլնեցու 3 փակուղի', 15, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (911, N'Կարապետ Ուլնեցու 2 փակուղի', 15, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (912, N'Դ. Մալյան', 11, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (913, N'Նանսենի I-ին նրբ', 11, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (914, N'Բագրևանդ', 11, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (915, N'Նանսենի I-ին նրբ', 11, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (916, N'Քոչաչյան 6', 11, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (917, N'Շոպրոնի 3 նրբ', 11, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (918, N'Դավիթ Բեկ', 11, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (919, N'Շահվերդյան', 14, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (920, N'Ս. Տարոնցի նրբ.', 14, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (921, N'Նեզամի', 14, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (922, N'Բագրատունյանց 1 նրբ', 14, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (923, N'Շեվչենկո', 14, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (924, N'Նոր Խարբերդ 7 փ', 14, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (925, N'Խարբերդ', 14, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (926, N'Կատովսկու', 14, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (927, N'Խարբերդ  9 փ', 14, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (928, N'Նուբարաշեն I, 6նրբ.', 13, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (929, N'Մասիսի 2 նրբ', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (930, N'17', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (931, N'Թթաստան', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (932, N'Արտաշավան', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (933, N'Սայաթ-Նովա ', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (934, N'Արագած զ/գ', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (935, N'Հովսեփյան', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (936, N'Շահումյան', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (937, N'I-ին նրբ', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (938, N'Պ. Սևակի', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (939, N'3 փ', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (940, N'12', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (941, N'2 թաղ', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (942, N'Բագրևանդ', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (943, N'Կիլիկիա թաղամաս', 3, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (944, N'Կիլիկիա թաղ. 2 փ', 3, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (945, N'Վերին Շենգավիթ 11 փ', 14, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (946, N'Շիրակացի', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (947, N'Խորենացի I-ին փակուղի', 3, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (948, N'Նորքի 6-րդ փող. I-ին նրբ.', 12, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (949, N'Նոր Խարբերդ 12 փ', 14, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (950, N'Շիրակի 3 նրբ', 14, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (951, N'Վասպուրական', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (952, N'Նորագավիթի խճուղի', 14, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (953, N'Արաբկիր 1 փող.', 1, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (954, N'Միրաքյան', 4, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (955, N'Մելիք Մելիքյան', 10, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (956, N'Ն. Շենգավիթ', 14, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (957, N'Գլինկայի 1 նրբ', 9, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (958, N'Վասիլև 116', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (959, N'Արգավանդ 2-րդ գի', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (960, N'Արղության I-ին նրբ', 1, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (961, N'Ջրաշատ', 3, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (962, N'14-րդ թաղ', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (963, N'Մհեր Մկրտչյան', 8, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (964, N'27 փողոց', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (965, N'Խորենացի 3-րդ փակուղի', 3, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (966, N'Նորքի 1 նրբ', 12, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (967, N'Սուրենյանց 8-րդ փող.', 15, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (968, N'9-րդ փողոց', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (969, N'14 փողոց,4 նրբ', 8, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (970, N'16 թաղաաս,1 -ի շղթա', 4, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (971, N'Հ. Բաղրամյան ', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (972, N'Պտղնի այգեզանգված,1 թաղ', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (973, N'Այնթափ 232', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (974, N'Նաիրյան 2 նրբ', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (975, N'կենտրոնական թաղամաս', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (976, N'Չելյուսկինցիների', 3, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (977, N'Բարեկամության', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (978, N'Երևանյան խճուղի', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (979, N'Երևանյան խճուղի', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (980, N'5-րդ փողոց', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (981, N'Գ 1 թաղամաս', 4, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (982, N'Չի նշված', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (983, N'Թումանյան անցուղի', 3, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (984, N'9-րդ շարք', 3, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (985, N'Տոնականյան ', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (986, N'Սևանի', 3, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (987, N'Արարատյան 1 զանգված', 10, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Streets] ([StreetID], [NameAm], [RegionID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (988, N'Ծխախոտագործների', 3, NULL, NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Streets] OFF
/****** Object:  Table [dbo].[States]    Script Date: 03/31/2011 09:16:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[States](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[NameAm] [nvarchar](100) NULL,
	[IsDeleted] [bit] NULL,
	[NameEn] [nvarchar](100) NULL,
	[NameRu] [nvarchar](100) NULL,
	[NameCz] [nvarchar](100) NULL,
	[NameKz] [nvarchar](100) NULL,
 CONSTRAINT [PK_States] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[States] ON
INSERT [dbo].[States] ([ID], [NameAm], [IsDeleted], [NameEn], [NameRu], [NameCz], [NameKz]) VALUES (1, N'Երևան', NULL, N'Yerevan', N'Ереван', NULL, NULL)
INSERT [dbo].[States] ([ID], [NameAm], [IsDeleted], [NameEn], [NameRu], [NameCz], [NameKz]) VALUES (2, N'Կոտայք', NULL, N'Kotayk', N'Котайк', NULL, NULL)
INSERT [dbo].[States] ([ID], [NameAm], [IsDeleted], [NameEn], [NameRu], [NameCz], [NameKz]) VALUES (3, N'Արագածոտն', NULL, N'Aragatsotn', N'Арагацотн', NULL, NULL)
INSERT [dbo].[States] ([ID], [NameAm], [IsDeleted], [NameEn], [NameRu], [NameCz], [NameKz]) VALUES (4, N'Արարատ', NULL, N'Ararat', N'Арарат', NULL, NULL)
INSERT [dbo].[States] ([ID], [NameAm], [IsDeleted], [NameEn], [NameRu], [NameCz], [NameKz]) VALUES (5, N'Արմավիր', NULL, N'Armavir', N'Армавир', NULL, NULL)
INSERT [dbo].[States] ([ID], [NameAm], [IsDeleted], [NameEn], [NameRu], [NameCz], [NameKz]) VALUES (6, N'Գեղարքունիք', NULL, N'Gegharquniq', N'Гегаркуник', NULL, NULL)
INSERT [dbo].[States] ([ID], [NameAm], [IsDeleted], [NameEn], [NameRu], [NameCz], [NameKz]) VALUES (7, N'Լոռի', NULL, N'Lory', N'Лори', NULL, NULL)
INSERT [dbo].[States] ([ID], [NameAm], [IsDeleted], [NameEn], [NameRu], [NameCz], [NameKz]) VALUES (8, N'Շիրակ', NULL, N'Shirak', N'Ширак', NULL, NULL)
INSERT [dbo].[States] ([ID], [NameAm], [IsDeleted], [NameEn], [NameRu], [NameCz], [NameKz]) VALUES (9, N'Սյունիք', NULL, N'Syunik', N'Сюник', NULL, NULL)
INSERT [dbo].[States] ([ID], [NameAm], [IsDeleted], [NameEn], [NameRu], [NameCz], [NameKz]) VALUES (10, N'Տավուշ', NULL, N'Tavoush', N'Тавуш', NULL, NULL)
INSERT [dbo].[States] ([ID], [NameAm], [IsDeleted], [NameEn], [NameRu], [NameCz], [NameKz]) VALUES (11, N'Վայոց ձոր', NULL, N'Vayots Dzor', N'Вайоц Дзор', NULL, NULL)
SET IDENTITY_INSERT [dbo].[States] OFF
/****** Object:  Table [dbo].[Projects]    Script Date: 03/31/2011 09:16:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Projects](
	[ProjectID] [int] IDENTITY(1,1) NOT NULL,
	[NameAm] [nvarchar](255) NULL,
	[SortIndex] [int] NULL,
	[IsDeleted] [bit] NULL,
	[NameRu] [nvarchar](255) NULL,
	[NameEn] [nvarchar](255) NULL,
	[NameCz] [nvarchar](255) NULL,
	[NameKz] [nvarchar](50) NULL,
 CONSTRAINT [PK_Projects] PRIMARY KEY CLUSTERED 
(
	[ProjectID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Projects] ON
INSERT [dbo].[Projects] ([ProjectID], [NameAm], [SortIndex], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (1, N'Ստալինյան', NULL, 0, N'Сталинский', NULL, NULL, NULL)
INSERT [dbo].[Projects] ([ProjectID], [NameAm], [SortIndex], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (2, N'Խրուշչովյան', NULL, NULL, N'Хрущевский', NULL, NULL, NULL)
INSERT [dbo].[Projects] ([ProjectID], [NameAm], [SortIndex], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (3, N'Հետ Խրուշչովյան', NULL, NULL, N'Пос Хрущевский', NULL, NULL, NULL)
INSERT [dbo].[Projects] ([ProjectID], [NameAm], [SortIndex], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (4, N'Չեխական', NULL, NULL, N'Чешский', NULL, NULL, NULL)
INSERT [dbo].[Projects] ([ProjectID], [NameAm], [SortIndex], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (5, N'Բադալյան', NULL, NULL, N'Бадалян', NULL, NULL, NULL)
INSERT [dbo].[Projects] ([ProjectID], [NameAm], [SortIndex], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (6, N'Մոսկովյան', NULL, NULL, N'Московский', NULL, NULL, NULL)
INSERT [dbo].[Projects] ([ProjectID], [NameAm], [SortIndex], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (7, N'Երևանյան', NULL, NULL, N'Ереванский', NULL, NULL, NULL)
INSERT [dbo].[Projects] ([ProjectID], [NameAm], [SortIndex], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (8, N'Վրացական', NULL, NULL, N'Грузинский', NULL, NULL, NULL)
INSERT [dbo].[Projects] ([ProjectID], [NameAm], [SortIndex], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (9, N'Հատուկ Նախագիծ', NULL, NULL, N'Специальный проект', NULL, NULL, NULL)
INSERT [dbo].[Projects] ([ProjectID], [NameAm], [SortIndex], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (10, N'Բրեժնևյան', NULL, NULL, N'Брежневский', NULL, NULL, NULL)
INSERT [dbo].[Projects] ([ProjectID], [NameAm], [SortIndex], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (11, N'Լենինգրադյան', NULL, NULL, N'Ленинградский', NULL, NULL, NULL)
INSERT [dbo].[Projects] ([ProjectID], [NameAm], [SortIndex], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (12, N' Հատուկ նախագիծ', NULL, 1, NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Projects] OFF
/****** Object:  Table [dbo].[OrderTypes]    Script Date: 03/31/2011 09:16:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderTypes](
	[OrderTypeID] [int] IDENTITY(1,1) NOT NULL,
	[NameAm] [nvarchar](255) NULL,
	[SortIndex] [int] NULL,
	[IsDeleted] [bit] NULL,
	[NameEn] [nvarchar](255) NULL,
	[NameRu] [nvarchar](255) NULL,
	[NameCz] [nvarchar](255) NULL,
	[NameKz] [nvarchar](255) NULL,
 CONSTRAINT [PK_OrderTypes] PRIMARY KEY CLUSTERED 
(
	[OrderTypeID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[OrderTypes] ON
INSERT [dbo].[OrderTypes] ([OrderTypeID], [NameAm], [SortIndex], [IsDeleted], [NameEn], [NameRu], [NameCz], [NameKz]) VALUES (1, N'Վաճառվում է', NULL, NULL, N'Sell', N'Продается', NULL, NULL)
INSERT [dbo].[OrderTypes] ([OrderTypeID], [NameAm], [SortIndex], [IsDeleted], [NameEn], [NameRu], [NameCz], [NameKz]) VALUES (2, N'Վարձով', NULL, NULL, N'Rent', N'В аренду', NULL, NULL)
SET IDENTITY_INSERT [dbo].[OrderTypes] OFF
/****** Object:  Table [dbo].[BuildingTypes]    Script Date: 03/31/2011 09:16:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BuildingTypes](
	[BuildingTypeID] [int] IDENTITY(1,1) NOT NULL,
	[NameAm] [nvarchar](255) NULL,
	[SortIndex] [int] NULL,
	[IsDeleted] [bit] NULL,
	[NameRu] [nvarchar](255) NULL,
	[NameEn] [nvarchar](255) NULL,
	[NameCz] [nvarchar](255) NULL,
	[NameKz] [nvarchar](255) NULL,
 CONSTRAINT [PK_BuildingTypes] PRIMARY KEY CLUSTERED 
(
	[BuildingTypeID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[BuildingTypes] ON
INSERT [dbo].[BuildingTypes] ([BuildingTypeID], [NameAm], [SortIndex], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (1, N'Պանելային', NULL, NULL, N'Панельное', N'Panel', N'Panel cz', NULL)
INSERT [dbo].[BuildingTypes] ([BuildingTypeID], [NameAm], [SortIndex], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (2, N'Մոնոլիտ', NULL, NULL, N'Монолит', N'Monolith', NULL, NULL)
INSERT [dbo].[BuildingTypes] ([BuildingTypeID], [NameAm], [SortIndex], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (3, N'Նորակառույց', NULL, NULL, N'Новостройка', N'New building', NULL, NULL)
INSERT [dbo].[BuildingTypes] ([BuildingTypeID], [NameAm], [SortIndex], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (4, N'Կասետային', NULL, NULL, N'Касетное', N'Cassette', NULL, NULL)
INSERT [dbo].[BuildingTypes] ([BuildingTypeID], [NameAm], [SortIndex], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (5, N'Քարե', NULL, NULL, N'Каменное', N'Stone', NULL, NULL)
INSERT [dbo].[BuildingTypes] ([BuildingTypeID], [NameAm], [SortIndex], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (6, N'Խոշոր պանելային', NULL, NULL, N'Խոշոր պանելային', NULL, NULL, NULL)
INSERT [dbo].[BuildingTypes] ([BuildingTypeID], [NameAm], [SortIndex], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (7, N'Ստալինյան բետոնե', NULL, NULL, N'Ստալինյան բետոնե', NULL, NULL, NULL)
INSERT [dbo].[BuildingTypes] ([BuildingTypeID], [NameAm], [SortIndex], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (8, N'Ստալինյան փայտե', NULL, NULL, N'Ստալինյան փայտե', NULL, NULL, NULL)
INSERT [dbo].[BuildingTypes] ([BuildingTypeID], [NameAm], [SortIndex], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (9, N'Նախաստալինյան', NULL, NULL, N'Նախաստալինյան', NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[BuildingTypes] OFF
/****** Object:  Table [dbo].[EstateTypes]    Script Date: 03/31/2011 09:16:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EstateTypes](
	[EstateTypeID] [int] IDENTITY(1,1) NOT NULL,
	[TypeNameAm] [nvarchar](255) NOT NULL,
	[SortIndex] [int] NULL,
	[IsDeleted] [bit] NULL,
	[TypeNameEn] [nvarchar](255) NULL,
	[TypeNameRu] [nvarchar](255) NULL,
	[TypeNameCz] [nvarchar](255) NULL,
	[TypeNameKz] [nvarchar](255) NULL,
 CONSTRAINT [PK_EstateTypes] PRIMARY KEY CLUSTERED 
(
	[EstateTypeID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[EstateTypes] ON
INSERT [dbo].[EstateTypes] ([EstateTypeID], [TypeNameAm], [SortIndex], [IsDeleted], [TypeNameEn], [TypeNameRu], [TypeNameCz], [TypeNameKz]) VALUES (1, N'Բնակարան', 1, NULL, N'Apartment', N'Квартира', NULL, NULL)
INSERT [dbo].[EstateTypes] ([EstateTypeID], [TypeNameAm], [SortIndex], [IsDeleted], [TypeNameEn], [TypeNameRu], [TypeNameCz], [TypeNameKz]) VALUES (2, N'Առանձնատուն', 2, NULL, N'House', N'Собственный дом', NULL, NULL)
INSERT [dbo].[EstateTypes] ([EstateTypeID], [TypeNameAm], [SortIndex], [IsDeleted], [TypeNameEn], [TypeNameRu], [TypeNameCz], [TypeNameKz]) VALUES (3, N'Հողատարածք', 3, NULL, N'Earth place', N'Земельный участок', NULL, NULL)
INSERT [dbo].[EstateTypes] ([EstateTypeID], [TypeNameAm], [SortIndex], [IsDeleted], [TypeNameEn], [TypeNameRu], [TypeNameCz], [TypeNameKz]) VALUES (4, N'Կոմերցիոն տարածք', 4, NULL, N'Commercial place', N'Коммерческий участок', NULL, NULL)
SET IDENTITY_INSERT [dbo].[EstateTypes] OFF
/****** Object:  Table [dbo].[Currencies]    Script Date: 03/31/2011 09:16:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Currencies](
	[CurrencyID] [int] IDENTITY(1,1) NOT NULL,
	[NameAm] [nvarchar](50) NOT NULL,
	[ValueInAMD] [int] NOT NULL,
	[IsDeleted] [bit] NULL,
	[NameRu] [nvarchar](50) NULL,
	[NameEn] [nvarchar](50) NULL,
	[NameCz] [nvarchar](50) NULL,
	[NameKz] [nvarchar](50) NULL,
 CONSTRAINT [PK_Currencies] PRIMARY KEY CLUSTERED 
(
	[CurrencyID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Currencies] ON
INSERT [dbo].[Currencies] ([CurrencyID], [NameAm], [ValueInAMD], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (1, N'Դրամ', 1, NULL, N'Драм', N'AMD', N'AMD cz', NULL)
INSERT [dbo].[Currencies] ([CurrencyID], [NameAm], [ValueInAMD], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (3, N'EUR', 463, 0, N'ЕВР', N'EUR', N'EUR cz', NULL)
INSERT [dbo].[Currencies] ([CurrencyID], [NameAm], [ValueInAMD], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (4, N'RR', 12, 1, N'РР', NULL, NULL, NULL)
INSERT [dbo].[Currencies] ([CurrencyID], [NameAm], [ValueInAMD], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (7, N'USD', 365, NULL, N'СШД', N'USD', N'UDS cz', NULL)
SET IDENTITY_INSERT [dbo].[Currencies] OFF
/****** Object:  Table [dbo].[Convenients]    Script Date: 03/31/2011 09:16:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Convenients](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[NameAm] [nvarchar](200) NOT NULL,
	[NameEn] [nvarchar](200) NULL,
	[NameRu] [nvarchar](200) NULL,
	[NameCz] [nvarchar](200) NULL,
	[NameKz] [nvarchar](200) NULL,
 CONSTRAINT [PK_Convenients] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Convenients] ON
INSERT [dbo].[Convenients] ([ID], [NameAm], [NameEn], [NameRu], [NameCz], [NameKz]) VALUES (1, N'Խանութի', N'Shop', N'Магазина', NULL, NULL)
INSERT [dbo].[Convenients] ([ID], [NameAm], [NameEn], [NameRu], [NameCz], [NameKz]) VALUES (2, N'Գրասենյակի', N'Office', N'Оффиса', NULL, NULL)
INSERT [dbo].[Convenients] ([ID], [NameAm], [NameEn], [NameRu], [NameCz], [NameKz]) VALUES (3, N'Արտադրամասի', N'Production', N'Производства', NULL, NULL)
INSERT [dbo].[Convenients] ([ID], [NameAm], [NameEn], [NameRu], [NameCz], [NameKz]) VALUES (4, N'Բառի', N'Bar', N'Бара', NULL, NULL)
INSERT [dbo].[Convenients] ([ID], [NameAm], [NameEn], [NameRu], [NameCz], [NameKz]) VALUES (5, N'Ռեստորանի', N'Restaurant', N'Ресторана', NULL, NULL)
INSERT [dbo].[Convenients] ([ID], [NameAm], [NameEn], [NameRu], [NameCz], [NameKz]) VALUES (6, N'Սրճարանի', N'Cafe', N'Кафе', NULL, NULL)
INSERT [dbo].[Convenients] ([ID], [NameAm], [NameEn], [NameRu], [NameCz], [NameKz]) VALUES (7, N'Բիստրոի', N'Bistro', N'Бистро', NULL, NULL)
INSERT [dbo].[Convenients] ([ID], [NameAm], [NameEn], [NameRu], [NameCz], [NameKz]) VALUES (8, N'Բանկի', N'Bank', N'Банка', NULL, NULL)
SET IDENTITY_INSERT [dbo].[Convenients] OFF
/****** Object:  Table [dbo].[Cities]    Script Date: 03/31/2011 09:16:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cities](
	[CityID] [int] IDENTITY(1,1) NOT NULL,
	[NameAm] [nvarchar](255) NULL,
	[StateID] [int] NULL,
	[IsDeleted] [bit] NULL,
	[NameRu] [nvarchar](255) NULL,
	[NameEn] [nvarchar](255) NULL,
	[NameCz] [nvarchar](255) NULL,
	[NameKz] [nvarchar](255) NULL,
 CONSTRAINT [PK_Cities] PRIMARY KEY CLUSTERED 
(
	[CityID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Cities] ON
INSERT [dbo].[Cities] ([CityID], [NameAm], [StateID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (1, N'Երևան', 1, NULL, N'Ереван', N'Yerevan', N'Yerevan (cz)', N'Yerevan')
INSERT [dbo].[Cities] ([CityID], [NameAm], [StateID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (2, N'Աբովյան', 2, NULL, N'Абовян', N'Abovyan', NULL, NULL)
INSERT [dbo].[Cities] ([CityID], [NameAm], [StateID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (4, N'Աշտարակ ', 3, NULL, N'Аштарак', N'Ashtarak', NULL, NULL)
INSERT [dbo].[Cities] ([CityID], [NameAm], [StateID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (5, N'Ապարան ', 3, NULL, N'Апаран', N'Aparan', NULL, NULL)
INSERT [dbo].[Cities] ([CityID], [NameAm], [StateID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (6, N'Թալին', 3, NULL, N'Талин', N'Talin', NULL, NULL)
INSERT [dbo].[Cities] ([CityID], [NameAm], [StateID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (7, N'Արտաշատ ', 4, NULL, N'Арташат', N'Artashat', NULL, NULL)
INSERT [dbo].[Cities] ([CityID], [NameAm], [StateID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (8, N'Արարատ ', 4, NULL, N'Арарат', N'Ararat', NULL, NULL)
INSERT [dbo].[Cities] ([CityID], [NameAm], [StateID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (9, N'Մասիս ', 4, NULL, N'Масис', N'Masis', NULL, NULL)
INSERT [dbo].[Cities] ([CityID], [NameAm], [StateID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (10, N'Վեդի', 4, NULL, N'Веди', N'Vedi', NULL, NULL)
INSERT [dbo].[Cities] ([CityID], [NameAm], [StateID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (11, N'Արմավիր', 5, NULL, N'Армавир', N'Armavir', NULL, NULL)
INSERT [dbo].[Cities] ([CityID], [NameAm], [StateID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (12, N'Գավառ', 5, NULL, N'Гавар', N'Gavar', NULL, NULL)
INSERT [dbo].[Cities] ([CityID], [NameAm], [StateID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (13, N'Հրազդան', 2, NULL, N'Раздан', N'Hrazdan', NULL, NULL)
INSERT [dbo].[Cities] ([CityID], [NameAm], [StateID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (14, N'Վանաձոր', 7, NULL, N'Ванадзор', N'Vanadzor', NULL, NULL)
INSERT [dbo].[Cities] ([CityID], [NameAm], [StateID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (15, N'Ալավերդի', 7, NULL, N'Алаверди', N'Alaverdi', NULL, NULL)
INSERT [dbo].[Cities] ([CityID], [NameAm], [StateID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (16, N'Ախթալա', 7, NULL, N'Ахтала', N'Akhtala', NULL, NULL)
INSERT [dbo].[Cities] ([CityID], [NameAm], [StateID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (17, N'Թումանյան', 7, NULL, N'Туманян', N'Tumanyan', NULL, NULL)
INSERT [dbo].[Cities] ([CityID], [NameAm], [StateID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (18, N'Շամլուղ', 7, NULL, N'Шамлух', N'Shamlukh', NULL, NULL)
INSERT [dbo].[Cities] ([CityID], [NameAm], [StateID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (19, N'Սպիտակ', 7, NULL, N'Спитак', N'Spitak', NULL, NULL)
INSERT [dbo].[Cities] ([CityID], [NameAm], [StateID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (20, N'Ստեփանավան', 7, NULL, N'Степанаван', N'Stepanavan', NULL, NULL)
INSERT [dbo].[Cities] ([CityID], [NameAm], [StateID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (21, N'Տաշիր', 7, NULL, N'Ташир', N'Tashir', NULL, NULL)
INSERT [dbo].[Cities] ([CityID], [NameAm], [StateID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (22, N'Կապան', 9, NULL, N'Капан', N'Kapan', NULL, NULL)
INSERT [dbo].[Cities] ([CityID], [NameAm], [StateID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (23, N'Գորիս', 9, NULL, N'Горис', N'Goris', NULL, NULL)
INSERT [dbo].[Cities] ([CityID], [NameAm], [StateID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (24, N'Սիսիան', 9, NULL, N'Сисиан', N'Sisian', NULL, NULL)
INSERT [dbo].[Cities] ([CityID], [NameAm], [StateID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (25, N'Քաջարան', 9, NULL, N'Каджаран', N'Qajaran', NULL, NULL)
INSERT [dbo].[Cities] ([CityID], [NameAm], [StateID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (26, N'Ագարակ', 9, NULL, N'Агарак', N'Agarak', NULL, NULL)
INSERT [dbo].[Cities] ([CityID], [NameAm], [StateID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (27, N'Մեղրի', 9, NULL, N'Мехри', N'Meghri', NULL, NULL)
INSERT [dbo].[Cities] ([CityID], [NameAm], [StateID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (28, N'Գյումրի', 8, NULL, N'Гюмри', N'Gyumri', NULL, NULL)
INSERT [dbo].[Cities] ([CityID], [NameAm], [StateID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (29, N'Մարալիկ', 8, NULL, N'Маралик', N'Maralik', NULL, NULL)
INSERT [dbo].[Cities] ([CityID], [NameAm], [StateID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (30, N'Արթիկ', 8, NULL, N'Артик', N'Artik', NULL, NULL)
INSERT [dbo].[Cities] ([CityID], [NameAm], [StateID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (31, N'Իջևան', 10, NULL, N'Иджеван', N'Ijevan', NULL, NULL)
INSERT [dbo].[Cities] ([CityID], [NameAm], [StateID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (32, N'Նոյեմբերյան', 10, NULL, N'Ноемберян', N'Noyemberyan', NULL, NULL)
INSERT [dbo].[Cities] ([CityID], [NameAm], [StateID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (33, N'Բերդ', 10, NULL, N'Берд', N'Berd', NULL, NULL)
INSERT [dbo].[Cities] ([CityID], [NameAm], [StateID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (34, N'Դիլիջան', 10, NULL, N'Дилиджан', N'Dilijan', NULL, NULL)
INSERT [dbo].[Cities] ([CityID], [NameAm], [StateID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (35, N'Եղեգնաձոր', 11, NULL, N'Ехегнадзор', N'Exegnadzor', NULL, NULL)
INSERT [dbo].[Cities] ([CityID], [NameAm], [StateID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (36, N'գ. Ջորաղբյուր', 2, NULL, N'с. Дзорахбюр', N'g. Dzoraghbyur', NULL, NULL)
INSERT [dbo].[Cities] ([CityID], [NameAm], [StateID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (37, N'ք Ջրվեժ', 2, NULL, N'Джрвеж', N'c. Djrvej', NULL, NULL)
INSERT [dbo].[Cities] ([CityID], [NameAm], [StateID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (38, N'Հանքավան', 2, NULL, N'Анкаван', N'Hanqavan', NULL, NULL)
INSERT [dbo].[Cities] ([CityID], [NameAm], [StateID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (39, N'Պտղնի', 2, NULL, N'Птхни', N'Ptghni', NULL, NULL)
INSERT [dbo].[Cities] ([CityID], [NameAm], [StateID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (40, N'Արզնի', 2, NULL, N'Арзни', N'Arzni', NULL, NULL)
INSERT [dbo].[Cities] ([CityID], [NameAm], [StateID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (41, N'Օշական', 3, NULL, N'Ошакан', N'Oshakan', NULL, NULL)
INSERT [dbo].[Cities] ([CityID], [NameAm], [StateID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (42, N'Գառնի', 3, NULL, N'Гарни', N'Garni', NULL, NULL)
INSERT [dbo].[Cities] ([CityID], [NameAm], [StateID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (43, N'Էջմիածին', 5, NULL, N'Эчмиадзин', N'Ejmidzin', NULL, NULL)
INSERT [dbo].[Cities] ([CityID], [NameAm], [StateID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (44, N'Սևան', 6, NULL, N'Севан', N'Sevan', NULL, NULL)
INSERT [dbo].[Cities] ([CityID], [NameAm], [StateID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (45, N'Ջերմուկ', 11, NULL, N'Джермук', N'Djermuk', NULL, NULL)
INSERT [dbo].[Cities] ([CityID], [NameAm], [StateID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (46, N'Չարենցավան', 2, NULL, N'Чаренцаван', N'Charencavan', NULL, NULL)
INSERT [dbo].[Cities] ([CityID], [NameAm], [StateID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (47, N'Եղվարդ', 2, NULL, N'Ехвард', N'Eghvard', NULL, NULL)
INSERT [dbo].[Cities] ([CityID], [NameAm], [StateID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (48, N'Ծաղկաձոր', 2, NULL, N'Цахкадзор', N'Tsakhkadzor', NULL, NULL)
INSERT [dbo].[Cities] ([CityID], [NameAm], [StateID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (49, N'Աղվերան', 2, NULL, N'Ахверан', N'Aghveran', NULL, NULL)
SET IDENTITY_INSERT [dbo].[Cities] OFF
/****** Object:  Table [dbo].[NeededEstates]    Script Date: 03/31/2011 09:16:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NeededEstates](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[RoomCountFrom] [int] NULL,
	[RoomCountTo] [int] NULL,
	[FloorFrom] [int] NULL,
	[FloorTo] [int] NULL,
	[PriceFrom] [bigint] NULL,
	[PriceTo] [bigint] NULL,
	[SquareFrom] [int] NULL,
	[SquareTo] [int] NULL,
	[IsWoterAlways] [bit] NULL,
	[IsHasGas] [bit] NULL,
	[BrokerID] [int] NULL,
	[SellerName] [nvarchar](200) NULL,
	[Telephone1] [nvarchar](50) NULL,
	[Telephone2] [nvarchar](50) NULL,
	[AdditionalDetails] [nvarchar](max) NULL,
	[PriceFromInAMD] [bigint] NULL,
	[PriceToInAMD] [bigint] NULL,
	[CurrencyID] [int] NULL,
	[AddDate] [datetime] NULL,
	[IsNeedForRent] [bit] NULL,
	[LastModifiedDate] [datetime] NULL,
 CONSTRAINT [PK_NeededEstates] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[BrokerStates]    Script Date: 03/31/2011 09:16:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BrokerStates](
	[BrokerID] [int] NOT NULL,
	[StateID] [int] NOT NULL,
 CONSTRAINT [PK_BrokerStates] PRIMARY KEY CLUSTERED 
(
	[BrokerID] ASC,
	[StateID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[SignificanceOfTheUses]    Script Date: 03/31/2011 09:16:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SignificanceOfTheUses](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[NameAm] [nvarchar](150) NOT NULL,
	[EstateTypeID] [int] NOT NULL,
	[IsDeleted] [bit] NULL,
	[NameRu] [nvarchar](150) NULL,
	[NameEn] [nvarchar](150) NULL,
	[NameCz] [nvarchar](150) NULL,
	[NameKz] [nvarchar](150) NULL,
 CONSTRAINT [PK_SignificanceOfTheUses] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[SignificanceOfTheUses] ON
INSERT [dbo].[SignificanceOfTheUses] ([ID], [NameAm], [EstateTypeID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (1, N'Գյուղատնտեսական նշանակության հողեր', 3, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[SignificanceOfTheUses] ([ID], [NameAm], [EstateTypeID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (2, N'Բնակավայրերի հողեր', 3, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[SignificanceOfTheUses] ([ID], [NameAm], [EstateTypeID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (3, N' Արդյունաբերության,ընդերքօգտագործման եւ արտադրական նշանակության օբյեկտների հողեր ', 3, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[SignificanceOfTheUses] ([ID], [NameAm], [EstateTypeID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (4, N'Էներգետիկայի, կապի, տրանսպորտի, կոմունալ ենթակառուցվածքների օբյեկտների հողեր ', 3, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[SignificanceOfTheUses] ([ID], [NameAm], [EstateTypeID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (6, N'Հատուկ պահպանվող տարածքների հողեր', 3, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[SignificanceOfTheUses] ([ID], [NameAm], [EstateTypeID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (10, N'Անտառային, ջրային եւ պահուստային հողեր', 3, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[SignificanceOfTheUses] ([ID], [NameAm], [EstateTypeID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (13, N'Հասարակական նշանակություն', 3, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[SignificanceOfTheUses] ([ID], [NameAm], [EstateTypeID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (14, N'Տնամերձ', 3, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[SignificanceOfTheUses] ([ID], [NameAm], [EstateTypeID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (15, N'Հող', 3, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[SignificanceOfTheUses] ([ID], [NameAm], [EstateTypeID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (17, N'Այգեգործական', 3, NULL, NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[SignificanceOfTheUses] OFF
/****** Object:  Table [dbo].[BrokerOrderTypes]    Script Date: 03/31/2011 09:16:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BrokerOrderTypes](
	[BrokerID] [int] NOT NULL,
	[OrderTypeID] [int] NOT NULL,
 CONSTRAINT [PK_BrokerOrderTypes] PRIMARY KEY CLUSTERED 
(
	[BrokerID] ASC,
	[OrderTypeID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[BrokerEstateTypes]    Script Date: 03/31/2011 09:16:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BrokerEstateTypes](
	[EstateTypeID] [int] NOT NULL,
	[BrokerID] [int] NOT NULL,
 CONSTRAINT [PK_BrokerEstateTypes] PRIMARY KEY CLUSTERED 
(
	[EstateTypeID] ASC,
	[BrokerID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[NeededEstateTypes]    Script Date: 03/31/2011 09:16:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NeededEstateTypes](
	[NeededEstateID] [int] NOT NULL,
	[EstateTypeID] [int] NOT NULL,
 CONSTRAINT [PK_NeededEstateTypes] PRIMARY KEY CLUSTERED 
(
	[NeededEstateID] ASC,
	[EstateTypeID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[Regions]    Script Date: 03/31/2011 09:16:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Regions](
	[RegionID] [int] IDENTITY(1,1) NOT NULL,
	[NameAm] [nvarchar](255) NULL,
	[CityID] [int] NOT NULL,
	[SortIndex] [int] NULL,
	[IsDeleted] [bit] NULL,
	[NameEn] [nvarchar](255) NULL,
	[NameRu] [nvarchar](255) NULL,
	[NameCz] [nvarchar](255) NULL,
	[NameKz] [nvarchar](255) NULL,
 CONSTRAINT [PK_Regions] PRIMARY KEY CLUSTERED 
(
	[RegionID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Regions] ON
INSERT [dbo].[Regions] ([RegionID], [NameAm], [CityID], [SortIndex], [IsDeleted], [NameEn], [NameRu], [NameCz], [NameKz]) VALUES (1, N'Արաբկիր', 1, NULL, NULL, N'Arabkir', N'Арабкир', NULL, NULL)
INSERT [dbo].[Regions] ([RegionID], [NameAm], [CityID], [SortIndex], [IsDeleted], [NameEn], [NameRu], [NameCz], [NameKz]) VALUES (2, N'Դավիթաշեն', 1, NULL, NULL, N'Davitashen', N'Давиташен', NULL, NULL)
INSERT [dbo].[Regions] ([RegionID], [NameAm], [CityID], [SortIndex], [IsDeleted], [NameEn], [NameRu], [NameCz], [NameKz]) VALUES (3, N'Կենտրոն', 1, NULL, NULL, N'Center', N'Центр', NULL, NULL)
INSERT [dbo].[Regions] ([RegionID], [NameAm], [CityID], [SortIndex], [IsDeleted], [NameEn], [NameRu], [NameCz], [NameKz]) VALUES (4, N'Աջափնյակ', 1, NULL, NULL, N'Ajapnyak', N'Ачапняк', NULL, NULL)
INSERT [dbo].[Regions] ([RegionID], [NameAm], [CityID], [SortIndex], [IsDeleted], [NameEn], [NameRu], [NameCz], [NameKz]) VALUES (8, N'Ավան', 1, NULL, NULL, N'Avan', N'Аван', NULL, NULL)
INSERT [dbo].[Regions] ([RegionID], [NameAm], [CityID], [SortIndex], [IsDeleted], [NameEn], [NameRu], [NameCz], [NameKz]) VALUES (9, N'Էրեբունի', 1, NULL, NULL, N'Erebouni', N'Эребуни', NULL, NULL)
INSERT [dbo].[Regions] ([RegionID], [NameAm], [CityID], [SortIndex], [IsDeleted], [NameEn], [NameRu], [NameCz], [NameKz]) VALUES (10, N'Մալաթիա-Սեբաստիա', 1, NULL, NULL, N'Malatia-Sebastia', N'Малатия-Себастия', NULL, NULL)
INSERT [dbo].[Regions] ([RegionID], [NameAm], [CityID], [SortIndex], [IsDeleted], [NameEn], [NameRu], [NameCz], [NameKz]) VALUES (11, N'Նոր-Նորք', 1, NULL, NULL, N'Nor-Nork', N'Нор-Норк', NULL, NULL)
INSERT [dbo].[Regions] ([RegionID], [NameAm], [CityID], [SortIndex], [IsDeleted], [NameEn], [NameRu], [NameCz], [NameKz]) VALUES (12, N'Նորք-Մարաշ', 1, NULL, NULL, N'Nork-Marash', N'Норк-Мараш', NULL, NULL)
INSERT [dbo].[Regions] ([RegionID], [NameAm], [CityID], [SortIndex], [IsDeleted], [NameEn], [NameRu], [NameCz], [NameKz]) VALUES (13, N'Նուբարաշեն', 1, NULL, NULL, N'Noubarashen', N'Нубарашен', NULL, NULL)
INSERT [dbo].[Regions] ([RegionID], [NameAm], [CityID], [SortIndex], [IsDeleted], [NameEn], [NameRu], [NameCz], [NameKz]) VALUES (14, N'Շենգավիթ', 1, NULL, NULL, N'Shengavit', N'Шенгавит', NULL, NULL)
INSERT [dbo].[Regions] ([RegionID], [NameAm], [CityID], [SortIndex], [IsDeleted], [NameEn], [NameRu], [NameCz], [NameKz]) VALUES (15, N'Քանաքեռ-Զեյթուն', 1, NULL, NULL, N'Qanaker-Zeytoun', N'Канакер-Зейтун', NULL, NULL)
SET IDENTITY_INSERT [dbo].[Regions] OFF
/****** Object:  Table [dbo].[OperationalSignificances]    Script Date: 03/31/2011 09:16:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OperationalSignificances](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[NameAm] [nvarchar](250) NOT NULL,
	[SignificanceOfTheUseID] [int] NOT NULL,
	[IsDeleted] [bit] NULL,
	[NameRu] [nvarchar](250) NULL,
	[NameEn] [nvarchar](250) NULL,
	[NameCz] [nvarchar](250) NULL,
	[NameKz] [nvarchar](250) NULL,
 CONSTRAINT [PK_OperationalSignificances] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[OperationalSignificances] ON
INSERT [dbo].[OperationalSignificances] ([ID], [NameAm], [SignificanceOfTheUseID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (1, N'Վարելահողեր', 1, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[OperationalSignificances] ([ID], [NameAm], [SignificanceOfTheUseID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (2, N'Բազմամյա տնկարկների', 1, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[OperationalSignificances] ([ID], [NameAm], [SignificanceOfTheUseID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (3, N'Խոտհարքներ', 1, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[OperationalSignificances] ([ID], [NameAm], [SignificanceOfTheUseID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (5, N'Արոտավայրեր', 1, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[OperationalSignificances] ([ID], [NameAm], [SignificanceOfTheUseID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (6, N'Այլ հողատեսքեր', 1, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[OperationalSignificances] ([ID], [NameAm], [SignificanceOfTheUseID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (7, N'Բնակելի կառուցապատման', 2, NULL, N'', N'', N'', NULL)
INSERT [dbo].[OperationalSignificances] ([ID], [NameAm], [SignificanceOfTheUseID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (8, N'Հասարակական կառուցապատման', 2, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[OperationalSignificances] ([ID], [NameAm], [SignificanceOfTheUseID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (9, N'Խառը կառուցապատման', 2, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[OperationalSignificances] ([ID], [NameAm], [SignificanceOfTheUseID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (10, N'Ընդհանուր օգտագործման հողերի', 2, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[OperationalSignificances] ([ID], [NameAm], [SignificanceOfTheUseID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (11, N'Այլ հողեր', 2, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[OperationalSignificances] ([ID], [NameAm], [SignificanceOfTheUseID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (12, N'Արդյունաբերական օբյեկտներ', 3, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[OperationalSignificances] ([ID], [NameAm], [SignificanceOfTheUseID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (13, N'Գյուղատնտեսական արտադրական օբյեկտներ', 3, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[OperationalSignificances] ([ID], [NameAm], [SignificanceOfTheUseID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (14, N'Պահեստարաններ', 3, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[OperationalSignificances] ([ID], [NameAm], [SignificanceOfTheUseID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (15, N'Ընդերքի օգտագործման համար տրամադրված հողամասեր', 3, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[OperationalSignificances] ([ID], [NameAm], [SignificanceOfTheUseID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (16, N'էներգետիկայի', 4, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[OperationalSignificances] ([ID], [NameAm], [SignificanceOfTheUseID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (17, N'Կապի', 4, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[OperationalSignificances] ([ID], [NameAm], [SignificanceOfTheUseID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (18, N'Տրանսպորտի', 4, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[OperationalSignificances] ([ID], [NameAm], [SignificanceOfTheUseID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (19, N'Կոմունալ ենթակառուցվածքների', 4, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[OperationalSignificances] ([ID], [NameAm], [SignificanceOfTheUseID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (25, N'Առողջարարական նպատակներով նախատեսված', 6, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[OperationalSignificances] ([ID], [NameAm], [SignificanceOfTheUseID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (26, N'Բնապահպանական', 6, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[OperationalSignificances] ([ID], [NameAm], [SignificanceOfTheUseID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (27, N'Հանգստի համար նախատեսված', 6, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[OperationalSignificances] ([ID], [NameAm], [SignificanceOfTheUseID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (28, N'Անտառներ', 10, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[OperationalSignificances] ([ID], [NameAm], [SignificanceOfTheUseID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (29, N'Վարելահողեր', 10, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[OperationalSignificances] ([ID], [NameAm], [SignificanceOfTheUseID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (30, N'Խոտհարքներ', 10, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[OperationalSignificances] ([ID], [NameAm], [SignificanceOfTheUseID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (31, N'Արոտներ', 10, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[OperationalSignificances] ([ID], [NameAm], [SignificanceOfTheUseID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (32, N'Թփուտներ', 10, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[OperationalSignificances] ([ID], [NameAm], [SignificanceOfTheUseID], [IsDeleted], [NameRu], [NameEn], [NameCz], [NameKz]) VALUES (33, N'Այլ հողեր', 10, NULL, NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[OperationalSignificances] OFF
/****** Object:  Table [dbo].[Estates]    Script Date: 03/31/2011 09:16:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Estates](
	[EstateID] [int] IDENTITY(1,1) NOT NULL,
	[EstateTypeID] [int] NOT NULL,
	[RoomCount] [int] NULL,
	[BrokerID] [int] NULL,
	[TotalSquare] [real] NULL,
	[Floor] [int] NULL,
	[Price] [bigint] NULL,
	[CurrencyID] [int] NULL,
	[RegionID] [int] NULL,
	[RemontID] [int] NULL,
	[Height] [real] NULL,
	[HasGarage] [bit] NULL,
	[SellerName] [nvarchar](255) NULL,
	[PhonePrimary] [nvarchar](255) NULL,
	[PhoneSecondary] [nvarchar](255) NULL,
	[Email] [nvarchar](255) NULL,
	[HasEuroWindows] [bit] NULL,
	[AddressID] [int] NULL,
	[IsHasCanalisationPosibility] [bit] NULL,
	[AdditionalInformation] [nvarchar](max) NULL,
	[Canalisation] [bit] NULL,
	[IsWoterAlways] [bit] NULL,
	[IsHasGas] [bit] NULL,
	[ProjectID] [int] NULL,
	[ExpandingPosibility] [bit] NULL,
	[BuildingTypeID] [int] NULL,
	[OrderTypeID] [int] NULL,
	[HasPadval] [bit] NULL,
	[BuildingFloorsCount] [int] NULL,
	[PadvalSquare] [int] NULL,
	[IsHasGarden] [bit] NULL,
	[GardenSquare] [int] NULL,
	[IsOutDoorFromSteel] [bit] NULL,
	[GasPosibility] [bit] NULL,
	[AddDate] [datetime] NULL,
	[CityID] [int] NULL,
	[StreetID] [int] NULL,
	[HomeNumber] [nvarchar](50) NULL,
	[AptNumber] [nvarchar](50) NULL,
	[EarthPlaceTypeID] [int] NULL,
	[StateID] [int] NULL,
	[GarageTypeID] [int] NULL,
	[PriceTypeID] [int] NULL,
	[Rating] [int] NULL,
	[PlaceName] [nvarchar](255) NULL,
	[OfficePlaceTypeID] [int] NULL,
	[Electricity] [bit] NULL,
	[PricePerDay] [int] NULL,
	[PriceInAMD] [bigint] NULL,
	[IsSelledOrOrended] [bit] NULL,
	[IsHasDrinkWater] [bit] NULL,
	[IsHasVoroqmanJur] [bit] NULL,
	[IsHasElectricityPosibility] [bit] NULL,
	[IsUploadedToWeb] [bit] NULL,
	[LastModifiedDate] [datetime] NULL,
	[SignificanceOfTheUseID] [int] NULL,
	[OperationalSignificanceID] [int] NULL,
	[Code] [nvarchar](50) NULL,
	[RoofingID] [int] NULL,
	[IsExchangePossible] [bit] NULL,
	[ExchangeWith] [ntext] NULL,
	[IsInNewBuilding] [bit] NULL,
	[IsHasFurniture] [bit] NULL,
	[IsHasConditioner] [bit] NULL,
	[IsHasWasher] [bit] NULL,
	[InformationSource] [nvarchar](500) NULL,
	[PricePerDayInAMD] [bigint] NULL,
	[IsHasWarmingSystem] [bit] NULL,
	[IsHasInternet] [bit] NULL,
	[IsHasAntena] [bit] NULL,
	[IsHasTechnique] [bit] NULL,
	[OpenBalcony] [bit] NULL,
	[ClosedBalcony] [bit] NULL,
	[Nisha] [bit] NULL,
	[FrontBalcony] [bit] NULL,
	[Arevkox] [bit] NULL,
	[Xordanoc] [bit] NULL,
	[IsEmpty] [bit] NULL,
	[IsHasTV] [bit] NULL,
	[IsHasDVD] [bit] NULL,
	[IsHasJakuzi] [bit] NULL,
	[IsHasRefrigerator] [bit] NULL,
	[IsHasAriston] [bit] NULL,
	[IsHasGeyser] [bit] NULL,
	[IsHasWaterContainer] [bit] NULL,
	[IsHasPool] [bit] NULL,
	[IsHasGasHeater] [bit] NULL,
	[IsHasOfficeRoom] [bit] NULL,
	[IsHasShowerCab] [bit] NULL,
	[IsHasBed] [bit] NULL,
	[IsHasGate] [bit] NULL,
	[IsHasTrees] [bit] NULL,
	[IsHasPlayRoom] [bit] NULL,
	[IsHasService] [bit] NULL,
	[IsHasHeatedFloors] [bit] NULL,
	[IsHasLodgeBalcony] [bit] NULL,
	[IsHasIntercome] [bit] NULL,
	[IsInElitarBuilding] [bit] NULL,
	[IsHasSecuritySystem] [bit] NULL,
	[IsHasParking] [bit] NULL,
	[IsHasKitchen] [bit] NULL,
	[InFirstLine] [bit] NULL,
	[InNullableFloor] [bit] NULL,
	[IsHasWC] [bit] NULL,
	[IsHasThreePhaseElectricity] [bit] NULL,
	[IsHasFencing] [bit] NULL,
	[AdditionalConvenients] [nvarchar](500) NULL,
	[Lat] [nvarchar](50) NULL,
	[Lng] [nvarchar](50) NULL,
 CONSTRAINT [PK_Estates] PRIMARY KEY CLUSTERED 
(
	[EstateID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

/****** Object:  Table [dbo].[NeededRegions]    Script Date: 03/31/2011 09:16:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NeededRegions](
	[NeededEstateID] [int] NOT NULL,
	[RegionID] [int] NOT NULL,
 CONSTRAINT [PK_NeededRegions] PRIMARY KEY CLUSTERED 
(
	[NeededEstateID] ASC,
	[RegionID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[BrokersRegions]    Script Date: 03/31/2011 09:16:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BrokersRegions](
	[BrokerID] [int] NOT NULL,
	[RegionID] [int] NOT NULL,
 CONSTRAINT [PK_BrokersRegions] PRIMARY KEY CLUSTERED 
(
	[BrokerID] ASC,
	[RegionID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[RentedEstates]    Script Date: 03/31/2011 09:16:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RentedEstates](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[EstateID] [int] NOT NULL,
	[StartDate] [datetime] NULL,
	[EndDate] [datetime] NULL,
	[Price] [bigint] NULL,
	[CurrencyID] [int] NULL,
	[BrokerID] [int] NULL,
	[PricePerDay] [int] NULL,
	[PriceInAMD] [bigint] NULL,
	[PricePerDayInAMD] [bigint] NULL,
 CONSTRAINT [PK_RentedEstates] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[SelledEstates]    Script Date: 03/31/2011 09:16:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SelledEstates](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[EstateID] [int] NOT NULL,
	[Price] [bigint] NULL,
	[SellDate] [datetime] NULL,
	[BrokerID] [int] NULL,
	[CurrencyID] [int] NULL,
	[PriceInAMD] [bigint] NULL,
 CONSTRAINT [PK_SelledEstates] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[FavoriteEstates]    Script Date: 03/31/2011 09:16:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FavoriteEstates](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NOT NULL,
	[EstateID] [int] NOT NULL,
 CONSTRAINT [PK_FavoriteEstates] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[EstateVideos]    Script Date: 03/31/2011 09:16:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EstateVideos](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[EstateID] [int] NOT NULL,
	[FileExtension] [nvarchar](10) NOT NULL,
 CONSTRAINT [PK_EstateVideos] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[EstateImages]    Script Date: 03/31/2011 09:16:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EstateImages](
	[ImageID] [int] IDENTITY(1,1) NOT NULL,
	[EstateID] [int] NOT NULL,
	[ImageTypeID] [int] NULL,
 CONSTRAINT [PK_EstateImages] PRIMARY KEY CLUSTERED 
(
	[ImageID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[EstateConvenients]    Script Date: 03/31/2011 09:16:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EstateConvenients](
	[EstateID] [int] NOT NULL,
	[ConvenientID] [int] NOT NULL,
 CONSTRAINT [PK_EstateConvenients] PRIMARY KEY CLUSTERED 
(
	[EstateID] ASC,
	[ConvenientID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

/****** Object:  ForeignKey [FK_BrokerEstateTypes_EstateTypes]    Script Date: 03/31/2011 09:16:58 ******/
ALTER TABLE [dbo].[BrokerEstateTypes]  WITH CHECK ADD  CONSTRAINT [FK_BrokerEstateTypes_EstateTypes] FOREIGN KEY([EstateTypeID])
REFERENCES [dbo].[EstateTypes] ([EstateTypeID])
GO
ALTER TABLE [dbo].[BrokerEstateTypes] CHECK CONSTRAINT [FK_BrokerEstateTypes_EstateTypes]
GO
/****** Object:  ForeignKey [FK_BrokerEstateTypes_Users]    Script Date: 03/31/2011 09:16:58 ******/
ALTER TABLE [dbo].[BrokerEstateTypes]  WITH CHECK ADD  CONSTRAINT [FK_BrokerEstateTypes_Users] FOREIGN KEY([BrokerID])
REFERENCES [dbo].[Users] ([ID])
GO
ALTER TABLE [dbo].[BrokerEstateTypes] CHECK CONSTRAINT [FK_BrokerEstateTypes_Users]
GO
/****** Object:  ForeignKey [FK_BrokerOrderTypes_OrderTypes]    Script Date: 03/31/2011 09:16:58 ******/
ALTER TABLE [dbo].[BrokerOrderTypes]  WITH CHECK ADD  CONSTRAINT [FK_BrokerOrderTypes_OrderTypes] FOREIGN KEY([OrderTypeID])
REFERENCES [dbo].[OrderTypes] ([OrderTypeID])
GO
ALTER TABLE [dbo].[BrokerOrderTypes] CHECK CONSTRAINT [FK_BrokerOrderTypes_OrderTypes]
GO
/****** Object:  ForeignKey [FK_BrokerOrderTypes_Users]    Script Date: 03/31/2011 09:16:58 ******/
ALTER TABLE [dbo].[BrokerOrderTypes]  WITH CHECK ADD  CONSTRAINT [FK_BrokerOrderTypes_Users] FOREIGN KEY([BrokerID])
REFERENCES [dbo].[Users] ([ID])
GO
ALTER TABLE [dbo].[BrokerOrderTypes] CHECK CONSTRAINT [FK_BrokerOrderTypes_Users]
GO
/****** Object:  ForeignKey [FK_BrokersRegions_Regions]    Script Date: 03/31/2011 09:16:58 ******/
ALTER TABLE [dbo].[BrokersRegions]  WITH CHECK ADD  CONSTRAINT [FK_BrokersRegions_Regions] FOREIGN KEY([RegionID])
REFERENCES [dbo].[Regions] ([RegionID])
GO
ALTER TABLE [dbo].[BrokersRegions] CHECK CONSTRAINT [FK_BrokersRegions_Regions]
GO
/****** Object:  ForeignKey [FK_BrokersRegions_Users]    Script Date: 03/31/2011 09:16:58 ******/
ALTER TABLE [dbo].[BrokersRegions]  WITH CHECK ADD  CONSTRAINT [FK_BrokersRegions_Users] FOREIGN KEY([BrokerID])
REFERENCES [dbo].[Users] ([ID])
GO
ALTER TABLE [dbo].[BrokersRegions] CHECK CONSTRAINT [FK_BrokersRegions_Users]
GO
/****** Object:  ForeignKey [FK_BrokerStates_States]    Script Date: 03/31/2011 09:16:58 ******/
ALTER TABLE [dbo].[BrokerStates]  WITH CHECK ADD  CONSTRAINT [FK_BrokerStates_States] FOREIGN KEY([StateID])
REFERENCES [dbo].[States] ([ID])
GO
ALTER TABLE [dbo].[BrokerStates] CHECK CONSTRAINT [FK_BrokerStates_States]
GO
/****** Object:  ForeignKey [FK_BrokerStates_Users]    Script Date: 03/31/2011 09:16:58 ******/
ALTER TABLE [dbo].[BrokerStates]  WITH CHECK ADD  CONSTRAINT [FK_BrokerStates_Users] FOREIGN KEY([BrokerID])
REFERENCES [dbo].[Users] ([ID])
GO
ALTER TABLE [dbo].[BrokerStates] CHECK CONSTRAINT [FK_BrokerStates_Users]
GO
/****** Object:  ForeignKey [FK_Cities_States]    Script Date: 03/31/2011 09:16:58 ******/
ALTER TABLE [dbo].[Cities]  WITH CHECK ADD  CONSTRAINT [FK_Cities_States] FOREIGN KEY([StateID])
REFERENCES [dbo].[States] ([ID])
GO
ALTER TABLE [dbo].[Cities] CHECK CONSTRAINT [FK_Cities_States]
GO
/****** Object:  ForeignKey [FK_EstateConvenients_Convenients]    Script Date: 03/31/2011 09:16:58 ******/
ALTER TABLE [dbo].[EstateConvenients]  WITH CHECK ADD  CONSTRAINT [FK_EstateConvenients_Convenients] FOREIGN KEY([ConvenientID])
REFERENCES [dbo].[Convenients] ([ID])
GO
ALTER TABLE [dbo].[EstateConvenients] CHECK CONSTRAINT [FK_EstateConvenients_Convenients]
GO
/****** Object:  ForeignKey [FK_EstateConvenients_Estates]    Script Date: 03/31/2011 09:16:58 ******/
ALTER TABLE [dbo].[EstateConvenients]  WITH CHECK ADD  CONSTRAINT [FK_EstateConvenients_Estates] FOREIGN KEY([EstateID])
REFERENCES [dbo].[Estates] ([EstateID])
GO
ALTER TABLE [dbo].[EstateConvenients] CHECK CONSTRAINT [FK_EstateConvenients_Estates]
GO
/****** Object:  ForeignKey [FK_EstateImages_Estates]    Script Date: 03/31/2011 09:16:58 ******/
ALTER TABLE [dbo].[EstateImages]  WITH CHECK ADD  CONSTRAINT [FK_EstateImages_Estates] FOREIGN KEY([EstateID])
REFERENCES [dbo].[Estates] ([EstateID])
GO
ALTER TABLE [dbo].[EstateImages] CHECK CONSTRAINT [FK_EstateImages_Estates]
GO
/****** Object:  ForeignKey [FK_Estates_BuildingTypes]    Script Date: 03/31/2011 09:16:58 ******/
ALTER TABLE [dbo].[Estates]  WITH CHECK ADD  CONSTRAINT [FK_Estates_BuildingTypes] FOREIGN KEY([BuildingTypeID])
REFERENCES [dbo].[BuildingTypes] ([BuildingTypeID])
GO
ALTER TABLE [dbo].[Estates] CHECK CONSTRAINT [FK_Estates_BuildingTypes]
GO
/****** Object:  ForeignKey [FK_Estates_Cities]    Script Date: 03/31/2011 09:16:58 ******/
ALTER TABLE [dbo].[Estates]  WITH CHECK ADD  CONSTRAINT [FK_Estates_Cities] FOREIGN KEY([CityID])
REFERENCES [dbo].[Cities] ([CityID])
GO
ALTER TABLE [dbo].[Estates] CHECK CONSTRAINT [FK_Estates_Cities]
GO
/****** Object:  ForeignKey [FK_Estates_Currencies]    Script Date: 03/31/2011 09:16:58 ******/
ALTER TABLE [dbo].[Estates]  WITH CHECK ADD  CONSTRAINT [FK_Estates_Currencies] FOREIGN KEY([CurrencyID])
REFERENCES [dbo].[Currencies] ([CurrencyID])
GO
ALTER TABLE [dbo].[Estates] CHECK CONSTRAINT [FK_Estates_Currencies]
GO
/****** Object:  ForeignKey [FK_Estates_EstateTypes]    Script Date: 03/31/2011 09:16:58 ******/
ALTER TABLE [dbo].[Estates]  WITH CHECK ADD  CONSTRAINT [FK_Estates_EstateTypes] FOREIGN KEY([EstateTypeID])
REFERENCES [dbo].[EstateTypes] ([EstateTypeID])
GO
ALTER TABLE [dbo].[Estates] CHECK CONSTRAINT [FK_Estates_EstateTypes]
GO
/****** Object:  ForeignKey [FK_Estates_OperationalSignificances]    Script Date: 03/31/2011 09:16:58 ******/
ALTER TABLE [dbo].[Estates]  WITH CHECK ADD  CONSTRAINT [FK_Estates_OperationalSignificances] FOREIGN KEY([OperationalSignificanceID])
REFERENCES [dbo].[OperationalSignificances] ([ID])
GO
ALTER TABLE [dbo].[Estates] CHECK CONSTRAINT [FK_Estates_OperationalSignificances]
GO
/****** Object:  ForeignKey [FK_Estates_OrderTypes]    Script Date: 03/31/2011 09:16:58 ******/
ALTER TABLE [dbo].[Estates]  WITH CHECK ADD  CONSTRAINT [FK_Estates_OrderTypes] FOREIGN KEY([OrderTypeID])
REFERENCES [dbo].[OrderTypes] ([OrderTypeID])
GO
ALTER TABLE [dbo].[Estates] CHECK CONSTRAINT [FK_Estates_OrderTypes]
GO
/****** Object:  ForeignKey [FK_Estates_Projects]    Script Date: 03/31/2011 09:16:58 ******/
ALTER TABLE [dbo].[Estates]  WITH CHECK ADD  CONSTRAINT [FK_Estates_Projects] FOREIGN KEY([ProjectID])
REFERENCES [dbo].[Projects] ([ProjectID])
GO
ALTER TABLE [dbo].[Estates] CHECK CONSTRAINT [FK_Estates_Projects]
GO
/****** Object:  ForeignKey [FK_Estates_Regions]    Script Date: 03/31/2011 09:16:58 ******/
ALTER TABLE [dbo].[Estates]  WITH CHECK ADD  CONSTRAINT [FK_Estates_Regions] FOREIGN KEY([RegionID])
REFERENCES [dbo].[Regions] ([RegionID])
GO
ALTER TABLE [dbo].[Estates] CHECK CONSTRAINT [FK_Estates_Regions]
GO
/****** Object:  ForeignKey [FK_Estates_Remonts]    Script Date: 03/31/2011 09:16:58 ******/
ALTER TABLE [dbo].[Estates]  WITH CHECK ADD  CONSTRAINT [FK_Estates_Remonts] FOREIGN KEY([RemontID])
REFERENCES [dbo].[Remonts] ([RemontID])
GO
ALTER TABLE [dbo].[Estates] CHECK CONSTRAINT [FK_Estates_Remonts]
GO
/****** Object:  ForeignKey [FK_Estates_Roofings]    Script Date: 03/31/2011 09:16:58 ******/
ALTER TABLE [dbo].[Estates]  WITH CHECK ADD  CONSTRAINT [FK_Estates_Roofings] FOREIGN KEY([RoofingID])
REFERENCES [dbo].[Roofings] ([ID])
GO
ALTER TABLE [dbo].[Estates] CHECK CONSTRAINT [FK_Estates_Roofings]
GO
/****** Object:  ForeignKey [FK_Estates_SignificanceOfTheUses]    Script Date: 03/31/2011 09:16:58 ******/
ALTER TABLE [dbo].[Estates]  WITH CHECK ADD  CONSTRAINT [FK_Estates_SignificanceOfTheUses] FOREIGN KEY([SignificanceOfTheUseID])
REFERENCES [dbo].[SignificanceOfTheUses] ([ID])
GO
ALTER TABLE [dbo].[Estates] CHECK CONSTRAINT [FK_Estates_SignificanceOfTheUses]
GO
/****** Object:  ForeignKey [FK_Estates_States]    Script Date: 03/31/2011 09:16:58 ******/
ALTER TABLE [dbo].[Estates]  WITH CHECK ADD  CONSTRAINT [FK_Estates_States] FOREIGN KEY([StateID])
REFERENCES [dbo].[States] ([ID])
GO
ALTER TABLE [dbo].[Estates] CHECK CONSTRAINT [FK_Estates_States]
GO
/****** Object:  ForeignKey [FK_Estates_Streets]    Script Date: 03/31/2011 09:16:58 ******/
ALTER TABLE [dbo].[Estates]  WITH CHECK ADD  CONSTRAINT [FK_Estates_Streets] FOREIGN KEY([StreetID])
REFERENCES [dbo].[Streets] ([StreetID])
GO
ALTER TABLE [dbo].[Estates] CHECK CONSTRAINT [FK_Estates_Streets]
GO
/****** Object:  ForeignKey [FK_Estates_Users]    Script Date: 03/31/2011 09:16:58 ******/
ALTER TABLE [dbo].[Estates]  WITH CHECK ADD  CONSTRAINT [FK_Estates_Users] FOREIGN KEY([BrokerID])
REFERENCES [dbo].[Users] ([ID])
GO
ALTER TABLE [dbo].[Estates] CHECK CONSTRAINT [FK_Estates_Users]
GO
/****** Object:  ForeignKey [FK_EstateVideos_Estates]    Script Date: 03/31/2011 09:16:58 ******/
ALTER TABLE [dbo].[EstateVideos]  WITH CHECK ADD  CONSTRAINT [FK_EstateVideos_Estates] FOREIGN KEY([EstateID])
REFERENCES [dbo].[Estates] ([EstateID])
GO
ALTER TABLE [dbo].[EstateVideos] CHECK CONSTRAINT [FK_EstateVideos_Estates]
GO
/****** Object:  ForeignKey [FK_FavoriteEstates_Estates]    Script Date: 03/31/2011 09:16:58 ******/
ALTER TABLE [dbo].[FavoriteEstates]  WITH CHECK ADD  CONSTRAINT [FK_FavoriteEstates_Estates] FOREIGN KEY([EstateID])
REFERENCES [dbo].[Estates] ([EstateID])
GO
ALTER TABLE [dbo].[FavoriteEstates] CHECK CONSTRAINT [FK_FavoriteEstates_Estates]
GO
/****** Object:  ForeignKey [FK_FavoriteEstates_Users]    Script Date: 03/31/2011 09:16:58 ******/
ALTER TABLE [dbo].[FavoriteEstates]  WITH CHECK ADD  CONSTRAINT [FK_FavoriteEstates_Users] FOREIGN KEY([UserID])
REFERENCES [dbo].[Users] ([ID])
GO
ALTER TABLE [dbo].[FavoriteEstates] CHECK CONSTRAINT [FK_FavoriteEstates_Users]
GO
/****** Object:  ForeignKey [FK_NeededEstates_Currencies]    Script Date: 03/31/2011 09:16:58 ******/
ALTER TABLE [dbo].[NeededEstates]  WITH CHECK ADD  CONSTRAINT [FK_NeededEstates_Currencies] FOREIGN KEY([CurrencyID])
REFERENCES [dbo].[Currencies] ([CurrencyID])
GO
ALTER TABLE [dbo].[NeededEstates] CHECK CONSTRAINT [FK_NeededEstates_Currencies]
GO
/****** Object:  ForeignKey [FK_NeededEstates_Users]    Script Date: 03/31/2011 09:16:58 ******/
ALTER TABLE [dbo].[NeededEstates]  WITH CHECK ADD  CONSTRAINT [FK_NeededEstates_Users] FOREIGN KEY([BrokerID])
REFERENCES [dbo].[Users] ([ID])
GO
ALTER TABLE [dbo].[NeededEstates] CHECK CONSTRAINT [FK_NeededEstates_Users]
GO
/****** Object:  ForeignKey [FK_NeededEstateTypes_EstateTypes]    Script Date: 03/31/2011 09:16:58 ******/
ALTER TABLE [dbo].[NeededEstateTypes]  WITH CHECK ADD  CONSTRAINT [FK_NeededEstateTypes_EstateTypes] FOREIGN KEY([EstateTypeID])
REFERENCES [dbo].[EstateTypes] ([EstateTypeID])
GO
ALTER TABLE [dbo].[NeededEstateTypes] CHECK CONSTRAINT [FK_NeededEstateTypes_EstateTypes]
GO
/****** Object:  ForeignKey [FK_NeededEstateTypes_NeededEstates]    Script Date: 03/31/2011 09:16:58 ******/
ALTER TABLE [dbo].[NeededEstateTypes]  WITH CHECK ADD  CONSTRAINT [FK_NeededEstateTypes_NeededEstates] FOREIGN KEY([NeededEstateID])
REFERENCES [dbo].[NeededEstates] ([ID])
GO
ALTER TABLE [dbo].[NeededEstateTypes] CHECK CONSTRAINT [FK_NeededEstateTypes_NeededEstates]
GO
/****** Object:  ForeignKey [FK_NeededRegions_NeededEstates]    Script Date: 03/31/2011 09:16:58 ******/
ALTER TABLE [dbo].[NeededRegions]  WITH CHECK ADD  CONSTRAINT [FK_NeededRegions_NeededEstates] FOREIGN KEY([NeededEstateID])
REFERENCES [dbo].[NeededEstates] ([ID])
GO
ALTER TABLE [dbo].[NeededRegions] CHECK CONSTRAINT [FK_NeededRegions_NeededEstates]
GO
/****** Object:  ForeignKey [FK_NeededRegions_Regions]    Script Date: 03/31/2011 09:16:58 ******/
ALTER TABLE [dbo].[NeededRegions]  WITH CHECK ADD  CONSTRAINT [FK_NeededRegions_Regions] FOREIGN KEY([RegionID])
REFERENCES [dbo].[Regions] ([RegionID])
GO
ALTER TABLE [dbo].[NeededRegions] CHECK CONSTRAINT [FK_NeededRegions_Regions]
GO
/****** Object:  ForeignKey [FK_OperationalSignificances_SignificanceOfTheUses]    Script Date: 03/31/2011 09:16:58 ******/
ALTER TABLE [dbo].[OperationalSignificances]  WITH CHECK ADD  CONSTRAINT [FK_OperationalSignificances_SignificanceOfTheUses] FOREIGN KEY([SignificanceOfTheUseID])
REFERENCES [dbo].[SignificanceOfTheUses] ([ID])
GO
ALTER TABLE [dbo].[OperationalSignificances] CHECK CONSTRAINT [FK_OperationalSignificances_SignificanceOfTheUses]
GO
/****** Object:  ForeignKey [FK_Regions_Cities]    Script Date: 03/31/2011 09:16:58 ******/
ALTER TABLE [dbo].[Regions]  WITH CHECK ADD  CONSTRAINT [FK_Regions_Cities] FOREIGN KEY([CityID])
REFERENCES [dbo].[Cities] ([CityID])
GO
ALTER TABLE [dbo].[Regions] CHECK CONSTRAINT [FK_Regions_Cities]
GO
/****** Object:  ForeignKey [FK_RentedEstates_Currencies]    Script Date: 03/31/2011 09:16:58 ******/
ALTER TABLE [dbo].[RentedEstates]  WITH CHECK ADD  CONSTRAINT [FK_RentedEstates_Currencies] FOREIGN KEY([CurrencyID])
REFERENCES [dbo].[Currencies] ([CurrencyID])
GO
ALTER TABLE [dbo].[RentedEstates] CHECK CONSTRAINT [FK_RentedEstates_Currencies]
GO
/****** Object:  ForeignKey [FK_RentedEstates_Estates]    Script Date: 03/31/2011 09:16:58 ******/
ALTER TABLE [dbo].[RentedEstates]  WITH CHECK ADD  CONSTRAINT [FK_RentedEstates_Estates] FOREIGN KEY([EstateID])
REFERENCES [dbo].[Estates] ([EstateID])
GO
ALTER TABLE [dbo].[RentedEstates] CHECK CONSTRAINT [FK_RentedEstates_Estates]
GO
/****** Object:  ForeignKey [FK_RentedEstates_Users]    Script Date: 03/31/2011 09:16:58 ******/
ALTER TABLE [dbo].[RentedEstates]  WITH CHECK ADD  CONSTRAINT [FK_RentedEstates_Users] FOREIGN KEY([BrokerID])
REFERENCES [dbo].[Users] ([ID])
GO
ALTER TABLE [dbo].[RentedEstates] CHECK CONSTRAINT [FK_RentedEstates_Users]
GO
/****** Object:  ForeignKey [FK_SelledEstates_Currencies]    Script Date: 03/31/2011 09:16:58 ******/
ALTER TABLE [dbo].[SelledEstates]  WITH CHECK ADD  CONSTRAINT [FK_SelledEstates_Currencies] FOREIGN KEY([CurrencyID])
REFERENCES [dbo].[Currencies] ([CurrencyID])
GO
ALTER TABLE [dbo].[SelledEstates] CHECK CONSTRAINT [FK_SelledEstates_Currencies]
GO
/****** Object:  ForeignKey [FK_SelledEstates_Estates]    Script Date: 03/31/2011 09:16:58 ******/
ALTER TABLE [dbo].[SelledEstates]  WITH CHECK ADD  CONSTRAINT [FK_SelledEstates_Estates] FOREIGN KEY([EstateID])
REFERENCES [dbo].[Estates] ([EstateID])
GO
ALTER TABLE [dbo].[SelledEstates] CHECK CONSTRAINT [FK_SelledEstates_Estates]
GO
/****** Object:  ForeignKey [FK_SelledEstates_Users]    Script Date: 03/31/2011 09:16:58 ******/
ALTER TABLE [dbo].[SelledEstates]  WITH CHECK ADD  CONSTRAINT [FK_SelledEstates_Users] FOREIGN KEY([BrokerID])
REFERENCES [dbo].[Users] ([ID])
GO
ALTER TABLE [dbo].[SelledEstates] CHECK CONSTRAINT [FK_SelledEstates_Users]
GO
/****** Object:  ForeignKey [FK_SignificanceOfTheUses_EstateTypes]    Script Date: 03/31/2011 09:16:58 ******/
ALTER TABLE [dbo].[SignificanceOfTheUses]  WITH CHECK ADD  CONSTRAINT [FK_SignificanceOfTheUses_EstateTypes] FOREIGN KEY([EstateTypeID])
REFERENCES [dbo].[EstateTypes] ([EstateTypeID])
GO
ALTER TABLE [dbo].[SignificanceOfTheUses] CHECK CONSTRAINT [FK_SignificanceOfTheUses_EstateTypes]
GO
