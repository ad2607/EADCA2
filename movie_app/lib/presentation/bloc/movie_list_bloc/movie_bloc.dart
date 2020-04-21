import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movieapp/core/error/failure.dart';
import 'package:movieapp/domain/entities/movie.dart';
import 'package:movieapp/domain/usecases/get_all_movies.dart';
import 'package:meta/meta.dart';
import 'package:flutter/services.dart';
import 'package:movieapp/domain/usecases/search_movies.dart';

part 'movie_event.dart';
part 'movie_state.dart';

class MovieBloc extends Bloc<MovieEvent, MovieState> {
  final GetAllMovies getAllMovies;
  final SearchMovies searchMovies;
  

  MovieBloc({
    @required this.getAllMovies,
    @required this.searchMovies,
  });
  @override
  MovieState get initialState => MovieInitial();

  @override
  Stream<MovieState> mapEventToState(
    MovieEvent event,
  ) async* {
    try {
      if (event is InitialLoadRequested) {
        final failureOrMovies = await getAllMovies(AllMoviesParams());
        yield failureOrMovies.fold(
          (failure) => Error(
            message: _mapFailureToMessage(
              failure,
            ),
          ),
          (movies) => Loaded(
            movies: movies,
          ),
        );
      } else if (event is SearchRequested) {
        final failureOrMovies = await searchMovies(
          SearchMoviesParams(
            searchTerm: event.searchTerm,
          ),
        );

        yield failureOrMovies.fold(
          (failure) => Loaded(
            movies: List<Movie>(),
          ),
          (movies) => Loaded(
            movies: movies,
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
