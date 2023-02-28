namespace WebUI.Models.AppIdentityDb
{
    public class AssignRoleToUserViewModel
    {
        public string Id { get; set; } = null!;
        public string Name { get; set; } = null!;
        public float TableIndex { get; set; }
        public bool Exist { get; set; }
        public AssignRoleToUserViewModel()
        {
            // parametresiz yapıcı metot
        }
        public AssignRoleToUserViewModel(string id, string name, bool exist, float tableIndex)
        {
            Id = id;
            Name = name;
            Exist = exist;
            TableIndex = tableIndex;
        }
    }
}
