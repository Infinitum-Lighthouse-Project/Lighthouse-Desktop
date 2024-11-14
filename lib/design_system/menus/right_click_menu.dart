part of lh.desktop.ds;

mixin RightClickMenu {
  final List<RightClickMenuEntry> _menuEntries = [];

  void addMenuEntries(List<RightClickMenuEntry> entries) =>
      _menuEntries.addAll(entries);

  Widget buildMenu() {
    return Center(
      child: Container(
        width: 140,
        height: _menuEntries.length * 32 + 6,
        child: Padding(
          padding: const EdgeInsets.only(
            left: 10,
            right: 10,
          ),
          child: Column(
            children: [
              for (final e in _menuEntries) ...[e, const SizedBox(height: 2)]
            ],
          ),
        ),
      ),
    );
  }

  Offset computeDistanceFrom(GlobalKey triggerKey) =>
      (triggerKey.currentContext!.findRenderObject() as RenderBox)
          .localToGlobal(Offset.zero);

  void showMenuFrom(GlobalKey triggerKey) {
    final Offset pos = computeDistanceFrom(triggerKey);
    showDialog(
      context: triggerKey.currentContext!,
      builder: (_) => Padding(
        padding: EdgeInsets.only(
          left: pos.dx,
          top: pos.dy,
        ),
        child: buildMenu(),
      ),
      barrierColor: Colors.black.withOpacity(0.1),
    );
  }

  void hideMenu(BuildContext context) => Navigator.of(context).pop();
}

abstract class RightClickMenuEntry extends Widget {
  final String label;

  const RightClickMenuEntry({required this.label, super.key});
}

class RightClickNestedMenuEntry extends StatefulWidget
    implements RightClickMenuEntry {
  final List<RightClickMenuEntry> childEntries;

  @override
  final String label;

  const RightClickNestedMenuEntry({
    required this.label,
    required this.childEntries,
    super.key,
  });

  @override
  State<StatefulWidget> createState() => RightClickNestedMenuEntryState();
}

class RightClickNestedMenuEntryState extends State<RightClickNestedMenuEntry>
    with RightClickMenu {
  final GlobalKey childKey = GlobalKey();
  bool menuIsBeingShown = false;
  int layerCounter = 0;
  final List<Widget> stackItems = [];

  @override
  void initState() {
    addMenuEntries(widget.childEntries);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 200,
      height: 400,
      child: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            width: 100,
            height: 30,
            child: SizedBox(
              height: 30,
              width: 100,
              child: MouseRegion(
                cursor: SystemMouseCursors.click,
                key: childKey,
                onEnter: (_) {
                  if (menuIsBeingShown) return;
                  menuIsBeingShown = true;
                  print('showing menu...');
                  layerCounter += 1;
                  final offset = computeDistanceFrom(childKey);
                  stackItems.add(Positioned(
                    left: 40,
                    top: 0,
                    child: buildMenu(),
                  ));
                  setState(() {});
                },
                onExit: (_) {
                  /* if (layerCounter == 0) {
              menuIsBeingShown = false;
              hideMenu(context);
            } */
                },
                child: Container(
                  width: 100,
                  height: 30,
                  color: Colors.green,
                  child: Row(
                    children: [
                      Text(widget.label),
                      const Spacer(),
                      const Icon(Icons.arrow_right),
                    ],
                  ),
                ),
              ),
            ),
          ),
          ...stackItems,
        ],
      ),
    );
  }
}

class RightClickSimpleMenuEntry extends StatelessWidget
    with RightClickMenu
    implements RightClickMenuEntry {
  @override
  final String label;
  final VoidCallback? callback;

  RightClickSimpleMenuEntry({
    required this.label,
    required this.callback,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        callback?.call();
        hideMenu(context);
      },
      child: Container(
        width: 100,
        height: 30,
        color: Colors.green,
        child: Row(
          children: [
            Text(label),
          ],
        ),
      ),
    );
  }
}
