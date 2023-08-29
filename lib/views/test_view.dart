part of lh.desktop.views;

class TestView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewScaffold(
      child: Center(
        child: LHTaskCard(
          task: Task(
            description: 'description',
            dependencies: [],
            status: TaskStatus(TaskStatusLabel.inbox),
            due: DateTimeRep(DateTime.now().add(Duration(days: 2))),
            assigned: DateTimeRep(DateTime.now().add(Duration(hours: 2))),
            duration: DurationRep(Duration(minutes: 50)),
            load: 0,
            contexts: [],
            epic: 'epic',
            sprint: 'sprint',
            project: 'project',
            userKey: 'userKey',
            title: 'title',
          ),
        ),
      ),
    );
  }
}
