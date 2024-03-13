part of lh.desktop.views;

class SprintEndReady extends StatefulWidget {
  final List<QueryDocumentSnapshot<Task>>? tasks;

  const SprintEndReady({
    this.tasks,
    super.key,
  });

  @override
  State<StatefulWidget> createState() => SprintEndReadyState();
}

class SprintEndReadyState extends State<SprintEndReady> with ViewDataBinding {
  late final List<QueryDocumentSnapshot<Task>> tasks;

  @override
  void initState() {
    addField(
        (x) => tasks = x,
        widget.tasks,
        () async =>
            (await DB.tasksColl.where('status', isEqualTo: 'inbox').get())
                .docs);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ViewScaffold(
      child: multiBoundBuilder(
        builder: (ctx) {
          return Row(
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
          );
        },
      ),
    );
  }
}
