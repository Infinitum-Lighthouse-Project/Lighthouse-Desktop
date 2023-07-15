part of lh.desktop.ds;

class LHButton extends StatefulWidget {
  final double width;
  final double height;
  final Color inactiveColor;
  final Color hoverColor;
  final Color pressedColor;
  final Widget child;
  final void Function() callback;

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
    return Center(
      child: SizedBox(
        width: widget.width,
        height: widget.height,
        child: MouseRegion(
          onEnter: (_) {
            setState(() {
              currentColor = widget.hoverColor;
            });
          },
          onExit: (_) {
            setState(() {
              currentColor = widget.inactiveColor;
            });
          },
          child: GestureDetector(
            onTapDown: (_) {
              setState(() {
                currentColor = widget.pressedColor;
              });
            },
            onTapUp: (_) {
              setState(() {
                currentColor = widget.hoverColor;
              });
              widget.callback();
            },
            child: Center(
              child: AnimatedContainer(
                width: widget.width,
                height: widget.height,
                duration: const Duration(milliseconds: 200),
                curve: Curves.easeOutQuad,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(2),
                  color: currentColor,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(4),
                  child: widget.child,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class LHIconButton extends LHButton {
  final IconData iconData;

  LHIconButton({
    required this.iconData,
    required super.callback,
    super.key,
  }) : super(
          width: LHDesignSystem.scaleFactor * 28,
          height: LHDesignSystem.scaleFactor * 28,
          inactiveColor: Colors.transparent,
          hoverColor: const Mauve.s700().withOpacity(0.5),
          pressedColor: const Mauve.s700(),
          child: Center(
            child: Icon(
              iconData,
              size: LHDesignSystem.scaleFactor * 20,
              color: const Mauve.s300(),
            ),
          ),
        );
}

class LHTextButton extends LHButton {
  final String text;
  final double fixedWidth;
  final double fixedHeight;
  // final bool autoSizing;

  LHTextButton({
    required this.text,
    required super.callback,
    required this.fixedHeight,
    required this.fixedWidth,
    super.key,
  }) : super(
          width: LHDesignSystem.scaleFactor * fixedWidth,
          height: LHDesignSystem.scaleFactor * fixedHeight,
          inactiveColor: Colors.transparent,
          hoverColor: const Mauve.s700().withOpacity(0.5),
          pressedColor: const Mauve.s700(),
          child: Center(
            child: Text(
              text,
              style: const TextStyle(
                color: Mauve.s300(),
                fontSize: 16,
              ),
            ),
          ),
        );
}

/**
 * Center(
            child: Container(
              width: LHDesignSystem.scaleFactor * 28,
              height: LHDesignSystem.scaleFactor * 28,
              child: TextButton(
                onPressed: widget.onPressed,
                style: ButtonStyle(
                  overlayColor: MaterialStateColor.resolveWith(
                    (states) => const Mauve.s700().withOpacity(0.5),
                  ),
                  splashFactory: InkSplash.splashFactory,
                  animationDuration: const Duration(seconds: 3),
                ),
                child: Icon(
                  widget.iconData,
                  size: LHDesignSystem.scaleFactor * 20,
                  color: const Mauve.s300(),
                ),
              ),
            ),
          ),
 */