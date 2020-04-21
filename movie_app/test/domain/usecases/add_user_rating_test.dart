import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:movieapp/domain/entities/movie.dart';
import 'package:movieapp/domain/repository/movie_repository.dart';
import 'package:movieapp/domain/usecases/add_user_rating.dart';

class MockMovieRepository extends Mock implements MovieRepository {}

Future main() async {
  AddUserRating usecase;
  MockMovieRepository mockMovieRepository;
  setUp(() {
    mockMovieRepository = MockMovieRepository();
    usecase = AddUserRating(mockMovieRepository);
  });

  final tResult = new Movie(
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
    'Should add user rating to movie',
    () async {
      // arrange
      when(mockMovieRepository.addUserRating(any, any))
          .thenAnswer((_) async => Right(tResult));
      // act
      final result =
          await usecase(AddUserRatingParams(movie: tResult, userRating: 8));
      // assert
      expect(result, Right(tResult));
      verify(mockMovieRepository.addUserRating(tResult, 8));
      verifyNoMoreInteractions(mockMovieRepository);
    },
  );
}
