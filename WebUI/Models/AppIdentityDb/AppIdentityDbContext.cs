using Microsoft.AspNetCore.Identity.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace WebUI.Models.AppIdentityDb
{
    public class AppIdentityDbContext : IdentityDbContext<AppUser, AppRole, string>
    {
        public AppIdentityDbContext(DbContextOptions<AppIdentityDbContext> options): base(options)
        {
        }
        //protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        //{
        //    optionsBuilder.UseSqlServer(@"Data Source=DESKTOP-Q2ICC8E\\SQLEXPRESS;Integrated Security=True;Connect Timeout=30;Initial Catalog=DentalAppDB ; Encrypt=False;TrustServerCertificate=False;ApplicationIntent=ReadWrite;MultiSubnetFailover=False");
        //}
        public virtual DbSet<RoleTableIndexs> RoleTableIndexs { get; set; }
    }
}
