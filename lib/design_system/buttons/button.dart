part of lh.desktop.ds;

class LHButton extends StatefulWidget {
  final double? width;
  final double height;
  final Color inactiveColor;
  final Color hoverColor;
  final Color pressedColor;
  final Widget child;
  final bool preserveState;
  final bool pressedByDefault;
  final void Function()? callback;

  const LHButton({
    required this.width,
    required this.height,
    required this.inactiveColor,
    required this.hoverColor,
    required this.child,
    required this.pressedColor,
    required this.callback,
    this.pressedByDefault = false,
    this.preserveState = false,
    super.key,
  });

  @override
  State<StatefulWidget> createState() => LHButtonState();
}

class LHButtonState extends State<LHButton> {
  late Color currentColor =
      widget.pressedByDefault ? widget.pressedColor : widget.inactiveColor;
  late bool pressed = widget.pressedByDefault;

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
                  if (widget.preserveState) {
                    pressed = !pressed;
                    currentColor =
                        pressed ? widget.pressedColor : widget.hoverColor;
                  } else {
                    currentColor = widget.hoverColor;
                  }
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
                    if (widget.preserveState) {
                      currentColor =
                          pressed ? widget.pressedColor : widget.inactiveColor;
                    } else {
                      currentColor = widget.inactiveColor;
                    }
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
