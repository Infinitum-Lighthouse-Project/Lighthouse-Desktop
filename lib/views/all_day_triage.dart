part of lh.desktop.views;

class AllDayTriage extends StatefulWidget {
  final List<QueryDocumentSnapshot<Task>>? tasks;

  const AllDayTriage({
    this.tasks,
    super.key,
  });

  @override
  State<StatefulWidget> createState() => AllDayTriageState();
}

class AllDayTriageState extends State<AllDayTriage> with ViewDataBinding {
  late final List<QueryDocumentSnapshot<Task>> tasks;

  @override
  void initState() {
    addField((x) => tasks = x, widget.tasks,
        () async => const <QueryDocumentSnapshot<Task>>[]);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return multiBoundBuilder(builder: (ctx) {
      return ViewScaffold(
        child: Row(
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
                  children: const [
                    LHTimerCard(),
                    LHTimeTrackedCard(),
                    LHRecommendationsCard()
                  ],
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
      );
    });
  }
}
