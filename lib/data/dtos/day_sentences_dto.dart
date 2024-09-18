class DaySentencesDto {
  final String? date;
  final String? sentence;
  final bool? like;
  final String? explanation;

//<editor-fold desc="Data Methods">
  const DaySentencesDto({
    this.date,
    this.sentence,
    this.like,
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
          explanation == other.explanation);

  @override
  int get hashCode =>
      date.hashCode ^ sentence.hashCode ^ like.hashCode ^ explanation.hashCode;

  @override
  String toString() {
    return 'DaySentenceDto{ date: $date, sentence: $sentence, like: $like, explanation: $explanation,}';
  }

  DaySentencesDto copyWith({
    String? date,
    String? sentence,
    bool? like,
    String? explanation,
  }) {
    return DaySentencesDto(
      date: date ?? this.date,
      sentence: sentence ?? this.sentence,
      like: like ?? this.like,
      explanation: explanation ?? this.explanation,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'date': date,
      'sentence': sentence,
      'like': like,
      'explanation': explanation,
    };
  }

  factory DaySentencesDto.fromJson(Map<String, dynamic> map) {
    return DaySentencesDto(
      date: map['date'] as String,
      sentence: map['sentence'] as String,
      like: map['like'] ?? false,
      explanation: map['explanation'] as String,
    );
  }

//</editor-fold>
}
