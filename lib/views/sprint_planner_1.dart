part of lh.desktop.views;

class SprintPlanner1 extends StatelessWidget {
  const SprintPlanner1({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewScaffold(
        child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        LHVerticalShelf(
          header: 'Triaged',
          width: 352,
          height: 768,
          data: List<Sprint>.generate(10, (_) => sprint),
          generator: (sprint) => LHSprintCard(sprint: sprint),
        ),
        const SizedBox(width: 32),
        LHVerticalShelf(
          header: 'Sprint S3',
          width: 352,
          height: 768,
          data: List<Sprint>.generate(10, (_) => sprint),
          generator: (sprint) => LHSprintCard(sprint: sprint),
        ),
        const SizedBox(width: 32),
        LHVerticalShelf(
          header: 'Sprint S4',
          width: 352,
          height: 768,
          data: List<Sprint>.generate(10, (_) => sprint),
          generator: (sprint) => LHSprintCard(sprint: sprint),
        ),
      ],
    ));
  }
}
