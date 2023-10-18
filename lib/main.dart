library lh.desktop;

import 'package:flutter/material.dart';
import 'package:lighthouse_core/db/db.dart';
import 'package:lighthouse_desktop/design_system/design_system.dart';
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
      theme: ThemeData(
        fontFamily: 'Cairo',
        canvasColor: const Lavender.s1000(),
        primaryColor: const Lavender.s900(),
        splashColor: Colors.red,
      ),
      routes: {
        '/launch_night': (_) => const LaunchStateNight(),
        '/test': (_) => TestView(),
      },
    );
  }
}
