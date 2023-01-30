﻿public class Actor
{
    public int Id { get; set; }
    public string Name { get; set; }
    public string Description { get; set; }
    public LookUp ActorTypeId { get; set; }
    public LookUp StatusTypeId { get; set; }
    public string CreatedBy { get; set; }
    public string ModifiedBy { get; set; }
    public DateTime DateCreated { get; set; }
    public DateTime DateModified { get; set; }

}