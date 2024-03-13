part of lh.desktop.views;

class LaunchStateNight extends StatefulWidget {
  final List<DocumentSnapshot<Task>>? inboxShelfData;

  const LaunchStateNight({
    this.inboxShelfData,
    super.key,
  });
  @override
  State<StatefulWidget> createState() => LaunchStateNightState();
}

class LaunchStateNightState extends State<LaunchStateNight>
    with ViewDataBinding {
  late final List<DocumentSnapshot<Task>> inboxShelfData;

  @override
  void initState() {
    addField((x) => inboxShelfData = x, widget.inboxShelfData, () async {
      final res = (await DB.tasksColl.where('status', isEqualTo: 'inbox').get())
          .docs
          .map<DocumentSnapshot<Task>>((e) => e as DocumentSnapshot<Task>)
          .toList();
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
                    await showDialog(
                      context: ctx,
                      builder: (c) {
                        return FormDialog<Task>(
                          schemaObject: newTask,
                          resultHandler: () async {
                            final DocumentSnapshot<Task> taskDoc =
                                await (await DB.tasksColl.add(newTask)).get();
                            inboxShelfData.add(taskDoc);
                            if (mounted) {
                              Navigator.pop(c);
                            }
                          },
                        );
                      },
                    );
                    setState(() {});
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
