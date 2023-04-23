using Entities.Concrete;
using Microsoft.EntityFrameworkCore;

namespace DataAccess.Context.EntityFramework
{
    public class SimpleContextDb : DbContext
    {
        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        {
            optionsBuilder.UseSqlServer("Server=DESKTOP-Q2ICC8E\\SQLEXPRESS;Database=DentalAppDB;Integrated Security=true;");
        }

        public DbSet<User> Users { get; set; }
        public DbSet<OperationClaim> OperationClaims { get; set; }
        public DbSet<UserOperationClaim> UserOperationClaims { get; set; }
        public DbSet<EmailParameter> EmailParameters { get; set; }
        public DbSet<AccountsTariffNames> AccountsTariffNames { get; set; }
        public DbSet<AccountsTariffNamesCategories> AccountsTariffNamesCategories { get; set; }
        public DbSet<AccountsTariffLists> AccountsTariffLists { get; set; }
        public DbSet<TDBCostNames> TDBCostNames { get; set; }
    }
}
