part of lh.desktop.ds;

class LHIconButton extends LHButton {
  final IconData iconData;

  LHIconButton({
    required this.iconData,
    required super.callback,
    super.pressedByDefault,
    super.preserveState,
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
