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
                  callback: () {
                    DB.tasksColl.add(
                      Task(
                        description: "Some description",
                        dependencies: [],
                        status: TaskStatus.inbox,
                        due: DateTime.now().add(const Duration(days: 3)),
                        assigned: DateTime.now().add(const Duration(days: 3)),
                        duration: const Duration(seconds: 2),
                        load: 0.3,
                        contexts: [],
                        epic: 'epic',
                        sprint: 'sprint',
                        project: 'project',
                        userKey: 'userKey',
                        title: 'Vamooos',
                      ),
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
