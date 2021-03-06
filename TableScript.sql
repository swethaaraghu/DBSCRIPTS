USE [MyCar]
GO
/****** Object:  Table [dbo].[Tbl_Customer]    Script Date: 3/27/2022 4:21:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tbl_Customer](
	[CustomerId] [nvarchar](36) NOT NULL,
	[Name] [varchar](150) NOT NULL,
	[Password] [nvarchar](50) NOT NULL,
	[LastUpdated] [datetime] NOT NULL,
 CONSTRAINT [PK_Tbl_Customer] PRIMARY KEY CLUSTERED 
(
	[CustomerId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tbl_Driver]    Script Date: 3/27/2022 4:21:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tbl_Driver](
	[DriverId] [nvarchar](36) NOT NULL,
	[Name] [varchar](150) NOT NULL,
	[Rating] [int] NULL,
 CONSTRAINT [PK_Tbl_Driver] PRIMARY KEY CLUSTERED 
(
	[DriverId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tbl_Vehicle]    Script Date: 3/27/2022 4:21:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tbl_Vehicle](
	[VehicleId] [nvarchar](36) NOT NULL,
	[CustomerId] [nvarchar](36) NOT NULL,
	[DriverId] [nvarchar](36) NOT NULL,
	[Vin] [varchar](17) NOT NULL,
	[LicensePlate] [varchar](15) NOT NULL,
	[Speed] [int] NULL,
	[Latitude] [decimal](18, 0) NULL,
	[Longitude] [decimal](18, 0) NULL,
 CONSTRAINT [PK_Tbl_Vehicle] PRIMARY KEY CLUSTERED 
(
	[VehicleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Tbl_Vehicle]  WITH CHECK ADD  CONSTRAINT [FK_Tbl_Vehicle_Tbl_Customer] FOREIGN KEY([CustomerId])
REFERENCES [dbo].[Tbl_Customer] ([CustomerId])
GO
ALTER TABLE [dbo].[Tbl_Vehicle] CHECK CONSTRAINT [FK_Tbl_Vehicle_Tbl_Customer]
GO
ALTER TABLE [dbo].[Tbl_Vehicle]  WITH CHECK ADD  CONSTRAINT [FK_Tbl_Vehicle_Tbl_Driver] FOREIGN KEY([DriverId])
REFERENCES [dbo].[Tbl_Driver] ([DriverId])
GO
ALTER TABLE [dbo].[Tbl_Vehicle] CHECK CONSTRAINT [FK_Tbl_Vehicle_Tbl_Driver]
GO
