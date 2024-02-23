import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

// API URL
const _debugUrl = "http://10.0.2.2:3000";
const _prodUrl = "http://10.0.2.2:3000";
const apiUrl = kReleaseMode ? _prodUrl : _debugUrl;

// Store Token In Local Storage
const tokenKey = "TOKEN_KEY";

const photoGrid = SliverGridDelegateWithFixedCrossAxisCount(
  crossAxisCount: 3,
  crossAxisSpacing: 5.0,
  mainAxisSpacing: 5.0,
);
