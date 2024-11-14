part of lh.desktop.views;

class TestView extends StatelessWidget {
  final Task newTask = Task(userKey: 'userKey')
    ..dependencies.options.addAll(['A', 'B', 'C']);
  @override
  Widget build(BuildContext context) {
    return ViewScaffold(
      child: FormDialog<Task>(
        schemaObject: newTask,
        resultHandler: () {
          DB.tasksColl.add(newTask);
        },
      ),
    );
  }
}
