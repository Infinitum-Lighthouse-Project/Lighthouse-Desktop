part of lh.desktop.views;

class TestView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewScaffold(
      child: LHIconButton(
        iconData: Icons.abc,
        callback: () {},
      ),
    );
  }
}
