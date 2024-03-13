part of lh.desktop.views;

class LaunchStateNight extends StatefulWidget {
  final List<QueryDocumentSnapshot<Task>>? inboxShelfData;

  const LaunchStateNight({
    this.inboxShelfData,
    super.key,
  });
  @override
  State<StatefulWidget> createState() => LaunchStateNightState();
}

class LaunchStateNightState extends State<LaunchStateNight>
    with ViewDataBinding {
  late final List<QueryDocumentSnapshot<Task>> inboxShelfData;

  @override
  void initState() {
    addField((x) => inboxShelfData = x, widget.inboxShelfData, () async {
      final res =
          (await DB.tasksColl.where('status', isEqualTo: 'inbox').get()).docs;
      return res;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ViewScaffold(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          multiBoundBuilder(
            builder: (ctx) => LHVerticalShelf(
              header: 'Inbox',
              width: 352,
              height: 768,
              data: inboxShelfData,
              generator: (doc) => LHTaskCard(doc: doc),
              panelButtons: [
                LHIconButton(
                  iconData: BootstrapIcons.plus_lg,
                  callback: () async {
                    final Task newTask = Task(userKey: 'userKey')
                      ..dependencies.options.addAll(['A', 'B', 'C']);
                    BuildContext dlgContext;
                    await showDialog(
                      context: ctx,
                      builder: (ctx) {
                        dlgContext = ctx;
                        return FormDialog<Task>(
                          schemaObject: newTask,
                          resultHandler: (SchemaObject o) async {
                            final taskDoc = await DB.tasksColl.add(o as Task);
                            if (mounted) {
                              Navigator.pop(dlgContext);
                            }
                          },
                        );
                      },
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
                children: [], // [LHSprintCard(doc: Documen)],
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
