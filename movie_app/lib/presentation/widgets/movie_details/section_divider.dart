import 'package:flutter/material.dart';

class SectionDivider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Divider(
      thickness: 1,
      color: Color.fromRGBO(
        68,
        68,
        68,
        1,
      ),
      indent: 10,
      endIndent: 10,
    );
  }
}
