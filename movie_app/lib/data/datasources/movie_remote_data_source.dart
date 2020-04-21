import 'dart:convert';

import 'package:movieapp/core/error/exceptions.dart';
import 'package:movieapp/data/models/movie_model.dart';
import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;
import 'package:movieapp/data/models/user_rating_model.dart';

abstract class MovieRemoteDataSource {
  Future<List<MovieModel>> getAllMovies();
  Future<List<MovieModel>> searchMovies(String searchTerm);
  Future<MovieModel> addUserRating(MovieModel movie, int userRating);
}

class MovieRemoteDataSourceImpl implements MovieRemoteDataSource {
  final http.Client client;

  MovieRemoteDataSourceImpl({
    @required this.client,
  });

  @override
  Future<List<MovieModel>> getAllMovies() => _getMovieFromUrl(
        'https://movieapi20200406063228.azurewebsites.net/api/Movies/all',
      );

  Future<List<MovieModel>> searchMovies(searchTerm) => _getMovieFromUrl(
        'https://movieapi20200406063228.azurewebsites.net/api/Movies/' +
            searchTerm,
      );

  Future<List<MovieModel>> _getMovieFromUrl(String url) async {
    final response = await client.get(
      url,
      headers: {
        'Content-Type': 'application/json',
      },
    );

    if (response.statusCode == 200) {
      Iterable apiResponse = json.decode(response.body);
      List<MovieModel> movies =
          apiResponse.map((model) => MovieModel.fromJson(model)).toList();
      return movies;
    } else {
      throw ServerException();
    }
  }

  Future<MovieModel> addUserRating(
    MovieModel movie,
    int userRating,
  ) async {
    String url =
        'https://movieapi20200406063228.azurewebsites.net/api/Movies/' +
            movie.id.toString();

    List<UserRatingModel> userRatings = new List();
    var newRating = UserRatingModel(rating: userRating);
    userRatings.add(newRating);

    Map<String, String> headers = {"Content-type": "application/json"};
    List ratingsJsonDecoded = UserRatingModel.encondeToJson(userRatings) ;
    String json = jsonEncode([{'op': 'add', 'path': '/userRatings', 'value': ratingsJsonDecoded}]);

    http.Response response = await http.patch(url, headers: headers, body: json);
    if (response.statusCode == 204) {
      var movies = await getAllMovies();
      var updatedMovie = movies.firstWhere(((m) => m.id == movie.id));
      return updatedMovie;
    } else {
      throw ServerException();
    }
  }
}
