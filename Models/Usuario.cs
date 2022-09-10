using System.ComponentModel.DataAnnotations;

namespace BookStoreAPI.Models
{
    public class Usuario
    {
        [Key]
        public int? idUsuario { get; set; }

        [Required]
        public string? nombre { get; set; }

        [Required]
        public string? apellido { get; set; }

        [Required]
        public DateTime? fechaNacimiento { get; set; }

        [Required]
        public string? rolUsuario { get; set; }

        [Required]
        public string? nombreUsuario { get; set; }

        [Required]
        public string? password { get; set; }

    }
}
