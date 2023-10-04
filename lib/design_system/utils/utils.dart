part of lh.desktop.ds;

extension ListUtils<T> on List<T> {
  /// Inserts [item] in between adjacent elements and returns
  /// the result as a new list
  List<T> separatedBy(T item) {
    final List<T> result = [];
    forEach((T elem) {
      result
        ..add(elem)
        ..add(item);
    });
    result.removeLast();
    return result;
  }
}
