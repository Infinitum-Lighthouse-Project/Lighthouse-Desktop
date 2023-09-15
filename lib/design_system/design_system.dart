library lh.desktop.ds;

import 'package:flutter/material.dart';
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
part './cards/event_card.dart';

part './support/view_scaffold.dart';

class LHDesignSystem {
  static const double scaleFactor = 1; // 2
  static const double fontScaleFactor = scaleFactor;
}
