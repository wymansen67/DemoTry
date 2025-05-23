USE [master]
GO
/****** Object:  Database [MasterFloor]    Script Date: 06.05.2025 9:37:25 ******/
CREATE DATABASE [MasterFloor]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'MasterFloor', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\MasterFloor.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'MasterFloor_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\MasterFloor_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [MasterFloor] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [MasterFloor].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [MasterFloor] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [MasterFloor] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [MasterFloor] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [MasterFloor] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [MasterFloor] SET ARITHABORT OFF 
GO
ALTER DATABASE [MasterFloor] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [MasterFloor] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [MasterFloor] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [MasterFloor] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [MasterFloor] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [MasterFloor] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [MasterFloor] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [MasterFloor] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [MasterFloor] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [MasterFloor] SET  DISABLE_BROKER 
GO
ALTER DATABASE [MasterFloor] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [MasterFloor] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [MasterFloor] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [MasterFloor] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [MasterFloor] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [MasterFloor] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [MasterFloor] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [MasterFloor] SET RECOVERY FULL 
GO
ALTER DATABASE [MasterFloor] SET  MULTI_USER 
GO
ALTER DATABASE [MasterFloor] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [MasterFloor] SET DB_CHAINING OFF 
GO
ALTER DATABASE [MasterFloor] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [MasterFloor] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [MasterFloor] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [MasterFloor] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'MasterFloor', N'ON'
GO
ALTER DATABASE [MasterFloor] SET QUERY_STORE = ON
GO
ALTER DATABASE [MasterFloor] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [MasterFloor]
GO
/****** Object:  Table [dbo].[Material_type]    Script Date: 06.05.2025 9:37:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Material_type](
	[TypeID] [tinyint] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[BrakPercent] [nvarchar](5) NOT NULL,
 CONSTRAINT [PK_Material_type] PRIMARY KEY CLUSTERED 
(
	[TypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Partner_product]    Script Date: 06.05.2025 9:37:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Partner_product](
	[Product] [int] NOT NULL,
	[Partner] [bigint] NOT NULL,
	[Quantity] [int] NOT NULL,
	[SellDate] [date] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Partner_type]    Script Date: 06.05.2025 9:37:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Partner_type](
	[TypeID] [tinyint] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Partner_type] PRIMARY KEY CLUSTERED 
(
	[TypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Partners]    Script Date: 06.05.2025 9:37:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Partners](
	[Type] [tinyint] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Director_lastname] [nvarchar](50) NOT NULL,
	[Director_firstname] [nvarchar](50) NOT NULL,
	[Director_middlename] [nvarchar](50) NOT NULL,
	[Email] [nvarchar](50) NOT NULL,
	[Phone] [nvarchar](50) NOT NULL,
	[Index] [int] NOT NULL,
	[Area] [nvarchar](50) NOT NULL,
	[City] [nvarchar](50) NOT NULL,
	[Street] [nvarchar](50) NOT NULL,
	[Building] [nvarchar](50) NOT NULL,
	[Tin] [bigint] NOT NULL,
	[Rating] [decimal](18, 10) NOT NULL,
 CONSTRAINT [PK_Partners] PRIMARY KEY CLUSTERED 
(
	[Tin] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product_type]    Script Date: 06.05.2025 9:37:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product_type](
	[TypeID] [int] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[TypeCoefficient] [decimal](18, 10) NOT NULL,
 CONSTRAINT [PK_Product_type] PRIMARY KEY CLUSTERED 
(
	[TypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Products]    Script Date: 06.05.2025 9:37:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[Articul] [int] NOT NULL,
	[Type] [int] NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[Minimal_price_for_partner] [decimal](18, 10) NOT NULL,
 CONSTRAINT [PK_Products] PRIMARY KEY CLUSTERED 
(
	[Articul] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Material_type] ([TypeID], [Name], [BrakPercent]) VALUES (1, N'Тип материала 1', N'0,10%')
INSERT [dbo].[Material_type] ([TypeID], [Name], [BrakPercent]) VALUES (2, N'Тип материала 2', N'0,95%')
INSERT [dbo].[Material_type] ([TypeID], [Name], [BrakPercent]) VALUES (3, N'Тип материала 3', N'0,28%')
INSERT [dbo].[Material_type] ([TypeID], [Name], [BrakPercent]) VALUES (4, N'Тип материала 4', N'0,55%')
INSERT [dbo].[Material_type] ([TypeID], [Name], [BrakPercent]) VALUES (5, N'Тип материала 5', N'0,34%')
GO
INSERT [dbo].[Partner_product] ([Product], [Partner], [Quantity], [SellDate]) VALUES (8758385, 2222455179, 15500, CAST(N'2023-03-23' AS Date))
INSERT [dbo].[Partner_product] ([Product], [Partner], [Quantity], [SellDate]) VALUES (7750282, 2222455179, 12350, CAST(N'2023-12-18' AS Date))
INSERT [dbo].[Partner_product] ([Product], [Partner], [Quantity], [SellDate]) VALUES (7028748, 2222455179, 37400, CAST(N'2024-06-07' AS Date))
INSERT [dbo].[Partner_product] ([Product], [Partner], [Quantity], [SellDate]) VALUES (8858958, 3333888520, 35000, CAST(N'2022-12-02' AS Date))
INSERT [dbo].[Partner_product] ([Product], [Partner], [Quantity], [SellDate]) VALUES (5012543, 3333888520, 1250, CAST(N'2023-05-17' AS Date))
INSERT [dbo].[Partner_product] ([Product], [Partner], [Quantity], [SellDate]) VALUES (7750282, 3333888520, 1000, CAST(N'2024-06-07' AS Date))
INSERT [dbo].[Partner_product] ([Product], [Partner], [Quantity], [SellDate]) VALUES (8758385, 3333888520, 7550, CAST(N'2024-07-01' AS Date))
INSERT [dbo].[Partner_product] ([Product], [Partner], [Quantity], [SellDate]) VALUES (8758385, 4440391035, 7250, CAST(N'2023-01-22' AS Date))
INSERT [dbo].[Partner_product] ([Product], [Partner], [Quantity], [SellDate]) VALUES (8858958, 4440391035, 2500, CAST(N'2024-07-05' AS Date))
INSERT [dbo].[Partner_product] ([Product], [Partner], [Quantity], [SellDate]) VALUES (7028748, 1111520857, 59050, CAST(N'2023-03-20' AS Date))
INSERT [dbo].[Partner_product] ([Product], [Partner], [Quantity], [SellDate]) VALUES (7750282, 1111520857, 37200, CAST(N'2024-03-12' AS Date))
INSERT [dbo].[Partner_product] ([Product], [Partner], [Quantity], [SellDate]) VALUES (5012543, 1111520857, 4500, CAST(N'2024-05-14' AS Date))
INSERT [dbo].[Partner_product] ([Product], [Partner], [Quantity], [SellDate]) VALUES (7750282, 5552431140, 50000, CAST(N'2023-09-19' AS Date))
INSERT [dbo].[Partner_product] ([Product], [Partner], [Quantity], [SellDate]) VALUES (7028748, 5552431140, 670000, CAST(N'2023-11-10' AS Date))
INSERT [dbo].[Partner_product] ([Product], [Partner], [Quantity], [SellDate]) VALUES (8758385, 5552431140, 35000, CAST(N'2024-04-15' AS Date))
INSERT [dbo].[Partner_product] ([Product], [Partner], [Quantity], [SellDate]) VALUES (8858958, 5552431140, 25000, CAST(N'2024-06-12' AS Date))
GO
INSERT [dbo].[Partner_type] ([TypeID], [Name]) VALUES (1, N'ЗАО')
INSERT [dbo].[Partner_type] ([TypeID], [Name]) VALUES (2, N'ООО')
INSERT [dbo].[Partner_type] ([TypeID], [Name]) VALUES (3, N'ПАО')
INSERT [dbo].[Partner_type] ([TypeID], [Name]) VALUES (4, N'ОАО')
GO
INSERT [dbo].[Partners] ([Type], [Name], [Director_lastname], [Director_firstname], [Director_middlename], [Email], [Phone], [Index], [Area], [City], [Street], [Building], [Tin], [Rating]) VALUES (4, N'Ремонт и отделка', N'Воробьева', N'Екатерина', N'Валерьевна', N'ekaterina.vorobeva@ml.ru', N'444 222 33 11', 143960, N'Московская область', N'Реутов', N'ул. Свободы', N'51', 1111520857, CAST(5.0000000000 AS Decimal(18, 10)))
INSERT [dbo].[Partners] ([Type], [Name], [Director_lastname], [Director_firstname], [Director_middlename], [Email], [Phone], [Index], [Area], [City], [Street], [Building], [Tin], [Rating]) VALUES (1, N'База Строитель', N'Иванова', N'Александра', N'Ивановна', N'aleksandraivanova@ml.ru', N'493 123 45 67', 652050, N'Кемеровская область', N'Юрга', N'ул. Лесная', N'15', 2222455179, CAST(7.0000000000 AS Decimal(18, 10)))
INSERT [dbo].[Partners] ([Type], [Name], [Director_lastname], [Director_firstname], [Director_middlename], [Email], [Phone], [Index], [Area], [City], [Street], [Building], [Tin], [Rating]) VALUES (2, N'Паркет 29', N'Петров', N'Василий', N'Петрович', N'vppetrov@vl.ru', N'987 123 56 78', 164500, N'Архангельская область', N'Северодвинск', N'ул. Строителей', N'18', 3333888520, CAST(7.0000000000 AS Decimal(18, 10)))
INSERT [dbo].[Partners] ([Type], [Name], [Director_lastname], [Director_firstname], [Director_middlename], [Email], [Phone], [Index], [Area], [City], [Street], [Building], [Tin], [Rating]) VALUES (3, N'Стройсервис', N'Соловьев', N'Андрей', N'Николаевич', N'ansolovev@st.ru', N'812 223 32 00', 188910, N'Ленинградская область', N'Приморск', N'ул. Парковая', N'21', 4440391035, CAST(7.0000000000 AS Decimal(18, 10)))
INSERT [dbo].[Partners] ([Type], [Name], [Director_lastname], [Director_firstname], [Director_middlename], [Email], [Phone], [Index], [Area], [City], [Street], [Building], [Tin], [Rating]) VALUES (1, N'МонтажПро', N'Степанов', N'Степан', N'Сергеевич', N'stepanov@stepan.ru', N'912 888 33 33', 309500, N'Белгородская область', N'Старый Оскол', N'ул. Рабочая', N'122', 5552431140, CAST(10.0000000000 AS Decimal(18, 10)))
GO
INSERT [dbo].[Product_type] ([TypeID], [Name], [TypeCoefficient]) VALUES (1, N'Ламинат', CAST(2.3500000000 AS Decimal(18, 10)))
INSERT [dbo].[Product_type] ([TypeID], [Name], [TypeCoefficient]) VALUES (2, N'Массивная доска', CAST(5.1500000000 AS Decimal(18, 10)))
INSERT [dbo].[Product_type] ([TypeID], [Name], [TypeCoefficient]) VALUES (3, N'Паркетная доска', CAST(4.3400000000 AS Decimal(18, 10)))
INSERT [dbo].[Product_type] ([TypeID], [Name], [TypeCoefficient]) VALUES (4, N'Пробковое покрытие', CAST(1.5000000000 AS Decimal(18, 10)))
GO
INSERT [dbo].[Products] ([Articul], [Type], [Name], [Minimal_price_for_partner]) VALUES (5012543, 4, N'Пробковое напольное клеевое покрытие 32 класс 4 мм', CAST(5450.5900000000 AS Decimal(18, 10)))
INSERT [dbo].[Products] ([Articul], [Type], [Name], [Minimal_price_for_partner]) VALUES (7028748, 1, N'Ламинат Дуб серый 32 класс 8 мм с фаской', CAST(3890.4100000000 AS Decimal(18, 10)))
INSERT [dbo].[Products] ([Articul], [Type], [Name], [Minimal_price_for_partner]) VALUES (7750282, 1, N'Ламинат Дуб дымчато-белый 33 класс 12 мм', CAST(1799.3300000000 AS Decimal(18, 10)))
INSERT [dbo].[Products] ([Articul], [Type], [Name], [Minimal_price_for_partner]) VALUES (8758385, 3, N'Паркетная доска Ясень темный однополосная 14 мм', CAST(4456.9000000000 AS Decimal(18, 10)))
INSERT [dbo].[Products] ([Articul], [Type], [Name], [Minimal_price_for_partner]) VALUES (8858958, 3, N'Инженерная доска Дуб Французская елка однополосная 12 мм', CAST(7330.9900000000 AS Decimal(18, 10)))
GO
ALTER TABLE [dbo].[Partner_product]  WITH CHECK ADD  CONSTRAINT [FK_Partner_product_Partners] FOREIGN KEY([Partner])
REFERENCES [dbo].[Partners] ([Tin])
GO
ALTER TABLE [dbo].[Partner_product] CHECK CONSTRAINT [FK_Partner_product_Partners]
GO
ALTER TABLE [dbo].[Partner_product]  WITH CHECK ADD  CONSTRAINT [FK_Partner_product_Products] FOREIGN KEY([Product])
REFERENCES [dbo].[Products] ([Articul])
GO
ALTER TABLE [dbo].[Partner_product] CHECK CONSTRAINT [FK_Partner_product_Products]
GO
ALTER TABLE [dbo].[Partners]  WITH CHECK ADD  CONSTRAINT [FK_Partners_Partner_type] FOREIGN KEY([Type])
REFERENCES [dbo].[Partner_type] ([TypeID])
GO
ALTER TABLE [dbo].[Partners] CHECK CONSTRAINT [FK_Partners_Partner_type]
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK_Products_Product_type] FOREIGN KEY([Type])
REFERENCES [dbo].[Product_type] ([TypeID])
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_Products_Product_type]
GO
USE [master]
GO
ALTER DATABASE [MasterFloor] SET  READ_WRITE 
GO
