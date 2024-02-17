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
