import 'package:fl02_lite/screens/ex0/root_page.dart';
import 'package:fl02_lite/screens/ex1/stop_watch/stop_watch_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

void main() {
  runApp(
    ProviderScope(child: MyApp()),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: StopWatchPage(),
    );
  }
}
