import 'package:lang_learn/data/core/result.dart';
import 'package:lang_learn/data/mappers/quiz_mapper.dart';
import 'package:lang_learn/domain/model/quiz_model.dart';
import 'package:lang_learn/domain/repository/quiz_repository.dart';

import '../data_source/get_gemini_answer.dart';
import '../data_source/my_favorites_firebase.dart';

class QuizRepositoryImpl implements QuizRepository {
  @override
  Future<Result<List<QuizModel>>> getGeminiQuizAnswer(String question) async {
    final result = await GetGeminiAnswer().quizAnswer(question);

    return result.when(
      success: (data) {
        try {
          List<QuizModel> quizList =
              data.map((e) => QuizMapper.fromDTO(e)).toList();
          return Result.success(quizList);
        } catch (e) {
          return Result.error('QuizRepositoryImpl $e');
        }
      },
      error: (message) {
        return Result.error(message);
      },
    );
  }

  @override
  Future<Result<List<QuizModel>>> getFirebaseQuiz(String docId) async {
    final result = await MyFavoritesFirebase().getQuizData(docId);

    return result.when(
      success: (data) {
        try {
          List<QuizModel> quizModelModelList =
              data.map((e) => QuizMapper.fromDTO(e)).toList();
          return Result.success(quizModelModelList);
        } catch (e) {
          return Result.error('QuizRepositoryImpl $e');
        }
      },
      error: (message) {
        return Result.error(message);
      },
    );
  }

  @override
  Future<Result<void>> postFirebaseQuiz(String docId, QuizModel item) async {
    final result =
        await MyFavoritesFirebase().postQuizData(docId, QuizMapper.toDTO(item));

    return result.when(
      success: (data) {
        try {
          return Result.success(data);
        } catch (e) {
          return Result.error('QuizRepositoryImpl $e');
        }
      },
      error: (message) {
        return Result.error(message);
      },
    );
  }

  @override
  Future<Result<void>> deleteFirebaseQuiz(String docId, QuizModel item) async {
    final result = await MyFavoritesFirebase()
        .deleteQuizData(docId, QuizMapper.toDTO(item));

    return result.when(
      success: (data) {
        try {
          return Result.success(data);
        } catch (e) {
          return Result.error('QuizRepositoryImpl $e');
        }
      },
      error: (message) {
        return Result.error(message);
      },
    );
  }
}
