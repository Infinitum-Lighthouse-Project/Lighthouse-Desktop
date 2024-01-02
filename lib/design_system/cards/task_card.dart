part of lh.desktop.ds;

class LHTaskCard extends LHCard {
  final Task task;
  /**
   * description
   * status, project, meta tags
   * assigned, due, duration
   * epic, sprint
   */

  LHTaskCard({
    required this.task,
    super.key,
  }) : super(
          header: task.title.get(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 4),
              Expanded(
                child: Wrap(
                  spacing: 8,
                  runSpacing: 2,
                  direction: Axis.horizontal,
                  children: [
                    LHIcoTextButton(
                      text: task.assigned.toString(),
                      iconData: Icons.schedule,
                      callback: () {},
                    ),
                    LHIcoTextButton(
                      text: task.due.toString(),
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
          ),
        );
}
