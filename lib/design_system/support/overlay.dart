part of lh.desktop.ds;

mixin Overlays {
  WidgetBuilder? overlay;
  final GlobalKey targetKey = GlobalKey();
  BuildContext? menuContext;

  void buildOverlayEntry({
    required Widget Function(BuildContext) builder,
  }) {
    final Offset buttonPos =
        (targetKey.currentContext!.findRenderObject() as RenderBox)
            .localToGlobal(Offset.zero);
    overlay = (ctx) {
      menuContext = ctx;
      return Padding(
        padding: EdgeInsets.only(
          left: buttonPos.dx,
          top: buttonPos.dy,
        ),
        child: builder(ctx),
      );
    };
  }

  void removeOverlay() {
    if (menuContext != null) Navigator.of(menuContext!).pop();
    overlay = null;
  }

  void showOverlay(BuildContext context) {
    showDialog(
      context: context,
      builder: overlay!,
      barrierColor: Colors.black.withOpacity(0.4),
    );
  }
}

mixin MultipleOverlays {
  final Map<GlobalKey, WidgetBuilder> builders = {};
  BuildContext? overlayContext;

  void buildOverlayEntry(
    GlobalKey targetKey, {
    required WidgetBuilder builder,
  }) {
    final Offset buttonPos =
        (targetKey.currentContext!.findRenderObject() as RenderBox)
            .localToGlobal(Offset.zero);
    builders[targetKey] = (ctx) {
      overlayContext = ctx;
      return Padding(
        padding: EdgeInsets.only(
          left: buttonPos.dx,
          top: buttonPos.dy,
        ),
        child: builder(ctx),
      );
    };
  }

  void removeOverlay(GlobalKey targetKey) {
    if (overlayContext != null) Navigator.of(overlayContext!).pop();
    overlayContext = null;
  }

  void showOverlay(GlobalKey targetKey, BuildContext context) {
    showDialog(
      context: context,
      builder: builders[targetKey]!,
      barrierColor: Colors.black.withOpacity(0.4),
    );
  }
}
