using System.ComponentModel.DataAnnotations;

namespace BookStoreAPI.Models
{
    public class Oferta
    {
        [Key]
        public int? idOfertas { get; set; }
        [Required]
        public string? temporada { get; set; }
        [Required]
        public string? categoria { get; set; }
        [Required]
        public double? descuento { get; set; }
        [Required]
        public string? cupones { get; set; }
        [Required]
        public string? descripcion { get; set; }
    }
}
