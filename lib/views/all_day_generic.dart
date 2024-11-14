part of lh.desktop.views;

class AllDayGeneric extends StatefulWidget {
  final List<QueryDocumentSnapshot<Task>>? tasks;
  const AllDayGeneric({
    this.tasks,
    super.key,
  });

  @override
  State<StatefulWidget> createState() => AllDayGenericState();
}

class AllDayGenericState extends State<AllDayGeneric> with ViewDataBinding {
  late final List<QueryDocumentSnapshot<Task>> tasks;

  @override
  void initState() {
    addField((x) => tasks = x, widget.tasks,
        () async => <QueryDocumentSnapshot<Task>>[]);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ViewScaffold(
      child: multiBoundBuilder(
        builder: (ctx) => Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            LHVerticalShelf(
              header: 'Scheduled',
              width: 352,
              height: 768,
              data: tasks,
              generator: (doc) => LHTaskCard(doc: doc),
            ),
            const SizedBox(width: 32),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                LHHorizontalShelf(
                  header: 'Time Tracker',
                  width: 848,
                  height: 160,
                  children: const [LHTimerCard(), LHTimeTrackedCard()],
                ),
                const SizedBox(height: 32),
                LHCalendarView(
                  width: 352,
                  height: 576,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
