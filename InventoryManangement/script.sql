USE [master]
GO
/****** Object:  Database [InventoryManagement]    Script Date: 10/12/2017 11:07:14 AM ******/
CREATE DATABASE [InventoryManagement]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'InventoryManagement', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\InventoryManagement.mdf' , SIZE = 4096KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'InventoryManagement_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\InventoryManagement_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [InventoryManagement] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [InventoryManagement].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [InventoryManagement] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [InventoryManagement] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [InventoryManagement] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [InventoryManagement] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [InventoryManagement] SET ARITHABORT OFF 
GO
ALTER DATABASE [InventoryManagement] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [InventoryManagement] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [InventoryManagement] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [InventoryManagement] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [InventoryManagement] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [InventoryManagement] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [InventoryManagement] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [InventoryManagement] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [InventoryManagement] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [InventoryManagement] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [InventoryManagement] SET  DISABLE_BROKER 
GO
ALTER DATABASE [InventoryManagement] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [InventoryManagement] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [InventoryManagement] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [InventoryManagement] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [InventoryManagement] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [InventoryManagement] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [InventoryManagement] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [InventoryManagement] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [InventoryManagement] SET  MULTI_USER 
GO
ALTER DATABASE [InventoryManagement] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [InventoryManagement] SET DB_CHAINING OFF 
GO
ALTER DATABASE [InventoryManagement] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [InventoryManagement] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [InventoryManagement]
GO
/****** Object:  Table [dbo].[BillExport]    Script Date: 10/12/2017 11:07:14 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[BillExport](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[IDCustom] [int] NULL,
	[IDStoreKeeper] [int] NULL,
	[DateExport] [datetime] NULL,
	[NameCustom] [varchar](50) NULL,
 CONSTRAINT [PK__BillExpo__3214EC27DFBC5853] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[BillImport]    Script Date: 10/12/2017 11:07:14 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[BillImport](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[IDCompany] [int] NULL,
	[IDStoreKeeper] [int] NULL,
	[DateImport] [datetime] NULL CONSTRAINT [DF_BillImport_DateImport]  DEFAULT (getdate()),
	[NameCustom] [varchar](50) NULL,
 CONSTRAINT [PK__BillImpo__3214EC27CAB848FC] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Company]    Script Date: 10/12/2017 11:07:14 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Company](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NULL,
	[Ad] [varchar](100) NULL,
	[PhoneNumber] [varchar](20) NULL,
	[Email] [varchar](50) NULL,
 CONSTRAINT [PK__Company__3214EC27DA787358] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Custom]    Script Date: 10/12/2017 11:07:14 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Custom](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NULL,
	[Ad] [varchar](100) NULL,
	[PhoneNumber] [varchar](20) NULL,
	[Email] [varchar](50) NULL,
 CONSTRAINT [PK__Custom__3214EC27A6DE8EFF] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[DetailExport]    Script Date: 10/12/2017 11:07:14 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DetailExport](
	[IDBill] [int] NOT NULL,
	[IDProduct] [int] NOT NULL,
	[Quantity] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[IDBill] ASC,
	[IDProduct] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[DetailImport]    Script Date: 10/12/2017 11:07:14 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DetailImport](
	[IDBill] [int] NOT NULL,
	[IDProduct] [int] NOT NULL,
	[Quantity] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[IDBill] ASC,
	[IDProduct] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Product]    Script Date: 10/12/2017 11:07:14 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Product](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NULL,
	[Quantity] [int] NULL,
	[IdCom] [int] NULL,
	[Unit] [varchar](50) NULL,
	[Code] [varchar](10) NULL,
 CONSTRAINT [PK__Product__3214EC2785B7EF5D] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Storekeeper]    Script Date: 10/12/2017 11:07:14 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Storekeeper](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NULL,
	[DateOfBirth] [date] NULL,
	[Ad] [varchar](100) NULL,
	[PhoneNumber] [varchar](15) NULL,
	[Email] [varchar](50) NULL,
 CONSTRAINT [PK__Storekee__3214EC2756054845] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Users]    Script Date: 10/12/2017 11:07:14 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Users](
	[UserName] [varchar](20) NOT NULL,
	[Pass] [varchar](20) NULL,
	[ID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[UserName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[BillExport] ON 

INSERT [dbo].[BillExport] ([ID], [IDCustom], [IDStoreKeeper], [DateExport], [NameCustom]) VALUES (1, 1, 2, CAST(N'2017-11-11 00:00:00.000' AS DateTime), N'Nguyen Van Anh')
INSERT [dbo].[BillExport] ([ID], [IDCustom], [IDStoreKeeper], [DateExport], [NameCustom]) VALUES (2, 1, 1, CAST(N'2017-10-10 00:00:00.000' AS DateTime), N'Nguyen Ngoc Anh')
INSERT [dbo].[BillExport] ([ID], [IDCustom], [IDStoreKeeper], [DateExport], [NameCustom]) VALUES (3, 2, 2, CAST(N'2017-12-11 00:00:00.000' AS DateTime), N'Trinh Nguyen')
INSERT [dbo].[BillExport] ([ID], [IDCustom], [IDStoreKeeper], [DateExport], [NameCustom]) VALUES (4, 1, 2, CAST(N'2017-11-11 00:00:00.000' AS DateTime), N'Hoa Ngo')
SET IDENTITY_INSERT [dbo].[BillExport] OFF
SET IDENTITY_INSERT [dbo].[BillImport] ON 

INSERT [dbo].[BillImport] ([ID], [IDCompany], [IDStoreKeeper], [DateImport], [NameCustom]) VALUES (1, 1, 1, CAST(N'2017-02-02 00:00:00.000' AS DateTime), N'Vuong Thi Le')
INSERT [dbo].[BillImport] ([ID], [IDCompany], [IDStoreKeeper], [DateImport], [NameCustom]) VALUES (2, 2, 2, CAST(N'2017-04-11 00:00:00.000' AS DateTime), N'Ngo Thi Hoa')
INSERT [dbo].[BillImport] ([ID], [IDCompany], [IDStoreKeeper], [DateImport], [NameCustom]) VALUES (4, 1, 1, CAST(N'2017-02-02 00:00:00.000' AS DateTime), N'Vuong Thi Le')
INSERT [dbo].[BillImport] ([ID], [IDCompany], [IDStoreKeeper], [DateImport], [NameCustom]) VALUES (5, 1, 2, CAST(N'2017-02-02 00:00:00.000' AS DateTime), N'Vuong Thi Le')
SET IDENTITY_INSERT [dbo].[BillImport] OFF
SET IDENTITY_INSERT [dbo].[Company] ON 

INSERT [dbo].[Company] ([ID], [Name], [Ad], [PhoneNumber], [Email]) VALUES (1, N'Loen', N'Ha Noi', N'0123456', N'Loen@gmail.com')
INSERT [dbo].[Company] ([ID], [Name], [Ad], [PhoneNumber], [Email]) VALUES (2, N'SM', N'Ho Chi Minh', N'123456456', N'SM@gmail.com')
INSERT [dbo].[Company] ([ID], [Name], [Ad], [PhoneNumber], [Email]) VALUES (3, N'JYP', N'Da Nang', N'234587652', N'JYP@gmail.com')
INSERT [dbo].[Company] ([ID], [Name], [Ad], [PhoneNumber], [Email]) VALUES (5, N'Cj', N'Hue', N'1234567', N'Cj@gmail')
INSERT [dbo].[Company] ([ID], [Name], [Ad], [PhoneNumber], [Email]) VALUES (6, N'Cube', N'Thai Binh', N'4567887', N'Cube@gmai.com')
SET IDENTITY_INSERT [dbo].[Company] OFF
SET IDENTITY_INSERT [dbo].[Custom] ON 

INSERT [dbo].[Custom] ([ID], [Name], [Ad], [PhoneNumber], [Email]) VALUES (1, N'Lotte', N'Ha Noi', N'98765423', N'Lotte@gmail.com')
INSERT [dbo].[Custom] ([ID], [Name], [Ad], [PhoneNumber], [Email]) VALUES (2, N'Tiki', N'Ho Chi Minh ', N'23456789', N'Tiki@gmail.com')
INSERT [dbo].[Custom] ([ID], [Name], [Ad], [PhoneNumber], [Email]) VALUES (4, N'lazada', N'Da Nang', N'4567890', N'Lazada@gmail.com')
SET IDENTITY_INSERT [dbo].[Custom] OFF
INSERT [dbo].[DetailExport] ([IDBill], [IDProduct], [Quantity]) VALUES (1, 2, 8)
INSERT [dbo].[DetailExport] ([IDBill], [IDProduct], [Quantity]) VALUES (1, 3, 4)
INSERT [dbo].[DetailExport] ([IDBill], [IDProduct], [Quantity]) VALUES (2, 1, 40)
INSERT [dbo].[DetailExport] ([IDBill], [IDProduct], [Quantity]) VALUES (3, 5, 50)
INSERT [dbo].[DetailExport] ([IDBill], [IDProduct], [Quantity]) VALUES (4, 1, 30)
INSERT [dbo].[DetailImport] ([IDBill], [IDProduct], [Quantity]) VALUES (1, 4, 20)
INSERT [dbo].[DetailImport] ([IDBill], [IDProduct], [Quantity]) VALUES (1, 7, 20)
INSERT [dbo].[DetailImport] ([IDBill], [IDProduct], [Quantity]) VALUES (1, 8, 20)
INSERT [dbo].[DetailImport] ([IDBill], [IDProduct], [Quantity]) VALUES (1, 12, 20)
INSERT [dbo].[DetailImport] ([IDBill], [IDProduct], [Quantity]) VALUES (2, 9, 50)
INSERT [dbo].[DetailImport] ([IDBill], [IDProduct], [Quantity]) VALUES (2, 10, 40)
INSERT [dbo].[DetailImport] ([IDBill], [IDProduct], [Quantity]) VALUES (4, 4, 20)
INSERT [dbo].[DetailImport] ([IDBill], [IDProduct], [Quantity]) VALUES (5, 4, 40)
SET IDENTITY_INSERT [dbo].[Product] ON 

INSERT [dbo].[Product] ([ID], [Name], [Quantity], [IdCom], [Unit], [Code]) VALUES (1, N'Bed', 123, 1, N'Piece', N'BE093')
INSERT [dbo].[Product] ([ID], [Name], [Quantity], [IdCom], [Unit], [Code]) VALUES (2, N'Table', 234, 1, N'Piece', N'AL124')
INSERT [dbo].[Product] ([ID], [Name], [Quantity], [IdCom], [Unit], [Code]) VALUES (3, N'Chair', 123, 1, N'Piece', N'AL123')
INSERT [dbo].[Product] ([ID], [Name], [Quantity], [IdCom], [Unit], [Code]) VALUES (4, N'Wardrobe', 50, 1, N'Piece', N'BA653')
INSERT [dbo].[Product] ([ID], [Name], [Quantity], [IdCom], [Unit], [Code]) VALUES (5, N'Sink', 90, 2, N'Piece', N'BA536')
INSERT [dbo].[Product] ([ID], [Name], [Quantity], [IdCom], [Unit], [Code]) VALUES (6, N'Toilet', 100, 2, N'Piece', N'BA234')
INSERT [dbo].[Product] ([ID], [Name], [Quantity], [IdCom], [Unit], [Code]) VALUES (7, N'Shower', 123, 2, N'Piece', N'BA865')
INSERT [dbo].[Product] ([ID], [Name], [Quantity], [IdCom], [Unit], [Code]) VALUES (8, N'Bedding', 200, 3, N'Set', N'BE987')
INSERT [dbo].[Product] ([ID], [Name], [Quantity], [IdCom], [Unit], [Code]) VALUES (9, N'Carpet', 200, 3, N'Meter', N'AL234')
INSERT [dbo].[Product] ([ID], [Name], [Quantity], [IdCom], [Unit], [Code]) VALUES (10, N'Curtain', 150, 3, N'Meter', N'AL987')
INSERT [dbo].[Product] ([ID], [Name], [Quantity], [IdCom], [Unit], [Code]) VALUES (12, N'Sofa', 123, 1, N'Piece', N'AL098')
SET IDENTITY_INSERT [dbo].[Product] OFF
SET IDENTITY_INSERT [dbo].[Storekeeper] ON 

INSERT [dbo].[Storekeeper] ([ID], [Name], [DateOfBirth], [Ad], [PhoneNumber], [Email]) VALUES (1, N'Van Anh Nguyen', CAST(N'1995-02-28' AS Date), N'Thai Binh', N'09834567', N'Valily@gmail.com')
INSERT [dbo].[Storekeeper] ([ID], [Name], [DateOfBirth], [Ad], [PhoneNumber], [Email]) VALUES (2, N'Ngoc Anh Nguyen', CAST(N'1995-01-14' AS Date), N'Quang Nam', N'09876543', N'NgocAnh@gmail.com')
INSERT [dbo].[Storekeeper] ([ID], [Name], [DateOfBirth], [Ad], [PhoneNumber], [Email]) VALUES (3, N'Le Vuong', CAST(N'1996-11-30' AS Date), N'Nghe An', N'8465827361', N'VuongLe@gmail.com')
SET IDENTITY_INSERT [dbo].[Storekeeper] OFF
INSERT [dbo].[Users] ([UserName], [Pass], [ID]) VALUES (N'a', N'2', 1)
INSERT [dbo].[Users] ([UserName], [Pass], [ID]) VALUES (N'iu', N'1234', 1)
INSERT [dbo].[Users] ([UserName], [Pass], [ID]) VALUES (N'le', N'00', 3)
INSERT [dbo].[Users] ([UserName], [Pass], [ID]) VALUES (N'StarCandy', N'123456', 1)
INSERT [dbo].[Users] ([UserName], [Pass], [ID]) VALUES (N'sttt', N'1234', 2)
INSERT [dbo].[Users] ([UserName], [Pass], [ID]) VALUES (N'v', N'1', 1)
INSERT [dbo].[Users] ([UserName], [Pass], [ID]) VALUES (N'Valily', N'654321', 2)
INSERT [dbo].[Users] ([UserName], [Pass], [ID]) VALUES (N'vva', N'12', 1)
ALTER TABLE [dbo].[BillExport]  WITH CHECK ADD  CONSTRAINT [FK__BillExpor__IDCus__48CFD27E] FOREIGN KEY([IDCustom])
REFERENCES [dbo].[Custom] ([ID])
GO
ALTER TABLE [dbo].[BillExport] CHECK CONSTRAINT [FK__BillExpor__IDCus__48CFD27E]
GO
ALTER TABLE [dbo].[BillExport]  WITH CHECK ADD  CONSTRAINT [FK__BillExpor__IDSto__49C3F6B7] FOREIGN KEY([IDStoreKeeper])
REFERENCES [dbo].[Storekeeper] ([ID])
GO
ALTER TABLE [dbo].[BillExport] CHECK CONSTRAINT [FK__BillExpor__IDSto__49C3F6B7]
GO
ALTER TABLE [dbo].[BillImport]  WITH CHECK ADD  CONSTRAINT [FK__BillImpor__IDCom__1920BF5C] FOREIGN KEY([IDCompany])
REFERENCES [dbo].[Company] ([ID])
GO
ALTER TABLE [dbo].[BillImport] CHECK CONSTRAINT [FK__BillImpor__IDCom__1920BF5C]
GO
ALTER TABLE [dbo].[BillImport]  WITH CHECK ADD  CONSTRAINT [FK__BillImpor__IDSto__1A14E395] FOREIGN KEY([IDStoreKeeper])
REFERENCES [dbo].[Storekeeper] ([ID])
GO
ALTER TABLE [dbo].[BillImport] CHECK CONSTRAINT [FK__BillImpor__IDSto__1A14E395]
GO
ALTER TABLE [dbo].[DetailExport]  WITH CHECK ADD  CONSTRAINT [FK__DetailExp__IDBil__4CA06362] FOREIGN KEY([IDBill])
REFERENCES [dbo].[BillExport] ([ID])
GO
ALTER TABLE [dbo].[DetailExport] CHECK CONSTRAINT [FK__DetailExp__IDBil__4CA06362]
GO
ALTER TABLE [dbo].[DetailExport]  WITH CHECK ADD FOREIGN KEY([IDProduct])
REFERENCES [dbo].[Product] ([ID])
GO
ALTER TABLE [dbo].[DetailImport]  WITH CHECK ADD  CONSTRAINT [FK__DetailImp__IDBil__1CF15040] FOREIGN KEY([IDBill])
REFERENCES [dbo].[BillImport] ([ID])
GO
ALTER TABLE [dbo].[DetailImport] CHECK CONSTRAINT [FK__DetailImp__IDBil__1CF15040]
GO
ALTER TABLE [dbo].[DetailImport]  WITH CHECK ADD  CONSTRAINT [FK__DetailImp__IDPro__1DE57479] FOREIGN KEY([IDProduct])
REFERENCES [dbo].[Product] ([ID])
GO
ALTER TABLE [dbo].[DetailImport] CHECK CONSTRAINT [FK__DetailImp__IDPro__1DE57479]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK__Product__IdCom__164452B1] FOREIGN KEY([IdCom])
REFERENCES [dbo].[Company] ([ID])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK__Product__IdCom__164452B1]
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD FOREIGN KEY([ID])
REFERENCES [dbo].[Storekeeper] ([ID])
GO
USE [master]
GO
ALTER DATABASE [InventoryManagement] SET  READ_WRITE 
GO
