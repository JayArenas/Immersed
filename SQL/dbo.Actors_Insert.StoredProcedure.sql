USE [Immersed]
GO
/****** Object:  StoredProcedure [dbo].[Actors_Insert]    Script Date: 1/28/2023 5:24:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO





 --=============================================
 --Author: <Arenas, Jay>
 --Create date: <2022-11-16>
 --Description: <Insert for Actors>
 --Code Reviewer: 
 

 --MODIFIED BY: 
 --MODIFIED DATE:
 --Code Reviewer: 
 --Note: 
 --=============================================

CREATE proc [dbo].[Actors_Insert]
			@Name nvarchar(100)
		   ,@Description nvarchar(500)
		   ,@ActorTypeId int 
		   ,@StatusTypeId int
		   ,@CreatedBy int
		   ,@ModifiedBy int 
		   ,@Id int OUTPUT 
as 


/*

	DECLARE @Id int = 0
		   ,@Name nvarchar(100) = 'PEER review # 3' 
		   ,@Description nvarchar(500) = 'peer review' 
		   ,@ActorTypeId int = 5
		   ,@StatusTypeId int = 1
		   ,@CreatedBy int = 85
		   ,@ModifiedBy int = 85

	EXECUTE dbo.Actors_Insert
			@Name 
		   ,@Description
		   ,@ActorTypeId
		   ,@StatusTypeId
		   ,@CreatedBy
		   ,@ModifiedBy
		   ,@Id OUTPUT

*/

BEGIN 

	INSERT INTO dbo.Actors
		    ([Name]
			,[Description]
			,ActorTypeId
			,StatusTypeId
			,CreatedBy
			,ModifiedBy)


	VALUES 
			(@Name
			,@Description
			,@ActorTypeId
			,@StatusTypeId
			,@CreatedBy
			,@ModifiedBy)

	SET @Id = SCOPE_IDENTITY()

END
GO
