import 'package:meta/meta.dart';
import 'package:movieapp/domain/entities/user_rating.dart';

class UserRatingModel extends UserRating {
  UserRatingModel({
    @required final int rating
  }) : super(
          rating: rating,
        );

  factory UserRatingModel.fromJson(
    Map<String, dynamic> data,
  ) {
    return UserRatingModel(
      rating: data['rating'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'rating': rating,
    };
  }

  static List encondeToJson(List<UserRatingModel>list){
    List jsonList = List();
    list.map((item)=>
      jsonList.add(item.toJson())
    ).toList();
    return jsonList;
}
}
