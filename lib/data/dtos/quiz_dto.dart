class QuizDto {
  final int? id;
  final String? question;
  final List<String>? options;
  final int? correctAnswer;
  final bool? deleted;
  final String? explanation;

//<editor-fold desc="Data Methods">
  const QuizDto({
    this.id,
    this.question,
    this.options,
    this.correctAnswer,
    this.deleted,
    this.explanation,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is QuizDto &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          question == other.question &&
          options == other.options &&
          correctAnswer == other.correctAnswer &&
          deleted == other.deleted &&
          explanation == other.explanation);

  @override
  int get hashCode =>
      id.hashCode ^
      question.hashCode ^
      options.hashCode ^
      correctAnswer.hashCode ^
      deleted.hashCode ^
      explanation.hashCode;

  @override
  String toString() {
    return 'QuizDto{ id: $id, question: $question, options: $options, correctAnswer: $correctAnswer, deleted: $deleted, explanation: $explanation,}';
  }

  QuizDto copyWith({
    int? id,
    String? question,
    List<String>? options,
    int? correctAnswer,
    bool? deleted,
    String? explanation,
  }) {
    return QuizDto(
      id: id ?? this.id,
      question: question ?? this.question,
      options: options ?? this.options,
      correctAnswer: correctAnswer ?? this.correctAnswer,
      deleted: deleted ?? this.deleted,
      explanation: explanation ?? this.explanation,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'question': question,
      'options': options,
      'correctAnswer': correctAnswer,
      'deleted': deleted,
      'explanation': explanation,
    };
  }

  factory QuizDto.fromJson(Map<String, dynamic> map) {
    return QuizDto(
      id: map['id'] ?? 0,
      question: map['question'] as String,
      options:
      (map['options'] as List<dynamic>?)?.map((e) => e as String).toList(),
      correctAnswer: map['correctAnswer'] as int,
      deleted: map['deleted'] ?? false,
      explanation: map['explanation'] as String,
    );
  }

//</editor-fold>
}
