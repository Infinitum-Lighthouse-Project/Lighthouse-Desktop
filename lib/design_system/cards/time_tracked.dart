part of lh.desktop.ds;

/// Havent really figured out the schema for this object yet
class LHTimeTrackedCard extends LHCard {
  LHTimeTrackedCard({
    super.key,
  }) : super(
          header: "Time Tracked",
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
                      text: "514 minutes",
                      iconData: Icons.timer,
                      callback: () {},
                    ),
                    LHIcoTextButton(
                      text: "87%",
                      iconData: Icons.event_available,
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
                    text: "▼ 6% from yesterday",
                    metaColor: const Meta.mangoOrange(),
                    callback: () {},
                  ),
                ],
              ),
            ],
          ),
        );
}
