import 'dart:async';
import 'package:deep_linking_flutter/page_handler.dart';
import 'package:deep_linking_flutter/routes.dart';
import 'package:deep_linking_flutter/next_screen.dart';
import 'package:flutter/material.dart';
import 'package:uni_links/uni_links.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Deeplink Test',
      navigatorKey: navigatorKey,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const ReferPage(),
      routes: Routes.routes,
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
      navigateToScreenFromUri(uri);
    }

    // Background state
    uriLinkStream.listen((Uri? uri) {
      if (uri != null) {
        navigateToScreenFromUri(uri);
      }
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
        child: InkWell(
          onTap: () {
            Navigator.of(context).pushNamed(NextScreen.routeName);
          },
          child: const Text("Next"),
        ),
      ),
    );
  }
}
