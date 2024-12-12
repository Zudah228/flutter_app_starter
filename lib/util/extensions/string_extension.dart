extension StringExtension on String {
  /// isEmpty なら Null で返す
  ///
  /// ```
  /// [
  ///   if (object.description.nullIfEmpty final case description?) {
  ///     Text(description),
  ///   }
  /// ]
  /// ```
  String? get nullIfEmpty => isEmpty ? null : this;
}
