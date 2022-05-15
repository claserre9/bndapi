**BND Web API powered by ASP.NET CORE 6**

Before executing the project, it is important to consider some dependencies. To back up the data, we chose the SQL Server database management system. First of all, you have to create a login and assign it all the privileges. If you already have an MSSQL server running locally on your machine, run the following script (T_SQL) from the command line, on SSMS or any other client that supports (T-SQL) as admin or sa.

```

CREATE LOGIN BND WITH PASSWORD = 'Password1234';
GRANT CONTROL SERVER TO BND;
GO

```

Then install *EF Core Tools* globally (Make sure you have *dotnet-cli* installed first)

`dotnet tool install --global dotnet-ef`

Finally, create and apply the migrations:

```

dotnet ef migrations add InitialCreate
dotnet ef database update

```
