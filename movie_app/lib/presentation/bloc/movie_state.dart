part of 'movie_bloc.dart';

abstract class MovieState extends Equatable {
  const MovieState();
}

class MovieInitial extends MovieState {
  @override
  List<Object> get props => [];
}

class Loading extends MovieState {
  @override
  List<Object> get props => [];
}

class Error extends MovieState {
  final String message;

  Error({
    @required this.message,
  });

  List<Object> get props => [message];
}

class Loaded extends MovieState {
  final List<Movie> movies;

  Loaded({
    @required this.movies,
  });

  @override
  List<Object> get props => [movies];
}
