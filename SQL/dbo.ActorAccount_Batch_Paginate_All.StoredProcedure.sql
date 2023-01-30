USE [Immersed]
GO
/****** Object:  StoredProcedure [dbo].[ActorAccount_Batch_Paginate_All]    Script Date: 1/28/2023 5:24:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




--=============================================
--Author: <Arenas, Jay>
--Create date: <2022-12-08>
--Description: <Actors Batch Paginate>
--Code Reviewer: 
 

--MODIFIED BY: 
--MODIFIED DATE:
--Code Reviewer: 
--Note: 
--=============================================

CREATE proc [dbo].[ActorAccount_Batch_Paginate_All]
						 @PageIndex int
						,@PageSize int


as

/*

		DECLARE			 @PageIndex int = 0
						,@PageSize int = 100
				
		EXECUTE [dbo].[ActorAccount_Batch_Paginate_All]
						 @PageIndex
						,@PageSize

		SELECT * 
		FROM dbo.actors
		WHERE actors.id > 30

			  
*/

BEGIN 

	DECLARE @offset int = @PageIndex * @PageSize

	SELECT			     a.Id
						,a.[Name]
						,a.[Description] as ActorDescription				
						,a.ActorTypeId				
						,a.StatusTypeId as ActorStatusId
						,a.CreatedBy
						,a.ModifiedBy
				        ,ActorAccounts = (
											SELECT ac.Id
												  ,ac.UserName
												  ,ac.AvatarUrl 										  
												  ,z.[Id] as [Zone.Id]
												  ,z.[Name] as [Zone.Name]
												  ,acs.Id as [AccountStatus.Id]	
												  ,acs.[Name] as [AccountStatus.Name]
											FROM dbo.ActorAccounts as ac 					
												 LEFT JOIN dbo.Zones as z 
													on z.Id = ac.ZoneId
												 INNER JOIN dbo.AccountStatus as acs
													on acs.Id = ac.AccountStatusId
											WHERE   ac.ActorId = a.Id
											FOR JSON PATH
										 )
						,c.[Name] as Consequence_Name
						,c.[Description] as Consequence_Desc
						,c.ConsequenceTypeId 		
						,z.Id as [ZoneId]
						,z.[Name] as [ZoneName]
						,z.[Description] as [ZoneDescription]
						,a.DateCreated
						,a.DateModified
						,TotalCount = COUNT(1) OVER ()

	FROM      dbo.Actors as a						
						LEFT JOIN dbo.Consequences as c 
							on c.ActorId =  a.Id
						LEFT JOIN dbo.ConsequenceTypes as ct
							on c.ConsequenceTypeId = ct.Id	
						LEFT JOIN dbo.Zones as z
							on z.Id = c.ZoneId
		
	WHERE  a.Id > 30		
				ORDER BY a.Id DESC		
				OFFSET @Offset ROWS
				FETCH NEXT @PageSize ROWS ONLY 
	
	
END 

 
GO
