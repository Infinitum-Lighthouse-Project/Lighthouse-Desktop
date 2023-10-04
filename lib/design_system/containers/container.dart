part of lh.desktop.ds;

class LHContainer extends StatelessWidget {
  final String header;
  final Widget child;
  final double width;
  final double height;

  const LHContainer({
    required this.header,
    required this.child,
    required this.height,
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
        child: Column(
          children: [
            Container(
              width: width,
              height: 40,
              clipBehavior: Clip.none,
              decoration: const BoxDecoration(
                color: Lavender.s900(),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black,
                    offset: Offset(0, 20),
                    blurRadius: 20,
                    spreadRadius: 2,
                  )
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: Text(
                  header,
                  style: LHType.panelHeader_1,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8, right: 8),
              child: Container(
                height: height - 44,
                child: SingleChildScrollView(
                  child: child,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
