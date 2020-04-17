import 'package:flutter/material.dart';
import 'package:movieapp/app_localizations.dart';

class DirectorsSection extends StatefulWidget {
  final String directors;

  const DirectorsSection({Key key, @required this.directors}) : super(key: key);

  @override
  _DirectorsSectionState createState() => _DirectorsSectionState();
}

class _DirectorsSectionState extends State<DirectorsSection> {
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
              AppLocalizations.of(context).translate('directors'),
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
              widget.directors,
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
