import 'package:lang_learn/data/core/result.dart';
import 'package:lang_learn/data/mappers/word_searches_mapper.dart';
import 'package:lang_learn/domain/model/word_searches_model.dart';
import 'package:lang_learn/domain/repository/word_search_repository.dart';

import '../data_source/get_gemini_answer.dart';
import '../data_source/my_favorites_firebase.dart';

class WordSearchesRepositoryImpl implements WordSearchRepository {
  @override
  Future<Result<WordSearchesModel>> getGeminiWordSearchesAnswer(
      String question) async {
    final result = await GetGeminiAnswer().wordSearchesAnswer(question);

    return result.when(
      success: (data) {
        try {
          WordSearchesModel wordSearchessModel =
              WordSearchesMapper.fromDTO(data);
          return Result.success(wordSearchessModel);
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
  Future<Result<List<WordSearchesModel>>> getFirebaseWordSearch(
      String docId) async {
    final result = await MyFavoritesFirebase().getWordSearchesData(docId);

    return result.when(
      success: (data) {
        try {
          List<WordSearchesModel> wordSearchesModelList =
              data.map((e) => WordSearchesMapper.fromDTO(e)).toList();
          return Result.success(wordSearchesModelList);
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
  Future<Result<void>> postFirebaseWordSearch(
      String docId, WordSearchesModel item) async {
    final result = await MyFavoritesFirebase()
        .postWordSearchesData(docId, WordSearchesMapper.toDTO(item));

    return result.when(
      success: (data) {
        try {
          return Result.success(data);
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
  Future<Result<void>> deleteFirebaseWordSearch(
      String docId, WordSearchesModel item) async {
    final result = await MyFavoritesFirebase()
        .deleteWordSearchesData(docId, WordSearchesMapper.toDTO(item));

    return result.when(
      success: (data) {
        try {
          return Result.success(data);
        } catch (e) {
          return Result.error('WordSearchesRepositoryImpl $e');
        }
      },
      error: (message) {
        return Result.error(message);
      },
    );
  }
}
