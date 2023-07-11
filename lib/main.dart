library lh.desktop;

import 'package:flutter/material.dart';
import 'package:lighthouse_desktop/views/views.dart';

void main() {
  runApp(const LighthouseApp());
}

class LighthouseApp extends StatelessWidget {
  const LighthouseApp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/test',
      theme: ThemeData(),
      routes: {
        '/test': (BuildContext context) {
          return TestView();
        },
      },
    );
  }
}
