USE [Immersed]
GO
/****** Object:  StoredProcedure [dbo].[ActorsBatch_Paginate_All]    Script Date: 1/28/2023 5:24:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[ActorsBatch_Paginate_All]
				@pageIndex int
			   ,@pageSize int

/*
DECLARE @pageIndex int = 0
	   ,@pageSize int = 10
EXECUTE dbo. ActorsBatch_Paginate_ALL @pageIndex, @pageSize
*/

as

BEGIN 

		DECLARE @Offset int = @pageIndex * @pageSize


		SELECT   a.Id
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
				
		WHERE a.Id >= 23
		       AND a.StatusTypeId = 1
			  

		ORDER BY a.Id desc
		OFFSET @Offset ROWS
		FETCH NEXT @pageSize ROWS ONLY 

END
GO
