part of lh.desktop.ds;

class LHHorizontalShelf extends LHContainer {
  final List<Widget> children;
  final double itemSpacing;

  LHHorizontalShelf({
    required super.header,
    required super.width,
    required super.height,
    this.itemSpacing = 8,
    required this.children,
    super.key,
  }) : super(
          child: Row(
            children: [
              SizedBox(height: itemSpacing),
              ...children.separatedBy(SizedBox(height: itemSpacing)),
            ],
          ),
        );
}
