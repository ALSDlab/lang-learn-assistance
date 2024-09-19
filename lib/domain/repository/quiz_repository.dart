import 'package:lang_learn/data/dtos/quiz_dto.dart';
import 'package:lang_learn/domain/model/quiz_model.dart';

import '../../data/core/result.dart';

abstract interface class QuizRepository {
  Future<Result<List<QuizModel>>> getGeminiQuizAnswer(String question);

  Future<Result<void>> postFirebaseQuiz(String docId, Map<String, String> item);

  Future<Result<QuizModel>> getFirebaseQuiz(String docId);

  Future<Result<void>> updateFirebaseQuiz(
      String docId, List<Map<String, String>> updatedQuiz);
}
