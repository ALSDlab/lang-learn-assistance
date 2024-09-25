class WordSearchesDto {
  final int? id;
  final String? word;
  final String? explanation;
  final Map<String, String>? exSentence;
  final bool? deleted;

//<editor-fold desc="Data Methods">
  const WordSearchesDto({
    this.id,
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
          id == other.id &&
          word == other.word &&
          explanation == other.explanation &&
          exSentence == other.exSentence &&
          deleted == other.deleted);

  @override
  int get hashCode =>
      id.hashCode ^
      word.hashCode ^
      explanation.hashCode ^
      exSentence.hashCode ^
      deleted.hashCode;

  @override
  String toString() {
    return 'WordSearchesDto{ id: $id, word: $word, explanation: $explanation, exSentence: $exSentence, deleted: $deleted,}';
  }

  WordSearchesDto copyWith({
    int? id,
    String? word,
    String? explanation,
    Map<String, String>? exSentence,
    bool? deleted,
  }) {
    return WordSearchesDto(
      id: id ?? this.id,
      word: word ?? this.word,
      explanation: explanation ?? this.explanation,
      exSentence: exSentence ?? this.exSentence,
      deleted: deleted ?? this.deleted,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'word': word,
      'explanation': explanation,
      'exSentence': exSentence,
      'deleted': deleted,
    };
  }

  factory WordSearchesDto.fromJson(Map<String, dynamic> map) {
    return WordSearchesDto(
      id: map['id'] ?? 0,
      word: map['word'] as String,
      explanation: map['explanation'] as String,
      exSentence: (map['exSentence'] as Map<String, dynamic>)
          .map((key, value) => MapEntry(key, value as String)),
      deleted: map['deleted'] ?? false,
    );
  }

//</editor-fold>
}
