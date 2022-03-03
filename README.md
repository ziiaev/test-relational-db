# test-relational-db
This is test class library to generate database using EF Core code first approach
This is not executable application. You need to perform next steps to configure the database.

1. Install Docker
2. Run <docker compose -f .\docker-compose-postgresql.yml up> command
3. Wait until containers are running
4. Install entity framework core tools using <dotnet tool install --global dotnet-ef> command
5. Run <dotnet ef database update --project .\src\EfTestDataStorage\EfTestDataStorage\EfTestDataStorage.csproj> command
6. Go to http://localhost:5433/
7. Enter using next credentials:
   email: admin@gmail.com
   password: 1qaz@WSX
8. Create server
   Name: <any name>
   Host name/address: To determine address of postgres run <docker inspect --format='{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' dev_postgre> command
   Username: admin
   Password: 1qaz@WSX
9. See that tables are created sucessfully


Schema description:

'Roles' table: 'Senior Software Engineer', 'Software Engineer', etc.
'Units' table: 'MSTD', etc.
'DocumentTypes': 'Passport', 'Diploma', etc.
'ProjectRoleTypes': 'Scrum master', 'Team lead', 'Tech lead', 'Key developer' etc.

'Units' table might have Parent unit in the same table.
'Units' table must have Unit head from 'Employees' table.

'Employees' table has one-to-one relationship with 'EmployeePersonalInfos' table.
'Employees' table has many-to-many relationship with 'Roles' table.
'Employees' table has many-to-many relationship with 'Units' table.
'Employees' table has many-to-one relationship with 'Positions' table.

'EmployeeDocuments' table has many-to-one relationship with 'DocumentTypes' table.
'EmployeeDocuments' table has many-to-one relationship with 'Employees' table.

'Customers' table has one-to-many relationship with 'ProjectSets' table.
'ProjectSets' table has one-to-many relationship with 'Projects' table.

'Projects' table has many-to-many relationship with 'Employees' table.

There are tripple rleationship between next tables: 'Projects', 'Employees', 'ProjectRoleTypes'
It means Employee can have multiple roles in multiple projects.

