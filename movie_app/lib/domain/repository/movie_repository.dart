import 'package:dartz/dartz.dart';
import 'package:movieapp/core/error/failure.dart';
import 'package:movieapp/domain/entities/movie.dart';

abstract class MovieRepository {
  Future<Either<Failure, List<Movie>>> getAllMovies();
  Future<Either<Failure, List<Movie>>> searchMovies(
    String searchTerm,
  );
  Future<Either<Failure, Movie>> addUserRating(
    Movie movie,
    int userRating
  );
}
