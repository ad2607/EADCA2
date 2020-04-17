import 'package:flutter/material.dart';
import 'package:movieapp/app_localizations.dart';

class ReviewScoreSection extends StatefulWidget {
  final double imdbRating;
  final int rottenTomatoesScore;

  const ReviewScoreSection({Key key, @required this.imdbRating, @required this.rottenTomatoesScore})
      : super(key: key);

  @override
  _ReviewScoreSectionState createState() => _ReviewScoreSectionState();
}

class _ReviewScoreSectionState extends State<ReviewScoreSection> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(bottom: 30),
      child: Row(
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
                    AppLocalizations.of(context).translate('rotten_tomatoes'),
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
}
