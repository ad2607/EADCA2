import 'package:flutter/material.dart';

class ErrorStateWidget extends StatefulWidget {
  @override
  _ErrorStateWidgetState createState() => _ErrorStateWidgetState();
}

class _ErrorStateWidgetState extends State<ErrorStateWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text('ERROR'),
      ),
    );
  }
}