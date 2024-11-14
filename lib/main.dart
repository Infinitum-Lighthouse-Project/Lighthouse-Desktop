library lh.desktop;

import 'package:flutter/material.dart';
import 'package:lighthouse_core/db/db.dart';
import 'package:lighthouse_desktop/design_system/design_system.dart';
import 'package:lighthouse_desktop/views/views.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DB.init();
  runApp(const LighthouseApp());
}

class LighthouseApp extends StatelessWidget {
  const LighthouseApp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/launch/night',
      theme: ThemeData(
        fontFamily: 'Cairo',
        canvasColor: const Lavender.s1000(),
        primaryColor: const Lavender.s900(),
        splashColor: Colors.red,
      ),
      routes: {
        '/launch/night': (_) => const LaunchStateNight(),
        '/launch/sprintready': (_) => const SprintEndReady(),
        '/launch/sprintunready': (_) => const SprintEndUnready(),
        '/launch/generic': (_) => const AllDayGeneric(),
        '/launch/triage': (_) => const AllDayTriage(),
        '/tools/sprintplanner/1': (_) => const SprintPlanner1(),
        '/tools/sprintplanner/2': (_) => const SprintPlanner2(tasks: []),
        '/tools/projectviewer': (_) => const ProjectViewer(epicDocs: []),
        '/console': (_) => const HelmscriptConsoleView(),
        '/test': (_) => TestView(),
      },
    );
  }
}
