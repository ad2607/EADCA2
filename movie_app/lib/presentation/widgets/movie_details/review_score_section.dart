import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:movieapp/app_localizations.dart';
import 'package:movieapp/domain/entities/movie.dart';
import 'package:movieapp/domain/entities/user_rating.dart';
import 'package:movieapp/presentation/bloc/movie_details_bloc/movie_details_bloc.dart';

class ReviewScoreSection extends StatefulWidget {
  final Movie movie;
  final double imdbRating;
  final int rottenTomatoesScore;
  final List<UserRating> userRatings;

  const ReviewScoreSection({
    Key key,
    @required this.movie,
    @required this.imdbRating,
    @required this.rottenTomatoesScore,
    @required this.userRatings,
  }) : super(key: key);

  @override
  _ReviewScoreSectionState createState() => _ReviewScoreSectionState();
}

class _ReviewScoreSectionState extends State<ReviewScoreSection> {
  int rating = 5;
  int totalUserRating;
  double averageUserRating;
  @override
  Widget build(BuildContext context) {
    totalUserRating = 0;
    widget.userRatings.forEach((userRating) {
      totalUserRating += userRating.rating;
    });
    averageUserRating = (totalUserRating / widget.userRatings.length);
    return Container(
      padding: EdgeInsets.only(bottom: 30),
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Container(
                child: Column(
                  children: <Widget>[
                    Container(
                      width: 120,
                      child: Text(
                        widget.imdbRating.toString(),
                        style: TextStyle(
                            color: buildIMDBRatingColour(),
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Container(
                      width: 120,
                      margin: EdgeInsets.only(top: 30),
                      child: Text(
                        AppLocalizations.of(context).translate('imdb'),
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 26),
                child: Column(
                  children: <Widget>[
                    Container(
                      width: 120,
                      child: Text(
                        widget.rottenTomatoesScore.toString() + '%',
                        style: TextStyle(
                          color: buildRottenTomatoesScoreColour(),
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Container(
                      width: 120,
                      margin: EdgeInsets.only(top: 30),
                      child: Text(
                        AppLocalizations.of(context)
                            .translate('rotten_tomatoes'),
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                child: Column(
                  children: <Widget>[
                    Container(
                      width: 120,
                      child: Text(
                        buildUserRatingText(),
                        style: TextStyle(
                          color: buildUserRatingColour(),
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Container(
                      width: 120,
                      margin: EdgeInsets.only(top: 30),
                      child: Text(
                        AppLocalizations.of(context).translate('users'),
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Container(
            padding: EdgeInsets.only(top: 20),
            width: 300,
            child: RaisedButton(
              key: Key('addRatingButton'),
              child: Text(
                'Rate this Movie',
                style: TextStyle(color: Colors.white),
              ),
              color: Color.fromRGBO(51, 51, 61, 1),
              onPressed: _showDialog,
            ),
          ),
        ],
      ),
    );
  }

  Color buildIMDBRatingColour() {
    if (widget.imdbRating >= 8) {
      return Color.fromRGBO(0, 255, 0, 1);
    } else if (widget.imdbRating < 8 && widget.imdbRating >= 6) {
      return Colors.yellow;
    } else if (widget.imdbRating < 6 && widget.imdbRating >= 4) {
      return Colors.orange;
    } else {
      return Colors.red;
    }
  }

  Color buildRottenTomatoesScoreColour() {
    if (widget.rottenTomatoesScore >= 80) {
      return Color.fromRGBO(0, 255, 0, 1);
    } else if (widget.rottenTomatoesScore < 80 &&
        widget.rottenTomatoesScore >= 60) {
      return Colors.yellow;
    } else if (widget.rottenTomatoesScore < 60 &&
        widget.rottenTomatoesScore >= 40) {
      return Colors.orange;
    } else {
      return Colors.red;
    }
  }

  Color buildUserRatingColour() {
    if (averageUserRating >= 8) {
      return Color.fromRGBO(0, 255, 0, 1);
    } else if (averageUserRating < 8 && averageUserRating >= 6) {
      return Colors.yellow;
    } else if (averageUserRating < 6 && averageUserRating >= 4) {
      return Colors.orange;
    } else {
      return Colors.red;
    }
  }

  String buildUserRatingText() {
    if (widget.userRatings.isEmpty) {
      return AppLocalizations.of(context).translate('none');
    } else {
      return averageUserRating.toStringAsFixed(1);
    }
  }

  void _showDialog() {
    // flutter defined function
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          title: Text("Rate this Movie"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              RatingBar(
                initialRating: 5,
                minRating: 1,
                direction: Axis.horizontal,
                allowHalfRating: false,
                itemCount: 10,
                itemSize: 50.0,
                itemBuilder: (context, _) => Icon(
                  Icons.star,
                  color: Colors.amber,
                ),
                onRatingUpdate: (newRating) {
                  rating = newRating.toInt();
                  print(newRating);
                },
              ),
            ],
          ),
          actions: <Widget>[
            // usually buttons at the bottom of the dialog
            new FlatButton(
              key: Key('addRatingConfirmButton'),
              child: new Text("Confirm"),
              onPressed: () {
                _addUserRating();
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void _addUserRating() {
    BlocProvider.of<MovieDetailsBloc>(context).add(
      AddUserRatingRequested(
        movie: widget.movie,
        userRating: rating,
      ),
    );
  }
}
