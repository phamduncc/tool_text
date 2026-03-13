enum ConvertMode {
  uppercase,
  lowercase,
  capitalizeEachWord,
  sentenceCase,
}

class TextConverter {
  static String convert(String text, ConvertMode mode) {
    switch (mode) {
      case ConvertMode.uppercase:
        return text.toUpperCase();
      case ConvertMode.lowercase:
        return text.toLowerCase();
      case ConvertMode.capitalizeEachWord:
        return _capitalizeEachWord(text);
      case ConvertMode.sentenceCase:
        return _sentenceCase(text);
    }
  }

  static String _capitalizeEachWord(String text) {
    return text.split(' ').map((word) {
      if (word.isEmpty) return word;
      return word[0].toUpperCase() + word.substring(1).toLowerCase();
    }).join(' ');
  }

  static String _sentenceCase(String text) {
    if (text.isEmpty) return text;
    final sentences = text.split(RegExp(r'(?<=[.!?])\s+'));
    return sentences.map((sentence) {
      if (sentence.isEmpty) return sentence;
      return sentence[0].toUpperCase() + sentence.substring(1).toLowerCase();
    }).join(' ');
  }
}
