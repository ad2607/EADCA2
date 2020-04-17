import 'package:meta/meta.dart';
import 'package:movieapp/domain/entities/movie.dart';

class MovieModel extends Movie {
  MovieModel({
    @required final int id,
    @required final String title,
    @required final String releaseDate,
    @required final String length,
    @required final String description,
    @required final String director,
    @required final double imdbRating,
    @required final int rottenTomatoesScore,
  }) : super(
          id: id,
          title: title,
          releaseDate: releaseDate,
          length: length,
          description: description,
          director: director,
          imdbRating: imdbRating,
          rottenTomatoesScore: rottenTomatoesScore,
        );

  factory MovieModel.fromJson(
    Map<String, dynamic> data,
  ) {
    return MovieModel(
      id: data['id'],
      title: data['title'],
      releaseDate: data['releaseDate'],
      length: data['length'],
      description: data['description'],
      director: data['director'],
      imdbRating: data['imdbRating'].toDouble(),
      rottenTomatoesScore: data['rottenTomatoesScore'],
    );
  }
}
