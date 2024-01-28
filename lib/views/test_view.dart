part of lh.desktop.views;

class TestView extends StatelessWidget {
  final Task newTask = Task(userKey: 'userKey', objectTitle: 'Untitled')
    ..dependencies.options.addAll(['A', 'B', 'C']);
  @override
  Widget build(BuildContext context) {
    /// https://stackoverflow.com/questions/69410762/flutter-visitchildelements-called-during-build
    return ViewScaffold(
      child: FormDialog<Task>(schemaObject: newTask),
    );
  }
}

class LighthouseHotbox<T> extends Hotbox<T> {
  const LighthouseHotbox({
    required super.hotboxData,
    required super.width,
    required super.height,
    required super.style,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: width,
        height: height,
        color: style.backgroundColor,
        child: Padding(
            padding: const EdgeInsets.all(10),
            child: Center(
              child: Text(hotboxData.indexableContent.length.toString()),
            )),
      ),
    );
  }
}
