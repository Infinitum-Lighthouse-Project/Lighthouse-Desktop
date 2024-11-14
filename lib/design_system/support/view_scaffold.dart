part of lh.desktop.ds;

class ViewScaffold extends StatefulWidget {
  final Widget child;
  const ViewScaffold({
    required this.child,
    super.key,
  });

  @override
  State<StatefulWidget> createState() => ViewScaffoldState();
}

class ViewScaffoldState extends State<ViewScaffold> {
  final FocusNode focusNode = FocusNode();
  final HotboxController<void> hotboxController = HotboxController();

  @override
  Widget build(BuildContext context) {
    return Material(
      child: HotboxArea(
        controller: hotboxController,
        child: KeyboardListener(
          autofocus: true,
          focusNode: focusNode,
          onKeyEvent: (event) async {
            if (event is KeyUpEvent &&
                event.logicalKey == LogicalKeyboardKey.space) {
              hotboxController.showHotbox(
                [],
                context,
                (_, data) => Material(
                  child: LighthouseHotbox(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    hotboxData: HotboxData.none(),
                    showReleaseToClickLine: false,
                  ),
                ),
              );
            } else if (event is KeyRepeatEvent &&
                event.logicalKey == LogicalKeyboardKey.space) {
              hotboxController.showHotbox(
                [],
                context,
                (_, data) => Material(
                  child: LighthouseHotbox(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    hotboxData: HotboxData.none(),
                    showReleaseToClickLine: true,
                    onRTCReleased: (cursorPos) async {
                      GestureBinding.instance
                          .handlePointerEvent(PointerDownEvent(
                        position: cursorPos,
                      ));
                      await Future.delayed(const Duration(milliseconds: 150));
                      GestureBinding.instance.handlePointerEvent(PointerUpEvent(
                        position: cursorPos,
                      ));
                    },
                  ),
                ),
              );
            }
          },
          child: Padding(
            padding: const EdgeInsets.all(32),
            child: Center(
              child: widget.child,
            ),
          ),
        ),
      ),
    );
  }
}
