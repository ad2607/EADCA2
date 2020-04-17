import 'package:flutter/material.dart';
import 'package:movieapp/app_localizations.dart';

class FailureWidget extends StatefulWidget {
  @override
  _FailureWidgetState createState() => _FailureWidgetState();
}

class _FailureWidgetState extends State<FailureWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text(
          AppLocalizations.of(context).translate('failure_state_text'),
        ),
      ),
    );
  }
}
