using System.ComponentModel.DataAnnotations;

namespace BookStoreAPI.Models
{
    public class Libro
    {
        [Key]
        public int? idLibro { get; set; }
        [Required]
        public Autor? idAuto { get; set; }
        [Required]
        public string? titulo { get; set; }
        [Required]
        public Oferta? idOferta { get; set; }
        [Required]
        public string? descripcion { get; set; }
        [Required]
        public string? isbn { get; set; }
        [Required]
        public Categoria? idCategori { get; set; }
        [Required]
        public double? precio { get; set; }   


    }
}
