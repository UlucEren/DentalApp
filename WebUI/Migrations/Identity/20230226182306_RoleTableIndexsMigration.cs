using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace WebUI.Migrations.Identity
{
    public partial class RoleTableIndexsMigration : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.CreateTable(
                name: "RoleTableIndexs",
                columns: table => new
                {
                    RoleId = table.Column<string>(type: "nvarchar(450)", maxLength: 450, nullable: false),
                    TableIndex = table.Column<float>(type: "real", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_RoleTableIndexs", x => x.RoleId);
                });
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropTable(
                name: "RoleTableIndexs");
        }
    }
}
