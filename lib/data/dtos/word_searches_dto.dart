class WordSearchesDto {
  final String? word;
  final String? explanation;

//<editor-fold desc="Data Methods">
  const WordSearchesDto({
    this.word,
    this.explanation,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is WordSearchesDto &&
          runtimeType == other.runtimeType &&
          word == other.word &&
          explanation == other.explanation);

  @override
  int get hashCode => word.hashCode ^ explanation.hashCode;

  @override
  String toString() {
    return 'WordSearchesDto{ word: $word, explanation: $explanation,}';
  }

  WordSearchesDto copyWith({
    String? word,
    String? explanation,
  }) {
    return WordSearchesDto(
      word: word ?? this.word,
      explanation: explanation ?? this.explanation,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'word': word,
      'explanation': explanation,
    };
  }

  factory WordSearchesDto.fromJson(Map<String, dynamic> map) {
    return WordSearchesDto(
      word: map['word'] as String,
      explanation: map['explanation'] as String,
    );
  }

//</editor-fold>
}
