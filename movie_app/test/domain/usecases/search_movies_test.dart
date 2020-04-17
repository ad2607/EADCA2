import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:movieapp/domain/entities/movie.dart';
import 'package:movieapp/domain/repository/movie_repository.dart';
import 'package:movieapp/domain/usecases/search_movies.dart';

class MockMovieRepository extends Mock implements MovieRepository {}

Future main() async {
  SearchMovies usecase;
  MockMovieRepository mockMovieRepository;
  setUp(() {
    mockMovieRepository = MockMovieRepository();
    usecase = SearchMovies(mockMovieRepository);
  });

  final searchTerm = 'Avengers';
  final tResult = List<Movie>();

  test(
    'Should return all movies in api database',
    () async {
      // arrange
      when(mockMovieRepository.searchMovies(any))
          .thenAnswer((_) async => Right(tResult));
      // act
      final result = await usecase(SearchMoviesParams(searchTerm: searchTerm));
      // assert
      expect(result, Right(tResult));
      verify(mockMovieRepository.searchMovies(searchTerm));
      verifyNoMoreInteractions(mockMovieRepository);
    },
  );
}
