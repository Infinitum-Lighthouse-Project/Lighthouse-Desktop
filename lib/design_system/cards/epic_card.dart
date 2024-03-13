part of lh.desktop.ds;

class LHEpicCard extends LHDataCard<Epic> {
  LHEpicCard({
    required super.doc,
    super.key,
  }) : super(header: doc.data()!.title.get());

  Epic get epic => object;

  @override
  Widget builder(context) => Column(
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
              if (epic.project.get() != null)
                LHPillButton(
                  text: epic.project.get()!,
                  metaColor: const Meta.midnightBlue(),
                  callback: () {},
                ),
            ],
          ),
        ],
      );
}
