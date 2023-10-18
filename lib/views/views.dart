library lh.desktop.views;

import 'package:flutter/material.dart';
import 'package:lighthouse_core/db/db.dart';
import 'package:lighthouse_core/engines/context_engine/context_engine.dart';
import 'package:lighthouse_desktop/design_system/design_system.dart';

part './test_view.dart';
part './launch_night.dart';

final Sprint sprint = Sprint(
  tasks: [],
  status: SprintStatus.inbox,
  start: DateTimeRep(DateTime.now().subtract(const Duration(days: 4))),
  end: DateTimeRep(DateTime.now().add(const Duration(days: 2))),
  userKey: 'userKey',
  title: 'Sprint Title',
);

final Task task = Task(
  description: 'description',
  dependencies: [],
  status: TaskStatus.inbox,
  due: DateTimeRep(DateTime.now().add(const Duration(days: 2))),
  assigned: DateTimeRep(DateTime.now().add(const Duration(days: 1))),
  duration: const DurationRep(Duration(minutes: 10)),
  load: 0.4,
  contexts: [],
  epic: 'epic',
  sprint: sprint.objectId,
  project: 'project',
  userKey: 'userKey',
  title: 'Task Title',
);
