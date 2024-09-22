class WordSearchesDto {
  final String? word;
  final String? explanation;
  final Map<String, String>? exSentence;
  final bool? deleted;

//<editor-fold desc="Data Methods">

  const WordSearchesDto({
    this.word,
    this.explanation,
    this.exSentence,
    this.deleted,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is WordSearchesDto &&
          runtimeType == other.runtimeType &&
          word == other.word &&
          explanation == other.explanation &&
          exSentence == other.exSentence &&
          deleted == other.deleted);

  @override
  int get hashCode =>
      word.hashCode ^
      explanation.hashCode ^
      exSentence.hashCode ^
      deleted.hashCode;

  @override
  String toString() {
    return 'WordSearchesDto{ word: $word, explanation: $explanation, exSentence: $exSentence, deleted: $deleted,}';
  }

  WordSearchesDto copyWith({
    String? word,
    String? explanation,
    Map<String, String>? exSentence,
    bool? deleted,
  }) {
    return WordSearchesDto(
      word: word ?? this.word,
      explanation: explanation ?? this.explanation,
      exSentence: exSentence ?? this.exSentence,
      deleted: deleted ?? this.deleted,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'word': word,
      'explanation': explanation,
      'exSentence': exSentence,
      'deleted': deleted,
    };
  }

  factory WordSearchesDto.fromJson(Map<String, dynamic> map) {
    return WordSearchesDto(
      word: map['word'] as String,
      explanation: map['explanation'] as String,
      exSentence: (map['exSentence'] as Map<String, dynamic>)
          .map((key, value) => MapEntry(key, value as String)),
      deleted: map['deleted'] ?? false,
    );
  }

//</editor-fold>
}
