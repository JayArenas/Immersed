USE [Immersed]
GO
/****** Object:  StoredProcedure [dbo].[ActorTypes_SelectAll]    Script Date: 1/28/2023 5:24:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO





 --=============================================
 --Author: <Arenas, Jay>
 --Create date: <2022-11-16>
 --Description: <SelectAll for ActorTypes>
 --Code Reviewer: 
 

 --MODIFIED BY: 
 --MODIFIED DATE:
 --Code Reviewer: 
 --Note: 
 --=============================================



CREATE proc [dbo].[ActorTypes_SelectAll]



/*

EXECUTE dbo.ActorTypes_SelectAll


*/




as

BEGIN 

		SELECT [Id]
			  ,[Name]


		FROM dbo.ActorTypes

END
GO
