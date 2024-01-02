part of lh.desktop.ds;

class LHSprintCard extends LHCard {
  final Sprint sprint;

  LHSprintCard({
    required this.sprint,
    super.key,
  }) : super(
          header: sprint.title.get(),
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
                      // Need to fetch the respective [Task]s from the DB
                      text: sprint.tasks.get().length.toString(),
                      iconData: Icons.clear_all,
                      callback: () {},
                    ),
                    if (sprint.end.get() != null)
                      LHIcoTextButton(
                        text:
                            "${sprint.end.get()!.difference(DateTime.now()).inDays} days left",
                        iconData: Icons.timer,
                        callback: () {},
                      ),
                    LHIcoTextButton(
                      text: "None",
                      iconData: Icons.balance,
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
                    text: sprint.status.get().name,
                    metaColor: const Meta.lushGreen(),
                    callback: () {},
                  ),
                ],
              ),
            ],
          ),
        );
}
