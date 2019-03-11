USE [master]
GO
/****** Object:  Database [Asm_1_KhoaPD7]    Script Date: 8/30/2018 9:29:08 AM ******/
CREATE DATABASE [Asm_1_KhoaPD7]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Asm_1_KhoaPD7', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\Asm_1_KhoaPD7.mdf' , SIZE = 4096KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'Asm_1_KhoaPD7_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\Asm_1_KhoaPD7_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [Asm_1_KhoaPD7] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Asm_1_KhoaPD7].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Asm_1_KhoaPD7] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Asm_1_KhoaPD7] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Asm_1_KhoaPD7] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Asm_1_KhoaPD7] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Asm_1_KhoaPD7] SET ARITHABORT OFF 
GO
ALTER DATABASE [Asm_1_KhoaPD7] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Asm_1_KhoaPD7] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [Asm_1_KhoaPD7] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Asm_1_KhoaPD7] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Asm_1_KhoaPD7] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Asm_1_KhoaPD7] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Asm_1_KhoaPD7] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Asm_1_KhoaPD7] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Asm_1_KhoaPD7] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Asm_1_KhoaPD7] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Asm_1_KhoaPD7] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Asm_1_KhoaPD7] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Asm_1_KhoaPD7] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Asm_1_KhoaPD7] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Asm_1_KhoaPD7] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Asm_1_KhoaPD7] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Asm_1_KhoaPD7] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Asm_1_KhoaPD7] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Asm_1_KhoaPD7] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Asm_1_KhoaPD7] SET  MULTI_USER 
GO
ALTER DATABASE [Asm_1_KhoaPD7] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Asm_1_KhoaPD7] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Asm_1_KhoaPD7] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Asm_1_KhoaPD7] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [Asm_1_KhoaPD7]
GO
/****** Object:  User [khoa]    Script Date: 8/30/2018 9:29:08 AM ******/
CREATE USER [khoa] FOR LOGIN [khoa] WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_owner] ADD MEMBER [khoa]
GO
ALTER ROLE [db_accessadmin] ADD MEMBER [khoa]
GO
/****** Object:  Table [dbo].[Content]    Script Date: 8/30/2018 9:29:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Content](
	[id] [int] NOT NULL,
	[Title] [varchar](50) NOT NULL,
	[Brief] [varchar](50) NOT NULL,
	[Content] [varchar](50) NOT NULL,
	[CreateDate] [datetime] NOT NULL,
	[UpdateTime] [timestamp] NOT NULL,
	[Sort] [bit] NOT NULL,
	[AuthorId] [int] NULL,
 CONSTRAINT [PK_Content] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Member]    Script Date: 8/30/2018 9:29:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Member](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Fristname] [varchar](50) NULL,
	[Lastname] [varchar](50) NULL,
	[Username] [varchar](50) NULL,
	[Password] [varchar](50) NULL,
	[Phone] [varchar](15) NULL,
	[Email] [varchar](50) NULL,
	[Description] [varchar](50) NULL,
	[CreatedDate] [date] NULL,
	[UpdateTime] [date] NULL,
 CONSTRAINT [PK_Member] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
ALTER TABLE [dbo].[Content]  WITH CHECK ADD  CONSTRAINT [FK_Content_Member] FOREIGN KEY([AuthorId])
REFERENCES [dbo].[Member] ([id])
GO
ALTER TABLE [dbo].[Content] CHECK CONSTRAINT [FK_Content_Member]
GO
ALTER TABLE [dbo].[Member]  WITH CHECK ADD  CONSTRAINT [FK_Member_Member] FOREIGN KEY([id])
REFERENCES [dbo].[Member] ([id])
GO
ALTER TABLE [dbo].[Member] CHECK CONSTRAINT [FK_Member_Member]
GO
USE [master]
GO
ALTER DATABASE [Asm_1_KhoaPD7] SET  READ_WRITE 
GO
