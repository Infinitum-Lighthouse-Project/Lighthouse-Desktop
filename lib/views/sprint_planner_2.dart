part of lh.desktop.views;

class SprintPlanner2 extends StatelessWidget {
  final List<DocumentSnapshot<Task>> tasks;
  const SprintPlanner2({
    required this.tasks,
    super.key,
  });

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
            data: tasks,
            generator: (doc) => LHTaskCard(doc: doc),
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
