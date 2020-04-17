import 'package:flutter/material.dart';

class FailureWidget extends StatefulWidget {
  @override
  _FailureWidgetState createState() => _FailureWidgetState();
}

class _FailureWidgetState extends State<FailureWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text('Soemthing went wrong... the state you tried to use is not a real state'),
      ),
    );
  }
}