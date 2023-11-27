part of lh.desktop.ds;

class LHContainer extends StatelessWidget {
  final String header;
  final Widget child;
  final double width;
  final double height;
  final List<LHIconButton> panelButtons;

  const LHContainer({
    required this.header,
    required this.child,
    required this.height,
    this.panelButtons = const [],
    this.width = 344, // cardWidth + 8
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          borderRadius: LHBorderRadius.r5(),
          color: const Lavender.s1000(),
          border: Border.all(
            color: const Lavender.s900(),
            width: 2,
          ),
        ),
        child: Stack(
          children: [
            // Actual children
            Positioned(
              top: 40,
              left: 0,
              height: height - 44,
              child: SizedBox(
                height: height - 44,
                width: width,
                child: child,
              ),
            ),
            // Panel
            Positioned(
              top: 0,
              left: 0,
              width: width,
              height: 40,
              child: Container(
                width: width,
                height: 40,
                clipBehavior: Clip.none,
                decoration: BoxDecoration(
                  color: const Lavender.s900(),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.4),
                      offset: const Offset(0, 5),
                      blurRadius: 10,
                      spreadRadius: 5,
                    )
                  ],
                ),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8),
                      child: Text(
                        header,
                        style: LHType.panelHeader_1,
                      ),
                    ),
                    const Spacer(),
                    ...[
                      for (final pb in panelButtons) ...[
                        const SizedBox(width: 4),
                        pb
                      ]
                    ],
                    const SizedBox(width: 8),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
