part of 'movie_bloc.dart';

abstract class MovieEvent extends Equatable {
  const MovieEvent();
}

class InitialLoadRequested extends MovieEvent {
  List<Object> get props => [];
}

class SearchRequested extends MovieEvent {
  final String searchTerm;

  SearchRequested({
    @required this.searchTerm,
  });

  List<Object> get props => [searchTerm];
}