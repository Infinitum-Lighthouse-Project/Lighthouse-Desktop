part of lh.desktop.views;

class TestView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Task task = Task(
      description: 'description',
      dependencies: [],
      status: TaskStatus.inbox,
      due: DateTime.now().add(Duration(days: 2)),
      assigned: DateTime.now().add(Duration(hours: 2)),
      duration: Duration(minutes: 50),
      load: 0,
      contexts: [],
      epic: 'epic',
      sprint: 'sprint',
      project: 'project',
      userKey: 'userKey',
      title: 'Card Title',
    );

    /// https://stackoverflow.com/questions/69410762/flutter-visitchildelements-called-during-build
    return ViewScaffold(
      child: HotboxArea<Task>(
        hotbox: (data) => LighthouseHotbox<Task>(
          hotboxData: HotboxData(
            indexableContent: data,
            rightSector: Container(),
            lowerSector: Container(),
            leftSector: Container(),
          ),
          width: 800,
          height: 800,
          style: const HotboxStyle(
            backgroundColor: Colors.deepPurpleAccent,
            pieColor: Colors.amber,
          ),
        ),
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
                data: List<Task>.generate(10, (_) => task),
                generator: (task) => LHTaskCard(task: task),
              ),
              const SizedBox(width: 40),
              LHHorizontalShelf(
                header: 'Shelf Title',
                width: 800,
                height: 176, // 120 + 8 + 8 + 40
                panelButtons: [
                  LHIconButton(iconData: Icons.add, callback: () {}),
                ],
                children: List<LHTaskCard>.generate(
                    10, (_) => LHTaskCard(task: task)),
              ),
            ]),
          ),
        ),
      ),
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
