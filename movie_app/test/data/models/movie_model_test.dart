import 'package:flutter_test/flutter_test.dart';
import 'package:movieapp/data/models/movie_model.dart';
import 'package:movieapp/domain/entities/movie.dart';

void main() {
  final tMovieModel = MovieModel(
    id: 1,
    title: 'The Dark Knight',
    description: 'Test Description',
    length: '2h 30mins',
    director: 'Christopher Nolan',
    imdbRating: 9.5,
    rottenTomatoesScore: 92,
    releaseDate: '2008-12-09',
    userRatings: null,
  );

  test(
    'Should be a subclass of Movie entity',
    () async {
      // assert
      expect(tMovieModel, isA<Movie>());
    },
  );

  // group('fromJson', () {
  //   test(
  //     'should return a valid Movie model',
  //     () async {
  //       // arrange
  //       final Map<String, dynamic> tData = {
  //         'id': 1,
  //         'title': 'The Dark Knight',
  //         'releaseDate': '2008-12-09',
  //         'length': '2h 30mins',
  //         'description': 'Test Description',
  //         'director': 'Christopher Nolan',
  //         'imdbRating': 9.5,
  //         'rottenTomatoesScore': 92,
  //         'userRatings': null,
  //       };

  //       // act
  //       final tResult = MovieModel.fromJson(tData);
  //       // assert
  //       expect(tResult, tMovieModel);
  //     },
  //   );
  // });
}
