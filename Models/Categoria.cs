using System.ComponentModel.DataAnnotations;

namespace BookStoreAPI.Models
{
    public class Categoria
    {

        [Key]
        public int? idCategoria{ get; set; }

        [Required]
        public string? Nombre{ get; set; }


    }
}
