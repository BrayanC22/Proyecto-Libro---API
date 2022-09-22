using System.ComponentModel.DataAnnotations;

namespace BookStoreAPI.Models
{
    public class Autor
    {
        [Key]
        public int? idAutor { get; set; }
        [Required]
        public string? nombreAutor { get; set; }
        [Required]
        public string? biografia { get; set; }
        [Required]
        public string? twitter { get; set; }
        [Required]
        public string? instagram { get; set; }
        [Required]
        public string? fotoAutor { get; set; }
    }
    
}
