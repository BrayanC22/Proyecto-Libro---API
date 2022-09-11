using System.ComponentModel.DataAnnotations;

namespace BookStoreAPI.Models
{
    public class Venta
    {
        [Key]
        public int? idVenta { get; set; }
        [Required]
        public Libro? idLibr { get; set; }
        [Required]
        public Usuario? idUsuari { get; set; }
        [Required]
        public int? cantidad { get; set; }
        [Required]
        public double impuesto { get; set; }
        [Required]
        public double? subtotal { get; set; }
        [Required]
        public double? totalPagar { get; set; }
    }
}
