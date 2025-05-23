USE [master]
GO
/****** Object:  Database [LegoCollection]    Script Date: 5/23/2025 12:52:40 PM ******/
CREATE DATABASE [LegoCollection]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'LegoCollection', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS01\MSSQL\DATA\LegoCollection.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'LegoCollection_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS01\MSSQL\DATA\LegoCollection_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [LegoCollection] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [LegoCollection].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [LegoCollection] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [LegoCollection] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [LegoCollection] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [LegoCollection] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [LegoCollection] SET ARITHABORT OFF 
GO
ALTER DATABASE [LegoCollection] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [LegoCollection] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [LegoCollection] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [LegoCollection] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [LegoCollection] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [LegoCollection] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [LegoCollection] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [LegoCollection] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [LegoCollection] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [LegoCollection] SET  DISABLE_BROKER 
GO
ALTER DATABASE [LegoCollection] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [LegoCollection] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [LegoCollection] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [LegoCollection] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [LegoCollection] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [LegoCollection] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [LegoCollection] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [LegoCollection] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [LegoCollection] SET  MULTI_USER 
GO
ALTER DATABASE [LegoCollection] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [LegoCollection] SET DB_CHAINING OFF 
GO
ALTER DATABASE [LegoCollection] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [LegoCollection] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [LegoCollection] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [LegoCollection] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [LegoCollection] SET QUERY_STORE = ON
GO
ALTER DATABASE [LegoCollection] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [LegoCollection]
GO
/****** Object:  Schema [collection]    Script Date: 5/23/2025 12:52:40 PM ******/
CREATE SCHEMA [collection]
GO
/****** Object:  Schema [parts]    Script Date: 5/23/2025 12:52:40 PM ******/
CREATE SCHEMA [parts]
GO
/****** Object:  Schema [sets]    Script Date: 5/23/2025 12:52:40 PM ******/
CREATE SCHEMA [sets]
GO
/****** Object:  Table [collection].[images]    Script Date: 5/23/2025 12:52:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [collection].[images](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[file_url] [varchar](max) NOT NULL,
	[created_at] [datetime2](7) NOT NULL,
	[updated_at] [datetime2](7) NULL,
 CONSTRAINT [pk_collection_images] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [collection].[users]    Script Date: 5/23/2025 12:52:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [collection].[users](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[username] [varchar](12) NOT NULL,
	[email] [varchar](100) NOT NULL,
	[password_hash] [binary](1) NOT NULL,
	[created_at] [datetime2](7) NOT NULL,
	[updated_at] [datetime2](7) NULL,
 CONSTRAINT [pk_collection_users] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [parts].[categories]    Script Date: 5/23/2025 12:52:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [parts].[categories](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](64) NOT NULL,
	[created_at] [datetime2](7) NOT NULL,
	[updated_at] [datetime2](7) NULL,
 CONSTRAINT [pk_parts_categories] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [uq_parts_categories_name] UNIQUE NONCLUSTERED 
(
	[name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [parts].[colors]    Script Date: 5/23/2025 12:52:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [parts].[colors](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](60) NOT NULL,
	[created_at] [datetime2](7) NOT NULL,
	[updated_at] [datetime2](7) NULL,
 CONSTRAINT [pk_parts_colors] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [parts].[images]    Script Date: 5/23/2025 12:52:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [parts].[images](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[part_id] [int] NOT NULL,
	[image_id] [int] NOT NULL,
	[created_at] [datetime2](7) NOT NULL,
	[updated_at] [datetime2](7) NULL,
 CONSTRAINT [pk_parts_images] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [parts].[parts]    Script Date: 5/23/2025 12:52:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [parts].[parts](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[shape_id] [int] NOT NULL,
	[element_id] [varchar](25) NULL,
	[color_id] [int] NOT NULL,
	[owned_count] [int] NOT NULL,
	[wanted_count] [int] NOT NULL,
	[created_at] [datetime2](7) NOT NULL,
	[updated_at] [datetime2](7) NULL,
 CONSTRAINT [pk_parts_parts] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [parts].[shapes]    Script Date: 5/23/2025 12:52:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [parts].[shapes](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[design_id] [varchar](20) NULL,
	[description] [varchar](255) NOT NULL,
	[category_id] [int] NULL,
	[created_at] [datetime2](7) NOT NULL,
	[updated_at] [datetime2](7) NULL,
 CONSTRAINT [pk_parts_shapes] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [sets].[images]    Script Date: 5/23/2025 12:52:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [sets].[images](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[set_id] [int] NOT NULL,
	[image_id] [int] NOT NULL,
	[created_at] [datetime2](7) NOT NULL,
	[updated_at] [datetime2](7) NULL,
 CONSTRAINT [pk_sets_images] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [sets].[parts]    Script Date: 5/23/2025 12:52:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [sets].[parts](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[set_id] [int] NOT NULL,
	[part_id] [int] NOT NULL,
	[required_count] [int] NULL,
	[created_at] [datetime2](7) NOT NULL,
	[updated_at] [datetime2](7) NULL,
 CONSTRAINT [pk_sets_parts] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [sets].[sets]    Script Date: 5/23/2025 12:52:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [sets].[sets](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[item_number] [varchar](20) NULL,
	[name] [varchar](255) NULL,
	[status_id] [int] NOT NULL,
	[owned_count] [int] NOT NULL,
	[wanted_count] [int] NOT NULL,
	[created_at] [datetime2](7) NOT NULL,
	[updated_at] [datetime2](7) NULL,
 CONSTRAINT [pk_sets_sets] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [sets].[status]    Script Date: 5/23/2025 12:52:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [sets].[status](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](16) NOT NULL,
 CONSTRAINT [pk_sets_status] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [uq_sets_status_name] UNIQUE NONCLUSTERED 
(
	[name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [collection].[images] ADD  CONSTRAINT [df_collection_images_created]  DEFAULT (sysdatetime()) FOR [created_at]
GO
ALTER TABLE [collection].[users] ADD  CONSTRAINT [df_collection_users_created]  DEFAULT (sysdatetime()) FOR [created_at]
GO
ALTER TABLE [parts].[categories] ADD  CONSTRAINT [df_parts_categories_created]  DEFAULT (sysdatetime()) FOR [created_at]
GO
ALTER TABLE [parts].[colors] ADD  CONSTRAINT [df_parts_colors_created]  DEFAULT (sysdatetime()) FOR [created_at]
GO
ALTER TABLE [parts].[images] ADD  CONSTRAINT [df_parts_images_created]  DEFAULT (sysdatetime()) FOR [created_at]
GO
ALTER TABLE [parts].[parts] ADD  CONSTRAINT [df_parts_parts_owned]  DEFAULT ((0)) FOR [owned_count]
GO
ALTER TABLE [parts].[parts] ADD  CONSTRAINT [df_parts_parts_wanted]  DEFAULT ((0)) FOR [wanted_count]
GO
ALTER TABLE [parts].[parts] ADD  CONSTRAINT [df_parts_parts_created]  DEFAULT (sysdatetime()) FOR [created_at]
GO
ALTER TABLE [parts].[shapes] ADD  CONSTRAINT [df_parts_shapes_created]  DEFAULT (sysdatetime()) FOR [created_at]
GO
ALTER TABLE [sets].[images] ADD  CONSTRAINT [df_sets_images_created]  DEFAULT (sysdatetime()) FOR [created_at]
GO
ALTER TABLE [sets].[parts] ADD  CONSTRAINT [df_sets_parts_created]  DEFAULT (sysdatetime()) FOR [created_at]
GO
ALTER TABLE [sets].[sets] ADD  CONSTRAINT [df_sets_sets_status]  DEFAULT ((4)) FOR [status_id]
GO
ALTER TABLE [sets].[sets] ADD  CONSTRAINT [df_sets_sets_owned]  DEFAULT ((0)) FOR [owned_count]
GO
ALTER TABLE [sets].[sets] ADD  CONSTRAINT [df_sets_sets_wanted]  DEFAULT ((0)) FOR [wanted_count]
GO
ALTER TABLE [sets].[sets] ADD  CONSTRAINT [df_parts_images_created]  DEFAULT (sysdatetime()) FOR [created_at]
GO
ALTER TABLE [parts].[images]  WITH CHECK ADD  CONSTRAINT [fk_parts_images_image_collection_images] FOREIGN KEY([image_id])
REFERENCES [collection].[images] ([id])
ON DELETE CASCADE
GO
ALTER TABLE [parts].[images] CHECK CONSTRAINT [fk_parts_images_image_collection_images]
GO
ALTER TABLE [parts].[images]  WITH CHECK ADD  CONSTRAINT [fk_parts_images_part_parts] FOREIGN KEY([part_id])
REFERENCES [parts].[parts] ([id])
ON DELETE CASCADE
GO
ALTER TABLE [parts].[images] CHECK CONSTRAINT [fk_parts_images_part_parts]
GO
ALTER TABLE [parts].[parts]  WITH CHECK ADD  CONSTRAINT [fk_parts_parts_color_colors] FOREIGN KEY([color_id])
REFERENCES [parts].[colors] ([id])
ON DELETE CASCADE
GO
ALTER TABLE [parts].[parts] CHECK CONSTRAINT [fk_parts_parts_color_colors]
GO
ALTER TABLE [parts].[parts]  WITH CHECK ADD  CONSTRAINT [fk_parts_parts_shape_shapes] FOREIGN KEY([shape_id])
REFERENCES [parts].[shapes] ([id])
ON DELETE CASCADE
GO
ALTER TABLE [parts].[parts] CHECK CONSTRAINT [fk_parts_parts_shape_shapes]
GO
ALTER TABLE [parts].[shapes]  WITH CHECK ADD  CONSTRAINT [fk_parts_shapes_category_categories] FOREIGN KEY([category_id])
REFERENCES [parts].[categories] ([id])
ON DELETE SET NULL
GO
ALTER TABLE [parts].[shapes] CHECK CONSTRAINT [fk_parts_shapes_category_categories]
GO
ALTER TABLE [sets].[images]  WITH CHECK ADD  CONSTRAINT [fk_sets_images_image_collection_images] FOREIGN KEY([image_id])
REFERENCES [collection].[images] ([id])
ON DELETE CASCADE
GO
ALTER TABLE [sets].[images] CHECK CONSTRAINT [fk_sets_images_image_collection_images]
GO
ALTER TABLE [sets].[images]  WITH CHECK ADD  CONSTRAINT [fk_sets_images_set_sets] FOREIGN KEY([set_id])
REFERENCES [sets].[sets] ([id])
ON DELETE CASCADE
GO
ALTER TABLE [sets].[images] CHECK CONSTRAINT [fk_sets_images_set_sets]
GO
ALTER TABLE [sets].[parts]  WITH CHECK ADD  CONSTRAINT [fk_sets_parts_part_parts_parts] FOREIGN KEY([part_id])
REFERENCES [parts].[parts] ([id])
GO
ALTER TABLE [sets].[parts] CHECK CONSTRAINT [fk_sets_parts_part_parts_parts]
GO
ALTER TABLE [sets].[parts]  WITH CHECK ADD  CONSTRAINT [fk_sets_parts_set_sets] FOREIGN KEY([set_id])
REFERENCES [sets].[sets] ([id])
ON DELETE CASCADE
GO
ALTER TABLE [sets].[parts] CHECK CONSTRAINT [fk_sets_parts_set_sets]
GO
ALTER TABLE [sets].[sets]  WITH CHECK ADD  CONSTRAINT [fk_sets_sets_status_status] FOREIGN KEY([status_id])
REFERENCES [sets].[status] ([id])
GO
ALTER TABLE [sets].[sets] CHECK CONSTRAINT [fk_sets_sets_status_status]
GO
USE [master]
GO
ALTER DATABASE [LegoCollection] SET  READ_WRITE 
GO
