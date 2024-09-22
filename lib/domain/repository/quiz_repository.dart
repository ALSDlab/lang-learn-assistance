import 'package:lang_learn/domain/model/quiz_model.dart';

import '../../data/core/result.dart';

abstract interface class QuizRepository {
  Future<Result<List<QuizModel>>> getGeminiQuizAnswer(String question);

  Future<Result<List<QuizModel>>> getFirebaseQuiz(String docId);

  Future<Result<void>> postFirebaseQuiz(String docId, QuizModel item);

  Future<Result<void>> deleteFirebaseQuiz(
      String docId, QuizModel item);
}
