import 'package:flutter/material.dart';

/// A scroll view that expands to fill the available space in both directions,
/// while still allowing scrolling if the content overflows.
class ExpandedScrollView extends StatelessWidget {
  final Widget child;

  const ExpandedScrollView({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) => SingleChildScrollView(
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: ConstrainedBox(
            constraints: BoxConstraints(
              minWidth: constraints.maxWidth,
              minHeight: constraints.maxHeight,
            ),
            child: child,
          ),
        ),
      ),
    );
  }
}
