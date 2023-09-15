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
        child: Column(
          children: [
            const SizedBox(height: 40),
            LHTaskCard(task: task),
            const SizedBox(height: 40),
            LHContextInfoCard(
              header: 'In Transit',
              context: Context(
                location: '44 Bars Street',
                energy: 0.8,
                duration: const Duration(minutes: 20),
                resources: [],
              ),
            ),
            const SizedBox(height: 40),
            LHEventCard(
              event: Event(
                description: "This is a description of the event",
                task: task.objectId,
                start: DateTimeRep(DateTime.now()),
                duration: const DurationRep(Duration(minutes: 20)),
                userKey: 'userKey',
                title: 'Event Title',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
