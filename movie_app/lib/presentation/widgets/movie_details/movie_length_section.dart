import 'package:flutter/material.dart';
import 'package:movieapp/app_localizations.dart';

class MovieLengthSection extends StatefulWidget {
  final String length;

  const MovieLengthSection({Key key, @required this.length}) : super(key: key);

  @override
  _MovieLengthSectionState createState() => _MovieLengthSectionState();
}

class _MovieLengthSectionState extends State<MovieLengthSection> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        bottom: 30,
      ),
      child: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.symmetric(vertical: 8),
            child: Text(
              AppLocalizations.of(context).translate('movie_length'),
              textAlign: TextAlign.left,
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(vertical: 8),
            width: MediaQuery.of(context).size.width * 0.9,
            child: Text(
              widget.length,
              textAlign: TextAlign.left,
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
