USE [master]
GO
/****** Object:  Database [DentalAppDB]    Script Date: 26.07.2023 18:24:17 ******/
CREATE DATABASE [DentalAppDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'DentalAppDB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\DentalAppDB.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'DentalAppDB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\DentalAppDB_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [DentalAppDB] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [DentalAppDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [DentalAppDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [DentalAppDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [DentalAppDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [DentalAppDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [DentalAppDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [DentalAppDB] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [DentalAppDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [DentalAppDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [DentalAppDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [DentalAppDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [DentalAppDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [DentalAppDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [DentalAppDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [DentalAppDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [DentalAppDB] SET  ENABLE_BROKER 
GO
ALTER DATABASE [DentalAppDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [DentalAppDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [DentalAppDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [DentalAppDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [DentalAppDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [DentalAppDB] SET READ_COMMITTED_SNAPSHOT ON 
GO
ALTER DATABASE [DentalAppDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [DentalAppDB] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [DentalAppDB] SET  MULTI_USER 
GO
ALTER DATABASE [DentalAppDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [DentalAppDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [DentalAppDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [DentalAppDB] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [DentalAppDB] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [DentalAppDB] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [DentalAppDB] SET QUERY_STORE = OFF
GO
USE [DentalAppDB]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 26.07.2023 18:24:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[__EFMigrationsHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK___EFMigrationsHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AccountPatients]    Script Date: 26.07.2023 18:24:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AccountPatients](
	[Id] [nvarchar](450) NOT NULL,
	[NameSurname] [nvarchar](256) NULL,
	[IdentityNumber] [nvarchar](256) NULL,
	[Email] [nvarchar](256) NULL,
	[Nationality] [nvarchar](256) NULL,
	[Gender] [nvarchar](5) NULL,
	[Birthday] [date] NULL,
	[Blood] [nvarchar](3) NULL,
	[MobilePhone] [nvarchar](256) NULL,
	[LandPhone] [nvarchar](256) NULL,
	[City] [nvarchar](256) NULL,
	[District] [nvarchar](256) NULL,
	[Address] [nvarchar](max) NULL,
	[Tariff] [bigint] NULL,
	[TreatmentStatus] [nvarchar](256) NULL,
	[Accounts_AspNetUsersIdFk_Fk] [nvarchar](450) NULL,
	[LastAccessTime] [datetime] NULL,
 CONSTRAINT [PK_AccountPatients] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Accounts]    Script Date: 26.07.2023 18:24:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Accounts](
	[AspNetUsers_Id_Fk] [nvarchar](450) NOT NULL,
 CONSTRAINT [PK_Accounts] PRIMARY KEY CLUSTERED 
(
	[AspNetUsers_Id_Fk] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AccountsDiagnozCategories]    Script Date: 26.07.2023 18:24:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AccountsDiagnozCategories](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[CategoryName] [nvarchar](256) NULL,
	[CreateDate] [datetime] NULL,
	[Accounts_AspNetUsersIdFk_Fk] [nvarchar](450) NULL,
 CONSTRAINT [PK_AccountsDiagnozCategories] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AccountsDiagnozLists]    Script Date: 26.07.2023 18:24:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AccountsDiagnozLists](
	[Id] [nvarchar](450) NOT NULL,
	[Name] [nvarchar](256) NULL,
	[Queue] [int] NULL,
	[AccountsDiagnozCategories_Id_Fk] [bigint] NULL,
 CONSTRAINT [PK_AccountsDiagnozLists] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AccountsTariffLists]    Script Date: 26.07.2023 18:24:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AccountsTariffLists](
	[Id] [nvarchar](450) NOT NULL,
	[Treatment] [nvarchar](256) NULL,
	[Price] [money] NULL,
	[Vat] [int] NULL,
	[PriceWithVat] [money] NULL,
	[Cost] [money] NULL,
	[Queue] [int] NULL,
	[AccountsTariffNamesCategories_Id_Fk] [bigint] NULL,
 CONSTRAINT [PK_AccountsTariffLists] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AccountsTariffNames]    Script Date: 26.07.2023 18:24:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AccountsTariffNames](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[TariffName] [nvarchar](256) NULL,
	[CreateDate] [datetime] NULL,
	[Accounts_AspNetUsersIdFk_Fk] [nvarchar](450) NULL,
 CONSTRAINT [PK_AccountsTariffNames] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AccountsTariffNamesCategories]    Script Date: 26.07.2023 18:24:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AccountsTariffNamesCategories](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[CategoryName] [nvarchar](256) NULL,
	[AccountsTariffNames_Id_Fk] [bigint] NULL,
 CONSTRAINT [PK_AccountsTariffNamesCategories] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AccountsTreatments]    Script Date: 26.07.2023 18:24:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AccountsTreatments](
	[Id] [nvarchar](450) NOT NULL,
	[Treatment] [nvarchar](256) NULL,
	[Price] [money] NULL,
	[Vat] [int] NULL,
	[PriceWithVat] [money] NULL,
	[Cost] [money] NULL,
	[Date] [datetime] NULL,
	[Teet] [nvarchar](2) NULL,
	[Accounts_AspNetUsers_Id_Fk] [nvarchar](450) NULL,
	[AccountPatients_Id_Fk] [nvarchar](450) NULL,
	[AccountsTariffLists_Id_Fk] [nvarchar](450) NULL,
	[AccountsDiagnozLists_Id_Fk] [nvarchar](450) NULL,
	[ActionLists_Id_Fk] [int] NULL,
	[Doctor_SubAccounts_AspNetUsers_Id_Fk] [nvarchar](450) NULL,
	[Comment] [nvarchar](max) NULL,
 CONSTRAINT [PK_AccountsTreatments] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ActionLists]    Script Date: 26.07.2023 18:24:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ActionLists](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ActionName] [varchar](50) NULL,
 CONSTRAINT [PK_ActionLists] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetRoleClaims]    Script Date: 26.07.2023 18:24:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetRoleClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[RoleId] [nvarchar](450) NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetRoleClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetRoles]    Script Date: 26.07.2023 18:24:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetRoles](
	[Id] [nvarchar](450) NOT NULL,
	[Name] [nvarchar](256) NULL,
	[NormalizedName] [nvarchar](256) NULL,
	[ConcurrencyStamp] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetRoles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserClaims]    Script Date: 26.07.2023 18:24:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [nvarchar](450) NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetUserClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserLogins]    Script Date: 26.07.2023 18:24:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserLogins](
	[LoginProvider] [nvarchar](450) NOT NULL,
	[ProviderKey] [nvarchar](450) NOT NULL,
	[ProviderDisplayName] [nvarchar](max) NULL,
	[UserId] [nvarchar](450) NOT NULL,
 CONSTRAINT [PK_AspNetUserLogins] PRIMARY KEY CLUSTERED 
(
	[LoginProvider] ASC,
	[ProviderKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserRoles]    Script Date: 26.07.2023 18:24:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserRoles](
	[UserId] [nvarchar](450) NOT NULL,
	[RoleId] [nvarchar](450) NOT NULL,
 CONSTRAINT [PK_AspNetUserRoles] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUsers]    Script Date: 26.07.2023 18:24:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUsers](
	[Id] [nvarchar](450) NOT NULL,
	[UserName] [nvarchar](256) NULL,
	[NormalizedUserName] [nvarchar](256) NULL,
	[Email] [nvarchar](256) NULL,
	[NormalizedEmail] [nvarchar](256) NULL,
	[EmailConfirmed] [bit] NOT NULL,
	[PasswordHash] [nvarchar](max) NULL,
	[SecurityStamp] [nvarchar](max) NULL,
	[ConcurrencyStamp] [nvarchar](max) NULL,
	[PhoneNumber] [nvarchar](max) NULL,
	[PhoneNumberConfirmed] [bit] NOT NULL,
	[TwoFactorEnabled] [bit] NOT NULL,
	[LockoutEnd] [datetimeoffset](7) NULL,
	[LockoutEnabled] [bit] NOT NULL,
	[AccessFailedCount] [int] NOT NULL,
 CONSTRAINT [PK_AspNetUsers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserTokens]    Script Date: 26.07.2023 18:24:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserTokens](
	[UserId] [nvarchar](450) NOT NULL,
	[LoginProvider] [nvarchar](450) NOT NULL,
	[Name] [nvarchar](450) NOT NULL,
	[Value] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetUserTokens] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[LoginProvider] ASC,
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DiagnozCategories]    Script Date: 26.07.2023 18:24:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DiagnozCategories](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CategoryName] [nvarchar](256) NULL,
 CONSTRAINT [PK_DiagnozCategories] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DiagnozLists]    Script Date: 26.07.2023 18:24:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DiagnozLists](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](256) NULL,
	[DiagnozCategories_Id_Fk] [int] NULL,
 CONSTRAINT [PK_DiagnozLists] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RoleTableIndexs]    Script Date: 26.07.2023 18:24:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RoleTableIndexs](
	[RoleId] [nvarchar](450) NOT NULL,
	[TableIndex] [real] NOT NULL,
 CONSTRAINT [PK_RoleTableIndexs] PRIMARY KEY CLUSTERED 
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SubAccounts]    Script Date: 26.07.2023 18:24:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SubAccounts](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[AspNetUsers_Id_Fk] [nvarchar](450) NULL,
	[Accounts_AspNetUsersIdFk_Fk] [nvarchar](450) NULL,
 CONSTRAINT [PK_SubAccounts] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TDBCostLists]    Script Date: 26.07.2023 18:24:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TDBCostLists](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Treatment] [nvarchar](256) NULL,
	[Price] [money] NULL,
	[Vat] [int] NULL,
	[PriceWithVat] [money] NULL,
	[TDBCostNameCategories_Id_Fk] [int] NULL,
 CONSTRAINT [PK_TDBCostLists] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TDBCostNameCategories]    Script Date: 26.07.2023 18:24:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TDBCostNameCategories](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[TDBCategoryName] [nvarchar](256) NULL,
	[TDBCostNames_Id_Fk] [int] NULL,
 CONSTRAINT [PK_TDBCostNameCategories] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TDBCostNames]    Script Date: 26.07.2023 18:24:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TDBCostNames](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[TDBCostName] [nvarchar](256) NULL,
	[Comment] [nvarchar](max) NULL,
	[CreateDate] [datetime] NULL,
 CONSTRAINT [PK_TDBCostNames] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20230213082548_InitialIdentity', N'6.0.13')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20230226182306_RoleTableIndexsMigration', N'6.0.13')
GO
INSERT [dbo].[AccountPatients] ([Id], [NameSurname], [IdentityNumber], [Email], [Nationality], [Gender], [Birthday], [Blood], [MobilePhone], [LandPhone], [City], [District], [Address], [Tariff], [TreatmentStatus], [Accounts_AspNetUsersIdFk_Fk], [LastAccessTime]) VALUES (N'6ea1da47-0660-4caf-b0e1-20535fba4a99', N'Ferhat Işık', NULL, NULL, NULL, NULL, CAST(N'1980-01-01' AS Date), NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, N'e406b078-66e8-4745-97b2-195c7cec2a48', CAST(N'2023-07-17T20:37:26.177' AS DateTime))
INSERT [dbo].[AccountPatients] ([Id], [NameSurname], [IdentityNumber], [Email], [Nationality], [Gender], [Birthday], [Blood], [MobilePhone], [LandPhone], [City], [District], [Address], [Tariff], [TreatmentStatus], [Accounts_AspNetUsersIdFk_Fk], [LastAccessTime]) VALUES (N'8480903d-fc2a-4175-b022-a17be546882b', N'Mehmet Ali Karlankuş', NULL, NULL, NULL, NULL, CAST(N'1985-01-01' AS Date), NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, N'e406b078-66e8-4745-97b2-195c7cec2a48', CAST(N'2023-07-03T18:52:32.987' AS DateTime))
INSERT [dbo].[AccountPatients] ([Id], [NameSurname], [IdentityNumber], [Email], [Nationality], [Gender], [Birthday], [Blood], [MobilePhone], [LandPhone], [City], [District], [Address], [Tariff], [TreatmentStatus], [Accounts_AspNetUsersIdFk_Fk], [LastAccessTime]) VALUES (N'936237a3-e3ab-4953-a47f-feb18f193535', N'ULUÇ EREN', NULL, NULL, NULL, NULL, CAST(N'1987-10-30' AS Date), NULL, N'05301137203', NULL, N'Merkez', NULL, NULL, 0, NULL, N'e406b078-66e8-4745-97b2-195c7cec2a48', CAST(N'2023-07-01T05:25:37.177' AS DateTime))
GO
INSERT [dbo].[Accounts] ([AspNetUsers_Id_Fk]) VALUES (N'e406b078-66e8-4745-97b2-195c7cec2a48')
GO
SET IDENTITY_INSERT [dbo].[AccountsDiagnozCategories] ON 

INSERT [dbo].[AccountsDiagnozCategories] ([Id], [CategoryName], [CreateDate], [Accounts_AspNetUsersIdFk_Fk]) VALUES (50, N'Cerrahi', CAST(N'2023-06-30T22:00:26.393' AS DateTime), N'e406b078-66e8-4745-97b2-195c7cec2a48')
INSERT [dbo].[AccountsDiagnozCategories] ([Id], [CategoryName], [CreateDate], [Accounts_AspNetUsersIdFk_Fk]) VALUES (51, N'Endodonti', CAST(N'2023-06-30T22:00:26.713' AS DateTime), N'e406b078-66e8-4745-97b2-195c7cec2a48')
INSERT [dbo].[AccountsDiagnozCategories] ([Id], [CategoryName], [CreateDate], [Accounts_AspNetUsersIdFk_Fk]) VALUES (52, N'Oral Diagnoz', CAST(N'2023-06-30T22:00:26.753' AS DateTime), N'e406b078-66e8-4745-97b2-195c7cec2a48')
INSERT [dbo].[AccountsDiagnozCategories] ([Id], [CategoryName], [CreateDate], [Accounts_AspNetUsersIdFk_Fk]) VALUES (53, N'Ortodonti', CAST(N'2023-06-30T22:00:26.763' AS DateTime), N'e406b078-66e8-4745-97b2-195c7cec2a48')
INSERT [dbo].[AccountsDiagnozCategories] ([Id], [CategoryName], [CreateDate], [Accounts_AspNetUsersIdFk_Fk]) VALUES (54, N'Pedodonti', CAST(N'2023-06-30T22:00:26.803' AS DateTime), N'e406b078-66e8-4745-97b2-195c7cec2a48')
INSERT [dbo].[AccountsDiagnozCategories] ([Id], [CategoryName], [CreateDate], [Accounts_AspNetUsersIdFk_Fk]) VALUES (55, N'Periodontoloji', CAST(N'2023-06-30T22:00:26.853' AS DateTime), N'e406b078-66e8-4745-97b2-195c7cec2a48')
INSERT [dbo].[AccountsDiagnozCategories] ([Id], [CategoryName], [CreateDate], [Accounts_AspNetUsersIdFk_Fk]) VALUES (56, N'Protez', CAST(N'2023-06-30T22:00:26.883' AS DateTime), N'e406b078-66e8-4745-97b2-195c7cec2a48')
INSERT [dbo].[AccountsDiagnozCategories] ([Id], [CategoryName], [CreateDate], [Accounts_AspNetUsersIdFk_Fk]) VALUES (57, N'Restoratif', CAST(N'2023-06-30T22:00:26.947' AS DateTime), N'e406b078-66e8-4745-97b2-195c7cec2a48')
SET IDENTITY_INSERT [dbo].[AccountsDiagnozCategories] OFF
GO
INSERT [dbo].[AccountsDiagnozLists] ([Id], [Name], [Queue], [AccountsDiagnozCategories_Id_Fk]) VALUES (N'00afcf25-5d92-4c39-b934-4e09a413f310', N'Kompozit Dolgu - COLE', 2, 57)
INSERT [dbo].[AccountsDiagnozLists] ([Id], [Name], [Queue], [AccountsDiagnozCategories_Id_Fk]) VALUES (N'03c44c39-f0a7-44af-8444-204bfe73e652', N'Laminate Veneer Seramik Kuron', 7, 56)
INSERT [dbo].[AccountsDiagnozLists] ([Id], [Name], [Queue], [AccountsDiagnozCategories_Id_Fk]) VALUES (N'053f5a8a-f341-4c42-a8ac-615e56871824', N'Süt Dişinde Kanal Tedavisi', 4, 54)
INSERT [dbo].[AccountsDiagnozLists] ([Id], [Name], [Queue], [AccountsDiagnozCategories_Id_Fk]) VALUES (N'05aa0d6d-9cf0-4902-af7c-94e73d93d996', N'Yumuşak Doku Lezyonu', 15, 50)
INSERT [dbo].[AccountsDiagnozLists] ([Id], [Name], [Queue], [AccountsDiagnozCategories_Id_Fk]) VALUES (N'08f4ce34-b239-4850-a30a-ae63bed1ff82', N'Cam İonomer Dolgu - COLE', 17, 57)
INSERT [dbo].[AccountsDiagnozLists] ([Id], [Name], [Queue], [AccountsDiagnozCategories_Id_Fk]) VALUES (N'09aa0e41-a0fa-4f24-85bc-6ca4dfda3a21', N'Cam İonomer Dolgu - OM', 19, 57)
INSERT [dbo].[AccountsDiagnozLists] ([Id], [Name], [Queue], [AccountsDiagnozCategories_Id_Fk]) VALUES (N'0af07cc9-978d-4e33-bc8e-971c427a71ee', N'Diş Renklenmesi', 35, 57)
INSERT [dbo].[AccountsDiagnozLists] ([Id], [Name], [Queue], [AccountsDiagnozCategories_Id_Fk]) VALUES (N'0ea36a3e-07e8-4fdc-931d-f0718ace96c7', N'Amalgam Dolgu - MOD', 10, 57)
INSERT [dbo].[AccountsDiagnozLists] ([Id], [Name], [Queue], [AccountsDiagnozCategories_Id_Fk]) VALUES (N'0f55c92c-96bf-4021-9cb7-796c78c13cc0', N'Cole Caries', 32, 57)
INSERT [dbo].[AccountsDiagnozLists] ([Id], [Name], [Queue], [AccountsDiagnozCategories_Id_Fk]) VALUES (N'1014eb72-7129-4bcb-ac26-c09dab63a30f', N'Çapraz Kapanış (Cross-Bıte)', 5, 53)
INSERT [dbo].[AccountsDiagnozLists] ([Id], [Name], [Queue], [AccountsDiagnozCategories_Id_Fk]) VALUES (N'14d806b9-4642-4b70-b350-f0192eade0e7', N'Dentin Pimi (M)', 24, 57)
INSERT [dbo].[AccountsDiagnozLists] ([Id], [Name], [Queue], [AccountsDiagnozCategories_Id_Fk]) VALUES (N'1bab8a04-9edd-42f5-885b-b0f6f1174222', N'Hassas Tutucu', 12, 56)
INSERT [dbo].[AccountsDiagnozLists] ([Id], [Name], [Queue], [AccountsDiagnozCategories_Id_Fk]) VALUES (N'1cb27012-f67e-416e-8826-0773dafa4cc2', N'Çocuk Protezi (Akrilik-Bölümlü-Tek Çene)', 8, 54)
INSERT [dbo].[AccountsDiagnozLists] ([Id], [Name], [Queue], [AccountsDiagnozCategories_Id_Fk]) VALUES (N'1d3622cf-7074-45c1-b1ff-3340991c044a', N'Cam İonomer Dolgu - OD', 18, 57)
INSERT [dbo].[AccountsDiagnozLists] ([Id], [Name], [Queue], [AccountsDiagnozCategories_Id_Fk]) VALUES (N'1f49d442-30af-4b8c-87ec-14ce1a2ff41a', N'Operasyon', 13, 50)
INSERT [dbo].[AccountsDiagnozLists] ([Id], [Name], [Queue], [AccountsDiagnozCategories_Id_Fk]) VALUES (N'1f573072-d1e2-4e1e-b3ba-b2267b0aafbe', N'İmplant Destekli Haraketli Protez', 15, 56)
INSERT [dbo].[AccountsDiagnozLists] ([Id], [Name], [Queue], [AccountsDiagnozCategories_Id_Fk]) VALUES (N'22762aca-56c8-4506-b5e6-0fa73b4ef863', N'Roch Köprü', 16, 56)
INSERT [dbo].[AccountsDiagnozLists] ([Id], [Name], [Queue], [AccountsDiagnozCategories_Id_Fk]) VALUES (N'2455f14d-f735-4888-8474-495eea9698f4', N'Amalgam Dolgu - COLE', 7, 57)
INSERT [dbo].[AccountsDiagnozLists] ([Id], [Name], [Queue], [AccountsDiagnozCategories_Id_Fk]) VALUES (N'2796e3db-fda0-475a-bb90-df6c0710de43', N'Caries (Do)', 29, 57)
INSERT [dbo].[AccountsDiagnozLists] ([Id], [Name], [Queue], [AccountsDiagnozCategories_Id_Fk]) VALUES (N'27bf9442-a350-4d84-9cd6-af9321def173', N'Döküm Post Core', 8, 56)
INSERT [dbo].[AccountsDiagnozLists] ([Id], [Name], [Queue], [AccountsDiagnozCategories_Id_Fk]) VALUES (N'2e3b7775-0b64-4dbd-9fb2-025471043c34', N'Amputasyon (Dolgu Hariç)', 1, 54)
INSERT [dbo].[AccountsDiagnozLists] ([Id], [Name], [Queue], [AccountsDiagnozCategories_Id_Fk]) VALUES (N'322dea64-add9-4461-9242-58e5e7c6109e', N'Kuron Akrilik', 5, 56)
INSERT [dbo].[AccountsDiagnozLists] ([Id], [Name], [Queue], [AccountsDiagnozCategories_Id_Fk]) VALUES (N'346b5f0b-8276-4af1-acd1-fe2331fda6fc', N'Tam Protez (Akrilik)', 1, 56)
INSERT [dbo].[AccountsDiagnozLists] ([Id], [Name], [Queue], [AccountsDiagnozCategories_Id_Fk]) VALUES (N'36a3fcae-bd37-42ad-a3db-7d5fc04e6934', N'Cam İonomer Dolgu - O', 16, 57)
INSERT [dbo].[AccountsDiagnozLists] ([Id], [Name], [Queue], [AccountsDiagnozCategories_Id_Fk]) VALUES (N'3b0ccb09-a5ec-4c0a-8917-34366d357e69', N'Eklem Patolojisi', 16, 50)
INSERT [dbo].[AccountsDiagnozLists] ([Id], [Name], [Queue], [AccountsDiagnozCategories_Id_Fk]) VALUES (N'3cb5c303-d4e6-4bfd-8eef-4a2ddfa6b3c9', N'Pulpitis', 7, 51)
INSERT [dbo].[AccountsDiagnozLists] ([Id], [Name], [Queue], [AccountsDiagnozCategories_Id_Fk]) VALUES (N'3d6d3959-dd3a-48b8-b42c-e3fdbbc32edf', N'Kompozit Dolgu - OM', 4, 57)
INSERT [dbo].[AccountsDiagnozLists] ([Id], [Name], [Queue], [AccountsDiagnozCategories_Id_Fk]) VALUES (N'3d9d8528-81f3-4cf2-acde-bf8858126d7a', N'Çene Kırığı', 2, 50)
INSERT [dbo].[AccountsDiagnozLists] ([Id], [Name], [Queue], [AccountsDiagnozCategories_Id_Fk]) VALUES (N'3e0b3347-4f3b-4f9e-ab90-40b361b85bb0', N'Gingivitis', 1, 55)
INSERT [dbo].[AccountsDiagnozLists] ([Id], [Name], [Queue], [AccountsDiagnozCategories_Id_Fk]) VALUES (N'449bc364-9c2c-429a-be33-368df5012830', N'Kompozit Dolgu - OD', 3, 57)
INSERT [dbo].[AccountsDiagnozLists] ([Id], [Name], [Queue], [AccountsDiagnozCategories_Id_Fk]) VALUES (N'4b47b734-7f2f-40e9-993f-698adcee32e1', N'İnley Dolgu - OM', 14, 57)
INSERT [dbo].[AccountsDiagnozLists] ([Id], [Name], [Queue], [AccountsDiagnozCategories_Id_Fk]) VALUES (N'4d47bdfe-3b54-461e-b1dd-fb372d5a9373', N'Endodontik Fistül', 6, 51)
INSERT [dbo].[AccountsDiagnozLists] ([Id], [Name], [Queue], [AccountsDiagnozCategories_Id_Fk]) VALUES (N'4f5c19b3-bda6-4ab1-ac26-bc6f8eb92621', N'Seconder Caries', 33, 57)
INSERT [dbo].[AccountsDiagnozLists] ([Id], [Name], [Queue], [AccountsDiagnozCategories_Id_Fk]) VALUES (N'5163b242-e42a-47b6-b988-9a4e74100eee', N'Tam Protez (Metal)', 3, 56)
INSERT [dbo].[AccountsDiagnozLists] ([Id], [Name], [Queue], [AccountsDiagnozCategories_Id_Fk]) VALUES (N'51d6a611-147b-41d8-9fa8-e5bd93f28c1d', N'Sabit Yer Tutucu', 2, 54)
INSERT [dbo].[AccountsDiagnozLists] ([Id], [Name], [Queue], [AccountsDiagnozCategories_Id_Fk]) VALUES (N'539c1c3c-ae99-4197-9aec-54cdc3661081', N'Mine Çatlağı', 7, 50)
INSERT [dbo].[AccountsDiagnozLists] ([Id], [Name], [Queue], [AccountsDiagnozCategories_Id_Fk]) VALUES (N'5469c136-e74a-4cf4-8668-030e39eb882c', N'Periodontal Splint (Hareketli)', 6, 55)
INSERT [dbo].[AccountsDiagnozLists] ([Id], [Name], [Queue], [AccountsDiagnozCategories_Id_Fk]) VALUES (N'54f45d08-6fad-44d0-9fe1-8d144561f8a6', N'Maksiller Darlık', 8, 53)
INSERT [dbo].[AccountsDiagnozLists] ([Id], [Name], [Queue], [AccountsDiagnozCategories_Id_Fk]) VALUES (N'582b032f-9a88-43b5-a4ca-22adf24108ee', N'Granülom', 3, 51)
INSERT [dbo].[AccountsDiagnozLists] ([Id], [Name], [Queue], [AccountsDiagnozCategories_Id_Fk]) VALUES (N'585582df-bd97-45f6-a6bd-dfc73e1328b8', N'Amalgam Dolgu - OD', 8, 57)
INSERT [dbo].[AccountsDiagnozLists] ([Id], [Name], [Queue], [AccountsDiagnozCategories_Id_Fk]) VALUES (N'58f2ebc5-dec1-4c30-9989-925c364066fa', N'Periodontal Splint (Sabit)', 5, 55)
INSERT [dbo].[AccountsDiagnozLists] ([Id], [Name], [Queue], [AccountsDiagnozCategories_Id_Fk]) VALUES (N'5d086648-219b-421a-a0ed-2f7b8899cd48', N'Amalgam Dolgu - O', 6, 57)
INSERT [dbo].[AccountsDiagnozLists] ([Id], [Name], [Queue], [AccountsDiagnozCategories_Id_Fk]) VALUES (N'5e7fbb40-de56-42bf-9a92-886ceb6f7eb4', N'Kret', 11, 50)
INSERT [dbo].[AccountsDiagnozLists] ([Id], [Name], [Queue], [AccountsDiagnozCategories_Id_Fk]) VALUES (N'5f6adece-212d-4eaf-bbb8-c43507f0d7a1', N'Prefabrike Kuron', 7, 54)
INSERT [dbo].[AccountsDiagnozLists] ([Id], [Name], [Queue], [AccountsDiagnozCategories_Id_Fk]) VALUES (N'65d5d7be-405a-4fa9-8b29-10821a27d0f8', N'Amalgam Dolgu - OM', 9, 57)
INSERT [dbo].[AccountsDiagnozLists] ([Id], [Name], [Queue], [AccountsDiagnozCategories_Id_Fk]) VALUES (N'6689d06e-9387-4582-b9e5-d7ba60a69112', N'Caries (O)', 26, 57)
INSERT [dbo].[AccountsDiagnozLists] ([Id], [Name], [Queue], [AccountsDiagnozCategories_Id_Fk]) VALUES (N'67e04521-f0ec-4004-997f-f6ecc66d5803', N'Deviasyon', 7, 53)
INSERT [dbo].[AccountsDiagnozLists] ([Id], [Name], [Queue], [AccountsDiagnozCategories_Id_Fk]) VALUES (N'6aeea637-aca8-489d-a684-7afd32e417af', N'Kırık Diş', 25, 57)
INSERT [dbo].[AccountsDiagnozLists] ([Id], [Name], [Queue], [AccountsDiagnozCategories_Id_Fk]) VALUES (N'6af7865a-c59b-4407-8689-a65f6c916653', N'Kuron Seramik', 6, 56)
INSERT [dbo].[AccountsDiagnozLists] ([Id], [Name], [Queue], [AccountsDiagnozCategories_Id_Fk]) VALUES (N'6d76ac0c-3f77-4302-87df-f21214796314', N'Gömülü Diş', 10, 50)
INSERT [dbo].[AccountsDiagnozLists] ([Id], [Name], [Queue], [AccountsDiagnozCategories_Id_Fk]) VALUES (N'71efb842-7dd0-406f-a59b-fe998f372447', N'Oral Solunum', 1, 53)
INSERT [dbo].[AccountsDiagnozLists] ([Id], [Name], [Queue], [AccountsDiagnozCategories_Id_Fk]) VALUES (N'721a4648-4e55-4df2-a132-eed446b4a643', N'Kırık Veya Düşmüş Dolgu', 36, 57)
INSERT [dbo].[AccountsDiagnozLists] ([Id], [Name], [Queue], [AccountsDiagnozCategories_Id_Fk]) VALUES (N'744295a8-b6a6-44a4-8fc4-ca091ae97d08', N'Hareketli Yer Tutucu', 3, 54)
INSERT [dbo].[AccountsDiagnozLists] ([Id], [Name], [Queue], [AccountsDiagnozCategories_Id_Fk]) VALUES (N'7a73cc11-94d2-44fa-9750-a7cafe9518d8', N'Lüxe Diş', 8, 50)
INSERT [dbo].[AccountsDiagnozLists] ([Id], [Name], [Queue], [AccountsDiagnozCategories_Id_Fk]) VALUES (N'7e37e55b-533b-495d-9fb1-881abc0f6b93', N'Gece Plağı (Yumuşak)', 9, 56)
INSERT [dbo].[AccountsDiagnozLists] ([Id], [Name], [Queue], [AccountsDiagnozCategories_Id_Fk]) VALUES (N'8764dca2-0bac-4cd4-93f7-a26eb3d90ea6', N'Periodontal Apse', 4, 55)
INSERT [dbo].[AccountsDiagnozLists] ([Id], [Name], [Queue], [AccountsDiagnozCategories_Id_Fk]) VALUES (N'8ebcbb16-03b7-4e1c-808c-38d8ec218d07', N'Kanal İçi Post Uygulaması', 22, 57)
INSERT [dbo].[AccountsDiagnozLists] ([Id], [Name], [Queue], [AccountsDiagnozCategories_Id_Fk]) VALUES (N'8f1afde5-e2a7-4290-859f-2662716f87e3', N'Strip Kuron', 10, 54)
INSERT [dbo].[AccountsDiagnozLists] ([Id], [Name], [Queue], [AccountsDiagnozCategories_Id_Fk]) VALUES (N'9460f290-24c4-4f3b-9ca0-51aa22fbb11c', N'Gangren', 10, 51)
INSERT [dbo].[AccountsDiagnozLists] ([Id], [Name], [Queue], [AccountsDiagnozCategories_Id_Fk]) VALUES (N'94fe978d-2dc1-4954-b334-958e85b76e94', N'Kötü Kanal Tedavisi', 2, 51)
INSERT [dbo].[AccountsDiagnozLists] ([Id], [Name], [Queue], [AccountsDiagnozCategories_Id_Fk]) VALUES (N'98a5a7c8-ad10-4120-8376-0e5b1dc75535', N'İnley Dolgu - MOD', 15, 57)
INSERT [dbo].[AccountsDiagnozLists] ([Id], [Name], [Queue], [AccountsDiagnozCategories_Id_Fk]) VALUES (N'9ae7588c-8959-475b-bb77-d48d3836a6f3', N'Panoramik Film', 1, 52)
INSERT [dbo].[AccountsDiagnozLists] ([Id], [Name], [Queue], [AccountsDiagnozCategories_Id_Fk]) VALUES (N'9aee0f8a-4b43-4c7c-bfd7-6cf50680fdfc', N'Bölümlü Protez (Metal)', 2, 56)
INSERT [dbo].[AccountsDiagnozLists] ([Id], [Name], [Queue], [AccountsDiagnozCategories_Id_Fk]) VALUES (N'9d2d1f65-8f82-4074-805c-54f4f9b61c8f', N'Laminate Veneer Kompozit', 11, 56)
INSERT [dbo].[AccountsDiagnozLists] ([Id], [Name], [Queue], [AccountsDiagnozCategories_Id_Fk]) VALUES (N'9deda8e3-9fbc-4af8-84aa-7f454251316f', N'Abrazyon', 37, 57)
INSERT [dbo].[AccountsDiagnozLists] ([Id], [Name], [Queue], [AccountsDiagnozCategories_Id_Fk]) VALUES (N'9e3ef62d-bba2-498f-9bb9-992f764aa4fa', N'Alveolitis', 14, 50)
INSERT [dbo].[AccountsDiagnozLists] ([Id], [Name], [Queue], [AccountsDiagnozCategories_Id_Fk]) VALUES (N'9e5196b6-2c4e-4db6-9362-6b0827aedf43', N'Perfore Pulpa (Kırık Nedeniyle)', 4, 51)
INSERT [dbo].[AccountsDiagnozLists] ([Id], [Name], [Queue], [AccountsDiagnozCategories_Id_Fk]) VALUES (N'a1fdb0da-3a3a-4e42-9abf-234f45c1398c', N'Caries (Mo)', 30, 57)
INSERT [dbo].[AccountsDiagnozLists] ([Id], [Name], [Queue], [AccountsDiagnozCategories_Id_Fk]) VALUES (N'a338814a-348e-4653-ab0e-e7ec48430897', N'Caries (Mod)', 31, 57)
INSERT [dbo].[AccountsDiagnozLists] ([Id], [Name], [Queue], [AccountsDiagnozCategories_Id_Fk]) VALUES (N'a3a9db8e-2fad-467d-b021-be9d2753bce4', N'Kalsifiye Kanal', 5, 51)
INSERT [dbo].[AccountsDiagnozLists] ([Id], [Name], [Queue], [AccountsDiagnozCategories_Id_Fk]) VALUES (N'a621fdcf-b2a2-42b9-9edb-c0578830f67b', N'İnley Dolgu - COLE', 12, 57)
INSERT [dbo].[AccountsDiagnozLists] ([Id], [Name], [Queue], [AccountsDiagnozCategories_Id_Fk]) VALUES (N'a94e1b78-5009-47f6-8f01-b777f4da5979', N'Bölümlü Protez (Akrilik)', 4, 56)
INSERT [dbo].[AccountsDiagnozLists] ([Id], [Name], [Queue], [AccountsDiagnozCategories_Id_Fk]) VALUES (N'b0178602-69c5-426f-8e63-8284541d20dd', N'Apikal Rezeksiyon', 6, 50)
INSERT [dbo].[AccountsDiagnozLists] ([Id], [Name], [Queue], [AccountsDiagnozCategories_Id_Fk]) VALUES (N'b2cfb865-e405-4756-8ad1-3ce88e6e8c3b', N'Radix', 9, 50)
INSERT [dbo].[AccountsDiagnozLists] ([Id], [Name], [Queue], [AccountsDiagnozCategories_Id_Fk]) VALUES (N'b3a9e55e-6799-4189-be71-5d7341932148', N'Kayıp Diş', 1, 50)
INSERT [dbo].[AccountsDiagnozLists] ([Id], [Name], [Queue], [AccountsDiagnozCategories_Id_Fk]) VALUES (N'b3c57af3-c4b5-4c7d-8efb-dc0d6f465f14', N'Maryland Köprü', 14, 56)
INSERT [dbo].[AccountsDiagnozLists] ([Id], [Name], [Queue], [AccountsDiagnozCategories_Id_Fk]) VALUES (N'b8514280-3038-4b83-a724-dbdb4f561a40', N'Caries (M)', 28, 57)
INSERT [dbo].[AccountsDiagnozLists] ([Id], [Name], [Queue], [AccountsDiagnozCategories_Id_Fk]) VALUES (N'b9ded441-e467-46f6-896e-c562c60a7c7f', N'Kuron Full Metal', 13, 56)
INSERT [dbo].[AccountsDiagnozLists] ([Id], [Name], [Queue], [AccountsDiagnozCategories_Id_Fk]) VALUES (N'bb9ce7ab-3a7a-4eb8-80ca-ddbd2dca1304', N'Kompozit Dolgu - O', 1, 57)
INSERT [dbo].[AccountsDiagnozLists] ([Id], [Name], [Queue], [AccountsDiagnozCategories_Id_Fk]) VALUES (N'c082e3f5-7e7c-4496-9992-3b3bb025517a', N'Kompozit Dolgu - MOD', 5, 57)
INSERT [dbo].[AccountsDiagnozLists] ([Id], [Name], [Queue], [AccountsDiagnozCategories_Id_Fk]) VALUES (N'c178edb2-3e21-4804-aea4-ca757612440e', N'Tek Köklü Reimplantasyon', 3, 50)
INSERT [dbo].[AccountsDiagnozLists] ([Id], [Name], [Queue], [AccountsDiagnozCategories_Id_Fk]) VALUES (N'cbe63387-2f45-4e0a-b14e-e478ef928186', N'Cam İonomer Dolgu - MOD', 20, 57)
INSERT [dbo].[AccountsDiagnozLists] ([Id], [Name], [Queue], [AccountsDiagnozCategories_Id_Fk]) VALUES (N'cc3a5fef-548b-4417-9bf2-a8650fa74355', N'Gece Plağı-Okluzal Splint (Sert)', 10, 56)
INSERT [dbo].[AccountsDiagnozLists] ([Id], [Name], [Queue], [AccountsDiagnozCategories_Id_Fk]) VALUES (N'ccf8891b-e2db-4342-ac0d-29a7ea8db32b', N'Apikal Apse', 8, 51)
INSERT [dbo].[AccountsDiagnozLists] ([Id], [Name], [Queue], [AccountsDiagnozCategories_Id_Fk]) VALUES (N'cf0b3b66-a507-4e55-8090-bee340193a60', N'Periodontal Fistül', 3, 55)
INSERT [dbo].[AccountsDiagnozLists] ([Id], [Name], [Queue], [AccountsDiagnozCategories_Id_Fk]) VALUES (N'd486f141-4919-4b51-a9ff-f2aac2d35dcd', N'Overjet', 6, 53)
INSERT [dbo].[AccountsDiagnozLists] ([Id], [Name], [Queue], [AccountsDiagnozCategories_Id_Fk]) VALUES (N'd5e6038a-cfbf-4143-9ab1-599ad4f0dcbd', N'Kanal Tedavi', 1, 51)
INSERT [dbo].[AccountsDiagnozLists] ([Id], [Name], [Queue], [AccountsDiagnozCategories_Id_Fk]) VALUES (N'dc8817ac-d3e3-4a18-8e63-f2ab5fe7b916', N'Fissür Örtülmesi', 6, 54)
INSERT [dbo].[AccountsDiagnozLists] ([Id], [Name], [Queue], [AccountsDiagnozCategories_Id_Fk]) VALUES (N'e0a50de4-ce66-4820-934c-f1de6c177513', N'Ortodontik Tedavi', 2, 53)
INSERT [dbo].[AccountsDiagnozLists] ([Id], [Name], [Queue], [AccountsDiagnozCategories_Id_Fk]) VALUES (N'e14816ec-abed-4843-9103-1b6a0b29a26b', N'Kök Rezorpsiyonu', 12, 50)
INSERT [dbo].[AccountsDiagnozLists] ([Id], [Name], [Queue], [AccountsDiagnozCategories_Id_Fk]) VALUES (N'e300e9ab-b15b-49c5-81d7-bf93b4a9d011', N'İmplant', 5, 50)
INSERT [dbo].[AccountsDiagnozLists] ([Id], [Name], [Queue], [AccountsDiagnozCategories_Id_Fk]) VALUES (N'e3fb21c2-63c3-43af-84e6-2969357fe03a', N'Caries (D)', 27, 57)
INSERT [dbo].[AccountsDiagnozLists] ([Id], [Name], [Queue], [AccountsDiagnozCategories_Id_Fk]) VALUES (N'e78f28a7-816e-4f0e-8e87-fa1e194947d1', N'Dişeti Apsesi', 9, 51)
INSERT [dbo].[AccountsDiagnozLists] ([Id], [Name], [Queue], [AccountsDiagnozCategories_Id_Fk]) VALUES (N'e88d23f7-a5ba-44c5-9ed4-19d45bd5f9df', N'İnley Dolgu - OD', 13, 57)
INSERT [dbo].[AccountsDiagnozLists] ([Id], [Name], [Queue], [AccountsDiagnozCategories_Id_Fk]) VALUES (N'e9d935e4-f8f5-4769-b556-c27ad78e3b2e', N'İnley Dolgu - O', 11, 57)
INSERT [dbo].[AccountsDiagnozLists] ([Id], [Name], [Queue], [AccountsDiagnozCategories_Id_Fk]) VALUES (N'ed177b49-5448-4d58-915e-19766f0df8cb', N'Derin Kapanış (Over/Deep-Bıte)', 4, 53)
INSERT [dbo].[AccountsDiagnozLists] ([Id], [Name], [Queue], [AccountsDiagnozCategories_Id_Fk]) VALUES (N'f0f271f0-8432-42c3-8070-2e61bfcba995', N'Apeksi Kapanmamış Dişte Kanal Tedavisi', 5, 54)
INSERT [dbo].[AccountsDiagnozLists] ([Id], [Name], [Queue], [AccountsDiagnozCategories_Id_Fk]) VALUES (N'f10fde95-bb18-43d5-b6d2-3f89e273255e', N'Periodontitis', 2, 55)
INSERT [dbo].[AccountsDiagnozLists] ([Id], [Name], [Queue], [AccountsDiagnozCategories_Id_Fk]) VALUES (N'f6554655-e9c2-4cb7-b8ca-d523c0841689', N'Çocuk Protezi (Akrilik-Tam-Tek Çene)', 9, 54)
INSERT [dbo].[AccountsDiagnozLists] ([Id], [Name], [Queue], [AccountsDiagnozCategories_Id_Fk]) VALUES (N'f7dac08a-afde-41b5-9fa6-668b95cf2a41', N'Dentin Pimi (D)', 23, 57)
GO
INSERT [dbo].[AccountsDiagnozLists] ([Id], [Name], [Queue], [AccountsDiagnozCategories_Id_Fk]) VALUES (N'fafdcf01-5fdf-470f-a0d7-8373e21351e9', N'Çok Köklü Reimplantasyon', 4, 50)
INSERT [dbo].[AccountsDiagnozLists] ([Id], [Name], [Queue], [AccountsDiagnozCategories_Id_Fk]) VALUES (N'fd35c91b-f720-42e9-a35f-741eed7933a1', N'Açık Kapanış (Open-Bıte)', 3, 53)
INSERT [dbo].[AccountsDiagnozLists] ([Id], [Name], [Queue], [AccountsDiagnozCategories_Id_Fk]) VALUES (N'fd5bbb1b-b441-480d-9cd2-eae651d9d3de', N'Mine Hipoplazisi', 34, 57)
INSERT [dbo].[AccountsDiagnozLists] ([Id], [Name], [Queue], [AccountsDiagnozCategories_Id_Fk]) VALUES (N'fee25928-f05a-4603-a794-38930b198f24', N'Kuafaj', 21, 57)
GO
INSERT [dbo].[AccountsTariffLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [Cost], [Queue], [AccountsTariffNamesCategories_Id_Fk]) VALUES (N'0032bd71-386b-4164-a73a-2e405347792b', N'Hemiseksiyon (Kök Amputasyonu - Kanal Tedavisi Hariç)', 1027.7800, 8, 1110.0000, 0.0000, 8, 135)
INSERT [dbo].[AccountsTariffLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [Cost], [Queue], [AccountsTariffNamesCategories_Id_Fk]) VALUES (N'00f10f0b-948c-4307-81a5-637f81f0b825', N'Seramik İnley Dolgu (İki Yüzlü)', 5078.7000, 8, 5485.0000, 0.0000, 18, 131)
INSERT [dbo].[AccountsTariffLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [Cost], [Queue], [AccountsTariffNamesCategories_Id_Fk]) VALUES (N'01c1331d-f70e-461d-8382-01b35d6570a6', N'Onley * (Seramik)', 8020.8300, 8, 8662.5000, 0.0000, 21, 138)
INSERT [dbo].[AccountsTariffLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [Cost], [Queue], [AccountsTariffNamesCategories_Id_Fk]) VALUES (N'01d2a4ce-f169-44d0-be71-a0b989129738', N'Dudak Yastıkçığı (Lip Bumper)', 2865.7400, 8, 3095.0000, 0.0000, 23, 136)
INSERT [dbo].[AccountsTariffLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [Cost], [Queue], [AccountsTariffNamesCategories_Id_Fk]) VALUES (N'024b679f-35e6-460e-a5d2-d3752b7eeb79', N'Endokron', 3180.5600, 8, 3435.0000, 0.0000, 42, 138)
INSERT [dbo].[AccountsTariffLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [Cost], [Queue], [AccountsTariffNamesCategories_Id_Fk]) VALUES (N'02a483f1-07cc-4fd3-ad56-2ab0252a89ae', N'Teşhis ve Tedavi Planlaması', 439.8100, 8, 475.0000, 0.0000, 8, 130)
INSERT [dbo].[AccountsTariffLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [Cost], [Queue], [AccountsTariffNamesCategories_Id_Fk]) VALUES (N'03c2fcf4-5322-4fd4-a261-e8a46d2c2b8b', N'Mini Vida Uygulaması', 1287.0400, 8, 1390.0000, 0.0000, 60, 136)
INSERT [dbo].[AccountsTariffLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [Cost], [Queue], [AccountsTariffNamesCategories_Id_Fk]) VALUES (N'03dbe63e-4c33-45ae-aaed-ace9b420a3c7', N'Damak Yarığı Protezi (Velum Uzantılı Aparey) (**)', 6500.0000, 8, 7020.0000, 0.0000, 39, 133)
INSERT [dbo].[AccountsTariffLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [Cost], [Queue], [AccountsTariffNamesCategories_Id_Fk]) VALUES (N'047afc2f-99f6-4f51-9824-80da0d32cbf7', N'Periapikal Lezyonlu Dişte Kanal Tedavisi - Tek Kanal (Dolgu Hariç)', 1125.0000, 8, 1215.0000, 0.0000, 31, 131)
INSERT [dbo].[AccountsTariffLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [Cost], [Queue], [AccountsTariffNamesCategories_Id_Fk]) VALUES (N'04992ff5-4cf7-4b8e-8526-82fb62803249', N'Nevralji Tedavisi (Alkol Enjeksiyonu)', 750.0000, 8, 810.0000, 0.0000, 38, 141)
INSERT [dbo].[AccountsTariffLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [Cost], [Queue], [AccountsTariffNamesCategories_Id_Fk]) VALUES (N'04a0d68d-f56c-4544-92b1-27d1d32eafdb', N'Uzman Dişhekimi Konsültasyonu', 291.6700, 8, 315.0000, 0.0000, 5, 130)
INSERT [dbo].[AccountsTariffLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [Cost], [Queue], [AccountsTariffNamesCategories_Id_Fk]) VALUES (N'04c826c5-75d9-417b-a514-c7901a281d6c', N'Şeffaf Plaklar ile Ortodontik Tedavi (Ağır) (Plak Ücreti Hariç)', 25351.8500, 8, 27380.0000, 0.0000, 64, 136)
INSERT [dbo].[AccountsTariffLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [Cost], [Queue], [AccountsTariffNamesCategories_Id_Fk]) VALUES (N'04d59ab0-82a8-4b39-a42e-4f96f0d0f11d', N'Stomatit Tedavisi,', 722.2200, 8, 780.0000, 0.0000, 28, 141)
INSERT [dbo].[AccountsTariffLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [Cost], [Queue], [AccountsTariffNamesCategories_Id_Fk]) VALUES (N'054cf641-97f7-4d1a-a76b-40d0e7ccbfbc', N'Dolgu Sökümü (Tek Diş)', 212.9600, 8, 230.0000, 0.0000, 24, 131)
INSERT [dbo].[AccountsTariffLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [Cost], [Queue], [AccountsTariffNamesCategories_Id_Fk]) VALUES (N'05a7c3ee-58ce-47a0-b2e8-460b30348b9a', N'Jaket Kuron (Akrilik)', 2923.6100, 8, 3157.4900, 0.0000, 27, 140)
INSERT [dbo].[AccountsTariffLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [Cost], [Queue], [AccountsTariffNamesCategories_Id_Fk]) VALUES (N'05c2da45-04dc-4152-bbbb-0b067c7e88ad', N'Amalgam Dolgu (Bir Yüzlü)', 1055.5500, 8, 1139.9900, 0.0000, 1, 138)
INSERT [dbo].[AccountsTariffLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [Cost], [Queue], [AccountsTariffNamesCategories_Id_Fk]) VALUES (N'05f1a009-448b-4822-b92a-7bb35dc55818', N'Uzman Dişhekimi Muayenesi', 465.2900, 8, 502.5100, 0.0000, 2, 137)
INSERT [dbo].[AccountsTariffLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [Cost], [Queue], [AccountsTariffNamesCategories_Id_Fk]) VALUES (N'05f6a2a8-bf0a-41c8-b4a2-ea9c0929fcf4', N'Tükürükte Mikrobiyolojik Analiz', 1368.0600, 8, 1477.5000, 0.0000, 11, 137)
INSERT [dbo].[AccountsTariffLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [Cost], [Queue], [AccountsTariffNamesCategories_Id_Fk]) VALUES (N'06547730-beb6-4d03-9858-fd0d6adfc9eb', N'Serbest Diş Eti Grefti (Tek Diş)', 1555.5600, 8, 1680.0000, 0.0000, 9, 142)
INSERT [dbo].[AccountsTariffLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [Cost], [Queue], [AccountsTariffNamesCategories_Id_Fk]) VALUES (N'07e45f54-996b-40d8-ace3-57efe0f0de7a', N'Gece Plağı (Sert Oklüzal Splintleme)', 4796.3000, 8, 5180.0000, 0.0000, 18, 133)
INSERT [dbo].[AccountsTariffLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [Cost], [Queue], [AccountsTariffNamesCategories_Id_Fk]) VALUES (N'08b451e6-9e14-4369-93a1-534ae6b1dc01', N'Kuron Köprü Tamiri * (Her Üye İçin)', 1333.3300, 8, 1440.0000, 0.0000, 37, 133)
INSERT [dbo].[AccountsTariffLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [Cost], [Queue], [AccountsTariffNamesCategories_Id_Fk]) VALUES (N'0a5b1edd-02f3-43c5-a3db-2cd92b5e48dd', N'Kanal Tedavisi - Üç Kanal (Dolgu Hariç)', 3319.4400, 8, 3585.0000, 0.0000, 29, 138)
INSERT [dbo].[AccountsTariffLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [Cost], [Queue], [AccountsTariffNamesCategories_Id_Fk]) VALUES (N'0b293579-2f63-47c6-bdb9-c6a750ee63bf', N'Apse Drenajı ve Tedavisi (Extraoral)', 1689.8100, 8, 1825.0000, 0.0000, 25, 134)
INSERT [dbo].[AccountsTariffLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [Cost], [Queue], [AccountsTariffNamesCategories_Id_Fk]) VALUES (N'0b6485de-3dd4-46c9-806a-c4566f69e7e7', N'Tomografi (İki Çene Çene)', 1652.7800, 8, 1785.0000, 0.0000, 26, 130)
INSERT [dbo].[AccountsTariffLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [Cost], [Queue], [AccountsTariffNamesCategories_Id_Fk]) VALUES (N'0b7fce3b-7b0e-4d03-9ee8-b71ce60598a9', N'Kuronlarda Freze Tekniği Farkı', 379.6300, 8, 410.0000, 0.0000, 31, 133)
INSERT [dbo].[AccountsTariffLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [Cost], [Queue], [AccountsTariffNamesCategories_Id_Fk]) VALUES (N'0c37afc7-ab46-40ad-88c6-946693f5d490', N'Lokal Anestezi (Enjeksiyon - İnfiltratif)', 104.1600, 8, 112.4900, 0.0000, 31, 137)
INSERT [dbo].[AccountsTariffLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [Cost], [Queue], [AccountsTariffNamesCategories_Id_Fk]) VALUES (N'0c5331b1-028a-4cc8-803d-c6487237708d', N'Ekstirpasyon (Her Kanal İçin)', 425.9300, 8, 460.0000, 0.0000, 26, 131)
INSERT [dbo].[AccountsTariffLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [Cost], [Queue], [AccountsTariffNamesCategories_Id_Fk]) VALUES (N'0c85c3d3-ef68-4ad4-8f87-a45686d27330', N'Açık Apeksli Dişte Apikal Bariyer (Her Kanal İçin - Dolgu ve Pansuman Ücretleri Hariç)', 2048.6100, 8, 2212.5000, 0.0000, 9, 139)
INSERT [dbo].[AccountsTariffLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [Cost], [Queue], [AccountsTariffNamesCategories_Id_Fk]) VALUES (N'0cb305dc-dc6d-4177-96a3-f4877f7791aa', N'Pinley *', 2087.9600, 8, 2255.0000, 0.0000, 22, 131)
INSERT [dbo].[AccountsTariffLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [Cost], [Queue], [AccountsTariffNamesCategories_Id_Fk]) VALUES (N'0d0e3e7f-0d5d-4f86-9b58-c4dced927b50', N'Angle Sınıf III Anomalilerinin Ortodontik Tedavisi', 17500.0100, 8, 18900.0100, 0.0000, 12, 143)
INSERT [dbo].[AccountsTariffLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [Cost], [Queue], [AccountsTariffNamesCategories_Id_Fk]) VALUES (N'0d8a631a-9d61-4edf-9e43-8086a86d9fad', N'Kuron Köprü Tamiri * (Her Üye İçin)', 2000.0000, 8, 2159.9900, 0.0000, 37, 140)
INSERT [dbo].[AccountsTariffLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [Cost], [Queue], [AccountsTariffNamesCategories_Id_Fk]) VALUES (N'0da9aa3b-94b9-46f3-b34a-53fb82588307', N'Fiberotomi', 777.7800, 8, 840.0000, 0.0000, 23, 142)
INSERT [dbo].[AccountsTariffLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [Cost], [Queue], [AccountsTariffNamesCategories_Id_Fk]) VALUES (N'0e8cb566-ecd6-4abb-8ec3-79b299ad0d39', N'Positioner Yapımı', 3856.4800, 8, 4165.0000, 0.0000, 49, 136)
INSERT [dbo].[AccountsTariffLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [Cost], [Queue], [AccountsTariffNamesCategories_Id_Fk]) VALUES (N'103b8559-b7ba-4e08-8b78-790e63e8610d', N'Damak Yarığı Protezi (Velum Uzantılı Aparey) (**)', 9750.0000, 8, 10530.0000, 0.0000, 39, 140)
INSERT [dbo].[AccountsTariffLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [Cost], [Queue], [AccountsTariffNamesCategories_Id_Fk]) VALUES (N'10acc42f-429c-4d49-ad9f-4f65d4453c3b', N'Diş Ağartma (Beyazlatma Vital Tek Diş En Çok 4 Adet) (Malzeme Ücreti Hariç)', 467.5900, 8, 505.0000, 0.0000, 45, 131)
INSERT [dbo].[AccountsTariffLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [Cost], [Queue], [AccountsTariffNamesCategories_Id_Fk]) VALUES (N'1174fa5f-af25-4073-81ed-f2b5ec27376c', N'Hemiseksiyon (Kök Amputasyonu - Kanal Tedavisi Hariç)', 1541.6700, 8, 1665.0000, 0.0000, 8, 142)
INSERT [dbo].[AccountsTariffLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [Cost], [Queue], [AccountsTariffNamesCategories_Id_Fk]) VALUES (N'11b23707-84e1-478f-afbb-4f8867107b0a', N'Laminate Veneer (Akrilik)', 2777.7800, 8, 3000.0000, 0.0000, 25, 133)
INSERT [dbo].[AccountsTariffLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [Cost], [Queue], [AccountsTariffNamesCategories_Id_Fk]) VALUES (N'11f4fa87-5380-4938-b9cd-6d5a08e6546f', N'Vitalite Kontrolü (Diş Başına)', 50.9300, 8, 55.0000, 0.0000, 13, 130)
INSERT [dbo].[AccountsTariffLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [Cost], [Queue], [AccountsTariffNamesCategories_Id_Fk]) VALUES (N'120ee959-284f-4676-b5f0-f440892130ad', N'Önleyici Ortodontik Tedavi', 8104.1700, 8, 8752.5000, 0.0000, 18, 143)
INSERT [dbo].[AccountsTariffLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [Cost], [Queue], [AccountsTariffNamesCategories_Id_Fk]) VALUES (N'12925c29-f2e7-4f82-a5d2-7f61f252cb9c', N'Açık Eklem Cerrahisi (Tek Taraflı)', 18893.5200, 8, 20405.0000, 0.0000, 46, 134)
INSERT [dbo].[AccountsTariffLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [Cost], [Queue], [AccountsTariffNamesCategories_Id_Fk]) VALUES (N'12a87f97-7de6-4319-a593-800664b8a92c', N'Metal İskelet Tamiri', 1791.6600, 8, 1934.9900, 0.0000, 14, 140)
INSERT [dbo].[AccountsTariffLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [Cost], [Queue], [AccountsTariffNamesCategories_Id_Fk]) VALUES (N'12b225a2-eb7b-4899-9735-a1061690ca24', N'Peri-İmplantitis (Cerrahi) (Biomaterial ve Membran Ücreti Hariç) (Tek İmp.)', 1703.7000, 8, 1840.0000, 0.0000, 19, 135)
INSERT [dbo].[AccountsTariffLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [Cost], [Queue], [AccountsTariffNamesCategories_Id_Fk]) VALUES (N'12d1aac2-bea4-4827-960b-162629e8448a', N'Diş Ağartma (Beyazlatma Vital Tek Diş En Çok 4 Adet) (Malzeme Ücreti Hariç)', 701.3900, 8, 757.5000, 0.0000, 45, 138)
INSERT [dbo].[AccountsTariffLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [Cost], [Queue], [AccountsTariffNamesCategories_Id_Fk]) VALUES (N'13dd553d-855c-4cd7-b68f-5bdf29327e8b', N'Diş İlavesi (Tek Diş)', 1548.6200, 8, 1672.5000, 0.0000, 15, 140)
INSERT [dbo].[AccountsTariffLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [Cost], [Queue], [AccountsTariffNamesCategories_Id_Fk]) VALUES (N'1474a9fc-8076-4cb3-b409-93034ad86dd9', N'Tomografi (Tek Çene)', 1384.2600, 8, 1495.0000, 0.0000, 25, 130)
INSERT [dbo].[AccountsTariffLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [Cost], [Queue], [AccountsTariffNamesCategories_Id_Fk]) VALUES (N'15843e19-af0d-4c24-870f-e75653f7a368', N'Nevralji Tedavisi Cerrahi (Nöroktomi vb.)', 2634.2600, 8, 2845.0000, 0.0000, 39, 134)
INSERT [dbo].[AccountsTariffLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [Cost], [Queue], [AccountsTariffNamesCategories_Id_Fk]) VALUES (N'15e20cf6-1637-4634-9c0e-7d71d9922f6c', N'Osteotomi (Tek Çene)', 19805.5600, 8, 21390.0000, 0.0000, 49, 134)
INSERT [dbo].[AccountsTariffLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [Cost], [Queue], [AccountsTariffNamesCategories_Id_Fk]) VALUES (N'166c4da3-d4dd-4dff-a7e5-f9a1b9d8f268', N'Amputasyon (Dolgu-Kron Üst Yapı-Biyomateryal Hariç)', 1319.4500, 8, 1425.0000, 0.0000, 6, 139)
INSERT [dbo].[AccountsTariffLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [Cost], [Queue], [AccountsTariffNamesCategories_Id_Fk]) VALUES (N'16be99bc-97f4-42f9-898d-aadc9d713d0d', N'Rubber-Dam Uygulaması', 259.2600, 8, 280.0000, 0.0000, 48, 131)
INSERT [dbo].[AccountsTariffLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [Cost], [Queue], [AccountsTariffNamesCategories_Id_Fk]) VALUES (N'16bf7f66-ec84-461e-81fa-e822feb18791', N'Eklem Tomografisi (Çift Taraflı)', 3048.6200, 8, 3292.5000, 0.0000, 27, 137)
INSERT [dbo].[AccountsTariffLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [Cost], [Queue], [AccountsTariffNamesCategories_Id_Fk]) VALUES (N'17e03b08-3148-4c81-95f9-b17510de001a', N'Metal İskelet Tamiri', 1194.4400, 8, 1290.0000, 0.0000, 14, 133)
INSERT [dbo].[AccountsTariffLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [Cost], [Queue], [AccountsTariffNamesCategories_Id_Fk]) VALUES (N'17f5b955-c55a-4ba6-908a-c4be277707d6', N'Stomatit Tedavisi,', 481.4800, 8, 520.0000, 0.0000, 28, 134)
INSERT [dbo].[AccountsTariffLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [Cost], [Queue], [AccountsTariffNamesCategories_Id_Fk]) VALUES (N'17f7a428-3de6-4e03-99ef-ad45ee81c3a7', N'Subgingival Küretaj (Tek Diş)', 708.3300, 8, 765.0000, 0.0000, 2, 142)
INSERT [dbo].[AccountsTariffLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [Cost], [Queue], [AccountsTariffNamesCategories_Id_Fk]) VALUES (N'18320779-ccac-4489-b552-97c61140019a', N'Kontrol Hekim Muayenesi', 388.8900, 8, 420.0000, 0.0000, 3, 137)
INSERT [dbo].[AccountsTariffLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [Cost], [Queue], [AccountsTariffNamesCategories_Id_Fk]) VALUES (N'1972ce15-eb23-44db-9e32-97d0197ddc5d', N'Seramik İnley Dolgu (İki Yüzlü)', 7618.0500, 8, 8227.4900, 0.0000, 18, 138)
INSERT [dbo].[AccountsTariffLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [Cost], [Queue], [AccountsTariffNamesCategories_Id_Fk]) VALUES (N'1a5bdeef-f2dd-416a-b1a4-927da8c3d88b', N'Geçici (İmmediat) Protez (Akrilik - Tek Çene)', 8458.3400, 8, 9135.0000, 0.0000, 7, 140)
INSERT [dbo].[AccountsTariffLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [Cost], [Queue], [AccountsTariffNamesCategories_Id_Fk]) VALUES (N'1acbf032-e5a6-490c-9fe5-932bd72cbd73', N'Kemik İçi İmplant (Tek Silindirik İmplant Ücreti Hariç)', 6597.2200, 8, 7125.0000, 0.0000, 34, 134)
INSERT [dbo].[AccountsTariffLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [Cost], [Queue], [AccountsTariffNamesCategories_Id_Fk]) VALUES (N'1acfcd26-717c-494e-811f-4607c74458c9', N'Odontogenik Tümör Operasyonu (Büyük)', 5541.6600, 8, 5984.9900, 0.0000, 37, 141)
INSERT [dbo].[AccountsTariffLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [Cost], [Queue], [AccountsTariffNamesCategories_Id_Fk]) VALUES (N'1b5f5b18-35a2-45d9-9510-88dad30c16b2', N'Vida Uygulaması (Tek Vida)', 666.6600, 8, 719.9900, 0.0000, 26, 143)
INSERT [dbo].[AccountsTariffLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [Cost], [Queue], [AccountsTariffNamesCategories_Id_Fk]) VALUES (N'1b78e6cd-7c79-4e4b-a121-0488e6395a4e', N'Tükürük Bezi Kanalından Taş Çıkarma (Komplike)', 1791.6700, 8, 1935.0000, 0.0000, 41, 134)
INSERT [dbo].[AccountsTariffLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [Cost], [Queue], [AccountsTariffNamesCategories_Id_Fk]) VALUES (N'1c8f809d-e784-43fd-bc0b-4a8bc058777f', N'Tam Seramik Kuron (Metal Desteksiz)', 8902.7900, 8, 9615.0100, 0.0000, 29, 140)
INSERT [dbo].[AccountsTariffLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [Cost], [Queue], [AccountsTariffNamesCategories_Id_Fk]) VALUES (N'1cd9069d-e86c-4783-bf54-9cc7a2f853ab', N'Odontogenik Tümör Operasyonu (Büyük)', 3694.4400, 8, 3990.0000, 0.0000, 37, 134)
INSERT [dbo].[AccountsTariffLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [Cost], [Queue], [AccountsTariffNamesCategories_Id_Fk]) VALUES (N'1d3e10c0-7395-4f5e-87c4-23dcdf7258d8', N'Kanal Dolgusu Sökümü (Her Kanal İçin)', 449.0700, 8, 485.0000, 0.0000, 34, 131)
INSERT [dbo].[AccountsTariffLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [Cost], [Queue], [AccountsTariffNamesCategories_Id_Fk]) VALUES (N'1da48d39-5090-49c8-b34a-9c63f008ae73', N'Lingual Teknikle Angle Sınıf II Anomalilerinin Ortodontik Tedavisi', 16791.6600, 8, 18134.9900, 0.0000, 15, 143)
INSERT [dbo].[AccountsTariffLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [Cost], [Queue], [AccountsTariffNamesCategories_Id_Fk]) VALUES (N'1e0720c9-73e1-4f19-82a4-664e53fca657', N'İmplant Destekli Hareketli Protezler (Hassas Tutucu Ücreti Hariç - Tek Çene)', 8120.3700, 8, 8770.0000, 0.0000, 6, 133)
INSERT [dbo].[AccountsTariffLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [Cost], [Queue], [AccountsTariffNamesCategories_Id_Fk]) VALUES (N'1edec0d7-6509-48b7-b373-476a8c776259', N'Tunnel Operasyonu (Tek Diş)', 1625.0000, 8, 1754.9900, 0.0000, 7, 142)
INSERT [dbo].[AccountsTariffLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [Cost], [Queue], [AccountsTariffNamesCategories_Id_Fk]) VALUES (N'1f915132-e265-43a3-aea5-b3ed4fbf3a44', N'İnterproksimal Aşındırma (Tek Diş)', 388.8900, 8, 420.0000, 0.0000, 61, 143)
INSERT [dbo].[AccountsTariffLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [Cost], [Queue], [AccountsTariffNamesCategories_Id_Fk]) VALUES (N'20198297-09c7-4a26-8b16-f7da76605ef0', N'Kanal Tedavisi - Tek Kanal (Dolgu Hariç)', 1083.3300, 8, 1170.0000, 0.0000, 27, 131)
INSERT [dbo].[AccountsTariffLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [Cost], [Queue], [AccountsTariffNamesCategories_Id_Fk]) VALUES (N'212411fb-809b-4dbc-ae06-6838034d7494', N'Alveol Düzeltilmesi (Yarım Çene)', 2282.4100, 8, 2465.0000, 0.0000, 12, 134)
INSERT [dbo].[AccountsTariffLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [Cost], [Queue], [AccountsTariffNamesCategories_Id_Fk]) VALUES (N'21349a0e-234d-42b8-a848-e22bdbb3c0f9', N'Kanaldan Kırılmış Materyal Çıkartılması', 1523.1500, 8, 1645.0000, 0.0000, 39, 131)
INSERT [dbo].[AccountsTariffLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [Cost], [Queue], [AccountsTariffNamesCategories_Id_Fk]) VALUES (N'21ff757c-3acf-4e20-a00c-e8d7230e7a44', N'Kanalda Perforasyon Tamiri (MTA vb.)', 1208.3400, 8, 1305.0100, 0.0000, 40, 138)
INSERT [dbo].[AccountsTariffLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [Cost], [Queue], [AccountsTariffNamesCategories_Id_Fk]) VALUES (N'22375701-9572-4234-a98d-fe2a94d0b60b', N'Proteze Yumuşak Akrilik Uygulaması (Daimi Tek Çene)', 5423.6100, 8, 5857.5000, 0.0000, 11, 140)
INSERT [dbo].[AccountsTariffLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [Cost], [Queue], [AccountsTariffNamesCategories_Id_Fk]) VALUES (N'226371d2-e538-4e1a-898f-6bcefc13b058', N'Ortognatik Cerrahi Ortodontik Tedavisi', 11518.5200, 8, 12440.0000, 0.0000, 59, 136)
INSERT [dbo].[AccountsTariffLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [Cost], [Queue], [AccountsTariffNamesCategories_Id_Fk]) VALUES (N'22a55d61-d2ac-4833-b6f4-2b1d0309f0e1', N'Amalgam Dolgu (İki Yüzlü)', 898.1500, 8, 970.0000, 0.0000, 2, 131)
INSERT [dbo].[AccountsTariffLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [Cost], [Queue], [AccountsTariffNamesCategories_Id_Fk]) VALUES (N'22f7b3a1-740f-4c16-a503-05b0505cffed', N'Oklüzyon Düzeltilmesi', 2699.0700, 8, 2915.0000, 0.0000, 47, 133)
INSERT [dbo].[AccountsTariffLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [Cost], [Queue], [AccountsTariffNamesCategories_Id_Fk]) VALUES (N'239372a1-cc71-413d-89aa-c5e743181ec0', N'Rubber-Dam Uygulaması', 388.8900, 8, 420.0000, 0.0000, 48, 138)
INSERT [dbo].[AccountsTariffLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [Cost], [Queue], [AccountsTariffNamesCategories_Id_Fk]) VALUES (N'24c2da47-da05-40d9-8a50-4f45c8a8ee86', N'Lingual Teknikle Angle Sınıf I Anomalilerinin Ortodontik Tedavisi', 8828.7000, 8, 9535.0000, 0.0000, 14, 136)
INSERT [dbo].[AccountsTariffLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [Cost], [Queue], [AccountsTariffNamesCategories_Id_Fk]) VALUES (N'2524de41-3de5-4685-aa3f-a31a9b256c2d', N'Odontogenik Tümör Operasyonu (Küçük)', 4756.9500, 8, 5137.5100, 0.0000, 36, 141)
INSERT [dbo].[AccountsTariffLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [Cost], [Queue], [AccountsTariffNamesCategories_Id_Fk]) VALUES (N'25a721fb-3d57-45dc-8302-0eb70da26092', N'Biyopsi', 2701.4000, 8, 2917.5100, 0.0000, 23, 141)
INSERT [dbo].[AccountsTariffLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [Cost], [Queue], [AccountsTariffNamesCategories_Id_Fk]) VALUES (N'25e05830-64b9-43a4-955f-f89b23c1e4d0', N'Saplı yumuşak doku grefti (Koronale Kaydırma, Yana Kaydırma,Tek Diş)', 1064.8100, 8, 1150.0000, 0.0000, 10, 135)
INSERT [dbo].[AccountsTariffLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [Cost], [Queue], [AccountsTariffNamesCategories_Id_Fk]) VALUES (N'25e402ec-e8c2-4e71-b62c-fb860b00049d', N'Alveol Düzeltilmesi (Yarım Çene)', 3423.6200, 8, 3697.5000, 0.0000, 12, 141)
INSERT [dbo].[AccountsTariffLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [Cost], [Queue], [AccountsTariffNamesCategories_Id_Fk]) VALUES (N'25f351a3-d18d-4d74-bfcf-695ab3621877', N'Gömülü Dişin Diş Dizisinde Yerine Yerleştirilmesi (Tek Diş)', 5217.5900, 8, 5635.0000, 0.0000, 57, 136)
INSERT [dbo].[AccountsTariffLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [Cost], [Queue], [AccountsTariffNamesCategories_Id_Fk]) VALUES (N'25fac0af-3393-4afa-893c-f23c0a364e91', N'Kroşe İlavesi', 1194.4400, 8, 1290.0000, 0.0000, 13, 133)
INSERT [dbo].[AccountsTariffLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [Cost], [Queue], [AccountsTariffNamesCategories_Id_Fk]) VALUES (N'2681f450-5b5b-4f0b-ba07-a8478cb26b31', N'Panoramik Film', 777.7800, 8, 840.0000, 0.0000, 18, 137)
INSERT [dbo].[AccountsTariffLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [Cost], [Queue], [AccountsTariffNamesCategories_Id_Fk]) VALUES (N'27c3dcc2-1a09-49d2-8895-c739088e504f', N'Amalgam Dolgu (Üç Yüzlü)', 1115.7400, 8, 1205.0000, 0.0000, 3, 131)
INSERT [dbo].[AccountsTariffLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [Cost], [Queue], [AccountsTariffNamesCategories_Id_Fk]) VALUES (N'296e96b7-edc8-4a1f-8600-0b689d84396d', N'Gingivoplasti (Tek Diş)', 1159.7300, 8, 1252.5000, 0.0000, 4, 142)
INSERT [dbo].[AccountsTariffLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [Cost], [Queue], [AccountsTariffNamesCategories_Id_Fk]) VALUES (N'299634ee-3f72-4d15-b478-9572250b1499', N'Seramik İnley Dolgu (Bir Yüzlü)', 6444.4500, 8, 6960.0100, 0.0000, 17, 138)
INSERT [dbo].[AccountsTariffLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [Cost], [Queue], [AccountsTariffNamesCategories_Id_Fk]) VALUES (N'2ae52459-b7d7-4fe1-b435-514c21f2a321', N'Lateral Sefalometrik Film', 784.7300, 8, 847.5000, 0.0000, 19, 137)
INSERT [dbo].[AccountsTariffLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [Cost], [Queue], [AccountsTariffNamesCategories_Id_Fk]) VALUES (N'2b053cff-ab5c-460a-906b-50a0eaadf89d', N'Kaide Yenileme (Rebazaj - Tek Çene)', 4263.8900, 8, 4605.0000, 0.0000, 9, 140)
INSERT [dbo].[AccountsTariffLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [Cost], [Queue], [AccountsTariffNamesCategories_Id_Fk]) VALUES (N'2ba50740-4891-499f-982c-f778ba9b3529', N'Tek Kökte Kök Ucu Rezeksiyonu (Kanal Tedavisi ve Dolgu Hariç)', 2337.9600, 8, 2525.0000, 0.0000, 5, 134)
INSERT [dbo].[AccountsTariffLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [Cost], [Queue], [AccountsTariffNamesCategories_Id_Fk]) VALUES (N'2bb579a0-bb09-4567-89be-556566deb5d9', N'Büküm İçeren Tel Tatbiki (Tek Çene)', 587.9600, 8, 635.0000, 0.0000, 33, 136)
INSERT [dbo].[AccountsTariffLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [Cost], [Queue], [AccountsTariffNamesCategories_Id_Fk]) VALUES (N'2bd3818e-8969-43b4-be70-101d2fcbc5d4', N'Zigoma İmplant (İmplant Ücreti Hariç)', 14840.2800, 8, 16027.5000, 0.0000, 54, 141)
INSERT [dbo].[AccountsTariffLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [Cost], [Queue], [AccountsTariffNamesCategories_Id_Fk]) VALUES (N'2bfca128-f4c2-4df5-8b3c-e114edf73044', N'Reverse Headgear', 7430.5500, 8, 8024.9900, 0.0000, 31, 143)
INSERT [dbo].[AccountsTariffLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [Cost], [Queue], [AccountsTariffNamesCategories_Id_Fk]) VALUES (N'2c1ce754-3b11-42bd-992f-a51e3ac302c0', N'Oklüzal Film', 256.9500, 8, 277.5100, 0.0000, 15, 137)
INSERT [dbo].[AccountsTariffLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [Cost], [Queue], [AccountsTariffNamesCategories_Id_Fk]) VALUES (N'2c687918-921e-4e4d-a44f-e70a8fd54ab3', N'Diş Çekimi', 606.4800, 8, 655.0000, 0.0000, 1, 134)
INSERT [dbo].[AccountsTariffLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [Cost], [Queue], [AccountsTariffNamesCategories_Id_Fk]) VALUES (N'2cd9da31-828c-4ed8-8066-9cba9fe61d4d', N'Reimplantasyon', 2708.3300, 8, 2925.0000, 0.0000, 32, 134)
INSERT [dbo].[AccountsTariffLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [Cost], [Queue], [AccountsTariffNamesCategories_Id_Fk]) VALUES (N'2d2036e4-f88d-443b-8ac5-434e78a1ee19', N'Hipnoz (Seans Başına)', 796.3000, 8, 860.0000, 0.0000, 6, 130)
INSERT [dbo].[AccountsTariffLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [Cost], [Queue], [AccountsTariffNamesCategories_Id_Fk]) VALUES (N'2d7ba881-0558-4475-b7b9-d8516dd5ef9e', N'Reimplantasyon', 4062.5000, 8, 4387.4900, 0.0000, 32, 141)
INSERT [dbo].[AccountsTariffLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [Cost], [Queue], [AccountsTariffNamesCategories_Id_Fk]) VALUES (N'2d7f6e4e-9ea9-4925-8580-a75329dc8b90', N'Kanalda Perforasyon Tamiri (MTA vb.)', 805.5600, 8, 870.0000, 0.0000, 40, 131)
INSERT [dbo].[AccountsTariffLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [Cost], [Queue], [AccountsTariffNamesCategories_Id_Fk]) VALUES (N'2dbbe891-1228-49f2-913d-879391f98c37', N'Açık Apeksli Dişte Apikal Bariyer (Her Kanal İçin - Dolgu ve Pansuman Ücretleri Hariç)', 1365.7400, 8, 1475.0000, 0.0000, 9, 132)
GO
INSERT [dbo].[AccountsTariffLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [Cost], [Queue], [AccountsTariffNamesCategories_Id_Fk]) VALUES (N'2e7b1d0e-741c-4a7b-ba78-701f4c1fbe43', N'Gingivoplasti (Tek Diş)', 773.1500, 8, 835.0000, 0.0000, 4, 135)
INSERT [dbo].[AccountsTariffLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [Cost], [Queue], [AccountsTariffNamesCategories_Id_Fk]) VALUES (N'2f468612-60e5-4b22-9d09-b7bd93d10666', N'Ortodontik Tedavi Amaçlı Gömük Dişlerin Üzerinin Açılması', 3520.8300, 8, 3802.5000, 0.0000, 42, 141)
INSERT [dbo].[AccountsTariffLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [Cost], [Queue], [AccountsTariffNamesCategories_Id_Fk]) VALUES (N'2f5411a3-23f9-4275-95b2-8faf1d842231', N'Ankraj Amaçlı Plak Çıkarma', 1587.9600, 8, 1715.0000, 0.0000, 53, 134)
INSERT [dbo].[AccountsTariffLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [Cost], [Queue], [AccountsTariffNamesCategories_Id_Fk]) VALUES (N'312ccbd2-1a44-4f79-9f28-ca6133e8e4e4', N'Geçici (İmmediat) Protez (Akrilik - Tek Çene)', 5638.8900, 8, 6090.0000, 0.0000, 7, 133)
INSERT [dbo].[AccountsTariffLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [Cost], [Queue], [AccountsTariffNamesCategories_Id_Fk]) VALUES (N'31661150-ca00-4a8d-a56b-99154e9390cb', N'Lokal Anestezi (Rejyonal)', 69.4400, 8, 75.0000, 0.0000, 32, 130)
INSERT [dbo].[AccountsTariffLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [Cost], [Queue], [AccountsTariffNamesCategories_Id_Fk]) VALUES (N'31b585e6-60c8-4515-bd92-4578030732a3', N'Alveolit Cerrahi Tedavisi', 1842.5900, 8, 1990.0000, 0.0000, 8, 134)
INSERT [dbo].[AccountsTariffLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [Cost], [Queue], [AccountsTariffNamesCategories_Id_Fk]) VALUES (N'31e8707c-7443-419d-93c9-7be53c6d42fb', N'Lingual Ataçman Tatbiki', 868.0500, 8, 937.4900, 0.0000, 41, 143)
INSERT [dbo].[AccountsTariffLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [Cost], [Queue], [AccountsTariffNamesCategories_Id_Fk]) VALUES (N'31ed832d-8ec3-442e-bd21-91a832b8464d', N'Braket Tatbiki (Tek Diş)', 708.3300, 8, 765.0000, 0.0000, 36, 143)
INSERT [dbo].[AccountsTariffLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [Cost], [Queue], [AccountsTariffNamesCategories_Id_Fk]) VALUES (N'329af17b-6f9a-43e3-bb06-6f45ec9db782', N'Aparey Tamiri', 1000.0100, 8, 1080.0100, 0.0000, 29, 143)
INSERT [dbo].[AccountsTariffLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [Cost], [Queue], [AccountsTariffNamesCategories_Id_Fk]) VALUES (N'3304618b-d24a-4b56-8b5c-c80b5396d3d5', N'Konsültasyon', 402.7800, 8, 435.0000, 0.0000, 4, 137)
INSERT [dbo].[AccountsTariffLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [Cost], [Queue], [AccountsTariffNamesCategories_Id_Fk]) VALUES (N'331816e5-3077-4f38-85ba-00d4d01337cb', N'Fizik Tedavi (İnfraruj Seansı)', 736.1100, 8, 795.0000, 0.0000, 29, 141)
INSERT [dbo].[AccountsTariffLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [Cost], [Queue], [AccountsTariffNamesCategories_Id_Fk]) VALUES (N'33fd6432-cea1-47c9-8ba1-d38475c4d6a5', N'Aparey Tamiri', 666.6700, 8, 720.0000, 0.0000, 29, 136)
INSERT [dbo].[AccountsTariffLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [Cost], [Queue], [AccountsTariffNamesCategories_Id_Fk]) VALUES (N'340e9105-dcfd-43fc-9138-2b127e4c9db8', N'Osteotomi (Tek Çene)', 29708.3400, 8, 32085.0100, 0.0000, 49, 141)
INSERT [dbo].[AccountsTariffLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [Cost], [Queue], [AccountsTariffNamesCategories_Id_Fk]) VALUES (N'34341b36-f58b-4f84-a5f4-791f445a761d', N'Çocuk Protezi (Akrilik - Bölümlü - Tek Çene)', 6423.6200, 8, 6937.5000, 0.0000, 16, 139)
INSERT [dbo].[AccountsTariffLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [Cost], [Queue], [AccountsTariffNamesCategories_Id_Fk]) VALUES (N'34b7e832-63a0-4b34-83a6-09a418acb430', N'Yer Tutucu (Sabit)', 1875.0000, 8, 2025.0000, 0.0000, 10, 132)
INSERT [dbo].[AccountsTariffLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [Cost], [Queue], [AccountsTariffNamesCategories_Id_Fk]) VALUES (N'34fedabb-c046-406b-87da-e09d1c7fca09', N'T.M.E. Mekonoterapi', 879.6300, 8, 950.0000, 0.0000, 43, 134)
INSERT [dbo].[AccountsTariffLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [Cost], [Queue], [AccountsTariffNamesCategories_Id_Fk]) VALUES (N'353f547d-dc84-41fe-adf1-a481c1d5d751', N'Peri-İmplantitis (Cerrahi Olmayan) (Tek İmp.)', 703.7000, 8, 760.0000, 0.0000, 20, 135)
INSERT [dbo].[AccountsTariffLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [Cost], [Queue], [AccountsTariffNamesCategories_Id_Fk]) VALUES (N'356419ce-c170-42c2-91db-7d6bdaee1eaf', N'Postoperatif Dudak Damak Yarığı (Ortodontik Tedavi)', 3587.9600, 8, 3875.0000, 0.0000, 46, 136)
INSERT [dbo].[AccountsTariffLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [Cost], [Queue], [AccountsTariffNamesCategories_Id_Fk]) VALUES (N'356a99d8-b90e-4bfd-8535-75a940bb4e9c', N'Kanama Müdahalesi (Dikişli)', 1231.4800, 8, 1330.0000, 0.0000, 10, 134)
INSERT [dbo].[AccountsTariffLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [Cost], [Queue], [AccountsTariffNamesCategories_Id_Fk]) VALUES (N'35d42aa2-e181-4e52-89ff-ce1c36e2782e', N'Ortodontik Ameliyat Arkı (Tek Çene)', 7069.4400, 8, 7635.0000, 0.0000, 54, 143)
INSERT [dbo].[AccountsTariffLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [Cost], [Queue], [AccountsTariffNamesCategories_Id_Fk]) VALUES (N'36908e61-0883-41ee-9a10-1e7d2ec70a27', N'Çene Kırığı (Basit)', 5217.5900, 8, 5635.0000, 0.0000, 30, 134)
INSERT [dbo].[AccountsTariffLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [Cost], [Queue], [AccountsTariffNamesCategories_Id_Fk]) VALUES (N'36c5d718-ee84-49bb-a7dc-34e86497d273', N'Mini Vida Uygulaması', 1930.5600, 8, 2085.0000, 0.0000, 60, 143)
INSERT [dbo].[AccountsTariffLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [Cost], [Queue], [AccountsTariffNamesCategories_Id_Fk]) VALUES (N'37e19dd5-d9fd-4908-b23d-25f6c76f0f11', N'Osteomyelitis veya Osteitis Operasyonu (Tek Çene Basit)', 4643.5200, 8, 5015.0000, 0.0000, 16, 134)
INSERT [dbo].[AccountsTariffLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [Cost], [Queue], [AccountsTariffNamesCategories_Id_Fk]) VALUES (N'37f6e48a-9e4e-478e-95ae-23466b3b890b', N'Kanal Tedavisi - İlave Her Kanal İçin', 601.8500, 8, 650.0000, 0.0000, 30, 131)
INSERT [dbo].[AccountsTariffLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [Cost], [Queue], [AccountsTariffNamesCategories_Id_Fk]) VALUES (N'382a2665-31ad-4b41-b81b-23d744522284', N'Şeffaf Plaklar ile Ortodontik Tedavi (Hafif) (Plak Ücreti Hariç)', 11833.3300, 8, 12780.0000, 0.0000, 62, 136)
INSERT [dbo].[AccountsTariffLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [Cost], [Queue], [AccountsTariffNamesCategories_Id_Fk]) VALUES (N'3897ccdc-c070-40a5-bb0e-5320b34c02bd', N'Kanama Müdahalesi (Dikişli)', 1847.2200, 8, 1995.0000, 0.0000, 10, 141)
INSERT [dbo].[AccountsTariffLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [Cost], [Queue], [AccountsTariffNamesCategories_Id_Fk]) VALUES (N'389ea0b2-efb4-4869-bdd0-006aaa9f2623', N'Kuron Sökümü (Tek Sabit Üye İçin)', 449.0700, 8, 485.0000, 0.0000, 35, 133)
INSERT [dbo].[AccountsTariffLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [Cost], [Queue], [AccountsTariffNamesCategories_Id_Fk]) VALUES (N'38a12017-5f23-405a-99ae-a6c21dd13f91', N'İmplant Destekli Hareketli Protezler (Hassas Tutucu Ücreti Hariç - Tek Çene)', 12180.5600, 8, 13155.0000, 0.0000, 6, 140)
INSERT [dbo].[AccountsTariffLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [Cost], [Queue], [AccountsTariffNamesCategories_Id_Fk]) VALUES (N'38bb9958-880f-4262-b812-d49b10641199', N'Laminate Veneer (Seramik)', 7120.3700, 8, 7690.0000, 0.0000, 26, 133)
INSERT [dbo].[AccountsTariffLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [Cost], [Queue], [AccountsTariffNamesCategories_Id_Fk]) VALUES (N'39350db8-3511-4dba-995b-3aeed6a3579b', N'Tükürük Bezi Kanalından Taş Çıkarma (Basit)', 1787.0400, 8, 1930.0000, 0.0000, 40, 134)
INSERT [dbo].[AccountsTariffLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [Cost], [Queue], [AccountsTariffNamesCategories_Id_Fk]) VALUES (N'39b65afd-b1b0-4bf3-8fdb-9d0d5a95010a', N'Periodontal Splint (Daimi)', 3347.2200, 8, 3615.0000, 0.0000, 11, 142)
INSERT [dbo].[AccountsTariffLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [Cost], [Queue], [AccountsTariffNamesCategories_Id_Fk]) VALUES (N'3a07bef8-55ff-4a0a-b27e-c386bb2ee3c8', N'Seramik İnley Dolgu (Üç Yüzlü)', 8194.4400, 8, 8850.0000, 0.0000, 19, 138)
INSERT [dbo].[AccountsTariffLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [Cost], [Queue], [AccountsTariffNamesCategories_Id_Fk]) VALUES (N'3a9bbd20-84d4-4ac5-b1b2-b7ea918b2d7b', N'Papil Oluşturma (Cerrahi) (Tek Papil)', 1263.8900, 8, 1365.0000, 0.0000, 21, 142)
INSERT [dbo].[AccountsTariffLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [Cost], [Queue], [AccountsTariffNamesCategories_Id_Fk]) VALUES (N'3ab17c9f-75e4-425c-ae3a-148c2d7abb93', N'Lingual Ataçman Tatbiki', 578.7000, 8, 625.0000, 0.0000, 41, 136)
INSERT [dbo].[AccountsTariffLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [Cost], [Queue], [AccountsTariffNamesCategories_Id_Fk]) VALUES (N'3b2b86d5-6d72-4cfd-8182-d7c9b6d292dc', N'Serbest Diş Eti Grefti (Tek Diş)', 1037.0400, 8, 1120.0000, 0.0000, 9, 135)
INSERT [dbo].[AccountsTariffLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [Cost], [Queue], [AccountsTariffNamesCategories_Id_Fk]) VALUES (N'3b645cf3-8ae1-4beb-a8d2-54a8c10717a3', N'Gömülü Diş Operasyonu', 2111.1100, 8, 2280.0000, 0.0000, 3, 134)
INSERT [dbo].[AccountsTariffLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [Cost], [Queue], [AccountsTariffNamesCategories_Id_Fk]) VALUES (N'3be16100-09ee-4709-b01e-fdeca3df6a77', N'Eklem Tomografisi (Çift Taraflı)', 2032.4100, 8, 2195.0000, 0.0000, 27, 130)
INSERT [dbo].[AccountsTariffLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [Cost], [Queue], [AccountsTariffNamesCategories_Id_Fk]) VALUES (N'3d2ec5a4-faed-4af5-802b-f2fb30d33653', N'T.M.E. Splint Yapımı', 3476.8500, 8, 3755.0000, 0.0000, 47, 136)
INSERT [dbo].[AccountsTariffLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [Cost], [Queue], [AccountsTariffNamesCategories_Id_Fk]) VALUES (N'3d51ad7a-b9a9-4659-a87b-a6e64b889b01', N'Veneer Kuron (Akrilik)', 3583.3400, 8, 3870.0000, 0.0000, 21, 140)
INSERT [dbo].[AccountsTariffLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [Cost], [Queue], [AccountsTariffNamesCategories_Id_Fk]) VALUES (N'3dea9b2c-9f4b-4c92-9d1a-0beae0f740c9', N'Tükürük Akış Hızı ve Tamponlama Kapasitesi Tayini', 328.7000, 8, 355.0000, 0.0000, 10, 130)
INSERT [dbo].[AccountsTariffLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [Cost], [Queue], [AccountsTariffNamesCategories_Id_Fk]) VALUES (N'3decff56-2b34-414f-bea9-c4a4f3f44bc6', N'T.M.E. Stabilizasyon Splinti', 3481.4800, 8, 3760.0000, 0.0000, 48, 133)
INSERT [dbo].[AccountsTariffLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [Cost], [Queue], [AccountsTariffNamesCategories_Id_Fk]) VALUES (N'3f362d58-50ec-4f60-9df5-cc5b62c88908', N'Uzman Dişhekimi Muayenesi', 310.1900, 8, 335.0000, 0.0000, 2, 130)
INSERT [dbo].[AccountsTariffLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [Cost], [Queue], [AccountsTariffNamesCategories_Id_Fk]) VALUES (N'3fb9a20a-f245-409d-9789-42fc0cee9c43', N'İmplant Rehberi (Tam Çene)', 3407.4100, 8, 3680.0000, 0.0000, 50, 133)
INSERT [dbo].[AccountsTariffLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [Cost], [Queue], [AccountsTariffNamesCategories_Id_Fk]) VALUES (N'3fe9c53e-e253-4db2-b54e-8394897765f0', N'Hızlı Maksiller Genişletme Apareyi', 4840.2800, 8, 5227.5000, 0.0000, 44, 143)
INSERT [dbo].[AccountsTariffLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [Cost], [Queue], [AccountsTariffNamesCategories_Id_Fk]) VALUES (N'4087489d-8c0f-4561-b44c-844f41534de3', N'Tükürük Akış Hızı ve Tamponlama Kapasitesi Tayini', 493.0500, 8, 532.4900, 0.0000, 10, 137)
INSERT [dbo].[AccountsTariffLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [Cost], [Queue], [AccountsTariffNamesCategories_Id_Fk]) VALUES (N'418b7f96-3738-4770-9c3c-98c65cd1e04e', N'Sabit Kapanış Yükseltici Tatbiki (Kısa Süreli)', 1381.9500, 8, 1492.5100, 0.0000, 13, 143)
INSERT [dbo].[AccountsTariffLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [Cost], [Queue], [AccountsTariffNamesCategories_Id_Fk]) VALUES (N'42bbace6-4c5d-49c2-9eea-6157be9a0f91', N'Dentin Pini Uygulaması (Her Pin Başına)', 222.2300, 8, 240.0000, 0.0000, 41, 138)
INSERT [dbo].[AccountsTariffLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [Cost], [Queue], [AccountsTariffNamesCategories_Id_Fk]) VALUES (N'43e514c4-3dc7-4cb6-bfc9-e8da583895c7', N'Proteze Yumuşak Akrilik Uygulaması (Geçici Tek Çene)', 2916.6600, 8, 3149.9900, 0.0000, 10, 140)
INSERT [dbo].[AccountsTariffLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [Cost], [Queue], [AccountsTariffNamesCategories_Id_Fk]) VALUES (N'442a675c-f19b-4021-b7c7-ae6044507ca5', N'Kanal İçi Hazır Post Uygulaması (Metal) (Dolgu Ücreti Hariç)', 750.0000, 8, 810.0000, 0.0000, 37, 131)
INSERT [dbo].[AccountsTariffLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [Cost], [Queue], [AccountsTariffNamesCategories_Id_Fk]) VALUES (N'4503bc27-9673-4aae-b8d1-4f6d23dba373', N'Nevralji Tedavisi Cerrahi (Nöroktomi vb.)', 3951.3900, 8, 4267.5000, 0.0000, 39, 141)
INSERT [dbo].[AccountsTariffLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [Cost], [Queue], [AccountsTariffNamesCategories_Id_Fk]) VALUES (N'4542d99e-60b9-4808-a16a-4ad60c700ffe', N'Kist Operasyonu (Küçük)', 2513.8900, 8, 2715.0000, 0.0000, 13, 134)
INSERT [dbo].[AccountsTariffLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [Cost], [Queue], [AccountsTariffNamesCategories_Id_Fk]) VALUES (N'45deb673-b2b0-4113-8558-97765368f9dd', N'Tomografi (Bölgesel)', 541.6700, 8, 585.0000, 0.0000, 24, 130)
INSERT [dbo].[AccountsTariffLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [Cost], [Queue], [AccountsTariffNamesCategories_Id_Fk]) VALUES (N'462a3e2c-bf72-45c4-86c6-8f7994f3ba90', N'Tek Çeneyi İlgilendiren Aparey Yapımı (Vida Hariç)', 1810.1900, 8, 1955.0000, 0.0000, 24, 136)
INSERT [dbo].[AccountsTariffLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [Cost], [Queue], [AccountsTariffNamesCategories_Id_Fk]) VALUES (N'46ffb2c9-3a66-4a4d-b2fe-4339a4179924', N'İnterproksimal Aşındırma (Tek Diş)', 259.2600, 8, 280.0000, 0.0000, 61, 136)
INSERT [dbo].[AccountsTariffLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [Cost], [Queue], [AccountsTariffNamesCategories_Id_Fk]) VALUES (N'4791a2bd-0fd4-4f23-b899-555796625aba', N'Açık Kapanışın Ortodontik Tedavisi', 18034.7300, 8, 19477.5000, 0.0000, 17, 143)
INSERT [dbo].[AccountsTariffLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [Cost], [Queue], [AccountsTariffNamesCategories_Id_Fk]) VALUES (N'481a651b-1cbc-40c7-be50-aca5a35e4603', N'Besleme (Tek Çene)', 3548.6100, 8, 3832.5000, 0.0000, 8, 140)
INSERT [dbo].[AccountsTariffLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [Cost], [Queue], [AccountsTariffNamesCategories_Id_Fk]) VALUES (N'4945a899-57d8-4ff9-9c32-71afa983cc9f', N'Model Set-Up', 1675.9300, 8, 1810.0000, 0.0000, 48, 136)
INSERT [dbo].[AccountsTariffLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [Cost], [Queue], [AccountsTariffNamesCategories_Id_Fk]) VALUES (N'4a0c251b-015d-4a3a-8dc5-ef2cb7c6db77', N'Tükürük Bezi Kanalından Taş Çıkarma (Komplike)', 2687.5100, 8, 2902.5100, 0.0000, 41, 141)
INSERT [dbo].[AccountsTariffLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [Cost], [Queue], [AccountsTariffNamesCategories_Id_Fk]) VALUES (N'4a47964d-9ea7-42c2-b04f-70e1e4c3d005', N'Papil Oluşturma (Cerrahi Olmayan) (Tek Papil)', 756.9500, 8, 817.5000, 0.0000, 22, 142)
INSERT [dbo].[AccountsTariffLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [Cost], [Queue], [AccountsTariffNamesCategories_Id_Fk]) VALUES (N'4a647ab0-2de0-42c2-b169-ef3b80426440', N'Gömülü Diş Operasyonu (Kemik Retansiyonlu)', 3715.2800, 8, 4012.5000, 0.0000, 4, 141)
INSERT [dbo].[AccountsTariffLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [Cost], [Queue], [AccountsTariffNamesCategories_Id_Fk]) VALUES (N'4a8027ba-97cd-4c6a-94b2-14b3e71cb13b', N'Adeziv Köprü (Maryland vb. gibi)', 2796.3000, 8, 3020.0000, 0.0000, 33, 133)
INSERT [dbo].[AccountsTariffLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [Cost], [Queue], [AccountsTariffNamesCategories_Id_Fk]) VALUES (N'4be00bc4-31c1-4a31-8dda-c1cf951804fd', N'Oklüzal Aşındırmalar', 1425.9300, 8, 1540.0000, 0.0000, 46, 133)
INSERT [dbo].[AccountsTariffLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [Cost], [Queue], [AccountsTariffNamesCategories_Id_Fk]) VALUES (N'4c0a6d01-91b7-409b-9e57-98c268c7ac9b', N'Sinüs Plastiği', 2476.8500, 8, 2675.0000, 0.0000, 19, 134)
INSERT [dbo].[AccountsTariffLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [Cost], [Queue], [AccountsTariffNamesCategories_Id_Fk]) VALUES (N'4c2e4601-23a9-41a3-bb41-924c40316883', N'Tek Parça Döküm Kuron', 2965.2800, 8, 3202.5000, 0.0000, 20, 140)
INSERT [dbo].[AccountsTariffLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [Cost], [Queue], [AccountsTariffNamesCategories_Id_Fk]) VALUES (N'4c3647ce-bd2d-4993-99f0-32f5ff2d414e', N'Gece Plağı (Yumuşak)', 1495.3700, 8, 1615.0000, 0.0000, 17, 133)
INSERT [dbo].[AccountsTariffLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [Cost], [Queue], [AccountsTariffNamesCategories_Id_Fk]) VALUES (N'4c456d67-747a-4cbd-b014-220b3f3db27d', N'Lingual Braket Tatbiki (Tek Diş)', 826.4000, 8, 892.5100, 0.0000, 37, 143)
INSERT [dbo].[AccountsTariffLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [Cost], [Queue], [AccountsTariffNamesCategories_Id_Fk]) VALUES (N'4c6926a0-bc77-4e6d-8404-e8d3005d84d0', N'Kompozit Dolgu (Bir Yüzlü)', 782.4100, 8, 845.0000, 0.0000, 4, 131)
INSERT [dbo].[AccountsTariffLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [Cost], [Queue], [AccountsTariffNamesCategories_Id_Fk]) VALUES (N'4cb1e45c-6ed7-4db6-a113-d52e11e84081', N'Geçici Kuron (Tek Diş İçin)', 798.6200, 8, 862.5000, 0.0000, 34, 140)
INSERT [dbo].[AccountsTariffLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [Cost], [Queue], [AccountsTariffNamesCategories_Id_Fk]) VALUES (N'4db9605c-e01a-4218-b76b-5886f81ef417', N'Kompomer Dolgu', 842.5900, 8, 910.0000, 0.0000, 4, 132)
INSERT [dbo].[AccountsTariffLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [Cost], [Queue], [AccountsTariffNamesCategories_Id_Fk]) VALUES (N'4e378354-1884-4c39-ac86-17b09f6cadd8', N'Hassasiyet Tedavisi (Tam Çene)', 1402.7900, 8, 1515.0100, 0.0000, 44, 138)
INSERT [dbo].[AccountsTariffLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [Cost], [Queue], [AccountsTariffNamesCategories_Id_Fk]) VALUES (N'4ec9373b-4c44-4911-875e-96fe22749be4', N'Kompozit İnley Dolgu (Üç Yüzlü)', 1662.0400, 8, 1795.0000, 0.0000, 16, 131)
INSERT [dbo].[AccountsTariffLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [Cost], [Queue], [AccountsTariffNamesCategories_Id_Fk]) VALUES (N'4eca949e-3341-4baa-b6a9-01b03bcdcfed', N'Tomografi (Bölgesel)', 812.5100, 8, 877.5100, 0.0000, 24, 137)
INSERT [dbo].[AccountsTariffLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [Cost], [Queue], [AccountsTariffNamesCategories_Id_Fk]) VALUES (N'4efd6dc1-9684-4bd8-817f-aef69e1e05fc', N'Lateral Sefalometrik Film', 523.1500, 8, 565.0000, 0.0000, 19, 130)
INSERT [dbo].[AccountsTariffLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [Cost], [Queue], [AccountsTariffNamesCategories_Id_Fk]) VALUES (N'4f82b3f5-de97-44b3-b351-41a6fab00b6d', N'T.M.E. Filmi ve Tetkiki', 777.7800, 8, 840.0000, 0.0000, 30, 130)
INSERT [dbo].[AccountsTariffLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [Cost], [Queue], [AccountsTariffNamesCategories_Id_Fk]) VALUES (N'4fbed643-cf16-46e8-892e-71be485e426b', N'Ekstirpasyon (Her Kanal İçin)', 638.9000, 8, 690.0100, 0.0000, 26, 138)
INSERT [dbo].[AccountsTariffLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [Cost], [Queue], [AccountsTariffNamesCategories_Id_Fk]) VALUES (N'500bd149-29ca-43f2-8cef-277e1c1fb29a', N'Laminate Veneer Kompozit', 2120.3700, 8, 2290.0000, 0.0000, 24, 133)
INSERT [dbo].[AccountsTariffLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [Cost], [Queue], [AccountsTariffNamesCategories_Id_Fk]) VALUES (N'51290118-76ba-4147-ad72-230b9fc7b2ac', N'Tam Protez (Döküm Metal ile Güçlendirilmiş - Tek Çene)', 12680.5500, 8, 13694.9900, 0.0000, 3, 140)
INSERT [dbo].[AccountsTariffLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [Cost], [Queue], [AccountsTariffNamesCategories_Id_Fk]) VALUES (N'51666bf4-ab06-40ca-9319-d6e0aa676c73', N'Komplike Çene Defektlerinde Protetik Tedavi (**)', 10490.7400, 8, 11330.0000, 0.0000, 43, 133)
INSERT [dbo].[AccountsTariffLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [Cost], [Queue], [AccountsTariffNamesCategories_Id_Fk]) VALUES (N'51f06be3-e28f-4bc7-ba0a-2f3a08097148', N'Pekiştirme Tedavisi', 3034.7300, 8, 3277.5000, 0.0000, 20, 143)
INSERT [dbo].[AccountsTariffLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [Cost], [Queue], [AccountsTariffNamesCategories_Id_Fk]) VALUES (N'522fab1b-938b-4abf-a0bc-cf1893481d36', N'Veneer Kuron (Akrilik)', 2388.8900, 8, 2580.0000, 0.0000, 21, 133)
INSERT [dbo].[AccountsTariffLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [Cost], [Queue], [AccountsTariffNamesCategories_Id_Fk]) VALUES (N'52a0cea9-4f1d-4d19-9127-9766a45f6257', N'Kroşe İlavesi', 1791.6600, 8, 1934.9900, 0.0000, 13, 140)
INSERT [dbo].[AccountsTariffLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [Cost], [Queue], [AccountsTariffNamesCategories_Id_Fk]) VALUES (N'53f6e3dd-47ba-4186-96ac-67fc9b345492', N'Ortodontik Fotoğraf Tetkiki', 201.3900, 8, 217.5000, 0.0000, 5, 143)
INSERT [dbo].[AccountsTariffLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [Cost], [Queue], [AccountsTariffNamesCategories_Id_Fk]) VALUES (N'54c7115f-8108-4ed8-9a8a-23802de2a050', N'Düşen Braket Tatbiki (Tek Diş)', 490.7400, 8, 530.0000, 0.0000, 39, 136)
INSERT [dbo].[AccountsTariffLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [Cost], [Queue], [AccountsTariffNamesCategories_Id_Fk]) VALUES (N'551cfe21-6941-44d0-a0fa-8dadfdfeb724', N'Kanama Müdahalesi (Basit)', 965.2800, 8, 1042.5000, 0.0000, 9, 141)
INSERT [dbo].[AccountsTariffLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [Cost], [Queue], [AccountsTariffNamesCategories_Id_Fk]) VALUES (N'5542edaf-3198-41c1-a08e-12b7b9290c8c', N'Bilgisayarlı Büyük T.M.E. Fonksiyon Testi', 5326.4000, 8, 5752.5100, 0.0000, 28, 137)
INSERT [dbo].[AccountsTariffLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [Cost], [Queue], [AccountsTariffNamesCategories_Id_Fk]) VALUES (N'5546ec47-c4c1-42e1-bb1f-0d6a44e88770', N'Seramik İnley Dolgu (Bir Yüzlü)', 4296.3000, 8, 4640.0000, 0.0000, 17, 131)
INSERT [dbo].[AccountsTariffLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [Cost], [Queue], [AccountsTariffNamesCategories_Id_Fk]) VALUES (N'55a0f12f-3212-455e-8d53-31860508c0e1', N'Sinüs Plastiği', 3715.2800, 8, 4012.5000, 0.0000, 19, 141)
INSERT [dbo].[AccountsTariffLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [Cost], [Queue], [AccountsTariffNamesCategories_Id_Fk]) VALUES (N'55dbd748-e711-4313-acc4-328f32e298e6', N'Laminate Veneer (Akrilik)', 4166.6700, 8, 4500.0000, 0.0000, 25, 140)
INSERT [dbo].[AccountsTariffLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [Cost], [Queue], [AccountsTariffNamesCategories_Id_Fk]) VALUES (N'55f4c3be-347e-45a6-be1b-eec25190a396', N'Bilgisayarlı Kas Tonus Analizi', 2402.7800, 8, 2595.0000, 0.0000, 29, 137)
INSERT [dbo].[AccountsTariffLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [Cost], [Queue], [AccountsTariffNamesCategories_Id_Fk]) VALUES (N'55ffac13-ebe8-4358-8483-835d009ff5af', N'Papil Oluşturma (Cerrahi Olmayan) (Tek Papil)', 504.6300, 8, 545.0000, 0.0000, 22, 135)
INSERT [dbo].[AccountsTariffLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [Cost], [Queue], [AccountsTariffNamesCategories_Id_Fk]) VALUES (N'5642bad2-f53f-4d87-ac85-1cd276dab688', N'Model Cerrahisi', 953.7000, 8, 1030.0000, 0.0000, 52, 136)
INSERT [dbo].[AccountsTariffLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [Cost], [Queue], [AccountsTariffNamesCategories_Id_Fk]) VALUES (N'56ab8402-c3eb-4cd8-9d7b-efe5b57e0d43', N'Sefalometrik Cerrahi Planı', 888.8900, 8, 960.0000, 0.0000, 50, 143)
INSERT [dbo].[AccountsTariffLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [Cost], [Queue], [AccountsTariffNamesCategories_Id_Fk]) VALUES (N'56d29864-b164-491b-ad86-dcb28fafdf65', N'Bölümlü Protez (Döküm Metal ile Güçlendirilmiş - Tek Çene)', 8328.7000, 8, 8995.0000, 0.0000, 4, 133)
INSERT [dbo].[AccountsTariffLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [Cost], [Queue], [AccountsTariffNamesCategories_Id_Fk]) VALUES (N'57435249-769e-4be7-9ffd-56ceffa7b19e', N'Apse Drenajı ve Tedavisi (İntraoral)', 2263.8900, 8, 2445.0000, 0.0000, 26, 141)
INSERT [dbo].[AccountsTariffLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [Cost], [Queue], [AccountsTariffNamesCategories_Id_Fk]) VALUES (N'574fa3a9-0458-437d-b903-798ae118fd8a', N'Çocuk Protezi', 2805.5600, 8, 3030.0000, 0.0000, 15, 139)
INSERT [dbo].[AccountsTariffLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [Cost], [Queue], [AccountsTariffNamesCategories_Id_Fk]) VALUES (N'57645e41-d82b-460a-bb87-84670d4ec4ae', N'Kısa Süreli Ortodontik Tedavi', 5509.2600, 8, 5950.0000, 0.0000, 19, 136)
INSERT [dbo].[AccountsTariffLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [Cost], [Queue], [AccountsTariffNamesCategories_Id_Fk]) VALUES (N'5768a80e-6880-46ed-b8f2-fdbdcdb36a10', N'Kompozit İnley Dolgu (İki Yüzlü)', 1523.1500, 8, 1645.0000, 0.0000, 15, 131)
INSERT [dbo].[AccountsTariffLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [Cost], [Queue], [AccountsTariffNamesCategories_Id_Fk]) VALUES (N'577c6b0f-2b5b-4bdc-8815-ee9f824ee755', N'Ekstra Oral Röntgen Filmi', 305.5500, 8, 329.9900, 0.0000, 17, 137)
INSERT [dbo].[AccountsTariffLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [Cost], [Queue], [AccountsTariffNamesCategories_Id_Fk]) VALUES (N'577eacd5-c7d7-4a22-a774-c10eeb5456c6', N'Torus Operasyonu (Yarım Çene)', 2430.5600, 8, 2625.0000, 0.0000, 35, 134)
INSERT [dbo].[AccountsTariffLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [Cost], [Queue], [AccountsTariffNamesCategories_Id_Fk]) VALUES (N'57c6fec7-166b-4b68-810b-74496acf7a84', N'Bant Tatbiki (Tek Diş)', 541.6700, 8, 585.0000, 0.0000, 35, 136)
GO
INSERT [dbo].[AccountsTariffLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [Cost], [Queue], [AccountsTariffNamesCategories_Id_Fk]) VALUES (N'58516782-23a1-4187-bebf-8d0945d00d46', N'Oral Hijyen Eğitimi', 361.1100, 8, 390.0000, 0.0000, 9, 137)
INSERT [dbo].[AccountsTariffLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [Cost], [Queue], [AccountsTariffNamesCategories_Id_Fk]) VALUES (N'585d54cf-550c-4ace-993b-f36e0a2432e0', N'Kemik İçi İmplant (Tek Silindirik İmplant Ücreti Hariç)', 9895.8300, 8, 10687.5000, 0.0000, 34, 141)
INSERT [dbo].[AccountsTariffLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [Cost], [Queue], [AccountsTariffNamesCategories_Id_Fk]) VALUES (N'58906656-b28f-451c-9516-1852531fe049', N'Bilgisayarlı Kas Tonus Analizi', 1601.8500, 8, 1730.0000, 0.0000, 29, 130)
INSERT [dbo].[AccountsTariffLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [Cost], [Queue], [AccountsTariffNamesCategories_Id_Fk]) VALUES (N'59318aea-a08d-4bf3-989d-3c676d416e95', N'Vestibül Plak (Diş Eti Protezi - Çene Başına)', 2250.0000, 8, 2430.0000, 0.0000, 16, 135)
INSERT [dbo].[AccountsTariffLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [Cost], [Queue], [AccountsTariffNamesCategories_Id_Fk]) VALUES (N'5950f98c-0bc3-4ab2-bda3-01d4a70c94bb', N'Düşen Bant Tatbiki (Tek Diş)', 518.5200, 8, 560.0000, 0.0000, 38, 136)
INSERT [dbo].[AccountsTariffLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [Cost], [Queue], [AccountsTariffNamesCategories_Id_Fk]) VALUES (N'595f83e1-c033-401d-8569-7fcd14a7331c', N'Yüzeysel Flor Uygulaması (Yarım Çene)', 370.3700, 8, 400.0000, 0.0000, 3, 132)
INSERT [dbo].[AccountsTariffLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [Cost], [Queue], [AccountsTariffNamesCategories_Id_Fk]) VALUES (N'59a643db-73de-45bb-adce-a055a5477252', N'Kanal Pansumanı (Seans Başı)', 259.2600, 8, 280.0000, 0.0000, 36, 131)
INSERT [dbo].[AccountsTariffLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [Cost], [Queue], [AccountsTariffNamesCategories_Id_Fk]) VALUES (N'5ab9f3a5-4020-442a-8341-8d56a9a9806a', N'Vitalite Kontrolü (Diş Başına)', 76.4000, 8, 82.5100, 0.0000, 13, 137)
INSERT [dbo].[AccountsTariffLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [Cost], [Queue], [AccountsTariffNamesCategories_Id_Fk]) VALUES (N'5b0c690c-cf25-4335-8f71-93e29d883e50', N'İmplant Çıkartılması', 2486.1100, 8, 2685.0000, 0.0000, 51, 134)
INSERT [dbo].[AccountsTariffLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [Cost], [Queue], [AccountsTariffNamesCategories_Id_Fk]) VALUES (N'5b435ef8-7cae-4cf4-8872-4e27db93d610', N'Fizik Tedavi (İnfraruj Seansı)', 490.7400, 8, 530.0000, 0.0000, 29, 134)
INSERT [dbo].[AccountsTariffLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [Cost], [Queue], [AccountsTariffNamesCategories_Id_Fk]) VALUES (N'5bdd7c73-7dc4-4eef-9b75-60b70f038f1f', N'Kanal İçi Hazır Post Uygulaması (Metal) (Dolgu Ücreti Hariç)', 1125.0000, 8, 1215.0000, 0.0000, 37, 138)
INSERT [dbo].[AccountsTariffLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [Cost], [Queue], [AccountsTariffNamesCategories_Id_Fk]) VALUES (N'5d7ed5e1-fe32-49e6-984c-cdae4c71af35', N'Geçici Obturatörler (**)', 4819.4400, 8, 5205.0000, 0.0000, 41, 133)
INSERT [dbo].[AccountsTariffLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [Cost], [Queue], [AccountsTariffNamesCategories_Id_Fk]) VALUES (N'5d89c56a-2bdb-420d-8544-85d625b621f6', N'Artrosentez (Tek Taraflı)', 1055.5600, 8, 1140.0000, 0.0000, 45, 134)
INSERT [dbo].[AccountsTariffLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [Cost], [Queue], [AccountsTariffNamesCategories_Id_Fk]) VALUES (N'5e16cb4b-4bfe-4322-8a79-68cb46c4f6bc', N'Strip Kron', 1368.0600, 8, 1477.5000, 0.0000, 13, 139)
INSERT [dbo].[AccountsTariffLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [Cost], [Queue], [AccountsTariffNamesCategories_Id_Fk]) VALUES (N'5e703e92-5832-44f7-9893-09ef4be178c5', N'Dişhekimi Muayenesi', 437.5100, 8, 472.5100, 0.0000, 1, 137)
INSERT [dbo].[AccountsTariffLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [Cost], [Queue], [AccountsTariffNamesCategories_Id_Fk]) VALUES (N'5e777a55-006c-43ca-ad9a-e14995f8583c', N'Kuafaj (Dolgu Hariç)', 106.4800, 8, 115.0000, 0.0000, 25, 131)
INSERT [dbo].[AccountsTariffLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [Cost], [Queue], [AccountsTariffNamesCategories_Id_Fk]) VALUES (N'5f377f3d-6fdb-43d6-a41a-f53b27c9df6f', N'Rezin İnfilitrasyonu Tedavisi', 2381.9400, 8, 2572.5000, 0.0000, 5, 139)
INSERT [dbo].[AccountsTariffLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [Cost], [Queue], [AccountsTariffNamesCategories_Id_Fk]) VALUES (N'5fdea180-2302-4827-957d-796f5d66883e', N'Teşhis ve Tedavi Planlaması', 659.7200, 8, 712.4900, 0.0000, 8, 137)
INSERT [dbo].[AccountsTariffLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [Cost], [Queue], [AccountsTariffNamesCategories_Id_Fk]) VALUES (N'60cbc32b-74d8-4106-9c73-785812d28a23', N'Açık Eklem Cerrahisi (Tek Taraflı)', 28340.2800, 8, 30607.5000, 0.0000, 46, 141)
INSERT [dbo].[AccountsTariffLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [Cost], [Queue], [AccountsTariffNamesCategories_Id_Fk]) VALUES (N'61340a64-3a63-4c2d-89a1-122b3021c6a7', N'Periapikal Lezyonlu Dişte Kanal Tedavisi - Üç Kanal (Dolgu Hariç)', 2291.6700, 8, 2475.0000, 0.0000, 33, 131)
INSERT [dbo].[AccountsTariffLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [Cost], [Queue], [AccountsTariffNamesCategories_Id_Fk]) VALUES (N'61584f75-46af-4861-b4ef-afb221bf79d7', N'Çocuk Protezi (Akrilik - Bölümlü - Tek Çene)', 4282.4100, 8, 4625.0000, 0.0000, 16, 132)
INSERT [dbo].[AccountsTariffLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [Cost], [Queue], [AccountsTariffNamesCategories_Id_Fk]) VALUES (N'61fcf7d4-9870-4f4f-b14b-b593ff7b9ba7', N'Pekiştirme Aygıtı (Hawley Aygıtı vb.)', 1666.6700, 8, 1800.0000, 0.0000, 21, 136)
INSERT [dbo].[AccountsTariffLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [Cost], [Queue], [AccountsTariffNamesCategories_Id_Fk]) VALUES (N'625c555b-eb2e-4747-98fd-0368969feafb', N'Yeni Doğanda Preoperatif Aparey (Vida Ücreti Ayrıca Alınır) (**)', 4777.7800, 8, 5160.0000, 0.0000, 40, 133)
INSERT [dbo].[AccountsTariffLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [Cost], [Queue], [AccountsTariffNamesCategories_Id_Fk]) VALUES (N'6297e85f-b028-4f12-93dd-113f64d73a7d', N'Sert Doku Greftleme (Greft Ücreti Hariç)', 5020.8300, 8, 5422.5000, 0.0000, 20, 141)
INSERT [dbo].[AccountsTariffLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [Cost], [Queue], [AccountsTariffNamesCategories_Id_Fk]) VALUES (N'62b796fd-8d00-46db-bf60-94c97d2260f0', N'Flap Operasyonu (Subgingival Küretaj Dahil - Tek Diş)', 1300.9300, 8, 1405.0000, 0.0000, 6, 135)
INSERT [dbo].[AccountsTariffLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [Cost], [Queue], [AccountsTariffNamesCategories_Id_Fk]) VALUES (N'63030090-dfa1-41bd-84ab-4d5572d8cdd6', N'Kanal Dolgusu Tekrarı (Retreatment - Her Kanal İçin - Dolgu Hariç)', 1032.4100, 8, 1115.0000, 0.0000, 35, 131)
INSERT [dbo].[AccountsTariffLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [Cost], [Queue], [AccountsTariffNamesCategories_Id_Fk]) VALUES (N'63923cef-ec44-4024-857a-39f81164433a', N'Black V Kole Dolgusu (Kompozit)', 965.2800, 8, 1042.5000, 0.0000, 8, 138)
INSERT [dbo].[AccountsTariffLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [Cost], [Queue], [AccountsTariffNamesCategories_Id_Fk]) VALUES (N'6474299e-010c-4708-9b76-7d695849adcd', N'Komplikasyonlu Diş Çekimi', 1750.0100, 8, 1890.0100, 0.0000, 2, 141)
INSERT [dbo].[AccountsTariffLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [Cost], [Queue], [AccountsTariffNamesCategories_Id_Fk]) VALUES (N'649d1c13-76bd-4586-9bb6-5200f064872d', N'Biyopsi', 1800.9300, 8, 1945.0000, 0.0000, 23, 134)
INSERT [dbo].[AccountsTariffLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [Cost], [Queue], [AccountsTariffNamesCategories_Id_Fk]) VALUES (N'6524787d-f232-45af-b10a-2c8611c16b4d', N'T.M.E. Mekonoterapi', 1319.4500, 8, 1425.0000, 0.0000, 43, 141)
INSERT [dbo].[AccountsTariffLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [Cost], [Queue], [AccountsTariffNamesCategories_Id_Fk]) VALUES (N'65780aa8-330b-4239-9a89-1f4d25bbb508', N'Tükürükte Mikrobiyolojik Analiz', 912.0400, 8, 985.0000, 0.0000, 11, 130)
INSERT [dbo].[AccountsTariffLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [Cost], [Queue], [AccountsTariffNamesCategories_Id_Fk]) VALUES (N'662a9532-41af-42a7-89c3-3fa8f8d6ec18', N'Fiberotomi', 518.5200, 8, 560.0000, 0.0000, 23, 135)
INSERT [dbo].[AccountsTariffLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [Cost], [Queue], [AccountsTariffNamesCategories_Id_Fk]) VALUES (N'663dd6e0-a2d9-41dd-815e-f45cc0b7ad34', N'T.M.E. Splint Yapımı', 5215.2800, 8, 5632.5000, 0.0000, 47, 143)
INSERT [dbo].[AccountsTariffLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [Cost], [Queue], [AccountsTariffNamesCategories_Id_Fk]) VALUES (N'66dabc5d-bf4d-44bb-9e7a-bd4b575d036b', N'Osteomyelitis veya Osteitis Operasyonu (Tek Çene Basit)', 6965.2800, 8, 7522.5000, 0.0000, 16, 141)
INSERT [dbo].[AccountsTariffLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [Cost], [Queue], [AccountsTariffNamesCategories_Id_Fk]) VALUES (N'67512477-9a47-4dfd-a587-c91d50f5e339', N'Angle Sınıf I Anomalilerinin Ortodontik Tedavisi', 7527.7800, 8, 8130.0000, 0.0000, 10, 136)
INSERT [dbo].[AccountsTariffLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [Cost], [Queue], [AccountsTariffNamesCategories_Id_Fk]) VALUES (N'68423930-8738-4bcc-8afb-d3570c0688cc', N'Ara Dönem Sefalometrik Film Analizi', 368.0600, 8, 397.5000, 0.0000, 8, 143)
INSERT [dbo].[AccountsTariffLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [Cost], [Queue], [AccountsTariffNamesCategories_Id_Fk]) VALUES (N'68c0d541-d7e4-4889-b74e-c89ec8b2c4c0', N'Dişhekimi Muayenesi', 291.6700, 8, 315.0000, 5300.0000, 1, 130)
INSERT [dbo].[AccountsTariffLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [Cost], [Queue], [AccountsTariffNamesCategories_Id_Fk]) VALUES (N'69c01ac9-8194-4192-97c8-d5267b9d6da5', N'Reserve Curve''li Niti Ark Tatbiki', 1326.3900, 8, 1432.5000, 0.0000, 58, 143)
INSERT [dbo].[AccountsTariffLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [Cost], [Queue], [AccountsTariffNamesCategories_Id_Fk]) VALUES (N'6b20aedd-43b3-4345-88c1-6751880dda6e', N'Gingivektomi (Tek Diş)', 870.3700, 8, 940.0000, 0.0000, 5, 135)
INSERT [dbo].[AccountsTariffLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [Cost], [Queue], [AccountsTariffNamesCategories_Id_Fk]) VALUES (N'6b5bae5c-f286-4b0e-8c37-2a54c3b87cfd', N'Ortodontik Modellerin Face - Bow ile Artikülatöre Taşınması', 3104.1600, 8, 3352.4900, 0.0000, 51, 143)
INSERT [dbo].[AccountsTariffLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [Cost], [Queue], [AccountsTariffNamesCategories_Id_Fk]) VALUES (N'6cfb874b-fce1-4d4e-9cd3-200e3b7024fd', N'Dolgu (Restorasyon) Tamiri', 773.1500, 8, 835.0000, 0.0000, 23, 131)
INSERT [dbo].[AccountsTariffLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [Cost], [Queue], [AccountsTariffNamesCategories_Id_Fk]) VALUES (N'6da7c2df-9464-4f26-a1be-ce66b2e0e137', N'Diş İlavesi (Tek Diş)', 1032.4100, 8, 1115.0000, 0.0000, 15, 133)
INSERT [dbo].[AccountsTariffLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [Cost], [Queue], [AccountsTariffNamesCategories_Id_Fk]) VALUES (N'6e26befa-c65f-46ce-85f8-4f002fd15616', N'İmplant Rehberi (Yarım Çene)', 3527.7800, 8, 3810.0000, 0.0000, 49, 140)
INSERT [dbo].[AccountsTariffLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [Cost], [Queue], [AccountsTariffNamesCategories_Id_Fk]) VALUES (N'6e543bdc-b0d9-4b78-a428-17c73cffbc86', N'Periapikal Lezyonlu Dişte Kanal Tedavisi - İki Kanal (Dolgu Hariç)', 1662.0400, 8, 1795.0000, 0.0000, 32, 131)
INSERT [dbo].[AccountsTariffLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [Cost], [Queue], [AccountsTariffNamesCategories_Id_Fk]) VALUES (N'6f0e6438-85b6-4bb0-9d13-e6a2f730e597', N'İki Kökte Kök Ucu Rezeksiyonu (Kanal Tedavisi ve Dolgu Hariç)', 2712.9600, 8, 2930.0000, 0.0000, 6, 134)
INSERT [dbo].[AccountsTariffLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [Cost], [Queue], [AccountsTariffNamesCategories_Id_Fk]) VALUES (N'6f4c2a8c-726c-48b2-a457-d8a98b32ff48', N'Lingual Teknikle Angle Sınıf I Anomalilerinin Ortodontik Tedavisi', 13243.0500, 8, 14302.4900, 0.0000, 14, 143)
INSERT [dbo].[AccountsTariffLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [Cost], [Queue], [AccountsTariffNamesCategories_Id_Fk]) VALUES (N'6f867fae-7596-4580-9054-ee6601725063', N'Lokal Anestezi (Enjeksiyon - İnfiltratif)', 69.4400, 8, 75.0000, 0.0000, 31, 130)
INSERT [dbo].[AccountsTariffLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [Cost], [Queue], [AccountsTariffNamesCategories_Id_Fk]) VALUES (N'6fc86361-7416-46ee-b23d-7c0bb3dcec79', N'Çocuk Protezi (Akrilik - Tam - Tek Çene)', 4685.1900, 8, 5060.0000, 0.0000, 17, 132)
INSERT [dbo].[AccountsTariffLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [Cost], [Queue], [AccountsTariffNamesCategories_Id_Fk]) VALUES (N'70f50a47-e25c-4ee6-a799-2f4fa1987037', N'Amalgam Dolgu (İki Yüzlü)', 1347.2300, 8, 1455.0000, 0.0000, 2, 138)
INSERT [dbo].[AccountsTariffLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [Cost], [Queue], [AccountsTariffNamesCategories_Id_Fk]) VALUES (N'71504881-27d1-4100-949b-ecf25e4ec51b', N'Kist Operasyonu (Küçük)', 3770.8400, 8, 4072.5000, 0.0000, 13, 141)
INSERT [dbo].[AccountsTariffLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [Cost], [Queue], [AccountsTariffNamesCategories_Id_Fk]) VALUES (N'715147eb-1001-47bb-9381-2216277c8462', N'Pinley ve Çeşitleri *', 3444.4500, 8, 3720.0100, 0.0000, 19, 140)
INSERT [dbo].[AccountsTariffLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [Cost], [Queue], [AccountsTariffNamesCategories_Id_Fk]) VALUES (N'7176a17f-7385-4fb1-b325-e1d6439e0475', N'Angle Sınıf III Anomalilerinin Ortodontik Tedavisi', 11666.6700, 8, 12600.0000, 0.0000, 12, 136)
INSERT [dbo].[AccountsTariffLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [Cost], [Queue], [AccountsTariffNamesCategories_Id_Fk]) VALUES (N'71a4fd0d-496c-4086-b08e-643d888065eb', N'Saplı yumuşak doku grefti (Koronale Kaydırma, Yana Kaydırma,Tek Diş)', 1597.2200, 8, 1724.9900, 0.0000, 10, 142)
INSERT [dbo].[AccountsTariffLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [Cost], [Queue], [AccountsTariffNamesCategories_Id_Fk]) VALUES (N'71eb19a0-943a-4296-9fd4-492899e70c5b', N'Segmental Ark veya Tork Arkı Tatbiki', 587.9600, 8, 635.0000, 0.0000, 34, 136)
INSERT [dbo].[AccountsTariffLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [Cost], [Queue], [AccountsTariffNamesCategories_Id_Fk]) VALUES (N'7220d835-09db-4887-a188-ab6e7a4ee5fe', N'Oklüzal Cerrahi Splint (Tek Çene)', 3476.8500, 8, 3755.0000, 0.0000, 53, 136)
INSERT [dbo].[AccountsTariffLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [Cost], [Queue], [AccountsTariffNamesCategories_Id_Fk]) VALUES (N'7226bfef-744b-4aae-93f1-3c4ff6de22d2', N'Diş Ağartma (Beyazlatma - Devital Tek Diş ) (Seans Başına - Dolgu Hariç)', 587.9600, 8, 635.0000, 0.0000, 46, 131)
INSERT [dbo].[AccountsTariffLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [Cost], [Queue], [AccountsTariffNamesCategories_Id_Fk]) VALUES (N'72395449-47a5-4fb5-a01b-6fa2653655f6', N'Tam Protez (Döküm Metal ile Güçlendirilmiş - Tek Çene)', 8453.7000, 8, 9130.0000, 0.0000, 3, 133)
INSERT [dbo].[AccountsTariffLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [Cost], [Queue], [AccountsTariffNamesCategories_Id_Fk]) VALUES (N'72ae038a-e10d-4968-8f66-d34de02554b7', N'Epulis Operasyonu', 1791.6700, 8, 1935.0000, 0.0000, 15, 134)
INSERT [dbo].[AccountsTariffLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [Cost], [Queue], [AccountsTariffNamesCategories_Id_Fk]) VALUES (N'7315606b-a390-43b7-bf86-1d950bedf447', N'Kompozit İnley Dolgu (Bir Yüzlü)', 2048.6100, 8, 2212.5000, 0.0000, 14, 138)
INSERT [dbo].[AccountsTariffLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [Cost], [Queue], [AccountsTariffNamesCategories_Id_Fk]) VALUES (N'73495e4c-204d-4ad5-acb6-bcf7fde2550b', N'Antero Posterior Sefalometrik Film Analizi (Frontal Film Analizi)', 300.9300, 8, 325.0000, 0.0000, 2, 136)
INSERT [dbo].[AccountsTariffLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [Cost], [Queue], [AccountsTariffNamesCategories_Id_Fk]) VALUES (N'74330572-0281-43c5-bfaa-d8ac435e39da', N'Kanal Tedavisi - İki Kanal (Dolgu Hariç)', 1620.3700, 8, 1750.0000, 0.0000, 28, 131)
INSERT [dbo].[AccountsTariffLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [Cost], [Queue], [AccountsTariffNamesCategories_Id_Fk]) VALUES (N'744ea7cf-f4d2-4ec8-aa31-87a95d68e15c', N'Şeffaf Plaklar ile Ortodontik Tedavi (Orta) (Plak Ücreti Hariç)', 25347.2300, 8, 27375.0000, 0.0000, 63, 143)
INSERT [dbo].[AccountsTariffLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [Cost], [Queue], [AccountsTariffNamesCategories_Id_Fk]) VALUES (N'74bb22f5-8cfc-4eac-b28e-be6398f61d40', N'Periodontal Splint (Geçici)', 2611.1100, 8, 2820.0000, 0.0000, 12, 135)
INSERT [dbo].[AccountsTariffLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [Cost], [Queue], [AccountsTariffNamesCategories_Id_Fk]) VALUES (N'74c6ed79-8828-400b-b8c5-26b845b7d0b7', N'Hassas Tutuculu Protezler (Hassas Tutucu Ücreti Hariç - Tek Çene)', 13263.8900, 8, 14325.0000, 0.0000, 5, 140)
INSERT [dbo].[AccountsTariffLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [Cost], [Queue], [AccountsTariffNamesCategories_Id_Fk]) VALUES (N'7504161a-dcfa-4f78-ad4e-ec163779d141', N'Üç Kökte Kök Ucu Rezeksiyonu (Kanal Tedavisi ve Dolgu Hariç)', 3115.7400, 8, 3365.0000, 0.0000, 7, 134)
INSERT [dbo].[AccountsTariffLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [Cost], [Queue], [AccountsTariffNamesCategories_Id_Fk]) VALUES (N'7521c5fa-8400-4eeb-a39d-61b41c876c27', N'Onley * (Seramik)', 5347.2200, 8, 5775.0000, 0.0000, 21, 131)
INSERT [dbo].[AccountsTariffLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [Cost], [Queue], [AccountsTariffNamesCategories_Id_Fk]) VALUES (N'75db61ef-c007-4698-a795-610c76bd2141', N'Ortodontik Tedavi Amaçlı Gömük Dişlerin Üzerinin Açılması', 2347.2200, 8, 2535.0000, 0.0000, 42, 134)
INSERT [dbo].[AccountsTariffLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [Cost], [Queue], [AccountsTariffNamesCategories_Id_Fk]) VALUES (N'7766216d-64cc-41bb-bb17-2d6e722b419a', N'Kemik Yaşı Tayini', 166.6700, 8, 180.0000, 0.0000, 3, 136)
INSERT [dbo].[AccountsTariffLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [Cost], [Queue], [AccountsTariffNamesCategories_Id_Fk]) VALUES (N'785f5468-cbcc-4db2-b7f8-6e8da36ee686', N'İmplant Rehberi (Yarım Çene)', 2351.8500, 8, 2540.0000, 0.0000, 49, 133)
INSERT [dbo].[AccountsTariffLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [Cost], [Queue], [AccountsTariffNamesCategories_Id_Fk]) VALUES (N'789f35e0-1f5c-4f90-bfc4-75fd177da042', N'Ortodontik Ameliyat Arkı (Tek Çene)', 4712.9600, 8, 5090.0000, 0.0000, 54, 136)
INSERT [dbo].[AccountsTariffLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [Cost], [Queue], [AccountsTariffNamesCategories_Id_Fk]) VALUES (N'78b803b7-2512-44e4-b6ec-79ccbd403fdc', N'Proteze Yumuşak Akrilik Uygulaması (Daimi Tek Çene)', 3615.7400, 8, 3905.0000, 0.0000, 11, 133)
INSERT [dbo].[AccountsTariffLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [Cost], [Queue], [AccountsTariffNamesCategories_Id_Fk]) VALUES (N'78e92ce9-c7b5-4313-92bb-d058fe9b9f67', N'Biyomateryal Uygulaması (Tek Diş - Flap Op. ve Biomateryal Ücreti Hariç)', 416.6700, 8, 450.0000, 0.0000, 14, 142)
INSERT [dbo].[AccountsTariffLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [Cost], [Queue], [AccountsTariffNamesCategories_Id_Fk]) VALUES (N'794b8a65-ee37-4da1-aa29-779d172d5434', N'Yer Tutucu (Sabit)', 2812.5000, 8, 3037.5000, 0.0000, 10, 139)
INSERT [dbo].[AccountsTariffLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [Cost], [Queue], [AccountsTariffNamesCategories_Id_Fk]) VALUES (N'79653064-b28a-4f66-b7de-4468349241a4', N'Tükürük Bezi Kanalından Taş Çıkarma (Basit)', 2680.5600, 8, 2895.0000, 0.0000, 40, 141)
INSERT [dbo].[AccountsTariffLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [Cost], [Queue], [AccountsTariffNamesCategories_Id_Fk]) VALUES (N'797228b2-b719-4845-9e72-117eb7a4d9a1', N'Teleskop Kuron* (Koping)', 2666.6700, 8, 2880.0000, 0.0000, 30, 133)
INSERT [dbo].[AccountsTariffLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [Cost], [Queue], [AccountsTariffNamesCategories_Id_Fk]) VALUES (N'79e00a6c-9de7-4746-9c92-c03ae4b42a17', N'Kanal Pansumanı (Seans Başı)', 388.8900, 8, 420.0000, 0.0000, 36, 138)
INSERT [dbo].[AccountsTariffLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [Cost], [Queue], [AccountsTariffNamesCategories_Id_Fk]) VALUES (N'7ada4411-b86a-457a-96f2-b1dc23689e2d', N'Akupunktur Uygulama (Seans Başına)', 1111.1100, 8, 1200.0000, 0.0000, 7, 137)
INSERT [dbo].[AccountsTariffLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [Cost], [Queue], [AccountsTariffNamesCategories_Id_Fk]) VALUES (N'7ba2d826-8739-4eb2-b583-ebc5c8320d59', N'Antero-Posterior Sefalometrik Film', 518.5200, 8, 560.0000, 0.0000, 20, 130)
INSERT [dbo].[AccountsTariffLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [Cost], [Queue], [AccountsTariffNamesCategories_Id_Fk]) VALUES (N'7c3578fb-9f69-48ac-bf77-ca5f79a59558', N'Gece Plağı (Sert Oklüzal Splintleme)', 7194.4500, 8, 7770.0100, 0.0000, 18, 140)
INSERT [dbo].[AccountsTariffLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [Cost], [Queue], [AccountsTariffNamesCategories_Id_Fk]) VALUES (N'7c60520d-eb39-44aa-921f-586dbd8bde99', N'Nevralji Tedavisi (Alkol Enjeksiyonu)', 500.0000, 8, 540.0000, 0.0000, 38, 134)
INSERT [dbo].[AccountsTariffLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [Cost], [Queue], [AccountsTariffNamesCategories_Id_Fk]) VALUES (N'7c752a27-094f-45db-b19c-6e718350d088', N'Jaket Kuron (Akrilik)', 1949.0700, 8, 2105.0000, 0.0000, 27, 133)
INSERT [dbo].[AccountsTariffLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [Cost], [Queue], [AccountsTariffNamesCategories_Id_Fk]) VALUES (N'7d4b6309-6438-44c4-b2a8-3a4373aeb0ba', N'Lingual Teknikle Angle Sınıf III Anomalilerinin Ortodontik Tedavisi', 13680.5600, 8, 14775.0000, 0.0000, 16, 136)
INSERT [dbo].[AccountsTariffLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [Cost], [Queue], [AccountsTariffNamesCategories_Id_Fk]) VALUES (N'7d4d0a74-8233-42f8-9784-ecc766f1c46e', N'Angle Sınıf II Anomalilerinin Ortodontik Tedavisi', 14319.4500, 8, 15465.0100, 0.0000, 11, 143)
INSERT [dbo].[AccountsTariffLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [Cost], [Queue], [AccountsTariffNamesCategories_Id_Fk]) VALUES (N'7dc43e43-4256-45b2-8d0a-208b2a34938b', N'Düşmüş Kuron ve Köprü Simantasyonu (Her Sabit Üye İçin)', 296.3000, 8, 320.0000, 0.0000, 36, 133)
INSERT [dbo].[AccountsTariffLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [Cost], [Queue], [AccountsTariffNamesCategories_Id_Fk]) VALUES (N'7e1760e6-4a6e-49d6-af49-2f1f7c1b60ec', N'El Bilek Filmi', 518.5200, 8, 560.0000, 0.0000, 22, 130)
INSERT [dbo].[AccountsTariffLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [Cost], [Queue], [AccountsTariffNamesCategories_Id_Fk]) VALUES (N'7e6d3d31-8d3f-4893-932c-e035d18c8665', N'Alveolit Cerrahi Tedavisi', 2763.8900, 8, 2985.0000, 0.0000, 8, 141)
INSERT [dbo].[AccountsTariffLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [Cost], [Queue], [AccountsTariffNamesCategories_Id_Fk]) VALUES (N'7ec6ddca-a80f-48e4-a03f-0dda3e36cee9', N'Subgingival İlaç Uygulaması', 64.8100, 8, 70.0000, 0.0000, 3, 135)
INSERT [dbo].[AccountsTariffLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [Cost], [Queue], [AccountsTariffNamesCategories_Id_Fk]) VALUES (N'7eed0b52-cf0c-4782-8b23-60248f31f6b2', N'Kist Operasyonu (1 Cm Büyük)', 3273.1500, 8, 3535.0000, 0.0000, 14, 134)
INSERT [dbo].[AccountsTariffLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [Cost], [Queue], [AccountsTariffNamesCategories_Id_Fk]) VALUES (N'80161f81-d182-4de0-9991-c9b3fb1b2a29', N'Black V Kole Dolgusu (Kompozit)', 643.5200, 8, 695.0000, 0.0000, 8, 131)
INSERT [dbo].[AccountsTariffLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [Cost], [Queue], [AccountsTariffNamesCategories_Id_Fk]) VALUES (N'804a4eb6-b729-4c31-b46e-34bc85322d36', N'Preoperatif Dudak Damak Yarığı (Ortodontik Tedavi)', 4384.2600, 8, 4735.0000, 0.0000, 45, 136)
INSERT [dbo].[AccountsTariffLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [Cost], [Queue], [AccountsTariffNamesCategories_Id_Fk]) VALUES (N'806cc6c9-7e0f-4b46-8a09-6a4b28a71130', N'Rezin İnfilitrasyonu Tedavisi', 1587.9600, 8, 1715.0000, 0.0000, 5, 132)
INSERT [dbo].[AccountsTariffLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [Cost], [Queue], [AccountsTariffNamesCategories_Id_Fk]) VALUES (N'809a32a8-c9b0-4a9a-bf4a-f9192da2f534', N'Oklüzal Aşındırmalar', 2138.9000, 8, 2310.0100, 0.0000, 46, 140)
INSERT [dbo].[AccountsTariffLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [Cost], [Queue], [AccountsTariffNamesCategories_Id_Fk]) VALUES (N'80e5f5b1-2f64-4c7d-af30-23c4d22ff681', N'Epulis Operasyonu', 2687.5100, 8, 2902.5100, 0.0000, 15, 141)
INSERT [dbo].[AccountsTariffLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [Cost], [Queue], [AccountsTariffNamesCategories_Id_Fk]) VALUES (N'81237641-0b7a-45d6-a240-aab28d117b98', N'Bölümlü Protez (Akrilik - Tek Çene)', 9534.7200, 8, 10297.5000, 0.0000, 2, 140)
INSERT [dbo].[AccountsTariffLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [Cost], [Queue], [AccountsTariffNamesCategories_Id_Fk]) VALUES (N'8173f621-3fb8-4573-9180-7e76a2f25db8', N'Önleyici Ortodontik Tedavi', 5402.7800, 8, 5835.0000, 0.0000, 18, 136)
INSERT [dbo].[AccountsTariffLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [Cost], [Queue], [AccountsTariffNamesCategories_Id_Fk]) VALUES (N'818a34df-32a4-4101-aefd-384bfbd0ff4f', N'İmplant Rehberi (Tam Çene)', 5111.1200, 8, 5520.0000, 0.0000, 50, 140)
INSERT [dbo].[AccountsTariffLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [Cost], [Queue], [AccountsTariffNamesCategories_Id_Fk]) VALUES (N'82507855-196c-4944-a7f2-d49f5a12a60e', N'Onley *', 2092.5900, 8, 2260.0000, 0.0000, 20, 131)
INSERT [dbo].[AccountsTariffLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [Cost], [Queue], [AccountsTariffNamesCategories_Id_Fk]) VALUES (N'82627351-92c9-496c-af48-289723ad0665', N'Raporlama', 215.2800, 8, 232.5000, 0.0000, 33, 137)
INSERT [dbo].[AccountsTariffLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [Cost], [Queue], [AccountsTariffNamesCategories_Id_Fk]) VALUES (N'82fbd4a2-e4ba-4098-869d-85aca7de9167', N'Kompozit İnley Dolgu (İki Yüzlü)', 2284.7300, 8, 2467.5000, 0.0000, 15, 138)
INSERT [dbo].[AccountsTariffLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [Cost], [Queue], [AccountsTariffNamesCategories_Id_Fk]) VALUES (N'832c1fe4-1a1d-4a9d-bdc0-3d4ff662fd3c', N'Gnatoloji, T.M.E. Kas Muayenesi (Oklüzyon Kontrolü)', 1826.3900, 8, 1972.5000, 0.0000, 12, 137)
GO
INSERT [dbo].[AccountsTariffLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [Cost], [Queue], [AccountsTariffNamesCategories_Id_Fk]) VALUES (N'83759d99-eb62-4642-8b8d-3a6167bc48b4', N'Kemik Yaşı Tayini', 250.0100, 8, 270.0100, 0.0000, 3, 143)
INSERT [dbo].[AccountsTariffLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [Cost], [Queue], [AccountsTariffNamesCategories_Id_Fk]) VALUES (N'842fac4c-1535-4b55-ba36-2419a2e770e4', N'Cam İonomer Dolgu', 895.8300, 8, 967.5000, 0.0000, 9, 138)
INSERT [dbo].[AccountsTariffLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [Cost], [Queue], [AccountsTariffNamesCategories_Id_Fk]) VALUES (N'846c45fb-a7f3-455d-ad91-071da059c818', N'Subgingival İlaç Uygulaması', 97.2200, 8, 104.9900, 0.0000, 3, 142)
INSERT [dbo].[AccountsTariffLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [Cost], [Queue], [AccountsTariffNamesCategories_Id_Fk]) VALUES (N'84cbad1f-8b1d-49bd-9481-50247ce8b9b3', N'Ortognatik Cerrahi Ortodontik Tedavisi', 17277.7800, 8, 18660.0000, 0.0000, 59, 143)
INSERT [dbo].[AccountsTariffLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [Cost], [Queue], [AccountsTariffNamesCategories_Id_Fk]) VALUES (N'84ee580b-afe9-4c3b-ac11-680bbb233b12', N'Vestibüloplasti (Yarım Çene)', 5310.1900, 8, 5735.0000, 0.0000, 18, 134)
INSERT [dbo].[AccountsTariffLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [Cost], [Queue], [AccountsTariffNamesCategories_Id_Fk]) VALUES (N'8523b514-4de5-4b63-ad8d-8e3a2ce53675', N'Ağız Dışı Aparey Tatbiki (Headgear - Chincap)', 2625.0000, 8, 2835.0000, 0.0000, 30, 143)
INSERT [dbo].[AccountsTariffLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [Cost], [Queue], [AccountsTariffNamesCategories_Id_Fk]) VALUES (N'8562dfdf-5921-42ae-870e-b87fb529eb22', N'Hassas Tutuculu Protezler (Hassas Tutucu Ücreti Hariç - Tek Çene)', 8842.5900, 8, 9550.0000, 0.0000, 5, 133)
INSERT [dbo].[AccountsTariffLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [Cost], [Queue], [AccountsTariffNamesCategories_Id_Fk]) VALUES (N'8609d6ee-2197-45f9-a53a-e6ec18d79350', N'Direkt Kompozit Laminate Restorasyonu', 2115.7400, 8, 2285.0000, 0.0000, 7, 131)
INSERT [dbo].[AccountsTariffLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [Cost], [Queue], [AccountsTariffNamesCategories_Id_Fk]) VALUES (N'874ca29b-8c9f-4275-9252-e88a8b8e7550', N'Nance Apareyi', 2675.9300, 8, 2890.0000, 0.0000, 43, 136)
INSERT [dbo].[AccountsTariffLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [Cost], [Queue], [AccountsTariffNamesCategories_Id_Fk]) VALUES (N'8754b23e-a510-4e56-8f5e-6a2af3101bc5', N'Veneer Kuron ** (Seramik)', 2666.6700, 8, 2880.0000, 0.0000, 22, 133)
INSERT [dbo].[AccountsTariffLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [Cost], [Queue], [AccountsTariffNamesCategories_Id_Fk]) VALUES (N'875a4983-eb94-434b-8bb0-bb2ef556c3c3', N'Artrosentez (Tek Taraflı)', 1583.3400, 8, 1710.0100, 0.0000, 45, 141)
INSERT [dbo].[AccountsTariffLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [Cost], [Queue], [AccountsTariffNamesCategories_Id_Fk]) VALUES (N'88121a48-3d1f-44d2-b066-3a532e73e0bf', N'Açık Kapanışın Ortodontik Tedavisi', 12023.1500, 8, 12985.0000, 0.0000, 17, 136)
INSERT [dbo].[AccountsTariffLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [Cost], [Queue], [AccountsTariffNamesCategories_Id_Fk]) VALUES (N'89bcfb31-434f-4e55-a87e-80d4622ed4a7', N'Odontogenik Tümör Operasyonu (Küçük)', 3171.3000, 8, 3425.0000, 0.0000, 36, 134)
INSERT [dbo].[AccountsTariffLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [Cost], [Queue], [AccountsTariffNamesCategories_Id_Fk]) VALUES (N'89d2589c-29eb-4483-ad93-6b82dff87e6a', N'Adeziv Köprü (Maryland vb. gibi)', 4194.4500, 8, 4530.0100, 0.0000, 33, 140)
INSERT [dbo].[AccountsTariffLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [Cost], [Queue], [AccountsTariffNamesCategories_Id_Fk]) VALUES (N'8a30e8d1-9eef-41bf-aa4f-da7a5e7b7ae6', N'Düşen Bant Tatbiki (Tek Diş)', 777.7800, 8, 840.0000, 0.0000, 38, 143)
INSERT [dbo].[AccountsTariffLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [Cost], [Queue], [AccountsTariffNamesCategories_Id_Fk]) VALUES (N'8bc40b69-caf3-4954-b1d8-5a17559267c7', N'Postoperatif Dudak Damak Yarığı (Ortodontik Tedavi)', 5381.9400, 8, 5812.5000, 0.0000, 46, 143)
INSERT [dbo].[AccountsTariffLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [Cost], [Queue], [AccountsTariffNamesCategories_Id_Fk]) VALUES (N'8bf03906-cf40-4a6f-9eef-515d47c27dde', N'Roach Köprü', 2555.5500, 8, 2759.9900, 0.0000, 16, 140)
INSERT [dbo].[AccountsTariffLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [Cost], [Queue], [AccountsTariffNamesCategories_Id_Fk]) VALUES (N'8c4eb45e-f91f-435b-b897-ed355c5b9803', N'Segmental Ark veya Tork Arkı Tatbiki', 881.9400, 8, 952.5000, 0.0000, 34, 143)
INSERT [dbo].[AccountsTariffLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [Cost], [Queue], [AccountsTariffNamesCategories_Id_Fk]) VALUES (N'8da3d28d-cf1b-4d68-b012-a334f4e1f4fe', N'Şeffaf Plaklar ile Ortodontik Tedavi (Orta) (Plak Ücreti Hariç)', 16898.1500, 8, 18250.0000, 0.0000, 63, 136)
INSERT [dbo].[AccountsTariffLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [Cost], [Queue], [AccountsTariffNamesCategories_Id_Fk]) VALUES (N'8e542e96-708e-4fcf-90eb-23858a1cee09', N'Travma Splinti', 1703.7000, 8, 1840.0000, 0.0000, 14, 132)
INSERT [dbo].[AccountsTariffLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [Cost], [Queue], [AccountsTariffNamesCategories_Id_Fk]) VALUES (N'8e99e73a-b5c8-4f5c-a5fc-6106ee52809e', N'Endokron', 2120.3700, 8, 2290.0000, 0.0000, 42, 131)
INSERT [dbo].[AccountsTariffLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [Cost], [Queue], [AccountsTariffNamesCategories_Id_Fk]) VALUES (N'908c0fad-6357-4c0c-946b-940585b8ac42', N'Fibrom Operasyonu', 1731.4800, 8, 1870.0000, 0.0000, 24, 134)
INSERT [dbo].[AccountsTariffLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [Cost], [Queue], [AccountsTariffNamesCategories_Id_Fk]) VALUES (N'90e5ab5b-c3a6-4793-a084-63825bbae2d2', N'İnley Dolgu * (İki Yüzlü)', 1625.0000, 8, 1755.0000, 0.0000, 12, 131)
INSERT [dbo].[AccountsTariffLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [Cost], [Queue], [AccountsTariffNamesCategories_Id_Fk]) VALUES (N'922fc9cd-6028-452b-8f14-ae4cd9252ba1', N'Ortodontik Model Analizi', 291.6600, 8, 314.9900, 0.0000, 7, 143)
INSERT [dbo].[AccountsTariffLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [Cost], [Queue], [AccountsTariffNamesCategories_Id_Fk]) VALUES (N'925a9aa2-d6b7-468f-a0fa-5ea0783947c9', N'Hassasiyet Tedavisi (Tek Diş)', 319.4400, 8, 345.0000, 0.0000, 43, 131)
INSERT [dbo].[AccountsTariffLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [Cost], [Queue], [AccountsTariffNamesCategories_Id_Fk]) VALUES (N'925d1a95-1798-4ef1-9de0-0deedbf48f98', N'Lateral Sefalometrik Film Analizi', 300.9300, 8, 325.0000, 0.0000, 1, 136)
INSERT [dbo].[AccountsTariffLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [Cost], [Queue], [AccountsTariffNamesCategories_Id_Fk]) VALUES (N'92cd38cd-9d0a-42e7-a510-0ca6b8327002', N'Çene Kırığı (Komplike - Materyal Ücreti Hariç)', 15273.1500, 8, 16495.0000, 0.0000, 31, 134)
INSERT [dbo].[AccountsTariffLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [Cost], [Queue], [AccountsTariffNamesCategories_Id_Fk]) VALUES (N'92df6b2f-091e-4114-adb3-204445626194', N'T.M.E. Filmi ve Tetkiki', 1166.6700, 8, 1260.0000, 0.0000, 30, 137)
INSERT [dbo].[AccountsTariffLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [Cost], [Queue], [AccountsTariffNamesCategories_Id_Fk]) VALUES (N'9384ab03-00dc-4f6d-8803-3dd476163325', N'Yer Tutucu (Hareketli)', 3284.7200, 8, 3547.4900, 0.0000, 11, 139)
INSERT [dbo].[AccountsTariffLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [Cost], [Queue], [AccountsTariffNamesCategories_Id_Fk]) VALUES (N'938a07ab-c55c-408f-ba6a-40221887af81', N'Antero Posterior Sefalometrik Film Analizi (Frontal Film Analizi)', 451.4000, 8, 487.5100, 0.0000, 2, 143)
INSERT [dbo].[AccountsTariffLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [Cost], [Queue], [AccountsTariffNamesCategories_Id_Fk]) VALUES (N'93b5de8f-d573-45a6-bf68-1cf16c0d000c', N'Proteze Yumuşak Akrilik Uygulaması (Geçici Tek Çene)', 1944.4400, 8, 2100.0000, 0.0000, 10, 133)
INSERT [dbo].[AccountsTariffLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [Cost], [Queue], [AccountsTariffNamesCategories_Id_Fk]) VALUES (N'94188347-af3b-46ed-8a56-af3c66c1f136', N'Dişhekimliğinde Botulinum Toksin Uygulaması', 3180.5600, 8, 3435.0000, 0.0000, 50, 134)
INSERT [dbo].[AccountsTariffLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [Cost], [Queue], [AccountsTariffNamesCategories_Id_Fk]) VALUES (N'9432eedf-a2bf-432c-882e-571e1c7157c3', N'Segmental Osteotomi', 29645.8400, 8, 32017.5000, 0.0000, 48, 141)
INSERT [dbo].[AccountsTariffLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [Cost], [Queue], [AccountsTariffNamesCategories_Id_Fk]) VALUES (N'943b61ae-d38f-428b-8e17-6619c65b9ebc', N'Basit Çene Defektlerinde Protetik Tedavi (**)', 9064.8100, 8, 9790.0000, 0.0000, 42, 133)
INSERT [dbo].[AccountsTariffLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [Cost], [Queue], [AccountsTariffNamesCategories_Id_Fk]) VALUES (N'945d93ae-3309-421a-8cc0-6fe4dfddc3d9', N'Subgingival Küretaj (Tek Diş)', 472.2200, 8, 510.0000, 0.0000, 2, 135)
INSERT [dbo].[AccountsTariffLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [Cost], [Queue], [AccountsTariffNamesCategories_Id_Fk]) VALUES (N'950b52c3-32f1-4629-83a0-4d099df0799b', N'Diş Çekimi', 909.7200, 8, 982.5000, 0.0000, 1, 141)
INSERT [dbo].[AccountsTariffLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [Cost], [Queue], [AccountsTariffNamesCategories_Id_Fk]) VALUES (N'96af25f5-8c97-429c-8253-2885c77cd0ef', N'Sabit Fonksiyonel Aygıt Uygulaması', 4949.0700, 8, 5345.0000, 0.0000, 27, 136)
INSERT [dbo].[AccountsTariffLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [Cost], [Queue], [AccountsTariffNamesCategories_Id_Fk]) VALUES (N'96e92b9c-ddf4-45c4-831a-b59f06f04d5d', N'Kanal İçi Fiber Post Uygulaması (Dolgu Ücreti Hariç)', 2222.2200, 8, 2400.0000, 0.0000, 38, 138)
INSERT [dbo].[AccountsTariffLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [Cost], [Queue], [AccountsTariffNamesCategories_Id_Fk]) VALUES (N'9826670f-ebba-4193-95a5-221979dce479', N'Gömülü Diş Operasyonu (Kemik Retansiyonlu)', 2476.8500, 8, 2675.0000, 0.0000, 4, 134)
INSERT [dbo].[AccountsTariffLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [Cost], [Queue], [AccountsTariffNamesCategories_Id_Fk]) VALUES (N'989bf76e-000c-4f02-8378-04ee115bf638', N'Kısa Süreli Ortodontik Tedavi', 8263.8900, 8, 8925.0000, 0.0000, 19, 143)
INSERT [dbo].[AccountsTariffLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [Cost], [Queue], [AccountsTariffNamesCategories_Id_Fk]) VALUES (N'997dfe6b-d4d2-4f47-b155-be95005528d0', N'Ağız İçi Distalizasyon Apareyi', 5909.7200, 8, 6382.4900, 0.0000, 56, 143)
INSERT [dbo].[AccountsTariffLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [Cost], [Queue], [AccountsTariffNamesCategories_Id_Fk]) VALUES (N'998720d9-0fee-4743-95ef-70b23e3d3589', N'Bant veya Braket Çıkarılması (Tek Diş)', 298.6100, 8, 322.4900, 0.0000, 40, 143)
INSERT [dbo].[AccountsTariffLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [Cost], [Queue], [AccountsTariffNamesCategories_Id_Fk]) VALUES (N'99f81613-535f-4c9f-a18d-9d342ec1b000', N'El Bilek Filmi', 777.7800, 8, 840.0000, 0.0000, 22, 137)
INSERT [dbo].[AccountsTariffLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [Cost], [Queue], [AccountsTariffNamesCategories_Id_Fk]) VALUES (N'9adeed6b-ada7-4567-8a29-11a1b217355d', N'Alveol Plastiği (Yarım Çene)', 2282.4100, 8, 2465.0000, 0.0000, 11, 134)
INSERT [dbo].[AccountsTariffLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [Cost], [Queue], [AccountsTariffNamesCategories_Id_Fk]) VALUES (N'9b24d836-f6d0-410c-b7ad-1441602d5ac0', N'Gömülü Diş Operasyonu', 3166.6700, 8, 3420.0000, 0.0000, 3, 141)
INSERT [dbo].[AccountsTariffLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [Cost], [Queue], [AccountsTariffNamesCategories_Id_Fk]) VALUES (N'9b24dd99-5b26-49f7-b30c-82742186f8d5', N'Ara Dönem Sefalometrik Film Analizi', 245.3700, 8, 265.0000, 0.0000, 8, 136)
INSERT [dbo].[AccountsTariffLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [Cost], [Queue], [AccountsTariffNamesCategories_Id_Fk]) VALUES (N'9b6dfdfa-347d-4a57-8845-daef6be525ba', N'Lateral Sefalometrik Film Analizi', 451.4000, 8, 487.5100, 0.0000, 1, 143)
INSERT [dbo].[AccountsTariffLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [Cost], [Queue], [AccountsTariffNamesCategories_Id_Fk]) VALUES (N'9bade55d-3432-46aa-b81a-8e2f6e4c0b62', N'İmplant Çıkartılması', 3729.1700, 8, 4027.5000, 0.0000, 51, 141)
INSERT [dbo].[AccountsTariffLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [Cost], [Queue], [AccountsTariffNamesCategories_Id_Fk]) VALUES (N'9c03bc9a-02f6-4f8b-a699-7fdb4d0a60a9', N'Çene Kırığı (Basit)', 7826.3900, 8, 8452.5000, 0.0000, 30, 141)
INSERT [dbo].[AccountsTariffLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [Cost], [Queue], [AccountsTariffNamesCategories_Id_Fk]) VALUES (N'9c3c14c7-46a3-4e88-854a-6c6d79d105be', N'Periodontal Şine (Splint - Geçici - Yarım Çene)', 1319.4500, 8, 1425.0000, 0.0000, 13, 142)
INSERT [dbo].[AccountsTariffLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [Cost], [Queue], [AccountsTariffNamesCategories_Id_Fk]) VALUES (N'9c8c7668-3016-497b-8301-679da3b0287a', N'Kapişon İzalesi - İmplant Üstü Açılması', 1037.0400, 8, 1120.0000, 0.0000, 27, 134)
INSERT [dbo].[AccountsTariffLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [Cost], [Queue], [AccountsTariffNamesCategories_Id_Fk]) VALUES (N'9cb24176-c9da-4f9c-bc06-653d4abac966', N'Yüz Protezleri (Yumuşak Akrilik İle)', 28375.0100, 8, 30645.0100, 0.0000, 44, 140)
INSERT [dbo].[AccountsTariffLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [Cost], [Queue], [AccountsTariffNamesCategories_Id_Fk]) VALUES (N'9d22c9da-8a23-4e9b-9d9e-70a3c9816057', N'Tam Protez (Akrilik - Tek Çene)', 9826.4000, 8, 10612.5100, 0.0000, 1, 140)
INSERT [dbo].[AccountsTariffLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [Cost], [Queue], [AccountsTariffNamesCategories_Id_Fk]) VALUES (N'9da36af5-0576-4893-b52b-ff51f47187cf', N'Lingual Ark', 1907.4100, 8, 2060.0000, 0.0000, 42, 136)
INSERT [dbo].[AccountsTariffLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [Cost], [Queue], [AccountsTariffNamesCategories_Id_Fk]) VALUES (N'9dff03a8-7bf9-41b6-aa9f-33f7208d0274', N'Ototransplantasyon', 6013.8900, 8, 6495.0000, 0.0000, 33, 141)
INSERT [dbo].[AccountsTariffLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [Cost], [Queue], [AccountsTariffNamesCategories_Id_Fk]) VALUES (N'a0b71fe4-06fe-4c64-8056-2ed9c2c0b4e1', N'Kanal Tedavisi - İki Kanal (Dolgu Hariç)', 2430.5600, 8, 2625.0000, 0.0000, 28, 138)
INSERT [dbo].[AccountsTariffLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [Cost], [Queue], [AccountsTariffNamesCategories_Id_Fk]) VALUES (N'a0ef979e-665b-47f8-bc12-a598c4c3e1b9', N'Çift Çeneyi İlgilendiren Aparey Yapımı (Frankel Aygıtları - Aktivatör - Bionatör)', 3023.1500, 8, 3265.0000, 0.0000, 25, 136)
INSERT [dbo].[AccountsTariffLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [Cost], [Queue], [AccountsTariffNamesCategories_Id_Fk]) VALUES (N'a1ca8129-6f4b-4ace-b843-8597f3638032', N'Kompozit Dolgu (İki Yüzlü)', 976.8500, 8, 1055.0000, 0.0000, 5, 131)
INSERT [dbo].[AccountsTariffLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [Cost], [Queue], [AccountsTariffNamesCategories_Id_Fk]) VALUES (N'a23007e2-90e0-4d93-ab4c-dcbe37dd29d7', N'Diş Ağartma (Beyazlatma - Tek Çene) (Malzeme Ücreti Hariç)', 4180.5600, 8, 4515.0000, 0.0000, 47, 138)
INSERT [dbo].[AccountsTariffLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [Cost], [Queue], [AccountsTariffNamesCategories_Id_Fk]) VALUES (N'a247ec7c-0020-40e5-8834-e2fb53beba16', N'Diş Üstü Protezi (Overdenture - Tek Çene) (**)', 9791.6700, 8, 10575.0000, 0.0000, 38, 140)
INSERT [dbo].[AccountsTariffLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [Cost], [Queue], [AccountsTariffNamesCategories_Id_Fk]) VALUES (N'a2c5b158-365c-4686-9007-92555cda263b', N'Sürme Rehberliği', 4305.5600, 8, 4650.0000, 0.0000, 55, 136)
INSERT [dbo].[AccountsTariffLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [Cost], [Queue], [AccountsTariffNamesCategories_Id_Fk]) VALUES (N'a2f7ec84-e5c2-484e-89ca-474cfb3e0a21', N'Düz Ark Teli Tatbiki (Tek Çene NİTİ Telleri)', 854.1600, 8, 922.4900, 0.0000, 32, 143)
INSERT [dbo].[AccountsTariffLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [Cost], [Queue], [AccountsTariffNamesCategories_Id_Fk]) VALUES (N'a3587908-b20b-4c9a-9f81-dbf5a54e9c89', N'Bite - Wing Radyografi', 157.4100, 8, 170.0000, 0.0000, 16, 130)
INSERT [dbo].[AccountsTariffLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [Cost], [Queue], [AccountsTariffNamesCategories_Id_Fk]) VALUES (N'a5a57aa4-6c4b-4d76-a423-c3634cdb2db2', N'Dudak Yastıkçığı (Lip Bumper)', 4298.6100, 8, 4642.5000, 0.0000, 23, 143)
INSERT [dbo].[AccountsTariffLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [Cost], [Queue], [AccountsTariffNamesCategories_Id_Fk]) VALUES (N'a5eb77e4-c89d-4610-895f-9af39865b985', N'Direkt Kompozit Laminate Restorasyonu', 3173.6100, 8, 3427.5000, 0.0000, 7, 138)
INSERT [dbo].[AccountsTariffLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [Cost], [Queue], [AccountsTariffNamesCategories_Id_Fk]) VALUES (N'a6203b2b-d4d9-4798-80f6-b602a5cdc998', N'Preoperatif Dudak Damak Yarığı (Ortodontik Tedavi)', 6576.3900, 8, 7102.5000, 0.0000, 45, 143)
INSERT [dbo].[AccountsTariffLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [Cost], [Queue], [AccountsTariffNamesCategories_Id_Fk]) VALUES (N'a63d2888-ca12-481b-8faf-6834852897fe', N'Vestibül Plak (Diş Eti Protezi - Çene Başına)', 3375.0000, 8, 3645.0000, 0.0000, 16, 142)
INSERT [dbo].[AccountsTariffLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [Cost], [Queue], [AccountsTariffNamesCategories_Id_Fk]) VALUES (N'a646aed2-70d2-4c83-bcb8-e4008c343e11', N'Ortodontik Fotoğraf', 250.0100, 8, 270.0100, 0.0000, 4, 143)
INSERT [dbo].[AccountsTariffLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [Cost], [Queue], [AccountsTariffNamesCategories_Id_Fk]) VALUES (N'aaa96131-4a44-4768-8cc8-9c1d570f1785', N'Reserve Curve''li Niti Ark Tatbiki', 884.2600, 8, 955.0000, 0.0000, 58, 136)
INSERT [dbo].[AccountsTariffLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [Cost], [Queue], [AccountsTariffNamesCategories_Id_Fk]) VALUES (N'ab7bccb0-e87e-4787-8203-2d190d1b9702', N'Subepitelyal Bağ Dokusu Grefti', 2354.1600, 8, 2542.4900, 0.0000, 17, 142)
INSERT [dbo].[AccountsTariffLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [Cost], [Queue], [AccountsTariffNamesCategories_Id_Fk]) VALUES (N'abb77f9b-fe7f-4a8d-9647-bdda585bd74b', N'Kompozit İnley Dolgu (Bir Yüzlü)', 1365.7400, 8, 1475.0000, 0.0000, 14, 131)
INSERT [dbo].[AccountsTariffLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [Cost], [Queue], [AccountsTariffNamesCategories_Id_Fk]) VALUES (N'abbc6f9a-e6d6-450c-8620-b735d8291be1', N'Detartraj (Diş Taşı Temizliği - Tek Çene)', 810.1900, 8, 875.0000, 0.0000, 1, 135)
INSERT [dbo].[AccountsTariffLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [Cost], [Queue], [AccountsTariffNamesCategories_Id_Fk]) VALUES (N'abe89a01-d86f-4efc-8872-0154cbe09b79', N'Amputasyon (Dolgu-Kron Üst Yapı-Biyomateryal Hariç)', 879.6300, 8, 950.0000, 0.0000, 6, 132)
INSERT [dbo].[AccountsTariffLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [Cost], [Queue], [AccountsTariffNamesCategories_Id_Fk]) VALUES (N'ad8f0628-53db-46b8-b826-2b74c6c4c336', N'Kompomer Dolgu', 1263.8900, 8, 1365.0000, 0.0000, 4, 139)
INSERT [dbo].[AccountsTariffLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [Cost], [Queue], [AccountsTariffNamesCategories_Id_Fk]) VALUES (N'ad992134-783a-4693-8627-69cd9f6d7786', N'Sinüs Lifting (Biomateryal Ücreti Hariç)', 3106.4800, 8, 3355.0000, 0.0000, 22, 134)
INSERT [dbo].[AccountsTariffLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [Cost], [Queue], [AccountsTariffNamesCategories_Id_Fk]) VALUES (N'ae1b6434-fd61-4e46-9f19-e4fe86dfc310', N'Jaket Kuron (Kompozit)', 1777.7800, 8, 1920.0000, 0.0000, 28, 133)
INSERT [dbo].[AccountsTariffLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [Cost], [Queue], [AccountsTariffNamesCategories_Id_Fk]) VALUES (N'ae349683-6afe-48c6-82d2-c9918f4ad12b', N'Döküm Post Core (Pivo) (Üst Yapı Hariç)', 2729.1600, 8, 2947.4900, 0.0000, 32, 140)
INSERT [dbo].[AccountsTariffLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [Cost], [Queue], [AccountsTariffNamesCategories_Id_Fk]) VALUES (N'ae982242-8423-4c1d-a8c8-e5bd055f9300', N'Kanaldan Kırılmış Materyal Çıkartılması', 2284.7300, 8, 2467.5000, 0.0000, 39, 138)
INSERT [dbo].[AccountsTariffLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [Cost], [Queue], [AccountsTariffNamesCategories_Id_Fk]) VALUES (N'aedd2598-dca5-4831-ba7a-69bebed79df2', N'İmplant Üstü Veneer Kuron (Seramik) (Abutment Ücreti Hariç)', 3245.3700, 8, 3505.0000, 0.0000, 23, 133)
INSERT [dbo].[AccountsTariffLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [Cost], [Queue], [AccountsTariffNamesCategories_Id_Fk]) VALUES (N'af56767c-eccb-471f-9fd2-39206e4b1b4f', N'Pekiştirme Aygıtı (Hawley Aygıtı vb.)', 2500.0100, 8, 2700.0100, 0.0000, 21, 143)
INSERT [dbo].[AccountsTariffLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [Cost], [Queue], [AccountsTariffNamesCategories_Id_Fk]) VALUES (N'b03de053-89d5-4530-8ad4-233cb5503d5a', N'Segmental Osteotomi', 19763.8900, 8, 21345.0000, 0.0000, 48, 134)
INSERT [dbo].[AccountsTariffLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [Cost], [Queue], [AccountsTariffNamesCategories_Id_Fk]) VALUES (N'b071064d-8e70-45f2-b7b1-3929650139dc', N'Hızlı Maksiller Genişletme Apareyi', 3226.8500, 8, 3485.0000, 0.0000, 44, 136)
INSERT [dbo].[AccountsTariffLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [Cost], [Queue], [AccountsTariffNamesCategories_Id_Fk]) VALUES (N'b0f39ea2-099c-43e0-a828-f4495805f811', N'Tamir (Akrilik Protezler, Kırık veya Çatlak)', 1715.2800, 8, 1852.5000, 0.0000, 12, 140)
INSERT [dbo].[AccountsTariffLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [Cost], [Queue], [AccountsTariffNamesCategories_Id_Fk]) VALUES (N'b24aa06c-b886-4d74-94b6-f8e5c4f7d473', N'İnley Dolgu * (Üç Yüzlü)', 2500.0100, 8, 2700.0100, 0.0000, 13, 138)
INSERT [dbo].[AccountsTariffLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [Cost], [Queue], [AccountsTariffNamesCategories_Id_Fk]) VALUES (N'b37ff324-11dc-42da-bc9b-a1a1348b18e0', N'Tek Kökte Kök Ucu Rezeksiyonu (Kanal Tedavisi ve Dolgu Hariç)', 3506.9400, 8, 3787.5000, 0.0000, 5, 141)
INSERT [dbo].[AccountsTariffLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [Cost], [Queue], [AccountsTariffNamesCategories_Id_Fk]) VALUES (N'b3cc217d-0099-4b1a-acaa-19f9634fa0dd', N'Hipnoz (Seans Başına)', 1194.4500, 8, 1290.0100, 0.0000, 6, 137)
INSERT [dbo].[AccountsTariffLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [Cost], [Queue], [AccountsTariffNamesCategories_Id_Fk]) VALUES (N'b45bb104-0590-4483-bab0-847d480f3542', N'Çene Kırığı (Komplike - Materyal Ücreti Hariç)', 22909.7300, 8, 24742.5000, 0.0000, 31, 141)
INSERT [dbo].[AccountsTariffLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [Cost], [Queue], [AccountsTariffNamesCategories_Id_Fk]) VALUES (N'b472d4f5-86d3-499f-b24a-df88efca42fa', N'Süt Dişi Kanal Tedavisi', 1356.4800, 8, 1465.0000, 0.0000, 7, 132)
INSERT [dbo].[AccountsTariffLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [Cost], [Queue], [AccountsTariffNamesCategories_Id_Fk]) VALUES (N'b48cf4d7-b089-45ee-a9c4-8ff07776f75b', N'Yumuşak Doku Greftleme (Greft Ücreti Hariç)', 4347.2300, 8, 4695.0000, 0.0000, 21, 141)
INSERT [dbo].[AccountsTariffLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [Cost], [Queue], [AccountsTariffNamesCategories_Id_Fk]) VALUES (N'b4bd1fe0-857a-4290-aa45-01798634fcd5', N'Sabit Fonksiyonel Aygıt Uygulaması', 7423.6100, 8, 8017.4900, 0.0000, 27, 143)
INSERT [dbo].[AccountsTariffLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [Cost], [Queue], [AccountsTariffNamesCategories_Id_Fk]) VALUES (N'b4e05b92-ad0f-42a6-883c-88cc90ef4710', N'Lingual Braket Tatbiki (Tek Diş)', 550.9300, 8, 595.0000, 0.0000, 37, 136)
INSERT [dbo].[AccountsTariffLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [Cost], [Queue], [AccountsTariffNamesCategories_Id_Fk]) VALUES (N'b5ad1ff5-f872-4555-99f3-90a689364bec', N'T.M.E. İçi Enjeksiyon (Tek Taraflı)', 1083.3300, 8, 1170.0000, 0.0000, 44, 141)
INSERT [dbo].[AccountsTariffLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [Cost], [Queue], [AccountsTariffNamesCategories_Id_Fk]) VALUES (N'b5e51b5f-0ff1-4e5d-82ca-50f56563b99d', N'Tunnel Operasyonu (Tek Diş)', 1083.3300, 8, 1170.0000, 0.0000, 7, 135)
INSERT [dbo].[AccountsTariffLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [Cost], [Queue], [AccountsTariffNamesCategories_Id_Fk]) VALUES (N'b610c44d-c318-4467-9f67-9ba4da09076c', N'Membran Uygulaması (Tek Diş - Flap Op. ve Membran Ücreti Hariç)', 416.6700, 8, 450.0000, 0.0000, 15, 142)
INSERT [dbo].[AccountsTariffLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [Cost], [Queue], [AccountsTariffNamesCategories_Id_Fk]) VALUES (N'b623130d-2bdf-49de-ad52-c783b78abf4b', N'Amalgam Dolgu (Üç Yüzlü)', 1673.6100, 8, 1807.5000, 0.0000, 3, 138)
INSERT [dbo].[AccountsTariffLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [Cost], [Queue], [AccountsTariffNamesCategories_Id_Fk]) VALUES (N'b62ed951-619d-49b8-9661-02173c9ace2b', N'Uzman Dişhekimi Konsültasyonu', 437.5100, 8, 472.5100, 0.0000, 5, 137)
INSERT [dbo].[AccountsTariffLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [Cost], [Queue], [AccountsTariffNamesCategories_Id_Fk]) VALUES (N'b6edee2f-b196-4bc8-a875-80a9e6bf09d7', N'Kuronlarda Freze Tekniği Farkı', 569.4500, 8, 615.0000, 0.0000, 31, 140)
INSERT [dbo].[AccountsTariffLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [Cost], [Queue], [AccountsTariffNamesCategories_Id_Fk]) VALUES (N'b7fb1195-452c-4e35-9af5-bea53bb7894e', N'Kanama Müdahalesi (Basit)', 643.5200, 8, 695.0000, 0.0000, 9, 134)
INSERT [dbo].[AccountsTariffLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [Cost], [Queue], [AccountsTariffNamesCategories_Id_Fk]) VALUES (N'b87f78e3-e85a-4543-abb0-6d5413f1e1d8', N'Vida Uygulaması (Tek Vida)', 444.4400, 8, 480.0000, 0.0000, 26, 136)
INSERT [dbo].[AccountsTariffLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [Cost], [Queue], [AccountsTariffNamesCategories_Id_Fk]) VALUES (N'b882c954-5637-442b-8931-ceacd4e84691', N'Periapikal Lezyonlu Dişte Kanal Tedavisi - Üç Kanal (Dolgu Hariç)', 3437.5100, 8, 3712.5100, 0.0000, 33, 138)
GO
INSERT [dbo].[AccountsTariffLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [Cost], [Queue], [AccountsTariffNamesCategories_Id_Fk]) VALUES (N'b894d0ce-c09e-4424-91ec-3beba9201602', N'Jaket Kuron (Kompozit)', 2666.6700, 8, 2880.0000, 0.0000, 28, 140)
INSERT [dbo].[AccountsTariffLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [Cost], [Queue], [AccountsTariffNamesCategories_Id_Fk]) VALUES (N'b89756e9-19af-4cb4-a078-ccf253084f24', N'Diş Röntgen Filmi (Periapikal)', 157.4100, 8, 170.0000, 0.0000, 14, 130)
INSERT [dbo].[AccountsTariffLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [Cost], [Queue], [AccountsTariffNamesCategories_Id_Fk]) VALUES (N'b8a03964-f2d5-4925-a88f-3edd15c0650c', N'Tomografi (Tek Çene)', 2076.3900, 8, 2242.5000, 0.0000, 25, 137)
INSERT [dbo].[AccountsTariffLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [Cost], [Queue], [AccountsTariffNamesCategories_Id_Fk]) VALUES (N'b923d973-5f4c-40d1-8f15-10aa36297e00', N'Sinüs Lifting (Biomateryal Ücreti Hariç)', 4659.7200, 8, 5032.5000, 0.0000, 22, 141)
INSERT [dbo].[AccountsTariffLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [Cost], [Queue], [AccountsTariffNamesCategories_Id_Fk]) VALUES (N'b96b3654-9e9a-46e4-8a3d-dc081f61a7e9', N'Gingivektomi (Tek Diş)', 1305.5600, 8, 1410.0000, 0.0000, 5, 142)
INSERT [dbo].[AccountsTariffLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [Cost], [Queue], [AccountsTariffNamesCategories_Id_Fk]) VALUES (N'b9b1c7b1-bdbc-4c50-9844-f3880daf250c', N'Kist Operasyonu (1 Cm Büyük)', 4909.7300, 8, 5302.5000, 0.0000, 14, 141)
INSERT [dbo].[AccountsTariffLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [Cost], [Queue], [AccountsTariffNamesCategories_Id_Fk]) VALUES (N'b9b8e8ff-1679-457e-893d-9bdcbc29bb3d', N'Kanal Tedavisi - Üç Kanal (Dolgu Hariç)', 2212.9600, 8, 2390.0000, 0.0000, 29, 131)
INSERT [dbo].[AccountsTariffLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [Cost], [Queue], [AccountsTariffNamesCategories_Id_Fk]) VALUES (N'b9c2a8b4-8cec-4258-9c7c-5c75977907ee', N'Angle Sınıf II Anomalilerinin Ortodontik Tedavisi', 9546.3000, 8, 10310.0000, 0.0000, 11, 136)
INSERT [dbo].[AccountsTariffLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [Cost], [Queue], [AccountsTariffNamesCategories_Id_Fk]) VALUES (N'b9ebb27e-85d4-4857-858d-5cb884404610', N'Konsültasyon', 268.5200, 8, 290.0000, 0.0000, 4, 130)
INSERT [dbo].[AccountsTariffLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [Cost], [Queue], [AccountsTariffNamesCategories_Id_Fk]) VALUES (N'ba157f2f-2928-4495-a69d-8c6ce7208314', N'Ankraj Amaçlı Plak Yerleştirme (Malzeme Ücreti Hariç)', 4069.4400, 8, 4395.0000, 0.0000, 52, 141)
INSERT [dbo].[AccountsTariffLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [Cost], [Queue], [AccountsTariffNamesCategories_Id_Fk]) VALUES (N'ba7024f0-0ed7-49f1-9b4b-5f6c1dcfd6b6', N'Periapikal Lezyonlu Dişte Kanal Tedavisi - Tek Kanal (Dolgu Hariç)', 1687.5000, 8, 1822.5000, 0.0000, 31, 138)
INSERT [dbo].[AccountsTariffLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [Cost], [Queue], [AccountsTariffNamesCategories_Id_Fk]) VALUES (N'ba9e79a4-ebb0-47f1-9c26-1d86da6ec714', N'Membran Uygulaması (Tek Diş - Flap Op. ve Membran Ücreti Hariç)', 277.7800, 8, 300.0000, 0.0000, 15, 135)
INSERT [dbo].[AccountsTariffLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [Cost], [Queue], [AccountsTariffNamesCategories_Id_Fk]) VALUES (N'bbcb8296-39c1-44c7-97a0-51e8966b366a', N'Vestibüloplasti (Yarım Çene)', 7965.2900, 8, 8602.5100, 0.0000, 18, 141)
INSERT [dbo].[AccountsTariffLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [Cost], [Queue], [AccountsTariffNamesCategories_Id_Fk]) VALUES (N'bccec770-754a-4900-8ded-b087d0535c1b', N'Oral Hijyen Eğitimi', 240.7400, 8, 260.0000, 0.0000, 9, 130)
INSERT [dbo].[AccountsTariffLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [Cost], [Queue], [AccountsTariffNamesCategories_Id_Fk]) VALUES (N'bd0ad4bc-17cf-4496-8b95-31738816f4a2', N'Torus Operasyonu (Yarım Çene)', 3645.8400, 8, 3937.5100, 0.0000, 35, 141)
INSERT [dbo].[AccountsTariffLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [Cost], [Queue], [AccountsTariffNamesCategories_Id_Fk]) VALUES (N'bd4811fb-0e36-4e0f-aac6-da551392d4f3', N'Sert Doku Greftleme (Greft Ücreti Hariç)', 3347.2200, 8, 3615.0000, 0.0000, 20, 134)
INSERT [dbo].[AccountsTariffLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [Cost], [Queue], [AccountsTariffNamesCategories_Id_Fk]) VALUES (N'be1f6954-2aa8-4cdd-9a29-69d93dc3a41f', N'İnley Dolgu * (Bir Yüzlü)', 2388.8900, 8, 2580.0000, 0.0000, 11, 138)
INSERT [dbo].[AccountsTariffLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [Cost], [Queue], [AccountsTariffNamesCategories_Id_Fk]) VALUES (N'be8ece40-717c-4d10-b326-1033898652e0', N'İnley Dolgu * (Bir Yüzlü)', 1592.5900, 8, 1720.0000, 0.0000, 11, 131)
INSERT [dbo].[AccountsTariffLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [Cost], [Queue], [AccountsTariffNamesCategories_Id_Fk]) VALUES (N'bed64c56-0bea-4367-af0f-4bcc9562e503', N'Ankraj Amaçlı Plak Yerleştirme (Malzeme Ücreti Hariç)', 2712.9600, 8, 2930.0000, 0.0000, 52, 134)
INSERT [dbo].[AccountsTariffLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [Cost], [Queue], [AccountsTariffNamesCategories_Id_Fk]) VALUES (N'bfa6b666-ed48-4173-aeb6-33030022edd0', N'Teleskop Kuron* (Koping)', 4000.0100, 8, 4320.0100, 0.0000, 30, 140)
INSERT [dbo].[AccountsTariffLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [Cost], [Queue], [AccountsTariffNamesCategories_Id_Fk]) VALUES (N'bfe38cbe-8ad0-43f8-a30d-227cfcee6feb', N'Göz Protezi (Oküler)', 29305.5600, 8, 31650.0000, 0.0000, 45, 140)
INSERT [dbo].[AccountsTariffLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [Cost], [Queue], [AccountsTariffNamesCategories_Id_Fk]) VALUES (N'c0d85075-1610-477e-ae3e-6af8fd6d75f2', N'Nance Apareyi', 4013.9000, 8, 4335.0100, 0.0000, 43, 143)
INSERT [dbo].[AccountsTariffLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [Cost], [Queue], [AccountsTariffNamesCategories_Id_Fk]) VALUES (N'c0dd42e8-9f1e-4fa7-a5b9-3d3fffc8da48', N'Siyalografi', 546.3000, 8, 590.0000, 0.0000, 23, 130)
INSERT [dbo].[AccountsTariffLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [Cost], [Queue], [AccountsTariffNamesCategories_Id_Fk]) VALUES (N'c17c4b30-dca1-4358-aa34-642d8df611b9', N'Peri-İmplantitis (Cerrahi Olmayan) (Tek İmp.)', 1055.5500, 8, 1139.9900, 0.0000, 20, 142)
INSERT [dbo].[AccountsTariffLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [Cost], [Queue], [AccountsTariffNamesCategories_Id_Fk]) VALUES (N'c1e4c5e8-8bdf-446a-869c-1e2caf9f5ac1', N'Ortodontik Fotoğraf Tetkiki', 134.2600, 8, 145.0000, 0.0000, 5, 136)
INSERT [dbo].[AccountsTariffLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [Cost], [Queue], [AccountsTariffNamesCategories_Id_Fk]) VALUES (N'c21febf0-e719-4fae-8782-03a2573ebf6f', N'Ortodontik Model Analizi', 194.4400, 8, 210.0000, 0.0000, 7, 136)
INSERT [dbo].[AccountsTariffLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [Cost], [Queue], [AccountsTariffNamesCategories_Id_Fk]) VALUES (N'c25268ed-b183-42f8-a938-224f214cb907', N'İnley Dolgu * (İki Yüzlü)', 2437.5000, 8, 2632.5000, 0.0000, 12, 138)
INSERT [dbo].[AccountsTariffLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [Cost], [Queue], [AccountsTariffNamesCategories_Id_Fk]) VALUES (N'c2a9aab9-00e5-4a16-b922-931e50b68d67', N'Model Cerrahisi', 1430.5500, 8, 1544.9900, 0.0000, 52, 143)
INSERT [dbo].[AccountsTariffLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [Cost], [Queue], [AccountsTariffNamesCategories_Id_Fk]) VALUES (N'c2b0136c-c731-4554-b613-b86aa3ede5d1', N'T.M.E. Stabilizasyon Splinti', 5222.2200, 8, 5640.0000, 0.0000, 48, 140)
INSERT [dbo].[AccountsTariffLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [Cost], [Queue], [AccountsTariffNamesCategories_Id_Fk]) VALUES (N'c2d11c5b-4921-46e0-9df9-c025e8d9b9b6', N'Ortodontik Model Yapımı', 300.9300, 8, 325.0000, 0.0000, 6, 136)
INSERT [dbo].[AccountsTariffLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [Cost], [Queue], [AccountsTariffNamesCategories_Id_Fk]) VALUES (N'c2d39cb2-0e84-4313-8149-ce3f7d429521', N'Diş Röntgen Filmi (Periapikal)', 236.1200, 8, 255.0000, 0.0000, 14, 137)
INSERT [dbo].[AccountsTariffLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [Cost], [Queue], [AccountsTariffNamesCategories_Id_Fk]) VALUES (N'c2e3a7ac-1109-4a72-816f-3ee0a024c84d', N'Kompozit Dolgu (Bir Yüzlü)', 1173.6200, 8, 1267.5000, 0.0000, 4, 138)
INSERT [dbo].[AccountsTariffLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [Cost], [Queue], [AccountsTariffNamesCategories_Id_Fk]) VALUES (N'c31c0840-ddcb-4c9d-af01-809e32f2bbe2', N'Ara Dönem Model Yapımı', 458.3400, 8, 495.0100, 0.0000, 9, 143)
INSERT [dbo].[AccountsTariffLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [Cost], [Queue], [AccountsTariffNamesCategories_Id_Fk]) VALUES (N'c36ee2ad-ebdd-4436-882d-d8ad776800d8', N'İntra Oral Dijital Radyografi', 231.4800, 8, 250.0000, 0.0000, 21, 130)
INSERT [dbo].[AccountsTariffLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [Cost], [Queue], [AccountsTariffNamesCategories_Id_Fk]) VALUES (N'c5a66134-a2b1-4c1c-8dc5-95c3171c3a78', N'Fibrom Operasyonu', 2597.2200, 8, 2805.0000, 0.0000, 24, 141)
INSERT [dbo].[AccountsTariffLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [Cost], [Queue], [AccountsTariffNamesCategories_Id_Fk]) VALUES (N'c62fe6c4-ab79-47e8-8953-fb4663dd3c6c', N'Lingual Ark', 2861.1200, 8, 3090.0000, 0.0000, 42, 143)
INSERT [dbo].[AccountsTariffLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [Cost], [Queue], [AccountsTariffNamesCategories_Id_Fk]) VALUES (N'c68dec1c-66b7-466f-b40e-a8d48d1a9e78', N'Prefabrike Kron *', 930.5600, 8, 1005.0000, 0.0000, 12, 132)
INSERT [dbo].[AccountsTariffLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [Cost], [Queue], [AccountsTariffNamesCategories_Id_Fk]) VALUES (N'c693dd2c-ec68-47e6-8c61-c6d76c4d8034', N'Kuron Sökümü (Tek Sabit Üye İçin)', 673.6100, 8, 727.4900, 0.0000, 35, 140)
INSERT [dbo].[AccountsTariffLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [Cost], [Queue], [AccountsTariffNamesCategories_Id_Fk]) VALUES (N'c6ce04b2-c568-42a6-94d7-765a857e32e4', N'Dolgu Sökümü (Tek Diş)', 319.4400, 8, 345.0000, 0.0000, 24, 138)
INSERT [dbo].[AccountsTariffLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [Cost], [Queue], [AccountsTariffNamesCategories_Id_Fk]) VALUES (N'c775b7b7-f03c-42ad-aa30-390704360933', N'Kompozit İnley Dolgu (Üç Yüzlü)', 2493.0600, 8, 2692.5000, 0.0000, 16, 138)
INSERT [dbo].[AccountsTariffLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [Cost], [Queue], [AccountsTariffNamesCategories_Id_Fk]) VALUES (N'c7be3bad-71c7-457d-a1b8-3b46cee99868', N'Akupunktur Uygulama (Seans Başına)', 740.7400, 8, 800.0000, 0.0000, 7, 130)
INSERT [dbo].[AccountsTariffLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [Cost], [Queue], [AccountsTariffNamesCategories_Id_Fk]) VALUES (N'c9b8daf5-c699-4004-bced-a6f1172b6786', N'Ağız Dışı Aparey Tatbiki (Headgear - Chincap)', 1750.0000, 8, 1890.0000, 0.0000, 30, 136)
INSERT [dbo].[AccountsTariffLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [Cost], [Queue], [AccountsTariffNamesCategories_Id_Fk]) VALUES (N'c9c4d89d-d082-4525-8907-5575d51868ba', N'Veneer Kuron ** (Seramik)', 4000.0100, 8, 4320.0100, 0.0000, 22, 140)
INSERT [dbo].[AccountsTariffLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [Cost], [Queue], [AccountsTariffNamesCategories_Id_Fk]) VALUES (N'ca414e9e-40eb-4c5f-80f4-9116b8f17521', N'Kaide Yenileme (Rebazaj - Tek Çene)', 2842.5900, 8, 3070.0000, 0.0000, 9, 133)
INSERT [dbo].[AccountsTariffLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [Cost], [Queue], [AccountsTariffNamesCategories_Id_Fk]) VALUES (N'ca4bcbf3-b804-4dd3-9de4-488b68dcb5cd', N'Aşındırma ile Sürme Rehberliği (Seans Başına)', 506.9400, 8, 547.5000, 0.0000, 1, 139)
INSERT [dbo].[AccountsTariffLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [Cost], [Queue], [AccountsTariffNamesCategories_Id_Fk]) VALUES (N'ca7f73e0-6d76-47f3-bac1-f0cf0c6ba707', N'Panoramik Film', 518.5200, 8, 560.0000, 0.0000, 18, 130)
INSERT [dbo].[AccountsTariffLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [Cost], [Queue], [AccountsTariffNamesCategories_Id_Fk]) VALUES (N'cae6fbb9-d8ef-4732-b509-74169b9f966f', N'Frenektomi - Frenetomi', 2472.2300, 8, 2670.0000, 0.0000, 18, 142)
INSERT [dbo].[AccountsTariffLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [Cost], [Queue], [AccountsTariffNamesCategories_Id_Fk]) VALUES (N'cafdcde9-bb52-429d-86e3-d73de638920d', N'Roach Köprü', 1703.7000, 8, 1840.0000, 0.0000, 16, 133)
INSERT [dbo].[AccountsTariffLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [Cost], [Queue], [AccountsTariffNamesCategories_Id_Fk]) VALUES (N'cbfde09c-71d3-43ee-bc17-7e11220714bc', N'Papil Oluşturma (Cerrahi) (Tek Papil)', 842.5900, 8, 910.0000, 0.0000, 21, 135)
INSERT [dbo].[AccountsTariffLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [Cost], [Queue], [AccountsTariffNamesCategories_Id_Fk]) VALUES (N'ceb767ba-ff87-485c-bddc-5831c8939af5', N'Oklüzyon Düzeltilmesi', 4048.6100, 8, 4372.4900, 0.0000, 47, 140)
INSERT [dbo].[AccountsTariffLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [Cost], [Queue], [AccountsTariffNamesCategories_Id_Fk]) VALUES (N'ced1d65d-c594-479f-a90a-a0f71782c9ca', N'Biyomateryal Uygulaması (Tek Diş - Flap Op. ve Biomateryal Ücreti Hariç)', 277.7800, 8, 300.0000, 0.0000, 14, 135)
INSERT [dbo].[AccountsTariffLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [Cost], [Queue], [AccountsTariffNamesCategories_Id_Fk]) VALUES (N'cee3a382-2dfa-4d9e-bc0f-9d419a53dc73', N'Şeffaf Plaklar ile Ortodontik Tedavi (Ağır) (Plak Ücreti Hariç)', 38027.7800, 8, 41070.0000, 0.0000, 64, 143)
INSERT [dbo].[AccountsTariffLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [Cost], [Queue], [AccountsTariffNamesCategories_Id_Fk]) VALUES (N'cf327d77-073e-4097-b54d-d247cee36b5c', N'Black V Kole Dolgusu (Cam İonomer)', 694.4400, 8, 750.0000, 0.0000, 10, 138)
INSERT [dbo].[AccountsTariffLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [Cost], [Queue], [AccountsTariffNamesCategories_Id_Fk]) VALUES (N'cfde79a8-061f-4e5b-ac10-426f36fe0f79', N'Alveol Plastiği (Yarım Çene)', 3423.6200, 8, 3697.5000, 0.0000, 11, 141)
INSERT [dbo].[AccountsTariffLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [Cost], [Queue], [AccountsTariffNamesCategories_Id_Fk]) VALUES (N'd149a568-d092-4fd0-8233-fbd6193984cb', N'Detartraj (Diş Taşı Temizliği - Tek Çene)', 1215.2900, 8, 1312.5100, 0.0000, 1, 142)
INSERT [dbo].[AccountsTariffLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [Cost], [Queue], [AccountsTariffNamesCategories_Id_Fk]) VALUES (N'd1de3594-198a-4dd1-87a0-5e02da3a217a', N'Laminate Veneer (Seramik)', 10680.5600, 8, 11535.0000, 0.0000, 26, 140)
INSERT [dbo].[AccountsTariffLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [Cost], [Queue], [AccountsTariffNamesCategories_Id_Fk]) VALUES (N'd1f52a53-43ee-44f2-8290-e0f92115b5bd', N'Lokal Anestezi (Rejyonal)', 104.1600, 8, 112.4900, 0.0000, 32, 137)
INSERT [dbo].[AccountsTariffLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [Cost], [Queue], [AccountsTariffNamesCategories_Id_Fk]) VALUES (N'd22042de-4868-4d11-952e-6a373d6dd56b', N'Fissür Örtülmesi (Sealant - Tek Diş)', 506.9400, 8, 547.5000, 0.0000, 2, 139)
INSERT [dbo].[AccountsTariffLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [Cost], [Queue], [AccountsTariffNamesCategories_Id_Fk]) VALUES (N'd246deb6-d98f-445d-84c5-1c99f6b5c7fd', N'Düşen Braket Tatbiki (Tek Diş)', 736.1100, 8, 795.0000, 0.0000, 39, 143)
INSERT [dbo].[AccountsTariffLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [Cost], [Queue], [AccountsTariffNamesCategories_Id_Fk]) VALUES (N'd27510c1-0c5f-4e68-95c0-80867488678b', N'Periapikal Lezyonlu Dişte Kanal Tedavisi - İki Kanal (Dolgu Hariç)', 2493.0600, 8, 2692.5000, 0.0000, 32, 138)
INSERT [dbo].[AccountsTariffLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [Cost], [Queue], [AccountsTariffNamesCategories_Id_Fk]) VALUES (N'd2ae9ba8-f723-4e31-a903-e04deb3a4ab2', N'Çocuk Protezi (Akrilik - Tam - Tek Çene)', 7027.7900, 8, 7590.0100, 0.0000, 17, 139)
INSERT [dbo].[AccountsTariffLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [Cost], [Queue], [AccountsTariffNamesCategories_Id_Fk]) VALUES (N'd358a965-feb4-4058-8926-6c6377990e7f', N'Periodontal Splint (Daimi)', 2231.4800, 8, 2410.0000, 0.0000, 11, 135)
INSERT [dbo].[AccountsTariffLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [Cost], [Queue], [AccountsTariffNamesCategories_Id_Fk]) VALUES (N'd44f9f14-076c-42ed-a87c-e08c52072b52', N'Peri-İmplantitis (Cerrahi) (Biomaterial ve Membran Ücreti Hariç) (Tek İmp.)', 2555.5500, 8, 2759.9900, 0.0000, 19, 142)
INSERT [dbo].[AccountsTariffLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [Cost], [Queue], [AccountsTariffNamesCategories_Id_Fk]) VALUES (N'd459b97a-eeec-46a1-9b41-b95cb88eb2d9', N'Positioner Yapımı', 5784.7200, 8, 6247.5000, 0.0000, 49, 143)
INSERT [dbo].[AccountsTariffLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [Cost], [Queue], [AccountsTariffNamesCategories_Id_Fk]) VALUES (N'd4c9d4e5-24b2-45c1-9ad6-e8e8fff085e3', N'Dişhekimliğinde Botulinum Toksin Uygulaması', 4770.8400, 8, 5152.5100, 0.0000, 50, 141)
INSERT [dbo].[AccountsTariffLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [Cost], [Queue], [AccountsTariffNamesCategories_Id_Fk]) VALUES (N'd50435ca-0414-4d07-bd7a-ec9ed1801cf4', N'Göz Protezi (Oküler)', 19537.0400, 8, 21100.0000, 0.0000, 45, 133)
INSERT [dbo].[AccountsTariffLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [Cost], [Queue], [AccountsTariffNamesCategories_Id_Fk]) VALUES (N'd54f3ecb-cdc8-459d-a297-615d6e6e1e92', N'Kompozit Dolgu (Üç Yüzlü)', 1212.9600, 8, 1310.0000, 0.0000, 6, 131)
INSERT [dbo].[AccountsTariffLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [Cost], [Queue], [AccountsTariffNamesCategories_Id_Fk]) VALUES (N'd6bfec07-0f3e-4f32-aa99-3c3b898144bf', N'Ortodontik Fotoğraf', 166.6700, 8, 180.0000, 0.0000, 4, 136)
INSERT [dbo].[AccountsTariffLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [Cost], [Queue], [AccountsTariffNamesCategories_Id_Fk]) VALUES (N'd80e2806-ab65-43bd-bec9-78f6bf7c612d', N'Apse Drenajı ve Tedavisi (İntraoral)', 1509.2600, 8, 1630.0000, 0.0000, 26, 134)
INSERT [dbo].[AccountsTariffLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [Cost], [Queue], [AccountsTariffNamesCategories_Id_Fk]) VALUES (N'd8ae1523-3fb7-46a2-a955-4b5ac2d43813', N'Raporlama', 143.5200, 8, 155.0000, 0.0000, 33, 130)
INSERT [dbo].[AccountsTariffLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [Cost], [Queue], [AccountsTariffNamesCategories_Id_Fk]) VALUES (N'd9434dea-4dc0-40c6-b813-3509087adc51', N'Lingual Teknikle Angle Sınıf III Anomalilerinin Ortodontik Tedavisi', 20520.8400, 8, 22162.5100, 0.0000, 16, 143)
INSERT [dbo].[AccountsTariffLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [Cost], [Queue], [AccountsTariffNamesCategories_Id_Fk]) VALUES (N'd9813ecf-f538-46e4-aefc-356c3afc22f0', N'Tam Protez (Akrilik - Tek Çene)', 6550.9300, 8, 7075.0000, 0.0000, 1, 133)
INSERT [dbo].[AccountsTariffLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [Cost], [Queue], [AccountsTariffNamesCategories_Id_Fk]) VALUES (N'd99cda0b-d639-4aef-a068-66a4dab01104', N'Bant veya Braket Çıkarılması (Tek Diş)', 199.0700, 8, 215.0000, 0.0000, 40, 136)
INSERT [dbo].[AccountsTariffLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [Cost], [Queue], [AccountsTariffNamesCategories_Id_Fk]) VALUES (N'd9bc7361-021f-47c3-a71f-4ffdc489bcc5', N'Çene Lüksasyonu', 652.7800, 8, 705.0000, 0.0000, 17, 134)
INSERT [dbo].[AccountsTariffLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [Cost], [Queue], [AccountsTariffNamesCategories_Id_Fk]) VALUES (N'da6b9b06-97c2-45d0-90b8-41ab09a975ff', N'Düşmüş Kuron ve Köprü Simantasyonu (Her Sabit Üye İçin)', 444.4500, 8, 480.0100, 0.0000, 36, 140)
INSERT [dbo].[AccountsTariffLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [Cost], [Queue], [AccountsTariffNamesCategories_Id_Fk]) VALUES (N'db0caa05-2727-41c7-aa67-389b715d9800', N'Besleme (Tek Çene)', 2365.7400, 8, 2555.0000, 0.0000, 8, 133)
INSERT [dbo].[AccountsTariffLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [Cost], [Queue], [AccountsTariffNamesCategories_Id_Fk]) VALUES (N'db1547e0-fe0e-4e7b-bc9b-e8071c00ac1b', N'Bite - Wing Radyografi', 236.1200, 8, 255.0000, 0.0000, 16, 137)
INSERT [dbo].[AccountsTariffLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [Cost], [Queue], [AccountsTariffNamesCategories_Id_Fk]) VALUES (N'db85585a-f775-4a78-ad7b-837ccf9b85c9', N'Komplikasyonlu Diş Çekimi', 1166.6700, 8, 1260.0000, 0.0000, 2, 134)
INSERT [dbo].[AccountsTariffLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [Cost], [Queue], [AccountsTariffNamesCategories_Id_Fk]) VALUES (N'db8acbaa-7779-4529-88ce-b700f9152c6b', N'Tamir (Akrilik Protezler, Kırık veya Çatlak)', 1143.5200, 8, 1235.0000, 0.0000, 12, 133)
INSERT [dbo].[AccountsTariffLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [Cost], [Queue], [AccountsTariffNamesCategories_Id_Fk]) VALUES (N'dbb20c47-3d00-4f09-a6da-3b0f26d09030', N'Kayıp Apareyin Yeniden Yapımı (Tek Çene)', 2347.2200, 8, 2534.9900, 0.0000, 28, 143)
INSERT [dbo].[AccountsTariffLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [Cost], [Queue], [AccountsTariffNamesCategories_Id_Fk]) VALUES (N'dc87644b-fdc7-4e70-ab98-27ee6758446f', N'Ara Dönem Model Yapımı', 305.5600, 8, 330.0000, 0.0000, 9, 136)
INSERT [dbo].[AccountsTariffLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [Cost], [Queue], [AccountsTariffNamesCategories_Id_Fk]) VALUES (N'dca88d86-9cac-4e27-b1fe-01a0f88920ff', N'Kanal İçi Fiber Post Uygulaması (Dolgu Ücreti Hariç)', 1481.4800, 8, 1600.0000, 0.0000, 38, 131)
INSERT [dbo].[AccountsTariffLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [Cost], [Queue], [AccountsTariffNamesCategories_Id_Fk]) VALUES (N'dcb2e4e9-0343-4010-9f9e-69da852e3463', N'Geçici Obturatörler (**)', 7229.1600, 8, 7807.4900, 0.0000, 41, 140)
INSERT [dbo].[AccountsTariffLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [Cost], [Queue], [AccountsTariffNamesCategories_Id_Fk]) VALUES (N'dcccaf32-5d67-4945-bfb5-7e66bb64dd62', N'Fissür Örtülmesi (Sealant - Tek Diş)', 337.9600, 8, 365.0000, 0.0000, 2, 132)
INSERT [dbo].[AccountsTariffLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [Cost], [Queue], [AccountsTariffNamesCategories_Id_Fk]) VALUES (N'dccf936f-b566-4882-920a-186f63637e56', N'Lingual Teknikle Angle Sınıf II Anomalilerinin Ortodontik Tedavisi', 11194.4400, 8, 12090.0000, 0.0000, 15, 136)
INSERT [dbo].[AccountsTariffLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [Cost], [Queue], [AccountsTariffNamesCategories_Id_Fk]) VALUES (N'dcd9b06c-0080-4e35-9be8-29d385f73c6c', N'Tam Seramik Kuron (Metal Desteksiz)', 5935.1900, 8, 6410.0000, 0.0000, 29, 133)
INSERT [dbo].[AccountsTariffLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [Cost], [Queue], [AccountsTariffNamesCategories_Id_Fk]) VALUES (N'dcf27d34-3659-4a2b-b33c-bb0885f1676d', N'Geçici Kuron (Tek Diş İçin)', 532.4100, 8, 575.0000, 0.0000, 34, 133)
INSERT [dbo].[AccountsTariffLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [Cost], [Queue], [AccountsTariffNamesCategories_Id_Fk]) VALUES (N'ddacaf18-829d-4379-a3e7-e51b204fa0ee', N'Kapişon İzalesi - İmplant Üstü Açılması', 1555.5600, 8, 1680.0000, 0.0000, 27, 141)
INSERT [dbo].[AccountsTariffLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [Cost], [Queue], [AccountsTariffNamesCategories_Id_Fk]) VALUES (N'def407ec-22f7-4563-b9e5-655c0542f260', N'Black V Kole Dolgusu (Cam İonomer)', 462.9600, 8, 500.0000, 0.0000, 10, 131)
INSERT [dbo].[AccountsTariffLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [Cost], [Queue], [AccountsTariffNamesCategories_Id_Fk]) VALUES (N'e04615fa-e157-4224-93ed-afb0d8e40eb6', N'Bölümlü Protez (Akrilik - Tek Çene)', 6356.4800, 8, 6865.0000, 0.0000, 2, 133)
INSERT [dbo].[AccountsTariffLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [Cost], [Queue], [AccountsTariffNamesCategories_Id_Fk]) VALUES (N'e072fa58-fab4-4621-b3cf-803ed6809c48', N'Kayıp Apareyin Yeniden Yapımı (Tek Çene)', 1564.8100, 8, 1690.0000, 0.0000, 28, 136)
INSERT [dbo].[AccountsTariffLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [Cost], [Queue], [AccountsTariffNamesCategories_Id_Fk]) VALUES (N'e0e9d1f9-51cd-4f95-a9e8-a093e6701fb7', N'Diş Ağartma (Beyazlatma - Tek Çene) (Malzeme Ücreti Hariç)', 2787.0400, 8, 3010.0000, 0.0000, 47, 131)
INSERT [dbo].[AccountsTariffLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [Cost], [Queue], [AccountsTariffNamesCategories_Id_Fk]) VALUES (N'e157d52e-243a-4028-8de2-3fc571a0d86d', N'Çocuk Protezi', 1870.3700, 8, 2020.0000, 0.0000, 15, 132)
INSERT [dbo].[AccountsTariffLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [Cost], [Queue], [AccountsTariffNamesCategories_Id_Fk]) VALUES (N'e1d424bd-a70d-45a8-a61c-2120b483398a', N'Yer Tutucu (Hareketli)', 2189.8100, 8, 2365.0000, 0.0000, 11, 132)
INSERT [dbo].[AccountsTariffLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [Cost], [Queue], [AccountsTariffNamesCategories_Id_Fk]) VALUES (N'e1f4728c-d8a2-4da7-adf8-f062ac360f82', N'Çift Çeneyi İlgilendiren Aparey Yapımı (Frankel Aygıtları - Aktivatör - Bionatör)', 4534.7300, 8, 4897.5000, 0.0000, 25, 143)
INSERT [dbo].[AccountsTariffLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [Cost], [Queue], [AccountsTariffNamesCategories_Id_Fk]) VALUES (N'e2920e72-9523-4a55-bcdb-39c2faa59995', N'İnley Dolgu * (Üç Yüzlü)', 1666.6700, 8, 1800.0000, 0.0000, 13, 131)
INSERT [dbo].[AccountsTariffLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [Cost], [Queue], [AccountsTariffNamesCategories_Id_Fk]) VALUES (N'e2d6c0c8-89d2-4922-a737-1df7d52ed8e0', N'Tek Çeneyi İlgilendiren Aparey Yapımı (Vida Hariç)', 2715.2900, 8, 2932.5100, 0.0000, 24, 143)
INSERT [dbo].[AccountsTariffLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [Cost], [Queue], [AccountsTariffNamesCategories_Id_Fk]) VALUES (N'e3456030-af29-49cf-86a8-042997d2fa79', N'Kompozit Dolgu (Üç Yüzlü)', 1819.4400, 8, 1965.0000, 0.0000, 6, 138)
INSERT [dbo].[AccountsTariffLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [Cost], [Queue], [AccountsTariffNamesCategories_Id_Fk]) VALUES (N'e35ce0a6-6d12-4c1a-917d-92b373273298', N'Subepitelyal Bağ Dokusu Grefti', 1569.4400, 8, 1695.0000, 0.0000, 17, 135)
INSERT [dbo].[AccountsTariffLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [Cost], [Queue], [AccountsTariffNamesCategories_Id_Fk]) VALUES (N'e45866a5-bda4-4f0f-9030-ca7bed20f751', N'Bilgisayarlı Büyük T.M.E. Fonksiyon Testi', 3550.9300, 8, 3835.0000, 0.0000, 28, 130)
GO
INSERT [dbo].[AccountsTariffLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [Cost], [Queue], [AccountsTariffNamesCategories_Id_Fk]) VALUES (N'e4de7d2f-4424-4e57-bd89-9a408de509c2', N'Sabit Pekiştirme Aygıtı (Lingual Retainer)', 2462.9600, 8, 2660.0000, 0.0000, 22, 136)
INSERT [dbo].[AccountsTariffLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [Cost], [Queue], [AccountsTariffNamesCategories_Id_Fk]) VALUES (N'e5043b0c-3cc9-47a8-805e-7616fba9fa4e', N'Periodontal Şine (Splint - Geçici - Yarım Çene)', 879.6300, 8, 950.0000, 0.0000, 13, 135)
INSERT [dbo].[AccountsTariffLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [Cost], [Queue], [AccountsTariffNamesCategories_Id_Fk]) VALUES (N'e50d07c6-f1fb-4c6f-830c-690c04789cca', N'Yeni Doğanda Preoperatif Aparey (Vida Ücreti Ayrıca Alınır) (**)', 7166.6700, 8, 7740.0000, 0.0000, 40, 140)
INSERT [dbo].[AccountsTariffLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [Cost], [Queue], [AccountsTariffNamesCategories_Id_Fk]) VALUES (N'e53efd18-0471-4d93-a1d9-55c4db5fee3a', N'Kanal Dolgusu Tekrarı (Retreatment - Her Kanal İçin - Dolgu Hariç)', 1548.6200, 8, 1672.5000, 0.0000, 35, 138)
INSERT [dbo].[AccountsTariffLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [Cost], [Queue], [AccountsTariffNamesCategories_Id_Fk]) VALUES (N'e54585b4-d41f-4a97-9e25-18af0b87c6db', N'Seramik İnley Dolgu (Üç Yüzlü)', 5462.9600, 8, 5900.0000, 0.0000, 19, 131)
INSERT [dbo].[AccountsTariffLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [Cost], [Queue], [AccountsTariffNamesCategories_Id_Fk]) VALUES (N'e5f71e18-5235-4d02-9125-7261f3ed3483', N'Gömülü Dişin Diş Dizisinde Yerine Yerleştirilmesi (Tek Diş)', 7826.3900, 8, 8452.5000, 0.0000, 57, 143)
INSERT [dbo].[AccountsTariffLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [Cost], [Queue], [AccountsTariffNamesCategories_Id_Fk]) VALUES (N'e5fee904-7904-43f3-85a0-9baa73ab6b48', N'Zigoma İmplant (İmplant Ücreti Hariç)', 9893.5200, 8, 10685.0000, 0.0000, 54, 134)
INSERT [dbo].[AccountsTariffLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [Cost], [Queue], [AccountsTariffNamesCategories_Id_Fk]) VALUES (N'e603b3d8-c086-4d9c-9fa3-1dec6a8f87af', N'Bölümlü Protez (Döküm Metal ile Güçlendirilmiş - Tek Çene)', 12493.0500, 8, 13492.4900, 0.0000, 4, 140)
INSERT [dbo].[AccountsTariffLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [Cost], [Queue], [AccountsTariffNamesCategories_Id_Fk]) VALUES (N'e6136cee-2086-49f2-85d1-de3172261789', N'Genioplasti', 26625.0000, 8, 28755.0000, 0.0000, 47, 141)
INSERT [dbo].[AccountsTariffLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [Cost], [Queue], [AccountsTariffNamesCategories_Id_Fk]) VALUES (N'e698d382-9ef8-43f3-9052-72ba6c04e727', N'Model Set-Up', 2513.9000, 8, 2715.0100, 0.0000, 48, 143)
INSERT [dbo].[AccountsTariffLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [Cost], [Queue], [AccountsTariffNamesCategories_Id_Fk]) VALUES (N'e6e5a1f6-859f-473a-ac0b-c92384441231', N'Büküm İçeren Tel Tatbiki (Tek Çene)', 881.9400, 8, 952.5000, 0.0000, 33, 143)
INSERT [dbo].[AccountsTariffLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [Cost], [Queue], [AccountsTariffNamesCategories_Id_Fk]) VALUES (N'e71fae93-8185-48a4-8648-7b4830b81579', N'Laminate Veneer Kompozit', 3180.5600, 8, 3435.0000, 0.0000, 24, 140)
INSERT [dbo].[AccountsTariffLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [Cost], [Queue], [AccountsTariffNamesCategories_Id_Fk]) VALUES (N'e76ff3fb-3eab-474f-a049-8a1f08da7dcd', N'Ekstra Oral Röntgen Filmi', 203.7000, 8, 220.0000, 0.0000, 17, 130)
INSERT [dbo].[AccountsTariffLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [Cost], [Queue], [AccountsTariffNamesCategories_Id_Fk]) VALUES (N'e7af5bd6-f9e2-4bcc-b22e-bbdf16dcd614', N'Strip Kron', 912.0400, 8, 985.0000, 0.0000, 13, 132)
INSERT [dbo].[AccountsTariffLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [Cost], [Queue], [AccountsTariffNamesCategories_Id_Fk]) VALUES (N'e8024081-54df-4c31-b844-60b5bf9580c8', N'T.M.E. İçi Enjeksiyon (Tek Taraflı)', 722.2200, 8, 780.0000, 0.0000, 44, 134)
INSERT [dbo].[AccountsTariffLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [Cost], [Queue], [AccountsTariffNamesCategories_Id_Fk]) VALUES (N'e8792de2-c8ba-4e31-9bad-e4782a7770ac', N'İntra Oral Dijital Radyografi', 347.2200, 8, 375.0000, 0.0000, 21, 137)
INSERT [dbo].[AccountsTariffLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [Cost], [Queue], [AccountsTariffNamesCategories_Id_Fk]) VALUES (N'e9c7f987-0c8b-4f78-9b00-2f36edbf5cdc', N'Dentin Pini Uygulaması (Her Pin Başına)', 148.1500, 8, 160.0000, 0.0000, 41, 131)
INSERT [dbo].[AccountsTariffLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [Cost], [Queue], [AccountsTariffNamesCategories_Id_Fk]) VALUES (N'ea848410-3d26-4057-aec3-b540d4c01d95', N'Hassasiyet Tedavisi (Tek Diş)', 479.1600, 8, 517.4900, 0.0000, 43, 138)
INSERT [dbo].[AccountsTariffLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [Cost], [Queue], [AccountsTariffNamesCategories_Id_Fk]) VALUES (N'eacd88af-89a7-40b1-9f3e-420090e5facf', N'Diş Ağartma (Beyazlatma - Devital Tek Diş ) (Seans Başına - Dolgu Hariç)', 881.9400, 8, 952.5000, 0.0000, 46, 138)
INSERT [dbo].[AccountsTariffLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [Cost], [Queue], [AccountsTariffNamesCategories_Id_Fk]) VALUES (N'eb26ca37-4ae8-48d3-a56b-128cf8a00bba', N'Aşındırma ile Sürme Rehberliği (Seans Başına)', 337.9600, 8, 365.0000, 0.0000, 1, 132)
INSERT [dbo].[AccountsTariffLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [Cost], [Queue], [AccountsTariffNamesCategories_Id_Fk]) VALUES (N'eb325d47-d6f3-46a0-ad28-c378e2c5f07e', N'Angle Sınıf I Anomalilerinin Ortodontik Tedavisi', 11291.6700, 8, 12195.0000, 0.0000, 10, 143)
INSERT [dbo].[AccountsTariffLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [Cost], [Queue], [AccountsTariffNamesCategories_Id_Fk]) VALUES (N'eb56e831-80ec-4092-b9fe-c5a8d7f09860', N'Kanal Tedavisi - İlave Her Kanal İçin', 902.7800, 8, 975.0000, 0.0000, 30, 138)
INSERT [dbo].[AccountsTariffLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [Cost], [Queue], [AccountsTariffNamesCategories_Id_Fk]) VALUES (N'eb666b8e-d56f-4c6a-a01e-8fbb25ba57a0', N'Sürme Rehberliği', 6458.3400, 8, 6975.0100, 0.0000, 55, 143)
INSERT [dbo].[AccountsTariffLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [Cost], [Queue], [AccountsTariffNamesCategories_Id_Fk]) VALUES (N'eb774b2b-5e1b-41d8-a6da-0a99dad4ae22', N'İki Kökte Kök Ucu Rezeksiyonu (Kanal Tedavisi ve Dolgu Hariç)', 4069.4400, 8, 4395.0000, 0.0000, 6, 141)
INSERT [dbo].[AccountsTariffLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [Cost], [Queue], [AccountsTariffNamesCategories_Id_Fk]) VALUES (N'ebfce1fa-3c0b-4c33-b21c-33b67ec9c06f', N'Yumuşak Doku Greftleme (Greft Ücreti Hariç)', 2898.1500, 8, 3130.0000, 0.0000, 21, 134)
INSERT [dbo].[AccountsTariffLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [Cost], [Queue], [AccountsTariffNamesCategories_Id_Fk]) VALUES (N'ec017c2c-0105-40c0-b716-a46bc7796051', N'Amalgam Dolgu (Bir Yüzlü)', 703.7000, 8, 760.0000, 0.0000, 1, 131)
INSERT [dbo].[AccountsTariffLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [Cost], [Queue], [AccountsTariffNamesCategories_Id_Fk]) VALUES (N'ecc77527-900d-4596-b928-9459bfa0cc24', N'Frenektomi - Frenetomi', 1648.1500, 8, 1780.0000, 0.0000, 18, 135)
INSERT [dbo].[AccountsTariffLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [Cost], [Queue], [AccountsTariffNamesCategories_Id_Fk]) VALUES (N'ecf962f6-2d1d-4be8-892e-a25ccf24d1ee', N'Onley *', 3138.8900, 8, 3390.0000, 0.0000, 20, 138)
INSERT [dbo].[AccountsTariffLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [Cost], [Queue], [AccountsTariffNamesCategories_Id_Fk]) VALUES (N'ed310719-1d62-45a8-ac98-ce02895d68bb', N'Siyalografi', 819.4500, 8, 885.0100, 0.0000, 23, 137)
INSERT [dbo].[AccountsTariffLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [Cost], [Queue], [AccountsTariffNamesCategories_Id_Fk]) VALUES (N'ed9022fe-ddde-41c1-9310-5c8bfed14506', N'Süt Dişi Kanal Tedavisi', 2034.7200, 8, 2197.5000, 0.0000, 7, 139)
INSERT [dbo].[AccountsTariffLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [Cost], [Queue], [AccountsTariffNamesCategories_Id_Fk]) VALUES (N'edaeace8-01bc-4d53-b420-c606533daaf2', N'Prefabrike Kron *', 1395.8400, 8, 1507.5100, 0.0000, 12, 139)
INSERT [dbo].[AccountsTariffLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [Cost], [Queue], [AccountsTariffNamesCategories_Id_Fk]) VALUES (N'edf70200-c072-4962-8435-ba7170dd8249', N'Sefalometrik Cerrahi Planı', 592.5900, 8, 640.0000, 0.0000, 50, 136)
INSERT [dbo].[AccountsTariffLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [Cost], [Queue], [AccountsTariffNamesCategories_Id_Fk]) VALUES (N'ee456f60-fca5-4f70-86b5-4402c001dc76', N'Basit Çene Defektlerinde Protetik Tedavi (**)', 13597.2200, 8, 14684.9900, 0.0000, 42, 140)
INSERT [dbo].[AccountsTariffLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [Cost], [Queue], [AccountsTariffNamesCategories_Id_Fk]) VALUES (N'ee51a391-0570-4e48-8f4d-63c23ab15594', N'Oklüzal Film', 171.3000, 8, 185.0000, 0.0000, 15, 130)
INSERT [dbo].[AccountsTariffLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [Cost], [Queue], [AccountsTariffNamesCategories_Id_Fk]) VALUES (N'ee7bf414-05a1-479e-89cb-56238f868554', N'Hassasiyet Tedavisi (Tam Çene)', 935.1900, 8, 1010.0000, 0.0000, 44, 131)
INSERT [dbo].[AccountsTariffLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [Cost], [Queue], [AccountsTariffNamesCategories_Id_Fk]) VALUES (N'efdcfcaf-60ff-48d3-bb0c-2d1bf25d3418', N'Bant Tatbiki (Tek Diş)', 812.5100, 8, 877.5100, 0.0000, 35, 143)
INSERT [dbo].[AccountsTariffLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [Cost], [Queue], [AccountsTariffNamesCategories_Id_Fk]) VALUES (N'f027094b-2cbb-417d-b0f0-91b6484c5e63', N'Apse Drenajı ve Tedavisi (Extraoral)', 2534.7200, 8, 2737.4900, 0.0000, 25, 141)
INSERT [dbo].[AccountsTariffLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [Cost], [Queue], [AccountsTariffNamesCategories_Id_Fk]) VALUES (N'f0e6704a-765c-4c78-a303-ed3f3016b083', N'Ağız İçi Distalizasyon Apareyi', 3939.8100, 8, 4255.0000, 0.0000, 56, 136)
INSERT [dbo].[AccountsTariffLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [Cost], [Queue], [AccountsTariffNamesCategories_Id_Fk]) VALUES (N'f1ad96be-e8ef-4dca-abe9-204a15256124', N'Ortodontik Modellerin Face - Bow ile Artikülatöre Taşınması', 2069.4400, 8, 2235.0000, 0.0000, 51, 136)
INSERT [dbo].[AccountsTariffLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [Cost], [Queue], [AccountsTariffNamesCategories_Id_Fk]) VALUES (N'f1ce8f2f-de02-466b-9d3a-b8efb4afae6b', N'Pinley *', 3131.9400, 8, 3382.5000, 0.0000, 22, 138)
INSERT [dbo].[AccountsTariffLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [Cost], [Queue], [AccountsTariffNamesCategories_Id_Fk]) VALUES (N'f1e52da1-9007-41ac-8674-620edb626c43', N'Açık Apeksli Dişte Kanal Tedavisi (Her Kanal İçin - Dolgu Hariç)(Pansuman Ücretleri Hariç)', 2953.7000, 8, 3190.0000, 0.0000, 8, 132)
INSERT [dbo].[AccountsTariffLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [Cost], [Queue], [AccountsTariffNamesCategories_Id_Fk]) VALUES (N'f1e67c6a-9d82-49fc-8653-cc60e07f4e08', N'Flap Operasyonu (Subgingival Küretaj Dahil - Tek Diş)', 1951.4000, 8, 2107.5100, 0.0000, 6, 142)
INSERT [dbo].[AccountsTariffLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [Cost], [Queue], [AccountsTariffNamesCategories_Id_Fk]) VALUES (N'f2c8a5f5-c6d1-410e-87ce-bf11c7016a1e', N'Yüz Protezleri (Yumuşak Akrilik İle)', 18916.6700, 8, 20430.0000, 0.0000, 44, 133)
INSERT [dbo].[AccountsTariffLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [Cost], [Queue], [AccountsTariffNamesCategories_Id_Fk]) VALUES (N'f2dfbb53-01a8-41d3-bf3a-923fbd7f2a23', N'Cam İonomer Dolgu', 597.2200, 8, 645.0000, 0.0000, 9, 131)
INSERT [dbo].[AccountsTariffLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [Cost], [Queue], [AccountsTariffNamesCategories_Id_Fk]) VALUES (N'f30e2f41-6a90-41f0-81c1-da49680baf6a', N'Şeffaf Plaklar ile Ortodontik Tedavi (Hafif) (Plak Ücreti Hariç)', 17750.0000, 8, 19169.9900, 0.0000, 62, 143)
INSERT [dbo].[AccountsTariffLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [Cost], [Queue], [AccountsTariffNamesCategories_Id_Fk]) VALUES (N'f3a5d9b1-6fc8-4b5f-a93d-e9de3314df35', N'Kontrol Hekim Muayenesi', 259.2600, 8, 280.0000, 0.0000, 3, 130)
INSERT [dbo].[AccountsTariffLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [Cost], [Queue], [AccountsTariffNamesCategories_Id_Fk]) VALUES (N'f3c23750-5e00-4924-b7c6-b2a26dd09d80', N'Ankraj Amaçlı Plak Çıkarma', 2381.9400, 8, 2572.5000, 0.0000, 53, 141)
INSERT [dbo].[AccountsTariffLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [Cost], [Queue], [AccountsTariffNamesCategories_Id_Fk]) VALUES (N'f49e7591-94e8-4556-8819-86b2e3e5d31e', N'Çene Lüksasyonu', 979.1700, 8, 1057.5000, 0.0000, 17, 141)
INSERT [dbo].[AccountsTariffLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [Cost], [Queue], [AccountsTariffNamesCategories_Id_Fk]) VALUES (N'f4f2b2cf-e60f-43b0-a6e0-7cd8e6acac38', N'Açık Apeksli Dişte Kanal Tedavisi (Her Kanal İçin - Dolgu Hariç)(Pansuman Ücretleri Hariç)', 4430.5500, 8, 4784.9900, 0.0000, 8, 139)
INSERT [dbo].[AccountsTariffLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [Cost], [Queue], [AccountsTariffNamesCategories_Id_Fk]) VALUES (N'f4fb5ecb-f728-46aa-90c3-860d96f8e40e', N'Sabit Pekiştirme Aygıtı (Lingual Retainer)', 3694.4400, 8, 3990.0000, 0.0000, 22, 143)
INSERT [dbo].[AccountsTariffLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [Cost], [Queue], [AccountsTariffNamesCategories_Id_Fk]) VALUES (N'f5d79a17-e256-4f08-8141-1497e575825d', N'Düz Ark Teli Tatbiki (Tek Çene NİTİ Telleri)', 569.4400, 8, 615.0000, 0.0000, 32, 136)
INSERT [dbo].[AccountsTariffLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [Cost], [Queue], [AccountsTariffNamesCategories_Id_Fk]) VALUES (N'f60b4bc2-2dd1-4ff1-89f4-2a06d3da745c', N'Kompozit Dolgu (İki Yüzlü)', 1465.2800, 8, 1582.5000, 0.0000, 5, 138)
INSERT [dbo].[AccountsTariffLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [Cost], [Queue], [AccountsTariffNamesCategories_Id_Fk]) VALUES (N'f69be71e-2044-431c-bdd1-835e4a230f45', N'Tomografi (İki Çene Çene)', 2479.1700, 8, 2677.5000, 0.0000, 26, 137)
INSERT [dbo].[AccountsTariffLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [Cost], [Queue], [AccountsTariffNamesCategories_Id_Fk]) VALUES (N'f6cff350-3c2c-49b1-9985-75328b8472fe', N'Yüzeysel Flor Uygulaması (Yarım Çene)', 555.5600, 8, 600.0000, 0.0000, 3, 139)
INSERT [dbo].[AccountsTariffLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [Cost], [Queue], [AccountsTariffNamesCategories_Id_Fk]) VALUES (N'f6d08d72-0544-4abb-933d-918d57737724', N'Periodontal Splint (Geçici)', 3916.6700, 8, 4230.0000, 0.0000, 12, 142)
INSERT [dbo].[AccountsTariffLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [Cost], [Queue], [AccountsTariffNamesCategories_Id_Fk]) VALUES (N'f73584db-af1d-476b-be1a-e388128b20c6', N'Pekiştirme Tedavisi', 2023.1500, 8, 2185.0000, 0.0000, 20, 136)
INSERT [dbo].[AccountsTariffLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [Cost], [Queue], [AccountsTariffNamesCategories_Id_Fk]) VALUES (N'f7ec30e2-6030-4806-8df5-ec575acb4457', N'Üç Kökte Kök Ucu Rezeksiyonu (Kanal Tedavisi ve Dolgu Hariç)', 4673.6100, 8, 5047.5000, 0.0000, 7, 141)
INSERT [dbo].[AccountsTariffLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [Cost], [Queue], [AccountsTariffNamesCategories_Id_Fk]) VALUES (N'f86dd9c4-b58e-486a-8854-5cd7cf8353ac', N'Komplike Çene Defektlerinde Protetik Tedavi (**)', 15736.1100, 8, 16995.0000, 0.0000, 43, 140)
INSERT [dbo].[AccountsTariffLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [Cost], [Queue], [AccountsTariffNamesCategories_Id_Fk]) VALUES (N'f89bc444-fd12-471e-98fc-54eaccfecda5', N'İmplant Üstü Veneer Kuron (Seramik) (Abutment Ücreti Hariç)', 4868.0600, 8, 5257.5000, 0.0000, 23, 140)
INSERT [dbo].[AccountsTariffLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [Cost], [Queue], [AccountsTariffNamesCategories_Id_Fk]) VALUES (N'f9193463-b0e1-4125-a818-b39c804bd895', N'Travma Splinti', 2555.5500, 8, 2759.9900, 0.0000, 14, 139)
INSERT [dbo].[AccountsTariffLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [Cost], [Queue], [AccountsTariffNamesCategories_Id_Fk]) VALUES (N'f9867244-8e76-4978-b886-d5cbadd8f253', N'Dolgu (Restorasyon) Tamiri', 1159.7300, 8, 1252.5000, 0.0000, 23, 138)
INSERT [dbo].[AccountsTariffLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [Cost], [Queue], [AccountsTariffNamesCategories_Id_Fk]) VALUES (N'f9987dbf-e4fe-446b-a2da-da600095ba07', N'Braket Tatbiki (Tek Diş)', 472.2200, 8, 510.0000, 0.0000, 36, 136)
INSERT [dbo].[AccountsTariffLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [Cost], [Queue], [AccountsTariffNamesCategories_Id_Fk]) VALUES (N'f9a8580d-9ff1-48f6-8670-6f0783ba5e22', N'Kuafaj (Dolgu Hariç)', 159.7200, 8, 172.5000, 0.0000, 25, 138)
INSERT [dbo].[AccountsTariffLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [Cost], [Queue], [AccountsTariffNamesCategories_Id_Fk]) VALUES (N'f9f4998e-9c14-41ae-b9a9-f87658f068f1', N'Diş Üstü Protezi (Overdenture - Tek Çene) (**)', 6527.7800, 8, 7050.0000, 0.0000, 38, 133)
INSERT [dbo].[AccountsTariffLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [Cost], [Queue], [AccountsTariffNamesCategories_Id_Fk]) VALUES (N'fa2af375-8105-43d6-b3ee-037ffc19bc0b', N'Gece Plağı (Yumuşak)', 2243.0600, 8, 2422.5000, 0.0000, 17, 140)
INSERT [dbo].[AccountsTariffLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [Cost], [Queue], [AccountsTariffNamesCategories_Id_Fk]) VALUES (N'fa5205db-c0d7-45b1-808f-1295781e643b', N'Gnatoloji, T.M.E. Kas Muayenesi (Oklüzyon Kontrolü)', 1217.5900, 8, 1315.0000, 0.0000, 12, 130)
INSERT [dbo].[AccountsTariffLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [Cost], [Queue], [AccountsTariffNamesCategories_Id_Fk]) VALUES (N'faa653f6-f45e-4f4e-b872-f53cf5c28da5', N'Döküm Post Core (Pivo) (Üst Yapı Hariç)', 1819.4400, 8, 1965.0000, 0.0000, 32, 133)
INSERT [dbo].[AccountsTariffLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [Cost], [Queue], [AccountsTariffNamesCategories_Id_Fk]) VALUES (N'faa72feb-7ace-421d-a75e-c12b95540b5c', N'Sabit Kapanış Yükseltici Tatbiki (Kısa Süreli)', 921.3000, 8, 995.0000, 0.0000, 13, 136)
INSERT [dbo].[AccountsTariffLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [Cost], [Queue], [AccountsTariffNamesCategories_Id_Fk]) VALUES (N'faba6bae-d684-441a-aba8-736268dcef02', N'Reverse Headgear', 4953.7000, 8, 5350.0000, 0.0000, 31, 136)
INSERT [dbo].[AccountsTariffLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [Cost], [Queue], [AccountsTariffNamesCategories_Id_Fk]) VALUES (N'fb0f6487-eee3-4a01-b73f-1af0d6288949', N'Genioplasti', 17750.0000, 8, 19170.0000, 0.0000, 47, 134)
INSERT [dbo].[AccountsTariffLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [Cost], [Queue], [AccountsTariffNamesCategories_Id_Fk]) VALUES (N'fb47bf9f-1fad-4c88-8823-19fed8a4b37f', N'Kanal Dolgusu Sökümü (Her Kanal İçin)', 673.6100, 8, 727.4900, 0.0000, 34, 138)
INSERT [dbo].[AccountsTariffLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [Cost], [Queue], [AccountsTariffNamesCategories_Id_Fk]) VALUES (N'fbbc0d6e-6998-49ce-81f6-ea70f8fbc74b', N'Ototransplantasyon', 4009.2600, 8, 4330.0000, 0.0000, 33, 134)
INSERT [dbo].[AccountsTariffLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [Cost], [Queue], [AccountsTariffNamesCategories_Id_Fk]) VALUES (N'fc337129-8974-4f62-84b5-a20946426b2e', N'Ortodontik Model Yapımı', 451.4000, 8, 487.5100, 0.0000, 6, 143)
INSERT [dbo].[AccountsTariffLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [Cost], [Queue], [AccountsTariffNamesCategories_Id_Fk]) VALUES (N'fd8b11d4-6d13-488e-acb3-634000978e4c', N'Antero-Posterior Sefalometrik Film', 777.7800, 8, 840.0000, 0.0000, 20, 137)
INSERT [dbo].[AccountsTariffLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [Cost], [Queue], [AccountsTariffNamesCategories_Id_Fk]) VALUES (N'fdef2e96-8dcf-48bb-99ed-9bf22858e53d', N'Kanal Tedavisi - Tek Kanal (Dolgu Hariç)', 1625.0000, 8, 1754.9900, 0.0000, 27, 138)
INSERT [dbo].[AccountsTariffLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [Cost], [Queue], [AccountsTariffNamesCategories_Id_Fk]) VALUES (N'fee08395-d05f-415a-94e7-320da2f1f619', N'Pinley ve Çeşitleri *', 2296.3000, 8, 2480.0000, 0.0000, 19, 133)
INSERT [dbo].[AccountsTariffLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [Cost], [Queue], [AccountsTariffNamesCategories_Id_Fk]) VALUES (N'fef7203f-f6b9-4bc1-b5f3-0730be83060b', N'Oklüzal Cerrahi Splint (Tek Çene)', 5215.2800, 8, 5632.5000, 0.0000, 53, 143)
INSERT [dbo].[AccountsTariffLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [Cost], [Queue], [AccountsTariffNamesCategories_Id_Fk]) VALUES (N'ff5e4cca-7198-4cf4-9aa8-428786954c10', N'Tek Parça Döküm Kuron', 1976.8500, 8, 2135.0000, 0.0000, 20, 133)
GO
SET IDENTITY_INSERT [dbo].[AccountsTariffNames] ON 

INSERT [dbo].[AccountsTariffNames] ([Id], [TariffName], [CreateDate], [Accounts_AspNetUsersIdFk_Fk]) VALUES (22, N'Klinik Normal Tarife', CAST(N'2023-06-18T11:12:06.497' AS DateTime), N'e406b078-66e8-4745-97b2-195c7cec2a48')
INSERT [dbo].[AccountsTariffNames] ([Id], [TariffName], [CreateDate], [Accounts_AspNetUsersIdFk_Fk]) VALUES (23, N'Yeni Tarife ', CAST(N'2023-07-01T05:44:31.463' AS DateTime), N'e406b078-66e8-4745-97b2-195c7cec2a48')
SET IDENTITY_INSERT [dbo].[AccountsTariffNames] OFF
GO
SET IDENTITY_INSERT [dbo].[AccountsTariffNamesCategories] ON 

INSERT [dbo].[AccountsTariffNamesCategories] ([Id], [CategoryName], [AccountsTariffNames_Id_Fk]) VALUES (130, N'TEŞHİS VE TEDAVİ PLANLAMASI', 22)
INSERT [dbo].[AccountsTariffNamesCategories] ([Id], [CategoryName], [AccountsTariffNames_Id_Fk]) VALUES (131, N'TEDAVİ VE ENDODONTİ', 22)
INSERT [dbo].[AccountsTariffNamesCategories] ([Id], [CategoryName], [AccountsTariffNames_Id_Fk]) VALUES (132, N'PEDODONTİ', 22)
INSERT [dbo].[AccountsTariffNamesCategories] ([Id], [CategoryName], [AccountsTariffNames_Id_Fk]) VALUES (133, N'PROTEZ', 22)
INSERT [dbo].[AccountsTariffNamesCategories] ([Id], [CategoryName], [AccountsTariffNames_Id_Fk]) VALUES (134, N'AĞIZ-DİŞ VE ÇENE CERRAHİSİ', 22)
INSERT [dbo].[AccountsTariffNamesCategories] ([Id], [CategoryName], [AccountsTariffNames_Id_Fk]) VALUES (135, N'PERİODONTOLOJİ', 22)
INSERT [dbo].[AccountsTariffNamesCategories] ([Id], [CategoryName], [AccountsTariffNames_Id_Fk]) VALUES (136, N'ORTODONTİ', 22)
INSERT [dbo].[AccountsTariffNamesCategories] ([Id], [CategoryName], [AccountsTariffNames_Id_Fk]) VALUES (137, N'TEŞHİS VE TEDAVİ PLANLAMASI', 23)
INSERT [dbo].[AccountsTariffNamesCategories] ([Id], [CategoryName], [AccountsTariffNames_Id_Fk]) VALUES (138, N'TEDAVİ VE ENDODONTİ', 23)
INSERT [dbo].[AccountsTariffNamesCategories] ([Id], [CategoryName], [AccountsTariffNames_Id_Fk]) VALUES (139, N'PEDODONTİ', 23)
INSERT [dbo].[AccountsTariffNamesCategories] ([Id], [CategoryName], [AccountsTariffNames_Id_Fk]) VALUES (140, N'PROTEZ', 23)
INSERT [dbo].[AccountsTariffNamesCategories] ([Id], [CategoryName], [AccountsTariffNames_Id_Fk]) VALUES (141, N'AĞIZ-DİŞ VE ÇENE CERRAHİSİ', 23)
INSERT [dbo].[AccountsTariffNamesCategories] ([Id], [CategoryName], [AccountsTariffNames_Id_Fk]) VALUES (142, N'PERİODONTOLOJİ', 23)
INSERT [dbo].[AccountsTariffNamesCategories] ([Id], [CategoryName], [AccountsTariffNames_Id_Fk]) VALUES (143, N'ORTODONTİ', 23)
SET IDENTITY_INSERT [dbo].[AccountsTariffNamesCategories] OFF
GO
INSERT [dbo].[AccountsTreatments] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [Cost], [Date], [Teet], [Accounts_AspNetUsers_Id_Fk], [AccountPatients_Id_Fk], [AccountsTariffLists_Id_Fk], [AccountsDiagnozLists_Id_Fk], [ActionLists_Id_Fk], [Doctor_SubAccounts_AspNetUsers_Id_Fk], [Comment]) VALUES (N'3e4219fd-4096-488e-9957-71e6b6457a96', N'Uzman Dişhekimi Muayenesi', 310.1900, 8, 335.0000, 0.0000, CAST(N'2023-07-17T20:42:19.100' AS DateTime), N'22', N'e406b078-66e8-4745-97b2-195c7cec2a48', N'6ea1da47-0660-4caf-b0e1-20535fba4a99', N'3f362d58-50ec-4f60-9df5-cc5b62c88908', NULL, 2, N'e406b078-66e8-4745-97b2-195c7cec2a48', NULL)
INSERT [dbo].[AccountsTreatments] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [Cost], [Date], [Teet], [Accounts_AspNetUsers_Id_Fk], [AccountPatients_Id_Fk], [AccountsTariffLists_Id_Fk], [AccountsDiagnozLists_Id_Fk], [ActionLists_Id_Fk], [Doctor_SubAccounts_AspNetUsers_Id_Fk], [Comment]) VALUES (N'799413aa-8d0b-48da-bf2c-73b5f8d09855', N'Dişhekimi Muayenesi', 291.6700, 8, 315.0000, 5300.0000, CAST(N'2023-07-17T20:39:46.643' AS DateTime), N'23', N'e406b078-66e8-4745-97b2-195c7cec2a48', N'6ea1da47-0660-4caf-b0e1-20535fba4a99', N'68c0d541-d7e4-4889-b74e-c89ec8b2c4c0', NULL, 4, N'e406b078-66e8-4745-97b2-195c7cec2a48', NULL)
INSERT [dbo].[AccountsTreatments] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [Cost], [Date], [Teet], [Accounts_AspNetUsers_Id_Fk], [AccountPatients_Id_Fk], [AccountsTariffLists_Id_Fk], [AccountsDiagnozLists_Id_Fk], [ActionLists_Id_Fk], [Doctor_SubAccounts_AspNetUsers_Id_Fk], [Comment]) VALUES (N'aaf15a58-81d5-4c8b-8122-57f715a06b38', N'Kontrol Hekim Muayenesi', 259.2600, 8, 280.0000, 0.0000, CAST(N'2023-07-17T20:39:52.417' AS DateTime), N'26', N'e406b078-66e8-4745-97b2-195c7cec2a48', N'6ea1da47-0660-4caf-b0e1-20535fba4a99', N'f3a5d9b1-6fc8-4b5f-a93d-e9de3314df35', NULL, 4, N'e406b078-66e8-4745-97b2-195c7cec2a48', NULL)
INSERT [dbo].[AccountsTreatments] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [Cost], [Date], [Teet], [Accounts_AspNetUsers_Id_Fk], [AccountPatients_Id_Fk], [AccountsTariffLists_Id_Fk], [AccountsDiagnozLists_Id_Fk], [ActionLists_Id_Fk], [Doctor_SubAccounts_AspNetUsers_Id_Fk], [Comment]) VALUES (N'ae57aefe-d692-451c-8dd1-6479e5bcc913', N'Uzman Dişhekimi Muayenesi', 310.1900, 8, 335.0000, 0.0000, CAST(N'2023-07-17T20:39:48.977' AS DateTime), N'22', N'e406b078-66e8-4745-97b2-195c7cec2a48', N'6ea1da47-0660-4caf-b0e1-20535fba4a99', N'3f362d58-50ec-4f60-9df5-cc5b62c88908', NULL, 4, N'e406b078-66e8-4745-97b2-195c7cec2a48', NULL)
INSERT [dbo].[AccountsTreatments] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [Cost], [Date], [Teet], [Accounts_AspNetUsers_Id_Fk], [AccountPatients_Id_Fk], [AccountsTariffLists_Id_Fk], [AccountsDiagnozLists_Id_Fk], [ActionLists_Id_Fk], [Doctor_SubAccounts_AspNetUsers_Id_Fk], [Comment]) VALUES (N'ccccdea7-35ba-4b7c-8ebf-80957b7112ad', N'Dişhekimi Muayenesi', 291.6700, 8, 315.0000, 5300.0000, CAST(N'2023-07-17T20:42:19.087' AS DateTime), N'23', N'e406b078-66e8-4745-97b2-195c7cec2a48', N'6ea1da47-0660-4caf-b0e1-20535fba4a99', N'68c0d541-d7e4-4889-b74e-c89ec8b2c4c0', NULL, 2, N'e406b078-66e8-4745-97b2-195c7cec2a48', NULL)
INSERT [dbo].[AccountsTreatments] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [Cost], [Date], [Teet], [Accounts_AspNetUsers_Id_Fk], [AccountPatients_Id_Fk], [AccountsTariffLists_Id_Fk], [AccountsDiagnozLists_Id_Fk], [ActionLists_Id_Fk], [Doctor_SubAccounts_AspNetUsers_Id_Fk], [Comment]) VALUES (N'ee14b2fa-22a3-40b7-8843-ab72806585f9', N'Kontrol Hekim Muayenesi', 259.2600, 8, 280.0000, 0.0000, CAST(N'2023-07-17T20:42:19.097' AS DateTime), N'26', N'e406b078-66e8-4745-97b2-195c7cec2a48', N'6ea1da47-0660-4caf-b0e1-20535fba4a99', N'f3a5d9b1-6fc8-4b5f-a93d-e9de3314df35', NULL, 2, N'e406b078-66e8-4745-97b2-195c7cec2a48', NULL)
GO
SET IDENTITY_INSERT [dbo].[ActionLists] ON 

INSERT [dbo].[ActionLists] ([Id], [ActionName]) VALUES (1, N'Diagnoz')
INSERT [dbo].[ActionLists] ([Id], [ActionName]) VALUES (2, N'Tedavi')
INSERT [dbo].[ActionLists] ([Id], [ActionName]) VALUES (3, N'Planlama 1')
INSERT [dbo].[ActionLists] ([Id], [ActionName]) VALUES (4, N'Planlama 2')
INSERT [dbo].[ActionLists] ([Id], [ActionName]) VALUES (5, N'Planlama 3')
INSERT [dbo].[ActionLists] ([Id], [ActionName]) VALUES (6, N'Planlama 4')
INSERT [dbo].[ActionLists] ([Id], [ActionName]) VALUES (7, N'Planlama 5')
SET IDENTITY_INSERT [dbo].[ActionLists] OFF
GO
INSERT [dbo].[AspNetRoles] ([Id], [Name], [NormalizedName], [ConcurrencyStamp]) VALUES (N'0110e032-6f8b-4540-91b6-dea0510d74de', N'Rapor Modülü » Borç Analizi', N'RAPOR MODÜLÜ » BORÇ ANALIZI', N'9dd5c85e-33a8-4ddf-8e69-fcd6269f6172')
INSERT [dbo].[AspNetRoles] ([Id], [Name], [NormalizedName], [ConcurrencyStamp]) VALUES (N'035253eb-9562-4d4f-9244-7ba51b6cd2c5', N'Hasta Modülü » Hesap Ekranı.Create', N'HASTA MODÜLÜ » HESAP EKRANı.CREATE', N'294967e3-77e1-409d-9148-198df5f819ee')
INSERT [dbo].[AspNetRoles] ([Id], [Name], [NormalizedName], [ConcurrencyStamp]) VALUES (N'03c0b97c-070d-49db-a4eb-8755ded55fa9', N'Hasta Modülü » Fatura Ekranı.Create', N'HASTA MODÜLÜ » FATURA EKRANı.CREATE', N'57bddc9a-5e68-40e9-a466-e2ddba5a314d')
INSERT [dbo].[AspNetRoles] ([Id], [Name], [NormalizedName], [ConcurrencyStamp]) VALUES (N'0626ee18-58a0-4bd6-9820-09538faf9b8a', N'Hasta Modülü » Tedav Ekranı.Create', N'HASTA MODÜLÜ » TEDAV EKRANı.CREATE', N'a8290310-d0ac-48f6-8c3b-51c80d9fa40d')
INSERT [dbo].[AspNetRoles] ([Id], [Name], [NormalizedName], [ConcurrencyStamp]) VALUES (N'09d429ef-714e-430b-a0b3-1e6abb68e195', N'Rapor Modülü', N'RAPOR MODÜLÜ', N'22ff3261-e4b1-4d3a-b4df-c482a8c7b99f')
INSERT [dbo].[AspNetRoles] ([Id], [Name], [NormalizedName], [ConcurrencyStamp]) VALUES (N'0aab64f6-68a5-4da2-bd1f-22ae2aebd8e2', N'Hasta Modülü » Reçete Ekranı.Read', N'HASTA MODÜLÜ » REÇETE EKRANı.READ', N'7f0b40f3-ad00-4963-bd04-602787250041')
INSERT [dbo].[AspNetRoles] ([Id], [Name], [NormalizedName], [ConcurrencyStamp]) VALUES (N'156b5674-2253-4f5d-8d3b-aed9fbc63204', N'admin', N'ADMIN', N'ad7136f5-217d-4f9b-b232-f6118d981095')
INSERT [dbo].[AspNetRoles] ([Id], [Name], [NormalizedName], [ConcurrencyStamp]) VALUES (N'172edc6e-ffd6-4203-acdb-311139aacbc3', N'Hasta Modülü » Reçete Ekranı.Delete', N'HASTA MODÜLÜ » REÇETE EKRANı.DELETE', N'f4739315-0f27-4217-8191-741ad0aa7efd')
INSERT [dbo].[AspNetRoles] ([Id], [Name], [NormalizedName], [ConcurrencyStamp]) VALUES (N'197064f2-b96e-41c1-9a9d-5bf7b5c0e04d', N'Laboratuvar » Laboratuvar Ekranı.Update', N'LABORATUVAR » LABORATUVAR EKRANı.UPDATE', N'1850bb04-b240-4842-aa90-690deac860cf')
INSERT [dbo].[AspNetRoles] ([Id], [Name], [NormalizedName], [ConcurrencyStamp]) VALUES (N'1af294e4-3c18-491d-a8f6-ec1ad0be4fb4', N'Hasta Modülü » Randevu Ekranı.Update', N'HASTA MODÜLÜ » RANDEVU EKRANı.UPDATE', N'837ed23e-7a9d-4cd6-9c96-f9ed254166ae')
INSERT [dbo].[AspNetRoles] ([Id], [Name], [NormalizedName], [ConcurrencyStamp]) VALUES (N'1d677329-152d-41b4-9697-0031021e3d74', N'Ayarlar Modülü » Ayarlar', N'AYARLAR MODÜLÜ » AYARLAR', N'ba0713b8-883f-49d6-9820-a24c76d307a5')
INSERT [dbo].[AspNetRoles] ([Id], [Name], [NormalizedName], [ConcurrencyStamp]) VALUES (N'3153ac1a-cee4-4458-ae86-b795c8dfb5d9', N'Ayarlar Modülü » Tanımlamalar', N'AYARLAR MODÜLÜ » TANıMLAMALAR', N'f5f496df-1e5f-439b-863f-12f59f2ec36b')
INSERT [dbo].[AspNetRoles] ([Id], [Name], [NormalizedName], [ConcurrencyStamp]) VALUES (N'3a69077c-ba86-4e85-8f3f-531e2bbcd377', N'Rapor Modülü » Hasta Analizi', N'RAPOR MODÜLÜ » HASTA ANALIZI', N'8eca5d1d-8550-4ca3-a360-094a86890452')
INSERT [dbo].[AspNetRoles] ([Id], [Name], [NormalizedName], [ConcurrencyStamp]) VALUES (N'3be44651-0538-4323-9d35-5d4f46750d33', N'Hasta Modülü » Fatura Ekranı.Update', N'HASTA MODÜLÜ » FATURA EKRANı.UPDATE', N'774afc02-5065-4227-ac68-c7579c1002a6')
INSERT [dbo].[AspNetRoles] ([Id], [Name], [NormalizedName], [ConcurrencyStamp]) VALUES (N'43a0133b-f2f8-427f-9f71-04a79fc2e835', N'Muhasebe » Gider Ekranı.Delete', N'MUHASEBE » GIDER EKRANı.DELETE', N'fe2edd62-52ba-4f23-975a-2a8aba809aab')
INSERT [dbo].[AspNetRoles] ([Id], [Name], [NormalizedName], [ConcurrencyStamp]) VALUES (N'45de340f-caf7-40d4-8150-565dd409ef5c', N'Hasta Modülü » Görüntü Ekranı.Delete', N'HASTA MODÜLÜ » GÖRÜNTÜ EKRANı.DELETE', N'0fe18534-4828-48e1-8cc2-23ca72409682')
INSERT [dbo].[AspNetRoles] ([Id], [Name], [NormalizedName], [ConcurrencyStamp]) VALUES (N'4657fdc1-efd8-4d25-aede-b2d6c872208b', N'Hasta Modülü » Görüntü Ekranı.Update', N'HASTA MODÜLÜ » GÖRÜNTÜ EKRANı.UPDATE', N'de95b775-2d27-4c62-a038-d929f4a48530')
INSERT [dbo].[AspNetRoles] ([Id], [Name], [NormalizedName], [ConcurrencyStamp]) VALUES (N'4664e163-67f6-439b-a9eb-32f01dc02498', N'Hasta Modülü » Randevu Ekranı.Create', N'HASTA MODÜLÜ » RANDEVU EKRANı.CREATE', N'1cb40f0f-cebe-46a6-aa82-2ba1aaef4b69')
INSERT [dbo].[AspNetRoles] ([Id], [Name], [NormalizedName], [ConcurrencyStamp]) VALUES (N'4f692d23-7062-4335-875c-643bdcc5efc0', N'Hasta Modülü » Hesap Ekranı.Delete', N'HASTA MODÜLÜ » HESAP EKRANı.DELETE', N'2895341b-ddb8-4c5d-8dad-e538bf22e800')
INSERT [dbo].[AspNetRoles] ([Id], [Name], [NormalizedName], [ConcurrencyStamp]) VALUES (N'52164f00-f9d3-4ead-b577-c0bc74a1a81e', N'Rapor Modülü » Gider Analizi', N'RAPOR MODÜLÜ » GIDER ANALIZI', N'7880d4b3-0cbb-4abe-8e25-d9f3d15a14a2')
INSERT [dbo].[AspNetRoles] ([Id], [Name], [NormalizedName], [ConcurrencyStamp]) VALUES (N'5d4a127b-1c17-4903-9237-e4ac8fb0bfce', N'Hasta Modülü » Hesap Ekranı.Update', N'HASTA MODÜLÜ » HESAP EKRANı.UPDATE', N'33818004-1cb9-457c-961e-6faa72ab1aad')
INSERT [dbo].[AspNetRoles] ([Id], [Name], [NormalizedName], [ConcurrencyStamp]) VALUES (N'64d4a440-7364-492c-a9a4-d102037ba528', N'Laboratuvar » Laboratuvar Ekranı.Create', N'LABORATUVAR » LABORATUVAR EKRANı.CREATE', N'3154f37d-aeb6-4e70-933e-4ceb1c0949de')
INSERT [dbo].[AspNetRoles] ([Id], [Name], [NormalizedName], [ConcurrencyStamp]) VALUES (N'6cceba20-18e7-48da-81ad-24f269a51fb0', N'Rapor Modülü » Gelir Analizi', N'RAPOR MODÜLÜ » GELIR ANALIZI', N'eabca4e5-86df-4467-bb20-005746e8c9ed')
INSERT [dbo].[AspNetRoles] ([Id], [Name], [NormalizedName], [ConcurrencyStamp]) VALUES (N'70a5575f-158f-4e2c-bbb6-12393c0b1f95', N'Muhasebe » Gider Ekranı.Create', N'MUHASEBE » GIDER EKRANı.CREATE', N'dd92a59d-8233-4385-b7b3-c1c80b865953')
INSERT [dbo].[AspNetRoles] ([Id], [Name], [NormalizedName], [ConcurrencyStamp]) VALUES (N'72e4f7b6-cda0-4a07-9c20-5730c670cd88', N'Hasta Modülü » Hesap Ekranı.Read', N'HASTA MODÜLÜ » HESAP EKRANı.READ', N'46c68550-051b-41c7-854f-405f63f73fdb')
INSERT [dbo].[AspNetRoles] ([Id], [Name], [NormalizedName], [ConcurrencyStamp]) VALUES (N'73aa4fa3-7f0f-4367-a973-b11e8325f33c', N'Hasta Modülü » Tedavi Ekranı.Read', N'HASTA MODÜLÜ » TEDAVI EKRANı.READ', N'57f00663-cbbc-41dc-9668-49499259a3ac')
INSERT [dbo].[AspNetRoles] ([Id], [Name], [NormalizedName], [ConcurrencyStamp]) VALUES (N'73b66b7e-e633-4282-bff7-3203dd589f00', N'Hasta Modülü » Randevu Ekranı.Read', N'HASTA MODÜLÜ » RANDEVU EKRANı.READ', N'4892bf8f-dbed-473c-838b-ee9b90203499')
INSERT [dbo].[AspNetRoles] ([Id], [Name], [NormalizedName], [ConcurrencyStamp]) VALUES (N'7472708e-b010-4e45-884a-b5274cc7600e', N'Hasta Modülü » Hasta Ekranı.Read', N'HASTA MODÜLÜ » HASTA EKRANı.READ', N'3d2ce6ae-0be2-4d94-84ef-4d605d2b9aac')
INSERT [dbo].[AspNetRoles] ([Id], [Name], [NormalizedName], [ConcurrencyStamp]) VALUES (N'7c70c001-b2f8-49df-bc04-b339d935831d', N'Rapor Modülü » Tedavi Analizi', N'RAPOR MODÜLÜ » TEDAVI ANALIZI', N'924aa5a3-8a53-48e9-84fa-4724c02707ca')
INSERT [dbo].[AspNetRoles] ([Id], [Name], [NormalizedName], [ConcurrencyStamp]) VALUES (N'9535ca4b-e95d-4934-82d9-cf2293dee94f', N'Laboratuvar » Laboratuvar Ekranı.Delete', N'LABORATUVAR » LABORATUVAR EKRANı.DELETE', N'ac32e442-5099-4be8-861a-c5137bf0f2de')
INSERT [dbo].[AspNetRoles] ([Id], [Name], [NormalizedName], [ConcurrencyStamp]) VALUES (N'9fbbfc2c-ce26-46f2-9fcd-29683c3cc563', N'Hasta Modülü » Reçete Ekranı.Update', N'HASTA MODÜLÜ » REÇETE EKRANı.UPDATE', N'61de75b0-00fe-405e-a701-0ebf9eac1e81')
INSERT [dbo].[AspNetRoles] ([Id], [Name], [NormalizedName], [ConcurrencyStamp]) VALUES (N'a0b50dc9-0571-408c-a0c4-d6d69e2a2046', N'Muhasebe » Gider Ekranı.Read', N'MUHASEBE » GIDER EKRANı.READ', N'cc3db62b-e1f4-413f-94cc-403afd635e6b')
INSERT [dbo].[AspNetRoles] ([Id], [Name], [NormalizedName], [ConcurrencyStamp]) VALUES (N'a153e2bd-fa2f-4ab1-8711-c5bb850ad965', N'Hasta Modülü » Tedavi Ekranı.Delete', N'HASTA MODÜLÜ » TEDAVI EKRANı.DELETE', N'48f56e94-0463-480d-9afc-c3cb20ad8b16')
INSERT [dbo].[AspNetRoles] ([Id], [Name], [NormalizedName], [ConcurrencyStamp]) VALUES (N'a6566623-6618-4da6-bed4-4c09c2e3859c', N'Hasta Modülü » Fatura Ekranı.Delete', N'HASTA MODÜLÜ » FATURA EKRANı.DELETE', N'04aa7d2b-ec25-4f73-8e57-dd4cfd412597')
INSERT [dbo].[AspNetRoles] ([Id], [Name], [NormalizedName], [ConcurrencyStamp]) VALUES (N'a7a734b7-7e2d-43ba-ab70-dc127bfce512', N'Hasta Modülü » Randevu Ekranı.Delete', N'HASTA MODÜLÜ » RANDEVU EKRANı.DELETE', N'4e96a19f-df93-4614-bad9-0d376833152a')
INSERT [dbo].[AspNetRoles] ([Id], [Name], [NormalizedName], [ConcurrencyStamp]) VALUES (N'a8acf968-0419-4386-a36e-9e556ac86448', N'Hasta Modülü » Reçete Ekranı.Create', N'HASTA MODÜLÜ » REÇETE EKRANı.CREATE', N'd93e63c8-3990-4f94-9ce9-af0d75b1485f')
INSERT [dbo].[AspNetRoles] ([Id], [Name], [NormalizedName], [ConcurrencyStamp]) VALUES (N'af4b7d43-d040-4a3d-87d9-13be703107d2', N'Hasta Modülü » Görüntü Ekranı.Read', N'HASTA MODÜLÜ » GÖRÜNTÜ EKRANı.READ', N'13eda0a0-bf3f-45cd-993d-519ee5b81918')
INSERT [dbo].[AspNetRoles] ([Id], [Name], [NormalizedName], [ConcurrencyStamp]) VALUES (N'b888229b-bfde-4f7c-be31-d157fbbe48ad', N'Muhasebe » Gider Ekranı.Update', N'MUHASEBE » GIDER EKRANı.UPDATE', N'0660c68f-1a4a-446d-82bd-edc01dbd0f69')
INSERT [dbo].[AspNetRoles] ([Id], [Name], [NormalizedName], [ConcurrencyStamp]) VALUES (N'c89ccacc-20f9-46c2-97ce-b9fef240b022', N'Hasta Modülü » Tedavi Ekranı.Update', N'HASTA MODÜLÜ » TEDAVI EKRANı.UPDATE', N'fa7d1fc0-71c7-44b6-b235-2901ce5a5c6c')
INSERT [dbo].[AspNetRoles] ([Id], [Name], [NormalizedName], [ConcurrencyStamp]) VALUES (N'd7951175-e878-4bbd-98d0-562afe720012', N'Hasta Modülü » Hasta Ekranı.Delete', N'HASTA MODÜLÜ » HASTA EKRANı.DELETE', N'b08e0894-3d0d-4c76-939d-3917abf31b44')
INSERT [dbo].[AspNetRoles] ([Id], [Name], [NormalizedName], [ConcurrencyStamp]) VALUES (N'df500db9-32ea-4db0-bc0c-ff29091a2f64', N'Hasta Modülü » Görüntü Ekranı.Create', N'HASTA MODÜLÜ » GÖRÜNTÜ EKRANı.CREATE', N'5780ec0b-403c-48d2-9af0-76cccf49d6de')
INSERT [dbo].[AspNetRoles] ([Id], [Name], [NormalizedName], [ConcurrencyStamp]) VALUES (N'e145d1d1-d946-4c24-8243-d27b2cfe965a', N'Hasta Modülü » Hasta Ekranı.Update', N'HASTA MODÜLÜ » HASTA EKRANı.UPDATE', N'acc6e2e8-ce2b-4a52-8fef-b17b78737338')
INSERT [dbo].[AspNetRoles] ([Id], [Name], [NormalizedName], [ConcurrencyStamp]) VALUES (N'ec2fb28d-1f89-4d98-9eb4-6063e645a9b2', N'Hasta Modülü.Read', N'HASTA MODÜLÜ.READ', N'aabedb63-8731-466a-a3db-c3df4015e3fa')
INSERT [dbo].[AspNetRoles] ([Id], [Name], [NormalizedName], [ConcurrencyStamp]) VALUES (N'ed287dc4-4c9f-4cf6-a648-c7368fe9317b', N'Hasta Modülü » Fatura Ekranı.Read', N'HASTA MODÜLÜ » FATURA EKRANı.READ', N'ca8f449b-d60b-4ce8-a58b-fb222d646b57')
INSERT [dbo].[AspNetRoles] ([Id], [Name], [NormalizedName], [ConcurrencyStamp]) VALUES (N'ed4b7569-8ab4-41f1-8860-94228237b855', N'Laboratuvar » Laboratuvar Ekranı.Read', N'LABORATUVAR » LABORATUVAR EKRANı.READ', N'5480ea64-cf54-46b1-8e53-4c391215db93')
INSERT [dbo].[AspNetRoles] ([Id], [Name], [NormalizedName], [ConcurrencyStamp]) VALUES (N'f46bb39c-0097-44a8-9fed-bde8a8009f9c', N'Hasta Modülü » Hasta Ekranı.Create', N'HASTA MODÜLÜ » HASTA EKRANı.CREATE', N'b82b1d35-5b63-4282-91e5-86a1264f86cb')
GO
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'e406b078-66e8-4745-97b2-195c7cec2a48', N'156b5674-2253-4f5d-8d3b-aed9fbc63204')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'e406b078-66e8-4745-97b2-195c7cec2a48', N'3153ac1a-cee4-4458-ae86-b795c8dfb5d9')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'e406b078-66e8-4745-97b2-195c7cec2a48', N'73aa4fa3-7f0f-4367-a973-b11e8325f33c')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'e406b078-66e8-4745-97b2-195c7cec2a48', N'73b66b7e-e633-4282-bff7-3203dd589f00')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'e406b078-66e8-4745-97b2-195c7cec2a48', N'7472708e-b010-4e45-884a-b5274cc7600e')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'e406b078-66e8-4745-97b2-195c7cec2a48', N'd7951175-e878-4bbd-98d0-562afe720012')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'e406b078-66e8-4745-97b2-195c7cec2a48', N'e145d1d1-d946-4c24-8243-d27b2cfe965a')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'e406b078-66e8-4745-97b2-195c7cec2a48', N'ec2fb28d-1f89-4d98-9eb4-6063e645a9b2')
GO
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'322cf304-d8fe-45d4-b5f8-ff63207179e9', N'test', N'TEST', N'test@test.com', N'TEST@TEST.COM', 1, N'AQAAAAEAACcQAAAAEDsDCoB4tYdWHc1cO4jUCL+ZjjtcePFHkRoa+XMYV0f1QkLg42V7IJNr6opBLt4m2g==', N'LXRD5WYTKHHUFOTSLZFQQJKCZTNCJ6NZ', N'987d2f1e-f57e-4745-b5f7-7a74e1420a7d', N'05301137203', 0, 0, NULL, 1, 0)
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'e406b078-66e8-4745-97b2-195c7cec2a48', N'admin', N'ADMIN', N'ulucer@hotmail.com', N'ULUCER@HOTMAIL.COM', 1, N'AQAAAAEAACcQAAAAEPIedoaAnTc7F8hML69EtiV4YsmKzdtJi3pT0+7MYwLcDRFF4EC7E2SUKYw2Jr9oRQ==', N'EQZPB32HOU57LWSOX2YVBRKNQ6LY3HT6', N'c8eb43f7-56a3-46b7-b951-7193f71200f6', N'05301137203', 0, 0, NULL, 1, 0)
GO
SET IDENTITY_INSERT [dbo].[DiagnozCategories] ON 

INSERT [dbo].[DiagnozCategories] ([Id], [CategoryName]) VALUES (1, N'Cerrahi')
INSERT [dbo].[DiagnozCategories] ([Id], [CategoryName]) VALUES (2, N'Endodonti')
INSERT [dbo].[DiagnozCategories] ([Id], [CategoryName]) VALUES (3, N'Oral Diagnoz')
INSERT [dbo].[DiagnozCategories] ([Id], [CategoryName]) VALUES (4, N'Ortodonti')
INSERT [dbo].[DiagnozCategories] ([Id], [CategoryName]) VALUES (5, N'Pedodonti')
INSERT [dbo].[DiagnozCategories] ([Id], [CategoryName]) VALUES (6, N'Periodontoloji')
INSERT [dbo].[DiagnozCategories] ([Id], [CategoryName]) VALUES (7, N'Protez')
INSERT [dbo].[DiagnozCategories] ([Id], [CategoryName]) VALUES (8, N'Restoratif')
SET IDENTITY_INSERT [dbo].[DiagnozCategories] OFF
GO
SET IDENTITY_INSERT [dbo].[DiagnozLists] ON 

INSERT [dbo].[DiagnozLists] ([Id], [Name], [DiagnozCategories_Id_Fk]) VALUES (1, N'Amputasyon (Dolgu Hariç)', 5)
INSERT [dbo].[DiagnozLists] ([Id], [Name], [DiagnozCategories_Id_Fk]) VALUES (2, N'Sabit Yer Tutucu', 5)
INSERT [dbo].[DiagnozLists] ([Id], [Name], [DiagnozCategories_Id_Fk]) VALUES (3, N'Hareketli Yer Tutucu', 5)
INSERT [dbo].[DiagnozLists] ([Id], [Name], [DiagnozCategories_Id_Fk]) VALUES (4, N'Süt Dişinde Kanal Tedavisi', 5)
INSERT [dbo].[DiagnozLists] ([Id], [Name], [DiagnozCategories_Id_Fk]) VALUES (6, N'Kayıp Diş', 1)
INSERT [dbo].[DiagnozLists] ([Id], [Name], [DiagnozCategories_Id_Fk]) VALUES (7, N'Çene Kırığı', 1)
INSERT [dbo].[DiagnozLists] ([Id], [Name], [DiagnozCategories_Id_Fk]) VALUES (8, N'Tek Köklü Reimplantasyon', 1)
INSERT [dbo].[DiagnozLists] ([Id], [Name], [DiagnozCategories_Id_Fk]) VALUES (9, N'Çok Köklü Reimplantasyon', 1)
INSERT [dbo].[DiagnozLists] ([Id], [Name], [DiagnozCategories_Id_Fk]) VALUES (10, N'İmplant', 1)
INSERT [dbo].[DiagnozLists] ([Id], [Name], [DiagnozCategories_Id_Fk]) VALUES (11, N'Apikal Rezeksiyon', 1)
INSERT [dbo].[DiagnozLists] ([Id], [Name], [DiagnozCategories_Id_Fk]) VALUES (12, N'Mine Çatlağı', 1)
INSERT [dbo].[DiagnozLists] ([Id], [Name], [DiagnozCategories_Id_Fk]) VALUES (13, N'Lüxe Diş', 1)
INSERT [dbo].[DiagnozLists] ([Id], [Name], [DiagnozCategories_Id_Fk]) VALUES (14, N'Radix', 1)
INSERT [dbo].[DiagnozLists] ([Id], [Name], [DiagnozCategories_Id_Fk]) VALUES (15, N'Gömülü Diş', 1)
INSERT [dbo].[DiagnozLists] ([Id], [Name], [DiagnozCategories_Id_Fk]) VALUES (16, N'Kret', 1)
INSERT [dbo].[DiagnozLists] ([Id], [Name], [DiagnozCategories_Id_Fk]) VALUES (17, N'Kök Rezorpsiyonu', 1)
INSERT [dbo].[DiagnozLists] ([Id], [Name], [DiagnozCategories_Id_Fk]) VALUES (18, N'Operasyon', 1)
INSERT [dbo].[DiagnozLists] ([Id], [Name], [DiagnozCategories_Id_Fk]) VALUES (19, N'Alveolitis', 1)
INSERT [dbo].[DiagnozLists] ([Id], [Name], [DiagnozCategories_Id_Fk]) VALUES (20, N'Yumuşak Doku Lezyonu', 1)
INSERT [dbo].[DiagnozLists] ([Id], [Name], [DiagnozCategories_Id_Fk]) VALUES (21, N'Eklem Patolojisi', 1)
INSERT [dbo].[DiagnozLists] ([Id], [Name], [DiagnozCategories_Id_Fk]) VALUES (22, N'Kanal Tedavi', 2)
INSERT [dbo].[DiagnozLists] ([Id], [Name], [DiagnozCategories_Id_Fk]) VALUES (23, N'Kötü Kanal Tedavisi', 2)
INSERT [dbo].[DiagnozLists] ([Id], [Name], [DiagnozCategories_Id_Fk]) VALUES (24, N'Granülom', 2)
INSERT [dbo].[DiagnozLists] ([Id], [Name], [DiagnozCategories_Id_Fk]) VALUES (25, N'Perfore Pulpa (Kırık Nedeniyle)', 2)
INSERT [dbo].[DiagnozLists] ([Id], [Name], [DiagnozCategories_Id_Fk]) VALUES (26, N'Kalsifiye Kanal', 2)
INSERT [dbo].[DiagnozLists] ([Id], [Name], [DiagnozCategories_Id_Fk]) VALUES (27, N'Endodontik Fistül', 2)
INSERT [dbo].[DiagnozLists] ([Id], [Name], [DiagnozCategories_Id_Fk]) VALUES (28, N'Pulpitis', 2)
INSERT [dbo].[DiagnozLists] ([Id], [Name], [DiagnozCategories_Id_Fk]) VALUES (29, N'Apikal Apse', 2)
INSERT [dbo].[DiagnozLists] ([Id], [Name], [DiagnozCategories_Id_Fk]) VALUES (30, N'Dişeti Apsesi', 2)
INSERT [dbo].[DiagnozLists] ([Id], [Name], [DiagnozCategories_Id_Fk]) VALUES (31, N'Gangren', 2)
INSERT [dbo].[DiagnozLists] ([Id], [Name], [DiagnozCategories_Id_Fk]) VALUES (32, N'Panoramik Film', 3)
INSERT [dbo].[DiagnozLists] ([Id], [Name], [DiagnozCategories_Id_Fk]) VALUES (33, N'Oral Solunum', 4)
INSERT [dbo].[DiagnozLists] ([Id], [Name], [DiagnozCategories_Id_Fk]) VALUES (34, N'Ortodontik Tedavi', 4)
INSERT [dbo].[DiagnozLists] ([Id], [Name], [DiagnozCategories_Id_Fk]) VALUES (35, N'Açık Kapanış (Open-Bıte)', 4)
INSERT [dbo].[DiagnozLists] ([Id], [Name], [DiagnozCategories_Id_Fk]) VALUES (36, N'Derin Kapanış (Over/Deep-Bıte)', 4)
INSERT [dbo].[DiagnozLists] ([Id], [Name], [DiagnozCategories_Id_Fk]) VALUES (37, N'Çapraz Kapanış (Cross-Bıte)', 4)
INSERT [dbo].[DiagnozLists] ([Id], [Name], [DiagnozCategories_Id_Fk]) VALUES (38, N'Overjet', 4)
INSERT [dbo].[DiagnozLists] ([Id], [Name], [DiagnozCategories_Id_Fk]) VALUES (39, N'Deviasyon', 4)
INSERT [dbo].[DiagnozLists] ([Id], [Name], [DiagnozCategories_Id_Fk]) VALUES (40, N'Maksiller Darlık', 4)
INSERT [dbo].[DiagnozLists] ([Id], [Name], [DiagnozCategories_Id_Fk]) VALUES (41, N'Apeksi Kapanmamış Dişte Kanal Tedavisi', 5)
INSERT [dbo].[DiagnozLists] ([Id], [Name], [DiagnozCategories_Id_Fk]) VALUES (42, N'Fissür Örtülmesi', 5)
INSERT [dbo].[DiagnozLists] ([Id], [Name], [DiagnozCategories_Id_Fk]) VALUES (43, N'Prefabrike Kuron', 5)
INSERT [dbo].[DiagnozLists] ([Id], [Name], [DiagnozCategories_Id_Fk]) VALUES (44, N'Çocuk Protezi (Akrilik-Bölümlü-Tek Çene)', 5)
INSERT [dbo].[DiagnozLists] ([Id], [Name], [DiagnozCategories_Id_Fk]) VALUES (45, N'Çocuk Protezi (Akrilik-Tam-Tek Çene)', 5)
INSERT [dbo].[DiagnozLists] ([Id], [Name], [DiagnozCategories_Id_Fk]) VALUES (46, N'Strip Kuron', 5)
INSERT [dbo].[DiagnozLists] ([Id], [Name], [DiagnozCategories_Id_Fk]) VALUES (47, N'Gingivitis', 6)
INSERT [dbo].[DiagnozLists] ([Id], [Name], [DiagnozCategories_Id_Fk]) VALUES (48, N'Periodontitis', 6)
INSERT [dbo].[DiagnozLists] ([Id], [Name], [DiagnozCategories_Id_Fk]) VALUES (49, N'Periodontal Fistül', 6)
INSERT [dbo].[DiagnozLists] ([Id], [Name], [DiagnozCategories_Id_Fk]) VALUES (50, N'Periodontal Apse', 6)
INSERT [dbo].[DiagnozLists] ([Id], [Name], [DiagnozCategories_Id_Fk]) VALUES (51, N'Periodontal Splint (Sabit)', 6)
INSERT [dbo].[DiagnozLists] ([Id], [Name], [DiagnozCategories_Id_Fk]) VALUES (52, N'Periodontal Splint (Hareketli)', 6)
INSERT [dbo].[DiagnozLists] ([Id], [Name], [DiagnozCategories_Id_Fk]) VALUES (53, N'Tam Protez (Akrilik)', 7)
INSERT [dbo].[DiagnozLists] ([Id], [Name], [DiagnozCategories_Id_Fk]) VALUES (54, N'Bölümlü Protez (Metal)', 7)
INSERT [dbo].[DiagnozLists] ([Id], [Name], [DiagnozCategories_Id_Fk]) VALUES (55, N'Tam Protez (Metal)', 7)
INSERT [dbo].[DiagnozLists] ([Id], [Name], [DiagnozCategories_Id_Fk]) VALUES (56, N'Bölümlü Protez (Akrilik)', 7)
INSERT [dbo].[DiagnozLists] ([Id], [Name], [DiagnozCategories_Id_Fk]) VALUES (57, N'Kuron Akrilik', 7)
INSERT [dbo].[DiagnozLists] ([Id], [Name], [DiagnozCategories_Id_Fk]) VALUES (58, N'Kuron Seramik', 7)
INSERT [dbo].[DiagnozLists] ([Id], [Name], [DiagnozCategories_Id_Fk]) VALUES (59, N'Laminate Veneer Seramik Kuron', 7)
INSERT [dbo].[DiagnozLists] ([Id], [Name], [DiagnozCategories_Id_Fk]) VALUES (60, N'Döküm Post Core', 7)
INSERT [dbo].[DiagnozLists] ([Id], [Name], [DiagnozCategories_Id_Fk]) VALUES (61, N'Gece Plağı (Yumuşak)', 7)
INSERT [dbo].[DiagnozLists] ([Id], [Name], [DiagnozCategories_Id_Fk]) VALUES (62, N'Gece Plağı-Okluzal Splint (Sert)', 7)
INSERT [dbo].[DiagnozLists] ([Id], [Name], [DiagnozCategories_Id_Fk]) VALUES (63, N'Laminate Veneer Kompozit', 7)
INSERT [dbo].[DiagnozLists] ([Id], [Name], [DiagnozCategories_Id_Fk]) VALUES (64, N'Hassas Tutucu', 7)
INSERT [dbo].[DiagnozLists] ([Id], [Name], [DiagnozCategories_Id_Fk]) VALUES (65, N'Kuron Full Metal', 7)
INSERT [dbo].[DiagnozLists] ([Id], [Name], [DiagnozCategories_Id_Fk]) VALUES (66, N'Maryland Köprü', 7)
INSERT [dbo].[DiagnozLists] ([Id], [Name], [DiagnozCategories_Id_Fk]) VALUES (67, N'İmplant Destekli Haraketli Protez', 7)
INSERT [dbo].[DiagnozLists] ([Id], [Name], [DiagnozCategories_Id_Fk]) VALUES (68, N'Roch Köprü', 7)
INSERT [dbo].[DiagnozLists] ([Id], [Name], [DiagnozCategories_Id_Fk]) VALUES (69, N'Kompozit Dolgu - O', 8)
INSERT [dbo].[DiagnozLists] ([Id], [Name], [DiagnozCategories_Id_Fk]) VALUES (70, N'Kompozit Dolgu - COLE', 8)
INSERT [dbo].[DiagnozLists] ([Id], [Name], [DiagnozCategories_Id_Fk]) VALUES (71, N'Kompozit Dolgu - OD', 8)
INSERT [dbo].[DiagnozLists] ([Id], [Name], [DiagnozCategories_Id_Fk]) VALUES (72, N'Kompozit Dolgu - OM', 8)
INSERT [dbo].[DiagnozLists] ([Id], [Name], [DiagnozCategories_Id_Fk]) VALUES (73, N'Kompozit Dolgu - MOD', 8)
INSERT [dbo].[DiagnozLists] ([Id], [Name], [DiagnozCategories_Id_Fk]) VALUES (74, N'Amalgam Dolgu - O', 8)
INSERT [dbo].[DiagnozLists] ([Id], [Name], [DiagnozCategories_Id_Fk]) VALUES (75, N'Amalgam Dolgu - COLE', 8)
INSERT [dbo].[DiagnozLists] ([Id], [Name], [DiagnozCategories_Id_Fk]) VALUES (76, N'Amalgam Dolgu - OD', 8)
INSERT [dbo].[DiagnozLists] ([Id], [Name], [DiagnozCategories_Id_Fk]) VALUES (77, N'Amalgam Dolgu - OM', 8)
INSERT [dbo].[DiagnozLists] ([Id], [Name], [DiagnozCategories_Id_Fk]) VALUES (78, N'Amalgam Dolgu - MOD', 8)
INSERT [dbo].[DiagnozLists] ([Id], [Name], [DiagnozCategories_Id_Fk]) VALUES (79, N'İnley Dolgu - O', 8)
INSERT [dbo].[DiagnozLists] ([Id], [Name], [DiagnozCategories_Id_Fk]) VALUES (80, N'İnley Dolgu - COLE', 8)
INSERT [dbo].[DiagnozLists] ([Id], [Name], [DiagnozCategories_Id_Fk]) VALUES (81, N'İnley Dolgu - OD', 8)
INSERT [dbo].[DiagnozLists] ([Id], [Name], [DiagnozCategories_Id_Fk]) VALUES (82, N'İnley Dolgu - OM', 8)
INSERT [dbo].[DiagnozLists] ([Id], [Name], [DiagnozCategories_Id_Fk]) VALUES (83, N'İnley Dolgu - MOD', 8)
INSERT [dbo].[DiagnozLists] ([Id], [Name], [DiagnozCategories_Id_Fk]) VALUES (84, N'Cam İonomer Dolgu - O', 8)
INSERT [dbo].[DiagnozLists] ([Id], [Name], [DiagnozCategories_Id_Fk]) VALUES (85, N'Cam İonomer Dolgu - COLE', 8)
INSERT [dbo].[DiagnozLists] ([Id], [Name], [DiagnozCategories_Id_Fk]) VALUES (86, N'Cam İonomer Dolgu - OD', 8)
INSERT [dbo].[DiagnozLists] ([Id], [Name], [DiagnozCategories_Id_Fk]) VALUES (87, N'Cam İonomer Dolgu - OM', 8)
INSERT [dbo].[DiagnozLists] ([Id], [Name], [DiagnozCategories_Id_Fk]) VALUES (88, N'Cam İonomer Dolgu - MOD', 8)
INSERT [dbo].[DiagnozLists] ([Id], [Name], [DiagnozCategories_Id_Fk]) VALUES (89, N'Kuafaj', 8)
INSERT [dbo].[DiagnozLists] ([Id], [Name], [DiagnozCategories_Id_Fk]) VALUES (90, N'Kanal İçi Post Uygulaması', 8)
INSERT [dbo].[DiagnozLists] ([Id], [Name], [DiagnozCategories_Id_Fk]) VALUES (91, N'Dentin Pimi (D)', 8)
INSERT [dbo].[DiagnozLists] ([Id], [Name], [DiagnozCategories_Id_Fk]) VALUES (92, N'Dentin Pimi (M)', 8)
INSERT [dbo].[DiagnozLists] ([Id], [Name], [DiagnozCategories_Id_Fk]) VALUES (93, N'Kırık Diş', 8)
INSERT [dbo].[DiagnozLists] ([Id], [Name], [DiagnozCategories_Id_Fk]) VALUES (94, N'Caries (O)', 8)
INSERT [dbo].[DiagnozLists] ([Id], [Name], [DiagnozCategories_Id_Fk]) VALUES (95, N'Caries (D)', 8)
INSERT [dbo].[DiagnozLists] ([Id], [Name], [DiagnozCategories_Id_Fk]) VALUES (96, N'Caries (M)', 8)
INSERT [dbo].[DiagnozLists] ([Id], [Name], [DiagnozCategories_Id_Fk]) VALUES (97, N'Caries (Do)', 8)
INSERT [dbo].[DiagnozLists] ([Id], [Name], [DiagnozCategories_Id_Fk]) VALUES (98, N'Caries (Mo)', 8)
INSERT [dbo].[DiagnozLists] ([Id], [Name], [DiagnozCategories_Id_Fk]) VALUES (99, N'Caries (Mod)', 8)
INSERT [dbo].[DiagnozLists] ([Id], [Name], [DiagnozCategories_Id_Fk]) VALUES (100, N'Cole Caries', 8)
GO
INSERT [dbo].[DiagnozLists] ([Id], [Name], [DiagnozCategories_Id_Fk]) VALUES (101, N'Seconder Caries', 8)
INSERT [dbo].[DiagnozLists] ([Id], [Name], [DiagnozCategories_Id_Fk]) VALUES (102, N'Mine Hipoplazisi', 8)
INSERT [dbo].[DiagnozLists] ([Id], [Name], [DiagnozCategories_Id_Fk]) VALUES (103, N'Diş Renklenmesi', 8)
INSERT [dbo].[DiagnozLists] ([Id], [Name], [DiagnozCategories_Id_Fk]) VALUES (104, N'Kırık Veya Düşmüş Dolgu', 8)
INSERT [dbo].[DiagnozLists] ([Id], [Name], [DiagnozCategories_Id_Fk]) VALUES (105, N'Abrazyon', 8)
SET IDENTITY_INSERT [dbo].[DiagnozLists] OFF
GO
INSERT [dbo].[RoleTableIndexs] ([RoleId], [TableIndex]) VALUES (N'0110e032-6f8b-4540-91b6-dea0510d74de', 18.1)
INSERT [dbo].[RoleTableIndexs] ([RoleId], [TableIndex]) VALUES (N'035253eb-9562-4d4f-9244-7ba51b6cd2c5', 5.2)
INSERT [dbo].[RoleTableIndexs] ([RoleId], [TableIndex]) VALUES (N'03c0b97c-070d-49db-a4eb-8755ded55fa9', 6.2)
INSERT [dbo].[RoleTableIndexs] ([RoleId], [TableIndex]) VALUES (N'0626ee18-58a0-4bd6-9820-09538faf9b8a', 4.2)
INSERT [dbo].[RoleTableIndexs] ([RoleId], [TableIndex]) VALUES (N'09d429ef-714e-430b-a0b3-1e6abb68e195', 14.1)
INSERT [dbo].[RoleTableIndexs] ([RoleId], [TableIndex]) VALUES (N'0aab64f6-68a5-4da2-bd1f-22ae2aebd8e2', 7.1)
INSERT [dbo].[RoleTableIndexs] ([RoleId], [TableIndex]) VALUES (N'156b5674-2253-4f5d-8d3b-aed9fbc63204', 1.1)
INSERT [dbo].[RoleTableIndexs] ([RoleId], [TableIndex]) VALUES (N'172edc6e-ffd6-4203-acdb-311139aacbc3', 7.4)
INSERT [dbo].[RoleTableIndexs] ([RoleId], [TableIndex]) VALUES (N'197064f2-b96e-41c1-9a9d-5bf7b5c0e04d', 12.3)
INSERT [dbo].[RoleTableIndexs] ([RoleId], [TableIndex]) VALUES (N'1af294e4-3c18-491d-a8f6-ec1ad0be4fb4', 9.3)
INSERT [dbo].[RoleTableIndexs] ([RoleId], [TableIndex]) VALUES (N'1d677329-152d-41b4-9697-0031021e3d74', 11.1)
INSERT [dbo].[RoleTableIndexs] ([RoleId], [TableIndex]) VALUES (N'240efd1f-845a-44b4-88c3-4877f267e7fd', 1.7)
INSERT [dbo].[RoleTableIndexs] ([RoleId], [TableIndex]) VALUES (N'3153ac1a-cee4-4458-ae86-b795c8dfb5d9', 10.1)
INSERT [dbo].[RoleTableIndexs] ([RoleId], [TableIndex]) VALUES (N'3a69077c-ba86-4e85-8f3f-531e2bbcd377', 17.1)
INSERT [dbo].[RoleTableIndexs] ([RoleId], [TableIndex]) VALUES (N'3be44651-0538-4323-9d35-5d4f46750d33', 6.3)
INSERT [dbo].[RoleTableIndexs] ([RoleId], [TableIndex]) VALUES (N'43a0133b-f2f8-427f-9f71-04a79fc2e835', 13.4)
INSERT [dbo].[RoleTableIndexs] ([RoleId], [TableIndex]) VALUES (N'45de340f-caf7-40d4-8150-565dd409ef5c', 8.4)
INSERT [dbo].[RoleTableIndexs] ([RoleId], [TableIndex]) VALUES (N'4657fdc1-efd8-4d25-aede-b2d6c872208b', 8.3)
INSERT [dbo].[RoleTableIndexs] ([RoleId], [TableIndex]) VALUES (N'4664e163-67f6-439b-a9eb-32f01dc02498', 9.2)
INSERT [dbo].[RoleTableIndexs] ([RoleId], [TableIndex]) VALUES (N'4f692d23-7062-4335-875c-643bdcc5efc0', 5.4)
INSERT [dbo].[RoleTableIndexs] ([RoleId], [TableIndex]) VALUES (N'52164f00-f9d3-4ead-b577-c0bc74a1a81e', 16.1)
INSERT [dbo].[RoleTableIndexs] ([RoleId], [TableIndex]) VALUES (N'5d4a127b-1c17-4903-9237-e4ac8fb0bfce', 5.3)
INSERT [dbo].[RoleTableIndexs] ([RoleId], [TableIndex]) VALUES (N'64d4a440-7364-492c-a9a4-d102037ba528', 12.2)
INSERT [dbo].[RoleTableIndexs] ([RoleId], [TableIndex]) VALUES (N'6cceba20-18e7-48da-81ad-24f269a51fb0', 15.1)
INSERT [dbo].[RoleTableIndexs] ([RoleId], [TableIndex]) VALUES (N'70a5575f-158f-4e2c-bbb6-12393c0b1f95', 13.2)
INSERT [dbo].[RoleTableIndexs] ([RoleId], [TableIndex]) VALUES (N'72e4f7b6-cda0-4a07-9c20-5730c670cd88', 5.1)
INSERT [dbo].[RoleTableIndexs] ([RoleId], [TableIndex]) VALUES (N'73aa4fa3-7f0f-4367-a973-b11e8325f33c', 4.1)
INSERT [dbo].[RoleTableIndexs] ([RoleId], [TableIndex]) VALUES (N'73b66b7e-e633-4282-bff7-3203dd589f00', 9.1)
INSERT [dbo].[RoleTableIndexs] ([RoleId], [TableIndex]) VALUES (N'7472708e-b010-4e45-884a-b5274cc7600e', 3.1)
INSERT [dbo].[RoleTableIndexs] ([RoleId], [TableIndex]) VALUES (N'7c70c001-b2f8-49df-bc04-b339d935831d', 19.1)
INSERT [dbo].[RoleTableIndexs] ([RoleId], [TableIndex]) VALUES (N'9535ca4b-e95d-4934-82d9-cf2293dee94f', 12.4)
INSERT [dbo].[RoleTableIndexs] ([RoleId], [TableIndex]) VALUES (N'9fbbfc2c-ce26-46f2-9fcd-29683c3cc563', 7.3)
INSERT [dbo].[RoleTableIndexs] ([RoleId], [TableIndex]) VALUES (N'a0b50dc9-0571-408c-a0c4-d6d69e2a2046', 13.1)
INSERT [dbo].[RoleTableIndexs] ([RoleId], [TableIndex]) VALUES (N'a153e2bd-fa2f-4ab1-8711-c5bb850ad965', 4.4)
INSERT [dbo].[RoleTableIndexs] ([RoleId], [TableIndex]) VALUES (N'a6566623-6618-4da6-bed4-4c09c2e3859c', 6.4)
INSERT [dbo].[RoleTableIndexs] ([RoleId], [TableIndex]) VALUES (N'a7a734b7-7e2d-43ba-ab70-dc127bfce512', 9.4)
INSERT [dbo].[RoleTableIndexs] ([RoleId], [TableIndex]) VALUES (N'a8acf968-0419-4386-a36e-9e556ac86448', 7.2)
INSERT [dbo].[RoleTableIndexs] ([RoleId], [TableIndex]) VALUES (N'af4b7d43-d040-4a3d-87d9-13be703107d2', 8.1)
INSERT [dbo].[RoleTableIndexs] ([RoleId], [TableIndex]) VALUES (N'b888229b-bfde-4f7c-be31-d157fbbe48ad', 13.3)
INSERT [dbo].[RoleTableIndexs] ([RoleId], [TableIndex]) VALUES (N'c89ccacc-20f9-46c2-97ce-b9fef240b022', 4.3)
INSERT [dbo].[RoleTableIndexs] ([RoleId], [TableIndex]) VALUES (N'd7951175-e878-4bbd-98d0-562afe720012', 3.4)
INSERT [dbo].[RoleTableIndexs] ([RoleId], [TableIndex]) VALUES (N'df500db9-32ea-4db0-bc0c-ff29091a2f64', 8.2)
INSERT [dbo].[RoleTableIndexs] ([RoleId], [TableIndex]) VALUES (N'e145d1d1-d946-4c24-8243-d27b2cfe965a', 3.3)
INSERT [dbo].[RoleTableIndexs] ([RoleId], [TableIndex]) VALUES (N'ec2fb28d-1f89-4d98-9eb4-6063e645a9b2', 2.1)
INSERT [dbo].[RoleTableIndexs] ([RoleId], [TableIndex]) VALUES (N'ed287dc4-4c9f-4cf6-a648-c7368fe9317b', 6.1)
INSERT [dbo].[RoleTableIndexs] ([RoleId], [TableIndex]) VALUES (N'ed4b7569-8ab4-41f1-8860-94228237b855', 12.1)
INSERT [dbo].[RoleTableIndexs] ([RoleId], [TableIndex]) VALUES (N'f46bb39c-0097-44a8-9fed-bde8a8009f9c', 3.2)
GO
SET IDENTITY_INSERT [dbo].[SubAccounts] ON 

INSERT [dbo].[SubAccounts] ([Id], [AspNetUsers_Id_Fk], [Accounts_AspNetUsersIdFk_Fk]) VALUES (1, N'ewwe', N'ewwe')
SET IDENTITY_INSERT [dbo].[SubAccounts] OFF
GO
SET IDENTITY_INSERT [dbo].[TDBCostLists] ON 

INSERT [dbo].[TDBCostLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [TDBCostNameCategories_Id_Fk]) VALUES (1, N'Dişhekimi Muayenesi', 291.6700, 8, 315.0000, 1)
INSERT [dbo].[TDBCostLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [TDBCostNameCategories_Id_Fk]) VALUES (2, N'Uzman Dişhekimi Muayenesi', 310.1900, 8, 335.0000, 1)
INSERT [dbo].[TDBCostLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [TDBCostNameCategories_Id_Fk]) VALUES (3, N'Kontrol Hekim Muayenesi', 259.2600, 8, 280.0000, 1)
INSERT [dbo].[TDBCostLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [TDBCostNameCategories_Id_Fk]) VALUES (4, N'Konsültasyon', 268.5200, 8, 290.0000, 1)
INSERT [dbo].[TDBCostLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [TDBCostNameCategories_Id_Fk]) VALUES (5, N'Uzman Dişhekimi Konsültasyonu', 291.6700, 8, 315.0000, 1)
INSERT [dbo].[TDBCostLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [TDBCostNameCategories_Id_Fk]) VALUES (6, N'Hipnoz (Seans Başına)', 796.3000, 8, 860.0000, 1)
INSERT [dbo].[TDBCostLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [TDBCostNameCategories_Id_Fk]) VALUES (7, N'Akupunktur Uygulama (Seans Başına)', 740.7400, 8, 800.0000, 1)
INSERT [dbo].[TDBCostLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [TDBCostNameCategories_Id_Fk]) VALUES (8, N'Teşhis ve Tedavi Planlaması', 439.8100, 8, 475.0000, 1)
INSERT [dbo].[TDBCostLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [TDBCostNameCategories_Id_Fk]) VALUES (9, N'Oral Hijyen Eğitimi', 240.7400, 8, 260.0000, 1)
INSERT [dbo].[TDBCostLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [TDBCostNameCategories_Id_Fk]) VALUES (10, N'Tükürük Akış Hızı ve Tamponlama Kapasitesi Tayini', 328.7000, 8, 355.0000, 1)
INSERT [dbo].[TDBCostLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [TDBCostNameCategories_Id_Fk]) VALUES (11, N'Tükürükte Mikrobiyolojik Analiz', 912.0400, 8, 985.0000, 1)
INSERT [dbo].[TDBCostLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [TDBCostNameCategories_Id_Fk]) VALUES (12, N'Gnatoloji, T.M.E. Kas Muayenesi (Oklüzyon Kontrolü)', 1217.5900, 8, 1315.0000, 1)
INSERT [dbo].[TDBCostLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [TDBCostNameCategories_Id_Fk]) VALUES (13, N'Vitalite Kontrolü (Diş Başına)', 50.9300, 8, 55.0000, 1)
INSERT [dbo].[TDBCostLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [TDBCostNameCategories_Id_Fk]) VALUES (14, N'Diş Röntgen Filmi (Periapikal)', 157.4100, 8, 170.0000, 1)
INSERT [dbo].[TDBCostLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [TDBCostNameCategories_Id_Fk]) VALUES (15, N'Oklüzal Film', 171.3000, 8, 185.0000, 1)
INSERT [dbo].[TDBCostLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [TDBCostNameCategories_Id_Fk]) VALUES (16, N'Bite - Wing Radyografi', 157.4100, 8, 170.0000, 1)
INSERT [dbo].[TDBCostLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [TDBCostNameCategories_Id_Fk]) VALUES (17, N'Ekstra Oral Röntgen Filmi', 203.7000, 8, 220.0000, 1)
INSERT [dbo].[TDBCostLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [TDBCostNameCategories_Id_Fk]) VALUES (18, N'Panoramik Film', 518.5200, 8, 560.0000, 1)
INSERT [dbo].[TDBCostLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [TDBCostNameCategories_Id_Fk]) VALUES (19, N'Lateral Sefalometrik Film', 523.1500, 8, 565.0000, 1)
INSERT [dbo].[TDBCostLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [TDBCostNameCategories_Id_Fk]) VALUES (20, N'Antero-Posterior Sefalometrik Film', 518.5200, 8, 560.0000, 1)
INSERT [dbo].[TDBCostLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [TDBCostNameCategories_Id_Fk]) VALUES (21, N'İntra Oral Dijital Radyografi', 231.4800, 8, 250.0000, 1)
INSERT [dbo].[TDBCostLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [TDBCostNameCategories_Id_Fk]) VALUES (22, N'El Bilek Filmi', 518.5200, 8, 560.0000, 1)
INSERT [dbo].[TDBCostLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [TDBCostNameCategories_Id_Fk]) VALUES (23, N'Siyalografi', 546.3000, 8, 590.0000, 1)
INSERT [dbo].[TDBCostLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [TDBCostNameCategories_Id_Fk]) VALUES (24, N'Tomografi (Bölgesel)', 541.6700, 8, 585.0000, 1)
INSERT [dbo].[TDBCostLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [TDBCostNameCategories_Id_Fk]) VALUES (25, N'Tomografi (Tek Çene)', 1384.2600, 8, 1495.0000, 1)
INSERT [dbo].[TDBCostLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [TDBCostNameCategories_Id_Fk]) VALUES (26, N'Tomografi (İki Çene Çene)', 1652.7800, 8, 1785.0000, 1)
INSERT [dbo].[TDBCostLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [TDBCostNameCategories_Id_Fk]) VALUES (27, N'Eklem Tomografisi (Çift Taraflı)', 2032.4100, 8, 2195.0000, 1)
INSERT [dbo].[TDBCostLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [TDBCostNameCategories_Id_Fk]) VALUES (28, N'Bilgisayarlı Büyük T.M.E. Fonksiyon Testi', 3550.9300, 8, 3835.0000, 1)
INSERT [dbo].[TDBCostLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [TDBCostNameCategories_Id_Fk]) VALUES (29, N'Bilgisayarlı Kas Tonus Analizi', 1601.8500, 8, 1730.0000, 1)
INSERT [dbo].[TDBCostLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [TDBCostNameCategories_Id_Fk]) VALUES (30, N'T.M.E. Filmi ve Tetkiki', 777.7800, 8, 840.0000, 1)
INSERT [dbo].[TDBCostLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [TDBCostNameCategories_Id_Fk]) VALUES (31, N'Lokal Anestezi (Enjeksiyon - İnfiltratif)', 69.4400, 8, 75.0000, 1)
INSERT [dbo].[TDBCostLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [TDBCostNameCategories_Id_Fk]) VALUES (32, N'Lokal Anestezi (Rejyonal)', 69.4400, 8, 75.0000, 1)
INSERT [dbo].[TDBCostLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [TDBCostNameCategories_Id_Fk]) VALUES (33, N'Raporlama', 143.5200, 8, 155.0000, 1)
INSERT [dbo].[TDBCostLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [TDBCostNameCategories_Id_Fk]) VALUES (34, N'Amalgam Dolgu (Bir Yüzlü)', 703.7000, 8, 760.0000, 2)
INSERT [dbo].[TDBCostLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [TDBCostNameCategories_Id_Fk]) VALUES (35, N'Amalgam Dolgu (İki Yüzlü)', 898.1500, 8, 970.0000, 2)
INSERT [dbo].[TDBCostLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [TDBCostNameCategories_Id_Fk]) VALUES (36, N'Amalgam Dolgu (Üç Yüzlü)', 1115.7400, 8, 1205.0000, 2)
INSERT [dbo].[TDBCostLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [TDBCostNameCategories_Id_Fk]) VALUES (37, N'Kompozit Dolgu (Bir Yüzlü)', 782.4100, 8, 845.0000, 2)
INSERT [dbo].[TDBCostLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [TDBCostNameCategories_Id_Fk]) VALUES (38, N'Kompozit Dolgu (İki Yüzlü)', 976.8500, 8, 1055.0000, 2)
INSERT [dbo].[TDBCostLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [TDBCostNameCategories_Id_Fk]) VALUES (39, N'Kompozit Dolgu (Üç Yüzlü)', 1212.9600, 8, 1310.0000, 2)
INSERT [dbo].[TDBCostLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [TDBCostNameCategories_Id_Fk]) VALUES (40, N'Direkt Kompozit Laminate Restorasyonu', 2115.7400, 8, 2285.0000, 2)
INSERT [dbo].[TDBCostLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [TDBCostNameCategories_Id_Fk]) VALUES (41, N'Black V Kole Dolgusu (Kompozit)', 643.5200, 8, 695.0000, 2)
INSERT [dbo].[TDBCostLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [TDBCostNameCategories_Id_Fk]) VALUES (42, N'Cam İonomer Dolgu', 597.2200, 8, 645.0000, 2)
INSERT [dbo].[TDBCostLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [TDBCostNameCategories_Id_Fk]) VALUES (43, N'Black V Kole Dolgusu (Cam İonomer)', 462.9600, 8, 500.0000, 2)
INSERT [dbo].[TDBCostLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [TDBCostNameCategories_Id_Fk]) VALUES (44, N'İnley Dolgu * (Bir Yüzlü)', 1592.5900, 8, 1720.0000, 2)
INSERT [dbo].[TDBCostLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [TDBCostNameCategories_Id_Fk]) VALUES (45, N'İnley Dolgu * (İki Yüzlü)', 1625.0000, 8, 1755.0000, 2)
INSERT [dbo].[TDBCostLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [TDBCostNameCategories_Id_Fk]) VALUES (46, N'İnley Dolgu * (Üç Yüzlü)', 1666.6700, 8, 1800.0000, 2)
INSERT [dbo].[TDBCostLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [TDBCostNameCategories_Id_Fk]) VALUES (47, N'Kompozit İnley Dolgu (Bir Yüzlü)', 1365.7400, 8, 1475.0000, 2)
INSERT [dbo].[TDBCostLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [TDBCostNameCategories_Id_Fk]) VALUES (48, N'Kompozit İnley Dolgu (İki Yüzlü)', 1523.1500, 8, 1645.0000, 2)
INSERT [dbo].[TDBCostLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [TDBCostNameCategories_Id_Fk]) VALUES (49, N'Kompozit İnley Dolgu (Üç Yüzlü)', 1662.0400, 8, 1795.0000, 2)
INSERT [dbo].[TDBCostLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [TDBCostNameCategories_Id_Fk]) VALUES (50, N'Seramik İnley Dolgu (Bir Yüzlü)', 4296.3000, 8, 4640.0000, 2)
INSERT [dbo].[TDBCostLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [TDBCostNameCategories_Id_Fk]) VALUES (51, N'Seramik İnley Dolgu (İki Yüzlü)', 5078.7000, 8, 5485.0000, 2)
INSERT [dbo].[TDBCostLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [TDBCostNameCategories_Id_Fk]) VALUES (52, N'Seramik İnley Dolgu (Üç Yüzlü)', 5462.9600, 8, 5900.0000, 2)
INSERT [dbo].[TDBCostLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [TDBCostNameCategories_Id_Fk]) VALUES (53, N'Onley *', 2092.5900, 8, 2260.0000, 2)
INSERT [dbo].[TDBCostLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [TDBCostNameCategories_Id_Fk]) VALUES (54, N'Onley * (Seramik)', 5347.2200, 8, 5775.0000, 2)
INSERT [dbo].[TDBCostLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [TDBCostNameCategories_Id_Fk]) VALUES (55, N'Pinley *', 2087.9600, 8, 2255.0000, 2)
INSERT [dbo].[TDBCostLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [TDBCostNameCategories_Id_Fk]) VALUES (56, N'Dolgu (Restorasyon) Tamiri', 773.1500, 8, 835.0000, 2)
INSERT [dbo].[TDBCostLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [TDBCostNameCategories_Id_Fk]) VALUES (57, N'Dolgu Sökümü (Tek Diş)', 212.9600, 8, 230.0000, 2)
INSERT [dbo].[TDBCostLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [TDBCostNameCategories_Id_Fk]) VALUES (58, N'Kuafaj (Dolgu Hariç)', 106.4800, 8, 115.0000, 2)
INSERT [dbo].[TDBCostLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [TDBCostNameCategories_Id_Fk]) VALUES (59, N'Ekstirpasyon (Her Kanal İçin)', 425.9300, 8, 460.0000, 2)
INSERT [dbo].[TDBCostLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [TDBCostNameCategories_Id_Fk]) VALUES (60, N'Kanal Tedavisi - Tek Kanal (Dolgu Hariç)', 1083.3300, 8, 1170.0000, 2)
INSERT [dbo].[TDBCostLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [TDBCostNameCategories_Id_Fk]) VALUES (61, N'Kanal Tedavisi - İki Kanal (Dolgu Hariç)', 1620.3700, 8, 1750.0000, 2)
INSERT [dbo].[TDBCostLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [TDBCostNameCategories_Id_Fk]) VALUES (62, N'Kanal Tedavisi - Üç Kanal (Dolgu Hariç)', 2212.9600, 8, 2390.0000, 2)
INSERT [dbo].[TDBCostLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [TDBCostNameCategories_Id_Fk]) VALUES (63, N'Kanal Tedavisi - İlave Her Kanal İçin', 601.8500, 8, 650.0000, 2)
INSERT [dbo].[TDBCostLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [TDBCostNameCategories_Id_Fk]) VALUES (64, N'Periapikal Lezyonlu Dişte Kanal Tedavisi - Tek Kanal (Dolgu Hariç)', 1125.0000, 8, 1215.0000, 2)
INSERT [dbo].[TDBCostLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [TDBCostNameCategories_Id_Fk]) VALUES (65, N'Periapikal Lezyonlu Dişte Kanal Tedavisi - İki Kanal (Dolgu Hariç)', 1662.0400, 8, 1795.0000, 2)
INSERT [dbo].[TDBCostLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [TDBCostNameCategories_Id_Fk]) VALUES (66, N'Periapikal Lezyonlu Dişte Kanal Tedavisi - Üç Kanal (Dolgu Hariç)', 2291.6700, 8, 2475.0000, 2)
INSERT [dbo].[TDBCostLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [TDBCostNameCategories_Id_Fk]) VALUES (67, N'Kanal Dolgusu Sökümü (Her Kanal İçin)', 449.0700, 8, 485.0000, 2)
INSERT [dbo].[TDBCostLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [TDBCostNameCategories_Id_Fk]) VALUES (68, N'Kanal Dolgusu Tekrarı (Retreatment - Her Kanal İçin - Dolgu Hariç)', 1032.4100, 8, 1115.0000, 2)
INSERT [dbo].[TDBCostLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [TDBCostNameCategories_Id_Fk]) VALUES (69, N'Kanal Pansumanı (Seans Başı)', 259.2600, 8, 280.0000, 2)
INSERT [dbo].[TDBCostLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [TDBCostNameCategories_Id_Fk]) VALUES (70, N'Kanal İçi Hazır Post Uygulaması (Metal) (Dolgu Ücreti Hariç)', 750.0000, 8, 810.0000, 2)
INSERT [dbo].[TDBCostLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [TDBCostNameCategories_Id_Fk]) VALUES (71, N'Kanal İçi Fiber Post Uygulaması (Dolgu Ücreti Hariç)', 1481.4800, 8, 1600.0000, 2)
INSERT [dbo].[TDBCostLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [TDBCostNameCategories_Id_Fk]) VALUES (72, N'Kanaldan Kırılmış Materyal Çıkartılması', 1523.1500, 8, 1645.0000, 2)
INSERT [dbo].[TDBCostLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [TDBCostNameCategories_Id_Fk]) VALUES (73, N'Kanalda Perforasyon Tamiri (MTA vb.)', 805.5600, 8, 870.0000, 2)
INSERT [dbo].[TDBCostLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [TDBCostNameCategories_Id_Fk]) VALUES (74, N'Dentin Pini Uygulaması (Her Pin Başına)', 148.1500, 8, 160.0000, 2)
INSERT [dbo].[TDBCostLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [TDBCostNameCategories_Id_Fk]) VALUES (75, N'Endokron', 2120.3700, 8, 2290.0000, 2)
INSERT [dbo].[TDBCostLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [TDBCostNameCategories_Id_Fk]) VALUES (76, N'Hassasiyet Tedavisi (Tek Diş)', 319.4400, 8, 345.0000, 2)
INSERT [dbo].[TDBCostLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [TDBCostNameCategories_Id_Fk]) VALUES (77, N'Hassasiyet Tedavisi (Tam Çene)', 935.1900, 8, 1010.0000, 2)
INSERT [dbo].[TDBCostLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [TDBCostNameCategories_Id_Fk]) VALUES (78, N'Diş Ağartma (Beyazlatma Vital Tek Diş En Çok 4 Adet) (Malzeme Ücreti Hariç)', 467.5900, 8, 505.0000, 2)
INSERT [dbo].[TDBCostLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [TDBCostNameCategories_Id_Fk]) VALUES (79, N'Diş Ağartma (Beyazlatma - Devital Tek Diş ) (Seans Başına - Dolgu Hariç)', 587.9600, 8, 635.0000, 2)
INSERT [dbo].[TDBCostLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [TDBCostNameCategories_Id_Fk]) VALUES (80, N'Diş Ağartma (Beyazlatma - Tek Çene) (Malzeme Ücreti Hariç)', 2787.0400, 8, 3010.0000, 2)
INSERT [dbo].[TDBCostLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [TDBCostNameCategories_Id_Fk]) VALUES (81, N'Rubber-Dam Uygulaması', 259.2600, 8, 280.0000, 2)
INSERT [dbo].[TDBCostLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [TDBCostNameCategories_Id_Fk]) VALUES (82, N'Aşındırma ile Sürme Rehberliği (Seans Başına)', 337.9600, 8, 365.0000, 3)
INSERT [dbo].[TDBCostLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [TDBCostNameCategories_Id_Fk]) VALUES (83, N'Fissür Örtülmesi (Sealant - Tek Diş)', 337.9600, 8, 365.0000, 3)
INSERT [dbo].[TDBCostLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [TDBCostNameCategories_Id_Fk]) VALUES (84, N'Yüzeysel Flor Uygulaması (Yarım Çene)', 370.3700, 8, 400.0000, 3)
INSERT [dbo].[TDBCostLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [TDBCostNameCategories_Id_Fk]) VALUES (85, N'Kompomer Dolgu', 842.5900, 8, 910.0000, 3)
INSERT [dbo].[TDBCostLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [TDBCostNameCategories_Id_Fk]) VALUES (86, N'Rezin İnfilitrasyonu Tedavisi', 1587.9600, 8, 1715.0000, 3)
INSERT [dbo].[TDBCostLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [TDBCostNameCategories_Id_Fk]) VALUES (87, N'Amputasyon (Dolgu-Kron Üst Yapı-Biyomateryal Hariç)', 879.6300, 8, 950.0000, 3)
INSERT [dbo].[TDBCostLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [TDBCostNameCategories_Id_Fk]) VALUES (88, N'Süt Dişi Kanal Tedavisi', 1356.4800, 8, 1465.0000, 3)
INSERT [dbo].[TDBCostLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [TDBCostNameCategories_Id_Fk]) VALUES (89, N'Açık Apeksli Dişte Kanal Tedavisi (Her Kanal İçin - Dolgu Hariç)(Pansuman Ücretleri Hariç)', 2953.7000, 8, 3190.0000, 3)
INSERT [dbo].[TDBCostLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [TDBCostNameCategories_Id_Fk]) VALUES (90, N'Açık Apeksli Dişte Apikal Bariyer (Her Kanal İçin - Dolgu ve Pansuman Ücretleri Hariç)', 1365.7400, 8, 1475.0000, 3)
INSERT [dbo].[TDBCostLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [TDBCostNameCategories_Id_Fk]) VALUES (91, N'Yer Tutucu (Sabit)', 1875.0000, 8, 2025.0000, 3)
INSERT [dbo].[TDBCostLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [TDBCostNameCategories_Id_Fk]) VALUES (92, N'Yer Tutucu (Hareketli)', 2189.8100, 8, 2365.0000, 3)
INSERT [dbo].[TDBCostLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [TDBCostNameCategories_Id_Fk]) VALUES (93, N'Prefabrike Kron *', 930.5600, 8, 1005.0000, 3)
INSERT [dbo].[TDBCostLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [TDBCostNameCategories_Id_Fk]) VALUES (94, N'Strip Kron', 912.0400, 8, 985.0000, 3)
INSERT [dbo].[TDBCostLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [TDBCostNameCategories_Id_Fk]) VALUES (95, N'Travma Splinti', 1703.7000, 8, 1840.0000, 3)
INSERT [dbo].[TDBCostLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [TDBCostNameCategories_Id_Fk]) VALUES (96, N'Çocuk Protezi', 1870.3700, 8, 2020.0000, 3)
INSERT [dbo].[TDBCostLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [TDBCostNameCategories_Id_Fk]) VALUES (97, N'Çocuk Protezi (Akrilik - Bölümlü - Tek Çene)', 4282.4100, 8, 4625.0000, 3)
INSERT [dbo].[TDBCostLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [TDBCostNameCategories_Id_Fk]) VALUES (98, N'Çocuk Protezi (Akrilik - Tam - Tek Çene)', 4685.1900, 8, 5060.0000, 3)
INSERT [dbo].[TDBCostLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [TDBCostNameCategories_Id_Fk]) VALUES (99, N'Tam Protez (Akrilik - Tek Çene)', 6550.9300, 8, 7075.0000, 4)
GO
INSERT [dbo].[TDBCostLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [TDBCostNameCategories_Id_Fk]) VALUES (100, N'Bölümlü Protez (Akrilik - Tek Çene)', 6356.4800, 8, 6865.0000, 4)
INSERT [dbo].[TDBCostLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [TDBCostNameCategories_Id_Fk]) VALUES (101, N'Tam Protez (Döküm Metal ile Güçlendirilmiş - Tek Çene)', 8453.7000, 8, 9130.0000, 4)
INSERT [dbo].[TDBCostLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [TDBCostNameCategories_Id_Fk]) VALUES (102, N'Bölümlü Protez (Döküm Metal ile Güçlendirilmiş - Tek Çene)', 8328.7000, 8, 8995.0000, 4)
INSERT [dbo].[TDBCostLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [TDBCostNameCategories_Id_Fk]) VALUES (103, N'Hassas Tutuculu Protezler (Hassas Tutucu Ücreti Hariç - Tek Çene)', 8842.5900, 8, 9550.0000, 4)
INSERT [dbo].[TDBCostLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [TDBCostNameCategories_Id_Fk]) VALUES (104, N'İmplant Destekli Hareketli Protezler (Hassas Tutucu Ücreti Hariç - Tek Çene)', 8120.3700, 8, 8770.0000, 4)
INSERT [dbo].[TDBCostLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [TDBCostNameCategories_Id_Fk]) VALUES (105, N'Geçici (İmmediat) Protez (Akrilik - Tek Çene)', 5638.8900, 8, 6090.0000, 4)
INSERT [dbo].[TDBCostLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [TDBCostNameCategories_Id_Fk]) VALUES (106, N'Besleme (Tek Çene)', 2365.7400, 8, 2555.0000, 4)
INSERT [dbo].[TDBCostLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [TDBCostNameCategories_Id_Fk]) VALUES (107, N'Kaide Yenileme (Rebazaj - Tek Çene)', 2842.5900, 8, 3070.0000, 4)
INSERT [dbo].[TDBCostLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [TDBCostNameCategories_Id_Fk]) VALUES (108, N'Proteze Yumuşak Akrilik Uygulaması (Geçici Tek Çene)', 1944.4400, 8, 2100.0000, 4)
INSERT [dbo].[TDBCostLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [TDBCostNameCategories_Id_Fk]) VALUES (109, N'Proteze Yumuşak Akrilik Uygulaması (Daimi Tek Çene)', 3615.7400, 8, 3905.0000, 4)
INSERT [dbo].[TDBCostLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [TDBCostNameCategories_Id_Fk]) VALUES (110, N'Tamir (Akrilik Protezler, Kırık veya Çatlak)', 1143.5200, 8, 1235.0000, 4)
INSERT [dbo].[TDBCostLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [TDBCostNameCategories_Id_Fk]) VALUES (111, N'Kroşe İlavesi', 1194.4400, 8, 1290.0000, 4)
INSERT [dbo].[TDBCostLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [TDBCostNameCategories_Id_Fk]) VALUES (112, N'Metal İskelet Tamiri', 1194.4400, 8, 1290.0000, 4)
INSERT [dbo].[TDBCostLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [TDBCostNameCategories_Id_Fk]) VALUES (113, N'Diş İlavesi (Tek Diş)', 1032.4100, 8, 1115.0000, 4)
INSERT [dbo].[TDBCostLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [TDBCostNameCategories_Id_Fk]) VALUES (114, N'Roach Köprü', 1703.7000, 8, 1840.0000, 4)
INSERT [dbo].[TDBCostLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [TDBCostNameCategories_Id_Fk]) VALUES (115, N'Gece Plağı (Yumuşak)', 1495.3700, 8, 1615.0000, 4)
INSERT [dbo].[TDBCostLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [TDBCostNameCategories_Id_Fk]) VALUES (116, N'Gece Plağı (Sert Oklüzal Splintleme)', 4796.3000, 8, 5180.0000, 4)
INSERT [dbo].[TDBCostLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [TDBCostNameCategories_Id_Fk]) VALUES (117, N'Pinley ve Çeşitleri *', 2296.3000, 8, 2480.0000, 4)
INSERT [dbo].[TDBCostLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [TDBCostNameCategories_Id_Fk]) VALUES (118, N'Tek Parça Döküm Kuron', 1976.8500, 8, 2135.0000, 4)
INSERT [dbo].[TDBCostLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [TDBCostNameCategories_Id_Fk]) VALUES (119, N'Veneer Kuron (Akrilik)', 2388.8900, 8, 2580.0000, 4)
INSERT [dbo].[TDBCostLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [TDBCostNameCategories_Id_Fk]) VALUES (120, N'Veneer Kuron ** (Seramik)', 2666.6700, 8, 2880.0000, 4)
INSERT [dbo].[TDBCostLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [TDBCostNameCategories_Id_Fk]) VALUES (121, N'İmplant Üstü Veneer Kuron (Seramik) (Abutment Ücreti Hariç)', 3245.3700, 8, 3505.0000, 4)
INSERT [dbo].[TDBCostLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [TDBCostNameCategories_Id_Fk]) VALUES (122, N'Laminate Veneer Kompozit', 2120.3700, 8, 2290.0000, 4)
INSERT [dbo].[TDBCostLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [TDBCostNameCategories_Id_Fk]) VALUES (123, N'Laminate Veneer (Akrilik)', 2777.7800, 8, 3000.0000, 4)
INSERT [dbo].[TDBCostLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [TDBCostNameCategories_Id_Fk]) VALUES (124, N'Laminate Veneer (Seramik)', 7120.3700, 8, 7690.0000, 4)
INSERT [dbo].[TDBCostLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [TDBCostNameCategories_Id_Fk]) VALUES (125, N'Jaket Kuron (Akrilik)', 1949.0700, 8, 2105.0000, 4)
INSERT [dbo].[TDBCostLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [TDBCostNameCategories_Id_Fk]) VALUES (126, N'Jaket Kuron (Kompozit)', 1777.7800, 8, 1920.0000, 4)
INSERT [dbo].[TDBCostLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [TDBCostNameCategories_Id_Fk]) VALUES (127, N'Tam Seramik Kuron (Metal Desteksiz)', 5935.1900, 8, 6410.0000, 4)
INSERT [dbo].[TDBCostLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [TDBCostNameCategories_Id_Fk]) VALUES (128, N'Teleskop Kuron* (Koping)', 2666.6700, 8, 2880.0000, 4)
INSERT [dbo].[TDBCostLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [TDBCostNameCategories_Id_Fk]) VALUES (129, N'Kuronlarda Freze Tekniği Farkı', 379.6300, 8, 410.0000, 4)
INSERT [dbo].[TDBCostLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [TDBCostNameCategories_Id_Fk]) VALUES (130, N'Döküm Post Core (Pivo) (Üst Yapı Hariç)', 1819.4400, 8, 1965.0000, 4)
INSERT [dbo].[TDBCostLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [TDBCostNameCategories_Id_Fk]) VALUES (131, N'Adeziv Köprü (Maryland vb. gibi)', 2796.3000, 8, 3020.0000, 4)
INSERT [dbo].[TDBCostLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [TDBCostNameCategories_Id_Fk]) VALUES (132, N'Geçici Kuron (Tek Diş İçin)', 532.4100, 8, 575.0000, 4)
INSERT [dbo].[TDBCostLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [TDBCostNameCategories_Id_Fk]) VALUES (133, N'Kuron Sökümü (Tek Sabit Üye İçin)', 449.0700, 8, 485.0000, 4)
INSERT [dbo].[TDBCostLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [TDBCostNameCategories_Id_Fk]) VALUES (134, N'Düşmüş Kuron ve Köprü Simantasyonu (Her Sabit Üye İçin)', 296.3000, 8, 320.0000, 4)
INSERT [dbo].[TDBCostLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [TDBCostNameCategories_Id_Fk]) VALUES (135, N'Kuron Köprü Tamiri * (Her Üye İçin)', 1333.3300, 8, 1440.0000, 4)
INSERT [dbo].[TDBCostLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [TDBCostNameCategories_Id_Fk]) VALUES (136, N'Diş Üstü Protezi (Overdenture - Tek Çene) (**)', 6527.7800, 8, 7050.0000, 4)
INSERT [dbo].[TDBCostLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [TDBCostNameCategories_Id_Fk]) VALUES (137, N'Damak Yarığı Protezi (Velum Uzantılı Aparey) (**)', 6500.0000, 8, 7020.0000, 4)
INSERT [dbo].[TDBCostLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [TDBCostNameCategories_Id_Fk]) VALUES (138, N'Yeni Doğanda Preoperatif Aparey (Vida Ücreti Ayrıca Alınır) (**)', 4777.7800, 8, 5160.0000, 4)
INSERT [dbo].[TDBCostLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [TDBCostNameCategories_Id_Fk]) VALUES (139, N'Geçici Obturatörler (**)', 4819.4400, 8, 5205.0000, 4)
INSERT [dbo].[TDBCostLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [TDBCostNameCategories_Id_Fk]) VALUES (140, N'Basit Çene Defektlerinde Protetik Tedavi (**)', 9064.8100, 8, 9790.0000, 4)
INSERT [dbo].[TDBCostLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [TDBCostNameCategories_Id_Fk]) VALUES (141, N'Komplike Çene Defektlerinde Protetik Tedavi (**)', 10490.7400, 8, 11330.0000, 4)
INSERT [dbo].[TDBCostLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [TDBCostNameCategories_Id_Fk]) VALUES (142, N'Yüz Protezleri (Yumuşak Akrilik İle)', 18916.6700, 8, 20430.0000, 4)
INSERT [dbo].[TDBCostLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [TDBCostNameCategories_Id_Fk]) VALUES (143, N'Göz Protezi (Oküler)', 19537.0400, 8, 21100.0000, 4)
INSERT [dbo].[TDBCostLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [TDBCostNameCategories_Id_Fk]) VALUES (144, N'Oklüzal Aşındırmalar', 1425.9300, 8, 1540.0000, 4)
INSERT [dbo].[TDBCostLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [TDBCostNameCategories_Id_Fk]) VALUES (145, N'Oklüzyon Düzeltilmesi', 2699.0700, 8, 2915.0000, 4)
INSERT [dbo].[TDBCostLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [TDBCostNameCategories_Id_Fk]) VALUES (146, N'T.M.E. Stabilizasyon Splinti', 3481.4800, 8, 3760.0000, 4)
INSERT [dbo].[TDBCostLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [TDBCostNameCategories_Id_Fk]) VALUES (147, N'İmplant Rehberi (Yarım Çene)', 2351.8500, 8, 2540.0000, 4)
INSERT [dbo].[TDBCostLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [TDBCostNameCategories_Id_Fk]) VALUES (148, N'İmplant Rehberi (Tam Çene)', 3407.4100, 8, 3680.0000, 4)
INSERT [dbo].[TDBCostLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [TDBCostNameCategories_Id_Fk]) VALUES (149, N'Diş Çekimi', 606.4800, 8, 655.0000, 5)
INSERT [dbo].[TDBCostLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [TDBCostNameCategories_Id_Fk]) VALUES (150, N'Komplikasyonlu Diş Çekimi', 1166.6700, 8, 1260.0000, 5)
INSERT [dbo].[TDBCostLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [TDBCostNameCategories_Id_Fk]) VALUES (151, N'Gömülü Diş Operasyonu', 2111.1100, 8, 2280.0000, 5)
INSERT [dbo].[TDBCostLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [TDBCostNameCategories_Id_Fk]) VALUES (152, N'Gömülü Diş Operasyonu (Kemik Retansiyonlu)', 2476.8500, 8, 2675.0000, 5)
INSERT [dbo].[TDBCostLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [TDBCostNameCategories_Id_Fk]) VALUES (153, N'Tek Kökte Kök Ucu Rezeksiyonu (Kanal Tedavisi ve Dolgu Hariç)', 2337.9600, 8, 2525.0000, 5)
INSERT [dbo].[TDBCostLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [TDBCostNameCategories_Id_Fk]) VALUES (154, N'İki Kökte Kök Ucu Rezeksiyonu (Kanal Tedavisi ve Dolgu Hariç)', 2712.9600, 8, 2930.0000, 5)
INSERT [dbo].[TDBCostLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [TDBCostNameCategories_Id_Fk]) VALUES (155, N'Üç Kökte Kök Ucu Rezeksiyonu (Kanal Tedavisi ve Dolgu Hariç)', 3115.7400, 8, 3365.0000, 5)
INSERT [dbo].[TDBCostLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [TDBCostNameCategories_Id_Fk]) VALUES (156, N'Alveolit Cerrahi Tedavisi', 1842.5900, 8, 1990.0000, 5)
INSERT [dbo].[TDBCostLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [TDBCostNameCategories_Id_Fk]) VALUES (157, N'Kanama Müdahalesi (Basit)', 643.5200, 8, 695.0000, 5)
INSERT [dbo].[TDBCostLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [TDBCostNameCategories_Id_Fk]) VALUES (158, N'Kanama Müdahalesi (Dikişli)', 1231.4800, 8, 1330.0000, 5)
INSERT [dbo].[TDBCostLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [TDBCostNameCategories_Id_Fk]) VALUES (159, N'Alveol Plastiği (Yarım Çene)', 2282.4100, 8, 2465.0000, 5)
INSERT [dbo].[TDBCostLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [TDBCostNameCategories_Id_Fk]) VALUES (160, N'Alveol Düzeltilmesi (Yarım Çene)', 2282.4100, 8, 2465.0000, 5)
INSERT [dbo].[TDBCostLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [TDBCostNameCategories_Id_Fk]) VALUES (161, N'Kist Operasyonu (Küçük)', 2513.8900, 8, 2715.0000, 5)
INSERT [dbo].[TDBCostLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [TDBCostNameCategories_Id_Fk]) VALUES (162, N'Kist Operasyonu (1 Cm Büyük)', 3273.1500, 8, 3535.0000, 5)
INSERT [dbo].[TDBCostLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [TDBCostNameCategories_Id_Fk]) VALUES (163, N'Epulis Operasyonu', 1791.6700, 8, 1935.0000, 5)
INSERT [dbo].[TDBCostLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [TDBCostNameCategories_Id_Fk]) VALUES (164, N'Osteomyelitis veya Osteitis Operasyonu (Tek Çene Basit)', 4643.5200, 8, 5015.0000, 5)
INSERT [dbo].[TDBCostLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [TDBCostNameCategories_Id_Fk]) VALUES (165, N'Çene Lüksasyonu', 652.7800, 8, 705.0000, 5)
INSERT [dbo].[TDBCostLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [TDBCostNameCategories_Id_Fk]) VALUES (166, N'Vestibüloplasti (Yarım Çene)', 5310.1900, 8, 5735.0000, 5)
INSERT [dbo].[TDBCostLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [TDBCostNameCategories_Id_Fk]) VALUES (167, N'Sinüs Plastiği', 2476.8500, 8, 2675.0000, 5)
INSERT [dbo].[TDBCostLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [TDBCostNameCategories_Id_Fk]) VALUES (168, N'Sert Doku Greftleme (Greft Ücreti Hariç)', 3347.2200, 8, 3615.0000, 5)
INSERT [dbo].[TDBCostLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [TDBCostNameCategories_Id_Fk]) VALUES (169, N'Yumuşak Doku Greftleme (Greft Ücreti Hariç)', 2898.1500, 8, 3130.0000, 5)
INSERT [dbo].[TDBCostLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [TDBCostNameCategories_Id_Fk]) VALUES (170, N'Sinüs Lifting (Biomateryal Ücreti Hariç)', 3106.4800, 8, 3355.0000, 5)
INSERT [dbo].[TDBCostLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [TDBCostNameCategories_Id_Fk]) VALUES (171, N'Biyopsi', 1800.9300, 8, 1945.0000, 5)
INSERT [dbo].[TDBCostLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [TDBCostNameCategories_Id_Fk]) VALUES (172, N'Fibrom Operasyonu', 1731.4800, 8, 1870.0000, 5)
INSERT [dbo].[TDBCostLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [TDBCostNameCategories_Id_Fk]) VALUES (173, N'Apse Drenajı ve Tedavisi (Extraoral)', 1689.8100, 8, 1825.0000, 5)
INSERT [dbo].[TDBCostLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [TDBCostNameCategories_Id_Fk]) VALUES (174, N'Apse Drenajı ve Tedavisi (İntraoral)', 1509.2600, 8, 1630.0000, 5)
INSERT [dbo].[TDBCostLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [TDBCostNameCategories_Id_Fk]) VALUES (175, N'Kapişon İzalesi - İmplant Üstü Açılması', 1037.0400, 8, 1120.0000, 5)
INSERT [dbo].[TDBCostLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [TDBCostNameCategories_Id_Fk]) VALUES (176, N'Stomatit Tedavisi,', 481.4800, 8, 520.0000, 5)
INSERT [dbo].[TDBCostLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [TDBCostNameCategories_Id_Fk]) VALUES (177, N'Fizik Tedavi (İnfraruj Seansı)', 490.7400, 8, 530.0000, 5)
INSERT [dbo].[TDBCostLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [TDBCostNameCategories_Id_Fk]) VALUES (178, N'Çene Kırığı (Basit)', 5217.5900, 8, 5635.0000, 5)
INSERT [dbo].[TDBCostLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [TDBCostNameCategories_Id_Fk]) VALUES (179, N'Çene Kırığı (Komplike - Materyal Ücreti Hariç)', 15273.1500, 8, 16495.0000, 5)
INSERT [dbo].[TDBCostLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [TDBCostNameCategories_Id_Fk]) VALUES (180, N'Reimplantasyon', 2708.3300, 8, 2925.0000, 5)
INSERT [dbo].[TDBCostLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [TDBCostNameCategories_Id_Fk]) VALUES (181, N'Ototransplantasyon', 4009.2600, 8, 4330.0000, 5)
INSERT [dbo].[TDBCostLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [TDBCostNameCategories_Id_Fk]) VALUES (182, N'Kemik İçi İmplant (Tek Silindirik İmplant Ücreti Hariç)', 6597.2200, 8, 7125.0000, 5)
INSERT [dbo].[TDBCostLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [TDBCostNameCategories_Id_Fk]) VALUES (183, N'Torus Operasyonu (Yarım Çene)', 2430.5600, 8, 2625.0000, 5)
INSERT [dbo].[TDBCostLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [TDBCostNameCategories_Id_Fk]) VALUES (184, N'Odontogenik Tümör Operasyonu (Küçük)', 3171.3000, 8, 3425.0000, 5)
INSERT [dbo].[TDBCostLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [TDBCostNameCategories_Id_Fk]) VALUES (185, N'Odontogenik Tümör Operasyonu (Büyük)', 3694.4400, 8, 3990.0000, 5)
INSERT [dbo].[TDBCostLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [TDBCostNameCategories_Id_Fk]) VALUES (186, N'Nevralji Tedavisi (Alkol Enjeksiyonu)', 500.0000, 8, 540.0000, 5)
INSERT [dbo].[TDBCostLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [TDBCostNameCategories_Id_Fk]) VALUES (187, N'Nevralji Tedavisi Cerrahi (Nöroktomi vb.)', 2634.2600, 8, 2845.0000, 5)
INSERT [dbo].[TDBCostLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [TDBCostNameCategories_Id_Fk]) VALUES (188, N'Tükürük Bezi Kanalından Taş Çıkarma (Basit)', 1787.0400, 8, 1930.0000, 5)
INSERT [dbo].[TDBCostLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [TDBCostNameCategories_Id_Fk]) VALUES (189, N'Tükürük Bezi Kanalından Taş Çıkarma (Komplike)', 1791.6700, 8, 1935.0000, 5)
INSERT [dbo].[TDBCostLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [TDBCostNameCategories_Id_Fk]) VALUES (190, N'Ortodontik Tedavi Amaçlı Gömük Dişlerin Üzerinin Açılması', 2347.2200, 8, 2535.0000, 5)
INSERT [dbo].[TDBCostLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [TDBCostNameCategories_Id_Fk]) VALUES (191, N'T.M.E. Mekonoterapi', 879.6300, 8, 950.0000, 5)
INSERT [dbo].[TDBCostLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [TDBCostNameCategories_Id_Fk]) VALUES (192, N'T.M.E. İçi Enjeksiyon (Tek Taraflı)', 722.2200, 8, 780.0000, 5)
INSERT [dbo].[TDBCostLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [TDBCostNameCategories_Id_Fk]) VALUES (193, N'Artrosentez (Tek Taraflı)', 1055.5600, 8, 1140.0000, 5)
INSERT [dbo].[TDBCostLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [TDBCostNameCategories_Id_Fk]) VALUES (194, N'Açık Eklem Cerrahisi (Tek Taraflı)', 18893.5200, 8, 20405.0000, 5)
INSERT [dbo].[TDBCostLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [TDBCostNameCategories_Id_Fk]) VALUES (195, N'Genioplasti', 17750.0000, 8, 19170.0000, 5)
INSERT [dbo].[TDBCostLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [TDBCostNameCategories_Id_Fk]) VALUES (196, N'Segmental Osteotomi', 19763.8900, 8, 21345.0000, 5)
INSERT [dbo].[TDBCostLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [TDBCostNameCategories_Id_Fk]) VALUES (197, N'Osteotomi (Tek Çene)', 19805.5600, 8, 21390.0000, 5)
INSERT [dbo].[TDBCostLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [TDBCostNameCategories_Id_Fk]) VALUES (198, N'Dişhekimliğinde Botulinum Toksin Uygulaması', 3180.5600, 8, 3435.0000, 5)
INSERT [dbo].[TDBCostLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [TDBCostNameCategories_Id_Fk]) VALUES (199, N'İmplant Çıkartılması', 2486.1100, 8, 2685.0000, 5)
GO
INSERT [dbo].[TDBCostLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [TDBCostNameCategories_Id_Fk]) VALUES (200, N'Ankraj Amaçlı Plak Yerleştirme (Malzeme Ücreti Hariç)', 2712.9600, 8, 2930.0000, 5)
INSERT [dbo].[TDBCostLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [TDBCostNameCategories_Id_Fk]) VALUES (201, N'Ankraj Amaçlı Plak Çıkarma', 1587.9600, 8, 1715.0000, 5)
INSERT [dbo].[TDBCostLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [TDBCostNameCategories_Id_Fk]) VALUES (202, N'Zigoma İmplant (İmplant Ücreti Hariç)', 9893.5200, 8, 10685.0000, 5)
INSERT [dbo].[TDBCostLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [TDBCostNameCategories_Id_Fk]) VALUES (203, N'Detartraj (Diş Taşı Temizliği - Tek Çene)', 810.1900, 8, 875.0000, 6)
INSERT [dbo].[TDBCostLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [TDBCostNameCategories_Id_Fk]) VALUES (204, N'Subgingival Küretaj (Tek Diş)', 472.2200, 8, 510.0000, 6)
INSERT [dbo].[TDBCostLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [TDBCostNameCategories_Id_Fk]) VALUES (205, N'Subgingival İlaç Uygulaması', 64.8100, 8, 70.0000, 6)
INSERT [dbo].[TDBCostLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [TDBCostNameCategories_Id_Fk]) VALUES (206, N'Gingivoplasti (Tek Diş)', 773.1500, 8, 835.0000, 6)
INSERT [dbo].[TDBCostLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [TDBCostNameCategories_Id_Fk]) VALUES (207, N'Gingivektomi (Tek Diş)', 870.3700, 8, 940.0000, 6)
INSERT [dbo].[TDBCostLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [TDBCostNameCategories_Id_Fk]) VALUES (208, N'Flap Operasyonu (Subgingival Küretaj Dahil - Tek Diş)', 1300.9300, 8, 1405.0000, 6)
INSERT [dbo].[TDBCostLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [TDBCostNameCategories_Id_Fk]) VALUES (209, N'Tunnel Operasyonu (Tek Diş)', 1083.3300, 8, 1170.0000, 6)
INSERT [dbo].[TDBCostLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [TDBCostNameCategories_Id_Fk]) VALUES (210, N'Hemiseksiyon (Kök Amputasyonu - Kanal Tedavisi Hariç)', 1027.7800, 8, 1110.0000, 6)
INSERT [dbo].[TDBCostLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [TDBCostNameCategories_Id_Fk]) VALUES (211, N'Serbest Diş Eti Grefti (Tek Diş)', 1037.0400, 8, 1120.0000, 6)
INSERT [dbo].[TDBCostLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [TDBCostNameCategories_Id_Fk]) VALUES (212, N'Saplı yumuşak doku grefti (Koronale Kaydırma, Yana Kaydırma,Tek Diş)', 1064.8100, 8, 1150.0000, 6)
INSERT [dbo].[TDBCostLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [TDBCostNameCategories_Id_Fk]) VALUES (213, N'Periodontal Splint (Daimi)', 2231.4800, 8, 2410.0000, 6)
INSERT [dbo].[TDBCostLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [TDBCostNameCategories_Id_Fk]) VALUES (214, N'Periodontal Splint (Geçici)', 2611.1100, 8, 2820.0000, 6)
INSERT [dbo].[TDBCostLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [TDBCostNameCategories_Id_Fk]) VALUES (215, N'Periodontal Şine (Splint - Geçici - Yarım Çene)', 879.6300, 8, 950.0000, 6)
INSERT [dbo].[TDBCostLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [TDBCostNameCategories_Id_Fk]) VALUES (216, N'Biyomateryal Uygulaması (Tek Diş - Flap Op. ve Biomateryal Ücreti Hariç)', 277.7800, 8, 300.0000, 6)
INSERT [dbo].[TDBCostLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [TDBCostNameCategories_Id_Fk]) VALUES (217, N'Membran Uygulaması (Tek Diş - Flap Op. ve Membran Ücreti Hariç)', 277.7800, 8, 300.0000, 6)
INSERT [dbo].[TDBCostLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [TDBCostNameCategories_Id_Fk]) VALUES (218, N'Vestibül Plak (Diş Eti Protezi - Çene Başına)', 2250.0000, 8, 2430.0000, 6)
INSERT [dbo].[TDBCostLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [TDBCostNameCategories_Id_Fk]) VALUES (219, N'Subepitelyal Bağ Dokusu Grefti', 1569.4400, 8, 1695.0000, 6)
INSERT [dbo].[TDBCostLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [TDBCostNameCategories_Id_Fk]) VALUES (220, N'Frenektomi - Frenetomi', 1648.1500, 8, 1780.0000, 6)
INSERT [dbo].[TDBCostLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [TDBCostNameCategories_Id_Fk]) VALUES (221, N'Peri-İmplantitis (Cerrahi) (Biomaterial ve Membran Ücreti Hariç) (Tek İmp.)', 1703.7000, 8, 1840.0000, 6)
INSERT [dbo].[TDBCostLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [TDBCostNameCategories_Id_Fk]) VALUES (222, N'Peri-İmplantitis (Cerrahi Olmayan) (Tek İmp.)', 703.7000, 8, 760.0000, 6)
INSERT [dbo].[TDBCostLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [TDBCostNameCategories_Id_Fk]) VALUES (223, N'Papil Oluşturma (Cerrahi) (Tek Papil)', 842.5900, 8, 910.0000, 6)
INSERT [dbo].[TDBCostLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [TDBCostNameCategories_Id_Fk]) VALUES (224, N'Papil Oluşturma (Cerrahi Olmayan) (Tek Papil)', 504.6300, 8, 545.0000, 6)
INSERT [dbo].[TDBCostLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [TDBCostNameCategories_Id_Fk]) VALUES (225, N'Fiberotomi', 518.5200, 8, 560.0000, 6)
INSERT [dbo].[TDBCostLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [TDBCostNameCategories_Id_Fk]) VALUES (226, N'Lateral Sefalometrik Film Analizi', 300.9300, 8, 325.0000, 7)
INSERT [dbo].[TDBCostLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [TDBCostNameCategories_Id_Fk]) VALUES (227, N'Antero Posterior Sefalometrik Film Analizi (Frontal Film Analizi)', 300.9300, 8, 325.0000, 7)
INSERT [dbo].[TDBCostLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [TDBCostNameCategories_Id_Fk]) VALUES (228, N'Kemik Yaşı Tayini', 166.6700, 8, 180.0000, 7)
INSERT [dbo].[TDBCostLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [TDBCostNameCategories_Id_Fk]) VALUES (229, N'Ortodontik Fotoğraf', 166.6700, 8, 180.0000, 7)
INSERT [dbo].[TDBCostLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [TDBCostNameCategories_Id_Fk]) VALUES (230, N'Ortodontik Fotoğraf Tetkiki', 134.2600, 8, 145.0000, 7)
INSERT [dbo].[TDBCostLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [TDBCostNameCategories_Id_Fk]) VALUES (231, N'Ortodontik Model Yapımı', 300.9300, 8, 325.0000, 7)
INSERT [dbo].[TDBCostLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [TDBCostNameCategories_Id_Fk]) VALUES (232, N'Ortodontik Model Analizi', 194.4400, 8, 210.0000, 7)
INSERT [dbo].[TDBCostLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [TDBCostNameCategories_Id_Fk]) VALUES (233, N'Ara Dönem Sefalometrik Film Analizi', 245.3700, 8, 265.0000, 7)
INSERT [dbo].[TDBCostLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [TDBCostNameCategories_Id_Fk]) VALUES (234, N'Ara Dönem Model Yapımı', 305.5600, 8, 330.0000, 7)
INSERT [dbo].[TDBCostLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [TDBCostNameCategories_Id_Fk]) VALUES (235, N'Angle Sınıf I Anomalilerinin Ortodontik Tedavisi', 7527.7800, 8, 8130.0000, 7)
INSERT [dbo].[TDBCostLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [TDBCostNameCategories_Id_Fk]) VALUES (236, N'Angle Sınıf II Anomalilerinin Ortodontik Tedavisi', 9546.3000, 8, 10310.0000, 7)
INSERT [dbo].[TDBCostLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [TDBCostNameCategories_Id_Fk]) VALUES (237, N'Angle Sınıf III Anomalilerinin Ortodontik Tedavisi', 11666.6700, 8, 12600.0000, 7)
INSERT [dbo].[TDBCostLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [TDBCostNameCategories_Id_Fk]) VALUES (238, N'Sabit Kapanış Yükseltici Tatbiki (Kısa Süreli)', 921.3000, 8, 995.0000, 7)
INSERT [dbo].[TDBCostLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [TDBCostNameCategories_Id_Fk]) VALUES (239, N'Lingual Teknikle Angle Sınıf I Anomalilerinin Ortodontik Tedavisi', 8828.7000, 8, 9535.0000, 7)
INSERT [dbo].[TDBCostLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [TDBCostNameCategories_Id_Fk]) VALUES (240, N'Lingual Teknikle Angle Sınıf II Anomalilerinin Ortodontik Tedavisi', 11194.4400, 8, 12090.0000, 7)
INSERT [dbo].[TDBCostLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [TDBCostNameCategories_Id_Fk]) VALUES (241, N'Lingual Teknikle Angle Sınıf III Anomalilerinin Ortodontik Tedavisi', 13680.5600, 8, 14775.0000, 7)
INSERT [dbo].[TDBCostLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [TDBCostNameCategories_Id_Fk]) VALUES (242, N'Açık Kapanışın Ortodontik Tedavisi', 12023.1500, 8, 12985.0000, 7)
INSERT [dbo].[TDBCostLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [TDBCostNameCategories_Id_Fk]) VALUES (243, N'Önleyici Ortodontik Tedavi', 5402.7800, 8, 5835.0000, 7)
INSERT [dbo].[TDBCostLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [TDBCostNameCategories_Id_Fk]) VALUES (244, N'Kısa Süreli Ortodontik Tedavi', 5509.2600, 8, 5950.0000, 7)
INSERT [dbo].[TDBCostLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [TDBCostNameCategories_Id_Fk]) VALUES (245, N'Pekiştirme Tedavisi', 2023.1500, 8, 2185.0000, 7)
INSERT [dbo].[TDBCostLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [TDBCostNameCategories_Id_Fk]) VALUES (246, N'Pekiştirme Aygıtı (Hawley Aygıtı vb.)', 1666.6700, 8, 1800.0000, 7)
INSERT [dbo].[TDBCostLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [TDBCostNameCategories_Id_Fk]) VALUES (247, N'Sabit Pekiştirme Aygıtı (Lingual Retainer)', 2462.9600, 8, 2660.0000, 7)
INSERT [dbo].[TDBCostLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [TDBCostNameCategories_Id_Fk]) VALUES (248, N'Dudak Yastıkçığı (Lip Bumper)', 2865.7400, 8, 3095.0000, 7)
INSERT [dbo].[TDBCostLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [TDBCostNameCategories_Id_Fk]) VALUES (249, N'Tek Çeneyi İlgilendiren Aparey Yapımı (Vida Hariç)', 1810.1900, 8, 1955.0000, 7)
INSERT [dbo].[TDBCostLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [TDBCostNameCategories_Id_Fk]) VALUES (250, N'Çift Çeneyi İlgilendiren Aparey Yapımı (Frankel Aygıtları - Aktivatör - Bionatör)', 3023.1500, 8, 3265.0000, 7)
INSERT [dbo].[TDBCostLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [TDBCostNameCategories_Id_Fk]) VALUES (251, N'Vida Uygulaması (Tek Vida)', 444.4400, 8, 480.0000, 7)
INSERT [dbo].[TDBCostLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [TDBCostNameCategories_Id_Fk]) VALUES (252, N'Sabit Fonksiyonel Aygıt Uygulaması', 4949.0700, 8, 5345.0000, 7)
INSERT [dbo].[TDBCostLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [TDBCostNameCategories_Id_Fk]) VALUES (253, N'Kayıp Apareyin Yeniden Yapımı (Tek Çene)', 1564.8100, 8, 1690.0000, 7)
INSERT [dbo].[TDBCostLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [TDBCostNameCategories_Id_Fk]) VALUES (254, N'Aparey Tamiri', 666.6700, 8, 720.0000, 7)
INSERT [dbo].[TDBCostLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [TDBCostNameCategories_Id_Fk]) VALUES (255, N'Ağız Dışı Aparey Tatbiki (Headgear - Chincap)', 1750.0000, 8, 1890.0000, 7)
INSERT [dbo].[TDBCostLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [TDBCostNameCategories_Id_Fk]) VALUES (256, N'Reverse Headgear', 4953.7000, 8, 5350.0000, 7)
INSERT [dbo].[TDBCostLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [TDBCostNameCategories_Id_Fk]) VALUES (257, N'Düz Ark Teli Tatbiki (Tek Çene NİTİ Telleri)', 569.4400, 8, 615.0000, 7)
INSERT [dbo].[TDBCostLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [TDBCostNameCategories_Id_Fk]) VALUES (258, N'Büküm İçeren Tel Tatbiki (Tek Çene)', 587.9600, 8, 635.0000, 7)
INSERT [dbo].[TDBCostLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [TDBCostNameCategories_Id_Fk]) VALUES (259, N'Segmental Ark veya Tork Arkı Tatbiki', 587.9600, 8, 635.0000, 7)
INSERT [dbo].[TDBCostLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [TDBCostNameCategories_Id_Fk]) VALUES (260, N'Bant Tatbiki (Tek Diş)', 541.6700, 8, 585.0000, 7)
INSERT [dbo].[TDBCostLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [TDBCostNameCategories_Id_Fk]) VALUES (261, N'Braket Tatbiki (Tek Diş)', 472.2200, 8, 510.0000, 7)
INSERT [dbo].[TDBCostLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [TDBCostNameCategories_Id_Fk]) VALUES (262, N'Lingual Braket Tatbiki (Tek Diş)', 550.9300, 8, 595.0000, 7)
INSERT [dbo].[TDBCostLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [TDBCostNameCategories_Id_Fk]) VALUES (263, N'Düşen Bant Tatbiki (Tek Diş)', 518.5200, 8, 560.0000, 7)
INSERT [dbo].[TDBCostLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [TDBCostNameCategories_Id_Fk]) VALUES (264, N'Düşen Braket Tatbiki (Tek Diş)', 490.7400, 8, 530.0000, 7)
INSERT [dbo].[TDBCostLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [TDBCostNameCategories_Id_Fk]) VALUES (265, N'Bant veya Braket Çıkarılması (Tek Diş)', 199.0700, 8, 215.0000, 7)
INSERT [dbo].[TDBCostLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [TDBCostNameCategories_Id_Fk]) VALUES (266, N'Lingual Ataçman Tatbiki', 578.7000, 8, 625.0000, 7)
INSERT [dbo].[TDBCostLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [TDBCostNameCategories_Id_Fk]) VALUES (267, N'Lingual Ark', 1907.4100, 8, 2060.0000, 7)
INSERT [dbo].[TDBCostLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [TDBCostNameCategories_Id_Fk]) VALUES (268, N'Nance Apareyi', 2675.9300, 8, 2890.0000, 7)
INSERT [dbo].[TDBCostLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [TDBCostNameCategories_Id_Fk]) VALUES (269, N'Hızlı Maksiller Genişletme Apareyi', 3226.8500, 8, 3485.0000, 7)
INSERT [dbo].[TDBCostLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [TDBCostNameCategories_Id_Fk]) VALUES (270, N'Preoperatif Dudak Damak Yarığı (Ortodontik Tedavi)', 4384.2600, 8, 4735.0000, 7)
INSERT [dbo].[TDBCostLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [TDBCostNameCategories_Id_Fk]) VALUES (271, N'Postoperatif Dudak Damak Yarığı (Ortodontik Tedavi)', 3587.9600, 8, 3875.0000, 7)
INSERT [dbo].[TDBCostLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [TDBCostNameCategories_Id_Fk]) VALUES (272, N'T.M.E. Splint Yapımı', 3476.8500, 8, 3755.0000, 7)
INSERT [dbo].[TDBCostLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [TDBCostNameCategories_Id_Fk]) VALUES (273, N'Model Set-Up', 1675.9300, 8, 1810.0000, 7)
INSERT [dbo].[TDBCostLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [TDBCostNameCategories_Id_Fk]) VALUES (274, N'Positioner Yapımı', 3856.4800, 8, 4165.0000, 7)
INSERT [dbo].[TDBCostLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [TDBCostNameCategories_Id_Fk]) VALUES (275, N'Sefalometrik Cerrahi Planı', 592.5900, 8, 640.0000, 7)
INSERT [dbo].[TDBCostLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [TDBCostNameCategories_Id_Fk]) VALUES (276, N'Ortodontik Modellerin Face - Bow ile Artikülatöre Taşınması', 2069.4400, 8, 2235.0000, 7)
INSERT [dbo].[TDBCostLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [TDBCostNameCategories_Id_Fk]) VALUES (277, N'Model Cerrahisi', 953.7000, 8, 1030.0000, 7)
INSERT [dbo].[TDBCostLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [TDBCostNameCategories_Id_Fk]) VALUES (278, N'Oklüzal Cerrahi Splint (Tek Çene)', 3476.8500, 8, 3755.0000, 7)
INSERT [dbo].[TDBCostLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [TDBCostNameCategories_Id_Fk]) VALUES (279, N'Ortodontik Ameliyat Arkı (Tek Çene)', 4712.9600, 8, 5090.0000, 7)
INSERT [dbo].[TDBCostLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [TDBCostNameCategories_Id_Fk]) VALUES (280, N'Sürme Rehberliği', 4305.5600, 8, 4650.0000, 7)
INSERT [dbo].[TDBCostLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [TDBCostNameCategories_Id_Fk]) VALUES (281, N'Ağız İçi Distalizasyon Apareyi', 3939.8100, 8, 4255.0000, 7)
INSERT [dbo].[TDBCostLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [TDBCostNameCategories_Id_Fk]) VALUES (282, N'Gömülü Dişin Diş Dizisinde Yerine Yerleştirilmesi (Tek Diş)', 5217.5900, 8, 5635.0000, 7)
INSERT [dbo].[TDBCostLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [TDBCostNameCategories_Id_Fk]) VALUES (283, N'Reserve Curve''li Niti Ark Tatbiki', 884.2600, 8, 955.0000, 7)
INSERT [dbo].[TDBCostLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [TDBCostNameCategories_Id_Fk]) VALUES (284, N'Ortognatik Cerrahi Ortodontik Tedavisi', 11518.5200, 8, 12440.0000, 7)
INSERT [dbo].[TDBCostLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [TDBCostNameCategories_Id_Fk]) VALUES (285, N'Mini Vida Uygulaması', 1287.0400, 8, 1390.0000, 7)
INSERT [dbo].[TDBCostLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [TDBCostNameCategories_Id_Fk]) VALUES (286, N'İnterproksimal Aşındırma (Tek Diş)', 259.2600, 8, 280.0000, 7)
INSERT [dbo].[TDBCostLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [TDBCostNameCategories_Id_Fk]) VALUES (287, N'Şeffaf Plaklar ile Ortodontik Tedavi (Hafif) (Plak Ücreti Hariç)', 11833.3300, 8, 12780.0000, 7)
INSERT [dbo].[TDBCostLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [TDBCostNameCategories_Id_Fk]) VALUES (288, N'Şeffaf Plaklar ile Ortodontik Tedavi (Orta) (Plak Ücreti Hariç)', 16898.1500, 8, 18250.0000, 7)
INSERT [dbo].[TDBCostLists] ([Id], [Treatment], [Price], [Vat], [PriceWithVat], [TDBCostNameCategories_Id_Fk]) VALUES (289, N'Şeffaf Plaklar ile Ortodontik Tedavi (Ağır) (Plak Ücreti Hariç)', 25351.8500, 8, 27380.0000, 7)
SET IDENTITY_INSERT [dbo].[TDBCostLists] OFF
GO
SET IDENTITY_INSERT [dbo].[TDBCostNameCategories] ON 

INSERT [dbo].[TDBCostNameCategories] ([Id], [TDBCategoryName], [TDBCostNames_Id_Fk]) VALUES (1, N'TEŞHİS VE TEDAVİ PLANLAMASI', 1)
INSERT [dbo].[TDBCostNameCategories] ([Id], [TDBCategoryName], [TDBCostNames_Id_Fk]) VALUES (2, N'TEDAVİ VE ENDODONTİ', 1)
INSERT [dbo].[TDBCostNameCategories] ([Id], [TDBCategoryName], [TDBCostNames_Id_Fk]) VALUES (3, N'PEDODONTİ', 1)
INSERT [dbo].[TDBCostNameCategories] ([Id], [TDBCategoryName], [TDBCostNames_Id_Fk]) VALUES (4, N'PROTEZ', 1)
INSERT [dbo].[TDBCostNameCategories] ([Id], [TDBCategoryName], [TDBCostNames_Id_Fk]) VALUES (5, N'AĞIZ-DİŞ VE ÇENE CERRAHİSİ', 1)
INSERT [dbo].[TDBCostNameCategories] ([Id], [TDBCategoryName], [TDBCostNames_Id_Fk]) VALUES (6, N'PERİODONTOLOJİ', 1)
INSERT [dbo].[TDBCostNameCategories] ([Id], [TDBCategoryName], [TDBCostNames_Id_Fk]) VALUES (7, N'ORTODONTİ', 1)
SET IDENTITY_INSERT [dbo].[TDBCostNameCategories] OFF
GO
SET IDENTITY_INSERT [dbo].[TDBCostNames] ON 

INSERT [dbo].[TDBCostNames] ([Id], [TDBCostName], [Comment], [CreateDate]) VALUES (1, N'2023', N'Tüm İller', CAST(N'2023-03-21T20:25:16.813' AS DateTime))
SET IDENTITY_INSERT [dbo].[TDBCostNames] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AspNetRoleClaims_RoleId]    Script Date: 26.07.2023 18:24:18 ******/
CREATE NONCLUSTERED INDEX [IX_AspNetRoleClaims_RoleId] ON [dbo].[AspNetRoleClaims]
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [RoleNameIndex]    Script Date: 26.07.2023 18:24:18 ******/
CREATE UNIQUE NONCLUSTERED INDEX [RoleNameIndex] ON [dbo].[AspNetRoles]
(
	[NormalizedName] ASC
)
WHERE ([NormalizedName] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AspNetUserClaims_UserId]    Script Date: 26.07.2023 18:24:18 ******/
CREATE NONCLUSTERED INDEX [IX_AspNetUserClaims_UserId] ON [dbo].[AspNetUserClaims]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AspNetUserLogins_UserId]    Script Date: 26.07.2023 18:24:18 ******/
CREATE NONCLUSTERED INDEX [IX_AspNetUserLogins_UserId] ON [dbo].[AspNetUserLogins]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AspNetUserRoles_RoleId]    Script Date: 26.07.2023 18:24:18 ******/
CREATE NONCLUSTERED INDEX [IX_AspNetUserRoles_RoleId] ON [dbo].[AspNetUserRoles]
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [EmailIndex]    Script Date: 26.07.2023 18:24:18 ******/
CREATE NONCLUSTERED INDEX [EmailIndex] ON [dbo].[AspNetUsers]
(
	[NormalizedEmail] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UserNameIndex]    Script Date: 26.07.2023 18:24:18 ******/
CREATE UNIQUE NONCLUSTERED INDEX [UserNameIndex] ON [dbo].[AspNetUsers]
(
	[NormalizedUserName] ASC
)
WHERE ([NormalizedUserName] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[AspNetRoleClaims]  WITH CHECK ADD  CONSTRAINT [FK_AspNetRoleClaims_AspNetRoles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[AspNetRoles] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetRoleClaims] CHECK CONSTRAINT [FK_AspNetRoleClaims_AspNetRoles_RoleId]
GO
ALTER TABLE [dbo].[AspNetUserClaims]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserClaims_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserClaims] CHECK CONSTRAINT [FK_AspNetUserClaims_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserLogins]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserLogins_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserLogins] CHECK CONSTRAINT [FK_AspNetUserLogins_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserRoles_AspNetRoles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[AspNetRoles] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_AspNetUserRoles_AspNetRoles_RoleId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserRoles_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_AspNetUserRoles_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserTokens]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserTokens_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserTokens] CHECK CONSTRAINT [FK_AspNetUserTokens_AspNetUsers_UserId]
GO
USE [master]
GO
ALTER DATABASE [DentalAppDB] SET  READ_WRITE 
GO
