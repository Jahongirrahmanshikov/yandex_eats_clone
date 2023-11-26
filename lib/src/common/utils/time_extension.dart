import 'capitalize_extension.dart';

enum MonthName {
  january,
  february,
  march,
  april,
  may,
  june,
  july,
  august,
  september,
  october,
  november,
  december,
}

extension TimeExtension on int {
  String get monthName {
    if (this >= 1 && this <= 12) {
      final monthEnum = MonthName.values[this - 1];
      return monthEnum.toString().split('.').last.capitalize;
    } else {
      throw Exception('Invalid month integer. Must be between 1 and 12.');
    }
  }
}




