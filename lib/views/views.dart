library lh.desktop.views;

import 'package:affogato_editor/affogato_editor.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:bootstrap_icons/bootstrap_icons.dart';
import 'package:flutter/material.dart';
import 'package:hotbox/hotbox.dart';
import 'package:lighthouse_core/db/db.dart';
import 'package:lighthouse_core/engines/engines.dart';
import 'package:lighthouse_core/utils/utils.dart';
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
part './helmscript_console.dart';

final Sprint sprint = Sprint(userKey: 'userKey')
  ..title.set('Sprint Title')
  ..start.set(DateTime.now().subtract(const Duration(days: 4)))
  ..end.set(DateTime.now().add(const Duration(days: 2)));

final Epic epic = Epic(userKey: 'userKey')
  ..title.set('Epic Title')
  ..tasks.set([task.objectId].getValues())
  ..project.set('project');

final Task task = Task(userKey: 'userKey')
  ..title.set('Task Title')
  ..description.set("Description")
  ..due.set(DateTime.now().add(const Duration(days: 2)))
  ..assigned.set(DateTime.now().add(const Duration(days: 1)))
  ..duration.set(const Duration(minutes: 10))
  ..load.set(0.4)
  ..sprint.set(sprint.objectId.get());
