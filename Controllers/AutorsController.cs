﻿using System;
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
    
    public class AutorsController : ControllerBase
    {
        private readonly AppDbContext _context;

        public AutorsController(AppDbContext context)
        {
            _context = context;
        }

        // GET: api/Autors
        [HttpGet]
        public async Task<ActionResult<IEnumerable<Autor>>> GetAutor()
        {
          if (_context.Autor == null)
          {
              return NotFound();
          }
            return await _context.Autor.ToListAsync();
        }

        // GET: api/Autors/5
        [HttpGet("{id}")]
        public async Task<ActionResult<Autor>> GetAutor(int? id)
        {
          if (_context.Autor == null)
          {
              return NotFound();
          }
            var autor = await _context.Autor.FindAsync(id);

            if (autor == null)
            {
                return NotFound();
            }

            return autor;
        }

        // PUT: api/Autors/5
        // To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
        [HttpPut("{id}")]
        public async Task<IActionResult> PutAutor(int? id, Autor autor)
        {
            if (id != autor.idAutor)
            {
                return BadRequest();
            }

            _context.Entry(autor).State = EntityState.Modified;

            try
            {
                await _context.SaveChangesAsync();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!AutorExists(id))
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

        // POST: api/Autors
        // To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
        [HttpPost]
        public async Task<ActionResult<Autor>> PostAutor(Autor autor)
        {
          if (_context.Autor == null)
          {
              return Problem("Entity set 'AppDbContext.Autor'  is null.");
          }
            _context.Autor.Add(autor);
            await _context.SaveChangesAsync();

            return CreatedAtAction("GetAutor", new { id = autor.idAutor }, autor);
        }

        // DELETE: api/Autors/5
        [HttpDelete("{id}")]
        public async Task<IActionResult> DeleteAutor(int? id)
        {
            if (_context.Autor == null)
            {
                return NotFound();
            }
            var autor = await _context.Autor.FindAsync(id);
            if (autor == null)
            {
                return NotFound();
            }

            _context.Autor.Remove(autor);
            await _context.SaveChangesAsync();

            return NoContent();
        }

        private bool AutorExists(int? id)
        {
            return (_context.Autor?.Any(e => e.idAutor == id)).GetValueOrDefault();
        }

        //Filtrar nombre que inician con...
        [HttpGet("{nombreAutor}/EmpiezaNombre")]
        public async Task<IEnumerable<Autor>> BuscaNombre(string nombreAutor)
        {
            IQueryable<Autor> query = _context.Autor;
            query = query.Where(e => e.nombreAutor.StartsWith(nombreAutor)); // --> Verifica si el texto empieza con lo enviado como parametro
            if (query == null)
            {
                return null;
            }
            return await query.ToListAsync();
        }

        [HttpGet("{nombreAutor}/BucarAutorLibro")]
        public async Task<IEnumerable<Libro>> BucarAutorLibro(string nombreAutor)
        {
            IQueryable<Libro> queryLibro = _context.Libro;
            IQueryable<Autor> queryAutor = _context.Autor;
            IQueryable<Categoria> queryCategoria = _context.Categoria;

            queryAutor.ToList();
           
            queryCategoria.ToList();

            queryLibro = queryLibro.Where(c => c.idAuto.nombreAutor.StartsWith(nombreAutor));
            if (queryLibro == null)
            {
                return null;
            }
            return await queryLibro.ToListAsync();
        }







    }
}
