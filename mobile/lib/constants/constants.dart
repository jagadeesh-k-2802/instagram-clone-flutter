import 'package:flutter/foundation.dart';

// API URL
const _debugUrl = "http://10.0.2.2:3000";
const _prodUrl = "http://10.0.2.2:3000";
const apiUrl = kReleaseMode ? _prodUrl : _debugUrl;

/// [tokenKey] for secure local storage of JWT Token
const tokenKey = "TOKEN_KEY";
