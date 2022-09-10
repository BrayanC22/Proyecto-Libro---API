using BookStoreAPI.Models;
using Microsoft.EntityFrameworkCore;

namespace BookStoreAPI.Data
{
    public class AppDbContext: DbContext
    {
        public AppDbContext(DbContextOptions<AppDbContext> options): base(options) { }

        public DbSet<Autor>? Autor { get; set; }
        public DbSet<Libro>? Libro { get; set; }
        public DbSet<Oferta>? Oferta { get; set; }
        public DbSet<Usuario>? Usuario { get; set; }
        public DbSet<Venta>? Venta { get; set; }

    }
}
