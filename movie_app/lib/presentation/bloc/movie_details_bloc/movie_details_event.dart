part of 'movie_details_bloc.dart';

abstract class MovieDetailsEvent extends Equatable {
  const MovieDetailsEvent();
}

class AddUserRatingRequested extends MovieDetailsEvent {
  final Movie movie;
  final int userRating;

  AddUserRatingRequested({
    @required this.movie,
    @required this.userRating,
  });

  List<Object> get props => [
        movie,
        userRating,
      ];
}