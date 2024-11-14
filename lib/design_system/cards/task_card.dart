part of lh.desktop.ds;

class LHTaskCard extends LHDataCard<Task>
    with MultipleOverlays, RightClickMenu {
  late final Task task = object..linkTo(doc.reference);
  final GlobalKey assignedButtonKey = GlobalKey();
  final GlobalKey dueButtonKey = GlobalKey();
  final GlobalKey timerButtonKey = GlobalKey();

  LHTaskCard({
    required super.doc,
    super.key,
  }) : super(header: doc.data()!.title.get()) {
    addMenuEntries([
      RightClickSimpleMenuEntry(label: "Hello", callback: () {}),
      RightClickSimpleMenuEntry(label: "He1111", callback: () {}),
      RightClickNestedMenuEntry(
        label: "Yoo",
        childEntries: [
          RightClickSimpleMenuEntry(label: "Child 1", callback: () {}),
          RightClickSimpleMenuEntry(label: "Child 2", callback: () {}),
        ],
      ),
    ]);
  }

  @override
  Widget builder(context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 4),
        Expanded(
          child: Wrap(
            spacing: 8,
            runSpacing: 2,
            direction: Axis.horizontal,
            children: [
              if (task.assigned.get() != null)
                LHIcoTextButton(
                  text: task.assigned.get()!.formatAsRelative(),
                  iconData: Icons.schedule,
                  key: assignedButtonKey,
                  callback: () {
                    buildOverlayEntry(
                      assignedButtonKey,
                      builder: (_) => DateInputSelector(
                        callback: (dt) async {
                          dt.toIso8601String();
                          await task.assigned.setAndUpdate(dt);
                          removeOverlay(assignedButtonKey);
                        },
                      ),
                    );
                    showOverlay(assignedButtonKey, context);
                  },
                ),
              if (task.due.get() != null)
                LHIcoTextButton(
                  text: task.due.get()!.formatAsRelative(),
                  iconData: Icons.alarm,
                  key: dueButtonKey,
                  callback: () {
                    buildOverlayEntry(
                      dueButtonKey,
                      builder: (_) => DateInputSelector(
                        callback: (dt) async {
                          dt.toIso8601String();
                          await task.due.setAndUpdate(dt);
                          removeOverlay(dueButtonKey);
                        },
                      ),
                    );
                    showOverlay(dueButtonKey, context);
                  },
                ),
              if (task.duration.get() != null)
                LHIcoTextButton(
                  key: timerButtonKey,
                  text: task.duration.get()!.inMinutes.toString(),
                  iconData: Icons.timer,
                  callback: () {
                    showMenuFrom(timerButtonKey);
                  },
                ),
            ],
          ),
        ),
        const Spacer(),
        const SizedBox(height: 4),
        Wrap(
          spacing: 8,
          runSpacing: 4,
          direction: Axis.horizontal,
          children: [
            LHPillButton(
              text: task.status.get().name,
              metaColor: const Meta.hotPink(),
              callback: () {},
            ),
            if (task.project.get() != null)
              LHPillButton(
                text: task.project.get()!,
                metaColor: const Meta.midnightBlue(),
                callback: () {},
              ),
            // ...List<LHPillButton>.generate(task., (index) => null)
          ],
        ),
      ],
    );
  }
}
