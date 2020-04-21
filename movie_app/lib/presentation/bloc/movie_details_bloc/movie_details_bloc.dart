import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movieapp/core/error/failure.dart';
import 'package:movieapp/domain/entities/movie.dart';
import 'package:movieapp/domain/usecases/add_user_rating.dart';
import 'package:meta/meta.dart';
import 'package:flutter/services.dart';
import 'package:movieapp/domain/usecases/get_all_movies.dart';

part 'movie_details_event.dart';
part 'movie_details_state.dart';

class MovieDetailsBloc extends Bloc<MovieDetailsEvent, MovieDetailsState> {
  final AddUserRating addUserRating;
  final GetAllMovies getAllMovies;

  MovieDetailsBloc({
    @required this.addUserRating,
    @required this.getAllMovies,
  });
  @override
  MovieDetailsState get initialState => MovieDetailsInitial();

  @override
  Stream<MovieDetailsState> mapEventToState(
    MovieDetailsEvent event,
  ) async* {
    try {
      yield Loading();
      if (event is AddUserRatingRequested) {
        final failureOrMovie = await addUserRating(
          AddUserRatingParams(
            movie: event.movie,
            userRating: event.userRating,
          ),
        );

        final failureOrMovieList = await getAllMovies(AllMoviesParams());

        final movieList = failureOrMovieList.getOrElse(null);

        yield failureOrMovie.fold(
          (failure) => Error(
            message: _mapFailureToMessage(
              failure,
            ),
          ),
          (movie) => UserRatingAdded(
            movie: movie,
            movieList: movieList,
          ),
        );
      }
    } on PlatformException catch (e) {
      yield Error(message: e.toString());
    }
  }

  String _mapFailureToMessage(Failure failure) {
    switch (failure.runtimeType) {
      case ServerFailure:
        return 'Server Failure';
        break;
      default:
        return 'Unexpected Error';
    }
  }
}
