using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using MovieAPI.Models;
using System.IO;
using Microsoft.AspNetCore.Hosting;

namespace MovieAPI.Controllers
{
    [Produces("application/json")]
    [Route("api/[controller]")]
    [ApiController]
    public class MoviesController : ControllerBase
    {
        private readonly MovieContext _context;
        private readonly IWebHostEnvironment _env;
    

        public MoviesController(MovieContext context, IWebHostEnvironment env)
        {
            _env = env;
            _context = context;

            if (!_context.Movies.Any())
            {   
                var rating1 = new UserRating { Rating = 8, Id = 1 };
                var rating2 = new UserRating { Rating = 8, Id = 2 };
                var rating3 = new UserRating { Rating = 8, Id = 3 };
                var rating4 = new UserRating { Rating = 8, Id = 4 };
                var rating5 = new UserRating { Rating = 8, Id = 5 };
                var rating6 = new UserRating { Rating = 8, Id = 6 };
                var rating7 = new UserRating { Rating = 8, Id = 7 };
                var rating8 = new UserRating { Rating = 8, Id = 8 };
                var rating9 = new UserRating { Rating = 8,Id = 9 };
                var rating10 = new UserRating { Rating = 8, Id = 10 };
                var rating11 = new UserRating { Rating = 8, Id = 11 }; 
                var rating12 = new UserRating { Rating = 8, Id = 12 };

                _context.UserRatings.Add(
                    rating1
                    );
                _context.UserRatings.Add(
                    rating2
                    );
                _context.UserRatings.Add(
                    rating3
                    );
                _context.UserRatings.Add(
                    rating4
                    );
                _context.UserRatings.Add(
                    rating5
                    );
                _context.UserRatings.Add(
                    rating6
                    );
                _context.UserRatings.Add(
                     rating7
                     ); 
                _context.UserRatings.Add(
                     rating8
                     );
                _context.UserRatings.Add(
                    rating9
                    );
                _context.UserRatings.Add(
                    rating10
                    );
                _context.UserRatings.Add(
                    rating11
                    );
                _context.UserRatings.Add(
                    rating12
                    );

                var movie1 = new Movie
                {
                    Id = 1,
                    Title = "Blade Runner 2049",
                    ReleaseDate = DateTime.Parse("2017-10-5").ToString("yyyy-MM-dd"),
                    Length = "2h 44min",
                    Description = "Young Blade Runner K's discovery of a long-buried secret leads him to track down former Blade Runner Rick Deckard, who's been missing for thirty years.",
                    Director = "Denis Villeneuve",
                    IMDBRating = 8.0,
                    RottenTomatoesScore = 87,
                    UserRatings = new List<UserRating>()
                    {
                        rating1,
                    }
                };

                var movie2 = new Movie
                {
                    Id = 2,
                    Title = "Avengers: Infinity War",
                    ReleaseDate = DateTime.Parse("2018-04-26").ToString("yyyy-MM-dd"),
                    Length = "2h 29min",
                    Description = "The Avengers and their allies must be willing to sacrifice all in an attempt to defeat the powerful Thanos before his blitz of devastation and ruin puts an end to the universe.",
                    Director = "Anthony Russo, Joe Russo",
                    IMDBRating = 8.5,
                    RottenTomatoesScore = 85,
                    UserRatings = new List<UserRating>()
                    {
                        rating2,
                    }
                };

                var movie3 = new Movie
                {
                    Id = 3,
                    Title = "Avengers: Endgame",
                    ReleaseDate = DateTime.Parse("2019-04-25").ToString("yyyy-MM-dd"),
                    Length = "3h 1min",
                    Description = "After the devastating events of Avengers: Infinity War (2018), the universe is in ruins. With the help of remaining allies, the Avengers assemble once more in order to reverse Thanos' actions and restore balance to the universe.",
                    Director = "Anthony Russo, Joe Russo",
                    IMDBRating = 8.4,
                    RottenTomatoesScore = 94,
                    UserRatings = new List<UserRating>()
                    {
                        rating3,
                    }
                };

                var movie4 = new Movie
                {
                    Id = 4,
                    Title = "1917",
                    ReleaseDate = DateTime.Parse("2020-01-10").ToString("yyyy-MM-dd"),
                    Length = "1h 59min",
                    Description = "April 6th, 1917. As a regiment assembles to wage war deep in enemy territory, two soldiers are assigned to race against time and deliver a message that will stop 1,600 men from walking straight into a deadly trap.",
                    Director = "Sam Mendes",
                    IMDBRating = 8.4,
                    RottenTomatoesScore = 89,
                    UserRatings = new List<UserRating>()
                    {
                        rating4,
                    }

                };

                var movie5 = new Movie
                {
                    Id = 5,
                    Title = "The Lord of the Rings: The Return of the King",
                    ReleaseDate = DateTime.Parse("2003-12-17").ToString("yyyy-MM-dd"),
                    Length = "3h 21min",
                    Description = "Gandalf and Aragorn lead the World of Men against Sauron's army to draw his gaze from Frodo and Sam as they approach Mount Doom with the One Ring.",
                    Director = "Peter Jackson",
                    IMDBRating = 8.9,
                    RottenTomatoesScore = 93,
                    UserRatings = new List<UserRating>()
                    {
                        rating5,
                    }
                };

                var movie6 = new Movie
                {
                    Id = 6,
                    Title = "The Dark Knight",
                    ReleaseDate = DateTime.Parse("2008-07-24").ToString("yyyy-MM-dd"),
                    Length = "2h 32min",
                    Description = "When the menace known as the Joker wreaks havoc and chaos on the people of Gotham, Batman must accept one of the greatest psychological and physical tests of his ability to fight injustice.",
                    Director = "Christopher Nolan",
                    IMDBRating = 9.0,
                    RottenTomatoesScore = 94,
                    UserRatings = new List<UserRating>()
                    {
                        rating6,
                    }
                };

                var movie7 = new Movie
                {
                    Id = 7,
                    Title = "The Lord of the Rings: The Fellowship of the Ring",
                    ReleaseDate = DateTime.Parse("2001-12-19").ToString("yyyy-MM-dd"),
                    Length = "2h 58min",
                    Description = "A meek Hobbit from the Shire and eight companions set out on a journey to destroy the powerful One Ring and save Middle-earth from the Dark Lord Sauron.",
                    Director = "Peter Jackson",
                    IMDBRating = 8.8,
                    RottenTomatoesScore = 91,
                    UserRatings = new List<UserRating>()
                    {
                        rating7,
                    }
                };

                var movie8 = new Movie
                {
                    Id = 8,
                    Title = "Star Wars: The Rise of Skywalker",
                    ReleaseDate = DateTime.Parse("2019-12-19").ToString("yyyy-MM-dd"),
                    Length = "2h 22min",
                    Description = "The surviving members of the resistance face the First Order once again, and the legendary conflict between the Jedi and the Sith reaches its peak bringing the Skywalker saga to its end.",
                    Director = "J.J. Abrams",
                    IMDBRating = 6.7,
                    RottenTomatoesScore = 52,
                    UserRatings = new List<UserRating>()
                    {
                        rating8,
                    }
                };

                var movie9 = new Movie
                {
                    Id = 9,
                    Title = "Joker",
                    ReleaseDate = DateTime.Parse("2019-10-04").ToString("yyyy-MM-dd"),
                    Length = "2h 02min",
                    Description = "In Gotham City, mentally troubled comedian Arthur Fleck is disregarded and mistreated by society. He then embarks on a downward spiral of revolution and bloody crime. This path brings him face-to-face with his alter-ego: the Joker.",
                    Director = "Todd Phillips",
                    IMDBRating = 8.5,
                    RottenTomatoesScore = 68,
                    UserRatings = new List<UserRating>()
                    {
                        rating9,
                    }
                };

                var movie10 = new Movie
                {
                    Id = 10,
                    Title = "The Shawshank Redemption",
                    ReleaseDate = DateTime.Parse("1995-02-17").ToString("yyyy-MM-dd"),
                    Length = "2h 22min",
                    Description = "Two imprisoned men bond over a number of years, finding solace and eventual redemption through acts of common decency.",
                    Director = "Frank Darabont",
                    IMDBRating = 9.3,
                    RottenTomatoesScore = 90,
                    UserRatings = new List<UserRating>()
                    {
                        rating10,
                    }
                };

                var movie11 = new Movie
                {
                    Id = 11,
                    Title = "Sonic the Hedgehog",
                    ReleaseDate = DateTime.Parse("2020-02-14").ToString("yyyy-MM-dd"),
                    Length = "1h 39min",
                    Description = "After discovering a small, blue, fast hedgehog, a small-town police officer must help it defeat an evil genius who wants to do experiments on it.",
                    Director = "Jeff Fowler",
                    IMDBRating = 6.6,
                    RottenTomatoesScore = 64,
                    UserRatings = new List<UserRating>()
                    {
                        rating11,
                    }
                };

                var movie12 = new Movie
                {
                    Id = 12,
                    Title = "Inception",
                    ReleaseDate = DateTime.Parse("2010-07-16").ToString("yyyy-MM-dd"),
                    Length = "2h 28min",
                    Description = "A thief who steals corporate secrets through the use of dream-sharing technology is given the inverse task of planting an idea into the mind of a C.E.O.",
                    Director = "Christopher Nolan",
                    IMDBRating = 8.8,
                    RottenTomatoesScore = 87,
                    UserRatings = new List<UserRating>()
                    {
                        rating12,
                    }
                };

                _context.Movies.Add(
                    movie1
                );
                _context.Movies.Add(
                    movie2
                );
                _context.Movies.Add(
                    movie3
                );

                _context.Movies.Add(
                    movie4
                );

                _context.Movies.Add(
                    movie5
                );

                _context.Movies.Add(
                    movie6
                );

                _context.Movies.Add(
                    movie7
                );

                _context.Movies.Add(
                    movie8
                );

                _context.Movies.Add(
                    movie9
                );

                _context.Movies.Add(
                    movie10
                );

                _context.Movies.Add(
                    movie11
                );

                _context.Movies.Add(
                    movie12
                );

                _context.SaveChanges();
            }
        }


