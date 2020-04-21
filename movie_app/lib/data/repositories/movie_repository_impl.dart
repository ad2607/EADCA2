import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';
import 'package:movieapp/core/error/exceptions.dart';
import 'package:movieapp/core/error/failure.dart';
import 'package:movieapp/core/network/network_info.dart';
import 'package:movieapp/data/datasources/movie_remote_data_source.dart';
import 'package:movieapp/domain/entities/movie.dart';
import 'package:movieapp/domain/repository/movie_repository.dart';

class MovieRepositoryImpl implements MovieRepository {
  final MovieRemoteDataSource movieRemoteDataSource;
  final NetworkInfo networkInfo;

  MovieRepositoryImpl({
    @required this.movieRemoteDataSource,
    @required this.networkInfo,
  });

  @override
  Future<Either<Failure, List<Movie>>> getAllMovies() async {
    if (await networkInfo.isConnected) {
      try {
        final remoteMovies = await movieRemoteDataSource.getAllMovies();
        return Right(remoteMovies);
      } on ServerException {
        return Left(ServerFailure());
      }
    }
    return Left(UnknownFailure());
  }

  @override
  Future<Either<Failure, List<Movie>>> searchMovies(
    String searchTerm,
  ) async {
    if (await networkInfo.isConnected) {
      try {
        final remoteMovies =
            await movieRemoteDataSource.searchMovies(searchTerm);
        return Right(remoteMovies);
      } on ServerException {
        return Left(ServerFailure());
      }
    }
    return Left(UnknownFailure());
  }

  @override
  Future<Either<Failure, Movie>> addUserRating(
    Movie movie,
    int userRating
  ) async {
    if (await networkInfo.isConnected) {
      try {
        final remoteMovies =
            await movieRemoteDataSource.addUserRating(movie, userRating);
        return Right(remoteMovies);
      } on ServerException {
        return Left(ServerFailure());
      }
    }
    return Left(UnknownFailure());
  }
}
