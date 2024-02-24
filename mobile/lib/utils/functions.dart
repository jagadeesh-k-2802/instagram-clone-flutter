import 'package:internet_connection_checker/internet_connection_checker.dart';

/// capitalize
/// * Capitalize first letter of word
///
String titleCase(String arg) {
  return arg[0].toUpperCase() + arg.substring(1);
}

/// validEmailAddress
/// * Validate whether the email address is valid
///
bool validEmailAddress(String? email) {
  if (email == null) return false;

  return RegExp(
    r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+",
  ).hasMatch(email);
}

/// hasInternetConnection
/// * Check whether device has active internet connection
///
Future<bool> hasInternetConnection() async {
  return await InternetConnectionChecker().hasConnection;
}

/// instagramNumberFormatter
/// * Format numbers like instagram
///
String instagramNumberFormatter(int number) {
  if (number < 2000) {
    return number.toString();
  } else if (number < 1000000) {
    double result = number / 1000;
    return '${result.toStringAsFixed(1)}K';
  } else if (number < 1000000000) {
    double result = number / 1000000;
    return '${result.toStringAsFixed(1)}M';
  } else {
    double result = number / 1000000000;
    return '${result.toStringAsFixed(1)}B';
  }
}
