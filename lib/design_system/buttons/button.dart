part of lh.desktop.ds;

class LHButton extends StatefulWidget {
  final double? width;
  final double height;
  final Color inactiveColor;
  final Color hoverColor;
  final Color pressedColor;
  final Widget child;
  final void Function()? callback;

  const LHButton({
    required this.width,
    required this.height,
    required this.inactiveColor,
    required this.hoverColor,
    required this.child,
    required this.pressedColor,
    required this.callback,
    super.key,
  });

  @override
  State<StatefulWidget> createState() => LHButtonState();
}

class LHButtonState extends State<LHButton> {
  late Color currentColor = widget.inactiveColor;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        AnimatedContainer(
          width: widget.width,
          height: widget.height,
          duration: const Duration(milliseconds: 200),
          curve: Curves.easeOutQuad,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(2),
            color: currentColor,
          ),
          child: GestureDetector(
            onTapDown: (_) {
              if (widget.callback != null) {
                setState(() {
                  currentColor = widget.pressedColor;
                });
              }
            },
            onTapUp: (_) {
              if (widget.callback != null) {
                setState(() {
                  currentColor = widget.hoverColor;
                });
                widget.callback?.call();
              }
            },
            child: MouseRegion(
              cursor: widget.callback != null
                  ? SystemMouseCursors.click
                  : MouseCursor.defer,
              onEnter: (_) {
                if (widget.callback != null) {
                  setState(() {
                    currentColor = widget.hoverColor;
                  });
                }
              },
              onExit: (_) {
                if (widget.callback != null) {
                  setState(() {
                    currentColor = widget.inactiveColor;
                  });
                }
              },
              child: Padding(
                padding: const EdgeInsets.all(4),
                child: widget.child,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
