import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

/// capitalize
/// * Capitalize first letter of word
///
String titleCase(String arg) {
  return arg[0].toUpperCase() + arg.substring(1);
}

/// hasInternetConnection
/// * Check whether device has active internet connection
///
Future<bool> hasInternetConnection() async {
  return await InternetConnectionChecker().hasConnection;
}

/// authNavigate
/// * Navigates to the right destination based on current state of The Application
///
// TODO: Write authNavigate
Future<void> authNavigate(BuildContext context) async {
  context.goNamed('login');
}
