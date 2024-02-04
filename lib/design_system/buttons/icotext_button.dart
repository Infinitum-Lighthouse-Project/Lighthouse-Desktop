part of lh.desktop.ds;

class LHIcoTextButton extends LHButton {
  final String text;
  final double fixedHeight;
  final IconData iconData;

  LHIcoTextButton({
    required this.text,
    required this.iconData,
    this.fixedHeight = 24,
    required super.callback,
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
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(
                  iconData,
                  size: LHDesignSystem.scaleFactor * 16,
                  color: const Mauve.s300(),
                ),
                const SizedBox(width: 4),
                Text(
                  text,
                  style: LHType.cardBody_1,
                ),
              ],
            ),
          ),
        );
}
