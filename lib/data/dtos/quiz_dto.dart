class QuizDto {
  final String? question;
  final List<String>? options;
  final int? correctAnswer;
  final String? explanation;

//<editor-fold desc="Data Methods">
  const QuizDto({
    this.question,
    this.options,
    this.correctAnswer,
    this.explanation,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is QuizDto &&
          runtimeType == other.runtimeType &&
          question == other.question &&
          options == other.options &&
          correctAnswer == other.correctAnswer &&
          explanation == other.explanation);

  @override
  int get hashCode =>
      question.hashCode ^
      options.hashCode ^
      correctAnswer.hashCode ^
      explanation.hashCode;

  @override
  String toString() {
    return 'QuizDto{ question: $question, options: $options, correctAnswer: $correctAnswer, explanation: $explanation,}';
  }

  QuizDto copyWith({
    String? question,
    List<String>? options,
    int? correctAnswer,
    String? explanation,
  }) {
    return QuizDto(
      question: question ?? this.question,
      options: options ?? this.options,
      correctAnswer: correctAnswer ?? this.correctAnswer,
      explanation: explanation ?? this.explanation,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'question': question,
      'options': options,
      'correctAnswer': correctAnswer,
      'explanation': explanation,
    };
  }

  factory QuizDto.fromJson(Map<String, dynamic> map) {
    return QuizDto(
      question: map['question'] as String,
      options: map['options'] as List<String>,
      correctAnswer: map['correctAnswer'] as int,
      explanation: map['explanation'] as String,
    );
  }

//</editor-fold>
}
