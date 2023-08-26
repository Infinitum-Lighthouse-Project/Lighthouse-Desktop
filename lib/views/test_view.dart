part of lh.desktop.views;

class TestView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewScaffold(
      child: Center(
        child: LHContextInfoCard(
          header: "In Transit",
          context: Context(
            location: "44 Bars Street",
            energy: 0.5,
            duration: const Duration(minutes: 40),
            resources: [],
          ),
        ),
      ),
    );
  }
}
