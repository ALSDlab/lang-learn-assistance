import 'package:lang_learn/domain/model/word_searches_model.dart';

import '../../data/core/result.dart';

abstract interface class WordSearchRepository {
  Future<Result<WordSearchesModel>> getGeminiWordSearchesAnswer(
      String question);

  Future<Result<List<WordSearchesModel>>> getFirebaseWordSearch(String docId);

  Future<Result<void>> postFirebaseWordSearch(
      String docId, WordSearchesModel item);

  Future<Result<void>> deleteFirebaseWordSearch(
      String docId, WordSearchesModel item);
}
