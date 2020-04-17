import 'package:flutter/material.dart';

class PosterSection extends StatefulWidget {
  final int id;
  final String title;

  const PosterSection({Key key, @required this.id, @required this.title}) : super(key: key);
  @override
  _PosterSectionState createState() => _PosterSectionState();
}

class _PosterSectionState extends State<PosterSection> {
  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
              child: Stack(
                fit: StackFit.passthrough,
                children: <Widget>[
                  Image.network(
                    'https://movieapi20200406063228.azurewebsites.net/api/Movies/poster?id=' +
                        widget.id.toString(),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Theme.of(context).primaryColor,
                          Colors.transparent,
                        ],
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 24,
                    left: 24,
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.8,
                      child: Text(
                        widget.title,
                        style: TextStyle(color: Colors.white, fontSize: 24),
                      ),
                    ),
                  ),
                ],
              ),
            );
  }
}