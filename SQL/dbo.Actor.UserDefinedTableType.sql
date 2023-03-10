USE [Immersed]
GO
/****** Object:  UserDefinedTableType [dbo].[Actor]    Script Date: 1/28/2023 5:24:54 PM ******/
CREATE TYPE [dbo].[Actor] AS TABLE(
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[Description] [nvarchar](500) NOT NULL,
	[ActorTypeId] [int] NOT NULL,
	[StatusTypeId] [int] NOT NULL,
	[CreatedBy] [int] NOT NULL,
	[ModifiedBy] [int] NOT NULL,
	[DateCreated] [datetime2](7) NULL DEFAULT (getutcdate()),
	[DateModified] [datetime2](7) NULL DEFAULT (getutcdate()),
	PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (IGNORE_DUP_KEY = OFF)
)
GO
