using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using BookStoreAPI.Data;
using BookStoreAPI.Models;

namespace BookStoreAPI.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class LibroesController : ControllerBase
    {
        private readonly AppDbContext _context;

        public LibroesController(AppDbContext context)
        {
            _context = context;
            _context.Autor.ToList();
            _context.Oferta.ToList();
            _context.Categoria.ToList();
        }

        // GET: api/Libroes
        [HttpGet]
        public async Task<ActionResult<IEnumerable<Libro>>> GetLibro()
        {
          if (_context.Libro == null)
          {
              return NotFound();
          }
            return await _context.Libro.ToListAsync();
        }

        // GET: api/Libroes/5
        [HttpGet("{id}")]
        public async Task<ActionResult<Libro>> GetLibro(int? id)
        {
          if (_context.Libro == null)
          {
              return NotFound();
          }
            var libro = await _context.Libro.FindAsync(id);

            if (libro == null)
            {
                return NotFound();
            }

            return libro;
        }

        //Mostrar todos los libros con ofertas

        [HttpGet("/Buscarsinoferta")]
        public async Task<IEnumerable<Libro>> Buscarsinoferta()
        {

            IQueryable<Libro> queryLibro = _context.Libro;
            IQueryable<Oferta> queryOferta = _context.Oferta;
            IQueryable<Categoria> queryCategoria = _context.Categoria;
            IQueryable<Autor> queryAutor = _context.Autor;

            //Cargar los registros de la tabla Ciudad.
            queryOferta.ToList();
            queryCategoria.ToList();
            queryAutor.ToList();

            //Obtener la lista de clientes que cuyo ID de ciudad sea igual al obtenido según el dato que ingresamos. //*/

            queryLibro = queryLibro.Where(c => c.idOferta.temporada == "No aplica");

            if (queryLibro == null)
            {
                return null;
            }
            return await queryLibro.ToListAsync();
        }

        [HttpGet("{Nombre}/BuscarCategoria")]
        //Filtrar libros por categoria
        public async Task<IEnumerable<Libro>> BuscarCategoria(string Nombre)
        {

            IQueryable<Libro> queryLibro = _context.Libro;
            IQueryable<Oferta> queryOferta = _context.Oferta;
            IQueryable<Categoria> queryCategoria = _context.Categoria;
            IQueryable<Autor> queryAutor = _context.Autor;

            //Cargar los registros de la tabla Ciudad.
            queryOferta.ToList();
            queryCategoria.ToList();
            queryAutor.ToList();

            //Obtener la lista de clientes que cuyo ID de ciudad sea igual al obtenido según el dato que ingresamos. //*/

            queryLibro = queryLibro.Where(c => c.idCategori.Nombre.StartsWith(Nombre));

            if (queryLibro == null)
            {
                return null;
            }
            return await queryLibro.ToListAsync();
        }


        // PUT: api/Libroes/5
        // To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
        [HttpPut("{id}")]
        public async Task<IActionResult> PutLibro(int? id, Libro libro)
        {
            if (id != libro.idLibro)
            {
                return BadRequest();
            }

            _context.Entry(libro).State = EntityState.Modified;

            try
            {
                await _context.SaveChangesAsync();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!LibroExists(id))
                {
                    return NotFound();
                }
                else
                {
                    throw;
                }
            }

            return NoContent();
        }

        // POST: api/Libroes
        // To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
        [HttpPost]
        public async Task<ActionResult<Libro>> PostLibro(Libro libro)
        {
          if (_context.Libro == null)
          {
              return Problem("Entity set 'AppDbContext.Libro'  is null.");
          }
            _context.Libro.Add(libro);
            await _context.SaveChangesAsync();

            return CreatedAtAction("GetLibro", new { id = libro.idLibro }, libro);
        }

        // DELETE: api/Libroes/5
        [HttpDelete("{id}")]
        public async Task<IActionResult> DeleteLibro(int? id)
        {
            if (_context.Libro == null)
            {
                return NotFound();
            }
            var libro = await _context.Libro.FindAsync(id);
            if (libro == null)
            {
                return NotFound();
            }

            _context.Libro.Remove(libro);
            await _context.SaveChangesAsync();

            return NoContent();
        }

        private bool LibroExists(int? id)
        {
            return (_context.Libro?.Any(e => e.idLibro == id)).GetValueOrDefault();
        }
    }
}
