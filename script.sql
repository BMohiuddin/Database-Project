USE [master]
GO
/****** Object:  Database [DBProject]    Script Date: 12/21/2018 12:29:12 AM ******/
CREATE DATABASE [DBProject]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'DBProject', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\DBProject.mdf' , SIZE = 73728KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'DBProject_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\DBProject_log.ldf' , SIZE = 73728KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [DBProject] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [DBProject].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [DBProject] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [DBProject] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [DBProject] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [DBProject] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [DBProject] SET ARITHABORT OFF 
GO
ALTER DATABASE [DBProject] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [DBProject] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [DBProject] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [DBProject] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [DBProject] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [DBProject] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [DBProject] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [DBProject] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [DBProject] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [DBProject] SET  ENABLE_BROKER 
GO
ALTER DATABASE [DBProject] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [DBProject] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [DBProject] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [DBProject] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [DBProject] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [DBProject] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [DBProject] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [DBProject] SET RECOVERY FULL 
GO
ALTER DATABASE [DBProject] SET  MULTI_USER 
GO
ALTER DATABASE [DBProject] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [DBProject] SET DB_CHAINING OFF 
GO
ALTER DATABASE [DBProject] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [DBProject] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [DBProject] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'DBProject', N'ON'
GO
ALTER DATABASE [DBProject] SET QUERY_STORE = OFF
GO
USE [DBProject]
GO
/****** Object:  Table [dbo].[Characters]    Script Date: 12/21/2018 12:29:13 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Characters](
	[CharacterID] [int] NOT NULL,
	[Character_Name] [varchar](20) NOT NULL,
	[Gender] [varchar](1) NULL,
	[Description] [varchar](25) NULL,
PRIMARY KEY CLUSTERED 
(
	[CharacterID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CPU]    Script Date: 12/21/2018 12:29:14 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CPU](
	[Name] [varchar](25) NOT NULL,
	[Price] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Developer]    Script Date: 12/21/2018 12:29:14 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Developer](
	[DeveloperID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[Publisher] [bit] NOT NULL,
	[Based_In] [varchar](50) NULL,
 CONSTRAINT [PK__Develope__DE084CD147C7A4A9] PRIMARY KEY CLUSTERED 
(
	[DeveloperID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Franchise]    Script Date: 12/21/2018 12:29:14 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Franchise](
	[FranchiseID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](100) NOT NULL,
 CONSTRAINT [PK__Franchis__9D12468029EF1ED0] PRIMARY KEY CLUSTERED 
(
	[FranchiseID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Game]    Script Date: 12/21/2018 12:29:14 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Game](
	[GameID] [int] NOT NULL,
	[Franchise_FranchiseID] [int] NOT NULL,
	[Developer_DeveloperID] [int] NOT NULL,
	[Name] [varchar](100) NOT NULL,
	[Rating] [int] NULL,
	[Maturity_rating] [varchar](10) NULL,
PRIMARY KEY CLUSTERED 
(
	[GameID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Game_has_Characters]    Script Date: 12/21/2018 12:29:14 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Game_has_Characters](
	[Game_GameID] [int] NOT NULL,
	[Characters_CharacterID] [int] NOT NULL,
	[Actor_Name] [varchar](25) NULL,
	[Voice_Actor] [varchar](25) NULL,
PRIMARY KEY CLUSTERED 
(
	[Game_GameID] ASC,
	[Characters_CharacterID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Genre]    Script Date: 12/21/2018 12:29:14 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Genre](
	[GenreID] [int] IDENTITY(1,1) NOT NULL,
	[Genre] [varchar](100) NOT NULL,
 CONSTRAINT [PK__Genre__0385055EA9527C81] PRIMARY KEY CLUSTERED 
(
	[GenreID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[genre_has_game]    Script Date: 12/21/2018 12:29:14 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[genre_has_game](
	[Game_GameID] [int] NOT NULL,
	[Genre_GenreID] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Game_GameID] ASC,
	[Genre_GenreID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[GPU]    Script Date: 12/21/2018 12:29:14 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GPU](
	[Name] [varchar](15) NOT NULL,
	[Price] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Minimum_Requirements]    Script Date: 12/21/2018 12:29:14 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Minimum_Requirements](
	[platform_has_game_Game_GameID] [int] NOT NULL,
	[platform_has_game_Platform_PlatformID] [int] NOT NULL,
	[Software_SoftwareID] [int] NOT NULL,
	[CPU_Name] [varchar](25) NOT NULL,
	[GPU_Name] [varchar](15) NOT NULL,
	[RAM_Name] [varchar](5) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[platform_has_game_Game_GameID] ASC,
	[platform_has_game_Platform_PlatformID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Person]    Script Date: 12/21/2018 12:29:15 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Person](
	[PersonID] [int] NOT NULL,
	[Name] [varchar](15) NOT NULL,
	[Gender] [varchar](1) NULL,
	[Date_of_Birth] [date] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[PersonID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Platform]    Script Date: 12/21/2018 12:29:15 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Platform](
	[PlatformID] [int] NOT NULL,
	[Platform_Name] [varchar](10) NOT NULL,
	[Developed_By] [varchar](25) NOT NULL,
	[Introduced_On] [date] NOT NULL,
	[Version] [varchar](10) NULL,
PRIMARY KEY CLUSTERED 
(
	[PlatformID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[platform_has_game]    Script Date: 12/21/2018 12:29:15 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[platform_has_game](
	[Game_GameID] [int] NOT NULL,
	[Platform_PlatformID] [int] NOT NULL,
	[Price] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Game_GameID] ASC,
	[Platform_PlatformID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[query]    Script Date: 12/21/2018 12:29:16 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[query](
	[developerLabel] [nvarchar](50) NULL,
	[country_of_origin] [nvarchar](50) NOT NULL,
	[country_of_originLabel] [nvarchar](50) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[query(1)]    Script Date: 12/21/2018 12:29:16 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[query(1)](
	[gameLabel] [nvarchar](100) NOT NULL,
	[genreLabel] [nvarchar](100) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[query1]    Script Date: 12/21/2018 12:29:16 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[query1](
	[gameLabel] [nvarchar](100) NOT NULL,
	[seriesLabel] [nvarchar](50) NOT NULL,
	[developerLabel] [nvarchar](50) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[query2]    Script Date: 12/21/2018 12:29:16 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[query2](
	[game] [nvarchar](100) NOT NULL,
	[Franchise] [nvarchar](50) NOT NULL,
	[developerLabel] [nvarchar](50) NOT NULL,
	[country_of_originLabel] [nvarchar](50) NULL,
	[ID] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RAM]    Script Date: 12/21/2018 12:29:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RAM](
	[Name] [varchar](5) NOT NULL,
	[Price] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Review]    Script Date: 12/21/2018 12:29:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Review](
	[Users_UserID] [int] NOT NULL,
	[Game_GameID] [int] NOT NULL,
	[Score] [int] NOT NULL,
	[Text] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[Users_UserID] ASC,
	[Game_GameID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Software]    Script Date: 12/21/2018 12:29:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Software](
	[SoftwareID] [int] NOT NULL,
	[OS_Name] [varchar](25) NOT NULL,
	[Developing_Company] [varchar](10) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[SoftwareID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Staff]    Script Date: 12/21/2018 12:29:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Staff](
	[Game_GameID] [int] NOT NULL,
	[Person_PersonID] [int] NOT NULL,
	[VoiceActor] [bit] NULL,
	[MotionCaptureActor] [bit] NULL,
	[Director] [bit] NULL,
	[Producer] [bit] NULL,
	[Designer] [bit] NULL,
	[Artist] [bit] NULL,
	[Composer] [bit] NULL,
	[Writer] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[Game_GameID] ASC,
	[Person_PersonID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 12/21/2018 12:29:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[UserID] [int] NOT NULL,
	[Name] [varchar](10) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Index [game_FKIndex1]    Script Date: 12/21/2018 12:29:18 AM ******/
