import 'package:freezed_annotation/freezed_annotation.dart';

/// Convert [String] to [DateTime]
class DateTimeConvertor implements JsonConverter<DateTime, String> {
  const DateTimeConvertor();

  @override
  DateTime fromJson(String dateString) => DateTime.parse(dateString);

  @override
  String toJson(DateTime date) => date.toString();
}
