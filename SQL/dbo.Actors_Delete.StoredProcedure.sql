USE [Immersed]
GO
/****** Object:  StoredProcedure [dbo].[Actors_Delete]    Script Date: 1/28/2023 5:24:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

 --=============================================
 --Author: <Arenas, Jay>
 --Create date: <2022-11-16>
 --Description: <Delete for Actors>
 --Code Reviewer: 
 

 --MODIFIED BY: 
 --MODIFIED DATE:
 --Code Reviewer: 
 --Note: 
 --=============================================

CREATE proc [dbo].[Actors_Delete]
	   	   @Id int
		  ,@ModifiedBy int
		 
		 
as

/*  ----- TEST CODE ------ 

			DECLARE @Id int = 5
			       ,@ModifiedBy int  = 66

			EXECUTE dbo.Actors_Delete @Id
			                         ,@ModifiedBy 

*/

BEGIN

			DECLARE @dateNow datetime2 = GETUTCDATE()

			UPDATE dbo.Actors

			SET 
				 StatusTypeId = 5
				,ModifiedBy = @ModifiedBy
				,DateModified = @dateNow

			WHERE Id = @Id

END
GO
