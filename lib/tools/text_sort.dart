enum SortOrder { ascending, descending }

class TextSort {
  static String sortLines(String text, {SortOrder order = SortOrder.ascending}) {
    final lines = text.split('\n').where((line) => line.isNotEmpty).toList();
    lines.sort((a, b) {
      if (order == SortOrder.ascending) {
        return a.toLowerCase().compareTo(b.toLowerCase());
      } else {
        return b.toLowerCase().compareTo(a.toLowerCase());
      }
    });
    return lines.join('\n');
  }
}
