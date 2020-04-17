import 'dart:convert';

import 'package:movieapp/core/error/exceptions.dart';
import 'package:movieapp/data/models/movie_model.dart';
import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;

abstract class MovieRemoteDataSource {
  Future<List<MovieModel>> getAllMovies();
  Future<List<MovieModel>> searchMovies(String searchTerm);
}

class MovieRemoteDataSourceImpl implements MovieRemoteDataSource {
  final http.Client client;

  MovieRemoteDataSourceImpl({
    @required this.client,
  });

  @override
  Future<List<MovieModel>> getAllMovies() => _getMovieFromUrl(
        "https://movieapi20200406063228.azurewebsites.net/api/Movies/all",
      );

  Future<List<MovieModel>> searchMovies(searchTerm) => _getMovieFromUrl(
        "https://movieapi20200406063228.azurewebsites.net/api/Movies/" +
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
}
