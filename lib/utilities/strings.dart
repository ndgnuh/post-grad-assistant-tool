/// Utility functions for string manipulation
/// It relies on string extensions, so import without prefix is required.
///
/// Extensions on numbers:
/// - [formatMoney]: Formats a number as a string with thousands separators (dots).
/// - [toVietnameseWords]: Converts a number to its Vietnamese word representation.
///
/// Extensions on strings:
/// - [toPascalCase]: Converts a name string to PascalCase.
/// - [toKebabCase]: Converts a name string to kebab-case.
///
/// Extensions on dates:
/// - [toDmy]: Converts a date to dd-mm-yyyy format

library;

/// Export `toVietnameseWords` num extensions from the `number_to_vietnamese_words` package.
export 'package:number_to_vietnamese_words/number_to_vietnamese_words.dart';
export 'package:diacritic/diacritic.dart' show removeDiacritics;
import 'package:diacritic/diacritic.dart';

extension StringFormatter on String {
  /// Convert a string to PascalCase.
  /// Remove all the diacritics, split by spaces,
  /// uppercase the first letter of each word, and join them together.
  /// Convert the string to PascalCase.
  String toPascalCase() {
    final noDiacritics = removeDiacritics(this);
    final parts = noDiacritics.split(' ');
    final capitalizedWords = [
      for (final part in parts)
        if (part.isNotEmpty)
          part[0].toUpperCase() + part.substring(1).toLowerCase(),
    ];
    return capitalizedWords.join();
  }

  /// Convert a string to kebab-case, remove all diacritics,
  /// split by spaces, lowercase all letters, and join with hyphens.
  String toKebabCase() {
    final noDiacritics = removeDiacritics(this);
    final parts = noDiacritics.split(' ');
    final lowercasedWords = [
      for (final part in parts)
        if (part.isNotEmpty) part.toLowerCase(),
    ];
    return lowercasedWords.join('-');
  }

  /// Convert a camelCase string to kebab-case.
  String camelToKebabCase() {
    final regex = RegExp(r'(?<=[a-z])(?=[A-Z])');
    final parts = split(regex);
    final lowercasedWords = [
      for (final part in parts)
        if (part.isNotEmpty) part.toLowerCase(),
    ];
    return lowercasedWords.join('-');
  }

  /// Convert a snake_case string to kebab-case.
  String snakeToKebabCase() {
    final parts = split('_');
    final lowercasedWords = [
      for (final part in parts)
        if (part.isNotEmpty) part.toLowerCase(),
    ];
    return lowercasedWords.join('-');
  }
}

extension DateFormatter on DateTime {
  /// Convert a DateTime to dd-mm-yyyy format.
  String toDmy() {
    final day = this.day.toString().padLeft(2, '0');
    final month = this.month.toString().padLeft(2, '0');
    final year = this.year.toString();
    return '$day-$month-$year';
  }

  /// to vietnamese string, e.g. "Ngày 1 tháng 2 năm 2023"
  /// usually used in official documents
  String toVietnameseString() {
    final day = this.day;
    final month = this.month;
    final year = this.year;
    return 'Ngày $day tháng $month năm $year';
  }
}

extension MoneyFormatter on num {
  /// formats the number as a string with thousands separators (dots).
  String formatMoney() {
    final String formatted = toString();
    final characters = formatted.split('');

    final outputChars = <String>[];

    for (final (i, c) in characters.reversed.indexed) {
      if (i != 0 && i % 3 == 0) {
        outputChars.add('.');
      }
      outputChars.add(c);
    }

    return outputChars.reversed.join('');
  }
}
