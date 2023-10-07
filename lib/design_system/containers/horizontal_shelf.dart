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
          child: Padding(
            padding: const EdgeInsets.only(top: 8, bottom: 8),
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: children.length,
              separatorBuilder: (_, __) => SizedBox(width: itemSpacing),
              itemBuilder: (_, int i) =>
                  // The SizedBox adds an extra element at each end of the list,
                  // so a separator of width 8 is added, creating padding
                  i == 0 || i == children.length - 1
                      ? const SizedBox()
                      : children[i],
            ),
          ),
        );
}
