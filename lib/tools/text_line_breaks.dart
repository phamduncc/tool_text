class TextLineBreaks {
  static String removeLineBreaks(String text, {String separator = ' '}) {
    return text.split('\n').map((line) => line.trim()).where((line) => line.isNotEmpty).join(separator);
  }
}
