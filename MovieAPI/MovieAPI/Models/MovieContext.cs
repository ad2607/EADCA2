using Microsoft.EntityFrameworkCore;
using MovieAPI.Models;

namespace MovieAPI.Models
{
    public class MovieContext : DbContext
    {
        public MovieContext(DbContextOptions<MovieContext> options)
            : base(options)
        {
        }

        public DbSet<Movie> Movies { get; set; }
        public DbSet<UserRating> UserRatings { get; set; }
    }
}