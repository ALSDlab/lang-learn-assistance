import 'package:lang_learn/data/core/result.dart';
import 'package:lang_learn/data/dtos/quiz_dto.dart';
import 'package:lang_learn/data/mappers/quiz_mapper.dart';
import 'package:lang_learn/domain/model/quiz_model.dart';
import 'package:lang_learn/domain/repository/quiz_repository.dart';

import '../data_source/get_gemini_answer.dart';

class QuizRepositoryImpl implements QuizRepository {

  @override
  Future<Result<List<QuizModel>>> getGeminiQuizAnswer(String question) async {
    final result = await GetGeminiAnswer().quizAnswer(question);

    return result.when(
      success: (data) {
        try {
          List<QuizModel> quizList = data.map((e) => QuizMapper.fromDTO(e)).toList();
          return Result.success(quizList);
        } catch (e) {
          return Result.error('WordSearchesRepositoryImpl $e');
        }
      },
      error: (message) {
        return Result.error(message);
      },
    );
  }






  @override
  Future<Result<QuizModel>> getFirebaseQuiz(String docId) {
    // TODO: implement getFirebaseQuiz
    throw UnimplementedError();
  }

  @override
  Future<Result<void>> postFirebaseQuiz(String docId, Map<String, String> item) {
    // TODO: implement postFirebaseQuiz
    throw UnimplementedError();
  }

  @override
  Future<Result<void>> updateFirebaseQuiz(String docId, List<Map<String, String>> updatedQuiz) {
    // TODO: implement updateFirebaseQuiz
    throw UnimplementedError();
  }

}