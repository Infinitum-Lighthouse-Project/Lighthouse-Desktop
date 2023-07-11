part of lh.desktop.views;

class TestView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: LHIconButton(
        iconData: Icons.abc,
        onPressed: () {},
      ),
    );
  }
}
