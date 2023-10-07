part of lh.desktop.views;

class TestView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Task task = Task(
      description: 'description',
      dependencies: [],
      status: TaskStatus.inbox,
      due: DateTimeRep(DateTime.now().add(Duration(days: 2))),
      assigned: DateTimeRep(DateTime.now().add(Duration(hours: 2))),
      duration: DurationRep(Duration(minutes: 50)),
      load: 0,
      contexts: [],
      epic: 'epic',
      sprint: 'sprint',
      project: 'project',
      userKey: 'userKey',
      title: 'Card Title',
    );

    return ViewScaffold(
      child: Center(
        child: Container(
          width: 1200,
          height: 800,
          child: Row(children: [
            LHVerticalShelf(
              header: 'Shelf Title',
              width: 352,
              height: 592,
              panelButtons: [
                LHIconButton(iconData: Icons.arrow_downward, callback: () {}),
              ],
              children:
                  List<LHTaskCard>.generate(10, (_) => LHTaskCard(task: task)),
            ),
            const SizedBox(width: 40),
            LHHorizontalShelf(
              header: 'Shelf Title',
              width: 800,
              height: 176, // 120 + 8 + 8 + 40
              panelButtons: [
                LHIconButton(iconData: Icons.add, callback: () {}),
              ],
              children:
                  List<LHTaskCard>.generate(10, (_) => LHTaskCard(task: task)),
            ),
          ]),
        ),
      ),
    );
  }
}
