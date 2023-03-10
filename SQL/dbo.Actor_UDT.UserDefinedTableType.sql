USE [Immersed]
GO
/****** Object:  UserDefinedTableType [dbo].[Actor_UDT]    Script Date: 1/28/2023 5:24:54 PM ******/
CREATE TYPE [dbo].[Actor_UDT] AS TABLE(
	[Name] [nvarchar](100) NOT NULL,
	[Description] [nvarchar](500) NOT NULL,
	[ActorTypeId] [int] NOT NULL,
	[StatusTypeId] [int] NOT NULL,
	[CreatedBy] [int] NOT NULL,
	[ModifiedBy] [int] NOT NULL,
	[DateCreated] [datetime2](7) NULL DEFAULT (getutcdate()),
	[DateModified] [datetime2](7) NULL DEFAULT (getutcdate())
)
GO
