extension StringExtensions on String {
  /// take
  /// * Return only specified chars of length
  ///
  String take(int chars) => substring(0, chars.clamp(0, length));
}
