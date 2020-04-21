import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:movieapp/core/error/failure.dart';
import 'package:movieapp/core/usecases/usecases.dart';
import 'package:movieapp/domain/entities/movie.dart';
import 'package:movieapp/domain/repository/movie_repository.dart';
import 'package:meta/meta.dart';

class AddUserRating implements UseCase<Movie, AddUserRatingParams> {
  final MovieRepository repository;

  AddUserRating(this.repository);

  Future<Either<Failure, Movie>> call(AddUserRatingParams params) async {
    return await repository.addUserRating(
      params.movie,
      params.userRating,
    );
  }
}

class AddUserRatingParams extends Equatable {
  final Movie movie;
  final int userRating;

  AddUserRatingParams({@required this.movie, @required this.userRating});

  @override
  List<Object> get props => [
        movie,
        userRating,
      ];
}
