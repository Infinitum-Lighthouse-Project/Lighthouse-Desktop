part of lh.desktop.views;

class LaunchStateNight extends StatelessWidget with DataBinding {
  final inboxShelfData = DB.tasksColl.where('status', isEqualTo: 'inbox').get();

  LaunchStateNight({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewScaffold(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          dataBoundBuilder(
            future: inboxShelfData,
            builder: (_, tasks) => LHVerticalShelf(
              header: 'Inbox',
              width: 352,
              height: 768,
              data: tasks,
              generator: (task) => LHTaskCard(task: task),
              panelButtons: [
                LHIconButton(
                  iconData: BootstrapIcons.plus_lg,
                  callback: () async {
                    final Task newTask =
                        Task(userKey: 'userKey', objectTitle: 'Untitled');
                    await showDialog(
                      context: context,
                      builder: (context) =>
                          FormDialog<Task>(schemaObject: newTask),
                    );
                    /* DB.tasksColl.add(
                      Task(userKey: 'userKey', objectTitle: 'Vamos')
                        ..description.set("Some description")
                        ..due.set(DateTime.now().add(const Duration(days: 3)))
                        ..assigned
                            .set(DateTime.now().add(const Duration(days: 3)))
                        ..load.set(0.2)
                        ..duration.set(const Duration(seconds: 2)),
                    ); */
                  },
                ),
                LHIconButton(
                  iconData: BootstrapIcons.arrow_right,
                  callback: () {},
                ),
              ],
            ),
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
