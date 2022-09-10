using System.ComponentModel.DataAnnotations;

namespace BookStoreAPI.Models
{
    public class Libro
    {
        [Key]
        public int? idLibro { get; set; }
        [Required]
        public Autor? idAutor { get; set; }
        [Required]
        public string? titulo { get; set; }
        [Required]
        public Oferta? idOfertas { get; set; }
        [Required]
        public string? descripcion { get; set; }
        [Required]
        public string? isbn { get; set; }
        [Required]
        public string? categoria { get; set; }
        [Required]
        public string? editorial { get; set; }
        [Required]
        public double? precio { get; set; }
        [Required]
        public string? portadaLibro { get; set; }
    }
}
