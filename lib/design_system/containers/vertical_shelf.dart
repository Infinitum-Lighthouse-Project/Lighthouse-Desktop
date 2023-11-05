part of lh.desktop.ds;

class LHVerticalShelf<T> extends LHContainer with HotboxIndexable<T> {
  final List<T> data;
  final Widget Function(T) generator;
  final double itemSpacing;

  LHVerticalShelf({
    required super.header,
    required super.width,
    required super.height,
    required this.data,
    this.itemSpacing = 8,
    required this.generator,
    super.panelButtons,
    super.key,
  }) : super(
          child: Padding(
            padding: const EdgeInsets.only(left: 8, right: 8),
            child: ListView.separated(
              scrollDirection: Axis.vertical,
              itemCount: data.length,
              separatorBuilder: (_, __) => SizedBox(height: itemSpacing),
              itemBuilder: (_, int i) =>
                  // The SizedBox adds an extra element at each end of the list,
                  // so a separator of height 8 is added, creating padding
                  i == 0 || i == data.length - 1
                      ? const SizedBox()
                      : generator(data[i]),
            ),
          ),
        );

  @override
  List<T> contributions() => data;
}
