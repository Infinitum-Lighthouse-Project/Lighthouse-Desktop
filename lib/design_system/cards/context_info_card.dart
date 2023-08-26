part of lh.desktop.ds;

class LHContextInfoCard extends LHCard {
  final Context context;

  LHContextInfoCard({
    required super.header,
    required this.context,
    super.key,
  }) : super(
          child: Align(
            alignment: Alignment.topLeft,
            child: Wrap(
              spacing: 8,
              runSpacing: 4,
              direction: Axis.horizontal,
              children: [
                LHIcoTextButton(
                  text: '${context.energy}',
                  iconData: Icons.bolt,
                  callback: () {},
                ),
                LHIcoTextButton(
                  text: '${context.energy}',
                  iconData: Icons.bolt,
                  callback: () {},
                ),
                LHIcoTextButton(
                  text: '${context.energy}',
                  iconData: Icons.bolt,
                  callback: () {},
                ),
              ],
            ),
          ),
        );
}

/**
 * 
              LHIcoTextButton(
                text: '${context.duration.inMinutes}',
                iconData: Icons.timer,
                callback: () {},
              ),
              LHIcoTextButton(
                text: 'Resources',
                iconData: Icons.keyboard_arrow_down,
                callback: () {},
              ),
              LHIcoTextButton(
                text: context.location,
                iconData: Icons.location_on,
                callback: () {},
              ),
 */