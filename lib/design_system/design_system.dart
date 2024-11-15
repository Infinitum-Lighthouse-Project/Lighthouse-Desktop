library lh.desktop.ds;

import 'dart:ui';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:hotbox/hotbox.dart';
import 'package:lighthouse_core/db/db.dart';
import 'package:lighthouse_core/engines/engines.dart';
import 'package:lighthouse_core/utils/utils.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

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

part './input/form_dialog.dart';
part './input/component_provider.dart';
part './input/input_field.dart';
part './input/text_input.dart';
part './input/dropdown_input.dart';
part './input/date_input.dart';

part './menus/single_select_menu.dart';
part './menus/multi_select_menu.dart';
part './menus/right_click_menu.dart';

part './support/view_scaffold.dart';
part './support/lighthouse_hotbox.dart';
part './support/inner_shadow.dart';
part './support/overlay.dart';

part './utils/utils.dart';

class LHDesignSystem {
  static const double scaleFactor = 1; // 2
  static const double fontScaleFactor = scaleFactor;
}
