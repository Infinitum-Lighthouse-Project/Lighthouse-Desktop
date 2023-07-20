part of lh.desktop.views;

class TestView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewScaffold(
      child: LHTextButton(
        callback: () {},
        text: 'Icon Check',
        fixedWidth: null,
      ),
    );
  }
}
