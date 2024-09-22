import 'package:lang_learn/data/dtos/quiz_dto.dart';
import 'package:lang_learn/domain/model/quiz_model.dart';

class QuizMapper {
  static QuizModel fromDTO(QuizDto dto) {
    return QuizModel(
        question: dto.question ?? '',
        options: dto.options ?? [],
        deleted: dto.deleted ?? false,
        correctAnswer: dto.correctAnswer ?? -1,
        explanation: dto.explanation ?? '');
  }

  static QuizDto toDTO(QuizModel model) {
    return QuizDto(
      options: model.options,
      correctAnswer: model.correctAnswer,
      deleted: model.deleted,
      explanation: model.explanation,
    );
  }
}
