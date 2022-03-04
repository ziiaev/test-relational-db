using System;
using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace EfTestDataStorage.Migrations
{
    public partial class SchemaUpdate : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "fk_projects_project_sets_project_set_id",
                table: "projects");

            migrationBuilder.DropTable(
                name: "project_sets");

            migrationBuilder.RenameColumn(
                name: "project_set_id",
                table: "projects",
                newName: "customer_id");

            migrationBuilder.RenameIndex(
                name: "ix_projects_project_set_id",
                table: "projects",
                newName: "ix_projects_customer_id");

            migrationBuilder.RenameColumn(
                name: "email",
                table: "customers",
                newName: "phone_number");

            migrationBuilder.AddColumn<string>(
                name: "project_health",
                table: "projects",
                type: "text",
                nullable: false,
                defaultValue: "");

            migrationBuilder.AddColumn<string>(
                name: "project_status",
                table: "projects",
                type: "text",
                nullable: false,
                defaultValue: "");

            migrationBuilder.CreateTable(
                name: "technology",
                columns: table => new
                {
                    id = table.Column<Guid>(type: "uuid", nullable: false),
                    name = table.Column<string>(type: "text", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("pk_technology", x => x.id);
                });

            migrationBuilder.CreateTable(
                name: "project_technology",
                columns: table => new
                {
                    project_id = table.Column<Guid>(type: "uuid", nullable: false),
                    technology_id = table.Column<Guid>(type: "uuid", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("pk_project_technology", x => new { x.project_id, x.technology_id });
                    table.ForeignKey(
                        name: "fk_project_technology_projects_project_id",
                        column: x => x.project_id,
                        principalTable: "projects",
                        principalColumn: "id",
                        onDelete: ReferentialAction.Cascade);
                    table.ForeignKey(
                        name: "fk_project_technology_technology_technology_id",
                        column: x => x.technology_id,
                        principalTable: "technology",
                        principalColumn: "id",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateIndex(
                name: "ix_project_technology_technology_id",
                table: "project_technology",
                column: "technology_id");

            migrationBuilder.AddForeignKey(
                name: "fk_projects_customers_customer_id",
                table: "projects",
                column: "customer_id",
                principalTable: "customers",
                principalColumn: "id",
                onDelete: ReferentialAction.Cascade);
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "fk_projects_customers_customer_id",
                table: "projects");

            migrationBuilder.DropTable(
                name: "project_technology");

            migrationBuilder.DropTable(
                name: "technology");

            migrationBuilder.DropColumn(
                name: "project_health",
                table: "projects");

            migrationBuilder.DropColumn(
                name: "project_status",
                table: "projects");

            migrationBuilder.RenameColumn(
                name: "customer_id",
                table: "projects",
                newName: "project_set_id");

            migrationBuilder.RenameIndex(
                name: "ix_projects_customer_id",
                table: "projects",
                newName: "ix_projects_project_set_id");

            migrationBuilder.RenameColumn(
                name: "phone_number",
                table: "customers",
                newName: "email");

            migrationBuilder.CreateTable(
                name: "project_sets",
                columns: table => new
                {
                    id = table.Column<Guid>(type: "uuid", nullable: false),
                    customer_id = table.Column<Guid>(type: "uuid", nullable: false),
                    description = table.Column<string>(type: "text", nullable: false),
                    name = table.Column<string>(type: "text", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("pk_project_sets", x => x.id);
                    table.ForeignKey(
                        name: "fk_project_sets_customers_customer_id",
                        column: x => x.customer_id,
                        principalTable: "customers",
                        principalColumn: "id",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateIndex(
                name: "ix_project_sets_customer_id",
                table: "project_sets",
                column: "customer_id");

            migrationBuilder.AddForeignKey(
                name: "fk_projects_project_sets_project_set_id",
                table: "projects",
                column: "project_set_id",
                principalTable: "project_sets",
                principalColumn: "id",
                onDelete: ReferentialAction.Cascade);
        }
    }
}
