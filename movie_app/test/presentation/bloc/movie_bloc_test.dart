import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:movieapp/domain/entities/movie.dart';
import 'package:movieapp/domain/usecases/get_all_movies.dart';
import 'package:movieapp/domain/usecases/search_movies.dart';
import 'package:movieapp/presentation/bloc/movie_bloc.dart';

class MockGetAllMovies extends Mock implements GetAllMovies {}

class MockSearchMovies extends Mock implements SearchMovies {}

void main() {
  MovieBloc bloc;
  MockGetAllMovies mockGetAllMovies;
  MockSearchMovies mockSearchMovies;

  setUp(() {
    mockGetAllMovies = MockGetAllMovies();

    bloc = MovieBloc(
      getAllMovies: mockGetAllMovies,
      searchMovies: mockSearchMovies,
    );
  });

  test('initial state should be MovieInitial', () {
    expect(bloc.initialState, equals(MovieInitial()));
  });

  group('InitialLoadRequested', () {
    final tResult = List<Movie>();
    test(
      'should emit [Loaded] when data is gotten successfully',
      () async {
        // arrange
        when(mockGetAllMovies(any)).thenAnswer((_) async => Right(tResult));
        // assert later
        final expected = [
          MovieInitial(),
          Loaded(movies: tResult),
        ];
        expectLater(bloc, emitsInOrder(expected));
        // act
        bloc.add(InitialLoadRequested());
      },
    );

    // test(
    //   'should emit [Error] when getting data fails',
    //   () async {
    //     // arrange
    //     when(mockGetAllMovies(any))
    //         .thenAnswer((_) async => Left(ServerFailure()));
    //     // assert later
    //     final expected = [
    //       MovieInitial(),
    //       Error(message: 'Server Failure!'),
    //     ];
    //     expectLater(bloc, emitsInOrder(expected));
    //     // act
    //     bloc.add(InitialLoadRequested());
    //   },
    // );
  });

  group('SearchRequested', () {
    final tSearchTerm = 'Avengers';
    final tResult = List<Movie>();
    test(
      'should emit [Loaded] when data is gotten successfully',
      () async {
        // arrange
        when(mockSearchMovies(any)).thenAnswer((_) async => Right(tResult));
        // assert later
        final expected = [
          MovieInitial(),
          Loaded(movies: tResult),
        ];
        expectLater(bloc, emitsInOrder(expected));
        // act
        bloc.add(SearchRequested(searchTerm: tSearchTerm));
      },
    );

    // test(
    //   'should emit [Error] when getting data fails',
    //   () async {
    //     // arrange
    //     when(mockSearchMovies(any))
    //         .thenAnswer((_) async => Left(ServerFailure()));
    //     // assert later
    //     final expected = [
    //       MovieInitial(),
    //       Error(message: 'Server Failure!'),
    //     ];
    //     expectLater(bloc, emitsInOrder(expected));
    //     // act
    //     bloc.add(SearchRequested(searchTerm: tSearchTerm));
    //   },
    // );
  });
}
