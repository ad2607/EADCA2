import 'package:flutter/material.dart';

class ReleaseDateSection extends StatefulWidget {
  final String releaseDate;

  const ReleaseDateSection({Key key, @required this.releaseDate}) : super(key: key);

  @override
  _ReleaseDateSectionState createState() => _ReleaseDateSectionState();
}

class _ReleaseDateSectionState extends State<ReleaseDateSection> {
  @override
  Widget build(BuildContext context) {
    final date = DateTime.parse(widget.releaseDate);
    final formattedDate = date.year.toString();
    return Container(
      padding: EdgeInsets.only(
        bottom: 30,
      ),
      child: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.symmetric(vertical: 8),
            child: Text(
              'Release Date',
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
              formattedDate,
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
