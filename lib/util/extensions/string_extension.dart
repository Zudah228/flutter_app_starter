extension StringExtension on String {
  String? get nullIfEmpty => isEmpty ? null : this;
}
