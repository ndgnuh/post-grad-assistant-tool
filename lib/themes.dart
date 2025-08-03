import 'package:flutter/material.dart';
import 'package:get/get.dart';

ThemeData getTheme(ThemeData baseTheme) {
  final colorScheme = baseTheme.colorScheme;

  final buttonShape = RoundedRectangleBorder(
    borderRadius: BorderRadius.all(Radius.circular(10)),
  );

  final buttonPadding = EdgeInsets.symmetric(
    horizontal: 24.0,
    vertical: 16.0,
  );

  final filledButtonTheme = FilledButtonThemeData(
    style: FilledButton.styleFrom(
      shape: buttonShape,
    ),
  );

  final inputDecorationTheme = InputDecorationTheme(
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10.0),
    ),
    floatingLabelBehavior: FloatingLabelBehavior.always,
  );

  final searchBarTheme = SearchBarThemeData(
    constraints: BoxConstraints.tightFor(height: 50),
    shape: WidgetStateProperty.all<RoundedRectangleBorder>(
      RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
    ),
  );

  final outlinedButtonTheme = OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      shape: buttonShape,
      side: BorderSide(color: colorScheme.primary),
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

  return baseTheme.copyWith(
    outlinedButtonTheme: outlinedButtonTheme,
    elevatedButtonTheme: elevatedButtonTheme,
    inputDecorationTheme: inputDecorationTheme,
    filledButtonTheme: filledButtonTheme,
    searchBarTheme: searchBarTheme,
    textButtonTheme: textButtonThemeData,
  );
}

class Themes {
  ThemeData get dark => getTheme(ThemeData.dark());
  ThemeData get light => getTheme(ThemeData.light());
}
