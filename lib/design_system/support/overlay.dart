part of lh.desktop.ds;

mixin Overlays {
  Widget Function(BuildContext)? overlay;
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
    Navigator.of(menuContext!).pop();
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
