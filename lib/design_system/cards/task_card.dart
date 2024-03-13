part of lh.desktop.ds;

class LHTaskCard extends LHDataCard<Task> {
  LHTaskCard({
    required super.doc,
    super.key,
  }) : super(header: doc.data()!.title.get());

  Task get task => object;

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
                  callback: () {},
                ),
              if (task.due.get() != null)
                LHIcoTextButton(
                  text: task.due.get()!.formatAsRelative(),
                  iconData: Icons.alarm,
                  callback: () {},
                ),
              if (task.duration.get() != null)
                LHIcoTextButton(
                  text: task.duration.get()!.inMinutes.toString(),
                  iconData: Icons.timer,
                  callback: () {},
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