        //for testing 
        public MoviesController(List<Movie> testMovies)
        {
            testMovies = new List<Movie>(testMovies);
        }

        /// <summary>
        /// Gets all Movies from the database
        /// </summary>
        /// <returns>All Movies in Database</returns>
        /// <response code="201">Returns all movies from the database</response>
        /// <response code="400">If no movies where retrieved</response>
        [HttpGet("all")]
        public async Task<ActionResult<IEnumerable<Movie>>> GetAllMovies()
        {
            return await _context.Movies.ToListAsync();
        }

        /// <summary>
        /// Gets movies with entered name
        /// </summary>
        /// <remarks>
        /// Sample respnse:
        ///
        ///     Get /GetMovieByTitle
        ///     {
        ///        "title": "Blade Runner 2049"
        ///     }
        ///
        /// </remarks>
        /// <param name="searchString"></param>
        /// <returns>Movie with entered name</returns>
        /// <response code="201">Returns Movie with entered name</response>
        /// <response code="400">If no movie was retrieved</response>
        [HttpGet("{searchString}")]
        public async Task<ActionResult<IEnumerable<Movie>>> GetMoviesByTitle(string searchString)
        {
            var movies = await _context.Movies.Where(t => t.Title.ToUpper().Contains(searchString.ToUpper())).ToListAsync();

            if (movies.Count.Equals(0))
            {
                return NotFound();
            }
            else if (searchString == null)
            {
                movies = await _context.Movies.ToListAsync();
            }

            return movies;
        }


