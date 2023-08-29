part of lh.desktop.ds;

class LHPillButton extends LHButton {
  final String text;
  final double fixedHeight;
  final Meta metaColor;

  LHPillButton({
    required this.text,
    required super.callback,
    required this.metaColor,
    this.fixedHeight = 16,
    super.width,
    super.key,
  }) : super(
          height: LHDesignSystem.scaleFactor * fixedHeight,
          inactiveColor: metaColor.withOpacity(0.1),
          hoverColor: metaColor.withOpacity(0.3),
          pressedColor: metaColor.withOpacity(0.5),
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(2),
              child: Text(
                text,
                style: LHType.meta_3(metaColor),
              ),
            ),
          ),
        );
}
