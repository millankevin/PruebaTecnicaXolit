USE [master]
GO
/****** Object:  Database [PruebaTecnicaXolit]    Script Date: 2/01/2023 12:13:23 p. m. ******/
CREATE DATABASE [PruebaTecnicaXolit]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'PruebaTecnicaXolit', FILENAME = N'D:\Programas\MSSQL15.MSSQLSERVER\MSSQL\DATA\PruebaTecnicaXolit.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'PruebaTecnicaXolit_log', FILENAME = N'D:\Programas\MSSQL15.MSSQLSERVER\MSSQL\DATA\PruebaTecnicaXolit_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [PruebaTecnicaXolit] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [PruebaTecnicaXolit].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [PruebaTecnicaXolit] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [PruebaTecnicaXolit] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [PruebaTecnicaXolit] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [PruebaTecnicaXolit] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [PruebaTecnicaXolit] SET ARITHABORT OFF 
GO
ALTER DATABASE [PruebaTecnicaXolit] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [PruebaTecnicaXolit] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [PruebaTecnicaXolit] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [PruebaTecnicaXolit] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [PruebaTecnicaXolit] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [PruebaTecnicaXolit] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [PruebaTecnicaXolit] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [PruebaTecnicaXolit] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [PruebaTecnicaXolit] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [PruebaTecnicaXolit] SET  DISABLE_BROKER 
GO
ALTER DATABASE [PruebaTecnicaXolit] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [PruebaTecnicaXolit] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [PruebaTecnicaXolit] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [PruebaTecnicaXolit] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [PruebaTecnicaXolit] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [PruebaTecnicaXolit] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [PruebaTecnicaXolit] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [PruebaTecnicaXolit] SET RECOVERY FULL 
GO
ALTER DATABASE [PruebaTecnicaXolit] SET  MULTI_USER 
GO
ALTER DATABASE [PruebaTecnicaXolit] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [PruebaTecnicaXolit] SET DB_CHAINING OFF 
GO
ALTER DATABASE [PruebaTecnicaXolit] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [PruebaTecnicaXolit] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [PruebaTecnicaXolit] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [PruebaTecnicaXolit] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'PruebaTecnicaXolit', N'ON'
GO
ALTER DATABASE [PruebaTecnicaXolit] SET QUERY_STORE = OFF
GO
USE [PruebaTecnicaXolit]
GO
/****** Object:  User [app]    Script Date: 2/01/2023 12:13:23 p. m. ******/
CREATE USER [app] FOR LOGIN [app] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  Table [dbo].[cliente]    Script Date: 2/01/2023 12:13:23 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cliente](
	[id_cliente] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](100) NOT NULL,
	[apellido] [varchar](100) NOT NULL,
	[identificacion] [varchar](25) NOT NULL,
	[correo_electronico] [varchar](100) NOT NULL,
	[telefono] [varchar](25) NOT NULL,
	[fk_id_tipo_cliente] [int] NOT NULL,
	[estado] [bit] NOT NULL,
	[fecha_creacion] [datetime] NOT NULL,
	[fecha_modificacion] [datetime] NOT NULL,
 CONSTRAINT [PK_cliente] PRIMARY KEY CLUSTERED 
(
	[id_cliente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cuenta]    Script Date: 2/01/2023 12:13:24 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cuenta](
	[id_cuenta] [int] IDENTITY(1,1) NOT NULL,
	[fk_id_cliente] [int] NOT NULL,
	[numero_cuenta] [varchar](100) NOT NULL,
	[saldo] [float] NOT NULL,
	[estado] [bit] NOT NULL,
	[fecha_creacion] [datetime] NOT NULL,
	[fecha_modificacion] [datetime] NOT NULL,
 CONSTRAINT [PK_cuenta] PRIMARY KEY CLUSTERED 
(
	[id_cuenta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tipo_cliente]    Script Date: 2/01/2023 12:13:24 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tipo_cliente](
	[id_tipo_cliente] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](50) NOT NULL,
 CONSTRAINT [PK_tipo_cliente] PRIMARY KEY CLUSTERED 
(
	[id_tipo_cliente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tipo_transaccion]    Script Date: 2/01/2023 12:13:24 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tipo_transaccion](
	[id_tipo_transaccion] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](50) NOT NULL,
 CONSTRAINT [PK_tipo_transaccion] PRIMARY KEY CLUSTERED 
(
	[id_tipo_transaccion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[transaccion]    Script Date: 2/01/2023 12:13:24 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[transaccion](
	[id_transaccion] [int] IDENTITY(1,1) NOT NULL,
	[fk_id_cuenta] [int] NOT NULL,
	[fk_id_tipo_transaccion] [int] NOT NULL,
	[cuenta_destino] [varchar](150) NULL,
	[comentario] [varchar](150) NULL,
	[valor] [float] NOT NULL,
	[estado] [bit] NOT NULL,
	[fecha_creacion] [datetime] NOT NULL,
	[fecha_modificacion] [datetime] NOT NULL,
 CONSTRAINT [PK_transaccion] PRIMARY KEY CLUSTERED 
(
	[id_transaccion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[usuario]    Script Date: 2/01/2023 12:13:24 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[usuario](
	[id_usuario] [int] IDENTITY(1,1) NOT NULL,
	[fk_id_cliente] [int] NOT NULL,
	[usuario] [varchar](50) NOT NULL,
	[contrasena] [varchar](max) NOT NULL,
	[estado] [bit] NOT NULL,
	[fecha_creacion] [datetime] NOT NULL,
	[fecha_modificacion] [datetime] NOT NULL,
 CONSTRAINT [PK_usuario] PRIMARY KEY CLUSTERED 
(
	[id_usuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[cliente] ON 

INSERT [dbo].[cliente] ([id_cliente], [nombre], [apellido], [identificacion], [correo_electronico], [telefono], [fk_id_tipo_cliente], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (1, N'KEVIN', N'MILLAN', N'123456789', N'KMILLAN@XOLIT.COM', N'321654987', 1, 1, CAST(N'2023-12-02T00:00:00.000' AS DateTime), CAST(N'2023-12-02T00:00:00.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[cliente] OFF
GO
SET IDENTITY_INSERT [dbo].[tipo_cliente] ON 

INSERT [dbo].[tipo_cliente] ([id_tipo_cliente], [nombre]) VALUES (1, N'INTERNO')
INSERT [dbo].[tipo_cliente] ([id_tipo_cliente], [nombre]) VALUES (2, N'EXTERNO')
SET IDENTITY_INSERT [dbo].[tipo_cliente] OFF
GO
SET IDENTITY_INSERT [dbo].[tipo_transaccion] ON 

INSERT [dbo].[tipo_transaccion] ([id_tipo_transaccion], [nombre]) VALUES (1, N'CONSULTA SALDO')
INSERT [dbo].[tipo_transaccion] ([id_tipo_transaccion], [nombre]) VALUES (2, N'RETIRO')
INSERT [dbo].[tipo_transaccion] ([id_tipo_transaccion], [nombre]) VALUES (3, N'CONSIGNACION')
INSERT [dbo].[tipo_transaccion] ([id_tipo_transaccion], [nombre]) VALUES (4, N'TRANSFERENCIA')
INSERT [dbo].[tipo_transaccion] ([id_tipo_transaccion], [nombre]) VALUES (5, N'CONSULTA MOVIMIENTOS')
SET IDENTITY_INSERT [dbo].[tipo_transaccion] OFF
GO
USE [master]
GO
ALTER DATABASE [PruebaTecnicaXolit] SET  READ_WRITE 
GO
