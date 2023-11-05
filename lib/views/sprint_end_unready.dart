part of lh.desktop.views;

class SprintEndUnready extends StatelessWidget {
  const SprintEndUnready({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewScaffold(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          LHVerticalShelf(
            header: 'Inbox',
            width: 352,
            height: 768,
            data: List<Task>.generate(10, (_) => task),
            generator: (task) => LHTaskCard(task: task),
          ),
          const SizedBox(width: 32),
          Column(
            children: [
              LHHorizontalShelf(
                header: 'Daily Report',
                width: 848,
                height: 160,
                children: [LHSprintCard(sprint: sprint)],
              ),
              const SizedBox(height: 32),
              LHCalendarView(
                width: 848,
                height: 576,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
