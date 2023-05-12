import 'package:flutter/material.dart';

class DefaultPadding extends StatelessWidget {
  final double _padding = 12.0;
  final Widget child;
  const DefaultPadding({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding:
            EdgeInsets.symmetric(vertical: _padding, horizontal: _padding * 2),
        child: child);
  }
}
