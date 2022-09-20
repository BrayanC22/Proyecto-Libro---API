using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using BookStoreAPI.Data;
using BookStoreAPI.Models;
using Microsoft.AspNetCore.Authorization;

namespace BookStoreAPI.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    [Authorize]
    public class OfertasController : ControllerBase
    {
        private readonly AppDbContext _context;

        public OfertasController(AppDbContext context)
        {
            _context = context;
        }

        // GET: api/Ofertas
        [HttpGet]
        public async Task<ActionResult<IEnumerable<Oferta>>> GetOferta()
        {
          if (_context.Oferta == null)
          {
              return NotFound();
          }
            return await _context.Oferta.ToListAsync();
        }

        // GET: api/Ofertas/5
        [HttpGet("{id}")]
        public async Task<ActionResult<Oferta>> GetOferta(int? id)
        {
          if (_context.Oferta == null)
          {
              return NotFound();
          }
            var oferta = await _context.Oferta.FindAsync(id);

            if (oferta == null)
            {
                return NotFound();
            }

            return oferta;
        }

        //Mostrar todos los libros con ofertas

        [HttpGet("/BuscarTodosConOfertas")]
        public async Task<IEnumerable<Libro>> BuscarTodosOfertas()
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

            queryLibro = queryLibro.Where(c => c.idOferta.temporada != "No aplica");

            if (queryLibro == null)
            {
                return null;
            }
            return await queryLibro.ToListAsync();
        }



        //Filtrar Temporada que inician con...

        [HttpGet("{Temporada}/BuscarLibroXTemporada")]
        public async Task<IEnumerable<Libro>> BuscarTemporadaIni(string Temporada)
        {
            IQueryable<Libro> queryLibro = _context.Libro;
            IQueryable<Oferta> queryOferta = _context.Oferta;

            queryOferta.ToList();

            queryLibro = queryLibro.Where(c => c.idOferta.temporada.StartsWith(Temporada));
            if (queryLibro == null)
            {
                return null;
            }
            return await queryLibro.ToListAsync();
        }

        //Filtrar ofertas por Temporada

        [HttpGet("{Nombre}/BuscarCategoriaConOfertas")]
        public async Task<IEnumerable<Libro>> BuscarCategoriaOfertas(string Nombre)
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
            
            queryLibro = queryLibro.Where(c => c.idCategori.Nombre.StartsWith(Nombre) && c.idOferta.temporada != "No aplica");

           if (queryLibro == null)
            {
               return null;
          }
          return await queryLibro.ToListAsync();
        }

    
        // PUT: api/Ofertas/5
        // To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
        [HttpPut("{id}")]
        public async Task<IActionResult> PutOferta(int? id, Oferta oferta)
        {
            if (id != oferta.idOfertas)
            {
                return BadRequest();
            }

            _context.Entry(oferta).State = EntityState.Modified;

            try
            {
                await _context.SaveChangesAsync();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!OfertaExists(id))
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

        // POST: api/Ofertas
        // To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
        [HttpPost]
        public async Task<ActionResult<Oferta>> PostOferta(Oferta oferta)
        {
          if (_context.Oferta == null)
          {
              return Problem("Entity set 'AppDbContext.Oferta'  is null.");
          }
            _context.Oferta.Add(oferta);
            await _context.SaveChangesAsync();

            return CreatedAtAction("GetOferta", new { id = oferta.idOfertas }, oferta);
        }

        // DELETE: api/Ofertas/5
        [HttpDelete("{id}")]
        public async Task<IActionResult> DeleteOferta(int? id)
        {
            if (_context.Oferta == null)
            {
                return NotFound();
            }
            var oferta = await _context.Oferta.FindAsync(id);
            if (oferta == null)
            {
                return NotFound();
            }

            _context.Oferta.Remove(oferta);
            await _context.SaveChangesAsync();

            return NoContent();
        }

        private bool OfertaExists(int? id)
        {
            return (_context.Oferta?.Any(e => e.idOfertas == id)).GetValueOrDefault();
        }
    }
}
