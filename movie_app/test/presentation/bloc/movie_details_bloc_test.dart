import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:movieapp/domain/usecases/add_user_rating.dart';
import 'package:movieapp/domain/usecases/get_all_movies.dart';
import 'package:movieapp/presentation/bloc/movie_details_bloc/movie_details_bloc.dart';

class MockAddUserRating extends Mock implements AddUserRating {}

class MockGetAllMovies extends Mock implements GetAllMovies {}

void main() {
  MovieDetailsBloc bloc;
  MockAddUserRating mockAddUserRating;
  MockGetAllMovies mockGetAllMovies;

  setUp(() {
    mockGetAllMovies = MockGetAllMovies();

    bloc = MovieDetailsBloc(
      addUserRating: mockAddUserRating,
      getAllMovies: mockGetAllMovies,
    );
  });

  test('initial state should be MovieInitial', () {
    expect(bloc.initialState, equals(MovieDetailsInitial()));
  });

  // group('AddUserRatingRequested', () {
  //   final tResult = Movie(
  //     id: 1,
  //     title: 'The Dark Knight',
  //     description: 'Test Description',
  //     length: '2h 30mins',
  //     director: 'Christopher Nolan',
  //     imdbRating: 9.5,
  //     rottenTomatoesScore: 92,
  //     releaseDate: '2008-12-09',
  //     userRatings: null,
  //   );

  //   final tMovieList = new List<Movie>();
  //   tMovieList.add(tResult);
  //   test(
  //     'should emit [UserRatingAdded] when data is gotten successfully',
  //     () async {
  //       // arrange
  //       when(mockAddUserRating(any)).thenAnswer((_) async => Right(tResult));
  //       // assert later
  //       final expected = [
  //         MovieDetailsInitial(),
  //         Loading(),
  //         UserRatingAdded(movie: tResult, movieList: tMovieList),
  //       ];
  //       expectLater(bloc, emitsInOrder(expected));
  //       // act
  //       bloc.add(AddUserRatingRequested(movie: tResult, userRating: 8));
  //     },
  //   );

  // test(
  //   'should emit [Error] when getting data fails',
  //   () async {
  //     // arrange
  //     when(mockAddUserRating(any))
  //         .thenAnswer((_) async => Left(ServerFailure()));
  //     // assert later
  //     final expected = [
  //       MovieDetailsInitial(),
  //       Loading(),
  //       Error(message: 'Server Failure!'),
  //     ];
  //     expectLater(bloc, emitsInOrder(expected));
  //     // act
  //     bloc.add(AddUserRatingRequested(movie: tResult, userRating: 8));
  //   },
  // );
  // });
}
