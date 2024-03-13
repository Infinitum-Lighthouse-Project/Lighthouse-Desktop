part of lh.desktop.ds;

abstract class LHCard extends StatelessWidget {
  final String header;
  static const _width = LHDesignSystem.scaleFactor * 336;
  static const _height = LHDesignSystem.scaleFactor * 120;

  const LHCard({
    required this.header,
    super.key,
  });

  Widget builder(BuildContext context);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: _width,
      height: _height,
      decoration: BoxDecoration(
        borderRadius: LHBorderRadius.r5(),
        color: const Mauve.s900(),
      ),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              header,
              style: LHType.cardHeader_1,
            ),
            Expanded(child: builder(context)),
          ],
        ),
      ),
    );
  }
}

abstract class LHDataCard<T extends SchemaObject> extends LHCard {
  final DocumentSnapshot<T> doc;
  final T object;

  LHDataCard({
    required this.doc,
    required super.header,
    super.key,
  }) : object = doc.data()!;
}
