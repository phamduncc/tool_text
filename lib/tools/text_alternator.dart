class TextAlternator {
  static String alternateCase(String text) {
    final buffer = StringBuffer();
    int charIndex = 0;
    for (int i = 0; i < text.length; i++) {
      final char = text[i];
      if (char.contains(RegExp(r'[a-zA-Z]'))) {
        buffer.write(charIndex.isEven ? char.toLowerCase() : char.toUpperCase());
        charIndex++;
      } else {
        buffer.write(char);
      }
    }
    return buffer.toString();
  }
}
