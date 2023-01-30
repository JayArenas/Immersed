public interface IActorService
{
    int AddActor(ActorsAddRequest request, int userId);
    List<Actor> GetAllActors();

    public Paged<Actor> GetAllActorsPaginate(int pageIndex, int pageSize);
    Actor GetActorById(int id);
    public Paged<Actor> GetByCreator(int pageIndex, int pageSize, string creator);
    void DeleteActor(int id, int userId);
    void UpdateActor(ActorUpdateRequest update, int userId);

}