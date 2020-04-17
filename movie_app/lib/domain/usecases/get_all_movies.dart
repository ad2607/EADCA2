import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:movieapp/core/error/failure.dart';
import 'package:movieapp/core/usecases/usecases.dart';
import 'package:movieapp/domain/entities/movie.dart';
import 'package:movieapp/domain/repository/movie_repository.dart';

class GetAllMovies implements UseCase<List<Movie>, AllMoviesParams> {
  final MovieRepository repository;

  GetAllMovies(this.repository);

  Future<Either<Failure, List<Movie>>> call(AllMoviesParams params) async {
    return await repository.getAllMovies();
  }
}

class AllMoviesParams extends Equatable {
  @override
  List<Object> get props => [];
}
