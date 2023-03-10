USE [Immersed]
GO
/****** Object:  UserDefinedTableType [dbo].[ActorAccount]    Script Date: 1/28/2023 5:24:54 PM ******/
CREATE TYPE [dbo].[ActorAccount] AS TABLE(
	[UserName] [nvarchar](100) NOT NULL,
	[AvatarUrl] [nvarchar](50) NOT NULL,
	[ZoneId] [int] NOT NULL,
	[ActorId] [int] NOT NULL,
	[AccountStatusId] [int] NOT NULL
)
GO
