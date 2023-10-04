part of lh.desktop.ds;

class LHVerticalShelf extends LHContainer {
  final List<Widget> children;
  final double itemSpacing;

  LHVerticalShelf({
    required super.header,
    required super.width,
    required super.height,
    this.itemSpacing = 8,
    required this.children,
    super.key,
  }) : super(
          child: Column(
            children: [
              SizedBox(height: itemSpacing),
              ...children.separatedBy(SizedBox(height: itemSpacing)),
            ],
          ),
        );
}