CREATE NONCLUSTERED INDEX [game_FKIndex1] ON [dbo].[Game]
(
	[Developer_DeveloperID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [Game_FKIndex2]    Script Date: 12/21/2018 12:29:18 AM ******/
CREATE NONCLUSTERED INDEX [Game_FKIndex2] ON [dbo].[Game]
(
	[Franchise_FranchiseID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IFK_Belongs_to_Franchise]    Script Date: 12/21/2018 12:29:18 AM ******/
CREATE NONCLUSTERED INDEX [IFK_Belongs_to_Franchise] ON [dbo].[Game]
(
	[Franchise_FranchiseID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IFK_Developed_By]    Script Date: 12/21/2018 12:29:18 AM ******/
CREATE NONCLUSTERED INDEX [IFK_Developed_By] ON [dbo].[Game]
(
	[Developer_DeveloperID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [Game_has_Characters_FKIndex1]    Script Date: 12/21/2018 12:29:18 AM ******/
CREATE NONCLUSTERED INDEX [Game_has_Characters_FKIndex1] ON [dbo].[Game_has_Characters]
(
	[Game_GameID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [Game_has_Characters_FKIndex2]    Script Date: 12/21/2018 12:29:18 AM ******/
CREATE NONCLUSTERED INDEX [Game_has_Characters_FKIndex2] ON [dbo].[Game_has_Characters]
(
	[Characters_CharacterID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IFK_Characters_can_appear_in_m]    Script Date: 12/21/2018 12:29:18 AM ******/
CREATE NONCLUSTERED INDEX [IFK_Characters_can_appear_in_m] ON [dbo].[Game_has_Characters]
(
	[Characters_CharacterID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IFK_Games_have_many_characters]    Script Date: 12/21/2018 12:29:18 AM ******/
CREATE NONCLUSTERED INDEX [IFK_Games_have_many_characters] ON [dbo].[Game_has_Characters]
(
	[Game_GameID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [genre_has_game_FKIndex1]    Script Date: 12/21/2018 12:29:18 AM ******/
CREATE NONCLUSTERED INDEX [genre_has_game_FKIndex1] ON [dbo].[genre_has_game]
(
	[Genre_GenreID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [genre_has_game_FKIndex2]    Script Date: 12/21/2018 12:29:18 AM ******/
CREATE NONCLUSTERED INDEX [genre_has_game_FKIndex2] ON [dbo].[genre_has_game]
(
	[Game_GameID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IFK_Belongs_to]    Script Date: 12/21/2018 12:29:18 AM ******/
CREATE NONCLUSTERED INDEX [IFK_Belongs_to] ON [dbo].[genre_has_game]
(
	[Genre_GenreID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IFK_Belongs_to_Genre]    Script Date: 12/21/2018 12:29:18 AM ******/
CREATE NONCLUSTERED INDEX [IFK_Belongs_to_Genre] ON [dbo].[genre_has_game]
(
	[Game_GameID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IFK_CPU]    Script Date: 12/21/2018 12:29:18 AM ******/
CREATE NONCLUSTERED INDEX [IFK_CPU] ON [dbo].[Minimum_Requirements]
(
	[CPU_Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IFK_Has_Gpu_Requirement]    Script Date: 12/21/2018 12:29:18 AM ******/
CREATE NONCLUSTERED INDEX [IFK_Has_Gpu_Requirement] ON [dbo].[Minimum_Requirements]
(
	[GPU_Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IFK_Has_Ram_Requirement]    Script Date: 12/21/2018 12:29:18 AM ******/
CREATE NONCLUSTERED INDEX [IFK_Has_Ram_Requirement] ON [dbo].[Minimum_Requirements]
(
	[RAM_Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IFK_Minimum_Requirements]    Script Date: 12/21/2018 12:29:18 AM ******/
CREATE NONCLUSTERED INDEX [IFK_Minimum_Requirements] ON [dbo].[Minimum_Requirements]
(
	[platform_has_game_Game_GameID] ASC,
	[platform_has_game_Platform_PlatformID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IFK_Needs_Software]    Script Date: 12/21/2018 12:29:18 AM ******/
CREATE NONCLUSTERED INDEX [IFK_Needs_Software] ON [dbo].[Minimum_Requirements]
(
	[Software_SoftwareID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [Minimum_Requirements_FKIndex2]    Script Date: 12/21/2018 12:29:18 AM ******/
CREATE NONCLUSTERED INDEX [Minimum_Requirements_FKIndex2] ON [dbo].[Minimum_Requirements]
(
	[RAM_Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [Minimum_Requirements_FKIndex3]    Script Date: 12/21/2018 12:29:18 AM ******/
CREATE NONCLUSTERED INDEX [Minimum_Requirements_FKIndex3] ON [dbo].[Minimum_Requirements]
(
	[GPU_Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [Minimum_Requirements_FKIndex4]    Script Date: 12/21/2018 12:29:18 AM ******/
CREATE NONCLUSTERED INDEX [Minimum_Requirements_FKIndex4] ON [dbo].[Minimum_Requirements]
(
	[Software_SoftwareID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [Minimum_Requirements_FKIndex5]    Script Date: 12/21/2018 12:29:18 AM ******/
CREATE NONCLUSTERED INDEX [Minimum_Requirements_FKIndex5] ON [dbo].[Minimum_Requirements]
(
	[CPU_Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [Minimum_Requirements_FKIndex6]    Script Date: 12/21/2018 12:29:18 AM ******/
CREATE NONCLUSTERED INDEX [Minimum_Requirements_FKIndex6] ON [dbo].[Minimum_Requirements]
(
	[platform_has_game_Game_GameID] ASC,
	[platform_has_game_Platform_PlatformID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IFK_Belongs_to]    Script Date: 12/21/2018 12:29:18 AM ******/
CREATE NONCLUSTERED INDEX [IFK_Belongs_to] ON [dbo].[platform_has_game]
(
	[Platform_PlatformID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IFK_On_Platform]    Script Date: 12/21/2018 12:29:18 AM ******/
CREATE NONCLUSTERED INDEX [IFK_On_Platform] ON [dbo].[platform_has_game]
(
	[Game_GameID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [platform_has_game_FKIndex1]    Script Date: 12/21/2018 12:29:18 AM ******/
CREATE NONCLUSTERED INDEX [platform_has_game_FKIndex1] ON [dbo].[platform_has_game]
(
	[Platform_PlatformID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [platform_has_game_FKIndex2]    Script Date: 12/21/2018 12:29:18 AM ******/
CREATE NONCLUSTERED INDEX [platform_has_game_FKIndex2] ON [dbo].[platform_has_game]
(
	[Game_GameID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IFK_Given_Review]    Script Date: 12/21/2018 12:29:18 AM ******/
CREATE NONCLUSTERED INDEX [IFK_Given_Review] ON [dbo].[Review]
(
	[Users_UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IFK_Has_Review]    Script Date: 12/21/2018 12:29:18 AM ******/
CREATE NONCLUSTERED INDEX [IFK_Has_Review] ON [dbo].[Review]
(
	[Game_GameID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [review_FKIndex1]    Script Date: 12/21/2018 12:29:18 AM ******/
CREATE NONCLUSTERED INDEX [review_FKIndex1] ON [dbo].[Review]
(
	[Users_UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [review_FKIndex2]    Script Date: 12/21/2018 12:29:18 AM ******/
CREATE NONCLUSTERED INDEX [review_FKIndex2] ON [dbo].[Review]
(
	[Game_GameID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [Game_has_Person_FKIndex1]    Script Date: 12/21/2018 12:29:18 AM ******/
CREATE NONCLUSTERED INDEX [Game_has_Person_FKIndex1] ON [dbo].[Staff]
(
	[Game_GameID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [Game_has_Person_FKIndex2]    Script Date: 12/21/2018 12:29:18 AM ******/
CREATE NONCLUSTERED INDEX [Game_has_Person_FKIndex2] ON [dbo].[Staff]
(
	[Person_PersonID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IFK_Person_is_part_of_staff]    Script Date: 12/21/2018 12:29:18 AM ******/
CREATE NONCLUSTERED INDEX [IFK_Person_is_part_of_staff] ON [dbo].[Staff]
(
	[Person_PersonID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IFK_Staff_creates_game]    Script Date: 12/21/2018 12:29:18 AM ******/
CREATE NONCLUSTERED INDEX [IFK_Staff_creates_game] ON [dbo].[Staff]
(
	[Game_GameID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Game]  WITH CHECK ADD  CONSTRAINT [FK__Game__Developer___4CA06362] FOREIGN KEY([Developer_DeveloperID])
REFERENCES [dbo].[Developer] ([DeveloperID])
GO
ALTER TABLE [dbo].[Game] CHECK CONSTRAINT [FK__Game__Developer___4CA06362]
GO
ALTER TABLE [dbo].[Game]  WITH CHECK ADD  CONSTRAINT [FK__Game__Franchise___4D94879B] FOREIGN KEY([Franchise_FranchiseID])
REFERENCES [dbo].[Franchise] ([FranchiseID])
GO
ALTER TABLE [dbo].[Game] CHECK CONSTRAINT [FK__Game__Franchise___4D94879B]
GO
ALTER TABLE [dbo].[Game_has_Characters]  WITH CHECK ADD FOREIGN KEY([Characters_CharacterID])
REFERENCES [dbo].[Characters] ([CharacterID])
GO
ALTER TABLE [dbo].[Game_has_Characters]  WITH CHECK ADD FOREIGN KEY([Game_GameID])
REFERENCES [dbo].[Game] ([GameID])
GO
ALTER TABLE [dbo].[genre_has_game]  WITH CHECK ADD FOREIGN KEY([Game_GameID])
REFERENCES [dbo].[Game] ([GameID])
GO
ALTER TABLE [dbo].[genre_has_game]  WITH CHECK ADD  CONSTRAINT [FK__genre_has__Genre__5812160E] FOREIGN KEY([Genre_GenreID])
REFERENCES [dbo].[Genre] ([GenreID])
GO
ALTER TABLE [dbo].[genre_has_game] CHECK CONSTRAINT [FK__genre_has__Genre__5812160E]
GO
ALTER TABLE [dbo].[Minimum_Requirements]  WITH CHECK ADD FOREIGN KEY([CPU_Name])
REFERENCES [dbo].[CPU] ([Name])
GO
ALTER TABLE [dbo].[Minimum_Requirements]  WITH CHECK ADD FOREIGN KEY([GPU_Name])
REFERENCES [dbo].[GPU] ([Name])
GO
ALTER TABLE [dbo].[Minimum_Requirements]  WITH CHECK ADD FOREIGN KEY([RAM_Name])
REFERENCES [dbo].[RAM] ([Name])
GO
ALTER TABLE [dbo].[Minimum_Requirements]  WITH CHECK ADD FOREIGN KEY([Software_SoftwareID])
REFERENCES [dbo].[Software] ([SoftwareID])
GO
ALTER TABLE [dbo].[Minimum_Requirements]  WITH CHECK ADD FOREIGN KEY([platform_has_game_Game_GameID], [platform_has_game_Platform_PlatformID])
REFERENCES [dbo].[platform_has_game] ([Game_GameID], [Platform_PlatformID])
GO
ALTER TABLE [dbo].[platform_has_game]  WITH CHECK ADD FOREIGN KEY([Game_GameID])
REFERENCES [dbo].[Game] ([GameID])
GO
ALTER TABLE [dbo].[platform_has_game]  WITH CHECK ADD FOREIGN KEY([Platform_PlatformID])
REFERENCES [dbo].[Platform] ([PlatformID])
GO
ALTER TABLE [dbo].[Review]  WITH CHECK ADD FOREIGN KEY([Game_GameID])
REFERENCES [dbo].[Game] ([GameID])
GO
ALTER TABLE [dbo].[Review]  WITH CHECK ADD FOREIGN KEY([Users_UserID])
REFERENCES [dbo].[Users] ([UserID])
GO
ALTER TABLE [dbo].[Staff]  WITH CHECK ADD FOREIGN KEY([Game_GameID])
REFERENCES [dbo].[Game] ([GameID])
GO
ALTER TABLE [dbo].[Staff]  WITH CHECK ADD FOREIGN KEY([Person_PersonID])
REFERENCES [dbo].[Person] ([PersonID])
GO
USE [master]
GO
ALTER DATABASE [DBProject] SET  READ_WRITE 
GO
