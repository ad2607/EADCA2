import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:movieapp/domain/entities/movie.dart';
import 'package:movieapp/domain/repository/movie_repository.dart';
import 'package:movieapp/domain/usecases/get_all_movies.dart';

class MockMovieRepository extends Mock implements MovieRepository {}

Future main() async {
  GetAllMovies usecase;
  MockMovieRepository mockMovieRepository;
  setUp(() {
    mockMovieRepository = MockMovieRepository();
    usecase = GetAllMovies(mockMovieRepository);
  });

  final tResult = List<Movie>();

  test(
    'Should return all movies in api database',
    () async {
      // arrange
      when(mockMovieRepository.getAllMovies())
          .thenAnswer((_) async => Right(tResult));
      // act
      final result = await usecase(AllMoviesParams());
      // assert
      expect(result, Right(tResult));
      verify(mockMovieRepository.getAllMovies());
      verifyNoMoreInteractions(mockMovieRepository);
    },
  );
}
