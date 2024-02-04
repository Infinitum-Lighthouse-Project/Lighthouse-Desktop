part of lh.desktop.ds;

class LHTextButton extends LHButton {
  final String text;
  final double fixedHeight;
  // final bool autoSizing;

  LHTextButton({
    required this.text,
    required super.callback,
    this.fixedHeight = 28,
    super.preserveState,
    super.pressedByDefault,
    super.width,
    super.key,
  }) : super(
          height: LHDesignSystem.scaleFactor * fixedHeight,
          inactiveColor: Colors.transparent,
          hoverColor: const Mauve.s700().withOpacity(0.5),
          pressedColor: const Mauve.s700(),
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(2),
              child: Text(
                text,
                style: LHType.cardBody_1,
              ),
            ),
          ),
        );
}
