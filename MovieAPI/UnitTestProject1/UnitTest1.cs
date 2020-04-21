using Microsoft.VisualStudio.TestTools.UnitTesting;
using System.Collections.Generic;
using System;
using System.Linq;
using MovieAPI.Controllers;
using MovieAPI.Models;
using System.Web.Http.Results;

namespace UnitTestProject1
{
    [TestClass]
    public class UnitTest1
    {
        [TestMethod]
        public void getAllMoviessTest()
        {
           
            var testMovies = getAllMovie();
            var controller = new MoviesController(testMovies);
            var result = getAllMovie() as List<Movie>;
            Assert.AreEqual(testMovies.Count, result.Count);
        }

        [TestMethod]
        public void returnCorrectMovie()
        {
            string Title = "The Shawshank Redemption";
            var testMovies = getAllMovie();
            var controller = new MoviesController(testMovies);
            Assert.IsNotNull(testMovies);
            Assert.AreEqual(testMovies[0].Title, Title);

        }

        private List<Movie> getAllMovie()
        {
            var testMovies = new List<Movie>();
            testMovies.Add(new Movie
            {
                Id = 10,
                Title = "The Shawshank Redemption",
                ReleaseDate = DateTime.Parse("1995-02-17").ToString("yyyy-MM-dd"),
                Length = "2h 22min",
                Description = "Two imprisoned men bond over a number of years, finding solace and eventual redemption through acts of common decency.",
                Director = "Frank Darabont",
                IMDBRating = 9.3,
                RottenTomatoesScore = 90,
            });
            testMovies.Add(new Movie
            {
                Id = 11,
                Title = "Sonic the Hedgehog",
                ReleaseDate = DateTime.Parse("2020-02-14").ToString("yyyy-MM-dd"),
                Length = "1h 39min",
                Description = "After discovering a small, blue, fast hedgehog, a small-town police officer must help it defeat an evil genius who wants to do experiments on it.",
                Director = "Jeff Fowler",
                IMDBRating = 6.6,
                RottenTomatoesScore = 64,
            });
          

            return testMovies;
        }
    }


}
