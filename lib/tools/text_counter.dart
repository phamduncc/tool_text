class TextCounterResult {
  final int characters;
  final int charactersNoSpaces;
  final int words;
  final int lines;
  final int paragraphs;
  final String readingTime;

  TextCounterResult({
    required this.characters,
    required this.charactersNoSpaces,
    required this.words,
    required this.lines,
    required this.paragraphs,
    required this.readingTime,
  });
}

class TextCounter {
  static TextCounterResult count(String text) {
    if (text.isEmpty) {
      return TextCounterResult(
        characters: 0,
        charactersNoSpaces: 0,
        words: 0,
        lines: 0,
        paragraphs: 0,
        readingTime: '0 seconds',
      );
    }

    final characters = text.length;
    final charactersNoSpaces = text.replaceAll(RegExp(r'\s'), '').length;
    final words = text.trim().isEmpty
        ? 0
        : text.trim().split(RegExp(r'\s+')).length;
    final lines = text.split('\n').length;
    final paragraphs = text
        .split(RegExp(r'\n\s*\n'))
        .where((p) => p.trim().isNotEmpty)
        .length;

    // Average reading speed: 200 words per minute
    final seconds = (words / 200 * 60).round();
    String readingTime;
    if (seconds < 60) {
      readingTime = '~$seconds seconds';
    } else {
      final minutes = seconds ~/ 60;
      final remainingSeconds = seconds % 60;
      readingTime = '~$minutes min $remainingSeconds sec';
    }

    return TextCounterResult(
      characters: characters,
      charactersNoSpaces: charactersNoSpaces,
      words: words,
      lines: lines,
      paragraphs: paragraphs,
      readingTime: readingTime,
    );
  }
}
