using bndapi.Models;
using Microsoft.EntityFrameworkCore;

namespace bndapi.Db;

public class BndDbContext : DbContext
{
    public BndDbContext(DbContextOptions<BndDbContext> options) : base(options)
    {
    }

    public DbSet<Employee>? Employees { get; set; }
}