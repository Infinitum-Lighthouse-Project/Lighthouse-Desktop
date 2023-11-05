library lh.desktop.ds;

import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:hotbox/hotbox.dart';
import 'package:lighthouse_core/db/db.dart';
import 'package:lighthouse_core/engines/context_engine/context_engine.dart';

part './color.dart';
part './type.dart';
part './style.dart';

part './buttons/button.dart';
part './buttons/text_button.dart';
part './buttons/icon_button.dart';
part './buttons/icotext_button.dart';
part './buttons/pill_button.dart';

part './cards/card.dart';
part './cards/context_info_card.dart';
part './cards/task_card.dart';
part './cards/epic_card.dart';
part './cards/event_card.dart';
part './cards/timer_card.dart';
part './cards/time_tracked.dart';
part './cards/sprint_card.dart';
part './cards/recommendations_card.dart';
part './cards/prototype_dashboard_card.dart';

part './containers/container.dart';
part './containers/vertical_shelf.dart';
part './containers/horizontal_shelf.dart';
part './containers/calendar_view.dart';

part './support/view_scaffold.dart';
part './support/inner_shadow.dart';

part './utils/utils.dart';

class LHDesignSystem {
  static const double scaleFactor = 1; // 2
  static const double fontScaleFactor = scaleFactor;
}
