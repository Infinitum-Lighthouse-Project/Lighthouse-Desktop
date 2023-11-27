library lh.desktop.views;

import 'package:bootstrap_icons/bootstrap_icons.dart';
import 'package:flutter/material.dart';
import 'package:hotbox/hotbox.dart';
import 'package:lighthouse_core/db/db.dart';
import 'package:lighthouse_desktop/design_system/design_system.dart';

part './test_view.dart';
part './launch_night.dart';
part './sprint_end_ready.dart';
part './sprint_end_unready.dart';
part './all_day_generic.dart';
part './all_day_triage.dart';
part './sprint_planner_1.dart';
part './sprint_planner_2.dart';
part './project_viewer.dart';

final Sprint sprint = Sprint(
  tasks: [],
  status: SprintStatus.inbox,
  start: DateTime.now().subtract(const Duration(days: 4)),
  end: DateTime.now().add(const Duration(days: 2)),
  userKey: 'userKey',
  title: 'Sprint Title',
);

final Epic epic = Epic(
  tasks: [task.objectId],
  project: 'project',
  userKey: 'userKey',
  title: 'Epic Title',
);

final Task task = Task(
  description: 'description',
  dependencies: [],
  status: TaskStatus.inbox,
  due: DateTime.now().add(const Duration(days: 2)),
  assigned: DateTime.now().add(const Duration(days: 1)),
  duration: const Duration(minutes: 10),
  load: 0.4,
  contexts: [],
  epic: 'epic',
  sprint: sprint.objectId,
  project: 'project',
  userKey: 'userKey',
  title: 'Task Title',
);
