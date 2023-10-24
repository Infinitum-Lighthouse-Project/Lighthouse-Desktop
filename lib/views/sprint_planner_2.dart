part of lh.desktop.views;

class SprintPlanner2 extends StatelessWidget {
  const SprintPlanner2({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewScaffold(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          LHVerticalShelf(
            header: 'Sprint S4',
            width: 352,
            height: 768,
            children: List<LHTaskCard>.generate(
                10, (index) => LHTaskCard(task: task)),
          ),
          const SizedBox(width: 32),
          LHCalendarView(
            width: 848,
            height: 768,
          ),
        ],
      ),
    );
  }
}
