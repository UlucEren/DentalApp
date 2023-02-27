using Microsoft.AspNetCore.Identity;

namespace WebUI.Models.AppIdentityDb
{
	public class AppRole : IdentityRole
	{

		public AppRole() : base() { }

		public AppRole(string roleName) : base(roleName)
		{
		}
	}
}