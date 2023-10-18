part of lh.desktop.views;

class SprintEndReady extends StatelessWidget {
  const SprintEndReady({super.key});

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
            children: List<LHSprintCard>.generate(
                10, (index) => LHSprintCard(sprint: sprint)),
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
