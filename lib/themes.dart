import 'package:flutter/material.dart';
import 'package:flutter_gutter/flutter_gutter.dart';

ThemeData getTheme({
  required ThemeData baseTheme,
  required BuildContext context,
}) {
  final radius = context.gutterSmall;
  final buttonShape = RoundedRectangleBorder(
    borderRadius: BorderRadius.all(
      Radius.circular(radius),
    ),
  );

  final buttonPadding = EdgeInsets.symmetric(
    horizontal: context.gutter,
    vertical: context.gutterSmall,
  );

  final segmentedButtonTheme = SegmentedButtonThemeData(
    style: SegmentedButton.styleFrom(
      shape: buttonShape,
      padding: buttonPadding,
    ),
  );

  final filledButtonTheme = FilledButtonThemeData(
    style: FilledButton.styleFrom(
      shape: buttonShape,
      padding: buttonPadding,
    ),
  );

  final outlinedButtonTheme = OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      shape: buttonShape,
      padding: buttonPadding,
    ),
  );

  final elevatedButtonTheme = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      shape: buttonShape,
      padding: buttonPadding,
    ),
  );

  final textButtonThemeData = TextButtonThemeData(
    style: TextButton.styleFrom(
      shape: buttonShape,
      padding: buttonPadding,
    ),
  );

  final iconButtonTheme = IconButtonThemeData(
    style: IconButton.styleFrom(
      shape: buttonShape,
      padding: EdgeInsets.all(context.gutterTiny),
    ),
  );

  final colorScheme = ColorScheme.fromSeed(
    seedColor: Colors.deepPurple,
    brightness: baseTheme.brightness,
  );

  // Text inputs
  // ===========

  final inputDecorationTheme = InputDecorationTheme(
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(context.gutterSmall),
    ),
    contentPadding: EdgeInsets.symmetric(
      horizontal: context.gutter,
      vertical: context.gutterTiny,
    ),
    // floatingLabelBehavior: FloatingLabelBehavior.always,
  );

  final searchBarTheme = SearchBarThemeData(
    constraints: BoxConstraints.tightFor(height: 50),
    side: WidgetStateProperty.all<BorderSide>(
      BorderSide(width: 1.0),
    ),
    shape: WidgetStateProperty.all<RoundedRectangleBorder>(
      RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
    ),
  );

  final dropdownMenuTheme = baseTheme.dropdownMenuTheme.copyWith(
    inputDecorationTheme: inputDecorationTheme,
  );

  // See this doc
  // https: //api.flutter.dev/flutter/material/TextTheme-class.html
  // final typography = switch (baseTheme.brightness) {
  //   Brightness.dark => Typography.whiteMountainView,
  //   Brightness.light => Typography.blackMountainView,
  // };
  //
  // // final textTheme = TextTheme.of(context).apply(
  // final fontSizeFactor = Platform.isLinux ? 1.25 : 1.0;
  // final fontSizeDelta = Platform.isLinux ? 4.0 : 0.0;
  // final textTheme = typography
  //     .merge(Typography.tall2021)
  //     .apply(fontSizeDelta: fontSizeDelta);

  return ThemeData.from(
    colorScheme: colorScheme,
    useMaterial3: true,
  ).copyWith(
    dropdownMenuTheme: dropdownMenuTheme,
    outlinedButtonTheme: outlinedButtonTheme,
    elevatedButtonTheme: elevatedButtonTheme,
    inputDecorationTheme: inputDecorationTheme,
    filledButtonTheme: filledButtonTheme,
    searchBarTheme: searchBarTheme,
    textButtonTheme: textButtonThemeData,
    iconButtonTheme: iconButtonTheme,
    segmentedButtonTheme: segmentedButtonTheme,
  );
}

class Themes {
  final BuildContext context;
  Themes(this.context);

  ThemeData get dark => getTheme(
    baseTheme: ThemeData.dark(useMaterial3: true),
    context: context,
  );

  ThemeData get light => getTheme(
    baseTheme: ThemeData.light(useMaterial3: true),
    context: context,
  );
}
