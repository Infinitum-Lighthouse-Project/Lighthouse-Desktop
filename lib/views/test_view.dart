part of lh.desktop.views;

class TestView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewScaffold(
      child: Center(
        child: LHContextInfoCard(
          header: "In Transit",
        ),
      ),
    );
  }
}
