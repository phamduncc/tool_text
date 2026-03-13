class TextReplacer {
  static String replace(String text, String find, String replaceWith, {bool caseSensitive = true}) {
    if (find.isEmpty) return text;
    if (caseSensitive) {
      return text.replaceAll(find, replaceWith);
    } else {
      return text.replaceAll(RegExp(RegExp.escape(find), caseSensitive: false), replaceWith);
    }
  }
}
