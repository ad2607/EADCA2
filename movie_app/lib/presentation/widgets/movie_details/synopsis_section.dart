import 'package:flutter/material.dart';

class SynopsisSection extends StatefulWidget {
  final String synopsis;

  const SynopsisSection({Key key, @required this.synopsis}) : super(key: key);

  @override
  _SynopsisSectionState createState() => _SynopsisSectionState();
}

class _SynopsisSectionState extends State<SynopsisSection> {
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
              'Synopsis',
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
              widget.synopsis,
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
