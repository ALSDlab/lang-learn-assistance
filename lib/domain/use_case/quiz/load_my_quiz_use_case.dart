import 'package:lang_learn/domain/model/quiz_model.dart';
import 'package:lang_learn/domain/repository/quiz_repository.dart';

import '../../../data/core/result.dart';

class LoadMyQuizUseCase {
  LoadMyQuizUseCase({
    required QuizRepository quizRepository,
  }) : _quizRepository = quizRepository;

  final QuizRepository _quizRepository;

  Future<Result<List<QuizModel>>> execute(String myDocId) async {
    final result = await _quizRepository.getFirebaseQuiz(myDocId);

    return result.when(
      success: (data) => Result.success(data),
      error: (message) => Result.error(message),
    );
  }
}
