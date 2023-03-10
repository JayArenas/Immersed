USE [Immersed]
GO
/****** Object:  StoredProcedure [dbo].[ActorsBatch_SelectByCreatedBy]    Script Date: 1/28/2023 5:24:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 --=============================================
 --Author: <Arenas, Jay>
 --Create date: <2022-11-16>
 --Description: <Select_ByCreatedBy for Actors>
 --Code Reviewer: 
 

 --MODIFIED BY: 
 --MODIFIED DATE:
 --Code Reviewer: 
 --Note: 
 --=============================================

 CREATE proc [dbo].[ActorsBatch_SelectByCreatedBy]
				@pageIndex int
			   ,@pageSize int
			   ,@CreatedBy nvarchar(50) 

 as

 /*  ----- TEST CODE ----- 
		
		DECLARE  @pageIndex int = 0
				,@pageSize int = 2
				,@CreatedBy nvarchar(50) = 'immersed'

		EXECUTE dbo.LokiActors_SelectByCreatedBy
				@pageIndex
			   ,@pageSize
			   ,@CreatedBy

*/   

BEGIN 

		DECLARE @Offset int = @pageIndex * @pageSize


SELECT           a.Id
			    ,a.[Name]
				,a.[Description]
				,a.ActorTypeId
				,a.StatusTypeId
				,c.[Name] as Consequence_Name
				,c.[Description] as Consequence_Desc
				,c.ConsequenceTypeId
				,ct.[Name] as Consequence_Type	
				,c.ZoneId				
				,ac.UserName
				,ac.AvatarUrl
				,ac.AccountStatusId
				,z.[Name] as Zone_Name
				,z.[Description] as Zone_Description
				,a.DateCreated
				,a.DateModified
			    ,TotalCount = COUNT(1) OVER ()

		FROM dbo.Actors as a								
					INNER JOIN dbo.Consequences as c
						ON a.Id = c.ActorId
					INNER JOIN dbo.ConsequenceTypes as ct
						on c.ConsequenceTypeId = ct.Id
					INNER JOIN dbo.ActorAccounts as ac
						on ac.ActorId = a.Id
					INNER JOIN dbo.Zones as z
						on ac.ZoneId = z.Id
					INNER JOIN dbo.Users as u
						on u.Id = a.CreatedBy
				
		WHERE u.FirstName = @CreatedBy
			  AND a.StatusTypeId = 1
			  AND a.Id >= 24

		ORDER BY a.Id desc
		OFFSET @Offset ROWS
		FETCH NEXT @pageSize ROWS ONLY 

END
GO
