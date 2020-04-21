part of 'movie_details_bloc.dart';

abstract class MovieDetailsState extends Equatable {
  const MovieDetailsState();
}

class MovieDetailsInitial extends MovieDetailsState {
  @override
  List<Object> get props => [];
}

class UserRatingAdded extends MovieDetailsState {
  final Movie movie;
  final List<Movie> movieList;

  UserRatingAdded({
    @required this.movie,
    @required this.movieList,
  });

  @override
  List<Object> get props => [
        movie,
        movieList,
      ];
}

class Loading extends MovieDetailsState {
  @override
  List<Object> get props => [];
}

class Error extends MovieDetailsState {
  final String message;

  Error({
    @required this.message,
  });

  List<Object> get props => [message];
}
