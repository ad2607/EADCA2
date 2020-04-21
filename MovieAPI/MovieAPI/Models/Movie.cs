using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.IO;
using System.Linq;
using System.Threading.Tasks;

namespace MovieAPI.Models
{
    [Table("Movies")]
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

        [Range(1, 10)]
        [Required]
        public double IMDBRating { get; set; }

        [Range(0, 100)]
        [Required]
        public int RottenTomatoesScore { get; set; }

        [Required]
        public virtual ICollection<UserRating> UserRatings { get; set; }

    }

    [Table("UserRating")]
    public class UserRating
    {
        [Key]
        [Required]
        public int Id { get; set; }

        [Required]
        [Range(1, 10)]
        public int Rating { get; set; }
    }
}