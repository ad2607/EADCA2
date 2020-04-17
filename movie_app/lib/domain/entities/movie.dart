import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

class Movie extends Equatable {
  final int id;
  final String title;
  final String releaseDate;
  final String length;
  final String description;
  final String director;
  final double imdbRating;
  final int rottenTomatoesScore;

  Movie({
    @required this.id,
    @required this.title,
    @required this.releaseDate,
    @required this.length,
    @required this.description,
    @required this.director,
    @required this.imdbRating,
    @required this.rottenTomatoesScore,
  });

  @override
  List<Object> get props => [
        id,
        title,
        releaseDate,
        length,
        description,
        director,
        imdbRating,
        rottenTomatoesScore,
      ];
}
