class TextDuplicates {
  static String removeDuplicateLines(String text) {
    final lines = text.split('\n');
    final seen = <String>{};
    final result = <String>[];
    for (final line in lines) {
      if (seen.add(line)) {
        result.add(line);
      }
    }
    return result.join('\n');
  }
}
