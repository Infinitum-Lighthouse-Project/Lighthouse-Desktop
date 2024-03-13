part of lh.desktop.ds;

class LHEventCard extends LHDataCard<Event> {
  LHEventCard({
    required super.doc,
    super.key,
  }) : super(header: doc.data()!.title.get());
  Event get event => object;
  @override
  Widget builder(context) => Column(
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
                  text: event.start.toString(),
                  iconData: Icons.event,
                  callback: () {},
                ),
                // fix the following code after the repeatRule property is
                // properly defined
                /* if (event.repeatRule.)
                      LHIcoTextButton(
                        text: event.repeatRule.get().toString(),
                        iconData: Icons.alarm,
                        callback: () {},
                      ), */
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
                text: 'Work',
                metaColor: const Meta.lightBlue(),
                callback: () {},
              ),

              // ...List<LHPillButton>.generate(task., (index) => null)
            ],
          ),
        ],
      );
}
