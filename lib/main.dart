import 'dart:async';

import 'package:flutter/material.dart';
import 'package:uni_links/uni_links.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Deeplink Test',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const ReferPage(),
    );
  }
}

class ReferPage extends StatefulWidget {
  const ReferPage({super.key});

  @override
  State<ReferPage> createState() => _ReferPageState();
}

class _ReferPageState extends State<ReferPage> {
  var refCode = "";
  late StreamSubscription _sub;

  @override
  void initState() {
    super.initState();
    _handleUri();
  }

  _handleUri() async {
    // Terminate state
    final Uri? uri = await getInitialUri();
    if (uri != null) {
      setReferralCodeFromUri(uri);
    }

    // Background state
    uriLinkStream.listen((Uri? uri) {
      if (uri != null) {
        setReferralCodeFromUri(uri);
      }
    });
  }

  setReferralCodeFromUri(Uri uri) {
    setState(() {
      refCode = uri.queryParameters["code"] ?? "";
    });
  }

  @override
  void dispose() {
    super.dispose();
    _sub.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Text(
        "Referral code = $refCode",
        style: const TextStyle(fontSize: 32),
      )),
    );
  }
}
