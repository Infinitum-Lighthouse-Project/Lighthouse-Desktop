part of lh.desktop.ds;

class LHTimerCard extends LHCard {
  const LHTimerCard({
    super.key,
  }) : super(header: "01 : 30 : 04");

  @override
  Widget builder(BuildContext context) => Column(
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
                  text: "Pause",
                  iconData: Icons.pause_circle,
                  callback: () {},
                ),
                LHIcoTextButton(
                  text: "End",
                  iconData: Icons.stop_circle,
                  callback: () {},
                ),
                LHIcoTextButton(
                  text: "Clear",
                  iconData: Icons.cancel,
                  callback: () {},
                ),
                LHIcoTextButton(
                  text: "Start Break",
                  iconData: Icons.add_box,
                  callback: () {},
                ),
                LHIcoTextButton(
                  text: "Task Name",
                  iconData: Icons.expand_more,
                  callback: () {},
                ),
              ],
            ),
          ),
          const Spacer(),
        ],
      );
}
