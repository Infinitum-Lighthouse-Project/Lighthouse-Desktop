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
            child: data.isNotEmpty
                ? ListView.separated(
                    padding: const EdgeInsets.only(top: 8),
                    scrollDirection: Axis.vertical,
                    itemCount: data.length,
                    separatorBuilder: (_, __) => SizedBox(height: itemSpacing),
                    itemBuilder: (_, int i) => generator(data[i]),
                  )
                : const Text(
                    'No data',
                    style: TextStyle(color: Colors.white),
                  ),
          ),
        );

  @override
  List<T> contributions() => data;
}
