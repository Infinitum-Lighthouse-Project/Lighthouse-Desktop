part of lh.desktop.ds;

class LHEpicCard extends LHCard {
  final Epic epic;

  LHEpicCard({
    required this.epic,
    super.key,
  }) : super(
          header: epic.title.get(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 4),
              const Expanded(
                child: Wrap(
                  spacing: 8,
                  runSpacing: 2,
                  direction: Axis.horizontal,
                  children: [],
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
                    text: epic.project.get(),
                    metaColor: const Meta.midnightBlue(),
                    callback: () {},
                  ),
                ],
              ),
            ],
          ),
        );
}
