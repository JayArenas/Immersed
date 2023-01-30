public interface IActorBatchService
{
    int AddActorBatch(ComprehensiveActorAccountAddRequest request, int userId);
    Paged<ActorBatchV2> GetAllActorsPaginated(int pageIndex, int pageSize);
    Paged<ActorBatch> GetActorByCreator(int pageIndex, int pageSize, string creator);
    Paged<ActorBatchV2> GetActorByActorName(int pageIndex, int pageSize, string actorName);
}