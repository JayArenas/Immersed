USE [Immersed]
GO
/****** Object:  StoredProcedure [dbo].[Actors_SelectAll]    Script Date: 1/28/2023 5:24:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

 --=============================================
 --Author: <Arenas, Jay>
 --Create date: <2022-11-16>
 --Description: <SelectAll for Actors>
 --Code Reviewer: 
 

 --MODIFIED BY: 
 --MODIFIED DATE:
 --Code Reviewer: 
 --Note: 
 --=============================================

CREATE proc [dbo].[Actors_SelectAll]

as

/*   ------ TEST CODE ------

EXECUTE dbo.Actors_SelectAll

*/

BEGIN 

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

	FROM dbo.Actors as a 
			INNER JOIN dbo.ActorTypes as ac
				ON a.ActorTypeId = ac.Id
			INNER JOIN dbo.Users as u
				ON a.CreatedBy = u.Id
			INNER JOIN dbo.Users as u2
				ON a.ModifiedBy = u2.Id
			INNER JOIN dbo.StatusTypes as st
				ON a.StatusTypeId = st.Id		

	WHERE a.StatusTypeId = 1 

END
GO
