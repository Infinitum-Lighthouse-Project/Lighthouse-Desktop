part of lh.desktop.views;

class TestView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const ViewScaffold(
      child: Center(
        child: LHCard(
          header: "In Transit",
        ),
      ),
    );
  }
}
