extension CapitalizeExtension on String {
  String get capitalize {
    return isEmpty ? this : this[0].toUpperCase() + substring(1);
  }
}
