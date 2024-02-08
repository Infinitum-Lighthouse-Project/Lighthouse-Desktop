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
            builder: (dbbContext, tasks) => LHVerticalShelf(
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
                        Task(userKey: 'userKey', objectTitle: 'Untitled')
                          ..dependencies.options.addAll(['A', 'B', 'C']);
                    BuildContext dlgContext;
                    await showDialog(
                      context: dbbContext,
                      builder: (ctx) {
                        dlgContext = ctx;
                        return FormDialog<Task>(
                          schemaObject: newTask,
                          resultHandler: (SchemaObject o) async {
                            final taskDoc = await DB.tasksColl.add(o as Task);
                            Navigator.pop(dlgContext);
                          },
                        );
                      },
                    );
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
