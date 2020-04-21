import 'package:meta/meta.dart';
import 'package:movieapp/data/models/user_rating_model.dart';
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
    @required final List<UserRatingModel> userRatings,
  }) : super(
          id: id,
          title: title,
          releaseDate: releaseDate,
          length: length,
          description: description,
          director: director,
          imdbRating: imdbRating,
          rottenTomatoesScore: rottenTomatoesScore,
          userRatings: userRatings,
        );

  factory MovieModel.fromJson(
    Map<String, dynamic> data,
  ) {
    var list = data['userRatings'] as List;
    print(list.runtimeType);
    List<UserRatingModel> userRatingsList =
        list.map((i) => UserRatingModel.fromJson(i)).toList();
    return MovieModel(
      id: data['id'],
      title: data['title'],
      releaseDate: data['releaseDate'],
      length: data['length'],
      description: data['description'],
      director: data['director'],
      imdbRating: data['imdbRating'].toDouble(),
      rottenTomatoesScore: data['rottenTomatoesScore'],
      userRatings: userRatingsList,
    );
  }
Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'releaseDate': releaseDate,
      'length': length,
      'description': description,
      'director': director,
      'imdbRating': imdbRating,
      'rottenTomatoesScore': rottenTomatoesScore,
      'userRatings': userRatings,
    };
  }

  Map<String, dynamic> toJsonRatingsOnly() {
    return {
      'userRatings': userRatings,
    };
  }

}
