part of lh.desktop.ds;

class SingleSelectMenu extends StatelessWidget {
  final List<LHButton> buttons;

  const SingleSelectMenu({
    required this.buttons,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topLeft,
      child: Container(
        decoration: BoxDecoration(
          color: const Mauve.s900(),
          borderRadius: BorderRadius.circular(5),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Wrap(
            direction: Axis.vertical,
            spacing: 8,
            children: buttons,
          ),
        ),
      ),
    );
  }
}
