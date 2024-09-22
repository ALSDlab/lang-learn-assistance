import 'package:lang_learn/domain/repository/quiz_repository.dart';

import '../../../data/core/result.dart';
import '../../model/quiz_model.dart';

class DeleteMyQuizUseCase {
  DeleteMyQuizUseCase({
    required QuizRepository quizRepository,
  }) : _quizRepository = quizRepository;

  final QuizRepository _quizRepository;

  Future<Result<void>> execute(String myDocId, QuizModel item) async {
    final result = await _quizRepository.deleteFirebaseQuiz(myDocId, item);

    return result.when(
      success: (data) => const Result.success(null),
      error: (message) => throw Exception(message),
    );
  }
}
