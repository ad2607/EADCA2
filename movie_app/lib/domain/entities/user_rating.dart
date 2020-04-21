import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

class UserRating extends Equatable {
  final int rating;

  UserRating({
    @required this.rating,
  });

  @override
  List<Object> get props => [
        rating,
      ];
}
