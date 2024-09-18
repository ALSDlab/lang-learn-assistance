import 'package:lang_learn/data/core/result.dart';
import 'package:lang_learn/data/mappers/word_searches_mapper.dart';
import 'package:lang_learn/domain/model/word_searches_model.dart';
import 'package:lang_learn/domain/repository/word_search_repository.dart';

import '../data_source/get_gemini_answer.dart';

class WordSearchesRepositoryImpl implements WordSearchRepository {

  @override
  Future<Result<WordSearchesModel>> getGeminiWordSearchesAnswer(String question) async {
    final result = await GetGeminiAnswer().wordSearchesAnswer(question);

    return result.when(
      success: (data) {
        try {
          WordSearchesModel wordSearchessModel = WordSearchesMapper.fromDTO(data);
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
  Future<Result<WordSearchesModel>> getFirebaseWordSearch(String docId) {
    // TODO: implement getFirebaseWordSearch
    throw UnimplementedError();
  }



  @override
  Future<Result<void>> postFirebaseWordSearch(String docId, Map<String, String> item) {
    // TODO: implement postFirebaseWordSearch
    throw UnimplementedError();
  }

  @override
  Future<Result<void>> updateFirebaseWordSearch(String docId, List<Map<String, String>> updatedSentences) {
    // TODO: implement updateFirebaseWordSearch
    throw UnimplementedError();
  }

}