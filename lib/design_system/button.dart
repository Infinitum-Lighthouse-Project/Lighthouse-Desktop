part of lh.desktop.ds;

abstract class Button extends StatelessWidget {
  const Button({
    super.key,
  });
}

class LHIconButton extends Button {
  final IconData iconData;
  final void Function() onPressed;

  const LHIconButton({
    required this.iconData,
    required this.onPressed,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: LHDesignSystem.scaleFactor * 28,
        height: LHDesignSystem.scaleFactor * 28,
        child: TextButton(
          onPressed: onPressed,
          style: ButtonStyle(
            overlayColor: MaterialStateColor.resolveWith(
                (states) => const Mauve.s700().withOpacity(0.7)),
            splashFactory: InkSplash.splashFactory,
            animationDuration: const Duration(seconds: 3),
          ),
          child: Icon(
            iconData,
            size: LHDesignSystem.scaleFactor * 20,
            color: const Mauve.s300(),
          ),
        ),
      ),
    );
  }
}
