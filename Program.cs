using BookStoreAPI.Data;
using Microsoft.EntityFrameworkCore;

var builder = WebApplication.CreateBuilder(args);

Console.WriteLine("***** Configurando Servicios *******");

// Add services to the container.

builder.Services.AddControllers();
// Learn more about configuring Swagger/OpenAPI at https://aka.ms/aspnetcore/swashbuckle
builder.Services.AddEndpointsApiExplorer();
builder.Services.AddSwaggerGen();


builder.Services.AddDbContext<AppDbContext>(options => options.UseSqlServer(builder.Configuration.GetConnectionString("DefaultConnection")));

Console.WriteLine("***** Finalizado configuración de servicios *******");


var app = builder.Build();

// Configure the HTTP request pipeline.
if (app.Environment.IsDevelopment())
{
    app.UseSwagger();
    app.UseSwaggerUI();
}

app.UseHttpsRedirection();

app.UseAuthorization();

app.MapControllers();

//Llamar el método para validación de conexión en BD
var scope = app.Services.CreateScope();
await Migrations(scope.ServiceProvider);

app.Run();

//Verificar la conexión con la base de datos
async Task Migrations(IServiceProvider serviceProvider)
{
    var context = serviceProvider.GetService<AppDbContext>();
    var conn_appdb = context.Database.GetDbConnection();

    Console.WriteLine($"Conexion actual AppDB: {conn_appdb.ToString()} {Environment.NewLine} {conn_appdb.ConnectionString}");
    Console.WriteLine("********** Probando acceso ******************");

    try
    {
        Console.WriteLine("Base de datos disponible: " + context.Database.CanConnect()); ;
    }
    catch (Exception ex)
    {
        Console.Write($"Error al conectar: {ex.Message}");
    }
}
