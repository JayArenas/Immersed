USE [Immersed]
GO
/****** Object:  StoredProcedure [dbo].[Actors_SelectByCreatedBy]    Script Date: 1/28/2023 5:24:55 PM ******/
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

 CREATE proc [dbo].[Actors_SelectByCreatedBy]
				@PageIndex int
			   ,@PageSize int
			   ,@CreatedBy nvarchar(50) 

 as

 /*  ----- TEST CODE ----- 
		
		DECLARE  @PageIndex int = 0
				,@PageSize int = 2
				,@CreatedBy nvarchar(50) = 'joe'

		EXECUTE dbo.Actors_SelectByCreatedBy   
				@PageIndex
			   ,@PageSize
			   ,@CreatedBy

*/   

BEGIN 

		DECLARE @Offset int = @PageIndex * @PageSize

		SELECT   a.Id
				,a.[Name]
				,a.[Description]
				,ac.Id as ActorTypeId
				,ac.[Name] as ActorTypeName
				,st.Id as statusTypeId
				,st.[Name] as StatusType
				,u.FirstName as CreatedBy
				,u2.FirstName as ModifiedBy
				,a.DateCreated
				,a.DateModified
			    ,TotalCount = COUNT(1) OVER ()

		FROM dbo.Actors as a 
					INNER JOIN dbo.ActorTypes as ac
						ON a.ActorTypeId = ac.Id
					INNER JOIN dbo.Users as u
						ON a.CreatedBy = u.Id
					INNER JOIN dbo.Users as u2
						ON a.ModifiedBy = u2.Id
					INNER JOIN dbo.StatusTypes as st
						ON a.StatusTypeId = st.Id

		WHERE u.FirstName = @CreatedBy
				AND a.StatusTypeId = 1

		ORDER BY a.Id desc
		OFFSET @Offset ROWS
		FETCH NEXT @PageSize ROWS ONLY 

END





GO
