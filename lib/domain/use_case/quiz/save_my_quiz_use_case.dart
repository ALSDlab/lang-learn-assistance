import 'package:lang_learn/domain/model/quiz_model.dart';

import '../../../data/core/result.dart';
import '../../repository/quiz_repository.dart';

class SaveMyQuizUseCase {
  SaveMyQuizUseCase({
    required QuizRepository quizRepository,
  }) : _quizRepository = quizRepository;

  final QuizRepository _quizRepository;

  Future<Result<void>> execute(String myDocId, QuizModel item) async {
    final result = await _quizRepository.postFirebaseQuiz(myDocId, item);

    return result.when(
      success: (data) => const Result.success(null),
      error: (message) => throw Exception(message),
    );
  }
}
