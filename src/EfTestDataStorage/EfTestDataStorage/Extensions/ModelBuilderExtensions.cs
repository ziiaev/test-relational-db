using Microsoft.EntityFrameworkCore;
using System.Text.RegularExpressions;

namespace EfTestDataStorage.Extensions
{
    internal static class ModelBuilderExtensions
    {
        internal static void NamesToSnakeCase(this ModelBuilder modelBuilder)
        {
            foreach (var entity in modelBuilder.Model.GetEntityTypes())
            {
                // Replace table names
                var tableName = entity.GetTableName();
                if (!string.IsNullOrEmpty(tableName))
                {
                    entity.SetTableName(tableName.ToSnakeCase());
                }

                // Replace column names            
                foreach (var property in entity.GetProperties())
                {
                    if (property != null)
                    {
                        property.SetColumnName(property.Name.ToSnakeCase());
                    }
                }

                foreach (var key in entity.GetKeys())
                {
                    var keyName = key.GetName();
                    if (!string.IsNullOrEmpty(keyName))
                    {
                        key.SetName(keyName.ToSnakeCase());
                    }
                }

                foreach (var key in entity.GetForeignKeys())
                {
                    var constraintName = key.GetConstraintName();
                    if (!string.IsNullOrEmpty(constraintName))
                    {
                        key.SetConstraintName(constraintName.ToSnakeCase());
                    }
                }

                foreach (var index in entity.GetIndexes())
                {
                    var indexName = index.GetDatabaseName();
                    if (!string.IsNullOrEmpty(indexName))
                    {
                        index.SetDatabaseName(indexName.ToSnakeCase());
                    }
                }
            }
        }

        internal static string ToSnakeCase(this string input)
        {
            if (string.IsNullOrEmpty(input)) { return input; }

            var startUnderscores = Regex.Match(input, @"^_+");
            return startUnderscores + Regex.Replace(input, @"([a-z0-9])([A-Z])", "$1_$2").ToLower();
        }
    }
}
