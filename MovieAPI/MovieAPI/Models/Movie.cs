using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.IO;
using System.Linq;
using System.Threading.Tasks;

namespace MovieAPI.Models
{
    public class Movie
    {
        [Key]
        [Required]
        public int Id { get; set; }

        [Required]
        public string Title { get; set; }

        [Required]
        public string ReleaseDate { get; set; }

        [Required]
        public string Length { get; set; }

        [Required]
        public string Description { get; set; }

        [Required]
        public string Director { get; set; }

        [Required]
        public double IMDBRating { get; set; }
    }
}
