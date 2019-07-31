Create Database [InventoryManagement]
GO
USE [InventoryManagement]
GO

/****** Object:  Table [dbo].[IM_USERS]    Script Date: 01/10/2016 17:46:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[IM_USERS](
	[USER_ID] [varchar](50) NOT NULL,
	[USER_NAME] [varchar](50) NOT NULL,
	[PASSWORD] [varchar](50) NOT NULL,
	[CREATION_DATE] [datetime] NOT NULL,
	[ROLE_TYPE] [int] NOT NULL,
	[ACTIVE] [bit] NOT NULL,
 CONSTRAINT [PK_IM_USERS] PRIMARY KEY CLUSTERED 
(
	[USER_NAME] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO

/****** Object:  Default [DF_IM_USERS_ROLE_TYPE]    Script Date: 01/10/2016 17:46:47 ******/
ALTER TABLE [dbo].[IM_USERS] ADD  CONSTRAINT [DF_IM_USERS_ROLE_TYPE]  DEFAULT ((1)) FOR [ROLE_TYPE]
GO
/****** Object:  Default [DF_IM_USERS_ACTIVE]    Script Date: 01/10/2016 17:46:47 ******/
ALTER TABLE [dbo].[IM_USERS] ADD  CONSTRAINT [DF_IM_USERS_ACTIVE]  DEFAULT ((0)) FOR [ACTIVE]
GO


/**************Object:  Table [dbo].[IM_USERS] Insert Defaut Admin User*********************/

INSERT [dbo].[IM_USERS] ([USER_ID], [USER_NAME], [PASSWORD], [CREATION_DATE], [ROLE_TYPE], [ACTIVE]) VALUES (N'admin', N'Administrator', N'admin', CAST(0x00009FFA00000000 AS DateTime), 1, 1)
GO

