import 'package:lang_learn/domain/model/quiz_model.dart';

import '../../data/core/result.dart';

abstract interface class QuizRepository {
  Future<Result<List<QuizModel>>> getGeminiQuizAnswer(String question);

  Future<Result<List<QuizModel>>> getFirebaseQuiz(String myDocId);

  Future<Result<void>> postFirebaseQuiz(String myDocId, QuizModel item);

  Future<Result<void>> deleteFirebaseQuiz(String myDocId, QuizModel item);
}
