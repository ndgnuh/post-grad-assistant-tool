import 'package:flutter/material.dart';

/// A scroll view that expands to fill the available space in both directions,
/// while still allowing scrolling if the content overflows.
class ExpandedScrollView extends StatelessWidget {
  final Widget child;
  final EdgeInsetsGeometry? padding;

  const ExpandedScrollView({
    super.key,
    required this.child,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) => SingleChildScrollView(
        padding: padding,
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
