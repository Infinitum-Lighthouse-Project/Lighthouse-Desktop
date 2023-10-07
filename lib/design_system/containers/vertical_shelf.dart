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
          child: Padding(
            padding: const EdgeInsets.only(left: 8, right: 8),
            child: ListView.separated(
              scrollDirection: Axis.vertical,
              itemCount: children.length,
              separatorBuilder: (_, __) => SizedBox(height: itemSpacing),
              itemBuilder: (_, int i) =>
                  // The SizedBox adds an extra element at each end of the list,
                  // so a separator of height 8 is added, creating padding
                  i == 0 || i == children.length - 1
                      ? const SizedBox()
                      : children[i],
            ),
          ),
        );
}
