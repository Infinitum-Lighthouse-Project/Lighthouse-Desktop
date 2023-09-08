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
          header: task.title,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 4),
              Expanded(
                child: Wrap(
                  spacing: 8,
                  runSpacing: 4,
                  direction: Axis.horizontal,
                  children: [
                    LHIcoTextButton(
                      text: task.assigned.dateTime.toString(),
                      iconData: Icons.schedule,
                      callback: () {},
                    ),
                    LHIcoTextButton(
                      text: task.due.dateTime.toString(),
                      iconData: Icons.alarm,
                      callback: () {},
                    ),
                    LHIcoTextButton(
                      text: task.duration.duration.inMinutes.toString(),
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
                    text: task.status.statusLabel.name,
                    metaColor: const Meta.hotPink(),
                    callback: () {},
                  ),
                  LHPillButton(
                    text: task.project,
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

/**
 * Stack(
            alignment: Alignment.topLeft,
            children: [
              Positioned.fill(
                top: 4,
                left: 0,
                bottom: 24,
                child: Wrap(
                  spacing: 8,
                  runSpacing: 4,
                  direction: Axis.horizontal,
                  children: [
                    LHIcoTextButton(
                      text: task.assigned.dateTime.toString(),
                      iconData: Icons.schedule,
                      callback: () {},
                    ),
                    LHIcoTextButton(
                      text: task.due.dateTime.toString(),
                      iconData: Icons.alarm,
                      callback: () {},
                    ),
                    LHIcoTextButton(
                      text: task.duration.duration.inMinutes.toString(),
                      iconData: Icons.timer,
                      callback: () {},
                    ),
                  ],
                ),
              ),
              Positioned(
                bottom: 0,
                left: 0,
                height: 20,
                child: Wrap(
                  spacing: 8,
                  runSpacing: 4,
                  direction: Axis.horizontal,
                  children: [
                    LHPillButton(
                      text: task.status.statusLabel.name,
                      metaColor: const Meta.hotPink(),
                      callback: () {},
                    ),
                    LHPillButton(
                      text: task.project,
                      metaColor: const Meta.midnightBlue(),
                      callback: () {},
                    ),
                    // ...List<LHPillButton>.generate(task., (index) => null)
                  ],
                ),
              ),
            ],
          ),
 */