/****** Object:  Table [dbo].[IM_Company]    Script Date: 6/21/2016 12:19:14 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[IM_Company](
	[CompanyId] [varchar](50) NOT NULL,
	[CompanyName] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_IM_Company_1] PRIMARY KEY CLUSTERED 
(
	[CompanyId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

/****** Object:  Table [dbo].[IM_SR_DSR]    Script Date: 6/21/2016 11:50:20 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[IM_SR_DSR](
	[Id] [varchar](50) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Type] [int] NOT NULL,
 CONSTRAINT [PK_IM_SR_DSR] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

/****** Object:  Table [dbo].[IM_Items]    Script Date: 6/22/2016 1:03:01 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[IM_Items](
	[CompanyId] [varchar](50) NOT NULL,
	[ItemId] [varchar](50) NOT NULL,
	[ItemName] [nvarchar](100) NOT NULL,
	[CountPerBox] [int] NOT NULL,
	[Price] [float] NOT NULL,
 CONSTRAINT [PK_IM_Items] PRIMARY KEY CLUSTERED 
(
	[ItemId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO


/****** Object:  Table [dbo].[IM_Items_Stock]    Script Date: 6/25/2016 12:07:15 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[IM_Items_Stock](
	[StockId] [varchar](50) NOT NULL,
	[ItemId] [varchar](50) NOT NULL,
	[TotalStock] [int] NOT NULL,
 CONSTRAINT [PK_IM_Items_Stock] PRIMARY KEY CLUSTERED 
(
	[StockId] ASC,
	[ItemId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

ALTER TABLE [dbo].[IM_Items_Stock] ADD  CONSTRAINT [DF_IM_Items_Stock_TotalStock]  DEFAULT ((0)) FOR [TotalStock]
GO


/****** Object:  Table [dbo].[IM_Markets]    Script Date: 6/25/2016 12:28:29 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[IM_Markets](
	[Id] [varchar](50) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_IM_Market] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO


/****** Object:  Table [dbo].[IM_Orders]    Script Date: 6/26/2016 1:07:31 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[IM_Orders](
	[OrderId] [varchar](50) NOT NULL,
	[CompanyId] [varchar](50) NOT NULL,
	[SrId] [varchar](50) NOT NULL,
	[MarketId] [varchar](50) NOT NULL,
	[ItemId] [varchar](50) NOT NULL,
	[Date] [datetime] NOT NULL,
	[OrderCount] [int] NOT NULL CONSTRAINT [DF_IM_Orders_OrderCount]  DEFAULT ((0)),
	[ReturnCount] [int] NOT NULL CONSTRAINT [DF_IM_Orders_ReturnCount]  DEFAULT ((0)),
	[SoldCount] [int] NOT NULL CONSTRAINT [DF_IM_Orders_SoldCount]  DEFAULT ((0)),
 CONSTRAINT [PK_IM_Orders] PRIMARY KEY CLUSTERED 
(
	[OrderId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO


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
ALTER TABLE dbo.IM_Items_Stock
	DROP CONSTRAINT DF_IM_Items_Stock_TotalStock
GO
CREATE TABLE dbo.Tmp_IM_Items_Stock
	(
	StockId varchar(50) NOT NULL,
	ItemId varchar(50) NOT NULL,
	TotalStock int NOT NULL,
	ChalanNo varchar(50) NULL,
	StockEntryDate date NOT NULL
	)  ON [PRIMARY]
GO
ALTER TABLE dbo.Tmp_IM_Items_Stock SET (LOCK_ESCALATION = TABLE)
GO
ALTER TABLE dbo.Tmp_IM_Items_Stock ADD CONSTRAINT
	DF_IM_Items_Stock_TotalStock DEFAULT ((0)) FOR TotalStock
GO
IF EXISTS(SELECT * FROM dbo.IM_Items_Stock)
	 EXEC('INSERT INTO dbo.Tmp_IM_Items_Stock (StockId, ItemId, TotalStock)
		SELECT StockId, ItemId, TotalStock FROM dbo.IM_Items_Stock WITH (HOLDLOCK TABLOCKX)')
GO
DROP TABLE dbo.IM_Items_Stock
GO
EXECUTE sp_rename N'dbo.Tmp_IM_Items_Stock', N'IM_Items_Stock', 'OBJECT' 
GO
ALTER TABLE dbo.IM_Items_Stock ADD CONSTRAINT
	PK_IM_Items_Stock PRIMARY KEY CLUSTERED 
	(
	StockId,
	ItemId
	) WITH( STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]

GO
COMMIT


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
CREATE TABLE dbo.Tmp_IM_SR_DSR
	(
	Id varchar(50) NOT NULL,
	Name nvarchar(50) NOT NULL,
	Type int NOT NULL,
	CellNo nvarchar(50) NOT NULL
	)  ON [PRIMARY]
GO
ALTER TABLE dbo.Tmp_IM_SR_DSR SET (LOCK_ESCALATION = TABLE)
GO
ALTER TABLE dbo.Tmp_IM_SR_DSR ADD CONSTRAINT
	DF_IM_SR_DSR_CellNo DEFAULT 0 FOR CellNo
GO
IF EXISTS(SELECT * FROM dbo.IM_SR_DSR)
	 EXEC('INSERT INTO dbo.Tmp_IM_SR_DSR (Id, Name, Type)
		SELECT Id, Name, Type FROM dbo.IM_SR_DSR WITH (HOLDLOCK TABLOCKX)')
GO
DROP TABLE dbo.IM_SR_DSR
GO
EXECUTE sp_rename N'dbo.Tmp_IM_SR_DSR', N'IM_SR_DSR', 'OBJECT' 
GO
ALTER TABLE dbo.IM_SR_DSR ADD CONSTRAINT
	PK_IM_SR_DSR PRIMARY KEY CLUSTERED 
	(
	Id
	) WITH( STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]

GO
COMMIT

/****** Object:  Table [dbo].[IM_SR_DSR_ORDER_DUE]    Script Date: 7/11/2016 3:50:26 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[IM_SR_DSR_ORDER_DUE](
	[SrId] [varchar](50) NOT NULL,
	[TotalDue] [float] NOT NULL,
 CONSTRAINT [PK_IM_SR_DSR_ORDER_DUE_1] PRIMARY KEY CLUSTERED 
(
	[SrId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO


/****** Object:  Table [dbo].[IM_SR_DSR_PAYMENT_DETAILS]    Script Date: 7/16/2016 12:07:32 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[IM_SR_DSR_PAYMENT_DETAILS](
	[PaymentId] [varchar](50) NOT NULL,
	[SrId] [varchar](50) NOT NULL,
	[CompanyId] [varchar](50) NOT NULL,
	[PaymentDate] [date] NOT NULL,
	[ThousendCount] [int] NOT NULL,
	[FiveHundredCount] [int] NOT NULL,
	[OneHundredCount] [int] NOT NULL,
	[FiftyCount] [int] NOT NULL,
	[TwentyCount] [int] NOT NULL,
	[TenCount] [int] NOT NULL,
	[FiveCount] [int] NOT NULL,
	[TwoCount] [int] NOT NULL,
	[OneCount] [int] NOT NULL,
	[TotalPayment] [float] NOT NULL,
 CONSTRAINT [PK_IM_SR_DSR_PAYMENT_DETAILS] PRIMARY KEY CLUSTERED 
(
	[PaymentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

ALTER TABLE [dbo].[IM_SR_DSR_PAYMENT_DETAILS] ADD  CONSTRAINT [DF_IM_SR_DSR_PAYMENT_DETAILS_ThousendCount]  DEFAULT ((0)) FOR [ThousendCount]
GO

ALTER TABLE [dbo].[IM_SR_DSR_PAYMENT_DETAILS] ADD  CONSTRAINT [DF_IM_SR_DSR_PAYMENT_DETAILS_FiveHundredCount]  DEFAULT ((0)) FOR [FiveHundredCount]
GO

ALTER TABLE [dbo].[IM_SR_DSR_PAYMENT_DETAILS] ADD  CONSTRAINT [DF_IM_SR_DSR_PAYMENT_DETAILS_OneHundredCount]  DEFAULT ((0)) FOR [OneHundredCount]
GO

ALTER TABLE [dbo].[IM_SR_DSR_PAYMENT_DETAILS] ADD  CONSTRAINT [DF_IM_SR_DSR_PAYMENT_DETAILS_FiftyCount]  DEFAULT ((0)) FOR [FiftyCount]
GO

ALTER TABLE [dbo].[IM_SR_DSR_PAYMENT_DETAILS] ADD  CONSTRAINT [DF_IM_SR_DSR_PAYMENT_DETAILS_TwentyCount]  DEFAULT ((0)) FOR [TwentyCount]
GO

ALTER TABLE [dbo].[IM_SR_DSR_PAYMENT_DETAILS] ADD  CONSTRAINT [DF_IM_SR_DSR_PAYMENT_DETAILS_TenCount]  DEFAULT ((0)) FOR [TenCount]
GO

ALTER TABLE [dbo].[IM_SR_DSR_PAYMENT_DETAILS] ADD  CONSTRAINT [DF_IM_SR_DSR_PAYMENT_DETAILS_FiveCount]  DEFAULT ((0)) FOR [FiveCount]
GO

ALTER TABLE [dbo].[IM_SR_DSR_PAYMENT_DETAILS] ADD  CONSTRAINT [DF_IM_SR_DSR_PAYMENT_DETAILS_TwoCount]  DEFAULT ((0)) FOR [TwoCount]
GO

ALTER TABLE [dbo].[IM_SR_DSR_PAYMENT_DETAILS] ADD  CONSTRAINT [DF_IM_SR_DSR_PAYMENT_DETAILS_OneCount]  DEFAULT ((0)) FOR [OneCount]
GO

ALTER TABLE [dbo].[IM_SR_DSR_PAYMENT_DETAILS] ADD  CONSTRAINT [DF_IM_SR_DSR_PAYMENT_DETAILS_TotalPayment]  DEFAULT ((0)) FOR [TotalPayment]
GO


/****** Object:  Table [dbo].[IM_Chalan_Activity]    Script Date: 7/17/2016 12:26:08 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[IM_Chalan_Activity](
	[ChalanId] [varchar](50) NOT NULL,
	[ChalanNo] [varchar](50) NOT NULL,
	[ItemId] [varchar](50) NOT NULL,
	[EntryCount] [int] NOT NULL CONSTRAINT [DF_IM_Chalan_Activity_EntryCount]  DEFAULT ((0)),
	[ChalanDate] [date] NOT NULL,
 CONSTRAINT [PK_IM_Chalan_Activity] PRIMARY KEY CLUSTERED 
(
	[ChalanId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

/*
   Thursday, July 28, 20163:30:59 PM
   User: sa
   Server: LENOVO-PC\SQLSERVER14
   Database: InventoryManagement
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
ALTER TABLE dbo.IM_Items_Stock
	DROP CONSTRAINT DF_IM_Items_Stock_TotalStock
GO
ALTER TABLE dbo.IM_Items_Stock
	DROP CONSTRAINT DF_IM_Items_Stock_DamagedStock
GO
CREATE TABLE dbo.Tmp_IM_Items_Stock
	(
	StockId varchar(50) NOT NULL,
	ItemId varchar(50) NOT NULL,
	TotalStock int NOT NULL,
	DamagedStock int NOT NULL,
	ChalanNo varchar(50) NULL,
	StockEntryDate date NOT NULL
	)  ON [PRIMARY]
GO
ALTER TABLE dbo.Tmp_IM_Items_Stock SET (LOCK_ESCALATION = TABLE)
GO
ALTER TABLE dbo.Tmp_IM_Items_Stock ADD CONSTRAINT
	DF_IM_Items_Stock_TotalStock DEFAULT ((0)) FOR TotalStock
GO
ALTER TABLE dbo.Tmp_IM_Items_Stock ADD CONSTRAINT
	DF_IM_Items_Stock_DamagedStock DEFAULT ((0)) FOR DamagedStock
GO
IF EXISTS(SELECT * FROM dbo.IM_Items_Stock)
	 EXEC('INSERT INTO dbo.Tmp_IM_Items_Stock (StockId, ItemId, TotalStock, DamagedStock, ChalanNo, StockEntryDate)
		SELECT StockId, ItemId, TotalStock, DamagedStock, ChalanNo, StockEntryDate FROM dbo.IM_Items_Stock WITH (HOLDLOCK TABLOCKX)')
GO
DROP TABLE dbo.IM_Items_Stock
GO
EXECUTE sp_rename N'dbo.Tmp_IM_Items_Stock', N'IM_Items_Stock', 'OBJECT' 
GO
ALTER TABLE dbo.IM_Items_Stock ADD CONSTRAINT
	PK_IM_Items_Stock PRIMARY KEY CLUSTERED 
	(
	StockId,
	ItemId
	) WITH( STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]

GO
COMMIT


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
ALTER TABLE dbo.IM_Orders ADD
	DamagedCount int NOT NULL CONSTRAINT DF_IM_Orders_DamagedCount DEFAULT 0
GO
ALTER TABLE dbo.IM_Orders SET (LOCK_ESCALATION = TABLE)
GO
COMMIT


