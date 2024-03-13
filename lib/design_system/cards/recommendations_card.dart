part of lh.desktop.ds;

/// Havent really figured out the schema for this object yet
class LHRecommendationsCard extends LHCard {
  const LHRecommendationsCard({
    super.key,
  }) : super(header: "Recommendations");

  @override
  Widget builder(context) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 4),
          const Spacer(),
          const SizedBox(height: 4),
          Wrap(
            spacing: 8,
            runSpacing: 4,
            direction: Axis.horizontal,
            children: [
              LHPillButton(
                text: "Attention Needed",
                metaColor: const Meta.hotPink(),
                callback: () {},
              ),
            ],
          ),
        ],
      );
}
