part of lh.desktop.ds;

class LHCard extends StatelessWidget {
  final String header;
  final Widget child;

  const LHCard({
    required this.header,
    required this.child,
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: LHDesignSystem.scaleFactor * 336,
        height: LHDesignSystem.scaleFactor * 108,
        decoration: BoxDecoration(
          borderRadius: LHBorderRadius.r5(),
          color: const Mauve.s900(),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                header,
                style: LHType.cardHeader_1,
              ),
              Container(
                child: child,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
