import 'package:lang_learn/domain/model/quiz_model.dart';
import 'package:lang_learn/domain/repository/quiz_repository.dart';

class GetQuizUseCase {
  GetQuizUseCase({
    required QuizRepository quizRepository,
  }) : _quizRepository = quizRepository;

  final QuizRepository _quizRepository;

  Future<List<QuizModel>> execute(String question) async {
    final result = await _quizRepository.getGeminiQuizAnswer(question);

    return result.when(
        success: (data) => data, error: (message) => throw Exception(message));
  }
}
