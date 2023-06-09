USE [master]
GO
/****** Object:  Database [Вариант 7]    Script Date: 13.05.2023 10:32:11 ******/
CREATE DATABASE [Вариант 7]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Вариант 7', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\Вариант 7.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Вариант 7_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\Вариант 7_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [Вариант 7] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Вариант 7].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Вариант 7] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Вариант 7] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Вариант 7] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Вариант 7] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Вариант 7] SET ARITHABORT OFF 
GO
ALTER DATABASE [Вариант 7] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Вариант 7] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Вариант 7] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Вариант 7] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Вариант 7] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Вариант 7] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Вариант 7] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Вариант 7] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Вариант 7] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Вариант 7] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Вариант 7] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Вариант 7] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Вариант 7] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Вариант 7] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Вариант 7] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Вариант 7] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Вариант 7] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Вариант 7] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Вариант 7] SET  MULTI_USER 
GO
ALTER DATABASE [Вариант 7] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Вариант 7] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Вариант 7] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Вариант 7] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Вариант 7] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Вариант 7] SET QUERY_STORE = OFF
GO
USE [Вариант 7]
GO
/****** Object:  Table [dbo].[Заказы]    Script Date: 13.05.2023 10:44:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Заказы](
	[Номер] [nvarchar](50) NULL,
	[ID] [nvarchar](50) NULL,
	[Услуга] [nvarchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Клиенты]    Script Date: 13.05.2023 10:44:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Клиенты](
	[ФИО] [nvarchar](255) NULL,
	[Код клиента] [float] NULL,
	[Паспортные данные] [nvarchar](255) NULL,
	[Дата рождения] [datetime] NULL,
	[Адрес] [nvarchar](255) NULL,
	[e-mail] [nvarchar](255) NULL,
	[password] [nvarchar](255) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Роли]    Script Date: 13.05.2023 10:44:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Роли](
	[Код_роли] [nvarchar](50) NULL,
	[Код_сотрудника] [nvarchar](50) NULL,
	[ФИО] [nvarchar](255) NULL,
	[Дата_рождения] [datetime] NULL,
	[Адрес] [nvarchar](255) NULL,
	[Должность] [nvarchar](255) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Сотрудники]    Script Date: 13.05.2023 10:44:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Сотрудники](
	[Код сотрудника] [nvarchar](50) NOT NULL,
	[Должность] [nvarchar](255) NULL,
	[ФИО ] [nvarchar](255) NULL,
	[Логин ] [nvarchar](255) NULL,
	[Пароль] [nvarchar](255) NULL,
	[Последний вход] [nvarchar](255) NULL,
	[Тип входа] [nvarchar](255) NULL,
 CONSTRAINT [PK_Сотрудники] PRIMARY KEY CLUSTERED 
(
	[Код сотрудника] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Услуги]    Script Date: 13.05.2023 10:44:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Услуги](
	[ID] [float] NULL,
	[Наименование услуги] [nvarchar](255) NULL,
	[Код услуги] [nvarchar](50) NOT NULL,
	[Стоимость, руб#  за час ] [float] NULL,
 CONSTRAINT [PK_Услуги] PRIMARY KEY CLUSTERED 
(
	[Код услуги] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Чек]    Script Date: 13.05.2023 10:44:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Чек](
	[Код чека] [float] NULL,
	[Код услуги] [float] NULL,
	[Код клиента] [float] NULL
) ON [PRIMARY]
GO
INSERT [dbo].[Заказы] ([Номер], [ID], [Услуга]) VALUES (N'1', N'1', N'34')
INSERT [dbo].[Заказы] ([Номер], [ID], [Услуга]) VALUES (N'2', N'1', N'31')
INSERT [dbo].[Заказы] ([Номер], [ID], [Услуга]) VALUES (N'3', N'1', N'353')
INSERT [dbo].[Заказы] ([Номер], [ID], [Услуга]) VALUES (N'4', N'1', N'336')
INSERT [dbo].[Заказы] ([Номер], [ID], [Услуга]) VALUES (N'5', N'2', N'98')
INSERT [dbo].[Заказы] ([Номер], [ID], [Услуга]) VALUES (N'6', N'2', N'45')
INSERT [dbo].[Заказы] ([Номер], [ID], [Услуга]) VALUES (N'7', N'2', N'89')
INSERT [dbo].[Заказы] ([Номер], [ID], [Услуга]) VALUES (N'8', N'2', N'99')
INSERT [dbo].[Заказы] ([Номер], [ID], [Услуга]) VALUES (N'9', N'2', N'123')
INSERT [dbo].[Заказы] ([Номер], [ID], [Услуга]) VALUES (N'10', N'3', N'92')
INSERT [dbo].[Заказы] ([Номер], [ID], [Услуга]) VALUES (N'11', N'3', N'45')
INSERT [dbo].[Заказы] ([Номер], [ID], [Услуга]) VALUES (N'12', N'3', N'')
INSERT [dbo].[Заказы] ([Номер], [ID], [Услуга]) VALUES (N'13', N'3', N'57')
INSERT [dbo].[Заказы] ([Номер], [ID], [Услуга]) VALUES (N'14', N'3', N'88')
INSERT [dbo].[Заказы] ([Номер], [ID], [Услуга]) VALUES (N'15', N'4', N'92')
INSERT [dbo].[Заказы] ([Номер], [ID], [Услуга]) VALUES (N'16', N'4', N'45')
INSERT [dbo].[Заказы] ([Номер], [ID], [Услуга]) VALUES (N'17', N'4', N'')
INSERT [dbo].[Заказы] ([Номер], [ID], [Услуга]) VALUES (N'18', N'4', N'57')
INSERT [dbo].[Заказы] ([Номер], [ID], [Услуга]) VALUES (N'19', N'4', N'88')
INSERT [dbo].[Заказы] ([Номер], [ID], [Услуга]) VALUES (N'20', N'4', N'44')
INSERT [dbo].[Заказы] ([Номер], [ID], [Услуга]) VALUES (N'21', N'5', N'98')
INSERT [dbo].[Заказы] ([Номер], [ID], [Услуга]) VALUES (N'22', N'5', N'45')
INSERT [dbo].[Заказы] ([Номер], [ID], [Услуга]) VALUES (N'23', N'5', N'34')
INSERT [dbo].[Заказы] ([Номер], [ID], [Услуга]) VALUES (N'24', N'5', N'89')
INSERT [dbo].[Заказы] ([Номер], [ID], [Услуга]) VALUES (N'25', N'5', N'353')
INSERT [dbo].[Заказы] ([Номер], [ID], [Услуга]) VALUES (N'26', N'5', N'336')
INSERT [dbo].[Заказы] ([Номер], [ID], [Услуга]) VALUES (N'27', N'6', N'34')
INSERT [dbo].[Заказы] ([Номер], [ID], [Услуга]) VALUES (N'28', N'6', N'31')
INSERT [dbo].[Заказы] ([Номер], [ID], [Услуга]) VALUES (N'30', N'6', N'353')
INSERT [dbo].[Заказы] ([Номер], [ID], [Услуга]) VALUES (N'31', N'6', N'337')
INSERT [dbo].[Заказы] ([Номер], [ID], [Услуга]) VALUES (N'32', N'7', N'98')
INSERT [dbo].[Заказы] ([Номер], [ID], [Услуга]) VALUES (N'33', N'7', N'45')
INSERT [dbo].[Заказы] ([Номер], [ID], [Услуга]) VALUES (N'35', N'7', N'89')
INSERT [dbo].[Заказы] ([Номер], [ID], [Услуга]) VALUES (N'36', N'7', N'99')
INSERT [dbo].[Заказы] ([Номер], [ID], [Услуга]) VALUES (N'37', N'7', N'124')
INSERT [dbo].[Заказы] ([Номер], [ID], [Услуга]) VALUES (N'38', N'8', N'92')
INSERT [dbo].[Заказы] ([Номер], [ID], [Услуга]) VALUES (N'39', N'8', N'45')
INSERT [dbo].[Заказы] ([Номер], [ID], [Услуга]) VALUES (N'41', N'8', N'57')
INSERT [dbo].[Заказы] ([Номер], [ID], [Услуга]) VALUES (N'42', N'8', N'89')
INSERT [dbo].[Заказы] ([Номер], [ID], [Услуга]) VALUES (N'43', N'9', N'92')
INSERT [dbo].[Заказы] ([Номер], [ID], [Услуга]) VALUES (N'44', N'9', N'45')
INSERT [dbo].[Заказы] ([Номер], [ID], [Услуга]) VALUES (N'46', N'9', N'57')
INSERT [dbo].[Заказы] ([Номер], [ID], [Услуга]) VALUES (N'47', N'9', N'88')
INSERT [dbo].[Заказы] ([Номер], [ID], [Услуга]) VALUES (N'48', N'9', N'45')
INSERT [dbo].[Заказы] ([Номер], [ID], [Услуга]) VALUES (N'49', N'10', N'98')
INSERT [dbo].[Заказы] ([Номер], [ID], [Услуга]) VALUES (N'50', N'10', N'45')
INSERT [dbo].[Заказы] ([Номер], [ID], [Услуга]) VALUES (N'51', N'10', N'35')
INSERT [dbo].[Заказы] ([Номер], [ID], [Услуга]) VALUES (N'52', N'10', N'89')
INSERT [dbo].[Заказы] ([Номер], [ID], [Услуга]) VALUES (N'53', N'10', N'353')
INSERT [dbo].[Заказы] ([Номер], [ID], [Услуга]) VALUES (N'54', N'10', N'336')
INSERT [dbo].[Заказы] ([Номер], [ID], [Услуга]) VALUES (N'55', N'11', N'34')
INSERT [dbo].[Заказы] ([Номер], [ID], [Услуга]) VALUES (N'56', N'11', N'31')
INSERT [dbo].[Заказы] ([Номер], [ID], [Услуга]) VALUES (N'58', N'11', N'353')
INSERT [dbo].[Заказы] ([Номер], [ID], [Услуга]) VALUES (N'59', N'11', N'338')
INSERT [dbo].[Заказы] ([Номер], [ID], [Услуга]) VALUES (N'60', N'12', N'34')
INSERT [dbo].[Заказы] ([Номер], [ID], [Услуга]) VALUES (N'61', N'12', N'31')
INSERT [dbo].[Заказы] ([Номер], [ID], [Услуга]) VALUES (N'63', N'12', N'353')
INSERT [dbo].[Заказы] ([Номер], [ID], [Услуга]) VALUES (N'64', N'12', N'338')
INSERT [dbo].[Заказы] ([Номер], [ID], [Услуга]) VALUES (N'65', N'13', N'98')
INSERT [dbo].[Заказы] ([Номер], [ID], [Услуга]) VALUES (N'66', N'13', N'45')
INSERT [dbo].[Заказы] ([Номер], [ID], [Услуга]) VALUES (N'68', N'13', N'89')
INSERT [dbo].[Заказы] ([Номер], [ID], [Услуга]) VALUES (N'69', N'13', N'99')
INSERT [dbo].[Заказы] ([Номер], [ID], [Услуга]) VALUES (N'70', N'13', N'125')
INSERT [dbo].[Заказы] ([Номер], [ID], [Услуга]) VALUES (N'71', N'14', N'92')
INSERT [dbo].[Заказы] ([Номер], [ID], [Услуга]) VALUES (N'72', N'14', N'45')
INSERT [dbo].[Заказы] ([Номер], [ID], [Услуга]) VALUES (N'74', N'14', N'57')
INSERT [dbo].[Заказы] ([Номер], [ID], [Услуга]) VALUES (N'75', N'14', N'90')
INSERT [dbo].[Заказы] ([Номер], [ID], [Услуга]) VALUES (N'76', N'15', N'92')
INSERT [dbo].[Заказы] ([Номер], [ID], [Услуга]) VALUES (N'77', N'15', N'45')
INSERT [dbo].[Заказы] ([Номер], [ID], [Услуга]) VALUES (N'79', N'15', N'57')
INSERT [dbo].[Заказы] ([Номер], [ID], [Услуга]) VALUES (N'80', N'15', N'88')
INSERT [dbo].[Заказы] ([Номер], [ID], [Услуга]) VALUES (N'81', N'15', N'46')
INSERT [dbo].[Заказы] ([Номер], [ID], [Услуга]) VALUES (N'82', N'16', N'98')
INSERT [dbo].[Заказы] ([Номер], [ID], [Услуга]) VALUES (N'83', N'16', N'45')
INSERT [dbo].[Заказы] ([Номер], [ID], [Услуга]) VALUES (N'84', N'16', N'36')
INSERT [dbo].[Заказы] ([Номер], [ID], [Услуга]) VALUES (N'85', N'16', N'89')
INSERT [dbo].[Заказы] ([Номер], [ID], [Услуга]) VALUES (N'86', N'16', N'353')
INSERT [dbo].[Заказы] ([Номер], [ID], [Услуга]) VALUES (N'87', N'16', N'336')
INSERT [dbo].[Заказы] ([Номер], [ID], [Услуга]) VALUES (N'88', N'17', N'34')
INSERT [dbo].[Заказы] ([Номер], [ID], [Услуга]) VALUES (N'89', N'17', N'31')
INSERT [dbo].[Заказы] ([Номер], [ID], [Услуга]) VALUES (N'91', N'17', N'353')
INSERT [dbo].[Заказы] ([Номер], [ID], [Услуга]) VALUES (N'92', N'17', N'339')
INSERT [dbo].[Заказы] ([Номер], [ID], [Услуга]) VALUES (N'93', N'18', N'98')
INSERT [dbo].[Заказы] ([Номер], [ID], [Услуга]) VALUES (N'94', N'18', N'45')
INSERT [dbo].[Заказы] ([Номер], [ID], [Услуга]) VALUES (N'96', N'18', N'89')
INSERT [dbo].[Заказы] ([Номер], [ID], [Услуга]) VALUES (N'97', N'18', N'99')
INSERT [dbo].[Заказы] ([Номер], [ID], [Услуга]) VALUES (N'98', N'18', N'126')
INSERT [dbo].[Заказы] ([Номер], [ID], [Услуга]) VALUES (N'99', N'19', N'92')
INSERT [dbo].[Заказы] ([Номер], [ID], [Услуга]) VALUES (N'100', N'19', N'45')
INSERT [dbo].[Заказы] ([Номер], [ID], [Услуга]) VALUES (N'102', N'19', N'57')
INSERT [dbo].[Заказы] ([Номер], [ID], [Услуга]) VALUES (N'103', N'19', N'91')
INSERT [dbo].[Заказы] ([Номер], [ID], [Услуга]) VALUES (N'104', N'20', N'92')
INSERT [dbo].[Заказы] ([Номер], [ID], [Услуга]) VALUES (N'105', N'20', N'45')
INSERT [dbo].[Заказы] ([Номер], [ID], [Услуга]) VALUES (N'107', N'20', N'57')
INSERT [dbo].[Заказы] ([Номер], [ID], [Услуга]) VALUES (N'108', N'20', N'88')
INSERT [dbo].[Заказы] ([Номер], [ID], [Услуга]) VALUES (N'109', N'20', N'47')
INSERT [dbo].[Заказы] ([Номер], [ID], [Услуга]) VALUES (N'110', N'21', N'98')
INSERT [dbo].[Заказы] ([Номер], [ID], [Услуга]) VALUES (N'111', N'21', N'45')
INSERT [dbo].[Заказы] ([Номер], [ID], [Услуга]) VALUES (N'112', N'21', N'37')
INSERT [dbo].[Заказы] ([Номер], [ID], [Услуга]) VALUES (N'113', N'21', N'89')
GO
INSERT [dbo].[Заказы] ([Номер], [ID], [Услуга]) VALUES (N'114', N'21', N'353')
INSERT [dbo].[Заказы] ([Номер], [ID], [Услуга]) VALUES (N'115', N'21', N'336')
INSERT [dbo].[Заказы] ([Номер], [ID], [Услуга]) VALUES (N'116', N'22', N'34')
INSERT [dbo].[Заказы] ([Номер], [ID], [Услуга]) VALUES (N'117', N'22', N'31')
INSERT [dbo].[Заказы] ([Номер], [ID], [Услуга]) VALUES (N'119', N'22', N'353')
INSERT [dbo].[Заказы] ([Номер], [ID], [Услуга]) VALUES (N'120', N'22', N'340')
INSERT [dbo].[Заказы] ([Номер], [ID], [Услуга]) VALUES (N'121', N'23', N'98')
INSERT [dbo].[Заказы] ([Номер], [ID], [Услуга]) VALUES (N'122', N'23', N'45')
INSERT [dbo].[Заказы] ([Номер], [ID], [Услуга]) VALUES (N'124', N'23', N'89')
INSERT [dbo].[Заказы] ([Номер], [ID], [Услуга]) VALUES (N'125', N'23', N'99')
INSERT [dbo].[Заказы] ([Номер], [ID], [Услуга]) VALUES (N'126', N'23', N'127')
INSERT [dbo].[Заказы] ([Номер], [ID], [Услуга]) VALUES (N'127', N'24', N'92')
INSERT [dbo].[Заказы] ([Номер], [ID], [Услуга]) VALUES (N'128', N'24', N'45')
INSERT [dbo].[Заказы] ([Номер], [ID], [Услуга]) VALUES (N'130', N'24', N'57')
INSERT [dbo].[Заказы] ([Номер], [ID], [Услуга]) VALUES (N'131', N'24', N'92')
INSERT [dbo].[Заказы] ([Номер], [ID], [Услуга]) VALUES (N'132', N'25', N'92')
INSERT [dbo].[Заказы] ([Номер], [ID], [Услуга]) VALUES (N'133', N'25', N'45')
INSERT [dbo].[Заказы] ([Номер], [ID], [Услуга]) VALUES (N'135', N'25', N'57')
INSERT [dbo].[Заказы] ([Номер], [ID], [Услуга]) VALUES (N'136', N'25', N'88')
INSERT [dbo].[Заказы] ([Номер], [ID], [Услуга]) VALUES (N'137', N'25', N'48')
INSERT [dbo].[Заказы] ([Номер], [ID], [Услуга]) VALUES (N'138', N'26', N'98')
INSERT [dbo].[Заказы] ([Номер], [ID], [Услуга]) VALUES (N'139', N'26', N'45')
INSERT [dbo].[Заказы] ([Номер], [ID], [Услуга]) VALUES (N'140', N'26', N'38')
INSERT [dbo].[Заказы] ([Номер], [ID], [Услуга]) VALUES (N'141', N'26', N'89')
INSERT [dbo].[Заказы] ([Номер], [ID], [Услуга]) VALUES (N'142', N'26', N'353')
INSERT [dbo].[Заказы] ([Номер], [ID], [Услуга]) VALUES (N'143', N'26', N'336')
INSERT [dbo].[Заказы] ([Номер], [ID], [Услуга]) VALUES (N'144', N'27', N'34')
INSERT [dbo].[Заказы] ([Номер], [ID], [Услуга]) VALUES (N'145', N'27', N'31')
INSERT [dbo].[Заказы] ([Номер], [ID], [Услуга]) VALUES (N'147', N'27', N'353')
INSERT [dbo].[Заказы] ([Номер], [ID], [Услуга]) VALUES (N'148', N'27', N'341')
INSERT [dbo].[Заказы] ([Номер], [ID], [Услуга]) VALUES (N'149', N'28', N'98')
INSERT [dbo].[Заказы] ([Номер], [ID], [Услуга]) VALUES (N'150', N'28', N'45')
INSERT [dbo].[Заказы] ([Номер], [ID], [Услуга]) VALUES (N'152', N'28', N'89')
INSERT [dbo].[Заказы] ([Номер], [ID], [Услуга]) VALUES (N'153', N'28', N'99')
INSERT [dbo].[Заказы] ([Номер], [ID], [Услуга]) VALUES (N'154', N'28', N'128')
INSERT [dbo].[Заказы] ([Номер], [ID], [Услуга]) VALUES (N'155', N'29', N'92')
INSERT [dbo].[Заказы] ([Номер], [ID], [Услуга]) VALUES (N'156', N'29', N'45')
INSERT [dbo].[Заказы] ([Номер], [ID], [Услуга]) VALUES (N'158', N'29', N'57')
INSERT [dbo].[Заказы] ([Номер], [ID], [Услуга]) VALUES (N'159', N'29', N'93')
INSERT [dbo].[Заказы] ([Номер], [ID], [Услуга]) VALUES (N'160', N'30', N'92')
INSERT [dbo].[Заказы] ([Номер], [ID], [Услуга]) VALUES (N'161', N'30', N'45')
INSERT [dbo].[Заказы] ([Номер], [ID], [Услуга]) VALUES (N'163', N'30', N'57')
INSERT [dbo].[Заказы] ([Номер], [ID], [Услуга]) VALUES (N'164', N'30', N'88')
INSERT [dbo].[Заказы] ([Номер], [ID], [Услуга]) VALUES (N'165', N'30', N'49')
INSERT [dbo].[Заказы] ([Номер], [ID], [Услуга]) VALUES (N'166', N'31', N'98')
INSERT [dbo].[Заказы] ([Номер], [ID], [Услуга]) VALUES (N'167', N'31', N'45')
INSERT [dbo].[Заказы] ([Номер], [ID], [Услуга]) VALUES (N'168', N'31', N'39')
INSERT [dbo].[Заказы] ([Номер], [ID], [Услуга]) VALUES (N'169', N'31', N'89')
INSERT [dbo].[Заказы] ([Номер], [ID], [Услуга]) VALUES (N'170', N'31', N'353')
INSERT [dbo].[Заказы] ([Номер], [ID], [Услуга]) VALUES (N'171', N'31', N'336')
INSERT [dbo].[Заказы] ([Номер], [ID], [Услуга]) VALUES (N'172', N'32', N'34')
INSERT [dbo].[Заказы] ([Номер], [ID], [Услуга]) VALUES (N'173', N'32', N'31')
INSERT [dbo].[Заказы] ([Номер], [ID], [Услуга]) VALUES (N'175', N'32', N'353')
INSERT [dbo].[Заказы] ([Номер], [ID], [Услуга]) VALUES (N'176', N'32', N'342')
INSERT [dbo].[Заказы] ([Номер], [ID], [Услуга]) VALUES (N'177', N'33', N'98')
INSERT [dbo].[Заказы] ([Номер], [ID], [Услуга]) VALUES (N'178', N'33', N'45')
INSERT [dbo].[Заказы] ([Номер], [ID], [Услуга]) VALUES (N'180', N'33', N'89')
INSERT [dbo].[Заказы] ([Номер], [ID], [Услуга]) VALUES (N'181', N'33', N'99')
INSERT [dbo].[Заказы] ([Номер], [ID], [Услуга]) VALUES (N'182', N'33', N'129')
INSERT [dbo].[Заказы] ([Номер], [ID], [Услуга]) VALUES (N'183', N'34', N'92')
INSERT [dbo].[Заказы] ([Номер], [ID], [Услуга]) VALUES (N'184', N'34', N'45')
INSERT [dbo].[Заказы] ([Номер], [ID], [Услуга]) VALUES (N'186', N'34', N'57')
INSERT [dbo].[Заказы] ([Номер], [ID], [Услуга]) VALUES (N'187', N'34', N'94')
INSERT [dbo].[Заказы] ([Номер], [ID], [Услуга]) VALUES (N'188', N'35', N'92')
INSERT [dbo].[Заказы] ([Номер], [ID], [Услуга]) VALUES (N'189', N'35', N'45')
INSERT [dbo].[Заказы] ([Номер], [ID], [Услуга]) VALUES (N'191', N'35', N'57')
INSERT [dbo].[Заказы] ([Номер], [ID], [Услуга]) VALUES (N'192', N'35', N'88')
INSERT [dbo].[Заказы] ([Номер], [ID], [Услуга]) VALUES (N'193', N'35', N'50')
INSERT [dbo].[Заказы] ([Номер], [ID], [Услуга]) VALUES (N'194', N'36', N'98')
INSERT [dbo].[Заказы] ([Номер], [ID], [Услуга]) VALUES (N'195', N'36', N'45')
INSERT [dbo].[Заказы] ([Номер], [ID], [Услуга]) VALUES (N'196', N'36', N'40')
INSERT [dbo].[Заказы] ([Номер], [ID], [Услуга]) VALUES (N'197', N'36', N'89')
INSERT [dbo].[Заказы] ([Номер], [ID], [Услуга]) VALUES (N'198', N'36', N'353')
INSERT [dbo].[Заказы] ([Номер], [ID], [Услуга]) VALUES (N'199', N'36', N'336')
INSERT [dbo].[Заказы] ([Номер], [ID], [Услуга]) VALUES (N'200', N'37', N'34')
INSERT [dbo].[Заказы] ([Номер], [ID], [Услуга]) VALUES (N'201', N'37', N'31')
INSERT [dbo].[Заказы] ([Номер], [ID], [Услуга]) VALUES (N'203', N'37', N'353')
INSERT [dbo].[Заказы] ([Номер], [ID], [Услуга]) VALUES (N'204', N'37', N'343')
INSERT [dbo].[Заказы] ([Номер], [ID], [Услуга]) VALUES (N'205', N'38', N'98')
INSERT [dbo].[Заказы] ([Номер], [ID], [Услуга]) VALUES (N'206', N'38', N'45')
INSERT [dbo].[Заказы] ([Номер], [ID], [Услуга]) VALUES (N'208', N'38', N'89')
INSERT [dbo].[Заказы] ([Номер], [ID], [Услуга]) VALUES (N'209', N'38', N'99')
INSERT [dbo].[Заказы] ([Номер], [ID], [Услуга]) VALUES (N'210', N'38', N'130')
INSERT [dbo].[Заказы] ([Номер], [ID], [Услуга]) VALUES (N'211', N'39', N'92')
INSERT [dbo].[Заказы] ([Номер], [ID], [Услуга]) VALUES (N'212', N'39', N'45')
INSERT [dbo].[Заказы] ([Номер], [ID], [Услуга]) VALUES (N'214', N'39', N'57')
INSERT [dbo].[Заказы] ([Номер], [ID], [Услуга]) VALUES (N'215', N'39', N'95')
INSERT [dbo].[Заказы] ([Номер], [ID], [Услуга]) VALUES (N'216', N'40', N'92')
INSERT [dbo].[Заказы] ([Номер], [ID], [Услуга]) VALUES (N'217', N'40', N'45')
INSERT [dbo].[Заказы] ([Номер], [ID], [Услуга]) VALUES (N'219', N'40', N'57')
INSERT [dbo].[Заказы] ([Номер], [ID], [Услуга]) VALUES (N'220', N'40', N'88')
INSERT [dbo].[Заказы] ([Номер], [ID], [Услуга]) VALUES (N'221', N'40', N'51')
INSERT [dbo].[Заказы] ([Номер], [ID], [Услуга]) VALUES (N'222', N'41', N'98')
INSERT [dbo].[Заказы] ([Номер], [ID], [Услуга]) VALUES (N'223', N'41', N'45')
INSERT [dbo].[Заказы] ([Номер], [ID], [Услуга]) VALUES (N'224', N'41', N'41')
INSERT [dbo].[Заказы] ([Номер], [ID], [Услуга]) VALUES (N'225', N'41', N'89')
INSERT [dbo].[Заказы] ([Номер], [ID], [Услуга]) VALUES (N'226', N'41', N'353')
INSERT [dbo].[Заказы] ([Номер], [ID], [Услуга]) VALUES (N'227', N'41', N'336')
INSERT [dbo].[Заказы] ([Номер], [ID], [Услуга]) VALUES (N'228', N'42', N'34')
INSERT [dbo].[Заказы] ([Номер], [ID], [Услуга]) VALUES (N'229', N'42', N'31')
GO
INSERT [dbo].[Заказы] ([Номер], [ID], [Услуга]) VALUES (N'231', N'42', N'353')
INSERT [dbo].[Заказы] ([Номер], [ID], [Услуга]) VALUES (N'232', N'42', N'344')
INSERT [dbo].[Заказы] ([Номер], [ID], [Услуга]) VALUES (N'233', N'43', N'98')
INSERT [dbo].[Заказы] ([Номер], [ID], [Услуга]) VALUES (N'234', N'43', N'45')
INSERT [dbo].[Заказы] ([Номер], [ID], [Услуга]) VALUES (N'236', N'43', N'89')
INSERT [dbo].[Заказы] ([Номер], [ID], [Услуга]) VALUES (N'237', N'43', N'99')
INSERT [dbo].[Заказы] ([Номер], [ID], [Услуга]) VALUES (N'238', N'43', N'131')
INSERT [dbo].[Заказы] ([Номер], [ID], [Услуга]) VALUES (N'239', N'44', N'92')
INSERT [dbo].[Заказы] ([Номер], [ID], [Услуга]) VALUES (N'240', N'44', N'45')
INSERT [dbo].[Заказы] ([Номер], [ID], [Услуга]) VALUES (N'242', N'44', N'57')
INSERT [dbo].[Заказы] ([Номер], [ID], [Услуга]) VALUES (N'243', N'44', N'96')
INSERT [dbo].[Заказы] ([Номер], [ID], [Услуга]) VALUES (N'244', N'45', N'92')
INSERT [dbo].[Заказы] ([Номер], [ID], [Услуга]) VALUES (N'245', N'45', N'45')
INSERT [dbo].[Заказы] ([Номер], [ID], [Услуга]) VALUES (N'247', N'45', N'57')
INSERT [dbo].[Заказы] ([Номер], [ID], [Услуга]) VALUES (N'248', N'45', N'88')
INSERT [dbo].[Заказы] ([Номер], [ID], [Услуга]) VALUES (N'249', N'45', N'52')
INSERT [dbo].[Заказы] ([Номер], [ID], [Услуга]) VALUES (N'250', N'46', N'98')
INSERT [dbo].[Заказы] ([Номер], [ID], [Услуга]) VALUES (N'251', N'46', N'45')
INSERT [dbo].[Заказы] ([Номер], [ID], [Услуга]) VALUES (N'252', N'46', N'42')
INSERT [dbo].[Заказы] ([Номер], [ID], [Услуга]) VALUES (N'253', N'46', N'89')
INSERT [dbo].[Заказы] ([Номер], [ID], [Услуга]) VALUES (N'254', N'46', N'353')
INSERT [dbo].[Заказы] ([Номер], [ID], [Услуга]) VALUES (N'255', N'46', N'336')
INSERT [dbo].[Заказы] ([Номер], [ID], [Услуга]) VALUES (N'256', N'47', N'34')
INSERT [dbo].[Заказы] ([Номер], [ID], [Услуга]) VALUES (N'257', N'47', N'31')
INSERT [dbo].[Заказы] ([Номер], [ID], [Услуга]) VALUES (N'259', N'47', N'353')
INSERT [dbo].[Заказы] ([Номер], [ID], [Услуга]) VALUES (N'260', N'47', N'345')
INSERT [dbo].[Заказы] ([Номер], [ID], [Услуга]) VALUES (N'261', N'48', N'98')
INSERT [dbo].[Заказы] ([Номер], [ID], [Услуга]) VALUES (N'262', N'48', N'45')
INSERT [dbo].[Заказы] ([Номер], [ID], [Услуга]) VALUES (N'264', N'48', N'89')
INSERT [dbo].[Заказы] ([Номер], [ID], [Услуга]) VALUES (N'265', N'48', N'99')
INSERT [dbo].[Заказы] ([Номер], [ID], [Услуга]) VALUES (N'266', N'48', N'132')
INSERT [dbo].[Заказы] ([Номер], [ID], [Услуга]) VALUES (N'267', N'49', N'92')
INSERT [dbo].[Заказы] ([Номер], [ID], [Услуга]) VALUES (N'268', N'49', N'45')
INSERT [dbo].[Заказы] ([Номер], [ID], [Услуга]) VALUES (N'270', N'49', N'57')
INSERT [dbo].[Заказы] ([Номер], [ID], [Услуга]) VALUES (N'271', N'49', N'97')
INSERT [dbo].[Заказы] ([Номер], [ID], [Услуга]) VALUES (N'272', N'50', N'92')
INSERT [dbo].[Заказы] ([Номер], [ID], [Услуга]) VALUES (N'273', N'50', N'45')
INSERT [dbo].[Заказы] ([Номер], [ID], [Услуга]) VALUES (N'275', N'50', N'57')
INSERT [dbo].[Заказы] ([Номер], [ID], [Услуга]) VALUES (N'276', N'50', N'88')
INSERT [dbo].[Заказы] ([Номер], [ID], [Услуга]) VALUES (N'277', N'50', N'53')
INSERT [dbo].[Заказы] ([Номер], [ID], [Услуга]) VALUES (N'278', N'51', N'98')
INSERT [dbo].[Заказы] ([Номер], [ID], [Услуга]) VALUES (N'279', N'51', N'45')
INSERT [dbo].[Заказы] ([Номер], [ID], [Услуга]) VALUES (N'280', N'51', N'43')
INSERT [dbo].[Заказы] ([Номер], [ID], [Услуга]) VALUES (N'281', N'51', N'89')
INSERT [dbo].[Заказы] ([Номер], [ID], [Услуга]) VALUES (N'282', N'51', N'353')
INSERT [dbo].[Заказы] ([Номер], [ID], [Услуга]) VALUES (N'283', N'51', N'336')
GO
INSERT [dbo].[Клиенты] ([ФИО], [Код клиента], [Паспортные данные], [Дата рождения], [Адрес], [e-mail], [password]) VALUES (N'Фролов Андрей Иванович', 45462526, N' 1180  176596', CAST(N'2001-07-14T00:00:00.000' AS DateTime), N'344288, г. Санкт-Петербург, ул. Чехова, 1, кв. 34', N'gohufreilagrau-3818@yopmail.com', N'cl12345')
INSERT [dbo].[Клиенты] ([ФИО], [Код клиента], [Паспортные данные], [Дата рождения], [Адрес], [e-mail], [password]) VALUES (N'Николаев Даниил Всеволодович', 45462527, N' 2280  223523', CAST(N'2001-02-10T00:00:00.000' AS DateTime), N'614164, г. Санкт-Петербург, ул. Степная, 30, кв. 75', N'xawugosune-1385@yopmail.com', N'cl12346')
INSERT [dbo].[Клиенты] ([ФИО], [Код клиента], [Паспортные данные], [Дата рождения], [Адрес], [e-mail], [password]) VALUES (N'Снегирев Макар Иванович', 45462528, N' 4560  354155', CAST(N'1998-05-21T00:00:00.000' AS DateTime), N'394242, г. Санкт-Петербург, ул. Коммунистическая, 43, кв. 57', N'satrahuddusei-4458@yopmail.com', N'cl12347')
INSERT [dbo].[Клиенты] ([ФИО], [Код клиента], [Паспортные данные], [Дата рождения], [Адрес], [e-mail], [password]) VALUES (N'Иванов Иван Ильич', 45462529, N' 9120  554296', CAST(N'1998-10-01T00:00:00.000' AS DateTime), N'660540, г. Санкт-Петербург, ул. Солнечная, 25, кв. 78', N'boippaxeufrepra-7093@yopmail.com', N'cl12348')
INSERT [dbo].[Клиенты] ([ФИО], [Код клиента], [Паспортные данные], [Дата рождения], [Адрес], [e-mail], [password]) VALUES (N'Филиппова Анна Глебовна', 45462530, N' 2367  558134', CAST(N'1976-05-31T00:00:00.000' AS DateTime), N'125837, г. Санкт-Петербург, ул. Шоссейная, 40, кв. 92', N'zapramaxesu-7741@yopmail.com', N'cl12349')
INSERT [dbo].[Клиенты] ([ФИО], [Код клиента], [Паспортные данные], [Дата рождения], [Адрес], [e-mail], [password]) VALUES (N'Иванов Михаил Владимирович', 45462531, N' 7101  669343', CAST(N'1985-11-04T00:00:00.000' AS DateTime), N'125703, г. Санкт-Петербург, ул. Партизанская, 49, кв. 84', N'rouzecroummegre-3899@yopmail.com', N'cl12350')
INSERT [dbo].[Клиенты] ([ФИО], [Код клиента], [Паспортные данные], [Дата рождения], [Адрес], [e-mail], [password]) VALUES (N'Власов Дмитрий Александрович', 45462532, N' 3455  719630', CAST(N'1998-08-17T00:00:00.000' AS DateTime), N'625283, г. Санкт-Петербург, ул. Победы, 46, кв. 7', N'ziyeuddocrabri-4748@yopmail.com', N'cl12351')
INSERT [dbo].[Клиенты] ([ФИО], [Код клиента], [Паспортные данные], [Дата рождения], [Адрес], [e-mail], [password]) VALUES (N'Серова Екатерина Львовна', 45462533, N' 2377  871623', CAST(N'1984-10-24T00:00:00.000' AS DateTime), N'614611, г. Санкт-Петербург, ул. Молодежная, 50, кв. 78', N'ketameissoinnei-1951@yopmail.com', N'cl12352')
INSERT [dbo].[Клиенты] ([ФИО], [Код клиента], [Паспортные данные], [Дата рождения], [Адрес], [e-mail], [password]) VALUES (N'Борисова Ирина Ивановна', 45462534, N' 8755  921148', CAST(N'1976-10-14T00:00:00.000' AS DateTime), N'454311, г. Санкт-Петербург, ул. Новая, 19, кв. 78', N'yipraubaponou-5849@yopmail.com', N'cl12353')
INSERT [dbo].[Клиенты] ([ФИО], [Код клиента], [Паспортные данные], [Дата рождения], [Адрес], [e-mail], [password]) VALUES (N'Зайцев Никита Артёмович', 45462535, N' 4355  104594', CAST(N'1999-10-14T00:00:00.000' AS DateTime), N'660007, г. Санкт-Петербург, ул. Октябрьская, 19, кв. 42', N'crapedocouca-3572@yopmail.com', N'cl12354')
INSERT [dbo].[Клиенты] ([ФИО], [Код клиента], [Паспортные данные], [Дата рождения], [Адрес], [e-mail], [password]) VALUES (N'Медведев Святослав Евгеньевич', 45462536, N' 2791  114390', CAST(N'1985-07-13T00:00:00.000' AS DateTime), N'603036, г. Санкт-Петербург, ул. Садовая, 4, кв. 13', N'ceigoixakaunni-9227@yopmail.com', N'cl12355')
INSERT [dbo].[Клиенты] ([ФИО], [Код клиента], [Паспортные данные], [Дата рождения], [Адрес], [e-mail], [password]) VALUES (N'Коротков Кирилл Алексеевич', 45462537, N' 5582  126286', CAST(N'1976-05-26T00:00:00.000' AS DateTime), N'450983, г. Санкт-Петербург, ул. Комсомольская, 26, кв. 60', N'yeimmeiwauzomo-7054@yopmail.com', N'cl12356')
INSERT [dbo].[Клиенты] ([ФИО], [Код клиента], [Паспортные данные], [Дата рождения], [Адрес], [e-mail], [password]) VALUES (N'Калашникова Арина Максимовна', 45462538, N' 2978  133653', CAST(N'1999-08-13T00:00:00.000' AS DateTime), N'394782, г. Санкт-Петербург, ул. Чехова, 3, кв. 14', N'poleifenevi-1560@yopmail.com', N'cl12357')
INSERT [dbo].[Клиенты] ([ФИО], [Код клиента], [Паспортные данные], [Дата рождения], [Адрес], [e-mail], [password]) VALUES (N'Минина Таисия Кирилловна', 45462539, N' 7512  141956', CAST(N'1985-10-13T00:00:00.000' AS DateTime), N'603002, г. Санкт-Петербург, ул. Дзержинского, 28, кв. 56', N'kauprezofautei-6607@yopmail.com', N'cl12358')
INSERT [dbo].[Клиенты] ([ФИО], [Код клиента], [Паспортные данные], [Дата рождения], [Адрес], [e-mail], [password]) VALUES (N'Наумов Серафим Романович', 45462540, N' 5046  158433', CAST(N'1999-04-15T00:00:00.000' AS DateTime), N'450558, г. Санкт-Петербург, ул. Набережная, 30, кв. 71', N'quaffaullelourei-1667@yopmail.com', N'cl12359')
INSERT [dbo].[Клиенты] ([ФИО], [Код клиента], [Паспортные данные], [Дата рождения], [Адрес], [e-mail], [password]) VALUES (N'Воробьева Василиса Евгеньевна', 45462541, N' 2460  169505', CAST(N'1999-01-13T00:00:00.000' AS DateTime), N'394060, г. Санкт-Петербург, ул. Фрунзе, 43, кв. 79', N'jsteele@rojas-robinson.net', N'cl12360')
INSERT [dbo].[Клиенты] ([ФИО], [Код клиента], [Паспортные данные], [Дата рождения], [Адрес], [e-mail], [password]) VALUES (N'Калинин Александр Андреевич', 45462542, N' 3412  174593', CAST(N'1999-01-07T00:00:00.000' AS DateTime), N'410661, г. Санкт-Петербург, ул. Школьная, 50, кв. 53', N'vhopkins@lewis-mullen.com', N'cl12361')
INSERT [dbo].[Клиенты] ([ФИО], [Код клиента], [Паспортные данные], [Дата рождения], [Адрес], [e-mail], [password]) VALUES (N'Кузнецова Милана Владиславовна', 45462543, N' 4950  183032', CAST(N'1999-01-24T00:00:00.000' AS DateTime), N'625590, г. Санкт-Петербург, ул. Коммунистическая, 20, кв. 34', N'nlewis@yahoo.com', N'cl12362')
INSERT [dbo].[Клиенты] ([ФИО], [Код клиента], [Паспортные данные], [Дата рождения], [Адрес], [e-mail], [password]) VALUES (N'Фирсов Егор Романович', 45462544, N' 5829  219464', CAST(N'1993-09-02T00:00:00.000' AS DateTime), N'625683, г. Санкт-Петербург, ул. 8 Марта, 20, кв. 21', N'garciadavid@mckinney-mcbride.com', N'cl12363')
INSERT [dbo].[Клиенты] ([ФИО], [Код клиента], [Паспортные данные], [Дата рождения], [Адрес], [e-mail], [password]) VALUES (N'Зимина Агния Александровна', 45462545, N' 6443  208059', CAST(N'1998-09-03T00:00:00.000' AS DateTime), N'400562, г. Санкт-Петербург, ул. Зеленая, 32, кв. 67', N'cbradley@castro.com', N'cl12364')
INSERT [dbo].[Клиенты] ([ФИО], [Код клиента], [Паспортные данные], [Дата рождения], [Адрес], [e-mail], [password]) VALUES (N'Титов Андрей Глебович', 45462546, N' 7079  213265', CAST(N'1985-10-23T00:00:00.000' AS DateTime), N'614510, г. Санкт-Петербург, ул. Маяковского, 47, кв. 72', N'cuevascatherine@carlson.biz', N'cl12365')
INSERT [dbo].[Клиенты] ([ФИО], [Код клиента], [Паспортные данные], [Дата рождения], [Адрес], [e-mail], [password]) VALUES (N'Орлов Николай Егорович', 45462547, N' 8207  522702', CAST(N'1985-07-27T00:00:00.000' AS DateTime), N'410542, г. Санкт-Петербург, ул. Светлая, 46, кв. 82', N'thomasmoore@wilson-singh.net', N'cl12366')
INSERT [dbo].[Клиенты] ([ФИО], [Код клиента], [Паспортные данные], [Дата рождения], [Адрес], [e-mail], [password]) VALUES (N'Кузнецова Аиша Михайловна', 45462548, N' 9307  232158', CAST(N'1998-10-04T00:00:00.000' AS DateTime), N'620839, г. Санкт-Петербург, ул. Цветочная, 8, кв. 100', N'jessica84@hotmail.com', N'cl12367')
INSERT [dbo].[Клиенты] ([ФИО], [Код клиента], [Паспортные данные], [Дата рождения], [Адрес], [e-mail], [password]) VALUES (N'Куликов Никита Георгиевич', 45462549, N' 1357  242839', CAST(N'1999-04-23T00:00:00.000' AS DateTime), N'443890, г. Санкт-Петербург, ул. Коммунистическая, 1, кв. 10', N'jessicapark@hotmail.com', N'cl12368')
INSERT [dbo].[Клиенты] ([ФИО], [Код клиента], [Паспортные данные], [Дата рождения], [Адрес], [e-mail], [password]) VALUES (N'Карпова София Егоровна', 45462550, N' 1167  256636', CAST(N'1993-10-01T00:00:00.000' AS DateTime), N'603379, г. Санкт-Петербург, ул. Спортивная, 46, кв. 95', N'ginaritter@schneider-buchanan.com', N'cl12369')
INSERT [dbo].[Клиенты] ([ФИО], [Код клиента], [Паспортные данные], [Дата рождения], [Адрес], [e-mail], [password]) VALUES (N'Смирнова Дарья Макаровна', 45462551, N' 1768  266986', CAST(N'1976-03-22T00:00:00.000' AS DateTime), N'603721, г. Санкт-Петербург, ул. Гоголя, 41, кв. 57', N'stephen99@yahoo.com', N'cl12370')
INSERT [dbo].[Клиенты] ([ФИО], [Код клиента], [Паспортные данные], [Дата рождения], [Адрес], [e-mail], [password]) VALUES (N'Абрамова Александра Мироновна', 45462552, N' 1710  427875', CAST(N'1999-03-26T00:00:00.000' AS DateTime), N'410172, г. Санкт-Петербург, ул. Северная, 13, кв. 86', N'lopezlisa@hotmail.com', N'cl12371')
INSERT [dbo].[Клиенты] ([ФИО], [Код клиента], [Паспортные данные], [Дата рождения], [Адрес], [e-mail], [password]) VALUES (N'Наумов Руслан Михайлович', 45462553, N' 1806  289145', CAST(N'1999-10-11T00:00:00.000' AS DateTime), N'420151, г. Санкт-Петербург, ул. Вишневая, 32, кв. 81', N'lori17@hotmail.com', N'cl12372')
INSERT [dbo].[Клиенты] ([ФИО], [Код клиента], [Паспортные данные], [Дата рождения], [Адрес], [e-mail], [password]) VALUES (N'Бочаров Никита Матвеевич', 45462554, N' 1587  291249', CAST(N'1997-06-29T00:00:00.000' AS DateTime), N'125061, г. Санкт-Петербург, ул. Подгорная, 8, кв. 74', N'campbellkevin@gardner.com', N'cl12373')
INSERT [dbo].[Клиенты] ([ФИО], [Код клиента], [Паспортные данные], [Дата рождения], [Адрес], [e-mail], [password]) VALUES (N'Соловьев Давид Ильич', 45462555, N' 1647  306372', CAST(N'1984-03-06T00:00:00.000' AS DateTime), N'630370, г. Санкт-Петербург, ул. Шоссейная, 24, кв. 81', N'morganhoward@clark.com', N'cl12374')
INSERT [dbo].[Клиенты] ([ФИО], [Код клиента], [Паспортные данные], [Дата рождения], [Адрес], [e-mail], [password]) VALUES (N'Васильева Валерия Дмитриевна', 45462556, N' 1742  316556', CAST(N'1999-09-30T00:00:00.000' AS DateTime), N'614753, г. Санкт-Петербург, ул. Полевая, 35, кв. 39', N'carsontamara@gmail.com', N'cl12375')
INSERT [dbo].[Клиенты] ([ФИО], [Код клиента], [Паспортные данные], [Дата рождения], [Адрес], [e-mail], [password]) VALUES (N'Макарова Василиса Андреевна', 45462557, N' 1474  326347', CAST(N'1999-04-08T00:00:00.000' AS DateTime), N'426030, г. Санкт-Петербург, ул. Маяковского, 44, кв. 93', N'kevinpatel@gmail.com', N'cl12376')
INSERT [dbo].[Клиенты] ([ФИО], [Код клиента], [Паспортные данные], [Дата рождения], [Адрес], [e-mail], [password]) VALUES (N'Алексеев Матвей Викторович', 45462558, N' 1452  339539', CAST(N'1998-08-02T00:00:00.000' AS DateTime), N'450375, г. Санкт-Петербург, ул. Клубная, 44, кв. 80', N'sethbishop@yahoo.com', N'cl12377')
INSERT [dbo].[Клиенты] ([ФИО], [Код клиента], [Паспортные данные], [Дата рождения], [Адрес], [e-mail], [password]) VALUES (N'Никитина Полина Александровна', 45462559, N' 2077  443480', CAST(N'1976-09-19T00:00:00.000' AS DateTime), N'625560, г. Санкт-Петербург, ул. Некрасова, 12, кв. 66', N'drollins@schultz-soto.net', N'cl12378')
INSERT [dbo].[Клиенты] ([ФИО], [Код клиента], [Паспортные данные], [Дата рождения], [Адрес], [e-mail], [password]) VALUES (N'Окулова Олеся Алексеевна', 45462560, N' 2147  357518', CAST(N'1999-04-03T00:00:00.000' AS DateTime), N'630201, г. Санкт-Петербург, ул. Комсомольская, 17, кв. 25', N'pblack@copeland-winters.org', N'cl12379')
INSERT [dbo].[Клиенты] ([ФИО], [Код клиента], [Паспортные данные], [Дата рождения], [Адрес], [e-mail], [password]) VALUES (N'Захарова Полина Яновна', 45462561, N' 2687  363884', CAST(N'1976-04-21T00:00:00.000' AS DateTime), N'190949, г. Санкт-Петербург, ул. Мичурина, 26, кв. 93', N'johnathon.oberbrunner@yahoo.com', N'cl12380')
INSERT [dbo].[Клиенты] ([ФИО], [Код клиента], [Паспортные данные], [Дата рождения], [Адрес], [e-mail], [password]) VALUES (N'Зайцев Владимир Давидович', 45462562, N' 2376  443711', CAST(N'1998-01-26T00:00:00.000' AS DateTime), N'350501, г. Санкт-Петербург, ул. Парковая, 2, кв. 7', N'bradly29@gmail.com', N'cl12381')
INSERT [dbo].[Клиенты] ([ФИО], [Код клиента], [Паспортные данные], [Дата рождения], [Адрес], [e-mail], [password]) VALUES (N'Иванов Виталий Даниилович', 45462563, N' 2568  386237', CAST(N'1976-08-11T00:00:00.000' AS DateTime), N'450048, г. Санкт-Петербург, ул. Коммунистическая, 21, кв. 3', N'stark.cristina@hilpert.biz', N'cl12382')
INSERT [dbo].[Клиенты] ([ФИО], [Код клиента], [Паспортные данные], [Дата рождения], [Адрес], [e-mail], [password]) VALUES (N'Захаров Матвей Романович', 45462564, N' 2556  439376', CAST(N'1993-07-12T00:00:00.000' AS DateTime), N'644921, г. Санкт-Петербург, ул. Школьная, 46, кв. 37', N'bruen.eleanore@yahoo.com', N'cl12383')
INSERT [dbo].[Клиенты] ([ФИО], [Код клиента], [Паспортные данные], [Дата рождения], [Адрес], [e-mail], [password]) VALUES (N'Иванов Степан Степанович', 45462565, N' 2737  407501', CAST(N'1998-09-19T00:00:00.000' AS DateTime), N'614228, г. Санкт-Петербург, ул. Дорожная, 36, кв. 54', N'percival.halvorson@yahoo.com', N'cl12384')
INSERT [dbo].[Клиенты] ([ФИО], [Код клиента], [Паспортные данные], [Дата рождения], [Адрес], [e-mail], [password]) VALUES (N'Ткачева Милана Тимуровна', 45462566, N' 2581  441645', CAST(N'1998-05-24T00:00:00.000' AS DateTime), N'350940, г. Санкт-Петербург, ул. Первомайская, 23, кв. 2', N'javonte71@kuhlman.biz', N'cl12385')
INSERT [dbo].[Клиенты] ([ФИО], [Код клиента], [Паспортные данные], [Дата рождения], [Адрес], [e-mail], [password]) VALUES (N'Семенов Даниил Иванович', 45462567, N' 2675  427933', CAST(N'1976-01-04T00:00:00.000' AS DateTime), N'344990, г. Санкт-Петербург, ул. Красноармейская, 19, кв. 92', N'vconnelly@kautzer.com', N'cl12386')
INSERT [dbo].[Клиенты] ([ФИО], [Код клиента], [Паспортные данные], [Дата рождения], [Адрес], [e-mail], [password]) VALUES (N'Виноградов Вячеслав Дмитриевич', 45462568, N' 2967  434531', CAST(N'1976-07-12T00:00:00.000' AS DateTime), N'410248, г. Санкт-Петербург, ул. Чкалова, 11, кв. 75', N'anabelle07@schultz.info', N'cl12387')
INSERT [dbo].[Клиенты] ([ФИО], [Код клиента], [Паспортные данные], [Дата рождения], [Адрес], [e-mail], [password]) VALUES (N'Соболева Николь Фёдоровна', 45462569, N' 3070  449655', CAST(N'1976-05-02T00:00:00.000' AS DateTime), N'400839, г. Санкт-Петербург, ул. 8 Марта, 46, кв. 44', N'nitzsche.katlynn@yahoo.com', N'cl12388')
INSERT [dbo].[Клиенты] ([ФИО], [Код клиента], [Паспортные данные], [Дата рождения], [Адрес], [e-mail], [password]) VALUES (N'Тихонова Анна Львовна', 45462570, N' 3108  451174', CAST(N'1985-03-23T00:00:00.000' AS DateTime), N'450539, г. Санкт-Петербург, ул. Заводская, 3, кв. 81', N'corine16@von.com', N'cl12389')
INSERT [dbo].[Клиенты] ([ФИО], [Код клиента], [Паспортные данные], [Дата рождения], [Адрес], [e-mail], [password]) VALUES (N'Кузнецова Ульяна Савельевна', 45462571, N' 3250  464705', CAST(N'1999-06-03T00:00:00.000' AS DateTime), N'614591, г. Санкт-Петербург, ул. Цветочная, 20, кв. 40', N'otha.wisozk@lubowitz.org', N'cl12390')
INSERT [dbo].[Клиенты] ([ФИО], [Код клиента], [Паспортные данные], [Дата рождения], [Адрес], [e-mail], [password]) VALUES (N'Смирнова Анна Германовна', 45462572, N' 3392  471644', CAST(N'1997-07-18T00:00:00.000' AS DateTime), N'400260, г. Санкт-Петербург, ул. Больничная, 30, кв. 53', N'may.kirlin@hotmail.com', N'cl12391')
INSERT [dbo].[Клиенты] ([ФИО], [Код клиента], [Паспортные данные], [Дата рождения], [Адрес], [e-mail], [password]) VALUES (N'Черепанова Анна Давидовна', 45462573, N' 3497  487819', CAST(N'1985-11-06T00:00:00.000' AS DateTime), N'660924, г. Санкт-Петербург, ул. Молодежная, 32, кв. 59', N'bryana.kautzer@yahoo.com', N'cl12392')
INSERT [dbo].[Клиенты] ([ФИО], [Код клиента], [Паспортные данные], [Дата рождения], [Адрес], [e-mail], [password]) VALUES (N'Григорьев Максим Кириллович', 45462574, N' 3560  491260', CAST(N'1999-05-26T00:00:00.000' AS DateTime), N'644133, г. Санкт-Петербург, ул. Гагарина, 28, кв. 69', N'deborah.christiansen@quigley.biz', N'cl12393')
INSERT [dbo].[Клиенты] ([ФИО], [Код клиента], [Паспортные данные], [Дата рождения], [Адрес], [e-mail], [password]) VALUES (N'Голубев Даниэль Александрович', 45462575, N' 3620  506034', CAST(N'1999-06-14T00:00:00.000' AS DateTime), N'450698, г. Санкт-Петербург, ул. Вокзальная, 14, кв. 37', N'connelly.makayla@yahoo.com', N'cl12394')
INSERT [dbo].[Клиенты] ([ФИО], [Код клиента], [Паспортные данные], [Дата рождения], [Адрес], [e-mail], [password]) VALUES (N'Миронов Юрий Денисович', 45462576, N' 3774  511438', CAST(N'1985-01-26T00:00:00.000' AS DateTime), N'620653, г. Санкт-Петербург, ул. Западная, 15, кв. 25', N'tatum.collins@fay.org', N'cl12395')
INSERT [dbo].[Клиенты] ([ФИО], [Код клиента], [Паспортные данные], [Дата рождения], [Адрес], [e-mail], [password]) VALUES (N'Терехов Михаил Андреевич', 45462577, N' 3862  521377', CAST(N'1976-07-06T00:00:00.000' AS DateTime), N'644321, г. Санкт-Петербург, ул. Клубная, 32, кв. 10', N'itzel73@anderson.com', N'cl12396')
INSERT [dbo].[Клиенты] ([ФИО], [Код клиента], [Паспортные данные], [Дата рождения], [Адрес], [e-mail], [password]) VALUES (N'Орлова Алиса Михайловна', 45462578, N' 3084  535966', CAST(N'1997-02-24T00:00:00.000' AS DateTime), N'603653, г. Санкт-Петербург, ул. Молодежная, 2, кв. 45', N'arjun39@hotmail.com', N'cl12397')
INSERT [dbo].[Клиенты] ([ФИО], [Код клиента], [Паспортные данные], [Дата рождения], [Адрес], [e-mail], [password]) VALUES (N'Кулаков Константин Даниилович', 45462579, N' 4021  541528', CAST(N'1993-06-20T00:00:00.000' AS DateTime), N'410181, г. Санкт-Петербург, ул. Механизаторов, 16, кв. 74', N'ohara.rebeka@yahoo.com', N'cl12398')
INSERT [dbo].[Клиенты] ([ФИО], [Код клиента], [Паспортные данные], [Дата рождения], [Адрес], [e-mail], [password]) VALUES (N'Кудрявцев Максим Романович', 45462580, N' 4109  554053', CAST(N'1998-05-10T00:00:00.000' AS DateTime), N'394207, г. Санкт-Петербург, ул. Свердлова, 31, кв. 28', N'danika58@rath.com', N'cl12399')
INSERT [dbo].[Клиенты] ([ФИО], [Код клиента], [Паспортные данные], [Дата рождения], [Адрес], [e-mail], [password]) VALUES (N'Соболева Кира Фёдоровна', 45462581, N' 4537  564868', CAST(N'1998-03-14T00:00:00.000' AS DateTime), N'420633, г. Санкт-Петербург, ул. Матросова, 18, кв. 41', N'janae.bogan@gmail.com', N'cl12400')
INSERT [dbo].[Клиенты] ([ФИО], [Код клиента], [Паспортные данные], [Дата рождения], [Адрес], [e-mail], [password]) VALUES (N'Коновалов Арсений Максимович', 45462582, N' 4914  572471', CAST(N'1985-02-18T00:00:00.000' AS DateTime), N'445720, г. Санкт-Петербург, ул. Матросова, 50, кв. 67', N'vern91@yahoo.com', N'cl12401')
INSERT [dbo].[Клиенты] ([ФИО], [Код клиента], [Паспортные данные], [Дата рождения], [Адрес], [e-mail], [password]) VALUES (N'Гусев Михаил Дмитриевич', 45462583, N' 4445  581302', CAST(N'1999-11-23T00:00:00.000' AS DateTime), N'400646, г. Санкт-Петербург, ул. Октябрьская, 47, кв. 65', N'mariana.leannon@larkin.net', N'cl12402')
INSERT [dbo].[Клиенты] ([ФИО], [Код клиента], [Паспортные данные], [Дата рождения], [Адрес], [e-mail], [password]) VALUES (N'Суханова Варвара Матвеевна', 45462584, N' 4743  598180', CAST(N'1993-09-13T00:00:00.000' AS DateTime), N'644410, г. Санкт-Петербург, ул. Красная, 17, кв. 69', N'vmoore@gmail.com', N'cl12403')
INSERT [dbo].[Клиенты] ([ФИО], [Код клиента], [Паспортные данные], [Дата рождения], [Адрес], [e-mail], [password]) VALUES (N'Орлова Ясмина Васильевна', 45462585, N' 4741  601821', CAST(N'1984-06-24T00:00:00.000' AS DateTime), N'400750, г. Санкт-Петербург, ул. Школьная, 36, кв. 71', N'damon.mcclure@mills.com', N'cl12404')
INSERT [dbo].[Клиенты] ([ФИО], [Код клиента], [Паспортные данные], [Дата рождения], [Адрес], [e-mail], [password]) VALUES (N'Васильева Ксения Константиновна', 45462586, N' 4783  612567', CAST(N'1999-08-01T00:00:00.000' AS DateTime), N'660590, г. Санкт-Петербург, ул. Дачная, 37, кв. 70', N'grady.reilly@block.com', N'cl12405')
INSERT [dbo].[Клиенты] ([ФИО], [Код клиента], [Паспортные данные], [Дата рождения], [Адрес], [e-mail], [password]) VALUES (N'Борисова Тамара Данииловна', 45462587, N' 4658  621200', CAST(N'1993-05-29T00:00:00.000' AS DateTime), N'426083, г. Санкт-Петербург, ул. Механизаторов, 41, кв. 26', N'boyd.koss@yahoo.com', N'cl12406')
INSERT [dbo].[Клиенты] ([ФИО], [Код клиента], [Паспортные данные], [Дата рождения], [Адрес], [e-mail], [password]) VALUES (N'Дмитриев Мирон Ильич', 45462588, N' 4908  634613', CAST(N'1985-04-13T00:00:00.000' AS DateTime), N'410569, г. Санкт-Петербург, ул. Парковая, 36, кв. 17', N'obartell@franecki.info', N'cl12407')
INSERT [dbo].[Клиенты] ([ФИО], [Код клиента], [Паспортные данные], [Дата рождения], [Адрес], [e-mail], [password]) VALUES (N'Лебедева Анна Александровна', 45462589, N' 5092  642468', CAST(N'1985-03-30T00:00:00.000' AS DateTime), N'443375, г. Санкт-Петербург, ул. Дзержинского, 50, кв. 95', N'reina75@ferry.net', N'cl12408')
INSERT [dbo].[Клиенты] ([ФИО], [Код клиента], [Паспортные данные], [Дата рождения], [Адрес], [e-mail], [password]) VALUES (N'Пономарев Артём Маркович', 45462590, N' 5155  465274', CAST(N'1984-06-02T00:00:00.000' AS DateTime), N'614316, г. Санкт-Петербург, ул. Первомайская, 48, кв. 31', N'karson28@hotmail.com', N'cl12409')
INSERT [dbo].[Клиенты] ([ФИО], [Код клиента], [Паспортные данные], [Дата рождения], [Адрес], [e-mail], [password]) VALUES (N'Борисова Елена Михайловна', 45462591, N' 5086  666893', CAST(N'1976-05-23T00:00:00.000' AS DateTime), N'445685, г. Санкт-Петербург, ул. Зеленая, 7, кв. 47', N'damaris61@okon.com', N'cl12410')
INSERT [dbo].[Клиенты] ([ФИО], [Код клиента], [Паспортные данные], [Дата рождения], [Адрес], [e-mail], [password]) VALUES (N'Моисеев Камиль Максимович', 45462592, N' 5333  675375', CAST(N'1999-06-17T00:00:00.000' AS DateTime), N'614505, г. Санкт-Петербург, ул. Нагорная, 37, кв. 31', N'carroll.jerod@hotmail.com', N'cl12411')
INSERT [dbo].[Клиенты] ([ФИО], [Код клиента], [Паспортные данные], [Дата рождения], [Адрес], [e-mail], [password]) VALUES (N'Герасимова Дарья Константиновна', 45462593, N' 5493  684572', CAST(N'1984-10-13T00:00:00.000' AS DateTime), N'426629, г. Санкт-Петербург, ул. Весенняя, 32, кв. 46', N'ron.treutel@quitzon.com', N'cl12412')
INSERT [dbo].[Клиенты] ([ФИО], [Код клиента], [Паспортные данные], [Дата рождения], [Адрес], [e-mail], [password]) VALUES (N'Михайлова Мария Марковна', 45462594, N' 5150  696226', CAST(N'1976-12-02T00:00:00.000' AS DateTime), N'603743, г. Санкт-Петербург, ул. Матросова, 19, кв. 20', N'olen79@yahoo.com', N'cl12413')
INSERT [dbo].[Клиенты] ([ФИО], [Код клиента], [Паспортные данные], [Дата рождения], [Адрес], [e-mail], [password]) VALUES (N'Коршунов Кирилл Максимович', 45462595, N' 1308  703305', CAST(N'1985-05-22T00:00:00.000' AS DateTime), N'450750, г. Санкт-Петербург, ул. Клубная, 23, кв. 90', N'pacocha.robbie@yahoo.com', N'cl12414')
GO
INSERT [dbo].[Роли] ([Код_роли], [Код_сотрудника], [ФИО], [Дата_рождения], [Адрес], [Должность]) VALUES (N'1', N'ID 101', N'Иванов Иван Иванович', CAST(N'2012-01-12T00:00:00.000' AS DateTime), N'Челябинск ул. Красная д. 81', N'Продавец')
INSERT [dbo].[Роли] ([Код_роли], [Код_сотрудника], [ФИО], [Дата_рождения], [Адрес], [Должность]) VALUES (N'2', N'ID 102', N'Петров Петр Петрович', CAST(N'2012-01-13T00:00:00.000' AS DateTime), N'Челябинск ул. Красная д. 82', N'Продавец')
INSERT [dbo].[Роли] ([Код_роли], [Код_сотрудника], [ФИО], [Дата_рождения], [Адрес], [Должность]) VALUES (N'3', N'ID 103', N'Федоров Федор Федорович', CAST(N'2012-01-14T00:00:00.000' AS DateTime), N'Челябинск ул. Красная д. 83', N'Администратор')
INSERT [dbo].[Роли] ([Код_роли], [Код_сотрудника], [ФИО], [Дата_рождения], [Адрес], [Должность]) VALUES (N'4', N'ID 104', N'Миронов Вениамин Куприянович', CAST(N'2012-01-15T00:00:00.000' AS DateTime), N'Челябинск ул. Красная д. 84', N'Старший смены')
INSERT [dbo].[Роли] ([Код_роли], [Код_сотрудника], [ФИО], [Дата_рождения], [Адрес], [Должность]) VALUES (N'5', N'ID 105', N'Ширяев Ермолай Вениаминович', CAST(N'2012-01-16T00:00:00.000' AS DateTime), N'Челябинск ул. Красная д. 85', N'Старший смены')
INSERT [dbo].[Роли] ([Код_роли], [Код_сотрудника], [ФИО], [Дата_рождения], [Адрес], [Должность]) VALUES (N'6', N'ID 106', N'Игнатов Кассиан Васильевич', CAST(N'2012-01-17T00:00:00.000' AS DateTime), N'Челябинск ул. Красная д. 86', N'Старший смены')
INSERT [dbo].[Роли] ([Код_роли], [Код_сотрудника], [ФИО], [Дата_рождения], [Адрес], [Должность]) VALUES (N'7', N'ID 107', N'Хохлов Владимир Мэлсович', CAST(N'2012-01-18T00:00:00.000' AS DateTime), N'Челябинск ул. Красная д. 87', N'Продавец')
INSERT [dbo].[Роли] ([Код_роли], [Код_сотрудника], [ФИО], [Дата_рождения], [Адрес], [Должность]) VALUES (N'8', N'ID 108', N'Стрелков Мстислав Георгьевич', CAST(N'2012-01-19T00:00:00.000' AS DateTime), N'Челябинск ул. Красная д. 88', N'Продавец')
INSERT [dbo].[Роли] ([Код_роли], [Код_сотрудника], [ФИО], [Дата_рождения], [Адрес], [Должность]) VALUES (N'9', N'ID 109', N'Беляева Лилия Наумовна', CAST(N'2012-01-20T00:00:00.000' AS DateTime), N'Челябинск ул. Красная д. 89', N'Продавец')
INSERT [dbo].[Роли] ([Код_роли], [Код_сотрудника], [ФИО], [Дата_рождения], [Адрес], [Должность]) VALUES (N'10', N'ID 110', N'Смирнова Ульяна Гордеевна', CAST(N'2012-01-21T00:00:00.000' AS DateTime), N'Челябинск ул. Красная д. 90', N'Продавец')
GO
INSERT [dbo].[Сотрудники] ([Код сотрудника], [Должность], [ФИО ], [Логин ], [Пароль], [Последний вход], [Тип входа]) VALUES (N'ID 101', N'Продавец', N'Иванов Иван Иванович', N'Ivanov@namecomp.ru', N'2L6KZG', N'15:05:2022 13:13:00', N'Успешно')
INSERT [dbo].[Сотрудники] ([Код сотрудника], [Должность], [ФИО ], [Логин ], [Пароль], [Последний вход], [Тип входа]) VALUES (N'ID 102', N'Продавец', N'Петров Петр Петрович', N'petrov@namecomp.ru', N'uzWC67', N'15:05:2022 13:13:00', N'Успешно')
INSERT [dbo].[Сотрудники] ([Код сотрудника], [Должность], [ФИО ], [Логин ], [Пароль], [Последний вход], [Тип входа]) VALUES (N'ID 103', N'Администратор', N'Федоров Федор Федорович', N'fedorov@namecomp.ru', N'8ntwUp', N'15:05:2022 13:13:00', N'Успешно')
INSERT [dbo].[Сотрудники] ([Код сотрудника], [Должность], [ФИО ], [Логин ], [Пароль], [Последний вход], [Тип входа]) VALUES (N'ID 104', N'Старший смены', N'Миронов Вениамин Куприянович', N'mironov@namecomp.ru', N'YOyhfR', N'15:05:2022 13:13:00', N'Успешно')
INSERT [dbo].[Сотрудники] ([Код сотрудника], [Должность], [ФИО ], [Логин ], [Пароль], [Последний вход], [Тип входа]) VALUES (N'ID 105', N'Старший смены', N'Ширяев Ермолай Вениаминович', N'shiryev@namecomp.ru', N'RSbvHv', N'15:05:2022 13:13:00', N'Неуспешно')
INSERT [dbo].[Сотрудники] ([Код сотрудника], [Должность], [ФИО ], [Логин ], [Пароль], [Последний вход], [Тип входа]) VALUES (N'ID 106', N'Старший смены', N'Игнатов Кассиан Васильевич', N'ignatov@namecomp.ru', N'rwVDh9', N'15:05:2022 13:13:00', N'Успешно')
INSERT [dbo].[Сотрудники] ([Код сотрудника], [Должность], [ФИО ], [Логин ], [Пароль], [Последний вход], [Тип входа]) VALUES (N'ID 107', N'Продавец', N'Хохлов Владимир Мэлсович', N'hohlov@namecomp.ru', N'LdNyos', N'15:05:2022 13:13:00', N'Успешно')
INSERT [dbo].[Сотрудники] ([Код сотрудника], [Должность], [ФИО ], [Логин ], [Пароль], [Последний вход], [Тип входа]) VALUES (N'ID 108', N'Продавец', N'Стрелков Мстислав Георгьевич', N'strelkov@namecomp.ru', N'gynQMT', N'15:05:2022 13:13:00', N'Неуспешно')
INSERT [dbo].[Сотрудники] ([Код сотрудника], [Должность], [ФИО ], [Логин ], [Пароль], [Последний вход], [Тип входа]) VALUES (N'ID 109', N'Продавец', N'Беляева Лилия Наумовна', N'belyeva@@namecomp.ru', N'AtnDjr', N'15:05:2022 13:13:00', N'Успешно')
INSERT [dbo].[Сотрудники] ([Код сотрудника], [Должность], [ФИО ], [Логин ], [Пароль], [Последний вход], [Тип входа]) VALUES (N'ID 110', N'Продавец', N'Смирнова Ульяна Гордеевна', N'smirnova@@namecomp.ru', N'JlFRCZ', N'15:05:2022 13:13:00', N'Успешно')
GO
INSERT [dbo].[Услуги] ([ID], [Наименование услуги], [Код услуги], [Стоимость, руб#  за час ]) VALUES (98, N'Прокат самоката', N'63748HF', 700)
INSERT [dbo].[Услуги] ([ID], [Наименование услуги], [Код услуги], [Стоимость, руб#  за час ]) VALUES (123, N'Инструктор по катанию на лодке', N'638VVNQ3', 1200)
INSERT [dbo].[Услуги] ([ID], [Наименование услуги], [Код услуги], [Стоимость, руб#  за час ]) VALUES (353, N'Прокат шлема', N'87FDJKHJ', 400)
INSERT [dbo].[Услуги] ([ID], [Наименование услуги], [Код услуги], [Стоимость, руб#  за час ]) VALUES (336, N'Прокат велосипеда', N'8HFJHG443', 1000)
INSERT [dbo].[Услуги] ([ID], [Наименование услуги], [Код услуги], [Стоимость, руб#  за час ]) VALUES (99, N'Аренда беседки', N'BSFBHV63', 2000)
INSERT [dbo].[Услуги] ([ID], [Наименование услуги], [Код услуги], [Стоимость, руб#  за час ]) VALUES (44, N'Аренда лодки', N'DHBGFY563', 700)
INSERT [dbo].[Услуги] ([ID], [Наименование услуги], [Код услуги], [Стоимость, руб#  за час ]) VALUES (88, N'Инструктор по катанию на велосипеде', N'DJHGBS982', 1000)
INSERT [dbo].[Услуги] ([ID], [Наименование услуги], [Код услуги], [Стоимость, руб#  за час ]) VALUES (92, N'Аренда шезлонга', N'HJBUJE21J', 300)
INSERT [dbo].[Услуги] ([ID], [Наименование услуги], [Код услуги], [Стоимость, руб#  за час ]) VALUES (45, N'Прокат электросамоката', N'JFH7382', 1200)
INSERT [dbo].[Услуги] ([ID], [Наименование услуги], [Код услуги], [Стоимость, руб#  за час ]) VALUES (57, N'Инструктор по катанию на роликах', N'JHVSJF6', 1000)
INSERT [dbo].[Услуги] ([ID], [Наименование услуги], [Код услуги], [Стоимость, руб#  за час ]) VALUES (34, N'Прокат роликов', N'JKFBJ09', 1000)
INSERT [dbo].[Услуги] ([ID], [Наименование услуги], [Код услуги], [Стоимость, руб#  за час ]) VALUES (31, N'Прокат набора защитного оборудования', N'JUR8R', 1000)
INSERT [dbo].[Услуги] ([ID], [Наименование услуги], [Код услуги], [Стоимость, руб#  за час ]) VALUES (89, N'Прокат велоколяски', N'OIJNB12', 2000)
GO
INSERT [dbo].[Чек] ([Код чека], [Код услуги], [Код клиента]) VALUES (1, 34, 45462526)
INSERT [dbo].[Чек] ([Код чека], [Код услуги], [Код клиента]) VALUES (1, 31, 45462526)
INSERT [dbo].[Чек] ([Код чека], [Код услуги], [Код клиента]) VALUES (1, 353, 45462526)
INSERT [dbo].[Чек] ([Код чека], [Код услуги], [Код клиента]) VALUES (1, 336, 45462526)
INSERT [dbo].[Чек] ([Код чека], [Код услуги], [Код клиента]) VALUES (2, 98, 45462527)
INSERT [dbo].[Чек] ([Код чека], [Код услуги], [Код клиента]) VALUES (2, 45, 45462527)
INSERT [dbo].[Чек] ([Код чека], [Код услуги], [Код клиента]) VALUES (2, 89, 45462527)
INSERT [dbo].[Чек] ([Код чека], [Код услуги], [Код клиента]) VALUES (2, 99, 45462527)
INSERT [dbo].[Чек] ([Код чека], [Код услуги], [Код клиента]) VALUES (2, 123, 45462527)
INSERT [dbo].[Чек] ([Код чека], [Код услуги], [Код клиента]) VALUES (3, 92, 45462528)
INSERT [dbo].[Чек] ([Код чека], [Код услуги], [Код клиента]) VALUES (3, 45, 45462528)
INSERT [dbo].[Чек] ([Код чека], [Код услуги], [Код клиента]) VALUES (3, 57, 45462528)
INSERT [dbo].[Чек] ([Код чека], [Код услуги], [Код клиента]) VALUES (3, 88, 45462528)
INSERT [dbo].[Чек] ([Код чека], [Код услуги], [Код клиента]) VALUES (4, 92, 45462529)
INSERT [dbo].[Чек] ([Код чека], [Код услуги], [Код клиента]) VALUES (4, 45, 45462529)
INSERT [dbo].[Чек] ([Код чека], [Код услуги], [Код клиента]) VALUES (4, 57, 45462529)
INSERT [dbo].[Чек] ([Код чека], [Код услуги], [Код клиента]) VALUES (4, 88, 45462529)
INSERT [dbo].[Чек] ([Код чека], [Код услуги], [Код клиента]) VALUES (4, 44, 45462529)
INSERT [dbo].[Чек] ([Код чека], [Код услуги], [Код клиента]) VALUES (5, 98, 45462530)
INSERT [dbo].[Чек] ([Код чека], [Код услуги], [Код клиента]) VALUES (5, 45, 45462530)
INSERT [dbo].[Чек] ([Код чека], [Код услуги], [Код клиента]) VALUES (5, 89, 45462530)
INSERT [dbo].[Чек] ([Код чека], [Код услуги], [Код клиента]) VALUES (5, 353, 45462530)
INSERT [dbo].[Чек] ([Код чека], [Код услуги], [Код клиента]) VALUES (5, 336, 45462530)
INSERT [dbo].[Чек] ([Код чека], [Код услуги], [Код клиента]) VALUES (5, 34, 45462530)
INSERT [dbo].[Чек] ([Код чека], [Код услуги], [Код клиента]) VALUES (6, 34, 45462531)
INSERT [dbo].[Чек] ([Код чека], [Код услуги], [Код клиента]) VALUES (6, 31, 45462531)
INSERT [dbo].[Чек] ([Код чека], [Код услуги], [Код клиента]) VALUES (6, 353, 45462531)
INSERT [dbo].[Чек] ([Код чека], [Код услуги], [Код клиента]) VALUES (6, 336, 45462531)
INSERT [dbo].[Чек] ([Код чека], [Код услуги], [Код клиента]) VALUES (7, 98, 45462532)
INSERT [dbo].[Чек] ([Код чека], [Код услуги], [Код клиента]) VALUES (7, 45, 45462532)
INSERT [dbo].[Чек] ([Код чека], [Код услуги], [Код клиента]) VALUES (7, 89, 45462532)
INSERT [dbo].[Чек] ([Код чека], [Код услуги], [Код клиента]) VALUES (7, 99, 45462532)
INSERT [dbo].[Чек] ([Код чека], [Код услуги], [Код клиента]) VALUES (7, 123, 45462532)
INSERT [dbo].[Чек] ([Код чека], [Код услуги], [Код клиента]) VALUES (8, 92, 45462533)
INSERT [dbo].[Чек] ([Код чека], [Код услуги], [Код клиента]) VALUES (8, 45, 45462533)
INSERT [dbo].[Чек] ([Код чека], [Код услуги], [Код клиента]) VALUES (8, 57, 45462533)
INSERT [dbo].[Чек] ([Код чека], [Код услуги], [Код клиента]) VALUES (8, 89, 45462533)
INSERT [dbo].[Чек] ([Код чека], [Код услуги], [Код клиента]) VALUES (9, 92, 45462534)
INSERT [dbo].[Чек] ([Код чека], [Код услуги], [Код клиента]) VALUES (9, 45, 45462534)
INSERT [dbo].[Чек] ([Код чека], [Код услуги], [Код клиента]) VALUES (9, 57, 45462534)
INSERT [dbo].[Чек] ([Код чека], [Код услуги], [Код клиента]) VALUES (9, 88, 45462534)
INSERT [dbo].[Чек] ([Код чека], [Код услуги], [Код клиента]) VALUES (10, 98, 45462535)
INSERT [dbo].[Чек] ([Код чека], [Код услуги], [Код клиента]) VALUES (10, 45, 45462535)
INSERT [dbo].[Чек] ([Код чека], [Код услуги], [Код клиента]) VALUES (10, 89, 45462535)
INSERT [dbo].[Чек] ([Код чека], [Код услуги], [Код клиента]) VALUES (10, 353, 45462535)
INSERT [dbo].[Чек] ([Код чека], [Код услуги], [Код клиента]) VALUES (10, 336, 45462535)
INSERT [dbo].[Чек] ([Код чека], [Код услуги], [Код клиента]) VALUES (10, 34, 45462535)
INSERT [dbo].[Чек] ([Код чека], [Код услуги], [Код клиента]) VALUES (11, 34, 45462536)
INSERT [dbo].[Чек] ([Код чека], [Код услуги], [Код клиента]) VALUES (11, 31, 45462536)
INSERT [dbo].[Чек] ([Код чека], [Код услуги], [Код клиента]) VALUES (11, 353, 45462536)
INSERT [dbo].[Чек] ([Код чека], [Код услуги], [Код клиента]) VALUES (11, 336, 45462536)
INSERT [dbo].[Чек] ([Код чека], [Код услуги], [Код клиента]) VALUES (12, 98, 45462537)
INSERT [dbo].[Чек] ([Код чека], [Код услуги], [Код клиента]) VALUES (12, 45, 45462537)
INSERT [dbo].[Чек] ([Код чека], [Код услуги], [Код клиента]) VALUES (12, 89, 45462537)
INSERT [dbo].[Чек] ([Код чека], [Код услуги], [Код клиента]) VALUES (12, 99, 45462537)
INSERT [dbo].[Чек] ([Код чека], [Код услуги], [Код клиента]) VALUES (12, 123, 45462537)
INSERT [dbo].[Чек] ([Код чека], [Код услуги], [Код клиента]) VALUES (13, 92, 45462538)
INSERT [dbo].[Чек] ([Код чека], [Код услуги], [Код клиента]) VALUES (13, 45, 45462538)
INSERT [dbo].[Чек] ([Код чека], [Код услуги], [Код клиента]) VALUES (13, 57, 45462538)
INSERT [dbo].[Чек] ([Код чека], [Код услуги], [Код клиента]) VALUES (14, 92, 45462539)
INSERT [dbo].[Чек] ([Код чека], [Код услуги], [Код клиента]) VALUES (14, 45, 45462539)
INSERT [dbo].[Чек] ([Код чека], [Код услуги], [Код клиента]) VALUES (14, 57, 45462539)
INSERT [dbo].[Чек] ([Код чека], [Код услуги], [Код клиента]) VALUES (14, 88, 45462539)
INSERT [dbo].[Чек] ([Код чека], [Код услуги], [Код клиента]) VALUES (15, 98, 45462540)
INSERT [dbo].[Чек] ([Код чека], [Код услуги], [Код клиента]) VALUES (15, 45, 45462540)
INSERT [dbo].[Чек] ([Код чека], [Код услуги], [Код клиента]) VALUES (15, 89, 45462540)
INSERT [dbo].[Чек] ([Код чека], [Код услуги], [Код клиента]) VALUES (15, 353, 45462540)
INSERT [dbo].[Чек] ([Код чека], [Код услуги], [Код клиента]) VALUES (15, 336, 45462540)
INSERT [dbo].[Чек] ([Код чека], [Код услуги], [Код клиента]) VALUES (15, 34, 45462540)
INSERT [dbo].[Чек] ([Код чека], [Код услуги], [Код клиента]) VALUES (16, 34, 45462541)
INSERT [dbo].[Чек] ([Код чека], [Код услуги], [Код клиента]) VALUES (16, 31, 45462541)
INSERT [dbo].[Чек] ([Код чека], [Код услуги], [Код клиента]) VALUES (16, 353, 45462541)
INSERT [dbo].[Чек] ([Код чека], [Код услуги], [Код клиента]) VALUES (16, 336, 45462541)
INSERT [dbo].[Чек] ([Код чека], [Код услуги], [Код клиента]) VALUES (17, 98, 45462542)
INSERT [dbo].[Чек] ([Код чека], [Код услуги], [Код клиента]) VALUES (17, 45, 45462542)
INSERT [dbo].[Чек] ([Код чека], [Код услуги], [Код клиента]) VALUES (17, 89, 45462542)
INSERT [dbo].[Чек] ([Код чека], [Код услуги], [Код клиента]) VALUES (17, 99, 45462542)
INSERT [dbo].[Чек] ([Код чека], [Код услуги], [Код клиента]) VALUES (17, 123, 45462542)
INSERT [dbo].[Чек] ([Код чека], [Код услуги], [Код клиента]) VALUES (18, 92, 45462543)
INSERT [dbo].[Чек] ([Код чека], [Код услуги], [Код клиента]) VALUES (18, 45, 45462543)
INSERT [dbo].[Чек] ([Код чека], [Код услуги], [Код клиента]) VALUES (18, 57, 45462543)
INSERT [dbo].[Чек] ([Код чека], [Код услуги], [Код клиента]) VALUES (19, 92, 45462544)
INSERT [dbo].[Чек] ([Код чека], [Код услуги], [Код клиента]) VALUES (19, 45, 45462544)
INSERT [dbo].[Чек] ([Код чека], [Код услуги], [Код клиента]) VALUES (19, 57, 45462544)
INSERT [dbo].[Чек] ([Код чека], [Код услуги], [Код клиента]) VALUES (19, 88, 45462544)
INSERT [dbo].[Чек] ([Код чека], [Код услуги], [Код клиента]) VALUES (20, 98, 45462545)
INSERT [dbo].[Чек] ([Код чека], [Код услуги], [Код клиента]) VALUES (20, 45, 45462545)
INSERT [dbo].[Чек] ([Код чека], [Код услуги], [Код клиента]) VALUES (20, 89, 45462545)
INSERT [dbo].[Чек] ([Код чека], [Код услуги], [Код клиента]) VALUES (20, 353, 45462545)
INSERT [dbo].[Чек] ([Код чека], [Код услуги], [Код клиента]) VALUES (20, 336, 45462545)
INSERT [dbo].[Чек] ([Код чека], [Код услуги], [Код клиента]) VALUES (20, 34, 45462545)
INSERT [dbo].[Чек] ([Код чека], [Код услуги], [Код клиента]) VALUES (21, 34, 45462546)
INSERT [dbo].[Чек] ([Код чека], [Код услуги], [Код клиента]) VALUES (21, 31, 45462546)
INSERT [dbo].[Чек] ([Код чека], [Код услуги], [Код клиента]) VALUES (21, 353, 45462546)
INSERT [dbo].[Чек] ([Код чека], [Код услуги], [Код клиента]) VALUES (21, 336, 45462546)
GO
INSERT [dbo].[Чек] ([Код чека], [Код услуги], [Код клиента]) VALUES (22, 98, 45462547)
INSERT [dbo].[Чек] ([Код чека], [Код услуги], [Код клиента]) VALUES (22, 45, 45462547)
INSERT [dbo].[Чек] ([Код чека], [Код услуги], [Код клиента]) VALUES (22, 89, 45462547)
INSERT [dbo].[Чек] ([Код чека], [Код услуги], [Код клиента]) VALUES (22, 99, 45462547)
INSERT [dbo].[Чек] ([Код чека], [Код услуги], [Код клиента]) VALUES (22, 123, 45462547)
INSERT [dbo].[Чек] ([Код чека], [Код услуги], [Код клиента]) VALUES (23, 92, 45462548)
INSERT [dbo].[Чек] ([Код чека], [Код услуги], [Код клиента]) VALUES (23, 45, 45462548)
INSERT [dbo].[Чек] ([Код чека], [Код услуги], [Код клиента]) VALUES (23, 57, 45462548)
INSERT [dbo].[Чек] ([Код чека], [Код услуги], [Код клиента]) VALUES (24, 92, 45462549)
INSERT [dbo].[Чек] ([Код чека], [Код услуги], [Код клиента]) VALUES (24, 45, 45462549)
INSERT [dbo].[Чек] ([Код чека], [Код услуги], [Код клиента]) VALUES (24, 57, 45462549)
INSERT [dbo].[Чек] ([Код чека], [Код услуги], [Код клиента]) VALUES (24, 88, 45462549)
INSERT [dbo].[Чек] ([Код чека], [Код услуги], [Код клиента]) VALUES (25, 98, 45462550)
INSERT [dbo].[Чек] ([Код чека], [Код услуги], [Код клиента]) VALUES (25, 45, 45462550)
INSERT [dbo].[Чек] ([Код чека], [Код услуги], [Код клиента]) VALUES (25, 89, 45462550)
INSERT [dbo].[Чек] ([Код чека], [Код услуги], [Код клиента]) VALUES (25, 353, 45462550)
INSERT [dbo].[Чек] ([Код чека], [Код услуги], [Код клиента]) VALUES (25, 336, 45462550)
INSERT [dbo].[Чек] ([Код чека], [Код услуги], [Код клиента]) VALUES (25, 34, 45462550)
INSERT [dbo].[Чек] ([Код чека], [Код услуги], [Код клиента]) VALUES (26, 34, 45462551)
INSERT [dbo].[Чек] ([Код чека], [Код услуги], [Код клиента]) VALUES (26, 31, 45462551)
INSERT [dbo].[Чек] ([Код чека], [Код услуги], [Код клиента]) VALUES (26, 353, 45462551)
INSERT [dbo].[Чек] ([Код чека], [Код услуги], [Код клиента]) VALUES (26, 336, 45462551)
INSERT [dbo].[Чек] ([Код чека], [Код услуги], [Код клиента]) VALUES (27, 98, 45462552)
INSERT [dbo].[Чек] ([Код чека], [Код услуги], [Код клиента]) VALUES (27, 45, 45462552)
INSERT [dbo].[Чек] ([Код чека], [Код услуги], [Код клиента]) VALUES (27, 89, 45462552)
INSERT [dbo].[Чек] ([Код чека], [Код услуги], [Код клиента]) VALUES (27, 99, 45462552)
INSERT [dbo].[Чек] ([Код чека], [Код услуги], [Код клиента]) VALUES (27, 123, 45462552)
INSERT [dbo].[Чек] ([Код чека], [Код услуги], [Код клиента]) VALUES (28, 92, 45462553)
INSERT [dbo].[Чек] ([Код чека], [Код услуги], [Код клиента]) VALUES (28, 45, 45462553)
INSERT [dbo].[Чек] ([Код чека], [Код услуги], [Код клиента]) VALUES (28, 57, 45462553)
INSERT [dbo].[Чек] ([Код чека], [Код услуги], [Код клиента]) VALUES (29, 92, 45462554)
INSERT [dbo].[Чек] ([Код чека], [Код услуги], [Код клиента]) VALUES (29, 45, 45462554)
INSERT [dbo].[Чек] ([Код чека], [Код услуги], [Код клиента]) VALUES (29, 57, 45462554)
INSERT [dbo].[Чек] ([Код чека], [Код услуги], [Код клиента]) VALUES (29, 88, 45462554)
INSERT [dbo].[Чек] ([Код чека], [Код услуги], [Код клиента]) VALUES (30, 98, 45462555)
INSERT [dbo].[Чек] ([Код чека], [Код услуги], [Код клиента]) VALUES (30, 45, 45462555)
INSERT [dbo].[Чек] ([Код чека], [Код услуги], [Код клиента]) VALUES (30, 88, 45462555)
INSERT [dbo].[Чек] ([Код чека], [Код услуги], [Код клиента]) VALUES (30, 353, 45462555)
INSERT [dbo].[Чек] ([Код чека], [Код услуги], [Код клиента]) VALUES (30, 336, 45462555)
INSERT [dbo].[Чек] ([Код чека], [Код услуги], [Код клиента]) VALUES (30, 34, 45462555)
INSERT [dbo].[Чек] ([Код чека], [Код услуги], [Код клиента]) VALUES (31, 34, 45462556)
INSERT [dbo].[Чек] ([Код чека], [Код услуги], [Код клиента]) VALUES (31, 31, 45462556)
INSERT [dbo].[Чек] ([Код чека], [Код услуги], [Код клиента]) VALUES (31, 353, 45462556)
INSERT [dbo].[Чек] ([Код чека], [Код услуги], [Код клиента]) VALUES (31, 336, 45462556)
INSERT [dbo].[Чек] ([Код чека], [Код услуги], [Код клиента]) VALUES (32, 98, 45462557)
INSERT [dbo].[Чек] ([Код чека], [Код услуги], [Код клиента]) VALUES (32, 45, 45462557)
INSERT [dbo].[Чек] ([Код чека], [Код услуги], [Код клиента]) VALUES (32, 89, 45462557)
INSERT [dbo].[Чек] ([Код чека], [Код услуги], [Код клиента]) VALUES (32, 99, 45462557)
INSERT [dbo].[Чек] ([Код чека], [Код услуги], [Код клиента]) VALUES (32, 123, 45462557)
INSERT [dbo].[Чек] ([Код чека], [Код услуги], [Код клиента]) VALUES (33, 92, 45462558)
INSERT [dbo].[Чек] ([Код чека], [Код услуги], [Код клиента]) VALUES (33, 45, 45462558)
INSERT [dbo].[Чек] ([Код чека], [Код услуги], [Код клиента]) VALUES (33, 57, 45462558)
INSERT [dbo].[Чек] ([Код чека], [Код услуги], [Код клиента]) VALUES (34, 92, 45462559)
INSERT [dbo].[Чек] ([Код чека], [Код услуги], [Код клиента]) VALUES (34, 45, 45462559)
INSERT [dbo].[Чек] ([Код чека], [Код услуги], [Код клиента]) VALUES (34, 57, 45462559)
INSERT [dbo].[Чек] ([Код чека], [Код услуги], [Код клиента]) VALUES (34, 88, 45462559)
INSERT [dbo].[Чек] ([Код чека], [Код услуги], [Код клиента]) VALUES (35, 98, 45462560)
INSERT [dbo].[Чек] ([Код чека], [Код услуги], [Код клиента]) VALUES (35, 45, 45462560)
INSERT [dbo].[Чек] ([Код чека], [Код услуги], [Код клиента]) VALUES (35, 89, 45462560)
INSERT [dbo].[Чек] ([Код чека], [Код услуги], [Код клиента]) VALUES (35, 353, 45462560)
INSERT [dbo].[Чек] ([Код чека], [Код услуги], [Код клиента]) VALUES (35, 336, 45462560)
INSERT [dbo].[Чек] ([Код чека], [Код услуги], [Код клиента]) VALUES (35, 44, 45462560)
INSERT [dbo].[Чек] ([Код чека], [Код услуги], [Код клиента]) VALUES (36, 34, 45462561)
INSERT [dbo].[Чек] ([Код чека], [Код услуги], [Код клиента]) VALUES (36, 31, 45462561)
INSERT [dbo].[Чек] ([Код чека], [Код услуги], [Код клиента]) VALUES (36, 353, 45462561)
INSERT [dbo].[Чек] ([Код чека], [Код услуги], [Код клиента]) VALUES (36, 336, 45462561)
INSERT [dbo].[Чек] ([Код чека], [Код услуги], [Код клиента]) VALUES (37, 98, 45462562)
INSERT [dbo].[Чек] ([Код чека], [Код услуги], [Код клиента]) VALUES (37, 45, 45462562)
INSERT [dbo].[Чек] ([Код чека], [Код услуги], [Код клиента]) VALUES (37, 89, 45462562)
INSERT [dbo].[Чек] ([Код чека], [Код услуги], [Код клиента]) VALUES (37, 99, 45462562)
INSERT [dbo].[Чек] ([Код чека], [Код услуги], [Код клиента]) VALUES (37, 123, 45462562)
INSERT [dbo].[Чек] ([Код чека], [Код услуги], [Код клиента]) VALUES (38, 92, 45462563)
INSERT [dbo].[Чек] ([Код чека], [Код услуги], [Код клиента]) VALUES (38, 45, 45462563)
INSERT [dbo].[Чек] ([Код чека], [Код услуги], [Код клиента]) VALUES (38, 57, 45462563)
INSERT [dbo].[Чек] ([Код чека], [Код услуги], [Код клиента]) VALUES (38, 98, 45462563)
INSERT [dbo].[Чек] ([Код чека], [Код услуги], [Код клиента]) VALUES (39, 92, 45462564)
INSERT [dbo].[Чек] ([Код чека], [Код услуги], [Код клиента]) VALUES (39, 45, 45462564)
INSERT [dbo].[Чек] ([Код чека], [Код услуги], [Код клиента]) VALUES (39, 57, 45462564)
INSERT [dbo].[Чек] ([Код чека], [Код услуги], [Код клиента]) VALUES (39, 88, 45462564)
INSERT [dbo].[Чек] ([Код чека], [Код услуги], [Код клиента]) VALUES (40, 98, 45462565)
INSERT [dbo].[Чек] ([Код чека], [Код услуги], [Код клиента]) VALUES (40, 45, 45462565)
INSERT [dbo].[Чек] ([Код чека], [Код услуги], [Код клиента]) VALUES (40, 89, 45462565)
INSERT [dbo].[Чек] ([Код чека], [Код услуги], [Код клиента]) VALUES (40, 353, 45462565)
INSERT [dbo].[Чек] ([Код чека], [Код услуги], [Код клиента]) VALUES (40, 336, 45462565)
INSERT [dbo].[Чек] ([Код чека], [Код услуги], [Код клиента]) VALUES (40, 44, 45462565)
INSERT [dbo].[Чек] ([Код чека], [Код услуги], [Код клиента]) VALUES (41, 34, 45462566)
INSERT [dbo].[Чек] ([Код чека], [Код услуги], [Код клиента]) VALUES (41, 31, 45462566)
INSERT [dbo].[Чек] ([Код чека], [Код услуги], [Код клиента]) VALUES (41, 353, 45462566)
INSERT [dbo].[Чек] ([Код чека], [Код услуги], [Код клиента]) VALUES (41, 336, 45462566)
INSERT [dbo].[Чек] ([Код чека], [Код услуги], [Код клиента]) VALUES (42, 98, 45462567)
INSERT [dbo].[Чек] ([Код чека], [Код услуги], [Код клиента]) VALUES (42, 45, 45462567)
INSERT [dbo].[Чек] ([Код чека], [Код услуги], [Код клиента]) VALUES (42, 89, 45462567)
INSERT [dbo].[Чек] ([Код чека], [Код услуги], [Код клиента]) VALUES (42, 99, 45462567)
GO
INSERT [dbo].[Чек] ([Код чека], [Код услуги], [Код клиента]) VALUES (42, 123, 45462567)
INSERT [dbo].[Чек] ([Код чека], [Код услуги], [Код клиента]) VALUES (43, 92, 45462568)
INSERT [dbo].[Чек] ([Код чека], [Код услуги], [Код клиента]) VALUES (43, 45, 45462568)
INSERT [dbo].[Чек] ([Код чека], [Код услуги], [Код клиента]) VALUES (43, 57, 45462568)
INSERT [dbo].[Чек] ([Код чека], [Код услуги], [Код клиента]) VALUES (43, 96, 45462568)
INSERT [dbo].[Чек] ([Код чека], [Код услуги], [Код клиента]) VALUES (44, 92, 45462569)
INSERT [dbo].[Чек] ([Код чека], [Код услуги], [Код клиента]) VALUES (44, 45, 45462569)
INSERT [dbo].[Чек] ([Код чека], [Код услуги], [Код клиента]) VALUES (44, 57, 45462569)
INSERT [dbo].[Чек] ([Код чека], [Код услуги], [Код клиента]) VALUES (44, 88, 45462569)
INSERT [dbo].[Чек] ([Код чека], [Код услуги], [Код клиента]) VALUES (45, 98, 45462570)
INSERT [dbo].[Чек] ([Код чека], [Код услуги], [Код клиента]) VALUES (45, 45, 45462570)
INSERT [dbo].[Чек] ([Код чека], [Код услуги], [Код клиента]) VALUES (45, 89, 45462570)
INSERT [dbo].[Чек] ([Код чека], [Код услуги], [Код клиента]) VALUES (45, 353, 45462570)
INSERT [dbo].[Чек] ([Код чека], [Код услуги], [Код клиента]) VALUES (45, 336, 45462570)
INSERT [dbo].[Чек] ([Код чека], [Код услуги], [Код клиента]) VALUES (45, 44, 45462570)
INSERT [dbo].[Чек] ([Код чека], [Код услуги], [Код клиента]) VALUES (46, 34, 45462571)
INSERT [dbo].[Чек] ([Код чека], [Код услуги], [Код клиента]) VALUES (46, 31, 45462571)
INSERT [dbo].[Чек] ([Код чека], [Код услуги], [Код клиента]) VALUES (46, 353, 45462571)
INSERT [dbo].[Чек] ([Код чека], [Код услуги], [Код клиента]) VALUES (46, 336, 45462571)
INSERT [dbo].[Чек] ([Код чека], [Код услуги], [Код клиента]) VALUES (47, 98, 45462572)
INSERT [dbo].[Чек] ([Код чека], [Код услуги], [Код клиента]) VALUES (47, 45, 45462572)
INSERT [dbo].[Чек] ([Код чека], [Код услуги], [Код клиента]) VALUES (47, 89, 45462572)
INSERT [dbo].[Чек] ([Код чека], [Код услуги], [Код клиента]) VALUES (47, 99, 45462572)
INSERT [dbo].[Чек] ([Код чека], [Код услуги], [Код клиента]) VALUES (47, 123, 45462572)
INSERT [dbo].[Чек] ([Код чека], [Код услуги], [Код клиента]) VALUES (48, 92, 45462573)
INSERT [dbo].[Чек] ([Код чека], [Код услуги], [Код клиента]) VALUES (48, 45, 45462573)
INSERT [dbo].[Чек] ([Код чека], [Код услуги], [Код клиента]) VALUES (48, 57, 45462573)
INSERT [dbo].[Чек] ([Код чека], [Код услуги], [Код клиента]) VALUES (48, 98, 45462573)
INSERT [dbo].[Чек] ([Код чека], [Код услуги], [Код клиента]) VALUES (49, 92, 45462574)
INSERT [dbo].[Чек] ([Код чека], [Код услуги], [Код клиента]) VALUES (49, 45, 45462574)
INSERT [dbo].[Чек] ([Код чека], [Код услуги], [Код клиента]) VALUES (49, 57, 45462574)
INSERT [dbo].[Чек] ([Код чека], [Код услуги], [Код клиента]) VALUES (49, 88, 45462574)
INSERT [dbo].[Чек] ([Код чека], [Код услуги], [Код клиента]) VALUES (50, 98, 45462575)
INSERT [dbo].[Чек] ([Код чека], [Код услуги], [Код клиента]) VALUES (50, 45, 45462575)
INSERT [dbo].[Чек] ([Код чека], [Код услуги], [Код клиента]) VALUES (50, 89, 45462575)
INSERT [dbo].[Чек] ([Код чека], [Код услуги], [Код клиента]) VALUES (50, 353, 45462575)
INSERT [dbo].[Чек] ([Код чека], [Код услуги], [Код клиента]) VALUES (50, 336, 45462575)
GO
ALTER TABLE [dbo].[Роли]  WITH CHECK ADD  CONSTRAINT [FK_Роли_Сотрудники] FOREIGN KEY([Код_сотрудника])
REFERENCES [dbo].[Сотрудники] ([Код сотрудника])
GO
ALTER TABLE [dbo].[Роли] CHECK CONSTRAINT [FK_Роли_Сотрудники]
GO
USE [master]
GO
ALTER DATABASE [Вариант 7] SET  READ_WRITE 
GO