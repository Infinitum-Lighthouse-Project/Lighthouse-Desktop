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

extension DTFormatting on DateTime {
  String formatAsRelative() {
    final DateTime now = DateTime.now();
    final Duration diff = now.difference(this);
    final bool isFuture = diff.isNegative;

    if ((diff.inDays / 7).floor() >= 1) {
      return isFuture ? 'in 1 week' : '1 week ago';
    } else if (diff.inDays >= 2) {
      return isFuture ? 'in ${diff.inDays} days' : '${diff.inDays} days ago';
    } else if (diff.inDays >= 1) {
      return isFuture ? 'tomrrow' : '1 day ago';
    } else if (diff.inHours >= 2) {
      return isFuture
          ? 'in ${diff.inHours} hours'
          : '${diff.inHours} hours ago';
    } else if (diff.inHours >= 1) {
      return isFuture ? 'in 1 hour' : '1 hour ago';
    } else if (diff.inMinutes >= 2) {
      return isFuture
          ? 'in ${diff.inMinutes} min'
          : '${diff.inMinutes} min ago';
    } else if (diff.inMinutes >= 1) {
      return isFuture ? 'in a minute' : '1 minute ago';
    } else if (diff.inSeconds >= 3) {
      return isFuture
          ? 'in ${diff.inSeconds} seconds'
          : '${diff.inSeconds} seconds ago';
    } else {
      return isFuture ? 'now' : 'just now';
    }
  }
}
