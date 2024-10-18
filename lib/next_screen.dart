import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';

class NextScreen extends StatelessWidget {
  static const routeName = "/nextScreen";

  const NextScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: InkWell(
        onTap: () {
          Share.share("https://deeplink-test-flutter.web.app$routeName");
        },
        child: const Center(
          child: Text("Test"),
        ),
      ),
    );
  }
}
