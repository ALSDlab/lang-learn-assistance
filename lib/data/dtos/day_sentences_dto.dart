class DaySentencesDto {
  final String? date;
  final String? sentence;
  final bool? like;
  final bool? deleted;
  final String? explanation;

//<editor-fold desc="Data Methods">
  const DaySentencesDto({
    this.date,
    this.sentence,
    this.like,
    this.deleted,
    this.explanation,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is DaySentencesDto &&
          runtimeType == other.runtimeType &&
          date == other.date &&
          sentence == other.sentence &&
          like == other.like &&
          deleted == other.deleted &&
          explanation == other.explanation);

  @override
  int get hashCode =>
      date.hashCode ^
      sentence.hashCode ^
      like.hashCode ^
      deleted.hashCode ^
      explanation.hashCode;

  @override
  String toString() {
    return 'DaySentencesDto{ date: $date, sentence: $sentence, like: $like, deleted: $deleted, explanation: $explanation,}';
  }

  DaySentencesDto copyWith({
    String? date,
    String? sentence,
    bool? like,
    bool? deleted,
    String? explanation,
  }) {
    return DaySentencesDto(
      date: date ?? this.date,
      sentence: sentence ?? this.sentence,
      like: like ?? this.like,
      deleted: deleted ?? this.deleted,
      explanation: explanation ?? this.explanation,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'date': date,
      'sentence': sentence,
      'like': like,
      'deleted': deleted,
      'explanation': explanation,
    };
  }

  factory DaySentencesDto.fromJson(Map<String, dynamic> map) {
    return DaySentencesDto(
      date: map['date'] as String,
      sentence: map['sentence'] as String,
      like: map['like'] ?? false,
      deleted: map['deleted'] ?? false,
      explanation: map['explanation'] as String,
    );
  }

//</editor-fold>
}