        /// <summary>
        /// Gets Movie poster with Id
        /// </summary>
        /// /// <remarks>
        /// Sample respnse:
        ///
        ///     Get /GetMoviePoster
        ///     {
        ///        Image
        ///     }
        ///
        /// </remarks>
        /// <param name="Id"></param>
        /// <returns>Movie Poster with Id</returns>
        /// <response code="201">Returns Movie poster</response>
        /// <response code="400">If no movie poster was retrieved</response>
        [HttpGet("poster")]
        public async Task<IActionResult> GetMoviePoster(int Id)
        {
            var path = Path.Combine(_env.WebRootPath, "images/" + Id + ".jpg");
            var image = System.IO.File.OpenRead(path);
            return File(image, "image/jpeg");
        }


        /// <summary>
        /// Update Movie User Ratings
        /// </summary>
        /// /// <remarks>
        /// Sample respnse:
        ///
        ///     Get /PutUpdateMovieUserReviews
        ///     {
        ///        title: 
        ///     }
        ///
        /// </remarks>
        /// <param name="Id"></param>
        /// <param name="movie"></param>
        /// <returns>Updated Movie Details</returns>
        /// <response code="201">Returns updated Movie details</response>
        /// <response code="400">If no movie poster was retrieved</response>
        [HttpPut("{Id}")]
        [ProducesResponseType(StatusCodes.Status204NoContent)]  
        [ProducesResponseType(StatusCodes.Status404NotFound)]      
        public IActionResult PutUpdateMovieUserReviews(int Id, [FromBody] Movie movie)
        {
            // automatic model state validation (400)

            if (Id == movie.Id)
            {
                var record = _context.Movies.SingleOrDefault(l => l.Id == Id);
                if (record == null)
                {
                    return NotFound();
                }
                else
                {
                    record.UserRatings = movie.UserRatings;              
                    _context.SaveChanges();
                    return NoContent();                                                                 
                }
            }
            else
            {
                return BadRequest("invalid Id");
            }
        }
    }
}