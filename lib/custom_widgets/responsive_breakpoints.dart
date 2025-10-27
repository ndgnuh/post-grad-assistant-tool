import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_gutter/flutter_gutter.dart';

enum ScreenSize { small, medium, large }

extension Breakpoints on BuildContext {
  ScreenSize get screenSize {
    final width = MediaQuery.sizeOf(this).width;
    if (width < 600) {
      return ScreenSize.small;
    } else if (width < 1200) {
      return ScreenSize.medium;
    } else {
      return ScreenSize.large;
    }
  }

  double get responsiveGutter => switch (screenSize) {
    ScreenSize.small => gutterSmall,
    ScreenSize.medium => gutterSmall,
    ScreenSize.large => gutter,
  };

  bool get isSmallScreen => screenSize == ScreenSize.small;
  bool get isMediumScreen => screenSize == ScreenSize.medium;
  bool get isLargeScreen => screenSize == ScreenSize.large;

  bool get isMediumOrLargerScreen => screenSize != ScreenSize.small;
  bool get isMediumOrSmallerScreen => screenSize != ScreenSize.large;

  /// Returns the vertical direction based on the platform.
  // On the desktop, UI elements are typically arranged from top to bottom (downwards).
  // On the mobile, input fields and interactive elements are often positioned to accommodate
  // the touch screen and gripping position, which is usually from bottom to top (upwards).
  VerticalDirection get verticalDirection {
    if (Platform.isMacOS || Platform.isWindows || Platform.isLinux) {
      return VerticalDirection.down;
    } else {
      return VerticalDirection.up;
    }
  }
}
