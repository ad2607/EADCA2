import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:movieapp/core/error/failure.dart';
import 'package:movieapp/core/usecases/usecases.dart';
import 'package:movieapp/domain/entities/movie.dart';
import 'package:movieapp/domain/repository/movie_repository.dart';
import 'package:meta/meta.dart';

class SearchMovies implements UseCase<List<Movie>, SearchMoviesParams> {
  final MovieRepository repository;

  SearchMovies(this.repository);

  Future<Either<Failure, List<Movie>>> call(SearchMoviesParams params) async {
    return await repository.searchMovies(
      params.searchTerm,
    );
  }
}

class SearchMoviesParams extends Equatable {
  final String searchTerm;

  SearchMoviesParams({
    @required this.searchTerm,
  });

  @override
  List<Object> get props => [searchTerm];
}
