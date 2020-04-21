import 'package:flutter_test/flutter_test.dart';
import 'package:movieapp/data/models/user_rating_model.dart';
import 'package:movieapp/domain/entities/user_rating.dart';

void main() {
  final tUserRatingModel = UserRatingModel(rating: 8);

  test(
    'Should be a subclass of UserRating entity',
    () async {
      // assert
      expect(tUserRatingModel, isA<UserRating>());
    },
  );

  group('fromJson', () {
    test(
      'should return a valid UserRating model',
      () async {
        // arrange
        final Map<String, dynamic> tData = {
          'rating': 8,
        };

        // act
        final tResult = UserRatingModel.fromJson(tData);
        // assert
        expect(tResult, tUserRatingModel);
      },
    );
  });
}
