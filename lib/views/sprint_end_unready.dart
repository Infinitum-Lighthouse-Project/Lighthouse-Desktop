part of lh.desktop.views;

class SprintEndUnready extends StatefulWidget {
  final DocumentSnapshot<Sprint>? dailySprint;
  final List<QueryDocumentSnapshot<Task>>? tasks;

  const SprintEndUnready({
    this.tasks,
    this.dailySprint,
    super.key,
  });

  @override
  State<StatefulWidget> createState() => SprintEndUnreadyState();
}

class SprintEndUnreadyState extends State<SprintEndUnready>
    with ViewDataBinding {
  DocumentSnapshot<Sprint>? dailySprint;
  late List<QueryDocumentSnapshot<Task>> tasks;

  @override
  void initState() {
    addField(
      (x) => dailySprint = x,
      widget.dailySprint,
      () async => (await (DB.sprintsColl
              .where(
                'end',
                isLessThanOrEqualTo: DateTime.now()
                    .add(const Duration(hours: 6))
                    .minutesSinceEpoch,
              )
              .where(
                'end',
                isGreaterThanOrEqualTo: DateTime.now()
                    .subtract(const Duration(hours: 6))
                    .minutesSinceEpoch,
              )
              .get()))
          .docs
          .first,
    );
    addField(
      (x) => tasks = x,
      widget.tasks,
      () async => (await DB.tasksColl
              .where('status', isEqualTo: TaskStatus.inbox.name)
              .get())
          .docs,
    );

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return multiBoundBuilder(
      builder: (ctx) => ViewScaffold(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            LHVerticalShelf(
              header: 'Inbox',
              width: 352,
              height: 768,
              data: tasks,
              generator: (doc) => LHTaskCard(doc: doc),
            ),
            const SizedBox(width: 32),
            Column(
              children: [
                LHHorizontalShelf(
                  header: 'Daily Report',
                  width: 848,
                  height: 160,
                  children: [
                    dailySprint != null
                        ? LHSprintCard(doc: dailySprint!)
                        : const Text(
                            'No sprint underway!',
                            style: TextStyle(color: Colors.white),
                          )
                  ],
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
      ),
    );
  }
}
