part of lh.desktop.ds;

class LHCard extends StatelessWidget {
  final String header;
  final Widget child;
  static const _width = LHDesignSystem.scaleFactor * 336;
  static const _height = LHDesignSystem.scaleFactor * 120;

  const LHCard({
    required this.header,
    required this.child,
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
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
              Expanded(child: child),
            ],
          ),
        ),
      ),
    );
  }
}
