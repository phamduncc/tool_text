class TextSpaces {
  static String removeExtraSpaces(String text) {
    return text
        .split('\n')
        .map((line) => line.replaceAll(RegExp(r' +'), ' ').trim())
        .join('\n');
  }
}
