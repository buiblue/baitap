use QuanLyDeAn
GO
/****** Object:  Database [QuanLyDeAn]    Script Date: 3/22/2023 8:46:27 AM ******/
CREATE DATABASE [QuanLyDeAn]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'QuanLyDeAn_Data', FILENAME = N'C:\LyHuynhThanhHau\QuanLyDeAn_Data.mdf' , SIZE = 20480KB , MAXSIZE = 1024000KB , FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'QuanLyDeAn_log', FILENAME = N'C:\LyHuynhThanhHau\QuanLyDeAn_Log.ldf' , SIZE = 6144KB , MAXSIZE = 20480KB , FILEGROWTH = 5%)
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [QuanLyDeAn] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [QuanLyDeAn].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [QuanLyDeAn] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [QuanLyDeAn] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [QuanLyDeAn] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [QuanLyDeAn] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [QuanLyDeAn] SET ARITHABORT OFF 
GO
ALTER DATABASE [QuanLyDeAn] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [QuanLyDeAn] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [QuanLyDeAn] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [QuanLyDeAn] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [QuanLyDeAn] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [QuanLyDeAn] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [QuanLyDeAn] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [QuanLyDeAn] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [QuanLyDeAn] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [QuanLyDeAn] SET  ENABLE_BROKER 
GO
ALTER DATABASE [QuanLyDeAn] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [QuanLyDeAn] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [QuanLyDeAn] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [QuanLyDeAn] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [QuanLyDeAn] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [QuanLyDeAn] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [QuanLyDeAn] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [QuanLyDeAn] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [QuanLyDeAn] SET  MULTI_USER 
GO
ALTER DATABASE [QuanLyDeAn] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [QuanLyDeAn] SET DB_CHAINING OFF 
GO
ALTER DATABASE [QuanLyDeAn] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [QuanLyDeAn] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [QuanLyDeAn] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [QuanLyDeAn] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [QuanLyDeAn] SET QUERY_STORE = OFF
GO
USE [QuanLyDeAn]
GO
/****** Object:  Table [dbo].[DEAN]    Script Date: 3/22/2023 8:46:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DEAN](
	[MaDA] [varchar](2) NOT NULL,
	[TenDA] [nvarchar](50) NULL,
	[DDiemDA] [nvarchar](20) NULL,
 CONSTRAINT [PK_DEAN] PRIMARY KEY CLUSTERED 
(
	[MaDA] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NHANVIEN]    Script Date: 3/22/2023 8:46:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NHANVIEN](
	[MaNV] [varchar](9) NOT NULL,
	[HoNV] [nvarchar](15) NULL,
	[TenLot] [nvarchar](30) NULL,
	[tenNV] [nvarchar](30) NULL,
	[NgSinh] [smalldatetime] NULL,
	[DiaChi] [nvarchar](150) NULL,
	[Phai] [nvarchar](3) NULL,
	[Luong] [numeric](18, 0) NULL,
	[Phong] [varchar](2) NULL,
 CONSTRAINT [PK_NHANVIEN] PRIMARY KEY CLUSTERED 
(
	[MaNV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PHANCONG]    Script Date: 3/22/2023 8:46:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PHANCONG](
	[MaNV] [varchar](9) NOT NULL,
	[MaDA] [varchar](2) NOT NULL,
	[ThoiGian] [numeric](18, 0) NULL,
 CONSTRAINT [PK_PHANCONG] PRIMARY KEY CLUSTERED 
(
	[MaNV] ASC,
	[MaDA] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PHONGBAN]    Script Date: 3/22/2023 8:46:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PHONGBAN](
	[MaPhg] [varchar](2) NOT NULL,
	[TenPhg] [nvarchar](30) NULL,
 CONSTRAINT [PK_PHONGBAN] PRIMARY KEY CLUSTERED 
(
	[MaPhg] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[THANNHAN]    Script Date: 3/22/2023 8:46:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[THANNHAN](
	[MaNV] [varchar](9) NOT NULL,
	[TenTN] [nvarchar](20) NOT NULL,
	[NgaySinh] [smalldatetime] NULL,
	[Phai] [nvarchar](3) NULL,
	[QuanHe] [nvarchar](15) NULL,
 CONSTRAINT [PK_THANNHAN] PRIMARY KEY CLUSTERED 
(
	[MaNV] ASC,
	[TenTN] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[NHANVIEN]  WITH CHECK ADD  CONSTRAINT [FK_NHANVIEN_PHONGBAN] FOREIGN KEY([Phong])
REFERENCES [dbo].[PHONGBAN] ([MaPhg])
GO
ALTER TABLE [dbo].[NHANVIEN] CHECK CONSTRAINT [FK_NHANVIEN_PHONGBAN]
GO
ALTER TABLE [dbo].[PHANCONG]  WITH CHECK ADD  CONSTRAINT [FK_PHANCONG_DEAN] FOREIGN KEY([MaDA])
REFERENCES [dbo].[DEAN] ([MaDA])
GO
ALTER TABLE [dbo].[PHANCONG] CHECK CONSTRAINT [FK_PHANCONG_DEAN]
GO
ALTER TABLE [dbo].[PHANCONG]  WITH CHECK ADD  CONSTRAINT [FK_PHANCONG_NHANVIEN] FOREIGN KEY([MaNV])
REFERENCES [dbo].[NHANVIEN] ([MaNV])
GO
ALTER TABLE [dbo].[PHANCONG] CHECK CONSTRAINT [FK_PHANCONG_NHANVIEN]
GO
ALTER TABLE [dbo].[THANNHAN]  WITH CHECK ADD  CONSTRAINT [FK_THANNHAN_NHANVIEN] FOREIGN KEY([MaNV])
REFERENCES [dbo].[NHANVIEN] ([MaNV])
GO
ALTER TABLE [dbo].[THANNHAN] CHECK CONSTRAINT [FK_THANNHAN_NHANVIEN]
GO
USE [master]
GO
ALTER DATABASE [QuanLyDeAn] SET  READ_WRITE 
GO
