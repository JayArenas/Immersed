USE [Immersed]
GO
/****** Object:  StoredProcedure [dbo].[ActorAccount_Batch_Insert]    Script Date: 1/28/2023 5:24:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO






 --=============================================
 --Author: <Arenas, Jay>
 --Create date: <2022-12-4>
 --Description: <Batch Insert ActorsAccount>
 --Code Reviewer: 
 

 --MODIFIED BY: 
 --MODIFIED DATE:
 --Code Reviewer: 
 --Note: 
 --=============================================

 CREATE PROC [dbo].[ActorAccount_Batch_Insert]
			     @newActorAccounts dbo.ActorAccounts READONLY 
				,@ActorName nvarchar(100)
				,@ActorDescription nvarchar(500)
				,@ActorTypeId int
				,@StatusTypeId int
				,@conName nvarchar(100)
				,@conDescription nvarchar(500)
				,@ConsequenceTypeId int
				,@ZoneId int
				,@CreatedBy int
				,@ModifiedBy int
				,@Id int OUTPUT	
				,@ActorId int OUTPUT
				,@ConId int OUTPUT

/*
   DECLARE @Id int = 0; 
   DECLARE @ActorId int = 0;
   DECLARE @ConId int = 0;

   DECLARE @ActorName nvarchar(100) = 'New UdT'
          ,@ActorDescription nvarchar(50) = 'Password1!'
		  ,@ActorTypeId int = 2
		  ,@StatusTypeId int = 1		  
		  ,@conName nvarchar(100) = 'Con Test zone gone'
		  ,@conDescription nvarchar(500) = 'Con Test UDT description' 
		  ,@ConsequenceTypeId int = 2
		  ,@ZoneId int = 2
		  ,@CreatedBy int = 66
		  ,@ModifiedBy int = 66
 
   DECLARE @newActorAccounts dbo.ActorAccount

   
   INSERT INTO @newActorAccounts (UserName, AvatarUrl, AccountStatusId)
   
   VALUES ('New UDT', 'https://tinyurl.com/5n6btuxe', 1), ('New UDT 2', 'https://tinyurl.com/5n6btuxe', 1), ('New UDT 3', 'https://tinyurl.com/5n6btuxe', 1)

   EXECUTE [dbo].[ActorAccount_Batch_Insert]
					     @newActorAccount
						,@ActorName 
						,@ActorDescription
						,@ActorTypeId
						,@StatusTypeId						
						,@conName 
						,@conDescription 
						,@ConsequenceTypeId 
						,@ZoneId 						
						,@CreatedBy 
						,@ModifiedBy 
						,@Id OUTPUT	
						,@ActorId OUTPUT
						,@ConId OUTPUT
		  
*/


as

BEGIN 

		INSERT INTO dbo.Actors 
							(
							 [Name] 
							,[Description]
							,ActorTypeId
							,StatusTypeId
							,CreatedBy
							,ModifiedBy
							)

	    VALUES             (
						    @ActorName
						   ,@ActorDescription
						   ,@ActorTypeId
						   ,@StatusTypeId
						   ,@CreatedBy
						   ,@ModifiedBy
						   )
	
		SET @Id = SCOPE_IDENTITY()


		INSERT INTO dbo.ActorAccounts
							(
							 UserName							
							,AvatarUrl
							,ZoneId
							,ActorId
							,AccountStatusId
							,CreatedBy
							,ModifiedBy
							)
		SELECT   
							 ns.UserName							
							,ns.AvatarUrl
							,@ZoneId
							,@Id
							,ns.AccountStatusId
							,@CreatedBy
							,@ModifiedBy
				

		FROM @newActorAccounts as ns
		WHERE NOT EXISTS    (
							SELECT 1
							FROM dbo.ActorAccounts as a 
							WHERE a.[UserName] = ns.[UserName]
							)
		SET @ActorId = SCOPE_IDENTITY()



		INSERT INTO 
						[dbo].[Consequences]
					   ([Name]
					   ,[Description]
					   ,[ConsequenceTypeId]
					   ,[ActorId]
					   ,[ZoneId]					  
					   ,[CreatedBy]
					   ,[ModifiedBy])

       VALUES
					   (@conName
					   ,@conDescription
					   ,@ConsequenceTypeId
					   ,@Id
					   ,@ZoneId					   
					   ,@CreatedBy
					   ,@ModifiedBy)

		SET @ConId = SCOPE_IDENTITY()
							 

		
 END 

GO
