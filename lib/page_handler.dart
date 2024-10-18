import 'package:deep_linking_flutter/main.dart';
import 'package:deep_linking_flutter/next_screen.dart';
import 'package:flutter/material.dart';

navigateToScreenFromUri(Uri uri) {
  String? path = uri.path;

  if (path == "/nextScreen") {
    Navigator.of(navigatorKey.currentState!.context)
        .pushNamed(NextScreen.routeName);
  } else {}
}
