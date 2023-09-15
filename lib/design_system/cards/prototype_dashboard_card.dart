part of lh.desktop.ds;

class LHPrototypeDashboardCard extends LHCard {
  LHPrototypeDashboardCard({
    super.key,
  }) : super(
          header: "Prototype Monitor",
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
                      text: "21",
                      iconData: Icons.tag,
                      callback: () {},
                    ),
                    LHIcoTextButton(
                      text: "0",
                      iconData: Icons.error,
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
                    text: "No Issues",
                    metaColor: const Meta.lushGreen(),
                    callback: () {},
                  ),
                ],
              ),
            ],
          ),
        );
}
